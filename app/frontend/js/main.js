$(document).ready(function(){
  $('#books_filters_button').click(function (){
     let filter_author = $('#filter_author').val(),
         filter_title = $('#filter_title').val();

      window.location.replace('/books?filter_author=' + filter_author + '&filter_title=' + filter_title)
  });

    $('#ajax_loan').click(function (){
        let book_id = $('#loan_book_id').val(),
            user_id = $('#loan_user_id').val(),
            date = new Date($('#loan_period').val()),
            day = date.getDate(),
            month = date.getMonth() + 1,
            year = date.getFullYear(),
            period = ([year, month, day].join('-')),
            url = '/loans';

        console.log('Check Book: ' + book_id);
        console.log('Check User: ' + user_id);
        console.log('Check Period: ' + period);

        $.ajax({
            type: "POST",
            url: url,
            data: {
                'loan[book_id]': book_id,
                'loan[user_id]': user_id,
                'loan[period]': period,
                'commit': 'Create Loan'
            },
            success: function (){
                console.log('Success!')
            },
            dataType: 'json'
        });
    });
})