Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E1879FA9
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 05:56:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yN5R5lQTzDqHZ
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 13:56:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cXRFi9Xs"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yJw81GDqzDqQh
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 11:32:50 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id m10so61051618edv.6
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 18:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5Ftzg7THfmAK8OMfuBiBZ76IWfuhIkncq/8zqyt2pEg=;
 b=cXRFi9Xs7adSiJ9+x1QqPHr3kKXJq+4QwiXeWuiyGUhnfzD7x+Xlf0nf9LePdzzpGs
 jrC6UqK1Lv2A/GJU9u3Iht8ecKAJsFH7QHSUgHUb1S6BqFK6TBOgQsokgu/bkgPHVO8D
 1Vlfqy4gYXJeZLbqtDztUyVuGbQsX5xB3nbC8wPz9HJcGCep1oP6xlihpg7SCnuAf984
 0p+//YdZ1pxoUiIQNDSSary8lO5mxtN/n/PgX2rveV0WR5miFbnL2eo3VJu4qzGuVUSd
 NR69lE0abWNwaprvqo769kpvEOOawbYdxvQi0DkDbPdk0EOdYMOq6+FE23Z0vRkMMqRW
 wPvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5Ftzg7THfmAK8OMfuBiBZ76IWfuhIkncq/8zqyt2pEg=;
 b=XFos+pCyrcakvk6qINsaxX1fmcO5uNAa2YESMmL58fdNyNyaBUj9RevRbUEKJDWVRz
 C5bOz9aU0Hi4n7Ljj0YvlSCyWuY/rT9Amg/eXma94g367ca69tq367tzIJos5/k6hp66
 +4Lz5vgDsZdUFBqNnlP10QYg8xYUKWNaQxy82E1JENc6LyFhQCHC8D61X8XECtkedgRw
 /ZMexsa9JydhyhIlmXl0dgLQ7JSHTP0ffpuhAGo3h9zYKvw6jYYyw/8GQCDx2vT303Fe
 yUqD5ztI2zGg9xVAoellXrnrEsPR6aFfIsRW/zZvQHJV7/DJ7dqTfjE4UGgF5t2bUEhT
 3n6Q==
X-Gm-Message-State: APjAAAXxgFbR9tc3QKOGj5OiyCWMMDb96uKGmWgs3Tq8avBRcXAp44m2
 r/kLDG5t/BPuhQr2Nc+2VJpp67oXbXZJAmdtIQ0=
X-Google-Smtp-Source: APXvYqwt/QDnB9rTcjd7QhYqNNd2VrJcFwWAxBLPBnlVoaUa9E+8qUS6lr2o3cQ+y2MNazuIPOMHiQ8/FdFxQAC3UU4=
X-Received: by 2002:a50:ba19:: with SMTP id g25mr98971820edc.123.1564450366223; 
 Mon, 29 Jul 2019 18:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190730002549.86824-1-taoren@fb.com>
In-Reply-To: <20190730002549.86824-1-taoren@fb.com>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 30 Jul 2019 04:32:35 +0300
Message-ID: <CA+h21hq1+E6-ScFx425hXwTPTZHTVZbBuAm7RROFZTBOFvD8vQ@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: phy: broadcom: add 1000Base-X support
 for BCM54616S
To: Tao Ren <taoren@fb.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Jul 2019 13:53:42 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>, netdev <netdev@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Arun Parameswaran <arun.parameswaran@broadcom.com>,
 lkml <linux-kernel@vger.kernel.org>, Justin Chen <justinpopo6@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tao,

On Tue, 30 Jul 2019 at 03:31, Tao Ren <taoren@fb.com> wrote:
>
> Configure the BCM54616S for 1000Base-X mode when "brcm-phy-mode-1000bx"
> is set in device tree. This is needed when the PHY is used for fiber and
> backplane connections.
>
> The patch is inspired by commit cd9af3dac6d1 ("PHYLIB: Add 1000Base-X
> support for Broadcom bcm5482").

As far as I can see, for the commit you referenced,
PHY_BCM_FLAGS_MODE_1000BX is referenced from nowhere in the entire
mainline kernel:
https://elixir.bootlin.com/linux/latest/ident/PHY_BCM_FLAGS_MODE_1000BX
(it is supposed to be put by the MAC driver in phydev->dev_flags prior
to calling phy_connect). But I don't see the point to this - can't you
check for phydev->interface == PHY_INTERFACE_MODE_1000BASEX?
This has the advantage that no MAC driver will need to know that it's
talking to a Broadcom PHY. Additionally, no custom DT bindings are
needed.
Also, for backplane connections you probably want 1000Base-KX which
has its own AN/LT, not plain 1000Base-X.

>
> Signed-off-by: Tao Ren <taoren@fb.com>
> ---
>  drivers/net/phy/broadcom.c | 58 +++++++++++++++++++++++++++++++++++---
>  include/linux/brcmphy.h    |  4 +--
>  2 files changed, 56 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
> index 2b4e41a9d35a..6c22ac3a844b 100644
> --- a/drivers/net/phy/broadcom.c
> +++ b/drivers/net/phy/broadcom.c
> @@ -383,9 +383,9 @@ static int bcm5482_config_init(struct phy_device *phydev)
>                 /*
>                  * Select 1000BASE-X register set (primary SerDes)
>                  */
> -               reg = bcm_phy_read_shadow(phydev, BCM5482_SHD_MODE);
> -               bcm_phy_write_shadow(phydev, BCM5482_SHD_MODE,
> -                                    reg | BCM5482_SHD_MODE_1000BX);
> +               reg = bcm_phy_read_shadow(phydev, BCM54XX_SHD_MODE);
> +               bcm_phy_write_shadow(phydev, BCM54XX_SHD_MODE,
> +                                    reg | BCM54XX_SHD_MODE_1000BX);
>
>                 /*
>                  * LED1=ACTIVITYLED, LED3=LINKSPD[2]
> @@ -451,6 +451,34 @@ static int bcm5481_config_aneg(struct phy_device *phydev)
>         return ret;
>  }
>
> +static int bcm54616s_config_init(struct phy_device *phydev)
> +{
> +       int err, reg;
> +       struct device_node *np = phydev->mdio.dev.of_node;
> +
> +       err = bcm54xx_config_init(phydev);
> +
> +       if (of_property_read_bool(np, "brcm-phy-mode-1000bx")) {
> +               /* Select 1000BASE-X register set. */
> +               reg = bcm_phy_read_shadow(phydev, BCM54XX_SHD_MODE);
> +               bcm_phy_write_shadow(phydev, BCM54XX_SHD_MODE,
> +                                    reg | BCM54XX_SHD_MODE_1000BX);
> +
> +               /* Auto-negotiation doesn't seem to work quite right
> +                * in this mode, so we disable it and force it to the
> +                * right speed/duplex setting.  Only 'link status'
> +                * is important.
> +                */
> +               phydev->autoneg = AUTONEG_DISABLE;
> +               phydev->speed = SPEED_1000;
> +               phydev->duplex = DUPLEX_FULL;
> +

1000Base-X AN does not include speed negotiation, so hardcoding
SPEED_1000 is probably correct.
What is wrong with the AN of duplex settings?

> +               phydev->dev_flags |= PHY_BCM_FLAGS_MODE_1000BX;
> +       }
> +
> +       return err;
> +}
> +
>  static int bcm54616s_config_aneg(struct phy_device *phydev)
>  {
>         int ret;
> @@ -464,6 +492,27 @@ static int bcm54616s_config_aneg(struct phy_device *phydev)
>         return ret;
>  }
>
> +static int bcm54616s_read_status(struct phy_device *phydev)
> +{
> +       int ret;
> +
> +       ret = genphy_read_status(phydev);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (phydev->dev_flags & PHY_BCM_FLAGS_MODE_1000BX) {
> +               /* Only link status matters for 1000Base-X mode, so force
> +                * 1000 Mbit/s full-duplex status.
> +                */
> +               if (phydev->link) {
> +                       phydev->speed = SPEED_1000;
> +                       phydev->duplex = DUPLEX_FULL;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
>  static int brcm_phy_setbits(struct phy_device *phydev, int reg, int set)
>  {
>         int val;
> @@ -651,8 +700,9 @@ static struct phy_driver broadcom_drivers[] = {
>         .phy_id_mask    = 0xfffffff0,
>         .name           = "Broadcom BCM54616S",
>         .features       = PHY_GBIT_FEATURES,
> -       .config_init    = bcm54xx_config_init,
> +       .config_init    = bcm54616s_config_init,
>         .config_aneg    = bcm54616s_config_aneg,
> +       .read_status    = bcm54616s_read_status,
>         .ack_interrupt  = bcm_phy_ack_intr,
>         .config_intr    = bcm_phy_config_intr,
>  }, {
> diff --git a/include/linux/brcmphy.h b/include/linux/brcmphy.h
> index 6db2d9a6e503..82030155558c 100644
> --- a/include/linux/brcmphy.h
> +++ b/include/linux/brcmphy.h
> @@ -200,8 +200,8 @@
>  #define BCM5482_SHD_SSD                0x14    /* 10100: Secondary SerDes control */
>  #define BCM5482_SHD_SSD_LEDM   0x0008  /* SSD LED Mode enable */
>  #define BCM5482_SHD_SSD_EN     0x0001  /* SSD enable */
> -#define BCM5482_SHD_MODE       0x1f    /* 11111: Mode Control Register */
> -#define BCM5482_SHD_MODE_1000BX        0x0001  /* Enable 1000BASE-X registers */
> +#define BCM54XX_SHD_MODE       0x1f    /* 11111: Mode Control Register */
> +#define BCM54XX_SHD_MODE_1000BX        0x0001  /* Enable 1000BASE-X registers */

These registers are also present on my BCM5464, probably safe to
assume they're generic for the entire family.
So if you make the registers definitions common, you can probably make
the 1000Base-X configuration common as well.

>
>
>  /*
> --
> 2.17.1
>

Regards,
-Vladimir
