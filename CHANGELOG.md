# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [1.0.0] - 2026-02-16

### Added

#### Core
- HTTP client built on Faraday with middleware stack (authentication, logging, response unwrapping, retry, error handling)
- Configuration via constructor hash, block, or environment variables (`ASTROLOGY_API_KEY`, `ASTROLOGY_API_BASE_URL`, `ASTROLOGY_DEBUG`)
- Retry logic with configurable attempts, delay, and status codes
- Error hierarchy: `ClientError`, `ServerError`, `TimeoutError`, `ConnectionError`, `ValidationError`, `ConfigurationError`
- Input validation for birth data (date ranges, location as city+country_code or latitude+longitude)

#### Category Clients (25 categories, 200+ endpoints)
- `data` — planetary positions, aspects, house cusps, lunar metrics (9 endpoints)
- `charts` — natal, composite, synastry, transit, solar/lunar/venus return charts (13 endpoints)
- `horoscope` — daily, weekly, monthly, yearly horoscopes for signs and personal (17 endpoints)
- `analysis` — natal, synastry, composite, transit, career, health, karmic reports (26 endpoints)
- `glossary` — active points, cities, countries, elements, house systems, keywords (14 endpoints)
- `astrocartography` — lines, maps, paran maps, power zones, location analysis, astrodynes (13 endpoints)
- `chinese` — BaZi, Ming Gua, zodiac animals, compatibility, luck pillars, solar terms (8 endpoints)
- `eclipses` — upcoming eclipses, natal impact, interpretation (3 endpoints)
- `lunar` — phases, events, mansions, void of course, calendar (5 endpoints)
- `numerology` — core numbers, comprehensive reports, compatibility (3 endpoints)
- `tarot` — cards glossary, draws, spreads, reports, birth cards, dignities, timing (19 endpoints)
- `traditional` — dignities, lots, profections, traditional points glossary (10 endpoints)
- `fixed_stars` — star positions, conjunctions, reports, presets (4 endpoints)
- `insights` — AI-powered insights with 5 sub-clients: relationship, pet, wellness, financial, business (31 endpoints)
- `svg` — SVG chart images: natal, synastry, composite, transit (4 endpoints)
- `enhanced` — enhanced global and personal analysis with chart variants (4 endpoints)
- `vedic` — kundli, panchang, dashas, yogas, doshas, kundli matching, remedies (22 endpoints)
- `human_design` — bodygraph, type, design date, compatibility, transits, glossaries (8 endpoints)
- `kabbalah` — birth angels, gematria, tikkun, Tree of Life chart, glossaries (7 endpoints)
- `horary` — horary chart, analysis, aspects, fertility analysis, glossaries (6 endpoints)
- `fengshui` — flying stars, annual stars, afflictions, glossary (4 endpoints)
- `palmistry` — palm analysis, reading, astro integration, compatibility (4 endpoints)
- `pdf` — PDF reports: natal, daily/weekly horoscope, horoscope data (4 endpoints)
- `render` — PNG chart images: natal, synastry, composite, transit (4 endpoints)
- `ziwei` — Zi Wei Dou Shu chart calculation (1 endpoint)

#### Testing
- Dual-mode test suite: mock mode (WebMock) and live mode (real API)
- 250 examples across 26 integration test files (one per category) + unit tests
- 96% code coverage (SimpleCov)
- RuboCop + rubocop-rspec for code style enforcement

#### CI/CD
- GitHub Actions CI workflow: RuboCop lint + RSpec on Ruby 2.6–3.3
- GitHub Actions release workflow: auto-publish to RubyGems on version tags

[Unreleased]: https://github.com/astro-api/astroapi-ruby/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/astro-api/astroapi-ruby/releases/tag/v1.0.0
