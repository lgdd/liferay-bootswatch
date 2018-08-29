AUI().ready(
  'liferay-sign-in-modal',
  function (A) {
    var BODY = A.getBody();

    var signIn = A.one('#sign-in');

    if (signIn && signIn.getData('redirect') !== 'true') {
      signIn.plug(Liferay.SignInModal);
    }

    var fullScreenToggleIcon = A.one(
      '.full-screen-navigation #banner .navbar-header .navbar-toggle');

    if (fullScreenToggleIcon) {
      fullScreenToggleIcon.on(
        'click',
        function (event) {
          BODY.toggleClass('main-nav-opened', event.currentTarget.hasClass('collapsed'));
        }
      );
    }

    if ($('#ControlMenu').length > 0) {
      $('#navigation').css('margin-top', '65px');
      $('#content').css('margin-top', '65px');
    } else {
      $('#navigation').css('margin-top', '0');
      $('#content').css('margin-top', '0');
    }
  }
);