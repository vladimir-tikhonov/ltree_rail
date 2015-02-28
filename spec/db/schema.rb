ActiveRecord::Schema.define do
  self.verbose = false

  enable_extension 'ltree'

  create_table :categories, force: true do |t|
    t.string :name
    t.integer :parent_id
    t.ltree :path
  end
end
