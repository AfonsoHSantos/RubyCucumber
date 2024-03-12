require 'rspec'

class CheckoutPage
    include Capybara::DSL
    include RSpec::Matchers

    def assertProductDetails(product)
        product_title = find('.item-details>h1')
        expect(product_title.text).to eql product[:name]

        prod_price = find('.sub-price')
        expect(prod_price.text).to eql product[:price]

        del_price = find('.delivery-price')
        expect(del_price.text).to eql product[:delivery]
    end

    def assertTotalPrice(totalPrice)
        total = find('.total-price')
        expect(total.text).to eql totalPrice
    end

    def searchZipCode(zip_code)
        find('input[placeholder="CEP"]').set(zip_code)
        find('input[value="Buscar CEP"]').click
    end

    def fillAddress(address)
        find('input[placeholder="Número"]').set(address[:Numero])
        find('input[placeholder="Complemento"]').set(address[:Complemento])
    end

    def selectPayment(payment_type)
        find('label div', text: payment_type.upcase).click
    end

    def confirmOrder()
        click_on 'Confirmar pedido'
    end

    def viewSuccessfullMessage(payment)
        success = find('h1', text: 'Uhull! Pedido confirmado')
        type = find('p', text: 'Pagamento na entrega')
        type.find('strong', text: payment)
    end

end