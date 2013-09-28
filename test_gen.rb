require 'minitest/spec'
require 'minitest/autorun'
require 'webmock/minitest'
require './gen'

describe AuthService do
    describe "#check_credential" do
        before do
           @as = AuthService.new("localhost")
        end

        it "returns true on success" do
            stub_request(:any, "https://a:1@localhost/home/a/inbox.json?auth=ba")
                .to_return(:status => 200)
            @as.check_credential("a", "1").must_equal true
        end

        it "returns false on wrong username or password" do
            stub_request(:any, "https://a:1@localhost/home/a/inbox.json?auth=ba")
                .to_return(:status => 501)
            @as.check_credential("a", "1").must_equal false
        end

        it "returns false on timeout" do
            stub_request(:any, "https://a:1@localhost/home/a/inbox.json?auth=ba")
                .to_timeout()
            @as.check_credential("a", "1").must_equal false
        end
    end
end
