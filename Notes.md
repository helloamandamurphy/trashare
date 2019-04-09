Post-install message from i18n:

HEADS UP! i18n 1.1 changed fallbacks to exclude default locale.
But that may break your application.

Please check your Rails app for 'config.i18n.fallbacks = true'.
If you're using I18n (>= 1.1.0) and Rails (< 5.2.2), this should be
'config.i18n.fallbacks = [I18n.default_locale]'.
If not, fallbacks will be broken in your app by I18n 1.1.x.

For more info see:
https://github.com/svenfuchs/i18n/releases/tag/v1.1.0

MODELS:
-User (Sign Up, Login)
-Request (CRUD)
-Give (CRUD)

Optional Additional Models:
-Make (CRUD) I don't think this is necessary for now.
-Tags (optional fifth model)

class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.text :address
      t.integer :user_id
      t.string :tags
      t.datetime :post_time
    end
  end
end

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :first_name
      t.string :last_name
    end
  end
end
