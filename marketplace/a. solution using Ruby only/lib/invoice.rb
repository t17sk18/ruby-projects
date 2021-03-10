class Invoice
    attr_reader :scanCart

    def initialize(scanCart)
      @scanCart = scanCart
    end

    def total
        products = scanCart.map(&:product)
        subtotal = products.map(&:price).sum
        quantity = 0
        products.each do |p|
            if (p.code == '001')
                quantity = quantity + 1
            end
        end
        if quantity >= 2 || subtotal >= 60.0 
            promotionalOffer(quantity, subtotal)
        else
            total = subtotal
        end
    end

    def promotionalOffer(quantity, subtotal)
        productActualPrice = 0.0
        productOfferPrice = 0.0
        productFinalPrice = 0.0
        if quantity >=2
            productActualPrice = quantity * 9.25
            productOfferPrice = quantity * 8.50
            productFinalPrice = productActualPrice - productOfferPrice
        else
            productFinalPrice = 0.0
        end
        subtotal = subtotal - productFinalPrice
        if subtotal >= 60.0
            subtotal = subtotal - (subtotal * 10/100)
        end
        total = subtotal.round(2)
    end

    def message
        output = ""
        scanCart.each do |item|
            output << "#{item.message} \n"
        end
        output << "======================\n"
        output << "Total: #{total}\n"
        output << "======================\n\n"
    end
end