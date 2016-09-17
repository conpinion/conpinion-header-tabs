renderInstance = null
tabs = []

Polymer

  is: 'conpinion-header-tabs'

  properties:
    render: {type: Boolean, value: false}
    router: {type: Object}
    selected: {type: String}

  ready: ->
    renderInstance = @ if @render
    tabs = Polymer.dom(@).querySelectorAll 'conpinion-header-tab' unless @render
    renderInstance.updateTabs() if renderInstance

  updateTabs: ->
    @tabs = tabs
    @async =>
      tmp = @selected
      @selected = null
      @selected = tmp
    , 1

  route: (e) ->
    route = e.detail.item.getAttribute 'data-route'
    @router.go route if route
