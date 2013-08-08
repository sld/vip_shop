class BalancesController < ApplicationController
  def increase
    current_user.balance += 1000
    current_user.save

    respond_to do |format| 
      format.js
    end
  end
end
