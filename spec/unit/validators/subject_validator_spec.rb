# frozen_string_literal: true

RSpec.describe Astroapi::Validators::SubjectValidator do
  describe '.validate!' do
    let(:valid_subject) do
      {
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
    end

    it 'accepts valid subject with city/country' do
      expect { described_class.validate!(valid_subject) }.not_to raise_error
    end

    it 'accepts valid subject with coordinates' do
      subject = {
        birth_data: {
          year: 1990,
          month: 5,
          day: 11,
          hour: 14,
          minute: 30,
          latitude: 51.5074,
          longitude: -0.1278
        }
      }

      expect { described_class.validate!(subject) }.not_to raise_error
    end

    it 'raises error when birth_data is missing' do
      expect { described_class.validate!({}) }
        .to raise_error(Astroapi::ValidationError, /birth_data is required/)
    end

    it 'raises error when year is out of range' do
      subject = valid_subject.dup
      subject[:birth_data][:year] = 1500

      expect { described_class.validate!(subject) }
        .to raise_error(Astroapi::ValidationError, /year must be between/)
    end

    it 'raises error when month is out of range' do
      subject = valid_subject.dup
      subject[:birth_data][:month] = 13

      expect { described_class.validate!(subject) }
        .to raise_error(Astroapi::ValidationError, /month must be between/)
    end

    it 'raises error when day is out of range' do
      subject = valid_subject.dup
      subject[:birth_data][:day] = 32

      expect { described_class.validate!(subject) }
        .to raise_error(Astroapi::ValidationError, /day must be between/)
    end

    it 'raises error when hour is out of range' do
      subject = valid_subject.dup
      subject[:birth_data][:hour] = 24

      expect { described_class.validate!(subject) }
        .to raise_error(Astroapi::ValidationError, /hour must be between/)
    end

    it 'raises error when minute is out of range' do
      subject = valid_subject.dup
      subject[:birth_data][:minute] = 60

      expect { described_class.validate!(subject) }
        .to raise_error(Astroapi::ValidationError, /minute must be between/)
    end

    it 'raises error when neither city/country nor coordinates are provided' do
      subject = {
        birth_data: {
          year: 1990,
          month: 5,
          day: 11,
          hour: 14,
          minute: 30
        }
      }

      expect { described_class.validate!(subject) }
        .to raise_error(Astroapi::ValidationError, %r{Either city/country_code OR latitude/longitude})
    end

    it 'raises error when only latitude is provided' do
      subject = {
        birth_data: {
          year: 1990,
          month: 5,
          day: 11,
          hour: 14,
          minute: 30,
          latitude: 51.5074
        }
      }

      expect { described_class.validate!(subject) }
        .to raise_error(Astroapi::ValidationError, /Both latitude and longitude must be provided/)
    end

    it 'raises error when only city is provided' do
      subject = {
        birth_data: {
          year: 1990,
          month: 5,
          day: 11,
          hour: 14,
          minute: 30,
          city: 'London'
        }
      }

      expect { described_class.validate!(subject) }
        .to raise_error(Astroapi::ValidationError, /Both city and country_code must be provided/)
    end

    it 'raises error when latitude is out of range' do
      subject = {
        birth_data: {
          year: 1990,
          month: 5,
          day: 11,
          hour: 14,
          minute: 30,
          latitude: 91,
          longitude: 0
        }
      }

      expect { described_class.validate!(subject) }
        .to raise_error(Astroapi::ValidationError, /latitude must be between/)
    end

    it 'raises error when longitude is out of range' do
      subject = {
        birth_data: {
          year: 1990,
          month: 5,
          day: 11,
          hour: 14,
          minute: 30,
          latitude: 0,
          longitude: 181
        }
      }

      expect { described_class.validate!(subject) }
        .to raise_error(Astroapi::ValidationError, /longitude must be between/)
    end
  end
end
