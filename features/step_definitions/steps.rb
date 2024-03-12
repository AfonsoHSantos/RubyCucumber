Quando('acesso a página principal da Starbugs') do
    @home.open
end
  
Então('eu devo ver uma lista de cafés disponíveis') do
    expect(@home.coffee_list.size).to be > 0
end

Dado('que estou na página principal da Starbugs') do
    @home.open
end

Dado('desejo comprar o seguinte produto:') do |table|
    @product = table.rows_hash
end

Dado('que iniciei a compra do item {string}') do |name|
    @home.buy(name)
end
EncodingError

Quando('inicio a compra desse item') do
    @home.buy(@product[:name])
end

Então('devo ver a página de checkout com os detalhes do produto') do
    @checkout.assertProductDetails(@product)
end

Então('o valor total da compra deve ser de {string}') do |total_price|
    @checkout.assertTotalPrice(total_price)
end

Então('devo ver um popup informando que o produto está indisponível') do
    @home.assertErrorMessage
end

Quando('faço a busca do seguinte CEP: {string}') do |zip_code|
    @checkout.searchZipCode(zip_code)
end

Quando('informo os demais dados do endereço:') do |additional_data|
    @address = additional_data.rows_hash

    @checkout.fillAddress(@address)
  end
  
Quando('seleciono a forma de pagamento {string}') do |payment_type|
    @payment = payment_type
    @checkout.selectPayment(payment_type)
end

Quando('confirmo o pedido') do
    @checkout.confirmOrder
end

Então('meu pedido é confirmado') do
    @checkout.viewSuccessfullMessage(@payment)
end