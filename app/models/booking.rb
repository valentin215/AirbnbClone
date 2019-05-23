class Booking < ApplicationRecord
  belongs_to :flat
  belongs_to :user

  def total_cost
    @total_cost = @flat.price * (end_date - start_date)
  end
end
