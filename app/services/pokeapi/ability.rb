require 'rest-client'

module Pokeapi
  class Ability < ApplicationService
    URI_BASE = 'https://pokeapi.co/api/v2/pokemon/'.freeze

    attr_reader :pokemon_name, :abilities

    def initialize(name)
      @pokemon_name = name
    end

    def call
      @abilities = response_body['abilities'].collect { |item| ::Ability.new(item['ability']) }
    end

    private

    def response_body 
      @response_body ||= JSON.parse(response.body)
    end

    def response
      @response ||= RestClient.get("#{URI_BASE}#{pokemon_name}")
    end
  end
end
