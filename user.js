/* ========================================================


*** COPIED FROM: https://bitbucket.org/mrbbking/quieter-firefox/src/master/ ***

   For Kali Linux download latest release of firefox to use as the Burp Suite
   browser.  This way you are able to run two browsers at the same time.  One
   for Burp Suite "hacking" and another for browsing the internet.
   Start Kali Firefox ESR first, then launch the latest release with the
   following command.  (may need to adjust depending where you unpack
   the latest version)

   /root/Downloads/firefox/firefox --ProfileManager -no-remote &


   A user.js for a Quieter Firefox

   Save as "user.js" in your Firefox user directory, which
   has a random string in it, represented by "blah" below:

   Windows: 
     %appdata%\Mozilla\Firefox\Profiles\blah.default\user.js

   Linux: 
	   ~/.mozilla/firefox/blah.default/user.js

   MacOS: 
      ~/Library/Application Support/Firefox/Profiles/
      or
      ~/Library/Mozilla/Firefox/Profiles/
      (May be hidden: http://kb.mozillazine.org/Show_hidden_files_and_folders#Mac_OS_X)

   Purpose: Eliminate HTTP and HTTPS traffic from Firefox
            that is not user-initiated, and is not the 
            result of content from visited websites. This
            is to support webapp testing, so that the only
            traffic from Firefox is traffic relevant to
            the sites being visited.

   This is not a "privacy" or "security" thing.
   It's pretty bad for security, actually.

   Additions encouraged: please send a PR or add an issue.

   Please also include a reference that explains the 
   setting you're proposing to alter.

  ======================================================== */

/* ==== Falses ==== */
user_pref("app.update.auto", false);            // don't auto-update
user_pref("app.update.enabled", false);         // don't even look for updates
user_pref("browser.casting.enabled", false);    // disable SSDP 
user_pref("browser.newtabbage.enabled", false); // new empty tab is empty
user_pref("browser.safebrowsing.downloads.enabled", false);  // skip safebrowsing
user_pref("browser.safebrowsing.malware.enabled", false);    // ""
user_pref("browser.safebrowsing.phishing.enabled", false);   // ""
user_pref("browser.search.suggest.enabled", false);          // don't send search keystrokes
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("extensions.blocklist.enabled", false);            // don't update blocklist
user_pref("extensions.getAddons.cache.enabled", false);
user_pref("extensions.update.autoUpdateDefault", false);
user_pref("extensions.update.enabled", false);               // don't check for extension updates
user_pref("network.captive-portal-service.enabled", false);  // no 'detectportal.firefox.com'
user_pref("network.prefetch-next", false);                   // don't get what I haven't asked for
user_pref("privacy.trackingprotection.pbmode.enabled", false);
user_pref("network.connectivity-service.enabled", false);    // new route to "detectportal" thing 

/* == Disable Sync Altogether == */
/* == STIG: https://www.stigviewer.com/stig/mozilla_firefox/2017-03-22/finding/V-57673 == */
user_pref("services.sync.autoconnect", false);
user_pref("services.sync.engine.addons", false);
user_pref("services.sync.engine.bookmarks", false);
user_pref("services.sync.engine.history", false);
user_pref("services.sync.engine.passwords", false);
user_pref("services.sync.engine.prefs", false);
user_pref("services.sync.engine.tabs", false);


/* ==== Trues ==== */
user_pref("network.dns.disablePrefetch", true);


/* ==== Zeros ==== */
user_pref("browser.startup.page", 0);
user_pref("network.http.speculative-parallel-limit", 0);


/* ==== Empties ==== */
user_pref("browser.aboutHomeSnippets.updateUrl", "");
// These next two might be resolved with "browser.safebrowsing.downloads.enabled" above
// ... nope! Uncommenting them
user_pref("browser.safebrowsing.provider.mozilla.updateURL", "");
user_pref("browser.safebrowsing.provider.mozilla.gethashURL", "");

// I don't see a related true/false option for this one.
// default was https://discovery.addons.mozilla.org/%LOCALE%/firefox/discovery/pane/%VERSION%/%OS%/%COMPATIBILITY_MODE%
user_pref("extensions.webservice.discoverURL", "");

// https://wiki.mozilla.org/Advocacy/heartbeat
user_pref("browser.selfsupport.url","");


/* ==== Special Cases ==== */
user_pref("browser.startup.homepage_override.mstone","ignore");


/* === Mysteries ==== */
// This UI pane calls www.google-analytics.com and addons-discovery.cdn.mozilla.net.
// https://discovery.addons.mozilla.org/en-US/firefox/discovery/pane/53.0/WINNT/normal

