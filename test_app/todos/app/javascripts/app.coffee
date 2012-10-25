# This is your main javascript file. You can use write your entire application
# in this file if you like. Files are compiled into minispade modules
# based on the file name. All JS files inside "app/javascripts" are
# automatically prefixed with your application name. You can require
# this file like so:
#
#   require('todos/app')
#
# Files placed in "app/vendor/javascripts" are not prefixed at all.
# Say you downloaded jQuery to: "app/vendor/javascripts/jquery.min.js".
# You can require that code like so:
#
#   require('jquery')
#
# Any ".min" or version numbers are not included in the module name.
#
# This file makes all the code available. Your app is initialized in the
# boot file. Here's an example
#
#   require('jquery')
#   require('ember')
#   require('models')
#   require('views')
#   require('controllers')
#   require('helpers')
#
# Your application begins here...

Todos = Ember.Namespace.create
  createApp: ->
    app = Todos.App.create()
    $.each Todos, (key, value) ->
      app[key] = value if value && value.isClass && key != 'constructor'

    @app   = app

Todos.App = Em.Application.extend
  rootElement: $("#application"),
  initialize: ->
    router = Todos.Router.create()
    @_super(router)

Todos.ApplicationController = Ember.Controller.extend()
Todos.ApplicationView = Ember.View.extend
  templateName: 'todos/application'

Todos.Router = Ember.Router.extend
  enableLogging: true
  root: Ember.Route.extend
    index: Ember.Route.extend
      route: '/'

window.Todos = Todos
