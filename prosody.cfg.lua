interfaces = { "127.0.0.1" };
admins = { "admin@XXX" };
modules_enabled = {
    "roster"; "saslauth"; "tls"; "dialback"; "disco"; "posix"; "private"; "vcard";  "ping";  "register"; "admin_adhoc"; "darknet";
};
modules_disabled = {};
allow_registration = false;
darknet_only = true;
c2s_require_encryption = true;
s2s_secure_auth = false;
authentication = "internal_plain";

-- On Debian/Ubuntu
daemonize = true;
pidfile = "/var/run/prosody/prosody.pid";
log = {
    error = "/var/log/prosody/prosody.err";
    "*syslog";
}
certificates = "certs";

VirtualHost "XXX";
ssl = {
    key = "/etc/prosody/certs/XXX.key";
    certificate = "/etc/prosody/certs/XXX.crt";
}
