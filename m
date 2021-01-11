Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9DA2F1EAF
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 20:10:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DF3F76BkxzDqgj
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 06:10:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22d;
 helo=mail-oi1-x22d.google.com; envelope-from=tmaimon77@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lG19EM9Q; dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DF3D50KNMzDqQf
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 06:09:18 +1100 (AEDT)
Received: by mail-oi1-x22d.google.com with SMTP id s75so487002oih.1
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 11:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L6+RZFWLPgQm/uWYoYlv9TC6/fx7rbHV/06Zdau02jA=;
 b=lG19EM9QyUZCA8FD8Li2js4+zVu+2581/SlHORFQv7ywrnW96BQqcvQGvjpsFl5UQV
 HRjT+dom4Obm2KV01jgfJS4W45NMV1vEQLEc/HKbgIgZbTYIvs6KTBsZiKHCMfmWTyNE
 K6iyhED2inDDxwkOw+cQPTocNMOsTyotdFL+z77j6xOuxXon1HmPrKXQ4Lcj+oPWjZ7g
 1o6Ff/FNT1nM7yFuP4Lzm8Iqry1ZBfLKVNwNXMG8x+zoU/rYbdgMS0UMuSwrCsgQWPTo
 Ot7wijC05UamqDIJBCCrUpONjZblyAmRaHf5KGFGMrnZqdty1gS8NdBsk9wfAxyRqe5S
 Omag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L6+RZFWLPgQm/uWYoYlv9TC6/fx7rbHV/06Zdau02jA=;
 b=UheBdmT1v+DBP9wvYKW5wG9Wxxos4CmRMAONNuiBZ8Z2Ca4ABS9igfwHa4DAFpSocH
 iZYh255OpSYalcnv2GdMcAm3iSF9+5G27USzParYFMlMR3a9Fg/8m8tWC0xEMAr7jtqo
 drAISwT2EA3mlsEqBGIS1JvmOE146VY5IzZhbmBm8oZKDxVw/9EJWpdjYY9TnUJ49qx2
 fUtYkVMc3sWSBRmjlgXjPPuQmZsmp59H9Q9XCFAqxEInmyeCCK13m9OyAagJE8uRvNTX
 xd1ZJ13H86Faj4NqhTpTM/oh5j4dCtFiMz2ETR3TuoaRttRuQJyUBapSuWZ6YpsmCmxj
 nbUA==
X-Gm-Message-State: AOAM531rF3o2gQLwk7eGQmAfyo0X0ZSmZ+tXrYxPukjOAWcX9zAc4UOz
 irZRFdh2LPFH9wMHbBdwsT5GQFus2nGrjlkLfU4=
X-Google-Smtp-Source: ABdhPJyepiwoOHTfqVhiXK5qJlT0UdY3maeZZlNm6PRis/SwTPQqvCk6/9ABIidEQtHmx5snVom7BnC0a1RQ02QyCH0=
X-Received: by 2002:aca:5dd4:: with SMTP id r203mr172979oib.167.1610392154629; 
 Mon, 11 Jan 2021 11:09:14 -0800 (PST)
MIME-Version: 1.0
References: <20210105134508.225702-1-tmaimon77@gmail.com>
 <20210105134508.225702-5-tmaimon77@gmail.com>
 <CACPK8Xdc+3zEUGWidbdAUBbwoOa+mLa60bZyqCVxy-vADZeL3Q@mail.gmail.com>
In-Reply-To: <CACPK8Xdc+3zEUGWidbdAUBbwoOa+mLa60bZyqCVxy-vADZeL3Q@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 11 Jan 2021 21:22:52 +0200
Message-ID: <CAP6Zq1jkKa9twN149nz4qd0bVRkw6mZ-UNivmrW_ODH0eCbw3g@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v2 04/11] watchdog: npcm: Add DT restart
 priority and reset type support
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000005368df05b8a4a4f7"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000005368df05b8a4a4f7
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Jan 2021 at 02:55, Joel Stanley <joel@jms.id.au> wrote:

> On Tue, 5 Jan 2021 at 13:45, Tomer Maimon <tmaimon77@gmail.com> wrote:
> >
> > Add Device tree restart priority and
> > three reset types support.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> Can you remind me the history of this change. Was a similar patch
> rejected by mainline?
>
https://www.spinics.net/lists/kernel/msg3425926.html

>
> > ---
> >  drivers/watchdog/npcm_wdt.c | 121 +++++++++++++++++++++++++++++++++++-
> >  1 file changed, 119 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> > index 765577f11c8d..bbf27da34834 100644
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
> > +/* NPCM7xx GCR module */
> > +#define NPCM7XX_RESSR_OFFSET           0x6C
> > +#define NPCM7XX_INTCR2_OFFSET          0x60
> > +
> > +#define NPCM7XX_PORST                  BIT(31)
> > +#define NPCM7XX_CORST                  BIT(30)
> > +#define NPCM7XX_WD0RST                 BIT(29)
> > +#define NPCM7XX_WD1RST                 BIT(24)
> > +#define NPCM7XX_WD2RST                 BIT(23)
> > +#define NPCM7XX_SWR1RST                        BIT(28)
> > +#define NPCM7XX_SWR2RST                        BIT(27)
> > +#define NPCM7XX_SWR3RST                        BIT(26)
> > +#define NPCM7XX_SWR4RST                        BIT(25)
> > +
> > + /* WD register */
> >  #define NPCM_WTCR      0x1C
> >
> >  #define NPCM_WTCLK     (BIT(10) | BIT(11))     /* Clock divider */
> > @@ -43,6 +60,10 @@
> >  struct npcm_wdt {
> >         struct watchdog_device  wdd;
> >         void __iomem            *reg;
> > +       u32                     card_reset;
> > +       u32                     ext1_reset;
> > +       u32                     ext2_reset;
> > +
> >  };
> >
> >  static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
> > @@ -176,14 +197,70 @@ static const struct watchdog_ops npcm_wdt_ops = {
> >         .restart = npcm_wdt_restart,
> >  };
> >
> > +static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device
> *dev)
> > +{
> > +       struct regmap *gcr_regmap;
> > +       u32 rstval;
> > +
> > +       if (of_device_is_compatible(dev->of_node,
> "nuvoton,npcm750-wdt")) {
> > +               gcr_regmap =
> syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");
>
> This will have the same issues as the ADC with supporting multiple
> families of chip with the same code. I suggest you adjust it to use
> the phandle approach.
>
> Do you mean by having a gcr phandle property in the wdt npcm device tree
node?

>
> > +               if (IS_ERR(gcr_regmap)) {
> > +                       dev_warn(dev, "Failed to find
> nuvoton,npcm750-gcr WD reset status not supported\n");
> > +               }
> > +
> > +               regmap_read(gcr_regmap, NPCM7XX_RESSR_OFFSET, &rstval);
> > +               if (!rstval) {
> > +                       regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET,
> &rstval);
> > +                       rstval = ~rstval;
> > +               }
> > +
> > +               if(rstval & wdt->card_reset)
> > +                       wdt->wdd.bootstatus |= WDIOF_CARDRESET;
> > +               if(rstval & wdt->ext1_reset)
> > +                       wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> > +               if(rstval & wdt->ext2_reset)
> > +                       wdt->wdd.bootstatus |= WDIOF_EXTERN2;
> > +       }
> > +
> > +}
> > +
> > +static u32 npcm_wdt_reset_type(const char *reset_type)
> > +{
> > +       if (!strcmp(reset_type, "porst"))
> > +               return NPCM7XX_PORST;
> > +       else if (!strcmp(reset_type, "corst"))
> > +               return NPCM7XX_CORST;
> > +       else if (!strcmp(reset_type, "wd0"))
> > +               return NPCM7XX_WD0RST;
> > +       else if (!strcmp(reset_type, "wd1"))
> > +               return NPCM7XX_WD1RST;
> > +       else if (!strcmp(reset_type, "wd2"))
> > +               return NPCM7XX_WD2RST;
> > +       else if (!strcmp(reset_type, "sw1"))
> > +               return NPCM7XX_SWR1RST;
> > +       else if (!strcmp(reset_type, "sw2"))
> > +               return NPCM7XX_SWR2RST;
> > +       else if (!strcmp(reset_type, "sw3"))
> > +               return NPCM7XX_SWR3RST;
> > +       else if (!strcmp(reset_type, "sw4"))
> > +               return NPCM7XX_SWR4RST;
> > +
> > +       return 0;
> > +}
> > +
> >  static int npcm_wdt_probe(struct platform_device *pdev)
> >  {
> >         struct device *dev = &pdev->dev;
> > +       const char *card_reset_type;
> > +       const char *ext1_reset_type;
> > +       const char *ext2_reset_type;
> >         struct npcm_wdt *wdt;
> > +       struct resource *res;
> > +       u32 priority;
> >         int irq;
> >         int ret;
> >
> > -       wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> > +       wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
> >         if (!wdt)
> >                 return -ENOMEM;
> >
> > @@ -195,6 +272,45 @@ static int npcm_wdt_probe(struct platform_device
> *pdev)
> >         if (irq < 0)
> >                 return irq;
> >
> > +       if (of_property_read_u32(pdev->dev.of_node,
> "nuvoton,restart-priority",
> > +                                &priority))
> > +               watchdog_set_restart_priority(&wdt->wdd, 128);
> > +       else
> > +               watchdog_set_restart_priority(&wdt->wdd, priority);
> > +
> > +       ret = of_property_read_string(pdev->dev.of_node,
> > +                                     "nuvoton,card-reset-type",
> > +                                     &card_reset_type);
> > +       if (ret)
> > +               wdt->card_reset = NPCM7XX_PORST;
> > +       else {
> > +               wdt->card_reset = npcm_wdt_reset_type(card_reset_type);
> > +               if (!wdt->card_reset)
> > +                       wdt->card_reset = NPCM7XX_PORST;
> > +       }
> > +
> > +       ret = of_property_read_string(pdev->dev.of_node,
> > +                                     "nuvoton,ext1-reset-type",
> > +                                     &ext1_reset_type);
> > +       if (ret)
> > +               wdt->ext1_reset = NPCM7XX_WD0RST;
> > +       else {
> > +               wdt->ext1_reset = npcm_wdt_reset_type(ext1_reset_type);
> > +               if (!wdt->ext1_reset)
> > +                       wdt->ext1_reset = NPCM7XX_WD0RST;
> > +       }
> > +
> > +       ret = of_property_read_string(pdev->dev.of_node,
> > +                                     "nuvoton,ext2-reset-type",
> > +                                     &ext2_reset_type);
> > +       if (ret)
> > +               wdt->ext2_reset = NPCM7XX_SWR1RST;
> > +       else {
> > +               wdt->ext2_reset = npcm_wdt_reset_type(ext2_reset_type);
> > +               if (!wdt->ext2_reset)
> > +                       wdt->ext2_reset = NPCM7XX_SWR1RST;
> > +       }
> > +
> >         wdt->wdd.info = &npcm_wdt_info;
> >         wdt->wdd.ops = &npcm_wdt_ops;
> >         wdt->wdd.min_timeout = 1;
> > @@ -213,6 +329,7 @@ static int npcm_wdt_probe(struct platform_device
> *pdev)
> >                 set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
> >         }
> >
> > +       npcm_get_reset_status(wdt, dev);
> >         ret = devm_request_irq(dev, irq, npcm_wdt_interrupt, 0,
> "watchdog",
> >                                wdt);
> >         if (ret)
> > --
> > 2.22.0
> >
>

--0000000000005368df05b8a4a4f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 11 Jan 2021 at 02:55, Joel St=
anley &lt;<a href=3D"mailto:joel@jms.id.au">joel@jms.id.au</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 5 Jan 202=
1 at 13:45, Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com" target=
=3D"_blank">tmaimon77@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Add Device tree restart priority and<br>
&gt; three reset types support.<br>
&gt;<br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
<br>
Can you remind me the history of this change. Was a similar patch<br>
rejected by mainline?<br></blockquote><div><a href=3D"https://www.spinics.n=
et/lists/kernel/msg3425926.html">https://www.spinics.net/lists/kernel/msg34=
25926.html</a>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
&gt; ---<br>
&gt;=C2=A0 drivers/watchdog/npcm_wdt.c | 121 ++++++++++++++++++++++++++++++=
+++++-<br>
&gt;=C2=A0 1 file changed, 119 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c=
<br>
&gt; index 765577f11c8d..bbf27da34834 100644<br>
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
&gt; +/* NPCM7xx GCR module */<br>
&gt; +#define NPCM7XX_RESSR_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x6C<br>
&gt; +#define NPCM7XX_INTCR2_OFFSET=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x60<=
br>
&gt; +<br>
&gt; +#define NPCM7XX_PORST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 BIT(31)<br>
&gt; +#define NPCM7XX_CORST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 BIT(30)<br>
&gt; +#define NPCM7XX_WD0RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT(29)<br>
&gt; +#define NPCM7XX_WD1RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT(24)<br>
&gt; +#define NPCM7XX_WD2RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0BIT(23)<br>
&gt; +#define NPCM7XX_SWR1RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(28)<br>
&gt; +#define NPCM7XX_SWR2RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(27)<br>
&gt; +#define NPCM7XX_SWR3RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(26)<br>
&gt; +#define NPCM7XX_SWR4RST=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BIT(25)<br>
&gt; +<br>
&gt; + /* WD register */<br>
&gt;=C2=A0 #define NPCM_WTCR=C2=A0 =C2=A0 =C2=A0 0x1C<br>
&gt;<br>
&gt;=C2=A0 #define NPCM_WTCLK=C2=A0 =C2=A0 =C2=A0(BIT(10) | BIT(11))=C2=A0 =
=C2=A0 =C2=A0/* Clock divider */<br>
&gt; @@ -43,6 +60,10 @@<br>
&gt;=C2=A0 struct npcm_wdt {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct watchdog_device=C2=A0 wdd;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 *reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0card_reset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ext1_reset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ext2_reset;<br>
&gt; +<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt;=C2=A0 static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_devic=
e *wdd)<br>
&gt; @@ -176,14 +197,70 @@ static const struct watchdog_ops npcm_wdt_ops =
=3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.restart =3D npcm_wdt_restart,<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; +static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device=
 *dev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct regmap *gcr_regmap;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 rstval;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_device_is_compatible(dev-&gt;of_nod=
e, &quot;nuvoton,npcm750-wdt&quot;)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gcr_regmap =3D=
 syscon_regmap_lookup_by_compatible(&quot;nuvoton,npcm750-gcr&quot;);<br>
<br>
This will have the same issues as the ADC with supporting multiple<br>
families of chip with the same code. I suggest you adjust it to use<br>
the phandle approach.<br><br></blockquote><div>Do you mean by having a gcr =
phandle property in the wdt npcm device tree node?</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(gcr=
_regmap)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dev_warn(dev, &quot;Failed to find nuvoton,npcm750-gcr WD res=
et status not supported\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regmap_read(gc=
r_regmap, NPCM7XX_RESSR_OFFSET, &amp;rstval);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!rstval) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET, &amp;rstval);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0rstval =3D ~rstval;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(rstval &amp=
; wdt-&gt;card_reset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0wdt-&gt;wdd.bootstatus |=3D WDIOF_CARDRESET;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(rstval &amp=
; wdt-&gt;ext1_reset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0wdt-&gt;wdd.bootstatus |=3D WDIOF_EXTERN1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if(rstval &amp=
; wdt-&gt;ext2_reset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0wdt-&gt;wdd.bootstatus |=3D WDIOF_EXTERN2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +}<br>
&gt; +<br>
&gt; +static u32 npcm_wdt_reset_type(const char *reset_type)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!strcmp(reset_type, &quot;porst&quot;)=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX=
_PORST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;corst&q=
uot;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX=
_CORST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;wd0&quo=
t;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX=
_WD0RST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;wd1&quo=
t;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX=
_WD1RST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;wd2&quo=
t;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX=
_WD2RST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;sw1&quo=
t;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX=
_SWR1RST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;sw2&quo=
t;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX=
_SWR2RST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;sw3&quo=
t;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX=
_SWR3RST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (!strcmp(reset_type, &quot;sw4&quo=
t;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NPCM7XX=
_SWR4RST;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static int npcm_wdt_probe(struct platform_device *pdev)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *dev =3D &amp;pdev-&gt;=
dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *card_reset_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ext1_reset_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ext2_reset_type;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct npcm_wdt *wdt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 priority;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int irq;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0wdt =3D devm_kzalloc(dev, sizeof(*wdt), GF=
P_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0wdt =3D devm_kzalloc(&amp;pdev-&gt;dev, si=
zeof(*wdt), GFP_KERNEL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!wdt)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
NOMEM;<br>
&gt;<br>
&gt; @@ -195,6 +272,45 @@ static int npcm_wdt_probe(struct platform_device =
*pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (irq &lt; 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ir=
q;<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (of_property_read_u32(pdev-&gt;dev.of_n=
ode, &quot;nuvoton,restart-priority&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;priority))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0watchdog_set_r=
estart_priority(&amp;wdt-&gt;wdd, 128);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0watchdog_set_r=
estart_priority(&amp;wdt-&gt;wdd, priority);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_string(pdev-&gt;d=
ev.of_node,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nuvoto=
n,card-reset-type&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;card_re=
set_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;card_r=
eset =3D NPCM7XX_PORST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;card_r=
eset =3D npcm_wdt_reset_type(card_reset_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!wdt-&gt;c=
ard_reset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0wdt-&gt;card_reset =3D NPCM7XX_PORST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_string(pdev-&gt;d=
ev.of_node,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nuvoto=
n,ext1-reset-type&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;ext1_re=
set_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;ext1_r=
eset =3D NPCM7XX_WD0RST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;ext1_r=
eset =3D npcm_wdt_reset_type(ext1_reset_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!wdt-&gt;e=
xt1_reset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0wdt-&gt;ext1_reset =3D NPCM7XX_WD0RST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D of_property_read_string(pdev-&gt;d=
ev.of_node,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;nuvoto=
n,ext2-reset-type&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;ext2_re=
set_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;ext2_r=
eset =3D NPCM7XX_SWR1RST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;ext2_r=
eset =3D npcm_wdt_reset_type(ext2_reset_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!wdt-&gt;e=
xt2_reset)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0wdt-&gt;ext2_reset =3D NPCM7XX_SWR1RST;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;<a href=3D"http://wdd.info" r=
el=3D"noreferrer" target=3D"_blank">wdd.info</a> =3D &amp;npcm_wdt_info;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;wdd.ops =3D &amp;npcm_wdt_ops=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wdt-&gt;wdd.min_timeout =3D 1;<br>
&gt; @@ -213,6 +329,7 @@ static int npcm_wdt_probe(struct platform_device *=
pdev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_bit(W=
DOG_HW_RUNNING, &amp;wdt-&gt;wdd.status);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0npcm_get_reset_status(wdt, dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D devm_request_irq(dev, irq, np=
cm_wdt_interrupt, 0, &quot;watchdog&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wdt);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; --<br>
&gt; 2.22.0<br>
&gt;<br>
</blockquote></div></div>

--0000000000005368df05b8a4a4f7--
