=begin
/**
 * --------------------------------------------------------------------------------------------------------------------
 * <copyright company="Smallize">
 *   Copyright (c) 2024 Slidize for Cloud
 * </copyright>
 * <summary>
 *   Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 * 
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 * 
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 * </summary>
 * --------------------------------------------------------------------------------------------------------------------
 */
=end

describe 'SlidizeApi' do
    before do
        # run before each test
        @api_instance = SlidizeCloud::SlidizeApi.new
    end

    # unit tests for remove_annotations
    # Remove annotations from presentation
    # @param document 
    # @param [Hash] opts the optional parameters
    # @return [File]
    describe 'remove_annotations test' do
        it 'should work' do
            document =  File.new("../../TestData/test.pptx", 'rb') 
            result = @api_instance.remove_annotations(document)
            expect(result).not_to be_nil
        ensure
            document.close     
        end
    end

    # unit tests for remove_annotations
    # Remove annotations from presentation
    # @param document 
    # @param [Hash] opts the optional parameters
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    describe 'remove_annotations_with_http_info test' do
        it 'should work' do
            document =  File.new("../../TestData/test.pptx", 'rb') 
            result = @api_instance.remove_annotations_with_http_info(document)
            expect(result).not_to be_nil
            expect(result).to be_a(Array)
            expect(result[1]).to eq(200)
        ensure
            document.close     
        end
    end
end