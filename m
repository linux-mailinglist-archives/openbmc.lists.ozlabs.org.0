Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF3029145E
	for <lists+openbmc@lfdr.de>; Sat, 17 Oct 2020 22:40:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CDFK84rx3zDqf5
	for <lists+openbmc@lfdr.de>; Sun, 18 Oct 2020 07:40:44 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CDFJ42B2YzDqTh
 for <openbmc@lists.ozlabs.org>; Sun, 18 Oct 2020 07:39:48 +1100 (AEDT)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kTszK-002BsT-N6; Sat, 17 Oct 2020 22:39:38 +0200
Date: Sat, 17 Oct 2020 22:39:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH v1 2/2] net: ftgmac100: add handling of mdio/phy nodes
 for ast2400/2500
Message-ID: <20201017203938.GR456889@lunn.ch>
References: <20201015124917.8168-1-i.mikhaylov@yadro.com>
 <20201015124917.8168-3-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015124917.8168-3-i.mikhaylov@yadro.com>
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

> -	err = mdiobus_register(priv->mii_bus);
> +	mdio_np = of_get_child_by_name(np, "mdio");
> +	if (mdio_np)
> +		err = of_mdiobus_register(priv->mii_bus, mdio_np);
> +	else
> +		err = mdiobus_register(priv->mii_bus);

of_mdiobus_register() will do the right thing if passed a NULL pointer
for mdio_np.

> +
>  	if (err) {
>  		dev_err(priv->dev, "Cannot register MDIO bus!\n");
>  		goto err_register_mdiobus;
>  	}
>  
> +	if (mdio_np)
> +		of_node_put(mdio_np);

of_node_put() is also happy with a NULL pointer.

> +
>  	return 0;
>  
>  err_register_mdiobus:
> @@ -1830,10 +1839,23 @@ static int ftgmac100_probe(struct platform_device *pdev)
>  	} else if (np && of_get_property(np, "phy-handle", NULL)) {
>  		struct phy_device *phy;
>  
> +		/* Support "mdio"/"phy" child nodes for ast2400/2500 with
> +		 * an embedded MDIO controller. Automatically scan the DTS for
> +		 * available PHYs and register them.
> +		 */
> +		if (of_device_is_compatible(np, "aspeed,ast2400-mac") ||
> +		    of_device_is_compatible(np, "aspeed,ast2500-mac")) {
> +			err = ftgmac100_setup_mdio(netdev);
> +			if (err)
> +				goto err_setup_mdio;
> +		}
> +
>  		phy = of_phy_get_and_connect(priv->netdev, np,
>  					     &ftgmac100_adjust_link);
>  		if (!phy) {
>  			dev_err(&pdev->dev, "Failed to connect to phy\n");
> +			if (priv->mii_bus)
> +				mdiobus_unregister(priv->mii_bus);
>  			goto err_setup_mdio;

It would be nice if the tear down was symmetric to the setup. Add an
ftgmac100_remove_mdio(), and call it on the same condition as
ftgmac100_setup_mdio().

	 Andrew
