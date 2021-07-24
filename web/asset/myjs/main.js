$( "#addcompanyform" ).submit(function( event ) {
  event.preventDefault();
  i=0;
   if(!$("#companyName").val()){
      $("#name_error").text("please insert the company name");
  }else{
      i++;
      $("#name_error").text("");
  }
  if(!$("#Address").val()){
      $("#address_error").text("please insert the company address");
  }else{
      i++;
      $("#address_error").text("");
  }
  
 if(!$("#Telephone").val()){
      $("#telephone_error").text("please insert the company phone");
  }else{
      i++;
      $("#telephone_error").text("");
  }
  
  if(!$("#Email").val() || isEmail($("#Email").val())===false){
      $("#email_error").text("please insert a valid company email");
      
  }else{
      i++;
      $("#email_error").text("");
  }
  
  if(!$("#ContactName").val()){
      $("#contact_error").text("please insert the Contact name");
  } else{
     i++;
     $("#contact_error").text("");
  }
  
  if(i===5){
      $("#addcompanyform")[0].submit();
  }
   
  
});

$(window).on('load', function () {
        if (feather) {
            feather.replace({
                width: 14,
                height: 14
            });
        }
    })
    
    $(document).on("click", "#editbtn", function () {
     var id = $(this).data('id');
     var company_name = $(this).data('name');
     var adresse = $(this).data('adresse');
     var telephone = $(this).data('telephone');
     var email = $(this).data('email');
     var contact_name = $(this).data('contact');
     $(".editmodal #companyName").val( company_name );
     $(".editmodal #Address").val( adresse );
     $(".editmodal #Telephone").val( telephone );
     $(".editmodal #email").val( email );
     $(".editmodal #ContactName").val( contact_name );
     $(".editmodal #id").val(id);
});

function isEmail(email) {
  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  return regex.test(email);
}