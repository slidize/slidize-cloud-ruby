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

  # unit tests for merge
  # Merges files provided in the request and saves the merge result into target format.
  # @param format Output file format.
  # @param documents 
  # @param [Hash] opts the optional parameters
  # @option opts [MergeOptions] :options 
  # @return [File]
  describe 'merge test' do
    it 'should work' do
      document_paths = ["../../TestData/test.pptx", "../../TestData/master.pptx"]
      documents = document_paths.map { |path| File.new(path, 'rb') } 

      merge_options = SlidizeCloud::MergeOptions.new
      merge_options.master_file_name = "master.pptx"
      merge_options.exclude_master_file = false
      options = { options: merge_options }

      result = @api_instance.merge("pdf", documents, options)
      expect(result).not_to be_nil

    ensure
        documents.each(&:close)
    end
  end

  # unit tests for merge_with_http_info
  # Merges files provided in the request and saves the merge result into target format.
  # @param format Output file format.
  # @param documents 
  # @param [Hash] opts the optional parameters
  # @option opts [MergeOptions] :options 
  # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
  describe 'merge_with_http_info test' do
    it 'should work' do
      document_paths = ["../../TestData/test.pptx", "../../TestData/master.pptx"]
      documents = document_paths.map { |path| File.new(path, 'rb') } 

      merge_options = SlidizeCloud::MergeOptions.new
      merge_options.master_file_name = "master.pptx"
      merge_options.exclude_master_file = false
      options = { options: merge_options }

      result = @api_instance.merge_with_http_info("pdf", documents, options)
      expect(result).not_to be_nil
      expect(result).to be_a(Array)
      expect(result[1]).to eq(200)

    ensure
        documents.each(&:close)
    end
  end
end