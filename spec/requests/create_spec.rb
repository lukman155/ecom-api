require 'rails_helper'

describe 'POST /bookmarks' do

  scenario 'valid bookmark attributes' do
    post '/bookmarks', params: {
      bookmark: {
        url: 'https://rock.com',
        title: 'Rock'
      }
    }

    expect(response.status).to eq(201)

    json = JSON.parse(response.body).deep_symbolize_keys
    expect(Bookmark.count).to eq(1)

    expect(Bookmark.last.title).to eq('Rock')
  end

  scenario 'invalid bookmark attributes' do
    post '/bookmarks', params: {
      bookmark: {
        url: '',
        title: 'RubyYagi blog'
      }
    }

    # response should have HTTP Status 201 Created
    expect(response.status).to eq(422)

    json = JSON.parse(response.body).deep_symbolize_keys
    expect(json[:url]).to eq(["can't be blank"])

    # no new bookmark record is created
    expect(Bookmark.count).to eq(0)
  end
end