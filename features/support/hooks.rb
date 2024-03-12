
require_relative './pages/home.rb'
require_relative './pages/checkout.rb'

Before do
    @home = HomePage.new
    @checkout = CheckoutPage.new
end