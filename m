Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1079A2F0AAA
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 01:56:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DDZyd4tW2zDqTw
	for <lists+openbmc@lfdr.de>; Mon, 11 Jan 2021 11:56:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=BCMAING3; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DDZxq6Qh5zDqSV
 for <openbmc@lists.ozlabs.org>; Mon, 11 Jan 2021 11:55:27 +1100 (AEDT)
Received: by mail-qt1-x831.google.com with SMTP id u21so10281789qtw.11
 for <openbmc@lists.ozlabs.org>; Sun, 10 Jan 2021 16:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1CMtyoSzqlr+KwGIDgmXtJLWILq4YN9Hd/KcAZT8Gn8=;
 b=BCMAING39EJ9ygmqyO9iDAhhtHkpOejSWsjFg8hO3dyktvHqRjLhmWoWLI7wLby3wt
 WFONjIMQNoY7iaIuGnEioC/tQQVAOO8Oi9pnQ5lYw8jrsIjj3NcT300pUoLS2n1iXuTV
 tN+97PHuz1KOigC/sS5hFX9Mo2z2dr/VMII/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1CMtyoSzqlr+KwGIDgmXtJLWILq4YN9Hd/KcAZT8Gn8=;
 b=F/sNI9nCpPcRJhCBbom1ijOpvtw/tAvMpB9bzWy9ua+/b4/oNm3/0w4O7ur6vcxHae
 17vyOb/orR1klOmNWSERiwp18Wre5hm8hNNfuuM5eZWx0bdanYICrNZmP4eMWUp+TtR7
 Kl+vK3a9RpaZe1cE0l816CV+yDDPtfzGl8S4KJpt/cY9TLuGeo9ngkTsxw9PKFMCt1KE
 t8beKJoRMDhBTjpA6dZS4bzwF41R668K8q3+m/7EUbnI6XlSmO4kurPWDcSnt7FvDo1I
 EHAnAPKZHrUfMRsRCr2Je7ahfpYDU+PoC6oSV8EqT7mCwNSKRBC2KUT2HOGtRqPKcW04
 182g==
X-Gm-Message-State: AOAM532zfR8y4gIKNu1cR34RAKeCrNr3PqKE4vQYcYGypLP8NNDbvSrP
 h9vO+WyI4GxMBWCnHgg1t69wpLn36aNOMg9UIF1Cs483jDI=
X-Google-Smtp-Source: ABdhPJwFb+CkrfGNeLPQ6KtEdjxeE1XJt8PPbSSeEEUslvGGLa1noSpbW4ohAUW+HYkEgl8ZWP2H+lLZ0hPn/8ao+Pg=
X-Received: by 2002:ac8:5cce:: with SMTP id s14mr13043354qta.135.1610326523958; 
 Sun, 10 Jan 2021 16:55:23 -0800 (PST)
MIME-Version: 1.0
References: <20210105134508.225702-1-tmaimon77@gmail.com>
 <20210105134508.225702-5-tmaimon77@gmail.com>
In-Reply-To: <20210105134508.225702-5-tmaimon77@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 11 Jan 2021 00:55:11 +0000
Message-ID: <CACPK8Xdc+3zEUGWidbdAUBbwoOa+mLa60bZyqCVxy-vADZeL3Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 v2 04/11] watchdog: npcm: Add DT restart
 priority and reset type support
To: Tomer Maimon <tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 5 Jan 2021 at 13:45, Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Add Device tree restart priority and
> three reset types support.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Can you remind me the history of this change. Was a similar patch
rejected by mainline?

> ---
>  drivers/watchdog/npcm_wdt.c | 121 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 119 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> index 765577f11c8d..bbf27da34834 100644
> --- a/drivers/watchdog/npcm_wdt.c
> +++ b/drivers/watchdog/npcm_wdt.c
> @@ -11,7 +11,24 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/watchdog.h>
> -
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +
> +/* NPCM7xx GCR module */
> +#define NPCM7XX_RESSR_OFFSET           0x6C
> +#define NPCM7XX_INTCR2_OFFSET          0x60
> +
> +#define NPCM7XX_PORST                  BIT(31)
> +#define NPCM7XX_CORST                  BIT(30)
> +#define NPCM7XX_WD0RST                 BIT(29)
> +#define NPCM7XX_WD1RST                 BIT(24)
> +#define NPCM7XX_WD2RST                 BIT(23)
> +#define NPCM7XX_SWR1RST                        BIT(28)
> +#define NPCM7XX_SWR2RST                        BIT(27)
> +#define NPCM7XX_SWR3RST                        BIT(26)
> +#define NPCM7XX_SWR4RST                        BIT(25)
> +
> + /* WD register */
>  #define NPCM_WTCR      0x1C
>
>  #define NPCM_WTCLK     (BIT(10) | BIT(11))     /* Clock divider */
> @@ -43,6 +60,10 @@
>  struct npcm_wdt {
>         struct watchdog_device  wdd;
>         void __iomem            *reg;
> +       u32                     card_reset;
> +       u32                     ext1_reset;
> +       u32                     ext2_reset;
> +
>  };
>
>  static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
> @@ -176,14 +197,70 @@ static const struct watchdog_ops npcm_wdt_ops = {
>         .restart = npcm_wdt_restart,
>  };
>
> +static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device *dev)
> +{
> +       struct regmap *gcr_regmap;
> +       u32 rstval;
> +
> +       if (of_device_is_compatible(dev->of_node, "nuvoton,npcm750-wdt")) {
> +               gcr_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-gcr");

This will have the same issues as the ADC with supporting multiple
families of chip with the same code. I suggest you adjust it to use
the phandle approach.



> +               if (IS_ERR(gcr_regmap)) {
> +                       dev_warn(dev, "Failed to find nuvoton,npcm750-gcr WD reset status not supported\n");
> +               }
> +
> +               regmap_read(gcr_regmap, NPCM7XX_RESSR_OFFSET, &rstval);
> +               if (!rstval) {
> +                       regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET, &rstval);
> +                       rstval = ~rstval;
> +               }
> +
> +               if(rstval & wdt->card_reset)
> +                       wdt->wdd.bootstatus |= WDIOF_CARDRESET;
> +               if(rstval & wdt->ext1_reset)
> +                       wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> +               if(rstval & wdt->ext2_reset)
> +                       wdt->wdd.bootstatus |= WDIOF_EXTERN2;
> +       }
> +
> +}
> +
> +static u32 npcm_wdt_reset_type(const char *reset_type)
> +{
> +       if (!strcmp(reset_type, "porst"))
> +               return NPCM7XX_PORST;
> +       else if (!strcmp(reset_type, "corst"))
> +               return NPCM7XX_CORST;
> +       else if (!strcmp(reset_type, "wd0"))
> +               return NPCM7XX_WD0RST;
> +       else if (!strcmp(reset_type, "wd1"))
> +               return NPCM7XX_WD1RST;
> +       else if (!strcmp(reset_type, "wd2"))
> +               return NPCM7XX_WD2RST;
> +       else if (!strcmp(reset_type, "sw1"))
> +               return NPCM7XX_SWR1RST;
> +       else if (!strcmp(reset_type, "sw2"))
> +               return NPCM7XX_SWR2RST;
> +       else if (!strcmp(reset_type, "sw3"))
> +               return NPCM7XX_SWR3RST;
> +       else if (!strcmp(reset_type, "sw4"))
> +               return NPCM7XX_SWR4RST;
> +
> +       return 0;
> +}
> +
>  static int npcm_wdt_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> +       const char *card_reset_type;
> +       const char *ext1_reset_type;
> +       const char *ext2_reset_type;
>         struct npcm_wdt *wdt;
> +       struct resource *res;
> +       u32 priority;
>         int irq;
>         int ret;
>
> -       wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
> +       wdt = devm_kzalloc(&pdev->dev, sizeof(*wdt), GFP_KERNEL);
>         if (!wdt)
>                 return -ENOMEM;
>
> @@ -195,6 +272,45 @@ static int npcm_wdt_probe(struct platform_device *pdev)
>         if (irq < 0)
>                 return irq;
>
> +       if (of_property_read_u32(pdev->dev.of_node, "nuvoton,restart-priority",
> +                                &priority))
> +               watchdog_set_restart_priority(&wdt->wdd, 128);
> +       else
> +               watchdog_set_restart_priority(&wdt->wdd, priority);
> +
> +       ret = of_property_read_string(pdev->dev.of_node,
> +                                     "nuvoton,card-reset-type",
> +                                     &card_reset_type);
> +       if (ret)
> +               wdt->card_reset = NPCM7XX_PORST;
> +       else {
> +               wdt->card_reset = npcm_wdt_reset_type(card_reset_type);
> +               if (!wdt->card_reset)
> +                       wdt->card_reset = NPCM7XX_PORST;
> +       }
> +
> +       ret = of_property_read_string(pdev->dev.of_node,
> +                                     "nuvoton,ext1-reset-type",
> +                                     &ext1_reset_type);
> +       if (ret)
> +               wdt->ext1_reset = NPCM7XX_WD0RST;
> +       else {
> +               wdt->ext1_reset = npcm_wdt_reset_type(ext1_reset_type);
> +               if (!wdt->ext1_reset)
> +                       wdt->ext1_reset = NPCM7XX_WD0RST;
> +       }
> +
> +       ret = of_property_read_string(pdev->dev.of_node,
> +                                     "nuvoton,ext2-reset-type",
> +                                     &ext2_reset_type);
> +       if (ret)
> +               wdt->ext2_reset = NPCM7XX_SWR1RST;
> +       else {
> +               wdt->ext2_reset = npcm_wdt_reset_type(ext2_reset_type);
> +               if (!wdt->ext2_reset)
> +                       wdt->ext2_reset = NPCM7XX_SWR1RST;
> +       }
> +
>         wdt->wdd.info = &npcm_wdt_info;
>         wdt->wdd.ops = &npcm_wdt_ops;
>         wdt->wdd.min_timeout = 1;
> @@ -213,6 +329,7 @@ static int npcm_wdt_probe(struct platform_device *pdev)
>                 set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
>         }
>
> +       npcm_get_reset_status(wdt, dev);
>         ret = devm_request_irq(dev, irq, npcm_wdt_interrupt, 0, "watchdog",
>                                wdt);
>         if (ret)
> --
> 2.22.0
>
