require 'cinema'

describe Cinema do

  let(:theatre) { Theatre.new }

  it 'can open booking requests file for a theatre' do
    expect(File).to receive(:open).with('test.txt', 'r').and_return '(0,89:13,89:13),'
    subject.load_booking_requests('test.txt', theatre)
  end

  it 'can create bookings from the loaded file' do
    subject.load_booking_requests('sample_booking_requests.txt', theatre)
    expect(theatre.bookings.count).to eq 500
  end

  # it 'runs the sample first correctly' do
    
  # end

end