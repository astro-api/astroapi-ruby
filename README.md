# Astroapi Ruby Client

A comprehensive Ruby SDK for the [Astrology API](https://api.astrology-api.io), providing access to planetary positions, charts, horoscopes, analysis, and more.

[![Get API Key](https://img.shields.io/badge/Get%20API%20Key-6C63FF?style=for-the-badge&logoColor=white)](https://dashboard.astrology-api.io/)
[![API Documentation](https://img.shields.io/badge/API%20Documentation-FCC624?style=for-the-badge&logoColor=black)](https://api.astrology-api.io/rapidoc)
[![Postman Collection](https://img.shields.io/badge/Postman%20Collection-FF6C37?style=for-the-badge&logo=postman&logoColor=white)](https://api.astrology-api.io/best-astrology-api-postman.json)

[![Ruby](https://img.shields.io/badge/ruby-%3E%3D%202.6.0-ruby.svg)](https://www.ruby-lang.org/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'astroapi'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install astroapi
```

## Quick Start

```ruby
require 'astroapi'

# Initialize client with API key
client = Astroapi::Client.new(api_key: 'your-api-key')

# Get planetary positions
positions = client.data.get_positions(
  subject: {
    birth_data: {
      year: 1990,
      month: 5,
      day: 11,
      hour: 14,
      minute: 30,
      city: 'London',
      country_code: 'GB'
    }
  }
)

puts positions['sun'] # => { "name" => "Sun", "longitude" => 20.5, "sign" => "Taurus", ... }
```

## Configuration

### API Key

You can configure the API key in three ways:

1. **Pass directly to constructor:**
```ruby
client = Astroapi::Client.new(api_key: 'your-api-key')
```

2. **Use environment variable:**
```bash
export ASTROLOGY_API_KEY='your-api-key'
```
```ruby
client = Astroapi::Client.new
```

3. **Configuration block:**
```ruby
client = Astroapi::Client.new do |config|
  config.api_key = 'your-api-key'
  config.timeout = 15
  config.debug = true
end
```

### Configuration Options

| Option | Environment Variable | Default | Description |
|--------|---------------------|---------|-------------|
| `api_key` | `ASTROLOGY_API_KEY` | `nil` | Your API key for authentication |
| `base_url` | `ASTROLOGY_API_BASE_URL` | `https://api.astrology-api.io` | API base URL |
| `timeout` | - | `10` | Request timeout in seconds |
| `debug` | `ASTROLOGY_DEBUG` | `false` | Enable debug logging |

### Retry Configuration

```ruby
client = Astroapi::Client.new do |config|
  config.api_key = 'your-api-key'
  config.retry.attempts = 3
  config.retry.delay_ms = 500
  config.retry.retry_status_codes = [408, 429, 500, 502, 503, 504]
end
```

## Category Clients

The SDK provides 25 category clients covering the full Astrology API v3 surface:

| Client | API Prefix | Description |
|--------|-----------|-------------|
| `client.data` | `/api/v3/data` | Planetary positions, aspects, house cusps, lunar metrics (9 endpoints) |
| `client.charts` | `/api/v3/charts` | Natal, composite, synastry, transit, solar/lunar/venus return charts (13 endpoints) |
| `client.horoscope` | `/api/v3/horoscope` | Daily, weekly, monthly, yearly horoscopes — sign and personal variants (17 endpoints) |
| `client.analysis` | `/api/v3/analysis` | Natal, synastry, composite, transit, career, health, karmic reports (26 endpoints) |
| `client.glossary` | `/api/v3/glossary` | Active points, cities, countries, elements, house systems, keywords (14 endpoints) |
| `client.astrocartography` | `/api/v3/astrocartography` | Lines, maps, paran maps, power zones, location analysis, astrodynes (13 endpoints) |
| `client.chinese` | `/api/v3/chinese` | BaZi, Ming Gua, zodiac animals, compatibility, luck pillars, solar terms (8 endpoints) |
| `client.eclipses` | `/api/v3/eclipses` | Upcoming eclipses, natal impact, interpretation (3 endpoints) |
| `client.lunar` | `/api/v3/lunar` | Phases, events, mansions, void of course, calendar (5 endpoints) |
| `client.numerology` | `/api/v3/numerology` | Core numbers, comprehensive reports, compatibility (3 endpoints) |
| `client.tarot` | `/api/v3/tarot` | Cards glossary, draws, spreads, reports, birth cards, dignities, timing (19 endpoints) |
| `client.traditional` | `/api/v3/traditional` | Dignities, lots, profections, traditional points glossary (10 endpoints) |
| `client.fixed_stars` | `/api/v3/fixed-stars` | Star positions, conjunctions, reports, presets (4 endpoints) |
| `client.insights` | `/api/v3/insights` | AI-powered insights with 5 sub-clients: relationship, pet, wellness, financial, business (31 endpoints) |
| `client.svg` | `/api/v3/svg` | SVG chart images — natal, synastry, composite, transit (4 endpoints) |
| `client.enhanced` | `/api/v3/enhanced` | Enhanced global and personal analysis with chart variants (4 endpoints) |
| `client.vedic` | `/api/v3/vedic` | Kundli, panchang, dashas, yogas, doshas, kundli matching, remedies (22 endpoints) |
| `client.human_design` | `/api/v3/human-design` | Bodygraph, type, design date, compatibility, transits, glossaries (8 endpoints) |
| `client.kabbalah` | `/api/v3/kabbalah` | Birth angels, gematria, tikkun, Tree of Life chart, glossaries (7 endpoints) |
| `client.horary` | `/api/v3/horary` | Horary chart, analysis, aspects, fertility analysis, glossaries (6 endpoints) |
| `client.fengshui` | `/api/v3/fengshui` | Flying stars, annual stars, afflictions, glossary (4 endpoints) |
| `client.palmistry` | `/api/v3/palmistry` | Palm analysis, reading, astro integration, compatibility (4 endpoints) |
| `client.pdf` | `/api/v3/pdf` | PDF reports — natal, daily/weekly horoscope, horoscope data (4 endpoints) |
| `client.render` | `/api/v3/render` | PNG chart images — natal, synastry, composite, transit (4 endpoints) |
| `client.ziwei` | `/api/v3/ziwei` | Zi Wei Dou Shu (Purple Star Astrology) chart calculation (1 endpoint) |

## Usage Examples

### Common Request Formats

Most endpoints accept one of these request patterns:

```ruby
# Single subject (most endpoints)
request = {
  subject: {
    birth_data: {
      year: 1990, month: 5, day: 11,
      hour: 14, minute: 30,
      city: 'London', country_code: 'GB'
    }
  }
}

# Two subjects (synastry, compatibility)
request = {
  subject1: { birth_data: { year: 1990, month: 5, day: 11, hour: 14, minute: 30, city: 'London', country_code: 'GB' } },
  subject2: { birth_data: { year: 1985, month: 3, day: 22, hour: 10, minute: 0, city: 'Paris', country_code: 'FR' } }
}

# Using coordinates instead of city
request = {
  subject: {
    birth_data: {
      year: 1990, month: 5, day: 11,
      hour: 14, minute: 30,
      latitude: 51.5074, longitude: -0.1278
    }
  }
}
```

### Data Client

```ruby
positions = client.data.get_positions(subject: { birth_data: birth_data })
aspects = client.data.get_aspects(subject: { birth_data: birth_data })
house_cusps = client.data.get_house_cusps(subject: { birth_data: birth_data })
lunar = client.data.get_lunar_metrics(subject: { birth_data: birth_data })
now = client.data.get_current_moment
```

### Charts Client

```ruby
natal = client.charts.get_natal_chart(subject: { birth_data: birth_data })
synastry = client.charts.get_synastry_chart(subject1: { birth_data: bd1 }, subject2: { birth_data: bd2 })

# Transit chart requires transit_time with datetime wrapper + location
transit = client.charts.get_transit_chart(
  subject: { birth_data: birth_data },
  transit_time: {
    datetime: { year: 2024, month: 6, day: 15, hour: 12, minute: 0, city: 'London', country_code: 'GB' }
  }
)

# Return charts
solar = client.charts.get_solar_return_chart(subject: { birth_data: birth_data }, return_year: 2024)
lunar = client.charts.get_lunar_return_chart(subject: { birth_data: birth_data }, return_date: '2024-06-15')
```

### Horoscope Client

```ruby
# Sign-based horoscopes (use 3-letter sign codes: Ari, Tau, Gem, Can, Leo, Vir, Lib, Sco, Sag, Cap, Aqu, Pis)
daily = client.horoscope.get_sign_daily_horoscope(sign: 'Ari')
weekly = client.horoscope.get_sign_weekly_horoscope(sign: 'Tau')

# Personal horoscopes (based on birth data)
personal = client.horoscope.get_personal_daily_horoscope(subject: { birth_data: birth_data })
```

### Analysis Client

```ruby
natal_report = client.analysis.get_natal_report(subject: { birth_data: birth_data })
compatibility = client.analysis.get_compatibility_analysis(subject1: { birth_data: bd1 }, subject2: { birth_data: bd2 })
career = client.analysis.get_career_analysis(subject: { birth_data: birth_data })
```

### Vedic Astrology

```ruby
chart = client.vedic.get_chart(birth_data: birth_data)         # birth_data at root level
panchang = client.vedic.get_panchang(birth_data: birth_data)
dasha = client.vedic.get_vimshottari_dasha(birth_data: birth_data)
matching = client.vedic.get_kundli_matching(subject1: { birth_data: bd1 }, subject2: { birth_data: bd2 })
```

### Tarot Client

```ruby
cards = client.tarot.get_cards_glossary
daily = client.tarot.get_daily_card(user_id: 'user-123')
draw = client.tarot.draw_cards(count: 3)
report = client.tarot.generate_celtic_cross_report(subject: { birth_data: birth_data })
# Card IDs are strings like "major_00", "major_01", "cups_01", etc.
dignities = client.tarot.calculate_elemental_dignities(cards: [{ id: 'major_00', position: 0 }])
```

### Insights (Nested Sub-clients)

```ruby
# Relationship insights
compat = client.insights.relationship.get_compatibility(subject1: { birth_data: bd1 }, subject2: { birth_data: bd2 })

# Financial insights
timing = client.insights.financial.get_market_timing(subject: { birth_data: birth_data })

# Business insights
team = client.insights.business.get_team_dynamics(subject: { birth_data: birth_data })

# Pet insights
pet = client.insights.pet.get_personality(
  subject: { birth_data: birth_data },                  # owner
  pet: { birth_data: { year: 2020, month: 3, day: 15, hour: 8, minute: 0, city: 'London', country_code: 'GB' } }
)
```

### SVG / PNG / PDF Generation

```ruby
# SVG charts return raw SVG string
svg = client.svg.get_natal_chart_svg(subject: { birth_data: birth_data })

# PNG charts return raw binary data
png = client.render.render_natal(subject: { birth_data: birth_data })

# PDF reports return a Hash with URL or raw data
pdf = client.pdf.generate_natal_report(subject: { birth_data: birth_data })
```

### Other Systems

```ruby
# Chinese astrology
bazi = client.chinese.calculate_bazi(birth_data: birth_data)

# Human Design
bodygraph = client.human_design.calculate_bodygraph(birth_data: birth_data)

# Kabbalah (birth_data at root level)
angels = client.kabbalah.get_birth_angels(birth_data: birth_data)

# Horary
chart = client.horary.generate_chart(
  question: 'Will I get the job?',
  question_time: { year: 2024, month: 6, day: 15, hour: 14, minute: 30, city: 'London', country_code: 'GB' }
)

# Feng Shui
stars = client.fengshui.calculate_flying_stars_chart(birth_data: birth_data)

# Zi Wei Dou Shu (birth_data at root level)
ziwei = client.ziwei.calculate_chart(birth_data: birth_data)

# Palmistry
reading = client.palmistry.analyze(image_url: 'https://example.com/palm.jpg')

# Numerology
numbers = client.numerology.get_core_numbers(subject: { birth_data: birth_data })
```

## Error Handling

The SDK provides comprehensive error handling:

```ruby
begin
  positions = client.data.get_positions(subject: { birth_data: { ... } })
rescue Astroapi::ValidationError => e
  puts "Invalid input: #{e.message}"
rescue Astroapi::ClientError => e
  puts "Client error (#{e.status_code}): #{e.message}"
rescue Astroapi::ServerError => e
  puts "Server error (#{e.status_code}): #{e.message}"
rescue Astroapi::TimeoutError => e
  puts "Request timed out: #{e.message}"
rescue Astroapi::ConnectionError => e
  puts "Connection failed: #{e.message}"
rescue Astroapi::Error => e
  puts "API error: #{e.message}"
end
```

### Error Types

| Error | Description |
|-------|-------------|
| `Astroapi::Error` | Base error class |
| `Astroapi::ValidationError` | Invalid request data |
| `Astroapi::ClientError` | 4xx HTTP errors |
| `Astroapi::ServerError` | 5xx HTTP errors |
| `Astroapi::TimeoutError` | Request timeout |
| `Astroapi::ConnectionError` | Network connection failed |
| `Astroapi::ConfigurationError` | Invalid configuration |

## Testing

The test suite supports dual-mode execution: **mock mode** (default) using WebMock stubs, and **live mode** against the real API.

```bash
# Mock mode (default) — fast, no API key needed
bundle exec rspec

# Live mode — set API key to run against real API
ASTROLOGY_API_KEY=your-api-key bundle exec rspec

# Run a single test file
bundle exec rspec spec/integration/charts_spec.rb

# Run a single example by line number
bundle exec rspec spec/integration/charts_spec.rb:7

# Run with coverage report
bundle exec rspec && open coverage/index.html

# Lint
bundle exec rubocop
bundle exec rubocop -a    # auto-correct
```

### Test Structure

- `spec/unit/` — Unit tests with mocks and doubles
- `spec/integration/` — Integration tests for all 25 categories (one file per category)
- `spec/support/` — Shared helpers (`api_mode.rb`, `webmock_helpers.rb`)
- `spec/fixtures/responses/` — JSON fixtures for mock responses

### Dual-Mode Helpers

| Helper | Purpose |
|--------|---------|
| `stub_unless_live(:post, '/path', body: ...)` | Stub in mock mode, skip in live mode |
| `expect_no_api_error { ... }` | Rescue known API bugs/timeouts and skip gracefully |
| `live_mode?` | Check if running against real API |

## CI/CD

The project uses GitHub Actions for continuous integration and automated releases.

**CI** (`.github/workflows/ci.yml`) — runs on every push to `main` and on pull requests:
- RuboCop linting
- RSpec tests across Ruby 2.6 — 3.3

**Release** (`.github/workflows/release.yml`) — runs on version tags (`v*`):
1. Runs full test suite
2. Verifies tag matches `Astroapi::VERSION`
3. Builds and publishes the gem to RubyGems
4. Creates a GitHub Release with auto-generated notes

### Versioning

This project follows [Semantic Versioning](https://semver.org/):

- **MAJOR** (1.x.x → 2.0.0) — breaking API changes (removed methods, changed signatures)
- **MINOR** (1.0.x → 1.1.0) — new features, new category clients, new endpoints
- **PATCH** (1.0.0 → 1.0.1) — bug fixes, documentation updates

The version is defined in a single place: `lib/astroapi/version.rb`.

### Publishing a new version

1. Update the version in `lib/astroapi/version.rb`:
   ```ruby
   module Astroapi
     VERSION = '1.1.0'
   end
   ```

2. Add a new section to `CHANGELOG.md`:
   ```markdown
   ## [1.1.0] - 2026-03-01

   ### Added
   - New category client: ...

   ### Fixed
   - ...
   ```

3. Commit, tag, and push:
   ```bash
   git add -A
   git commit -m "Release v1.1.0"
   git tag v1.1.0
   git push origin main --tags
   ```

The release workflow will automatically run tests, build the gem, publish it to [RubyGems](https://rubygems.org/gems/astroapi), and create a GitHub Release.

> **Important:** The tag version (`v1.1.0`) must match the version in `version.rb` (`1.1.0`), otherwise the release workflow will fail.

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `bundle exec rspec` to run the tests.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/astro-api/astroapi-ruby.

## License

The gem is available as open source under the terms of the [MIT License](LICENSE).

## Links

- [Astrology API Documentation](https://api.astrology-api.io/rapidoc)
- [GitHub Repository](https://github.com/astro-api/astroapi-ruby)
- [RubyGems](https://rubygems.org/gems/astroapi)
- [API Support](mailto:support@astrology-api.io)
