require 'rails_helper'

RSpec.describe 'Shop status requests' do

  describe 'GET /shops' do
    it 'returns a status message' do
      get('/shops')
      # json = JSON.parse(response.body)
      expect(response.status).to eql(200)
    end
  end

  describe 'GET /shops' do
    it 'returns an array of shops' do
      get('/shops')
      # json = JSON.parse(response.body)
      expect(response.body).to include(
        'Amazon'
      )
    end
  end

  describe 'GET /shops/1' do
    it 'returns a specific shop' do
      get('/shops/1')
      json = JSON.parse(response.body)
      expect(json.first).to include(
        1
      )
    end
  end

  describe 'GET /shops/1' do
    it 'returns an array of books in stock' do
      get('/shops/1')
      json = JSON.parse(response.body)
      expect(response.body).to include(
        "Yiddish Songs from Warsaw"
      )
    end
  end

  describe 'GET /shops/1' do
    it 'marks one or multiple copies of a book as sold' do
      get('/shops/1')
      json = JSON.parse(response.body)
      expect(response.body).to include(
        "copies_sold"
      )
    end
  end

end
