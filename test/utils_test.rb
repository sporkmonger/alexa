require "helper"

describe Alexa::Utils do
  # safe_retrieve

  it "returns nested hash value" do
    hash = {:first => {:second => {:third => "Value!"}}}
    assert_equal "Value!", Alexa::Utils.safe_retrieve(hash, :first, :second, :third)
  end

  it "returns nil when key not found in hash" do
    hash = {:first => {:second => {:third => "Value!"}}}
    assert_nil Alexa::Utils.safe_retrieve(hash, :non_exisiting)
  end

  it "returns nil when one of keys not found in hash" do
    hash = {:first => {:second => {:third => "Value!"}}}
    assert_nil Alexa::Utils.safe_retrieve(hash, :first, :non_exisiting)
  end

  it "returns nil when given more keys than present in hash" do
    hash = {:first => {:second => {:third => "Value!"}}}
    assert_nil Alexa::Utils.safe_retrieve(hash, :first, :second, :third, :fourth)
  end

  it "returns nil when non hash object given" do
    assert_nil Alexa::Utils.safe_retrieve("something different")
  end

  it "returns nil when no keys given" do
    hash = {:first => {:second => {:third => "Value!"}}}
    assert_nil Alexa::Utils.safe_retrieve(hash)
  end
end
