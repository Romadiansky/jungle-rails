class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if session[:user_id]
      if @current_user
        @current_user
      else
        @current_user = User.find(session[:user_id])
      end
    else
      @current_user = nil
    end
  end
  helper_method :current_user

  def authorize
    redirect_to(login_path, notice: 'you are not permitted to access this page') unless current_user
  end

  private

  def cart
    @cart ||= cookies[:cart].present? ? JSON.parse(cookies[:cart]) : {}
  end
  helper_method :cart

  def enhanced_cart
    @enhanced_cart ||= Product.where(id: cart.keys).map {|product| { product:product, quantity: cart[product.id.to_s] } }
  end
  helper_method :enhanced_cart

  def cart_subtotal_cents
    enhanced_cart.map {|entry| entry[:product].price_cents * entry[:quantity]}.sum
  end
  helper_method :cart_subtotal_cents

  def cart_quantity
    cart.map do |line_item|
      line_item[1]
    end.sum
  end
  helper_method :cart_quantity

  def empty_cart!
    update_cart({})
  end

  def update_cart(new_cart)
    cookies[:cart] = {
      value: JSON.generate(new_cart),
      expires: 10.days.from_now
    }
    cookies[:cart]
  end

end
