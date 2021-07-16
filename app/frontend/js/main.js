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

        $.ajax({
            type: "POST",
            url: url,
            data: {
                'loan[book_id]': book_id,
                'loan[user_id]': user_id,
                'loan[period]': period,
                'commit': 'Create Loan'
            },
            success: function (data){
                console.log(data)
                let book = data.loan.book,
                    user = data.loan.user,
                    period = new Date(data.loan.period);

                if (book.quantity > 0) {
                    $('#loan_book_id option[value='+ book.id +']').text(book.title + ' (' + book.quantity + ' available now)');
                    $('#loan_book_id').val(book.id);
                    $('#loan_user_id').val(user.id);
                    $('#loan_period').val('');
                } else if (book.quantity <= 0) {
                    $('#loan_book_id option[value='+ book.id +']').remove();
                }
            },
            dataType: 'json'
        });
    });
})