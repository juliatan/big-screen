require 'cinema'

describe Cinema do

  let(:theatre) { Theatre.new }

  it 'can open booking requests file for a theatre' do
    expect(File).to receive(:open).with('sample_booking_requests.txt', 'r')
    subject.load_booking_requests('sample_booking_requests.txt', theatre)
  end



end