class ScanItem
    attr_reader :product

    def initialize(product)
      @product = product
    end

    def message
        "#{product.name} @ £#{product.price}"
    end
end