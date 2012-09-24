var DOMHelper;

DOMHelper = (function() {

  function DOMHelper() {}

  DOMHelper.clearElement = function(el) {
    $(el).unbind();
    return $(el).empty();
  };

  return DOMHelper;

})();
