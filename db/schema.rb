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

ActiveRecord::Schema.define(:version => 20121021225841) do

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
    t.integer  "location_id",                     :null => false
    t.integer  "mileage",                         :null => false
  end

  create_table "cars_features", :force => true do |t|
    t.integer "car_id",     :null => false
    t.integer "feature_id", :null => false
  end

  add_index "cars_features", ["car_id", "feature_id"], :name => "index_cars_features_on_car_id_and_feature_id", :unique => true

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
    t.string   "email",                                  :null => false
    t.datetime "verified_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
  end

  add_index "emails", ["email"], :name => "index_emails_on_email", :unique => true
  add_index "emails", ["reset_password_token"], :name => "index_emails_on_reset_password_token", :unique => true

  create_table "features", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "features", ["name"], :name => "index_features_on_name", :unique => true

  create_table "locations", :force => true do |t|
    t.string  "postal_code",  :null => false
    t.string  "city",         :null => false
    t.string  "county"
    t.string  "state_code",   :null => false
    t.string  "country_code", :null => false
    t.string  "timezone"
    t.float   "latitude",     :null => false
    t.float   "longitude",    :null => false
    t.string  "region"
    t.integer "population"
  end

  create_table "logos", :force => true do |t|
    t.integer  "manufacturer_id", :null => false
    t.string   "url",             :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "manufacturers", :force => true do |t|
    t.string   "name",                        :null => false
    t.string   "url_name",                    :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.text     "description", :default => "", :null => false
  end

  add_index "manufacturers", ["url_name"], :name => "index_manufacturers_on_url_name", :unique => true

  create_table "messages", :force => true do |t|
    t.integer  "car_id",       :null => false
    t.integer  "recipient_id", :null => false
    t.text     "text",         :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

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
    t.string   "name",                        :null => false
    t.string   "url_name",                    :null => false
    t.integer  "make_id",                     :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.text     "description", :default => "", :null => false
  end

  add_index "models", ["url_name"], :name => "index_models_on_url_name", :unique => true

  create_table "photos", :force => true do |t|
    t.integer  "car_id",                        :null => false
    t.string   "thumbnail_url", :limit => 1024, :null => false
    t.string   "url",           :limit => 1024, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

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
