function CarAlertSubscribeViewModel() {
  var self = this;

  self.toggleActive = function(data, event) {
    var $target = $(jQuery.event.fix(event).target);
    $target.parents('.car-alert-callout:first').toggleClass('disabled');
  };
};

