$(document).ready(function(){
  $('#books_filters_button').click(function (){
     let filter_author = $('#filter_author').val(),
         filter_title = $('#filter_title').val(),
         url = '/books';

      // $.ajax({
      //     url: url,
      //     data: {
      //         filter_author: filter_author,
      //         filter_title: filter_title
      //     },
      //     success: function (){
      //         console.log('Cool!')
      //     },
      //     dataType: 'json'
      // });

      window.location.replace('/books?filter_author=' + filter_author + '&filter_title=' + filter_title)
  });
})