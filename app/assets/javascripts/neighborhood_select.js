jQuery(function() {
  var neighborhoods;
  $('#stamp_neighborhood_id').parent().hide();
  neighborhoods = $('#stamp_neighborhood_id').html();
  return $('#stamp_city_id').change(function() {
    var city, escaped_city, options;
    city = $('#stamp_city_id :selected').text();
    escaped_city = city.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1');
    options = $(neighborhoods).filter("optgroup[label='" + escaped_city + "']").html();
    if (options) {
      $('#stamp_neighborhood_id').html(options);
      return $('#stamp_neighborhood_id').parent().show();
    } else {
      $('#stamp_neighborhood_id').empty();
      return $('#stamp_neighborhood_id').parent().hide();
    }
  });
});