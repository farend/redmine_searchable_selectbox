require File.expand_path('../lib/searchable_selectbox/hook_listener', __FILE__)
require File.expand_path('../lib/searchable_selectbox/patches/my_helper_patch', __FILE__)

Redmine::Plugin.register :redmine_searchable_selectbox do
  name 'Redmine Searchable Selectbox'
  description "This plugin changes Redmine's selectbox searchable."
  version '0.1.10'

  settings default: {'enabled' => 1}, partial: 'settings/searchable_selectbox_settings'
end

Rails.configuration.to_prepare do
  unless MyHelper.included_modules.include?(SearchableSelectbox::Patches::MyHelperPatch)
    MyHelper.prepend(SearchableSelectbox::Patches::MyHelperPatch)
  end
end
