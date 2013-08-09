module CartsHelper
  def total_price cart_products
    cart_products.inject(0){|s,cart_product| s += cart_product.quantity*cart_product.product.price}
  end
end
