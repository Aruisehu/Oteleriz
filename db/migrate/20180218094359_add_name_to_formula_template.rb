class AddNameToFormulaTemplate < ActiveRecord::Migration[5.1]
    def change
        add_column :formula_templates, :name_translations, :jsonb
        add_column :formula_templates, :has_wine, :boolean
    end
end
