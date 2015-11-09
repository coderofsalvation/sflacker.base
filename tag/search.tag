<search>
  <div class="mdl-textfield mdl-js-textfield">
    <input class="mdl-textfield__input" onkeyup={ @.onkeyup } type="text" id="search" placeholder="" value="{@.value}"/>
  </div>

  <script type="coffee">
    me = @.opts.me

    @.onkeyup = (e) ->
      for output in me.output
        output.get({q:e.target.value})
  </script>
</search>
