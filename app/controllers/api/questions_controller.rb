module Api
end

class Api::QuestionsController < ApplicationController

    def last_meal
        @order = Order.where(email: params[:email])
            .includes(:service, formulas: [:dish, :starter, :dessert, :formula_template])
            .order("services.start_time desc")
            .first
        if @order.blank?
            render json: {}, status: :not_found
        else
            render json: @order,
                include: [formulas: {
                include: [:dish, :dessert, :starter, :formula_template],
                only: [:roasting]
            }],
            except: [:newsletter, :confirmed, :group_id, :service_id]
        end
    end

    def create
        render json: {}, status: :ok
    end

    def updatedb
        # Dishes
        beef = Dish.with_name_translation("Boeuf", :fr)
        poultry = Dish.with_name_translation("Volaille", :fr)
        gambas = Dish.with_name_translation("Gambas", :fr)

        # Cooking methods
        papi = Baking.with_name_translation("Papillote", :fr)
        fusio = Baking.with_name_translation("Fusio Eberhardt Frères", :fr)

        m1 = Marinade.where(baking: papi, dish: beef).first
        m1.name_en = "Marinade of saté sauce and paprika"
        m1.save

        m2 = Marinade.where(baking: papi, dish: poultry).first
        m2.name_en = "Marinade of coconut milk and curry"
        m2.save

        m3 = Marinade.where(baking: papi, dish: gambas).first
        m3.name_en = "Marinade of ginger and lime juice"
        m3.save

        m4 = Marinade.where(baking: fusio, dish: beef).first
        m4.name_en = "Marinade of olive oil, garlic and thyme"
        m4.save

        m5 = Marinade.where(baking: fusio, dish: poultry).first
        m5.name_en = "Marinade of olive oil and lime juice"
        m5.save

        m6 = Marinade.where(baking: fusio, dish: gambas).first
        m6.name_en = "Marinade of olive oil and Martini Rosso"
        m6.save

        render json: {}
    end
end
