# Dishes
beef = Dish.find_by(name_fr: "Boeuf")
beef.name_en = "Beef"
beef.save()

poultry = Dish.find_by(name_fr: "Volaille")
poultry.name_en = "Poultry"
poultry.save()

gambas = Dish.find_by(name_fr: "Gambas")
gambas.name_en = "Prawns"
gambas.save()


# Starters
tuna = Starter.find_by(name_fr: "Tataki de thon")
tuna.name_en = "Tuna Tataki"
tuna.description_en = "Served with a seaweed salad, apple and lemon confit"
tuna.save()

duck = Starter.find_by(name_fr: "Tarte fine de canard")
duck.name_en = "Tarte fine de canard"
duck.description_en = "Gésiers, magret fumé & foie gras de canard, mashed vegetables and pickles"
duck.save()

thai = Starter.find_by(name_fr: "Bouillon Thaï")
thai.name_en = "Hot Thaï Borth"
thai.description_en = "Hot Thaï Borth with dices of salmon"
thai.save()

poke = Starter.find_by(name_fr: "Poke Bowl")
poke.name_en = "Poke Bowl"
poke.description_en = "Poke Bowl vegan"
poke.save()


# Cooking methods
papi = Baking.find_by(name_fr: "Papillote")
papi.name_en = "Papilotte"
papi.ingredient_en = "Sous-vide vegetables (Potatoes, carrot, onions, celery, red peppers)"
papi.save()

fusio = Baking.find_by(name_fr: "Fusio")
fusio.name_fr = "Fusio Eberhardt Frères"
fusio.name_en = "Fusio Eberhardt Frères"
fusio.ingredient_en = "Crisp Vegetables (potatoes, sweet potatoes, carrot and celery)"
fusio.save()

wok = Baking.find_by(name_fr: "Wok")
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
parfait = Dessert.find_by(name_fr: "Patate douce et ananas dans un parfait assemblage")
parfait.name_en = "Sweet potatoes and Pineapple match togethe"
parfait.description_en = "coco nuts, pineapples & sweet potatoes"
parfait.save()

panais = Dessert.find_by(name_fr: "Panais confit à la façon d'une crème brûlée")
panais.name_en = "Crème brulée filled with Parsnip"
panais.description_en = "parsnip & chervil"
panais.save()

mille = Dessert.find_by(name_fr: "Poivron rouge en crémeux, monté comme un 1000 feuilles")
mille.name_en = "Red pepper and cream, brought up like a mille-feuilles"
mille.description_en = "vanilla, banana & peppers"
mille.save()

cake = Dessert.find_by(name_fr: "Carotte cake, agrumes et petits pois")
cake.name_en = "Carrot cake, citrus and french peas"
cake.description_en = "carrot, citrus and french peas"
cake.save()


# Formulas
f1 = FormulaTemplate.where(name_fr: "Formule Entrée + Plat avec 2 Verres de Vin")
f1.wine_en = "2 Glasses of Wine"
f1.save()

f2 = FormulaTemplate.where(name_fr: "Formule Plat + Dessert avec 2 Verres de Vin")
f2.wine_en = "2 Glasses of Wine"
f2.save()

f3 = FormulaTemplate.where(name_fr: "Formule Entrée + Plat + Dessert avec 2 Verres de Vin et 1 Apéritif")
f3.wine_en = "2 Glasses of Wine"
f3.save()

