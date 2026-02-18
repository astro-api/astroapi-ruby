# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Ruby gem (`astroapi`) — a client SDK for the Astrology API (`https://api.astrology-api.io`). Version 1.0.0, requires Ruby >= 2.6.0. Uses Faraday for HTTP. API docs: `https://api.astrology-api.io/rapidoc`.

## Common Commands

```bash
bundle install                                    # Install dependencies (vendored to vendor/bundle)
bundle exec rake                                  # Default: runs RuboCop then RSpec
bundle exec rspec                                 # Run all tests (unit + integration in mock mode)
bundle exec rspec spec/unit/                      # Run unit tests only
bundle exec rspec spec/integration/               # Run integration tests only (mock mode)
bundle exec rspec spec/integration/tarot_spec.rb  # Run a single integration test file
bundle exec rspec spec/unit/client_spec.rb:24     # Run a single example by line number
bundle exec rubocop                               # Lint
bundle exec rubocop -a                            # Lint with auto-correct
bundle exec rake build                            # Build the gem
bundle exec rake install                          # Build and install locally
```

### Live API testing

```bash
ASTROLOGY_API_KEY=<key> bundle exec rspec spec/integration/  # Run against real API
```

When `ASTROLOGY_API_KEY` env var is set, integration tests hit the real API instead of WebMock stubs. Tests for endpoints with known API-side bugs are wrapped with `expect_no_api_error` and will be skipped (pending) instead of failing.

## Architecture

### Entry point

`Astroapi.new` (in `lib/astroapi.rb`) delegates to `Astroapi::Client.new`.

### Client composition

`Client` (`lib/astroapi/client.rb`) accepts config (hash, block, or env vars) and creates an `HTTP::Client` plus **25 category accessor objects**. Each category inherits from `Categories::BaseCategory`, defines its own `api_prefix`, and exposes endpoint methods.

| Accessor | Category class | API prefix | Notes |
|----------|---------------|------------|-------|
| `client.data` | `Data` | `/api/v3/data` | Positions, aspects, house cusps, lunar metrics |
| `client.charts` | `Charts` | `/api/v3/charts` | Natal, synastry, composite, transit, return charts |
| `client.horoscope` | `Horoscope` | `/api/v3/horoscope` | Daily/weekly/monthly/yearly horoscopes |
| `client.analysis` | `Analysis` | `/api/v3/analysis` | Natal, transit, compatibility, career reports |
| `client.glossary` | `Glossary` | `/api/v3/glossary` | Reference data (planets, signs, houses, etc.) |
| `client.astrocartography` | `Astrocartography` | `/api/v3/astrocartography` | Location-based astrology, map rendering |
| `client.chinese` | `Chinese` | `/api/v3/chinese` | BaZi, luck pillars, compatibility |
| `client.eclipses` | `Eclipses` | `/api/v3/eclipses` | Upcoming eclipses, natal impact |
| `client.lunar` | `Lunar` | `/api/v3/lunar` | Moon phases, void of course, mansions |
| `client.numerology` | `Numerology` | `/api/v3/numerology` | Core numbers, compatibility |
| `client.tarot` | `Tarot` | `/api/v3/tarot` | Card draws, reports, analysis |
| `client.traditional` | `Traditional` | `/api/v3/traditional` | Dignities, lots, profections |
| `client.fixed_stars` | `FixedStars` | `/api/v3/fixed-stars` | Star positions, conjunctions |
| `client.insights` | `InsightsCategory` | `/api/v3/insights` | AI insights (has sub-categories) |
| `client.svg` | `Svg` | `/api/v3/svg` | SVG chart rendering |
| `client.enhanced` | `Enhanced` | `/api/v3/enhanced` | Enhanced analysis with charts |
| `client.vedic` | `Vedic` | `/api/v3/vedic` | Vedic astrology (dashas, doshas, panchang) |
| `client.human_design` | `HumanDesign` | `/api/v3/human-design` | Bodygraph, gates, channels |
| `client.kabbalah` | `Kabbalah` | `/api/v3/kabbalah` | Tree of life, gematria, angels |
| `client.horary` | `Horary` | `/api/v3/horary` | Horary chart and question analysis |
| `client.fengshui` | `Fengshui` | `/api/v3/fengshui` | Flying stars, afflictions |
| `client.palmistry` | `Palmistry` | `/api/v3/palmistry` | Palm reading from images |
| `client.pdf` | `Pdf` | `/api/v3/pdf` | PDF report generation |
| `client.render` | `Render` | `/api/v3/render` | Chart image rendering (PNG/SVG) |
| `client.ziwei` | `Ziwei` | `/api/v3/ziwei` | Zi Wei Dou Shu chart |

### Insights sub-categories

`InsightsCategory` is special — it instantiates 5 nested sub-clients:

- `client.insights.relationship` — compatibility, love languages, red flags, timing
- `client.insights.pet` — pet personality, compatibility, training windows
- `client.insights.wellness` — body mapping, biorhythms, energy patterns
- `client.insights.financial` — market timing, Gann analysis, Bradley siderograph
- `client.insights.business` — team dynamics, hiring, leadership, succession

### HTTP layer

`lib/astroapi/http/client.rb` — Faraday connection with middleware stack (order matters):

1. `:json` — request JSON encoding
2. `Authentication` — injects `Authorization: Bearer` header
3. `Logger` — debug logging when `config.debug = true`, redacts auth header
4. `:retry` — optional retry middleware via `RetryConfig`
5. `ResponseUnwrapper` — transparently unwraps `{ "data": ... }` or `{ "result": ... }` envelopes
6. `:raise_error` — raises `Faraday::Error` on 4xx/5xx
7. `:json` — response JSON parsing (only for `content_type: /\bjson$/`)

Non-JSON responses (SVG, PNG, PDF) pass through `ResponseUnwrapper` and `:json` without parsing, returning raw String data.

### Error hierarchy

`lib/astroapi/error.rb` — all Faraday errors are caught in `HTTP::Client` and re-raised via `Error.from_faraday_error`:

- `Astroapi::Error` (base)
  - `ClientError` — 4xx HTTP errors (422, 404, etc.)
  - `ServerError` — 5xx HTTP errors
  - `TimeoutError` — request timeout
  - `ConnectionError` — network failure
  - `ValidationError` — raised by validators before HTTP call
  - `ConfigurationError` — invalid config

### Validators

`lib/astroapi/validators/` — `BaseValidator.validate!` collects multiple errors and raises `ValidationError`. `SubjectValidator` validates `birth_data` fields (date ranges, location as city+country_code or latitude+longitude).

## API Request Format Reference

This section documents the exact request body formats the API expects. Getting these wrong is the #1 source of 422 errors.

### Standard subject request (most endpoints)

```ruby
{
  subject: {
    birth_data: {
      year: 1990, month: 5, day: 11,
      hour: 14, minute: 30,
      city: 'London', country_code: 'GB'
    }
  }
}
```

Location is required. Provide either `city` + `country_code` OR `latitude` + `longitude`.

### Two-subject request (compatibility, synastry)

```ruby
{
  subject1: { birth_data: { ... } },
  subject2: { birth_data: { ... } }
}
```

### Transit time (transit charts, transit reports)

The `transit_time` field requires a `datetime` wrapper AND location:

```ruby
{
  subject: { birth_data: { ... } },
  transit_time: {
    datetime: {
      year: 2024, month: 6, day: 15,
      hour: 12, minute: 0,
      city: 'London', country_code: 'GB'
    }
  }
}
```

### Date range (return transits, return transit reports)

The `date_range` fields must be datetime objects, NOT date strings:

```ruby
{
  date_range: {
    start_date: { year: 2024, month: 6, day: 1 },
    end_date: { year: 2024, month: 7, day: 1 }
  }
}
```

### Root-level birth_data (kabbalah, ziwei)

Some categories expect `birth_data` at root level, NOT wrapped in `subject`:

```ruby
# Kabbalah endpoints (birth-angels, tikkun, tree-of-life-chart)
{ birth_data: { year: 1990, month: 5, day: 11, hour: 14, minute: 30, city: 'London', country_code: 'GB' } }

# Ziwei chart
{ birth_data: { ... }, gender: 'male' }

# Tarot natal/transit reports
{ birth_data: { ... } }
```

### Sign codes (PDF horoscope endpoints)

PDF horoscope endpoints use 3-letter sign codes: `Ari`, `Tau`, `Gem`, `Can`, `Leo`, `Vir`, `Lib`, `Sco`, `Sag`, `Cap`, `Aqu`, `Pis`.

### Tarot card IDs

Card IDs are strings: `"major_00"` through `"major_21"` for Major Arcana. Elemental dignities positions are integers.

### Palmistry

Single image: `{ image_url: 'https://...' }`. Compatibility requires two: `{ palm_a_url: '...', palm_b_url: '...' }`.

### Horary

The `category` field is NOT accepted by the chart endpoint. Request format:
```ruby
{ question: 'Will I get the job?', question_time: { year: 2024, month: 6, day: 15, hour: 14, minute: 30, city: 'London', country_code: 'GB' } }
```

## Response Types

Most endpoints return parsed `Hash`. Exceptions that return raw `String`:
- `client.svg.*` — SVG XML strings
- `client.render.*` — SVG XML strings
- `client.vedic.get_chart` — may return SVG string
- `client.vedic.render_chart(format, request)` — binary image (format: `png`, `jpg`, `jpeg`, `webp`, `pdf`; SVG not supported)
- `client.pdf.*` — may return binary PDF data or Hash with URL
- `client.astrocartography.render_map` — may return binary image

## Configuration

Reads from env vars as defaults, overridable via constructor hash or block:

| Option | Env var | Default |
|--------|---------|---------|
| `api_key` | `ASTROLOGY_API_KEY` | `nil` |
| `base_url` | `ASTROLOGY_API_BASE_URL` | `https://api.astrology-api.io` |
| `timeout` | — | `10` |
| `debug` | `ASTROLOGY_DEBUG` | `false` |

## Testing

### Test structure

- `spec/unit/` — isolated tests with `instance_double` and mocks (`client_spec.rb`, `configuration_spec.rb`, `error_spec.rb`, `validators/`)
- `spec/integration/` — 26 test files, one per category, 250 total examples
- `spec/support/api_mode.rb` — dual-mode test infrastructure
- `spec/support/webmock_helpers.rb` — `stub_api_request`, `stub_positions_request`, `fixture(path)`
- `spec/fixtures/responses/` — JSON fixtures for unit tests

### Dual-mode testing (mock vs live)

Controlled by `ASTROLOGY_API_KEY` env var:

- **Mock mode** (no env var): WebMock stubs return predefined responses. All 250 tests pass.
- **Live mode** (env var set): Real HTTP requests to the API. Some endpoints are skipped as pending due to known API-side bugs.

Key helpers in `spec/support/api_mode.rb`:

| Helper | Purpose |
|--------|---------|
| `live_mode?` | Returns true when running against real API |
| `stub_unless_live(method, path, body:)` | Stubs request only in mock mode |
| `expect_no_api_error { }` | Wraps block; skips test on `ServerError`, `ClientError`, or `TimeoutError` |

Shared `let` blocks in the `'api client'` context: `birth_data`, `birth_data2`, `valid_request`, `birth_data_request`, `two_subjects_request`, `transit_request`, `target_date_request`, `return_year_request`, `return_date_request`, `return_date_range_request`, `return_year_range_request`, `datetime_location`, `sign_request`, `sign_code_request`.

### Known API-side issues (skipped in live mode)

These endpoints return server errors due to upstream API bugs, not SDK issues:

| Endpoint | Error | Issue |
|----------|-------|-------|
| `vedic.calculate_ashtakvarga` | 500 | Import error on API server |
| `eclipses.get_interpretation` | 500 | Unexpected argument in API handler |
| `analysis.get_predictive_analysis` | 500 | DST ambiguity in time calculation |
| `horoscope.get_chinese_horoscope` | 500 | Server error (endpoint may be incomplete) |
| `palmistry.*` (all 4 endpoints) | 500 | SSL certificate verification failure on API server |
| `tarot.calculate_optimal_times` | 500 | Server-side processing error |
| `insights.business.get_hiring_compatibility` | 500 | Unpacking error on API server |
| `horary.analyze` | 422 | Endpoint may require undocumented fields |
| `pdf.generate_weekly_horoscope` | Timeout | Slow PDF generation exceeds timeout |

### Writing new tests

Follow the existing pattern:

```ruby
# frozen_string_literal: true

RSpec.describe 'CategoryName API' do
  include_context 'api client'

  describe '#method_name' do
    it 'returns expected data' do
      stub_unless_live(:post, '/api/v3/category/endpoint', body: { data: { key: 'value' } })
      result = client.category.method_name(valid_request)
      expect(result).to be_a(Hash)
    end
  end

  # For endpoints with known API issues:
  describe '#flaky_method' do
    it 'returns data' do
      stub_unless_live(:post, '/api/v3/category/flaky', body: { data: {} })
      expect_no_api_error do
        result = client.category.flaky_method(valid_request)
        expect(result).to be_a(Hash)
      end
    end
  end
end
```

### Adding a new category

1. Create `lib/astroapi/categories/new_category.rb` inheriting from `BaseCategory`
2. Define `api_prefix` (e.g., `'/api/v3/new-category'`)
3. Add endpoint methods using `http.get(build_url(...))` or `http.post(build_url(...), body: request)`
4. Use `Validators::SubjectValidator.validate!(request[:subject] || request['subject'])` for endpoints requiring birth data
5. Add `require_relative` and accessor in `lib/astroapi/client.rb`
6. Create `spec/integration/new_category_spec.rb` following the dual-mode pattern

## CI/CD

GitHub Actions workflows in `.github/workflows/`:

- **`ci.yml`** — runs on push to `main` and on PRs: RuboCop lint + RSpec tests across Ruby 2.6–3.3
- **`release.yml`** — runs on `v*` tags: tests → verifies tag matches `Astroapi::VERSION` → builds gem → publishes to RubyGems → creates GitHub Release

Required secret: `RUBYGEMS_API_KEY` (in GitHub environment `rubygems`).

### Release process

1. Update `lib/astroapi/version.rb`
2. Update `CHANGELOG.md`
3. Commit, tag (`v1.x.x`), push with `--tags`

## Code Style

- `frozen_string_literal: true` on every Ruby file
- Single quotes for strings (RuboCop enforced)
- Max line length: 120
- YARD documentation on all public methods
- RuboCop + rubocop-rspec configured in `.rubocop.yml`
