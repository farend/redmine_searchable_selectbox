module SearchableSelectbox
  class HookListener < Redmine::Hook::ViewListener
    def view_layouts_base_html_head(context)
      return '' unless Setting.plugin_redmine_searchable_selectbox['enabled']

      stylesheet_link_tag("select2.min", :plugin => "redmine_searchable_selectbox") +
      stylesheet_link_tag("searchable_selectbox", :plugin => "redmine_searchable_selectbox") +
      javascript_include_tag("select2.full.min.js", :plugin => "redmine_searchable_selectbox") +
      javascript_include_tag("searchable_selectbox.js", :plugin => "redmine_searchable_selectbox")
    end
  end
end
