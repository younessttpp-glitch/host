# Hoost Test Vsi — MTA:SA Local Control Panel (Windows)

## Start the website
1. Install Node.js 18+ if it is not installed.
2. Extract this folder.
3. Double-click `start-local.bat` or open CMD here and run `npm start`.
4. Open http://127.0.0.1:3000.

## Connect your actual Windows MTA server (one local instance)
1. Stop the MTA server if you have it running separately.
2. Find the folder that contains `MTA Server.exe` and its server configuration/resources.
3. Edit `start-local.bat`, remove the `REM` from the example `set "MTA_SERVER_DIR=..."` line and replace the path with your actual folder. For example:
   `set "MTA_SERVER_DIR=C:\MTA Server"`
4. Close and reopen the panel using `start-local.bat`.
5. Register/login, then use the dashboard's Start / Stop buttons. If it does not start, check the terminal window and MTA server files/logs.

The process manager is deliberately limited to one configured local instance. It starts `MTA Server.exe` with the configured server folder as its working directory. Depending on how your MTA server package is laid out, you may need to adjust the executable name or configuration. Do not run two copies on the same game port.

## What works now
- Arabic RTL responsive hosting-style website.
- Local registration/login; passwords hashed with Node's scrypt; cookie sessions kept in memory.
- Local JSON database for accounts/server records.
- One-time 72-hour trial per account.
- Example plans in EGP/month: 99 / 199 / 349. These are suggested prices, not verified costs or enabled checkout.
- A local server record gets a distinct port number from 22100–22999.
- Optional process start/stop for one actual Windows MTA instance when `MTA_SERVER_DIR` is configured.
- Local status/console output and truthful error messages if MTA is not configured.

## Not production ready
This is a local development foundation, not a finished commercial hosting platform. Keep it bound to 127.0.0.1. It does NOT implement payment processing, public HTTPS/domain, email verification, password reset, rate limiting, CSRF defenses, admin/support tools, resource quotas, isolated multiple MTA instances, per-customer file isolation, automated backups, DDoS protection, or durable sessions. Server records/assigned ports do not create separate game servers automatically. The one optional process controller runs only the configured local MTA server and does not bind each customer record to its own isolated process/port.

For real customer hosting, use a separate always-on Windows/Linux host with public IP, firewall rules, a secure control plane, process isolation, per-instance config/resource directories, port allocation, monitoring, backups, and tested payment provider integration. Do not accept payments or expose this app to the internet in its current state.

## MTA port note
The port shown for each account record is an allocation placeholder until actual per-instance configs and process isolation are implemented. Your existing MTA server continues to use the port in its own config (commonly 22003, but check your own `mtaserver.conf`). Router/NAT and Windows Firewall rules are required for other players to connect to a home-hosted server. Your public IP may change, and the PC must remain on and connected.
