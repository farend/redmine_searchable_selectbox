require 'redmine'
require 'searchable_selectbox/hook_listener'

Redmine::Plugin.register :redmine_searchable_selectbox do
  name 'Redmine Searchable Selectbox'
  description "This plugin changes Redmine's selectbox searchable."
  version '0.1.0'

  settings default: {'enabled' => 1}, :partial => 'settings/searchable_selectbox_settings'
end
