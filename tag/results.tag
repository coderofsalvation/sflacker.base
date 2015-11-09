<results>
  <div id="loader">&nbsp;</div>
  <div>
    <ul id="searchresult">
      <li each={ @.items }>
        <b>
          <a href=''>{template.title}</a>
        </b>
      </li>
    </ul>
  </div>

  <script type="coffee">
   
    app = @.opts.app
    me  = @.opts.me
 
    onData = (data) =>
      @.loader.innerHTML = ''
      if not data[0]?
        @.searchresults.innerHTML = me.lang.en.no_search_result
      else
        for item in data
          item.template = @.opts.app.jref.evaluate me.template, item 
        console.dir data[0] if data[0]?
        @.items = data
        @.update() 

    load = () =>
      app.loader {el:@.loader}
      for datasource in me.data
        datasource.on 'data', (data) -> onData data
        datasource.get() 

    @.on 'mount', () ->
      load()

  </script>
</results>
