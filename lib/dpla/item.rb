require 'dpla/configuration'

class Dpla::Item
	
	attr_reader :options

	def initialize(options)
		@options = options
	end

	def by_keyword
		keyword = options[:keyword]
		uri = URI("#{::Dpla::Configuration::BASE_URI}/items?q=#{keyword}&api_key=#{Dpla::Configuration.api_key}")
		JSON.load(Net::HTTP.get(uri))
	end

	def by_keywords
		keywords = options[:keywords].join('+AND+')
		uri = URI("#{::Dpla::Configuration::BASE_URI}/items?q=#{keywords}&api_key=#{Dpla::Configuration.api_key}")
		JSON.load(Net::HTTP.get(uri))
	end

end