Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EC18FE434
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 12:24:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aoFevruX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw0nb0MpCz3dLd
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 20:24:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aoFevruX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw0n32v1Nz3d89
	for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2024 20:24:22 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52b82d57963so939108e87.2
        for <openbmc@lists.ozlabs.org>; Thu, 06 Jun 2024 03:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717669459; x=1718274259; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f4WnoT1fe4t4g6laaxr/UqBSAP7voCUP3G6EsC2u08s=;
        b=aoFevruXrXLFSr+auvvS8e38d0umO00GRGl6fXH9geFDvZIX6VXzZybLfJCZs+iALX
         HlxbY440jlgn42HmKx3iUEVTqfTYFbEJrfwnuKPJ0QayEMxlMWQ92dFpjGivhFL/1esL
         vRSiAx1tKNxG6pmcu13OSQPTHeuHEKHA2y/+hVWHSwMzOTcHm7U7/FWrUug+o3rDMqaC
         AxrEe4iO3ejJ4P09rBZjTXtIjsV/YRggdoE557390SrPigaGvfB+j0r7uUeeJsPUSqJq
         RpDmkMIst9QZe+OvJ221aOYWzL6U/qQcWCYvrvaSdOlfqEzMtjo0wRlgHVRExGlAFWuT
         M9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717669459; x=1718274259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4WnoT1fe4t4g6laaxr/UqBSAP7voCUP3G6EsC2u08s=;
        b=BfEWRORGvMqfIldi17Ny4IqttcJ70znpN0mgae0SHqTAH9MBEk0lmiKGmOe48gDPmU
         F+a8sTB3OJ3WLJMBnSZCMzhoXe1SThGF+GOIUPRgI4BZfT8nr5lUXMotnGK2E+WcJ+1Q
         aeyyi6fELLjFoscNt4rq6+bCWUBhUJlntY8orCK7KuqCUkhA7QnlwdNoQtiMSRa9cw0N
         /SIypW6MiXV5vwf3x2aqAdhB5FPn7+D4o5XLXfV/s5vNrjV7j8F/pf1/+QM3IZpQjO48
         JgzVh2kpicc7O36Lke4Fo9csXmmN5lwIOJrH9AUphzohz03IDLveIRi9wO58FaSW6/Zp
         3jBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKlTlZQe9ylqhlmSZiCMmWwkjGtUg7NmCBj8mYeosyWdpzPJlhsFmeUjNiIot0yBMFWTfEPVwXHQhnGsyLvFYCHT5OaYMgYWA=
X-Gm-Message-State: AOJu0Yy9V7fal+CdYGrClaapXrT0eG0Ph5H5nWsSyh7lNc/cq4Q2grAM
	6K3xqbLmD25X9TEUTijur3MrQt7LN7m1lWXutYwRdFpGyQLCfvwh
X-Google-Smtp-Source: AGHT+IGD1+RWYMQNl7g5DBJNyh/Rk7DFAJoyKbW8svrOWxknhhhPq+wBqdzF9X+G+AnjMD2oSbecGw==
X-Received: by 2002:a05:6512:108a:b0:52b:c9a:148 with SMTP id 2adb3069b0e04-52bab4b7c95mr3439377e87.14.1717669458562;
        Thu, 06 Jun 2024 03:24:18 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41e2054sm152799e87.49.2024.06.06.03.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:24:18 -0700 (PDT)
Date: Thu, 6 Jun 2024 13:24:14 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v2 08/10] net: pcs: xpcs: Add fwnode-based
 descriptor creation method
Message-ID: <7bcu77pbw3fsgcua2owbjqgjwuxagplexltgkilozmeihg6574@6m5iizhtj2de>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-9-fancer.lancer@gmail.com>
 <20240605174920.GR791188@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605174920.GR791188@kernel.org>
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

Hi Simon

On Wed, Jun 05, 2024 at 06:49:20PM +0100, Simon Horman wrote:
> On Sun, Jun 02, 2024 at 05:36:22PM +0300, Serge Semin wrote:
> > It's now possible to have the DW XPCS device defined as a standard
> > platform device for instance in the platform DT-file. Although that
> > functionality is useless unless there is a way to have the device found by
> > the client drivers (STMMAC/DW *MAC, NXP SJA1105 Eth Switch, etc). Provide
> > such ability by means of the xpcs_create_fwnode() method. It needs to be
> > called with the device DW XPCS fwnode instance passed. That node will be
> > then used to find the MDIO-device instance in order to create the DW XPCS
> > descriptor.
> > 
> > Note the method semantics and name is similar to what has been recently
> > introduced in the Lynx PCS driver.
> > 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> 
> Hi Serge,
> 
> Some minor nits from my side flagged by kernel-doc -none -Wall
> 
> ...
> 
> > diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> 
> ...
> 
> > @@ -1505,6 +1507,16 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
> >  	return ERR_PTR(ret);
> >  }
> >  
> > +/**
> > + * xpcs_create_mdiodev() - create a DW xPCS instance with the MDIO @addr
> > + * @bus: pointer to the MDIO-bus descriptor for the device to be looked at
> > + * @addr: device MDIO-bus ID
> > + * @requested PHY interface
> 
> An entry for @interface should go here.

Right.

> 
> > + *
> > + * If successful, returns a pointer to the DW XPCS handle. Otherwise returns
> > + * -ENODEV if device couldn't be found on the bus, other negative errno related
> > + * to the data allocation and MDIO-bus communications.
> 
> Please consider including this information as a Return: section of the
> Kernel doc. Likewise for xpcs_create_fwnode().

Sure.

> 
> > + */
> >  struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
> >  				    phy_interface_t interface)
> >  {
> > @@ -1529,6 +1541,44 @@ struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
> >  }
> >  EXPORT_SYMBOL_GPL(xpcs_create_mdiodev);
> >  
> > +/**
> > + * xpcs_create_fwnode() - Create a DW xPCS instance from @fwnode
> > + * @node: fwnode handle poining to the DW XPCS device
> 
> s/@node/@fwnode/

Holy mother, so many typos in the kdoc part. I should have been more
attentive. I'll fix all of them in v2. Thanks.

* Special thanks for mentioning the scripts/kernel-doc I'll be using
it from now on.

-Serge(y)

> 
> > + * @interface: requested PHY interface
> > + *
> > + * If successful, returns a pointer to the DW XPCS handle. Otherwise returns
> > + * -ENODEV if the fwnode is marked unavailable or device couldn't be found on
> > + * the bus, -EPROBE_DEFER if the respective MDIO-device instance couldn't be
> > + * found, other negative errno related to the data allocations and MDIO-bus
> > + * communications.
> > + */
> > +struct dw_xpcs *xpcs_create_fwnode(struct fwnode_handle *fwnode,
> > +				   phy_interface_t interface)
> 
> ...
