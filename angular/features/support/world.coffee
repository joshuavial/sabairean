zombie = require 'zombie'

World = (callback) ->
  #this.browser will be available in step definitions
  this.browser = new zombie.Browser
    site : 'http://localhost:8000/app/index.html#/'

  this.visit = (uri, callback) ->
    this.browser.visit(uri, callback)

  this.clickLink = (link_text, callback) ->
    this.browser.clickLink(link_text).then ->
      callback()


  callback(this)

exports.World = World

