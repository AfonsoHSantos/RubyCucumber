#language: pt

Funcionalidade: Realizar pedido
    Como um usuário do site, eu quero escolher e comprar um café

@temp
Cenário: Checkout completo
    Dado que estou na página principal da Starbugs
        E que iniciei a compra do item "Expresso Tradicional"
    Quando faço a busca do seguinte CEP: "56440000"
        E informo os demais dados do endereço: 
            | Numero      | 274                |
            | Complemento | Próximo ao mercado |
        E seleciono a forma de pagamento "Cartão de Crédito"
        E confirmo o pedido
    Então meu pedido é confirmado