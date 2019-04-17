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
[x] User (Sign Up, Login)
[] Request (CRUD) Currently not working--can't figure out debugging on my own for now, will ask for help this week.
[x] Give (CRUD)

Optional Additional Models:
[x] Create (CRUD) I don't think this is necessary for now.
[] Tags (optional fifth model) Request/Donation/Creation has many and Tags have many posts

Concerns:
-Marketplace: users instance variable loads all users...how would I load only the users needed?
-Flash messages aren't currently working...why?
-Time stamps...how do I change this from posted time to posted ___ time ago?
https://stackoverflow.com/questions/34548355/ruby-calculate-time-difference-between-2-times
