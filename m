Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 984BF291452
	for <lists+openbmc@lfdr.de>; Sat, 17 Oct 2020 22:33:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CDF946SpHzDqdc
	for <lists+openbmc@lfdr.de>; Sun, 18 Oct 2020 07:33:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CDF7y5pqhzDqYq
 for <openbmc@lists.ozlabs.org>; Sun, 18 Oct 2020 07:32:45 +1100 (AEDT)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kTssM-002BpP-Cq; Sat, 17 Oct 2020 22:32:26 +0200
Date: Sat, 17 Oct 2020 22:32:26 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH v1 1/2] net: ftgmac100: move phy connect out from
 ftgmac100_setup_mdio
Message-ID: <20201017203226.GQ456889@lunn.ch>
References: <20201015124917.8168-1-i.mikhaylov@yadro.com>
 <20201015124917.8168-2-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015124917.8168-2-i.mikhaylov@yadro.com>
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
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Oct 15, 2020 at 03:49:16PM +0300, Ivan Mikhaylov wrote:
> Split MDIO registration and PHY connect into ftgmac100_setup_mdio and
> ftgmac100_mii_probe.
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 92 ++++++++++++------------
>  1 file changed, 47 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 87236206366f..6997e121824b 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1044,11 +1044,47 @@ static void ftgmac100_adjust_link(struct net_device *netdev)
>  	schedule_work(&priv->reset_task);
>  }
>  
> -static int ftgmac100_mii_probe(struct ftgmac100 *priv, phy_interface_t intf)
> +static int ftgmac100_mii_probe(struct net_device *netdev)
>  {
> -	struct net_device *netdev = priv->netdev;
> +	struct ftgmac100 *priv = netdev_priv(netdev);
> +	struct platform_device *pdev = to_platform_device(priv->dev);
> +	struct device_node *np = pdev->dev.of_node;
> +	phy_interface_t phy_intf = PHY_INTERFACE_MODE_RGMII;
>  	struct phy_device *phydev;

Reverse Christmas tree.

>  
> +	/* Get PHY mode from device-tree */
> +	if (np) {
> +		/* Default to RGMII. It's a gigabit part after all */
> +		phy_intf = of_get_phy_mode(np, &phy_intf);
> +		if (phy_intf < 0)
> +			phy_intf = PHY_INTERFACE_MODE_RGMII;

I know you are just moving code around, but it is better to do:

> +		err = of_get_phy_mode(np, &phy_intf);
> +		if (err)
> +			phy_intf = PHY_INTERFACE_MODE_RGMII;

With the code you have, you are probably going to get an email about
assigning an int to an unsigned int type from Colin..

> @@ -1860,6 +1854,14 @@ static int ftgmac100_probe(struct platform_device *pdev)
>  		err = ftgmac100_setup_mdio(netdev);
>  		if (err)
>  			goto err_setup_mdio;
> +
> +		err = ftgmac100_mii_probe(netdev);
> +		if (err) {
> +			dev_err(priv->dev, "MII probe failed!\n");
> +			mdiobus_unregister(priv->mii_bus);
> +			goto err_setup_mdio;
> +		}

It is more uniform to add a new label and add the
mdiobus_unregister(priv->mii_bus) there. All the other error handling
works like that.

      Andrew
