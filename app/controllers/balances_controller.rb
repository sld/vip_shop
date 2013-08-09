class BalancesController < ApplicationController
  def increase
    value = params[:value] || 1000
    current_user.balance += value.to_i
    current_user.save

    respond_to do |format| 
      format.js
    end
  end
end
