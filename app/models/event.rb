# frozen_string_literal: true

class Event < ApplicationRecord
  def free?
    price.blank? || price.zero?
  end
end
