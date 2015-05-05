$(document).ready(function() {
  $('#mark-complete').on('click', function() {
    var id = $(this).parents('tr').attr('id');
    $.ajax({
      method: "PUT",
      url: "/tasks/" + id,
      data: { task: { complete: true } },
      success: function() {
        this.remove();
      },
      error: function (errormessage) {
        console.log("Something didn't work");
        console.log("this is: " + this);
      }
    });
  });

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
