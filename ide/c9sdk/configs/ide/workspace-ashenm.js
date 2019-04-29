'use strict';

module.exports = function (options) {

  var config;
  var excludes;

  // remove all runners
  options.runners = {};

  // remove following plugins
  excludes = {
    "plugins/c9.ide.collab/chat/chat": true,
    "plugins/c9.ide.collab/collabpanel": true,
    "plugins/c9.ide.collab/members/members": true,
    "plugins/c9.ide.collab/members/members_panel": true,
    "plugins/c9.ide.collab/notifications/notifications": true,
    "plugins/c9.ide.collab/share/share": true,
    "plugins/c9.ide.welcome/welcome": true
  };

  // construct new configuration
  config = require('./default')(options).filter(function (p) {

    // ignore excludes
    if (excludes[p.packagePath]) {
      return false;
    }

    // default flat theme
    if (p.packagePath === 'plugins/c9.ide.layout.classic/preload') {
      p.defaultTheme = 'flat-light';
      return true;
    }

    return true;

  });

  return config;

};
