require 'spec_helper'

describe ApisController do

  describe "GET 'fatsecret'" do
    it "returns http success" do
      get 'fatsecret'
      response.should be_success
    end
  end

end
