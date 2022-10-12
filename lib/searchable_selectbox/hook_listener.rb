module SearchableSelectbox
  class HookListener < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(context)
      return '' unless Setting.plugin_redmine_searchable_selectbox['enabled']

      tags =
        stylesheet_link_tag("select2.min", :plugin => "redmine_searchable_selectbox") +
        stylesheet_link_tag("searchable_selectbox", :plugin => "redmine_searchable_selectbox") +
        javascript_include_tag("select2.full.min.js", :plugin => "redmine_searchable_selectbox") +
        javascript_include_tag("searchable_selectbox.js", :plugin => "redmine_searchable_selectbox")
      tags += javascript_tag('var enabledMultipleSelectboxSearchable = true;') if Setting.plugin_redmine_searchable_selectbox['enabled_multiple_selectbox'].to_i == 1
      tags
    end
  end
end
