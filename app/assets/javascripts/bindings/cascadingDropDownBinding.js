ko.bindingHandlers.cascadingDropDown = {
    init: function(element, valueAccessor, allBindingsAccessor) {
        allBindings = allBindingsAccessor();
        var $this = $(element);
        var url = allBindings.url;
        var value = allBindings.valueProperty || 'id';
        var display = allBindings.displayProperty || 'name';
        var exprRegex = /(\#\{[^\}].+?\})/g;

        var $parentDropDown = $(valueAccessor());
        $parentDropDown.change(function() {
           var $parent = $(this);

            // if no value
            if ($parent.val() === '') {
                // disable and reset value
                $this.attr('disabled', 'disabled');
                $this.val('');
            }
            else {
                var $default = null;
                $this.find('option').each(function(idx, opt){
                    var $opt = $(opt);

                    if ($opt.attr('value') == '') {
                        $default = $opt;
                    }
                });
                $this.find('option').remove();

                if ($default != null) {
                    $this.append($default);
                }

                var unescaped_url = unescape(url);
                var actual_url = '';

                $.each(unescaped_url.split(exprRegex), function(idx, str) {
                    if (exprRegex.test(str)) {
                        actual_url += eval(str.slice(2, str.length - 1));
                    }
                    else {
                        actual_url += str;
                    }
                });

                $.ajax({
                  url: actual_url,
                  dataType: 'json',
                  success: function(data) {
                      $.each(data, function(idx, item) {
                        var $opt = $('<option />');
                        $opt.attr('value', item[value]);
                        $opt.html(item[display]);

                        $this.append($opt);
                      });

                      // re-enable and reset value
                      $this.removeAttr('disabled');
                      $this.val('');
                  }
                });
            }
        });
    },
    update: function(element, valueAccessor, allBindingsAccessor) {

    }
};