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

# Common files
require 'slidize_cloud/api_client'
require 'slidize_cloud/api_error'
require 'slidize_cloud/version'
require 'slidize_cloud/configuration'

# Models
require 'slidize_cloud/models/convert_request'
require 'slidize_cloud/models/convert_to_video_request'
require 'slidize_cloud/models/export_format'
require 'slidize_cloud/models/image_watermark_options'
require 'slidize_cloud/models/image_watermark_request'
require 'slidize_cloud/models/merge_options'
require 'slidize_cloud/models/merge_request'
require 'slidize_cloud/models/protect_request'
require 'slidize_cloud/models/protection_options'
require 'slidize_cloud/models/replace_text_options'
require 'slidize_cloud/models/replace_text_request'
require 'slidize_cloud/models/split_options'
require 'slidize_cloud/models/split_request'
require 'slidize_cloud/models/text_watermark_options'
require 'slidize_cloud/models/text_watermark_request'
require 'slidize_cloud/models/unprotect_request'
require 'slidize_cloud/models/video_options'
require 'slidize_cloud/models/video_resolution_type'
require 'slidize_cloud/models/video_transition_type'

# APIs
require 'slidize_cloud/api/slidize_api'

module SlidizeCloud
  class << self
    # Customize default settings for the SDK using block.
    #   SlidizeCloud.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
