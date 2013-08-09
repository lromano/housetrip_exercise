require "spec_helper"

describe StringCompressor do
	describe "#compress" do
		
		subject { StringCompressor.new(initial_string) }
		
		let(:compressed_string_attended_result) { "a3b2c2" }
		
		context "when the passed string is compressible" do

			let(:initial_string) { "aaabbcc" }

			it 'returns a lower size version of the string' do
				subject.compress.length.should < initial_string.length
			end

			it 'returns the right compressed string result' do
				subject.compress.should eq compressed_string_attended_result
			end
		end

		context "when the passed string is uncompressible" do

			let(:initial_string) { "abcd" }
			
			it 'returns the same string than the one initially passed' do
				subject.compress.should eq initial_string
			end

		end
		
	end
end

