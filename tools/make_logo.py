"""Renders img/logo.png (with name) and img/icon_ca.png (symbol only), white on transparent."""
import os
from PIL import Image, ImageDraw, ImageFont

SIZE = 512
SS = 4  # supersampling factor
WHITE = (255, 255, 255, 255)
FONTS = ["bahnschrift.ttf", "segoeuib.ttf", "arialbd.ttf"]
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "img")

def symbol(d, cx, cy, r):
    w = round(r * 0.085)
    d.ellipse([cx - r, cy - r, cx + r, cy + r], outline=WHITE, width=round(r * 0.075))

    # Axis of advance with an arrowhead
    x0, x1 = cx - 0.72 * r, cx + 0.56 * r
    d.line([(x0, cy), (x1, cy)], fill=WHITE, width=w)
    d.polygon([(cx + 0.78 * r, cy), (cx + 0.50 * r, cy - 0.16 * r), (cx + 0.50 * r, cy + 0.16 * r)], fill=WHITE)

    # Phase lines across the axis: the first two are loaded, the last one is still to come
    half = 0.42 * r
    for i, x in enumerate((-0.56, -0.20, 0.16)):
        px = cx + x * r
        if i < 2:
            d.line([(px, cy - half), (px, cy + half)], fill=WHITE, width=w)
        else:
            dash, gap = 0.15 * r, 0.09 * r
            y = cy - half
            while y < cy + half - 1:
                d.line([(px, y), (px, min(y + dash, cy + half))], fill=WHITE, width=w)
                y += dash + gap


def font(px):
    for name in FONTS:
        try:
            return ImageFont.truetype(name, px)
        except OSError:
            continue
    raise SystemExit("no font found")


def spaced(d, text, f, cx, y, spacing, fill):
    widths = [d.textlength(c, font=f) for c in text]
    total = sum(widths) + spacing * (len(text) - 1)
    x = cx - total / 2
    for c, w in zip(text, widths):
        d.text((x, y), c, font=f, fill=fill)
        x += w + spacing


def render(with_text):
    s = SIZE * SS
    img = Image.new("RGBA", (s, s), (0, 0, 0, 0))
    d = ImageDraw.Draw(img)

    if with_text:
        symbol(d, s / 2, 205 * SS, 150 * SS)
        f = font(66 * SS)
        spaced(d, "PHASE LINE", f, s / 2, 395 * SS, 6 * SS, WHITE)
    else:
        symbol(d, s / 2, s / 2, 232 * SS)

    return img.resize((SIZE, SIZE), Image.LANCZOS)


if __name__ == "__main__":
    os.makedirs(OUT, exist_ok=True)
    render(True).save(os.path.join(OUT, "logo.png"))
    render(False).save(os.path.join(OUT, "icon_ca.png"))
