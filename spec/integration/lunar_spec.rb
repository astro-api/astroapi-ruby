# frozen_string_literal: true

RSpec.describe 'Lunar API' do
  include_context 'api client'

  let(:lunar_request) { { datetime_location: datetime_location } }

  describe '#get_phases' do
    it 'returns moon phases' do
      stub_unless_live(:post, '/api/v3/lunar/phases', body: { data: { phases: [] } })
      result = client.lunar.get_phases(lunar_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_events' do
    it 'returns lunar events' do
      stub_unless_live(:post, '/api/v3/lunar/events', body: { data: { events: [] } })
      result = client.lunar.get_events(lunar_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_mansions' do
    it 'returns lunar mansions' do
      stub_unless_live(:post, '/api/v3/lunar/mansions', body: { data: { mansions: [] } })
      result = client.lunar.get_mansions(lunar_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_void_of_course' do
    it 'returns void of course periods' do
      stub_unless_live(:post, '/api/v3/lunar/void-of-course', body: { data: { periods: [] } })
      result = client.lunar.get_void_of_course(lunar_request)
      expect(result).to be_a(Hash)
    end
  end

  describe '#get_calendar' do
    it 'returns lunar calendar' do
      stub_unless_live(:get, '/api/v3/lunar/calendar/2024', body: { data: { months: [] } })
      result = client.lunar.get_calendar(2024)
      expect(result).to be_a(Hash).or be_a(Array)
    end
  end
end
