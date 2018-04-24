require "rails_helper"

RSpec.describe Devise::Mailer do
    it "send a email confirmation with custom text" do
        user = FactoryGirl.create(:user)
        confirmation_email = Devise.mailer.deliveries.last
        expect(user.email).to eq.confirmation_email.to[0]
        expect(confirmation_email.body.to_s).to have_content 'John says Hi!'
   end
end
