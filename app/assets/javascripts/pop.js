var backHTML = ''; //Keep a reference of last viewed div
var currentStep = ''; //Keep track of the current step in the signup process
// This blocks the background and shows the div as a sudo popup for interaction
function showpopup(selector){
    $(selector).modal({
        overlayId: 'osx-overlay',
        closeHTML: null,
        opacity: 50, 
        position:[75,],
        overlayClose: true,
    });
}

/* pop refer a friend box */
$('a#refer-friend').live('click',function(e){
    showpopup('#refer-friend-box');
});

/* pop-signup box */
$('a#pop-signup').live('click',function(e){
    showpopup('#signup-account-type');
});

/* pop corresponding next step, either personal or company signup */
$('#pop-account-related-form').live('click', function(e){
    backHTML = $('#signup-account-type').html(); 
    currentStep = 'personal_information'
    if($('#account_personal').is(':checked')) {
        //replace html in the div
        $('#signup-account-type').html($('#personal-information').html());  
    }
    else if($('#account_company').is(':checked')) { 
        $('#signup-account-type').html($('#company-information').html()); 
    }
    else{ alert('Please select an account type before continuing'); }
});

/* back to signup account type */
$('a.back-up-form').live('click', function(e){
    if( currentStep == 'personal_information' ){
        $('#signup-account-type').html(backHTML);   
    }
    else if( currentStep == 'personal_mobile_information' ){
        currentStep = 'personal_information';
        $('h2#form-title').html("Personal Information");
        $('div#personal-details').removeClass('hide');
        $('div#personal-mobile-information').addClass('hide');
        $('div#personal-security-information').addClass('hide');  
        $('div#create-user-button').addClass('hide');  
        $('h4#signup-next-button').html('<a href="#" class="btnYellow" id="pop-personal-mobile-form">NEXT</a>');
    }
    else if( currentStep == 'personal_security_information' ){
        currentStep = 'personal_mobile_information';
        $('h2#form-title').html("Mobile Information");
        $('div#personal-details').addClass('hide');
        $('div#personal-mobile-information').removeClass('hide');
        $('div#personal-security-information').addClass('hide'); 
        $('div#create-user-button').addClass('hide');
        $('h4#signup-next-button').html('<a href="#" class="btnYellow" id="pop-security-form">NEXT</a>');  
    }
    //alert("youp");
});

/* pop personal mobile info form */
$('#pop-personal-mobile-form').live('click', function(e){
    currentStep = 'personal_mobile_information';
    $('h2#form-title').html("Mobile Information");
    $('div#personal-details').addClass('hide');
    $('div#personal-mobile-information').removeClass('hide');
    $('div#personal-security-information').addClass('hide');
    $('div#create-user-button').addClass('hide');
    $('h4#signup-next-button').html('<a href="#" class="btnYellow" id="pop-security-form">NEXT</a>');
   //$('#signup-account-type').html($('#personal-mobile-information').html()); 
});

/* pop personal mobile info form */
$('#pop-security-form').live('click', function(e){
    currentStep = 'personal_security_information';
    $('h2#form-title').html("Security Information");
    $('div#personal-details').addClass('hide');
    $('div#personal-mobile-information').addClass('hide');
    $('div#personal-security-information').removeClass('hide');
    $('h4#signup-next-button').html('');
    $('div#create-user-button').removeClass('hide');
   //$('#signup-account-type').html($('#personal-mobile-information').html()); 
});