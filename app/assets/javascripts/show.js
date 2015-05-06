$(document).ready(function() {
  $('.mark-complete').on('click', function() {
    changeStatus(this, true);
  });

  $('.mark-incomplete').on('click', function() {
    changeStatus(this, false);
  });

  function changeStatus(button, status) {
    console.log($(button).parent('td'));
    var id = $(button).parents('tr').attr('id');
    $.ajax({
      method: "GET",
      url: "/tasks/" + id + "/change_status",
      data: { task: { complete: status } },
      success: function() {

        console.log($(button).parent('td').prev());
        $(button).parent('td').prev().text(status);
        $(button).remove();
      },
      error: function (errormessage) {
        console.log("Something didn't work");
        console.log("this is: " + this);
      }
    });
  };

  $('#title-box').keyup(function(){
    var valThis = $(this).val().toLowerCase();

    if(valThis == ""){
      $('table > tr').show();
    } else {
      $('tr').each(function(){
        console.log($(this).text());
        var text = $(this).text().toLowerCase();
          $(this).attr('class') == 'head' || (text.indexOf(valThis) >= 0) ? $(this).show() : $(this).hide();
     });
   };
});
});
