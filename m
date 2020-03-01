Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47748174E2B
	for <lists+openbmc@lfdr.de>; Sun,  1 Mar 2020 16:59:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48VnyF4BsJzDr0N
	for <lists+openbmc@lfdr.de>; Mon,  2 Mar 2020 02:59:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mBx3Y8gM; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48VnxS24MLzDqyv
 for <openbmc@lists.ozlabs.org>; Mon,  2 Mar 2020 02:58:19 +1100 (AEDT)
Received: by mail-ot1-x343.google.com with SMTP id g96so7231972otb.13
 for <openbmc@lists.ozlabs.org>; Sun, 01 Mar 2020 07:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZUSdysIcau17ZqAr4AHzGVwb5tkuUBvYfbR6nyBGuck=;
 b=mBx3Y8gMwfy+Y8BnzdrLOLOQeORAYfiGv1Itd2i/IN2IaE0WpZ9eaWbG4EU+h4yK0G
 iLuCprTk8IkjDIxCgneuhrFXHoTT+0wyPsj26K0YzZqHOtJqrH+aAhwxlRJo73PZtAZ8
 Wgfpy5DYGsTbUH/78ocQI6FL1oFOSBh6qlnpbfDRmlGinayVgRdlQSw+Zur0OSrrzTR+
 afBWvmMpIHI3i4fleTjgTwwM6fPAf3eK63bYP1B/INdq186Mr83/u/xnZ+zpQK4R2iLd
 Ikf/goCf3Lp+tWOeBkwiJJYbfhAkNBIj4TcWeAB2QXji4664MlnS8hviOuDxDcmVJSb+
 iWOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZUSdysIcau17ZqAr4AHzGVwb5tkuUBvYfbR6nyBGuck=;
 b=ejnrmuGGF6hbwp/2LNil3j+361yqSu+g+u+Cqd3CJ4ZKLhg28nw8K8VDCnt30tdhPk
 kTureOKJ43SdBf2dkZapxg7TgZEnSkv50oGL9Bz2+ZqvezYeMYhUsq3tTevW7oAzsHvN
 71fteJ+xzkwWjeFYx20weYGFRhxvhyjUenTQDDlnPHkjEvfe7QJQtqR2jo+232kAxx2a
 La9+IizwpW+almhH0PYhGsqLGeJucKkFrt5IrNsV6mm75tIPk46Nt6YyDnZenP0mqWhE
 RMsZaev+9TKTT8jBxVhHSzGn/BhuKzvauykIN1rWHDX8DoApplWWQ+K7xr8brv5dyZlF
 mwtw==
X-Gm-Message-State: ANhLgQ2j6v10wR2KZTEuHWiPDuDt/HCcnRRsII9zr6ptZGHTMymW95Ur
 W3D3XvLcO8xvyHcuZSTieBsxBg/gHAnC8Ndo8OE=
X-Google-Smtp-Source: ADFU+vvoi7EKmnkVMAGLG/vfBlZUX5slqkdU2QdVc/SdSzSyJCd3ezyX4BS0XafDAAKtT544zm7R/oinLZmxKtTUhRI=
X-Received: by 2002:a9d:7dc9:: with SMTP id k9mr1552871otn.321.1583078296001; 
 Sun, 01 Mar 2020 07:58:16 -0800 (PST)
MIME-Version: 1.0
References: <20200301094040.123189-1-tmaimon77@gmail.com>
 <20200301094040.123189-5-tmaimon77@gmail.com>
 <026fa94c-8fde-acda-e218-ffff9b5891c9@roeck-us.net>
In-Reply-To: <026fa94c-8fde-acda-e218-ffff9b5891c9@roeck-us.net>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Sun, 1 Mar 2020 18:08:11 +0200
Message-ID: <CAP6Zq1hPsnJ1UxAQ-wK_pkaJqzWRQ-_g5-k0Kag2YoP+c2fPjQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] watchdog: npcm: sets card ext1 and ext2 bootstatus
 during probe
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: multipart/alternative; boundary="0000000000007c1e93059fcd2354"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000007c1e93059fcd2354
Content-Type: text/plain; charset="UTF-8"

Sorry Guenter probebly I didnt explain it well.


On Sun, 1 Mar 2020 at 12:48, Guenter Roeck <linux@roeck-us.net> wrote:

> On 3/1/20 1:40 AM, Tomer Maimon wrote:
> > During probe NPCM watchdog sets the following bootstatus flags:
> >       - WDIOF_CARDRESET represent power and core reset.
> >       - WDIOF_EXTERN1 represent watchdog 0-2 reset.
> >       - WDIOF_EXTERN2 represent software 1-4 reset.
> >
> > Each flag is representing a group of bootstatus.
> > The user can configure through the device treethe exact reset
> > to each flag group.
> >
>
> Sorry, this doesn't make sense to me. I could understand reporting
> the above, but it looks to me like devicetree is used to associate
> a reset bit from the controller with one of the above.
> Devicetree only seems to be used to associate reset status bits
> from the controller with WDIOF_CARDRESET, WDIOF_EXTERN1, or
> WDIOF_EXTERN2. That adds a lot of complexity for little if any
> gain.



It would make sense to set the bootstatus bits as suggested above,
> but that doesn't require devicetree properties.
>
> More comments inline.
>
> Guenter
>


In the NPCM750 we have the following reset types:

   1. board reset (Power on reset, Core reset)
   2. WD reset (0-2 WD reset).
   3. SW reset (1-4 SW reset).


Each board can use different reset types, because in the WD status bit
there is not enough bits to represent the entire NPCM750 resets.

The NPCM750 reset groups are represent as follow:

 - WDIOF_CARDRESET represent power and core reset.
 - WDIOF_EXTERN1 represent watchdog 0-2 reset.
 - WDIOF_EXTERN2 represent software 1-4 reset.



To have maximum flexibility (with three boot status bits), In the device
tree the user can configure each reset group type according the one the
board is using.


Hope I explian it better :-)

> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/watchdog/npcm_wdt.c | 132 ++++++++++++++++++++++++++++++++----
> >  1 file changed, 119 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> > index 8609c7acf17d..dba9a73249c9 100644
> > --- a/drivers/watchdog/npcm_wdt.c
> > +++ b/drivers/watchdog/npcm_wdt.c
> > @@ -11,7 +11,24 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> >  #include <linux/watchdog.h>
> > -
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> > +
> New include files in alphabetic order merged with existing ones, please.
>
> > +/* NPCM7xx GCR module */
> > +#define NPCM7XX_RESSR_OFFSET         0x6C
> > +#define NPCM7XX_INTCR2_OFFSET                0x60
> > +
> > +#define NPCM7XX_PORST                        BIT(31)
> > +#define NPCM7XX_CORST                        BIT(30)
> > +#define NPCM7XX_WD0RST                       BIT(29)
> > +#define NPCM7XX_WD1RST                       BIT(24)
> > +#define NPCM7XX_WD2RST                       BIT(23)
> > +#define NPCM7XX_SWR1RST                      BIT(28)
> > +#define NPCM7XX_SWR2RST                      BIT(27)
> > +#define NPCM7XX_SWR3RST                      BIT(26)
> > +#define NPCM7XX_SWR4RST                      BIT(25)
> > +
> > + /* WD register */
> >  #define NPCM_WTCR    0x1C
> >
> >  #define NPCM_WTCLK   (BIT(10) | BIT(11))     /* Clock divider */
> > @@ -43,6 +60,9 @@
> >  struct npcm_wdt {
> >       struct watchdog_device  wdd;
> >       void __iomem            *reg;
> > +     u32                     card_reset;
> > +     u32                     ext1_reset;
> > +     u32                     ext2_reset;
> >  };
> >
> >  static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
> > @@ -103,30 +123,29 @@ static int npcm_wdt_stop(struct watchdog_device
> *wdd)
> >       return 0;
> >  }
> >
> > -
> >  static int npcm_wdt_set_timeout(struct watchdog_device *wdd,
> >                               unsigned int timeout)
> >  {
> >       if (timeout < 2)
> >               wdd->timeout = 1;
> >       else if (timeout < 3)
> > -           wdd->timeout = 2;
> > +             wdd->timeout = 2;
> >       else if (timeout < 6)
> > -           wdd->timeout = 5;
> > +             wdd->timeout = 5;
> >       else if (timeout < 11)
> > -           wdd->timeout = 10;
> > +             wdd->timeout = 10;
> >       else if (timeout < 22)
> > -           wdd->timeout = 21;
> > +             wdd->timeout = 21;
> >       else if (timeout < 44)
> > -           wdd->timeout = 43;
> > +             wdd->timeout = 43;
> >       else if (timeout < 87)
> > -           wdd->timeout = 86;
> > +             wdd->timeout = 86;
> >       else if (timeout < 173)
> > -           wdd->timeout = 172;
> > +             wdd->timeout = 172;
> >       else if (timeout < 688)
> > -           wdd->timeout = 687;
> > +             wdd->timeout = 687;
> >       else
> > -           wdd->timeout = 2750;
> > +             wdd->timeout = 2750;
> >
>
> Whitespace changes in a separate patch, please.
>
> >       if (watchdog_active(wdd))
> >               npcm_wdt_start(wdd);
> > @@ -177,9 +196,61 @@ static const struct watchdog_ops npcm_wdt_ops = {
> >       .restart = npcm_wdt_restart,
> >  };
> >
> > +static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device
> *dev)
> > +{
> > +     struct regmap *gcr_regmap;
> > +     u32 rstval;
> > +
> > +     if (of_device_is_compatible(dev->of_node, "nuvoton,npcm750-wdt")) {
> > +             gcr_regmap =
> syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
> > +             if (IS_ERR(gcr_regmap))
> > +                     dev_warn(dev, "Failed to find nuvoton,npcm750-gcr
> WD reset status not supported\n");
> > +
> > +             regmap_read(gcr_regmap, NPCM7XX_RESSR_OFFSET, &rstval);
> > +             if (!rstval) {
> > +                     regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET,
> &rstval);
> > +                     rstval = ~rstval;
> > +             }
>
> The second register reports the same as the first only negated if
> bits in the first register are not set ? That seems unlikely.
> Please point to the datasheet, or at least provide a reference to the
> two registers.
>

If NPCM750 is power on the NPCM7XX_RESSR_OFFSET register is cleaned and the
reset copied to the NPCM7XX_INTCR2_OFFSET.
I will add a note to the code


> > +
> > +             if (rstval & wdt->card_reset)
> > +                     wdt->wdd.bootstatus |= WDIOF_CARDRESET;
> > +             if (rstval & wdt->ext1_reset)
> > +                     wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> > +             if (rstval & wdt->ext2_reset)
> > +                     wdt->wdd.bootstatus |= WDIOF_EXTERN2;
> > +     }
> > +}
> > +
> > +static u32 npcm_wdt_reset_type(const char *reset_type)
> > +{
> > +     if (!strcmp(reset_type, "porst"))
> > +             return NPCM7XX_PORST;
> > +     else if (!strcmp(reset_type, "corst"))
> > +             return NPCM7XX_CORST;
> > +     else if (!strcmp(reset_type, "wd0"))
> > +             return NPCM7XX_WD0RST;
> > +     else if (!strcmp(reset_type, "wd1"))
> > +             return NPCM7XX_WD1RST;
> > +     else if (!strcmp(reset_type, "wd2"))
> > +             return NPCM7XX_WD2RST;
> > +     else if (!strcmp(reset_type, "sw1"))
> > +             return NPCM7XX_SWR1RST;
> > +     else if (!strcmp(reset_type, "sw2"))
> > +             return NPCM7XX_SWR2RST;
> > +     else if (!strcmp(reset_type, "sw3"))
> > +             return NPCM7XX_SWR3RST;
> > +     else if (!strcmp(reset_type, "sw4"))
> > +             return NPCM7XX_SWR4RST;
> > +
> > +     return 0;
> > +}
> > +
> >  static int npcm_wdt_probe(struct platform_device *pdev)
> >  {
> >       struct device *dev = &pdev->dev;
> > +     const char *card_reset_type;
> > +     const char *ext1_reset_type;
> > +     const char *ext2_reset_type;
> >       struct npcm_wdt *wdt;
> >       u32 priority;
> >       int irq;
> > @@ -202,6 +273,39 @@ static int npcm_wdt_probe(struct platform_device
> *pdev)
> >       else
> >               watchdog_set_restart_priority(&wdt->wdd, priority);
> >
> > +     ret = of_property_read_string(pdev->dev.of_node,
> > +                                   "nuvoton,card-reset-type",
> > +                                   &card_reset_type);
> > +     if (ret) {
> > +             wdt->card_reset = NPCM7XX_PORST;
> > +     } else {
> > +             wdt->card_reset = npcm_wdt_reset_type(card_reset_type);
> > +             if (!wdt->card_reset)
> > +                     wdt->card_reset = NPCM7XX_PORST;
> > +     }
> > +
> > +     ret = of_property_read_string(pdev->dev.of_node,
> > +                                   "nuvoton,ext1-reset-type",
> > +                                   &ext1_reset_type);
> > +     if (ret) {
> > +             wdt->ext1_reset = NPCM7XX_WD0RST;
> > +     } else {
> > +             wdt->ext1_reset = npcm_wdt_reset_type(ext1_reset_type);
> > +             if (!wdt->ext1_reset)
> > +                     wdt->ext1_reset = NPCM7XX_WD0RST;
> > +     }
> > +
> > +     ret = of_property_read_string(pdev->dev.of_node,
> > +                                   "nuvoton,ext2-reset-type",
> > +                                   &ext2_reset_type);
> > +     if (ret) {
> > +             wdt->ext2_reset = NPCM7XX_SWR1RST;
> > +     } else {
> > +             wdt->ext2_reset = npcm_wdt_reset_type(ext2_reset_type);
> > +             if (!wdt->ext2_reset)
> > +                     wdt->ext2_reset = NPCM7XX_SWR1RST;
> > +     }
> > +
> >       wdt->wdd.info = &npcm_wdt_info;
> >       wdt->wdd.ops = &npcm_wdt_ops;
> >       wdt->wdd.min_timeout = 1;
> > @@ -220,8 +324,10 @@ static int npcm_wdt_probe(struct platform_device
> *pdev)
> >               set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
> >       }
> >
> > -     ret = devm_request_irq(dev, irq, npcm_wdt_interrupt, 0, "watchdog",
> > -                            wdt);
> > +     npcm_get_reset_status(wdt, dev);
> > +
> > +     ret = devm_request_irq(dev, irq, npcm_wdt_interrupt, 0,
> > +                            "watchdog", wdt);
> >       if (ret)
> >               return ret;
> >
> >
>
>
Thanks a lot,

Tomer

--0000000000007c1e93059fcd2354
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Sorry Guenter probebly I didnt explain it=
 well.<div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, 1 Mar 2020 at 12:48, Guenter Roeck &lt;<a href=
=3D"mailto:linux@roeck-us.net">linux@roeck-us.net</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On 3/1/20 1:40 AM, Tomer M=
aimon wrote:<br>
&gt; During probe NPCM watchdog sets the following bootstatus flags:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- WDIOF_CARDRESET represent power and core r=
eset.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- WDIOF_EXTERN1 represent watchdog 0-2 reset=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- WDIOF_EXTERN2 represent software 1-4 reset=
.<br>
&gt; <br>
&gt; Each flag is representing a group of bootstatus.<br>
&gt; The user can configure through the device treethe exact reset<br>
&gt; to each flag group.<br>
&gt; <br>
<br>
Sorry, this doesn&#39;t make sense to me. I could understand reporting<br>
the above, but it looks to me like devicetree is used to associate<br>
a reset bit from the controller with one of the above.<br>
Devicetree only seems to be used to associate reset status bits<br>
from the controller with WDIOF_CARDRESET, WDIOF_EXTERN1, or<br>
WDIOF_EXTERN2. That adds a lot of complexity for little if any<br>
gain.=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
It would make sense to set the bootstatus bits as suggested above,<br>
but that doesn&#39;t require devicetree properties.<br>
<br>
More comments inline.<br>
<br>
Guenter=C2=A0<br></blockquote><div>=C2=A0</div><div><p class=3D"MsoNormal" =
style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"arial, sans-serif" style=3D=
"">In the NPCM750 we have the following
reset types:</font></p>

<ol start=3D"1" type=3D"1" style=3D"margin-bottom:0cm">
 <li class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"ar=
ial, sans-serif">board
     reset (Power on reset, Core reset)</font></li>
 <li class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"ar=
ial, sans-serif">WD
     reset (0-2 WD reset).</font></li>
 <li class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"ar=
ial, sans-serif">SW
     reset (1-4 SW reset).</font></li>
</ol>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif"><br></font></p><p class=3D"MsoNormal" style=3D"margin:0cm 0c=
m 0.0001pt"><font face=3D"arial, sans-serif">Each board can use different r=
eset
types, because in the WD status bit there is not enough bits to represent t=
he
entire NPCM750 resets.</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">The NPCM750 reset groups are
represent as follow:</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">=C2=A0- WDIOF_CARDRESET represent
power and core reset.<br>
=C2=A0- WDIOF_EXTERN1 represent watchdog 0-2 reset.<br>
=C2=A0- WDIOF_EXTERN2 represent software 1-4 reset.</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif">=C2=A0</font></p>

<p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D"aria=
l, sans-serif" style=3D"">To have maximum=C2=A0</font><span style=3D"font-f=
amily:Arial,sans-serif">flexibility</span>=C2=A0<font face=3D"arial, sans-s=
erif" style=3D"">(with three boot status bits), In the device tree the user=
 can
configure each reset group type according the one the board is using.</font=
></p><p class=3D"MsoNormal" style=3D"margin:0cm 0cm 0.0001pt"><font face=3D=
"arial, sans-serif" style=3D""><br></font></p><p class=3D"MsoNormal" style=
=3D"margin:0cm 0cm 0.0001pt"><font face=3D"arial, sans-serif" style=3D"">Ho=
pe I explian it better :-)</font></p></div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 drivers/watchdog/npcm_wdt.c | 132 ++++++++++++++++++++++++++++++=
++----<br>
&gt;=C2=A0 1 file changed, 119 insertions(+), 13 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c=
<br>
&gt; index 8609c7acf17d..dba9a73249c9 100644<br>
&gt; --- a/drivers/watchdog/npcm_wdt.c<br>
&gt; +++ b/drivers/watchdog/npcm_wdt.c<br>
&gt; @@ -11,7 +11,24 @@<br>
&gt;=C2=A0 #include &lt;linux/platform_device.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/slab.h&gt;<br>
&gt;=C2=A0 #include &lt;linux/watchdog.h&gt;<br>
&gt; -<br>
&gt; +#include &lt;linux/regmap.h&gt;<br>
&gt; +#include &lt;linux/mfd/syscon.h&gt;<br>
&gt; +<br>
New include files in alphabetic order merged with existing ones, please.<br=
>
<br>
&gt; +/* NPCM7xx GCR module */<br>
&gt; +#define NPCM7XX_RESSR_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x6C<br=
>
&gt; +#define NPCM7XX_INTCR2_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 0x60<br>
&gt; +<br>
&gt; +#define NPCM7XX_PORST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(31)<br>
&gt; +#define NPCM7XX_CORST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(30)<br>
&gt; +#define NPCM7XX_WD0RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(29)<br>
&gt; +#define NPCM7XX_WD1RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(24)<br>
&gt; +#define NPCM7XX_WD2RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BIT(23)<br>
&gt; +#define NPCM7XX_SWR1RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(28)<br>
&gt; +#define NPCM7XX_SWR2RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(27)<br>
&gt; +#define NPCM7XX_SWR3RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(26)<br>
&gt; +#define NPCM7XX_SWR4RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(25)<br>
&gt; +<br>
&gt; + /* WD register */<br>
&gt;=C2=A0 #define NPCM_WTCR=C2=A0 =C2=A0 0x1C<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define NPCM_WTCLK=C2=A0 =C2=A0(BIT(10) | BIT(11))=C2=A0 =C2=A0 =
=C2=A0/* Clock divider */<br>
&gt; @@ -43,6 +60,9 @@<br>
&gt;=C2=A0 struct npcm_wdt {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct watchdog_device=C2=A0 wdd;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 *reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0card_reset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ext1_reset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ext2_reset;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_devic=
e *wdd)<br>
&gt; @@ -103,30 +123,29 @@ static int npcm_wdt_stop(struct watchdog_device =
*wdd)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -<br>
&gt;=C2=A0 static int npcm_wdt_set_timeout(struct watchdog_device *wdd,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int timeout)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (timeout &lt; 2)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =
=3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 3)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 2=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 6)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 5;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 5=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 11)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 10;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 1=
0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 22)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 21;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 2=
1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 44)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 43;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 4=
3;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 87)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 86;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 8=
6;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 173)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 172;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 1=
72;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (timeout &lt; 688)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 687;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 6=
87;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 2750;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdd-&gt;timeout =3D 2=
750;<br>
&gt;=C2=A0 <br>
<br>
Whitespace changes in a separate patch, please.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (watchdog_active(wdd))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm_wdt_start(w=
dd);<br>
&gt; @@ -177,9 +196,61 @@ static const struct watchdog_ops npcm_wdt_ops =3D=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.restart =3D npcm_wdt_restart,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device=
 *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct regmap *gcr_regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 rstval;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (of_device_is_compatible(dev-&gt;of_node, &quo=
t;nuvoton,npcm750-wdt&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcr_regmap =3D syscon=
_regmap_lookup_by_compatible(&quot;nuvoton,npcm750-gcr&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(gcr_regmap=
))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0dev_warn(dev, &quot;Failed to find nuvoton,npcm750-gcr WD reset stat=
us not supported\n&quot;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_read(gcr_regma=
p, NPCM7XX_RESSR_OFFSET, &amp;rstval);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rstval) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET, &amp;rstval);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0rstval =3D ~rstval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
The second register reports the same as the first only negated if<br>
bits in the first register are not set ? That seems unlikely.<br>
Please point to the datasheet, or at least provide a reference to the<br>
two registers.<br></blockquote><div>=C2=A0</div><div>If NPCM750 is power on=
 the NPCM7XX_RESSR_OFFSET register is cleaned and the reset copied to the N=
PCM7XX_INTCR2_OFFSET.<br></div><div>I will add a note to the code</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rstval &amp; wdt-=
&gt;card_reset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0wdt-&gt;wdd.bootstatus |=3D WDIOF_CARDRESET;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rstval &amp; wdt-=
&gt;ext1_reset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0wdt-&gt;wdd.bootstatus |=3D WDIOF_EXTERN1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rstval &amp; wdt-=
&gt;ext2_reset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0wdt-&gt;wdd.bootstatus |=3D WDIOF_EXTERN2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 npcm_wdt_reset_type(const char *reset_type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!strcmp(reset_type, &quot;porst&quot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_PORST;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;corst&quot;))<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_CORST;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;wd0&quot;))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_WD0RST=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;wd1&quot;))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_WD1RST=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;wd2&quot;))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_WD2RST=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;sw1&quot;))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_SWR1RS=
T;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;sw2&quot;))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_SWR2RS=
T;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;sw3&quot;))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_SWR3RS=
T;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;sw4&quot;))<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX_SWR4RS=
T;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static int npcm_wdt_probe(struct platform_device *pdev)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;dev;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *card_reset_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *ext1_reset_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *ext2_reset_type;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_wdt *wdt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 priority;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int irq;<br>
&gt; @@ -202,6 +273,39 @@ static int npcm_wdt_probe(struct platform_device =
*pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0watchdog_set_res=
tart_priority(&amp;wdt-&gt;wdd, priority);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_string(pdev-&gt;dev.of_n=
ode,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nuvoton,card-=
reset-type&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;card_reset_typ=
e);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;card_reset =
=3D NPCM7XX_PORST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;card_reset =
=3D npcm_wdt_reset_type(card_reset_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!wdt-&gt;card_res=
et)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0wdt-&gt;card_reset =3D NPCM7XX_PORST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_string(pdev-&gt;dev.of_n=
ode,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nuvoton,ext1-=
reset-type&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;ext1_reset_typ=
e);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;ext1_reset =
=3D NPCM7XX_WD0RST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;ext1_reset =
=3D npcm_wdt_reset_type(ext1_reset_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!wdt-&gt;ext1_res=
et)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0wdt-&gt;ext1_reset =3D NPCM7XX_WD0RST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_string(pdev-&gt;dev.of_n=
ode,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nuvoton,ext2-=
reset-type&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;ext2_reset_typ=
e);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;ext2_reset =
=3D NPCM7XX_SWR1RST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;ext2_reset =
=3D npcm_wdt_reset_type(ext2_reset_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!wdt-&gt;ext2_res=
et)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0wdt-&gt;ext2_reset =3D NPCM7XX_SWR1RST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;<a href=3D"http://wdd.info" rel=3D"n=
oreferrer" target=3D"_blank">wdd.info</a> =3D &amp;npcm_wdt_info;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;wdd.ops =3D &amp;npcm_wdt_ops;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;wdd.min_timeout =3D 1;<br>
&gt; @@ -220,8 +324,10 @@ static int npcm_wdt_probe(struct platform_device =
*pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_bit(WDOG_HW_=
RUNNING, &amp;wdt-&gt;wdd.status);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ret =3D devm_request_irq(dev, irq, npcm_wdt_inter=
rupt, 0, &quot;watchdog&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wdt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0npcm_get_reset_status(wdt, dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D devm_request_irq(dev, irq, npcm_wdt_inter=
rupt, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;watchdog&quot;, wdt);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 <br>
&gt; <br>
<br></blockquote><div><br></div><div>Thanks a lot,</div><div><br></div><div=
>Tomer=C2=A0</div></div></div>

--0000000000007c1e93059fcd2354--
