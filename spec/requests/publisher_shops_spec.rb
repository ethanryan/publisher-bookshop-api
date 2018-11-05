require 'rails_helper'

RSpec.describe 'Publisher_Shops status requests' do

  describe 'GET /publishers/1/shops' do
    it 'returns a status message' do
      get('/publishers/1/shops')
      expect(response.status).to eql(200)
    end
  end

  describe 'GET /publishers/1/shops' do
    it 'returns an array of shops selling books by that publisher' do
      get('/publishers/1/shops')
      expect(response.body).to include(
        "Yiddish Songs from Warsaw"
      )
    end
  end

  describe 'GET /publishers/1/shops' do
    it 'returns an array of shops in descending order based on books sold' do
      get('/publishers/1/shops')
      json = JSON.parse(response.body)

      value_1 = json['shops'][0]['books_sold_count']
      value_2 = json['shops'][1]['books_sold_count']

      expect(value_1).to be > value_2
    end
  end

end
