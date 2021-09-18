//= require websocket_rails/main

$(document).ready(function() {
    $('.carousel').carousel({
        interval: 2000
    });
    $('.actions-dialog > div').click(function() {
        console.log('jjj->');
    });
    
    $('.type-filter').click(function() {
        console.log('clicked->');
    });
});