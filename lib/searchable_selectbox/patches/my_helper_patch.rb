require_dependency 'my_helper'

module MyHelperPatch
  def self.prepended(base)
    base.send(:prepend, InstanceMethods)
  end

  module InstanceMethods
    # Run replaceSelect2(); when remove_block.js.erb
    def block_select_tag(user)
      super(user) +
      javascript_tag do
        '$(function(){replaceSelect2();});'
      end
    end
  end
end