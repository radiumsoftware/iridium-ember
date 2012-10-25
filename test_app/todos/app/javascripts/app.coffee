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

Todos = Em.Application.create
  rootElement: $("#application")

Todos.View = Ember.View.extend
  # override templateForName to look in this application's
  # namespace. Example: app/templates/application.hbs can
  # be accessed using: templateName: 'application' even 
  # though it's stored as 'todos/application'
  templateForName: (name, type) ->
    return unless name

    namespace = @constructor.toString().split('.')[0].underscore()

    templates = Ember.get @, 'templates'
    template = Ember.get templates, "#{namespace}/#{name}"

    if !template
      throw new Ember.Error(fmt('%@ - Unable to find %@ "%@".', [@, type, name]))

    return template

Todos.ApplicationController = Ember.Controller.extend()
Todos.ApplicationView = Todos.View.extend
  templateName: 'application'

Todos.Router = Ember.Router.extend
  enableLogging: true
  root: Ember.Route.extend
    index: Ember.Route.extend
      route: '/'

window.Todos = Todos
