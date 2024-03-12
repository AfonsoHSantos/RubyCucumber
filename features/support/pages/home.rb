require 'rspec'

class HomePage
    include Capybara::DSL
    include RSpec::Matchers

    def open
        visit 'https://starbugs.vercel.app'
    end

    def coffee_list
        return all('.coffee-item')
    end

    def buy(coffee_name)
        product = find('.coffee-item', text: coffee_name)
        product.find('.buy-coffee').click
    end

    def assertErrorMessage()
        msg = find('#swal2-html-container')
        expect(msg.text).to eql 'Produto indisponível'
    end

end