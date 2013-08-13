logDebug = false

saveText = ->
	console.log "save text"

debouncedSave = _.debounce(saveText, 500)

$(".container").keyup debouncedSave


# Message = Backbone.Model.extend
#   defaults:
#     message: ''

# MessagesCollection = Backbone.Collection.extend
#   model: Message
#   url: '/api/messages.json'
#   # localStorage: new Store('messages')

# Messages = new MessagesCollection([])
# Messages.fetch()

# HistoryView = Backbone.View.extend
#   el: '#history'
#   template: _.template( $('#messages-template').html() )
#   render: ->
#     @$el.html( @template( {messages: Messages.toJSON()} ) )
#     this
#   initialize: ->
#     @listenTo(Messages, 'reset', @redo)
#     @listenTo(Messages, 'add', @redo)
#     @listenTo(Messages, 'remove', @redo)
#     @listenTo(Messages, 'create', @redo)
#   redo: ->
#     @$el.html("")
#     @render()

# InputView = Backbone.View.extend
#   el: '#message'
#   template: _.template( $('#message-template').html() )
#   events: ->
#     'keypress #message-input': 'keypress'
#   render: ->
#     @$el.html( @template() )
#     @$messageInput = $("#message-input")
#     this
#   initialize: ->
#   createMessage: ->
#     console.log "input", @$messageInput.val() if logDebug
#     Messages.create({
#       message: @$messageInput.val()
#       createdAt: new Date()
#     })
#     @$messageInput.val("").focus()
#   keypress: (e) ->
#     return if e.which isnt ENTER_KEY
#     @createMessage()

# historyView = new HistoryView()
# historyView.render()

# inputView = new InputView()
# inputView.render()
