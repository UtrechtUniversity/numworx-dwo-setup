VirtualHost "chat-dev.dwo.nl"

	ssl = {
		key = "/etc/prosody/certs/chat.dwo.nl.key";
		certificate = "/etc/prosody/certs/chat.dwo.nl.crt";
		}

------ Components ------
-- You can specify components to add hosts that provide special services,
-- like multi-user conferences, and transports.
-- For more information on components, see https://prosody.im/doc/components

---Set up a MUC (multi-user chat) room server on conference.example.com:
Component "conference.chat.dwo.nl" "muc"
--- Store MUC messages in an archive and allow users to access it
muc_room_default_persistent = true
modules_enabled = { "muc_mam" }
muc_log_by_default = true
muc_log_presences = false
log_all_rooms = true
muc_log_expires_after = "10w"
muc_log_cleanup_interval = 4 * 60 * 60
