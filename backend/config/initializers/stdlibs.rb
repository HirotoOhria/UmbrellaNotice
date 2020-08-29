require 'json'
require 'rexml/document'
require 'uri'
require 'open-uri'
require 'net/http'
require 'webrick'
require 'line/bot'
require 'romkan'

if Rails.env.development? || Rails.env.test?
  require 'faker'
end