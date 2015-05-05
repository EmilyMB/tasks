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
});
