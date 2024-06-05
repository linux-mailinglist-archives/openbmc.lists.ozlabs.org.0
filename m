Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B678FD459
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2024 19:50:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rm4Xt4VM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VvZjh4MScz3cTQ
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 03:50:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rm4Xt4VM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=horms@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvZj86ByHz30V5
	for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2024 03:49:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E14B1619E6;
	Wed,  5 Jun 2024 17:49:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B24C2BD11;
	Wed,  5 Jun 2024 17:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717609768;
	bh=FwUaowYM9CbMgAtVVYcQAHzZ74XJ4DqCZ2hH6TrRPps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rm4Xt4VMCa0Bdg1NIpHXW5I3D+Rfzouxtpn5mhNpaNTLNw1F6TEZNlQtyvqkPDLgV
	 wkUFUnCjuma2YxYaid2dXDDbKEQsOdjZeZRThBRD64FI0onL0YFQd386VJyU7OffVu
	 7MJdEbqLH62CUuHtYol2hXwmf/+5YMMmlH6Rl4UKF4xI0lTpMSAc4pDAEc+jVCjZMq
	 G+LKc2JRIEsgvCcc6I4g3tLCGtuiEXWBePHFfUh8K+PNN1mzKWc/0qQWKbEMaTZN/D
	 F8PNNrD6WolqKuGuq83d4ZqDbajVYLZq7AK5VM1HwEPTROT0EjbiPmPyLMFI0uWL+a
	 ekNTSVMJc04fQ==
Date: Wed, 5 Jun 2024 18:49:20 +0100
From: Simon Horman <horms@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next v2 08/10] net: pcs: xpcs: Add fwnode-based
 descriptor creation method
Message-ID: <20240605174920.GR791188@kernel.org>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-9-fancer.lancer@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240602143636.5839-9-fancer.lancer@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Jose Abreu <joabreu@synopsys.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, Jun 02, 2024 at 05:36:22PM +0300, Serge Semin wrote:
> It's now possible to have the DW XPCS device defined as a standard
> platform device for instance in the platform DT-file. Although that
> functionality is useless unless there is a way to have the device found by
> the client drivers (STMMAC/DW *MAC, NXP SJA1105 Eth Switch, etc). Provide
> such ability by means of the xpcs_create_fwnode() method. It needs to be
> called with the device DW XPCS fwnode instance passed. That node will be
> then used to find the MDIO-device instance in order to create the DW XPCS
> descriptor.
> 
> Note the method semantics and name is similar to what has been recently
> introduced in the Lynx PCS driver.
> 
> Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

Hi Serge,

Some minor nits from my side flagged by kernel-doc -none -Wall

...

> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c

...

> @@ -1505,6 +1507,16 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
>  	return ERR_PTR(ret);
>  }
>  
> +/**
> + * xpcs_create_mdiodev() - create a DW xPCS instance with the MDIO @addr
> + * @bus: pointer to the MDIO-bus descriptor for the device to be looked at
> + * @addr: device MDIO-bus ID
> + * @requested PHY interface

An entry for @interface should go here.

> + *
> + * If successful, returns a pointer to the DW XPCS handle. Otherwise returns
> + * -ENODEV if device couldn't be found on the bus, other negative errno related
> + * to the data allocation and MDIO-bus communications.

Please consider including this information as a Return: section of the
Kernel doc. Likewise for xpcs_create_fwnode().

> + */
>  struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
>  				    phy_interface_t interface)
>  {
> @@ -1529,6 +1541,44 @@ struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
>  }
>  EXPORT_SYMBOL_GPL(xpcs_create_mdiodev);
>  
> +/**
> + * xpcs_create_fwnode() - Create a DW xPCS instance from @fwnode
> + * @node: fwnode handle poining to the DW XPCS device

s/@node/@fwnode/

> + * @interface: requested PHY interface
> + *
> + * If successful, returns a pointer to the DW XPCS handle. Otherwise returns
> + * -ENODEV if the fwnode is marked unavailable or device couldn't be found on
> + * the bus, -EPROBE_DEFER if the respective MDIO-device instance couldn't be
> + * found, other negative errno related to the data allocations and MDIO-bus
> + * communications.
> + */
> +struct dw_xpcs *xpcs_create_fwnode(struct fwnode_handle *fwnode,
> +				   phy_interface_t interface)

...
