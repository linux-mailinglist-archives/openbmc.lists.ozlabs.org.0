Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF6028D985
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 07:24:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB17p6xvGzDqkV
	for <lists+openbmc@lfdr.de>; Wed, 14 Oct 2020 16:24:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=diIpUdpO; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB17120GPzDqd9
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2020 16:24:10 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id z6so1815716qkz.4
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2020 22:24:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FTyZGQt5KuUq5z9rLb8JACAK351D3dXLreYGG/tKXVU=;
 b=diIpUdpOtSV4sSvCBvKNWhs7ZVOX7jK4RnfEdeWAsCYaUrVPDszwPH83pDq7dic93M
 yZTvemAoQO0OeJ4cCOCzW9b9XnJWVTXMTzXR6syLi296zlxl5d5ISSHGiOH3LAq/e0wE
 A6tRFAlghW5ORpDgkkLGe73lZF3OEvkz6+OzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FTyZGQt5KuUq5z9rLb8JACAK351D3dXLreYGG/tKXVU=;
 b=UyOMp9Mt4y29m6XeYchIIpOVJjS8bW+YLRgAWWXh+ml7vmPzAvnL5MX/PjL7MYferr
 UKqcXGlycvVeZ5vGyVgTWS07qYGwKnm4OaWpoLdkbQVxxop12P3YPobivTxkNxiUeCjv
 dYlNJmbtfX7poSTX89YI6r3KcZKsigGqdCU+dP8h3zcGYskUmz8BO9ArmpN1286fLeXh
 i9l3emw9+D5hhTIZCnAN7guplQkQfb9CRj0RdedczsuFNBuJSP76T483+G8olBchNfHr
 sfgciDsiDbmRNyRIvNttz8ewOpIQS2ifx82T82/ruaAgORE0M7Wr1cTTisszxhsKt9iD
 zN0g==
X-Gm-Message-State: AOAM5327dzuu28vEDs4mxdHAdUNTwUf5l/Xw6D2+2+gWRGcRsiFGOOyC
 GULPSepuPG3RYLb5GptGWYNZEpw+uqgDtxYKA08=
X-Google-Smtp-Source: ABdhPJysj5Reu8MnR7DVpnqtn6pSEkgSjtKEx/emy7+JdxFCEd4IAp6Iy3iA6zABlbBgCs7XqY/4pg0ZdaFQnK8vO7M=
X-Received: by 2002:a37:4a4d:: with SMTP id x74mr3469230qka.55.1602653044494; 
 Tue, 13 Oct 2020 22:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201013124014.2989-1-i.mikhaylov@yadro.com>
 <20201013124014.2989-2-i.mikhaylov@yadro.com>
In-Reply-To: <20201013124014.2989-2-i.mikhaylov@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 14 Oct 2020 05:23:52 +0000
Message-ID: <CACPK8Xd_gCVjVm13O85+mnZ4VbhQorG4qiy+mVevrvyCbPg9XQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] net: ftgmac100: add handling of mdio/phy nodes for
 ast2400/2500
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
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
Cc: Po-Yu Chuang <ratbert@faraday-tech.com>, netdev@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ivan,

On Tue, 13 Oct 2020 at 12:38, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
>
> phy-handle can't be handled well for ast2400/2500 which has an embedded
> MDIO controller. Add ftgmac100_mdio_setup for ast2400/2500 and initialize
> PHYs from mdio child node with of_mdiobus_register.

Good idea. The driver has become a mess of different ways to connect
the phy and it needs to be cleaned up. I have a patch that fixes
rmmod, which is currently broken.



>
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 114 ++++++++++++++---------
>  1 file changed, 69 insertions(+), 45 deletions(-)
>
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 87236206366f..e32066519ec1 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1044,11 +1044,47 @@ static void ftgmac100_adjust_link(struct net_device *netdev)
>         schedule_work(&priv->reset_task);
>  }
>
> -static int ftgmac100_mii_probe(struct ftgmac100 *priv, phy_interface_t intf)
> +static int ftgmac100_mii_probe(struct net_device *netdev)
>  {
> -       struct net_device *netdev = priv->netdev;
> +       struct ftgmac100 *priv = netdev_priv(netdev);
> +       struct platform_device *pdev = to_platform_device(priv->dev);
> +       struct device_node *np = pdev->dev.of_node;
> +       phy_interface_t phy_intf = PHY_INTERFACE_MODE_RGMII;
>         struct phy_device *phydev;
>
> +       /* Get PHY mode from device-tree */
> +       if (np) {
> +               /* Default to RGMII. It's a gigabit part after all */
> +               phy_intf = of_get_phy_mode(np, &phy_intf);
> +               if (phy_intf < 0)
> +                       phy_intf = PHY_INTERFACE_MODE_RGMII;
> +
> +               /* Aspeed only supports these. I don't know about other IP
> +                * block vendors so I'm going to just let them through for
> +                * now. Note that this is only a warning if for some obscure
> +                * reason the DT really means to lie about it or it's a newer
> +                * part we don't know about.
> +                *
> +                * On the Aspeed SoC there are additionally straps and SCU
> +                * control bits that could tell us what the interface is
> +                * (or allow us to configure it while the IP block is held
> +                * in reset). For now I chose to keep this driver away from
> +                * those SoC specific bits and assume the device-tree is
> +                * right and the SCU has been configured properly by pinmux
> +                * or the firmware.
> +                */
> +               if (priv->is_aspeed &&
> +                   phy_intf != PHY_INTERFACE_MODE_RMII &&
> +                   phy_intf != PHY_INTERFACE_MODE_RGMII &&
> +                   phy_intf != PHY_INTERFACE_MODE_RGMII_ID &&
> +                   phy_intf != PHY_INTERFACE_MODE_RGMII_RXID &&
> +                   phy_intf != PHY_INTERFACE_MODE_RGMII_TXID) {
> +                       netdev_warn(netdev,
> +                                   "Unsupported PHY mode %s !\n",
> +                                   phy_modes(phy_intf));
> +               }

Why do we move this?

> +       }
> +
>         phydev = phy_find_first(priv->mii_bus);
>         if (!phydev) {
>                 netdev_info(netdev, "%s: no PHY found\n", netdev->name);
> @@ -1056,7 +1092,7 @@ static int ftgmac100_mii_probe(struct ftgmac100 *priv, phy_interface_t intf)
>         }
>
>         phydev = phy_connect(netdev, phydev_name(phydev),
> -                            &ftgmac100_adjust_link, intf);
> +                            &ftgmac100_adjust_link, phy_intf);
>
>         if (IS_ERR(phydev)) {
>                 netdev_err(netdev, "%s: Could not attach to PHY\n", netdev->name);
> @@ -1601,8 +1637,8 @@ static int ftgmac100_setup_mdio(struct net_device *netdev)
>  {
>         struct ftgmac100 *priv = netdev_priv(netdev);
>         struct platform_device *pdev = to_platform_device(priv->dev);
> -       phy_interface_t phy_intf = PHY_INTERFACE_MODE_RGMII;
>         struct device_node *np = pdev->dev.of_node;
> +       struct device_node *mdio_np;
>         int i, err = 0;
>         u32 reg;
>
> @@ -1623,39 +1659,6 @@ static int ftgmac100_setup_mdio(struct net_device *netdev)
>                 iowrite32(reg, priv->base + FTGMAC100_OFFSET_REVR);
>         }
>
> -       /* Get PHY mode from device-tree */
> -       if (np) {
> -               /* Default to RGMII. It's a gigabit part after all */
> -               err = of_get_phy_mode(np, &phy_intf);
> -               if (err)
> -                       phy_intf = PHY_INTERFACE_MODE_RGMII;
> -
> -               /* Aspeed only supports these. I don't know about other IP
> -                * block vendors so I'm going to just let them through for
> -                * now. Note that this is only a warning if for some obscure
> -                * reason the DT really means to lie about it or it's a newer
> -                * part we don't know about.
> -                *
> -                * On the Aspeed SoC there are additionally straps and SCU
> -                * control bits that could tell us what the interface is
> -                * (or allow us to configure it while the IP block is held
> -                * in reset). For now I chose to keep this driver away from
> -                * those SoC specific bits and assume the device-tree is
> -                * right and the SCU has been configured properly by pinmux
> -                * or the firmware.
> -                */
> -               if (priv->is_aspeed &&
> -                   phy_intf != PHY_INTERFACE_MODE_RMII &&
> -                   phy_intf != PHY_INTERFACE_MODE_RGMII &&
> -                   phy_intf != PHY_INTERFACE_MODE_RGMII_ID &&
> -                   phy_intf != PHY_INTERFACE_MODE_RGMII_RXID &&
> -                   phy_intf != PHY_INTERFACE_MODE_RGMII_TXID) {
> -                       netdev_warn(netdev,
> -                                  "Unsupported PHY mode %s !\n",
> -                                  phy_modes(phy_intf));
> -               }
> -       }
> -
>         priv->mii_bus->name = "ftgmac100_mdio";
>         snprintf(priv->mii_bus->id, MII_BUS_ID_SIZE, "%s-%d",
>                  pdev->name, pdev->id);
> @@ -1667,22 +1670,22 @@ static int ftgmac100_setup_mdio(struct net_device *netdev)
>         for (i = 0; i < PHY_MAX_ADDR; i++)
>                 priv->mii_bus->irq[i] = PHY_POLL;
>
> -       err = mdiobus_register(priv->mii_bus);
> +       mdio_np = of_get_child_by_name(np, "mdio");
> +       if (mdio_np)
> +               err = of_mdiobus_register(priv->mii_bus, mdio_np);
> +       else
> +               err = mdiobus_register(priv->mii_bus);
> +
>         if (err) {
>                 dev_err(priv->dev, "Cannot register MDIO bus!\n");
>                 goto err_register_mdiobus;
>         }
>
> -       err = ftgmac100_mii_probe(priv, phy_intf);
> -       if (err) {
> -               dev_err(priv->dev, "MII Probe failed!\n");
> -               goto err_mii_probe;
> -       }
> +       if (mdio_np)
> +               of_node_put(mdio_np);

By the time I get down here I'm lost. Do you think you could split the
change up into a few smaller patches?

If not, try to explain what the various hunks of your change are trying to do.

Cheers,

Joel

>
>         return 0;
>
> -err_mii_probe:
> -       mdiobus_unregister(priv->mii_bus);
>  err_register_mdiobus:
>         mdiobus_free(priv->mii_bus);
>         return err;
> @@ -1836,10 +1839,23 @@ static int ftgmac100_probe(struct platform_device *pdev)
>         } else if (np && of_get_property(np, "phy-handle", NULL)) {
>                 struct phy_device *phy;
>
> +               /* Support "mdio"/"phy" child nodes for ast2400/2500 with
> +                * an embedded MDIO controller. Automatically scan the DTS for
> +                * available PHYs and register them.
> +                */
> +               if (of_device_is_compatible(np, "aspeed,ast2400-mac") ||
> +                   of_device_is_compatible(np, "aspeed,ast2500-mac")) {
> +                       err = ftgmac100_setup_mdio(netdev);
> +                       if (err)
> +                               goto err_setup_mdio;
> +               }
> +
>                 phy = of_phy_get_and_connect(priv->netdev, np,
>                                              &ftgmac100_adjust_link);
>                 if (!phy) {
>                         dev_err(&pdev->dev, "Failed to connect to phy\n");
> +                       if (priv->mii_bus)
> +                               mdiobus_unregister(priv->mii_bus);
>                         goto err_setup_mdio;
>                 }
>
> @@ -1860,6 +1876,14 @@ static int ftgmac100_probe(struct platform_device *pdev)
>                 err = ftgmac100_setup_mdio(netdev);
>                 if (err)
>                         goto err_setup_mdio;
> +
> +               err = ftgmac100_mii_probe(netdev);
> +               if (err) {
> +                       dev_err(priv->dev, "MII probe failed!\n");
> +                       mdiobus_unregister(priv->mii_bus);
> +                       goto err_setup_mdio;
> +               }
> +
>         }
>
>         if (priv->is_aspeed) {
> --
> 2.21.1
>
