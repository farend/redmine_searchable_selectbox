require 'redmine'
require 'searchable_selectbox/hook_listener'
require 'searchable_selectbox/patches/my_helper_patch'

Redmine::Plugin.register :redmine_searchable_selectbox do
  name 'Redmine Searchable Selectbox'
  description "This plugin changes Redmine's selectbox searchable."
  version '0.1.5'

  settings default: {'enabled' => 1}, partial: 'settings/searchable_selectbox_settings'
end

Rails.configuration.to_prepare do
  unless MyHelper.included_modules.include?(MyHelperPatch)
    MyHelper.prepend(MyHelperPatch)
  end
end
