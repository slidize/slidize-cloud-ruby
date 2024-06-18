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

require 'cgi'

module SlidizeCloud
  class SlidizeApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Converts files provided in the request body into target format and returns conversion result.
    # @param format [ExportFormat] Output file format.
    # @param documents [Array<File>] 
    # @param [Hash] opts the optional parameters
    # @return [File]
    def convert(format, documents, opts = {})
      data, _status_code, _headers = convert_with_http_info(format, documents, opts)
      data
    end

    # Converts files provided in the request body into target format and returns conversion result.
    # @param format [ExportFormat] Output file format.
    # @param documents [Array<File>] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    def convert_with_http_info(format, documents, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SlidizeApi.convert ...'
      end
      # verify the required parameter 'format' is set
      if @api_client.config.client_side_validation && format.nil?
        fail ArgumentError, "Missing the required parameter 'format' when calling SlidizeApi.convert"
      end
      # verify the required parameter 'documents' is set
      if @api_client.config.client_side_validation && documents.nil?
        fail ArgumentError, "Missing the required parameter 'documents' when calling SlidizeApi.convert"
      end
      # resource path
      local_var_path = '/convert/{format}'.sub('{' + 'format' + '}', CGI.escape(format.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['documents'] = @api_client.build_collection_param(documents, :multi)

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'File'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"SlidizeApi.convert",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SlidizeApi#convert\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Converts file provided in the request body into video.
    # @param document [File] 
    # @param [Hash] opts the optional parameters
    # @option opts [VideoOptions] :options 
    # @return [File]
    def convert_to_video(document, opts = {})
      data, _status_code, _headers = convert_to_video_with_http_info(document, opts)
      data
    end

    # Converts file provided in the request body into video.
    # @param document [File] 
    # @param [Hash] opts the optional parameters
    # @option opts [VideoOptions] :options 
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    def convert_to_video_with_http_info(document, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SlidizeApi.convert_to_video ...'
      end
      # verify the required parameter 'document' is set
      if @api_client.config.client_side_validation && document.nil?
        fail ArgumentError, "Missing the required parameter 'document' when calling SlidizeApi.convert_to_video"
      end
      # resource path
      local_var_path = '/video'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['document'] = document
      form_params['options'] = opts[:'options'] if !opts[:'options'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'File'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"SlidizeApi.convert_to_video",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SlidizeApi#convert_to_video\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Adds image watermarks and return result.
    # @param documents [Array<File>] 
    # @param image [File] 
    # @param [Hash] opts the optional parameters
    # @option opts [ImageWatermarkOptions] :options 
    # @return [File]
    def image_watermark(documents, image, opts = {})
      data, _status_code, _headers = image_watermark_with_http_info(documents, image, opts)
      data
    end

    # Adds image watermarks and return result.
    # @param documents [Array<File>] 
    # @param image [File] 
    # @param [Hash] opts the optional parameters
    # @option opts [ImageWatermarkOptions] :options 
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    def image_watermark_with_http_info(documents, image, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SlidizeApi.image_watermark ...'
      end
      # verify the required parameter 'documents' is set
      if @api_client.config.client_side_validation && documents.nil?
        fail ArgumentError, "Missing the required parameter 'documents' when calling SlidizeApi.image_watermark"
      end
      # verify the required parameter 'image' is set
      if @api_client.config.client_side_validation && image.nil?
        fail ArgumentError, "Missing the required parameter 'image' when calling SlidizeApi.image_watermark"
      end
      # resource path
      local_var_path = '/watermark/image'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['documents'] = @api_client.build_collection_param(documents, :multi)
      form_params['image'] = image
      form_params['options'] = opts[:'options'] if !opts[:'options'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'File'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"SlidizeApi.image_watermark",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SlidizeApi#image_watermark\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Merges files provided in the request and saves the merge result into target format.
    # @param format [ExportFormat] Output file format.
    # @param documents [Array<File>] 
    # @param [Hash] opts the optional parameters
    # @option opts [MergeOptions] :options 
    # @return [File]
    def merge(format, documents, opts = {})
      data, _status_code, _headers = merge_with_http_info(format, documents, opts)
      data
    end

    # Merges files provided in the request and saves the merge result into target format.
    # @param format [ExportFormat] Output file format.
    # @param documents [Array<File>] 
    # @param [Hash] opts the optional parameters
    # @option opts [MergeOptions] :options 
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    def merge_with_http_info(format, documents, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SlidizeApi.merge ...'
      end
      # verify the required parameter 'format' is set
      if @api_client.config.client_side_validation && format.nil?
        fail ArgumentError, "Missing the required parameter 'format' when calling SlidizeApi.merge"
      end
      # verify the required parameter 'documents' is set
      if @api_client.config.client_side_validation && documents.nil?
        fail ArgumentError, "Missing the required parameter 'documents' when calling SlidizeApi.merge"
      end
      # resource path
      local_var_path = '/merge/{format}'.sub('{' + 'format' + '}', CGI.escape(format.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['documents'] = @api_client.build_collection_param(documents, :multi)
      form_params['options'] = opts[:'options'] if !opts[:'options'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'File'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"SlidizeApi.merge",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SlidizeApi#merge\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Protects presentation with specified password and returns result.
    # @param document [File] 
    # @param [Hash] opts the optional parameters
    # @option opts [ProtectionOptions] :options 
    # @return [File]
    def protect(document, opts = {})
      data, _status_code, _headers = protect_with_http_info(document, opts)
      data
    end

    # Protects presentation with specified password and returns result.
    # @param document [File] 
    # @param [Hash] opts the optional parameters
    # @option opts [ProtectionOptions] :options 
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    def protect_with_http_info(document, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SlidizeApi.protect ...'
      end
      # verify the required parameter 'document' is set
      if @api_client.config.client_side_validation && document.nil?
        fail ArgumentError, "Missing the required parameter 'document' when calling SlidizeApi.protect"
      end
      # resource path
      local_var_path = '/lock'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['document'] = document
      form_params['options'] = opts[:'options'] if !opts[:'options'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'File'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"SlidizeApi.protect",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SlidizeApi#protect\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Remove annotations from presentation
    # @param document [File] 
    # @param [Hash] opts the optional parameters
    # @return [File]
    def remove_annotations(document, opts = {})
      data, _status_code, _headers = remove_annotations_with_http_info(document, opts)
      data
    end

    # Remove annotations from presentation
    # @param document [File] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    def remove_annotations_with_http_info(document, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SlidizeApi.remove_annotations ...'
      end
      # verify the required parameter 'document' is set
      if @api_client.config.client_side_validation && document.nil?
        fail ArgumentError, "Missing the required parameter 'document' when calling SlidizeApi.remove_annotations"
      end
      # resource path
      local_var_path = '/removeAnnotations'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['document'] = document

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'File'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"SlidizeApi.remove_annotations",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SlidizeApi#remove_annotations\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Remove macros from presentation
    # @param document [File] 
    # @param [Hash] opts the optional parameters
    # @return [File]
    def remove_macros(document, opts = {})
      data, _status_code, _headers = remove_macros_with_http_info(document, opts)
      data
    end

    # Remove macros from presentation
    # @param document [File] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    def remove_macros_with_http_info(document, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SlidizeApi.remove_macros ...'
      end
      # verify the required parameter 'document' is set
      if @api_client.config.client_side_validation && document.nil?
        fail ArgumentError, "Missing the required parameter 'document' when calling SlidizeApi.remove_macros"
      end
      # resource path
      local_var_path = '/removeMacros'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['document'] = document

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'File'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"SlidizeApi.remove_macros",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SlidizeApi#remove_macros\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Replace text in presentation.
    # @param documents [Array<File>] 
    # @param [Hash] opts the optional parameters
    # @option opts [ReplaceTextOptions] :options 
    # @return [File]
    def replace_text(documents, opts = {})
      data, _status_code, _headers = replace_text_with_http_info(documents, opts)
      data
    end

    # Replace text in presentation.
    # @param documents [Array<File>] 
    # @param [Hash] opts the optional parameters
    # @option opts [ReplaceTextOptions] :options 
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    def replace_text_with_http_info(documents, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SlidizeApi.replace_text ...'
      end
      # verify the required parameter 'documents' is set
      if @api_client.config.client_side_validation && documents.nil?
        fail ArgumentError, "Missing the required parameter 'documents' when calling SlidizeApi.replace_text"
      end
      # resource path
      local_var_path = '/replaceText'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['documents'] = @api_client.build_collection_param(documents, :multi)
      form_params['options'] = opts[:'options'] if !opts[:'options'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'File'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"SlidizeApi.replace_text",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SlidizeApi#replace_text\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Splits presentation according to the specified slides range and saves result into target format.
    # @param format [ExportFormat] Output file format.
    # @param document [File] 
    # @param [Hash] opts the optional parameters
    # @option opts [SplitOptions] :options 
    # @return [File]
    def split(format, document, opts = {})
      data, _status_code, _headers = split_with_http_info(format, document, opts)
      data
    end

    # Splits presentation according to the specified slides range and saves result into target format.
    # @param format [ExportFormat] Output file format.
    # @param document [File] 
    # @param [Hash] opts the optional parameters
    # @option opts [SplitOptions] :options 
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    def split_with_http_info(format, document, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SlidizeApi.split ...'
      end
      # verify the required parameter 'format' is set
      if @api_client.config.client_side_validation && format.nil?
        fail ArgumentError, "Missing the required parameter 'format' when calling SlidizeApi.split"
      end
      # verify the required parameter 'document' is set
      if @api_client.config.client_side_validation && document.nil?
        fail ArgumentError, "Missing the required parameter 'document' when calling SlidizeApi.split"
      end
      # resource path
      local_var_path = '/split/{format}'.sub('{' + 'format' + '}', CGI.escape(format.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['document'] = document
      form_params['options'] = opts[:'options'] if !opts[:'options'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'File'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"SlidizeApi.split",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SlidizeApi#split\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Adds text watermarks and return result.
    # @param documents [Array<File>] 
    # @param [Hash] opts the optional parameters
    # @option opts [TextWatermarkOptions] :options 
    # @return [File]
    def text_watermark(documents, opts = {})
      data, _status_code, _headers = text_watermark_with_http_info(documents, opts)
      data
    end

    # Adds text watermarks and return result.
    # @param documents [Array<File>] 
    # @param [Hash] opts the optional parameters
    # @option opts [TextWatermarkOptions] :options 
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    def text_watermark_with_http_info(documents, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SlidizeApi.text_watermark ...'
      end
      # verify the required parameter 'documents' is set
      if @api_client.config.client_side_validation && documents.nil?
        fail ArgumentError, "Missing the required parameter 'documents' when calling SlidizeApi.text_watermark"
      end
      # resource path
      local_var_path = '/watermark/text'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['documents'] = @api_client.build_collection_param(documents, :multi)
      form_params['options'] = opts[:'options'] if !opts[:'options'].nil?

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'File'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"SlidizeApi.text_watermark",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SlidizeApi#text_watermark\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Removes password from the presentation and returns result.
    # @param password [String] Password to remove.
    # @param document [File] 
    # @param [Hash] opts the optional parameters
    # @return [File]
    def unprotect(password, document, opts = {})
      data, _status_code, _headers = unprotect_with_http_info(password, document, opts)
      data
    end

    # Removes password from the presentation and returns result.
    # @param password [String] Password to remove.
    # @param document [File] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(File, Integer, Hash)>] File data, response status code and response headers
    def unprotect_with_http_info(password, document, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: SlidizeApi.unprotect ...'
      end
      # verify the required parameter 'password' is set
      if @api_client.config.client_side_validation && password.nil?
        fail ArgumentError, "Missing the required parameter 'password' when calling SlidizeApi.unprotect"
      end
      # verify the required parameter 'document' is set
      if @api_client.config.client_side_validation && document.nil?
        fail ArgumentError, "Missing the required parameter 'document' when calling SlidizeApi.unprotect"
      end
      # resource path
      local_var_path = '/unlock'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['text/plain', 'application/json', 'text/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end
      header_params[:'password'] = password

      # form parameters
      form_params = opts[:form_params] || {}
      form_params['document'] = document

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'File'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"SlidizeApi.unprotect",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SlidizeApi#unprotect\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
