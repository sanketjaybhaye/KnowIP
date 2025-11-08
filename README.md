# KnowIP — Network Intelligence Tool

[![Author](https://img.shields.io/badge/Author-Sanket%20Jaybhaye-blue)](https://github.com/)
[![Version](https://img.shields.io/badge/Version-1.2-green)]()
[![License](https://img.shields.io/badge/License-MIT-yellow)]()

**KnowIP (Extensive)** is a full-featured, interactive network reconnaissance tool written in Python.
This release is suited for public distribution, demos, and portfolio projects.

---

## 🚩 Overview

KnowIP aggregates several open-source libraries and public APIs to provide a one-stop CLI for domain/IP reconnaissance.
It is ideal for quick lookups, reconnaissance during pentests, and learning network information gathering.

---

## ✨ Features

* Interactive CLI menu + non-interactive mode using arguments.
* DNS lookups: **A, AAAA, MX, NS, CNAME, TXT** (TTL where available).
* Reverse DNS (PTR) lookups.
* WHOIS domain registration details.
* GeoIP lookup (country, city, ISP, ASN, lat/lon) via `ip-api.com`.
* JSON export (`--export json`) for structured reporting.
* Colorized terminal output and ASCII banner (uses `colorama`).
* Timeout control, `--no-color`, and convenience flags.
* Designed for ethical reconnaissance and small-scope audits.

---

## ⚙️ Requirements

* Linux (binary tested on Kali Linux, x86_64)
* Internet connection for WHOIS & GeoIP features
* If running from **source**: Python 3.8+ and the packages below

**Python dependencies (only for source-run):**

```bash
pip install -r requirements.txt
# or individually
pip install dnspython python-whois requests colorama
```

---

## 🖥️ Quick Start — Binary (recommended)

If you distributed the prebuilt binary (`knowip`), do the following:

1. Extract (if packaged):

```bash
tar -xzvf knowip-1.0-linux.tar.gz
```

2. Make it executable (if necessary):

```bash
chmod +x knowip
```

3. Run interactively:

```bash
./knowip
```

---

## 📚 Usage

### Interactive Mode

Run without arguments:

```bash
./knowip
```

* Enter a domain or IP when prompted.
* Choose from the menu:

  1. Basic IP info (A/AAAA, reverse DNS)
  2. DNS records (A, AAAA, MX, NS, CNAME, TXT)
  3. WHOIS information
  4. GeoIP (location, ISP, ASN)
  5. ALL (IP + DNS + WHOIS + GeoIP)
  6. Reverse lookup (if you entered an IP)
  7. Exit

### Command-line Mode

Run specific actions directly:

* All lookups:

```bash
./knowip --target example.com --all
```

* Basic IP info:

```bash
./knowip --target example.com --ipinfo
```

* DNS records:

```bash
./knowip --target example.com --dns
```

* WHOIS:

```bash
./knowip --target example.com --whois
```

* GeoIP:

```bash
./knowip --target example.com --geoip
```

* Reverse lookup (IP → domain):

```bash
./knowip --target 8.8.8.8 --reverse
```

* Export results to JSON:

```bash
./knowip --target example.com --all --export json --output results.json
```

* Disable colors (if terminal does not support ANSI):

```bash
./knowip --target example.com --all --no-color
```

---

## 🔧 Options Summary

| Flag             | Description                                                |
| ---------------- | ---------------------------------------------------------- |
| `-t`, `--target` | Domain or IP to query                                      |
| `-a`, `--action` | Action(s): `ip`, `dns`, `whois`, `geoip`, `reverse`, `all` |
| `--ipinfo`       | Show basic IP info                                         |
| `--dns`          | Show DNS records                                           |
| `--whois`        | WHOIS lookup                                               |
| `--geoip`        | GeoIP lookup                                               |
| `--reverse`      | Reverse lookup                                             |
| `--all`          | Run all lookups                                            |
| `--export json`  | Export results to JSON                                     |
| `-o`, `--output` | Output filename for export                                 |
| `--timeout`      | Network timeout in seconds (default: 6)                    |
| `--no-color`     | Disable colored output                                     |

---

## 📦 Packaging / Distribution

Create a tarball containing just the executable (from the folder containing `knowip`):

```bash
tar -czvf knowip-1.0-linux.tar.gz knowip
```

Distribute the tarball to users; they can extract and run the executable with no Python install required.

---

## ⚠️ Notes & Troubleshooting

* WHOIS relies on `python-whois` and needs `public_suffix_list.dat`. If running from a PyInstaller singlefile binary, ensure you bundled that data file (`--add-data "/path/to/public_suffix_list.dat:whois/data"`).
* GeoIP uses `ip-api.com` free endpoints — rate limits may apply. For heavy use consider a paid GeoIP provider.
* If colors do not appear, run with `--no-color` or ensure your terminal supports ANSI escapes.
* Press `Ctrl+C` to exit gracefully from interactive mode.

---

## ✍️ License

MIT License — see `LICENSE` for full text.
© 2025 Sanket Jaybhaye
