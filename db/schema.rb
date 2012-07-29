# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120713022529) do

  create_table "body_styles", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "url_name",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "body_styles", ["url_name"], :name => "index_body_styles_on_url_name", :unique => true

  create_table "car_alerts", :force => true do |t|
    t.integer  "email_id",    :null => false
    t.datetime "verified_at"
    t.text     "search",      :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cars", :force => true do |t|
    t.integer  "make_id",                         :null => false
    t.integer  "model_id",                        :null => false
    t.integer  "trim_id"
    t.integer  "poster_id",                       :null => false
    t.integer  "model_year_id",                   :null => false
    t.integer  "asking_price",                    :null => false
    t.integer  "condition_id",                    :null => false
    t.string   "vin",               :limit => 17
    t.text     "description",                     :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "interior_color_id",               :null => false
    t.integer  "exterior_color_id",               :null => false
    t.integer  "body_style_id",                   :null => false
    t.integer  "transmission_id",                 :null => false
  end

  create_table "colors", :force => true do |t|
    t.string   "name",       :null => false
    t.boolean  "external",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "colors", ["name", "external"], :name => "index_colors_on_name_and_external", :unique => true

  create_table "conditions", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "url_name",   :null => false
    t.boolean  "used",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "conditions", ["url_name"], :name => "index_conditions_on_url_name", :unique => true

  create_table "emails", :force => true do |t|
    t.string   "address",     :null => false
    t.datetime "verified_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "emails", ["address"], :name => "index_emails_on_address", :unique => true

  create_table "manufacturers", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "url_name",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "manufacturers", ["url_name"], :name => "index_manufacturers_on_url_name", :unique => true

  create_table "model_years", :force => true do |t|
    t.integer  "year",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "model_years", ["year"], :name => "index_model_years_on_year", :unique => true

  create_table "model_years_models", :force => true do |t|
    t.integer "model_id",      :null => false
    t.integer "model_year_id", :null => false
  end

  add_index "model_years_models", ["model_id", "model_year_id"], :name => "index_model_years_models_on_model_id_and_model_year_id", :unique => true

  create_table "models", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "url_name",   :null => false
    t.integer  "make_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "models", ["url_name"], :name => "index_models_on_url_name", :unique => true

  create_table "transmissions", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "trims", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "url_name",   :null => false
    t.integer  "make_id",    :null => false
    t.integer  "model_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "trims", ["url_name"], :name => "index_trims_on_url_name", :unique => true

end
