$(document).ajaxSuccess(function() { replaceSelect2() });
$(document).on('ajax:success', function() { replaceSelect2() });
$(function() {
  replaceSelect2();

  if ($('#query_form_with_buttons').length > 0) {
    var oldAddFilter = window.addFilter;
    window.addFilter = function(field, operator, values){
      oldAddFilter(field, operator, values);
      $('#filters-table select:not([multiple]):not(.select2-hidden-accessible)').select2();
      $('#select2-add_filter_select-container.select2-selection__rendered').text('');
    }

    var oldToggleMultiSelect = window.toggleMultiSelect;
    window.toggleMultiSelect = function(el){
      oldToggleMultiSelect(el);
      if (el.attr('multiple')) {
        el.select2('destroy');
      } else {
        el.select2();
      }
    }
  }
});

function replaceSelect2() {
  // TODO: Need to support replace of select according to the click event.
  // Do not replace it with select2 until it corresponds.
  if ($('body').hasClass('controller-workflows')) {
    return;
  } else {
    var selectInTabular = $('.tabular select:not([multiple]):not(.select2-hidden-accessible)');
    if (selectInTabular.length > 0) { selectInTabular.select2({ width: '85%' }); }

    var other = $('select:not([multiple]):not(.select2-hidden-accessible)');
    if (other.length > 0) { other.select2(); }
  }
}