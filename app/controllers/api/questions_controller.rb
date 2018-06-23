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
        beef = Dish.with_name_translation("Boeuf", :fr).first
        beef.name_en = "Beef"
        beef.save()

        poultry = Dish.with_name_translation("Volaille", :fr).first
        poultry.name_en = "Poultry"
        poultry.save()

        gambas = Dish.with_name_translation("Gambas", :fr).first
        gambas.name_en = "Prawns"
        gambas.save()


        # Starters
        tuna = Starter.with_name_translation("Tataki de thon", :fr).first
        tuna.name_en = "Tuna Tataki"
        tuna.description_en = "Served with a seaweed salad, apple and lemon confit"
        tuna.save()

        duck = Starter.with_name_translation("Tarte fine de canard", :fr).first
        duck.name_en = "Tarte fine de canard"
        duck.description_en = "Gésiers, magret fumé & foie gras de canard, mashed vegetables and pickles"
        duck.save()

        thai = Starter.with_name_translation("Bouillon Thaï", :fr).first
        thai.name_en = "Hot Thaï Borth"
        thai.description_en = "Hot Thaï Borth with dices of salmon"
        thai.save()

        poke = Starter.with_name_translation("Poke Bowl", :fr).first
        poke.name_en = "Poke Bowl"
        poke.description_en = "Poke Bowl vegan"
        poke.save()


        # Cooking methods
        papi = Baking.with_name_translation("Papillote", :fr).first
        papi.name_en = "Papilotte"
        papi.ingredient_en = "Sous-vide vegetables (Potatoes, carrot, onions, celery, red peppers)"
        papi.save()

        fusio = Baking.with_name_translation("Fusio", :fr).first
        fusio.name_fr = "Fusio Eberhardt Frères"
        fusio.name_en = "Fusio Eberhardt Frères"
        fusio.ingredient_en = "Crisp Vegetables (potatoes, sweet potatoes, carrot and celery)"
        fusio.save()

        wok = Baking.with_name_translation("Wok", :fr).first
        wok.ingredient_en = "Noodles, vegetables and soja sauce"
        wok.save()


        # Marinades
        m1 = Marinade.where(baking: papi, dish: beef).first
        m1.description_en = "Marinade of saté sauce and paprik"
        m1.save()

        m2 = Marinade.where(baking: papi, dish: poultry).first
        m2.description_en = "marinade of saté sauce and paprik"
        m2.save()

        m3 = Marinade.where(baking: papi, dish: gambas).first
        m3.description_en = "Marinade of saté sauce and paprika"
        m3.save()

        m4 = Marinade.where(baking: fusio, dish: beef).first
        m4.description_en = "Marinade of olive oil, garlic and thyme"
        m4.save()

        m5 = Marinade.where(baking: fusio, dish: poultry).first
        m5.description_en = "Marinade of olive oil, garlic and thyme"
        m5.save()

        m6 = Marinade.where(baking: fusio, dish: gambas).first
        m6.description_en = "Marinade of olive oil, garlic and thyme"
        m6.save()

        # Desserts
        parfait = Dessert.with_name_translation("Patate douce et ananas dans un parfait assemblage", :fr).first
        parfait.name_en = "Sweet potatoes and Pineapple match togethe"
        parfait.description_en = "coco nuts, pineapples & sweet potatoes"
        parfait.save()

        panais = Dessert.with_name_translation("Panais confit à la façon d'une crème brûlée", :fr).first
        panais.name_en = "Crème brulée filled with Parsnip"
        panais.description_en = "parsnip & chervil"
        panais.save()

        mille = Dessert.with_name_translation("Poivron rouge en crémeux, monté comme un 1000 feuilles", :fr).first
        mille.name_en = "Red pepper and cream, brought up like a mille-feuilles"
        mille.description_en = "vanilla, banana & peppers"
        mille.save()

        cake = Dessert.with_name_translation("Carotte cake, agrumes et petits pois", :fr).first
        cake.name_en = "Carrot cake, citrus and french peas"
        cake.description_en = "carrot, citrus and french peas"
        cake.save()


        # Formulas
        f1 = FormulaTemplate.with_name_translation("Formule Entrée + Plat avec 2 Verres de Vin", :fr).first
        f1.wine_en = "2 Glasses of Wine"
        f1.save()

        f2 = FormulaTemplate.with_name_translation("Formule Plat + Dessert avec 2 Verres de Vin", :fr).first
        f2.wine_en = "2 Glasses of Wine"
        f2.save()

        f3 = FormulaTemplate.with_name_translation("Formule Entrée + Plat + Dessert avec 2 Verres de Vin et 1 Apéritif", :fr).first
        f3.wine_en = "2 Glasses of Wine"
        f3.save()
        render json: {}
    end


end
