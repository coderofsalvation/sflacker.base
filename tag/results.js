riot.tag('results', '<div id="loader">&nbsp;</div> <div id="listing"> <ul> <li each="{ @.items }"> <div each="{ k,v in data }"> {k} </div> </li> </ul> </div>', function(opts) {var load;

load = (function(_this) {
  return function(data) {
    _this.items = data;
    return _this.update();
  };
})(this);

this.on('mount', function() {
  var datasource, i, len, ref, results;
  ref = this.opts.data;
  results = [];
  for (i = 0, len = ref.length; i < len; i++) {
    datasource = ref[i];
    datasource.on('data', function(data) {
      return load(data);
    });
    results.push(datasource.get());
  }
  return results;
});

});
