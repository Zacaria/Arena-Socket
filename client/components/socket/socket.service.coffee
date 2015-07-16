# global io

'use strict'

angular.module 'arenaApp'
.factory 'socket', (socketFactory) ->


# socket.io now auto-configures its connection when we omit a connection url
  ioSocket = io '',
# Send auth token on connection, you will need to DI the Auth service above
# 'query': 'token=' + Auth.getToken()
    path: '/socket.io-client'

  socket = socketFactory ioSocket: ioSocket

  socket: socket

  ###
  Register listeners to sync an array with updates on a model

  Takes the array we want to sync, the model name that socket updates are sent from,
  and an optional callback function after new items are updated.

  @param {String} modelName
  @param {Array} array
  @param {Function} callback
  ###
  syncUpdates: (modelName, pos, callback) ->
    console.log('init sync');
    ###
    Syncs item creation/updates on 'model:save'
    ###
    socket.on modelName + ':save', (item) ->

      console.log('save event')

#      callback? event, item, pos

    ###
    Syncs removed items on 'model:remove'
    ###
    socket.on modelName + ':remove', (item) ->
#      event = 'deleted'
#      _.remove array,
#        _id: item._id
      console.log('remove event')

      callback? event, item, array

    socket.emit 'join', modelName

  ###
  Removes listeners for a models updates on the socket

  @param modelName
  ###
  unsyncUpdates: (modelName) ->
    socket.removeAllListeners modelName + ':save'
    socket.removeAllListeners modelName + ':remove'
    socket.emit 'leave', modelName
