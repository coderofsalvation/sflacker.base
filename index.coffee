module.exports = ( (cfg)->

  @.graph = false
  @.cfg   = {}
  @.ohmygraph = require 'ohmygraph'
  @.jref = @.ohmygraph.jref
  @.loader = () -> console.log "no loader specificied" if @.cfg.opts.debug?

  @.init_graph = (graph) ->
    omg = @.ohmygraph.create graph, {baseurl: "https://api.github.com",verbose:2}
    omg.init.client()
    console.log "graph initialized \\o/" 
    @.graph = omg.graph

  @.start = (cfg) ->
    @.cfg = @.cfg
    console.dir JSON.parse JSON.stringify @.cfg if @.cfg.opts.debug?
    @.ohmygraph.jref.debug = true if @.cfg.opts.debug?
    @.ohmygraph.jref.reftoken = '@ref'
    @.ohmygraph.jref.pathtoken = '@'
    @.cfg.embed = @.ohmygraph.jref.resolve @.cfg.embed
    console.dir @.cfg.embed if @.cfg.opts.debug?
    @.init_graph @.cfg.embed.rest
    @.init_tags()

  @.init_tags = () ->
    for tag,uicomponent of @.cfg.embed.ui
      uicomponent.tagname = tag
      console.log "mounting tag "+tag if @.cfg.opts.debug?
      uicomponent.tag = riot.mount tag, {me:uicomponent,app:@}
      uicomponent.tag = uicomponent.tag[0] if uicomponent.tag.length
      #componentHandler.upgradeAllRegistered()

  @
).call({})
