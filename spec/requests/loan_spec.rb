require 'rails_helper'

RSpec.describe "Loans", type: :request do
  let(:author) {Author.create(first_name: "FirstName", last_name: "LastName")}
  let(:genre) {Genre.create(name: "Name")}
  let(:book) {Book.create(title: "Title", author_id: author.id, genre_ids: [genre.id], quantity: 2)}
  let(:user) {Customer.create(first_name: "FirstName", last_name: "LastName", email:"name@domain.com", password:"password")}
  let(:period) {Time.now.utc.beginning_of_day + 1.day}
  subject(:result) {JSON.parse(response.body)}

  it "AJAX /create" do
    sign_in user

    post url_for(controller: :loans), xhr: true, params: {format: :json, loan: {book_id: book.id, user_id: user.id, period: period}}

    @expected = {
      "loan": {
        "book": book.reload,
        "user": user,
        "period": period
      }
    }.to_json

    expect(result).to eq(JSON.parse(@expected))
  end
end
