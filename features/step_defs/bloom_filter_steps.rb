Given(/^a bloom filter$/) do
  @filter = BloomFilter.new
end

Then(/^the filter is not nil$/) do
  expect(@filter).to_not be_nil
end

