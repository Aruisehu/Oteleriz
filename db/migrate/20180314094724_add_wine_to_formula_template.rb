class AddWineToFormulaTemplate < ActiveRecord::Migration[5.1]
    def change
        add_column :formula_templates, :wine_translations, :jsonb
    end
end
