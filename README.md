# Slidize for Cloud SDK
The repo contains Slidize.Cloud API client for Ruby

The [Slidize.Cloud](https://products.slidize.cloud/) is a free, simple, and secure RESTful service engaged to process PowerPoint presentations. The SDK is built on top of the RESTful service and allows you to make API calls just with a few lines of code. 

#### Currently supported features:
[Convert presentations](https://products.slidize.cloud/converter/) | [Merge presentations](https://products.slidize.cloud/merger/) | [Split presentation](https://products.slidize.cloud/splitter/) | [Convert presentation to a video](https://products.slidize.cloud/video-converter/) | [Protect presentation](https://products.slidize.cloud/locker/) | [Unprotect presentation](https://products.slidize.cloud/unlocker/) | [Add text watermarks to presentations](https://products.slidize.cloud/text-watermarker/) | [Add image watermarks to presentations](https://products.slidize.cloud/image-watermarker/) | [Replace text in presentations](https://products.slidize.cloud/text-replacer/) | [Remove macros from presentation](https://products.slidize.cloud/macros-remover/) | [Remove annotations from presentation](https://products.slidize.cloud/annotations-remover/)

## How to Install
The complete source code is available in this repository folder. Simply integrate provided files into your solution.

## How to Use
You can find usage examples in the **spec/use_cases** folder.

The [Online low-code apps](https://products.slidize.cloud) for demonstrating API capabilities are available as well. 

#### Sample usage

The code example below shows how to merge two presentations and save the result in PDF format. One of the presentations will provide an overall style for the output PDF.
```
document_paths = ["../../TestData/test.pptx", "../../TestData/master.pptx"]
documents = document_paths.map { |path| File.new(path, 'rb') } 

merge_options = SlidizeCloud::MergeOptions.new
merge_options.master_file_name = "master.pptx"
merge_options.exclude_master_file = false
options = { options: merge_options }

api_instance = SlidizeCloud::SlidizeApi.new
result = api_instance.merge("pdf", documents, options)
```

Generatate this code using the [Slidize.Cloud Merge To PDF Low-Code app](https://products.slidize.cloud/merger/merge-api/merge-to-pdf/)

## Resources
[Slidize.Cloud Low-Code Applications](https://products.slidize.cloud)

## Contact Us
Your feedback is very important to us. Please feel free to contact us at slidize@smallize.com