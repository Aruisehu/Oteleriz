module LyfPay
    module Configuration
        def self.url
            ENV["RAILS_ENV"] == "production" ? "https://webpos.lyf.eu/fr/plugin/Payment.aspx" : "https://sandbox‐webpos.lyf.eu/fr/plugin/Payment.aspx"
        end

        def self.client_id
            ENV["LYFPAY_CLIENT_ID"]
        end

        def self.client_secret
            ENV["LYFPAY_CLIENT_SECRET"]
        end
    end
end
