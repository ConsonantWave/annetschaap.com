var boxStatus = -1; // 0 for hidden, 1 for shown

$(document).ready(function() {
    $('#contentbox').css('top', -900);
    $('#contentfooter').hide();
    boxStatus = 0;
    changeMapCursors('pointer');
    activateLinks();
    $('.activeLink').removeAttr('href');
    loginSetup();
});

// sets up the admin login dealie at the top right
function loginSetup() {
    var loginShown = $('#loginShown');
    loginShown.hide();
    var loginHidden = $('#loginHidden');
    loginHidden.css('cursor', 'pointer');
    loginHidden.click(function() {
       loginHidden.hide();
       loginShown.show();
    });    
}

// changes image map cursors to specified style
function changeMapCursors(cursorStyle) {
    $('#bgwrapper map area').each(function() {
        this.style.cursor = cursorStyle;
    });
}

function activateLinks() {
    $('.activeLink').click(clickActiveLink);
}

// onclick function for active links
function clickActiveLink() {
    var splitID = this.id.split("_");
    replaceContent(splitID[1] + "/" + splitID[2], this.title);
    if (boxStatus == 0) {
        showBox();
    }    
}

// replace content within the box
function replaceContent(page, title) {
    $('#content').hide();
    $('#contentfooter').hide();
    $('#loader').fadeIn(500, function() {
        $('#container').load(page + " #content", function() {
            $('#content').hide();
            $('#loader').fadeOut(500, function (){
                $('#content').fadeIn(500);
                $('#contentfooter').fadeIn(500);
            });
        });        
    });
    document.title = "annetschaap.com: " + title;
}

function activateFooter() {
    var footer = $('#contentfooter');
    footer.css('cursor', 'pointer');
    footer.click(function() {
        hideBox();
        footer.css('cursor', 'default');
    });
}

function showBox() {
    if (boxStatus == 0) {
        changeMapCursors('default');
        slideBox('+=900', function() {
            $('#contentfooter').fadeIn(200);
            activateFooter();
        });
        boxStatus = 1;
    }
}

function hideBox() {
    if (boxStatus == 1) {
        slideBox('-=900', function() {
            $('#contentfooter').hide();
        });
        changeMapCursors('pointer');
        document.title = "annetschaap.com: Annet Schaap Illustrations";
        boxStatus = 0;
    }
}

function slideBox(topParam, callback) {
    $('#contentwrapper').animate(
        { top: topParam },
        2000,
        callback
    );
}