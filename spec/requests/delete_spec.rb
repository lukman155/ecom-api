require 'rails_helper'

describe 'DELETE /bookmarks' do
let!(:bookmark){Bookmark.create(url:'wear.com', title:'wear')}
  scenario 'delete bookmark with valid ID' do
    delete "/bookmarks/#{bookmark.id}"

    expect(response.status).to eq(204)
    expect(Bookmark.count).to eq(0)
  end
end