
# **Noto Font Override for Brave (Flatpak Only)**

This project forces **Brave Browser (Flatpak)** to stop using proprietary system fonts (Segoe UI, Arial, Helvetica, Verdana, Times New Roman, Consolas, etc.) and instead use:

* **Noto Sans** for all sans-serif
* **Noto Serif** for all serif
* **Noto Sans Mono** for all monospace

This applies **only inside Brave**, without changing system fonts.

---

## **What This Does**

✔ Replaces all system fallback fonts with Noto

✔ Overrides Segoe UI (and all variants) → Noto Sans
✔ Overrides Adwaita/Cantarell → Noto Sans
✔ Overrides Arial/Helvetica/Verdana → Noto Sans
✔ Overrides Times/Georgia/Cambria → Noto Serif
✔ Overrides Consolas/Courier → Noto Sans Mono
✔ Gives Brave clean, consistent, high-quality font rendering
✔ Works fully inside the Flatpak sandbox

Does not block website WOFF2 fonts — only system fallback fonts.

---

## **Install**

Create config directory:

```bash
mkdir -p ~/.var/app/com.brave.Browser/config/fontconfig/conf.d
```

Create loader:

```bash
nano ~/.var/app/com.brave.Browser/config/fontconfig/fonts.conf
```

Paste:

```xml
<fontconfig>
    <include ignore_missing="yes">/etc/fonts/fonts.conf</include>
    <include ignore_missing="yes">conf.d</include>
</fontconfig>
```

Copy the override:

```bash
cp 99-noto-overrides.conf \
   ~/.var/app/com.brave.Browser/config/fontconfig/conf.d/
```

Rebuild cache inside Brave:

```bash
flatpak run --command=fc-cache com.brave.Browser -f
```

---

## **Verify**

```bash
flatpak run --command=fc-match com.brave.Browser "Segoe UI"
```

Expected:

```
NotoSans[wght].ttf: "Noto Sans" "Regular"
```

If you see **Noto**, the override is active.


