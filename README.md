Here is the **rewritten, short, powerful, clean README**, updated to match your setup **without** `fonts.conf`:

---

# **Brave Flatpak – Noto Font Override**

This project forces **Brave Browser (Flatpak)** to stop using proprietary system fonts—like Segoe UI, Arial, Helvetica, Verdana, Times New Roman, Consolas—and replaces them with:

* **Noto Sans** (all sans-serif)
* **Noto Serif** (all serif)
* **Noto Sans Mono** (all monospace)

This override affects **only Brave**, not your system fonts.

---

## **What It Does**

✔ Replaces *all* fallback fonts in Brave with Noto

✔ Eliminates Segoe UI (including Historic, Symbol)

✔ Overrides Adwaita Sans, Cantarell → Noto Sans

✔ Overrides Arial, Helvetica, Verdana, Tahoma → Noto Sans

✔ Overrides Times, Georgia, Cambria → Noto Serif

✔ Overrides Consolas, Courier → Noto Sans Mono

✔ Produces cleaner, sharper, consistent typography

✔ Fully contained inside Flatpak sandbox

Does **not** block website-loaded webfonts (WOFF/WOFF2).

---

## **Installation**

Place the override file here:

```
~/.var/app/com.brave.Browser/config/fontconfig/conf.d/99-noto-overrides.conf
```

Then rebuild the font cache **inside Brave**:

```bash
flatpak run --command=fc-cache com.brave.Browser -f
```

Done.

Brave will automatically pick up the override—no `fonts.conf` required.

---

## **Verification**

Run:

```bash
flatpak run --command=fc-match com.brave.Browser "Segoe UI"
```

Expected:

```
NotoSans[wght].ttf: "Noto Sans" "Regular"
```

If you see **Noto**, the override is active.

---

If you want an even shorter version, or a GitHub description section, I can rewrite it again.
