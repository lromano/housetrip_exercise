require "spec_helper"

describe StringDecompressor do
	describe "#decompress" do
		
		subject { StringDecompressor.new(initial_string) }
		
		let(:decompressed_string_attended_result) { "aaabbcc" }
		
		context "when the passed string is decompressible" do

			let(:initial_string) { "a3b2c2" }

			it 'returns a higher size version of the string' do
				subject.decompress.length.should > initial_string.length
			end

			it 'returns the right decompressed string result' do
				subject.decompress.should eq decompressed_string_attended_result
			end
		end

		context "when the passed string is not decompressible" do

			let(:initial_string) { "abcd" }
			
			it 'returns the same string than the one initially passed' do
				subject.decompress.should eq initial_string
			end

		end
		
	end
end

