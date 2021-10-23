//= require websocket_rails/main

$(document).ready(function() {
    alert('come here');
    
    $('.carousel').carousel({
        interval: 2000
    });
    $('.actions-dialog > div').click(function() {
        console.log('jjj->');
    });
    
    $('.type-filter').click(function() {
        console.log('clicked->');
    });


    $('.filter-search').click(function() {
        console.log('clicked->');
    });

    $('.filter-search').on('click', function() {
        alert('test');
    });
});

const filter_search = document.getElementByClass('filter-search');
filter_search.addEventListener('click', function() {
console.log('clicked->');
});
console.log('aa')
