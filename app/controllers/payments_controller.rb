class PaymentsController < ApplicationController
    before_action :set_order

    def lyfpay
        @payment = Payment.create(status: "ONGOING")
        shop_lyfpay_id = LyfPay::Configuration.client_id
        shop_lyfpay_key = LyfPay::Configuration.client_secret
        add_data="{callBackUrl:"+callback_payment_url(@order)+"}"
        digest = OpenSSl::Digest.new("sha1")
        hmac = OpenSSL::HMAC.new(shop_lyfpay_key, digest)
        lyf_params = {
            lang: 'fr',
            version: 'v2.0',
            timestamp: Time.now.to_i,
            posUuid: shop_lyfpay_id,
            shopReference: @order.lyfpay_reference,
            shopOrderReference: @payment.lyfpay_reference,
            deliveryFeesAmount: 0,
            amount: @order.total_price,
            currency: "EUR",
            mode: "IMMEDIATE",
            onSuccess: CGI::escape(sucess_payment_path(@order)),
            onError: CGI::escape(error_payment_path(@order)),
            onCancel: CGI::escape(cancel_payment_path(@order)),
            additionalData: Base64.encode64(add_data),
            enforcedIdentification: false
        }
        lyf_params["mac"] = hmac.update(mac_source).upcase

        HTTParty.post(LyfPay::Configuration.url, body: lyf_params.to_json, header: { 'Content-Type' => 'application/json', 'Accept' => 'application/json'})

        redirect_to callback_payment_path(@order)
    end

    def success

    end

    def callback

    end

    def error

    end

    def cancel

    end

    private

    def set_order
        @order = Order.find(params[:id])
    end

    def mac_source(opts, add_data)
        "%s*%s*%s*%s*%s*%s*%s*%s*%s*%s*%s*%s*%s*%s*%s" % [
            opts["lang"],
            opts["version"],
            opts["timestamp"],
            opts["posUuid"],
            opts["shopReference"],
            opts["shopOrderReference"],
            opts["deliveryFeesAmount"],
            opts["amount"],
            opts["currency"],
            opts["mode"],
            opts["onSuccess"],
            opts["onCancel"],
            opts["onError"],
            add_data,
            opts["enforcedIdentification"],
        ]
    end
end
