// Replace with select2 when the HTTP status of ajax request is a success.
// (by pure jquery)
$(document).ajaxSuccess(function() { console.log('ajaxSuccess');replaceSelect2() });
// Replace with select2 when the HTTP status of data-remote request is a success.
// (by rails-ujs)
$(document).on('ajax:success', function() { console.log('ajax:success');replaceSelect2() });

$(function() {
  // Replace with select2 when loading page.
  replaceSelect2();

  // Supports change of select box by filter function
  if ($('#query_form_with_buttons').length > 0 || $('form#query-form').length > 0) {
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