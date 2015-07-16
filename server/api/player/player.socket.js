/**
 * Created by Zacaria on 16/07/2015.
 */
'use strict';

exports.register = function(socket){
  socket.on('player:save', function(data){
    console.log('received save', data);
    //socket.emit('player:update', data);
  });
};
