class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  has_one :cart
  has_many :buyings, :dependent => :destroy


  def cart
    super || create_cart
  end


  def buy_cart!
    if balance >= cart.total_price            
      transaction do 
        buyings.create( :cart => cart )      
        self.balance -= cart.total_price            
        save
        cart.user = nil
        cart.save                      
        reload
        return true
      end
    else
      errors.add(:buyings, 'Balance too less for buy cart')
      return false
    end
  end
end
