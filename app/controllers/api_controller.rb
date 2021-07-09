class ApiController < ApplicationController
  before_action :load_abilities, only: :show

  attr_reader :abilities

  def show
    ability_names = abilities.map(&:name).sort

    render json: ability_names
  end

  private

  def load_abilities
    @abilities = ::Pokeapi::Ability.call(params.require(:name))
  end
end
