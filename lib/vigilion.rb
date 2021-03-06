# faraday for connection handling
require "faraday"
require "faraday_middleware"
require "faraday/detailed_logger"

# Vigilion
require "vigilion/version"
require "vigilion/configuration"
require "vigilion/http"
require "vigilion/errors"

module Vigilion
  def self.configure(&block)
    Vigilion::Configuration.configure(&block)
  end

  def self.scan_url(identifier, url, options = {})
    Vigilion::HTTP.new.scan_url identifier, url, options
  end

  def self.scan_path(identifier, path, options = {})
    Vigilion::HTTP.new.scan_path identifier, path, options
  end

  def self.check_status(identifier)
    Vigilion::HTTP.new.get(identifier)
  end
end
