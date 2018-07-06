require 'spec_helper'
require 'omniauth-webex-oauth2'

describe OmniAuth::Strategies::Webex do
  let(:request) { double('Request', :params => {}, :cookies => {}, :env => {}) }
  let(:app) {
    lambda do
      [200, {}, ["Hello."]]
    end
  }

  subject do
    OmniAuth::Strategies::Webex.new(app, 'appid', 'secret', @options || {}).tap do |strategy|
      allow(strategy).to receive(:request) {
        request
      }
    end
  end

  before do
    OmniAuth.config.test_mode = true
  end

  after do
    OmniAuth.config.test_mode = false
  end

  it 'has a version number' do
    expect(OmniAuth::Webex::VERSION).not_to be nil
  end

  describe '#client_options' do
    it 'has correct authorize_url' do
      expect(subject.client.options[:authorize_url]).to eq('https://api.ciscospark.com/v1/authorize')
    end

    it 'has correct token_url' do
      expect(subject.client.options[:token_url]).to eq('https://api.ciscospark.com/v1/access_token')
    end
  end

  describe '#callback_path' do
    it 'has the correct callback path' do
      expect(subject.callback_path).to eq('/auth/webex/callback')
    end
  end

  describe '#access_token' do
    before :each do
      response = double('access token',
        access_token: 'access_token',         
        refresh_token: 'refresh_token',
        expires_in: 3600, 
        expires_at: 12345, 
      ).as_null_object
      allow(subject).to receive(:access_token) { response }
    end

    it { expect(subject.access_token.access_token).to eq('access_token') }
    it { expect(subject.access_token.expires_in).to eq(3600) }
    it { expect(subject.access_token.expires_at).to eq(12345) }
    it { expect(subject.access_token.refresh_token).to eq('refresh_token') }
  end
end