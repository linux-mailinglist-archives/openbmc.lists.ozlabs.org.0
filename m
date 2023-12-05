Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A128055FC
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 14:32:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=Hd617gTH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sl1fR13h7z3cVS
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 00:31:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=Hd617gTH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+openbmc=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl1dm1lcXz3c8c
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 00:31:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=mFuSrbfurzuYvmLcQXdfkLqbLcdk8ZaR8luvYGQG6oo=; b=Hd617gTHXFpyvcsmWlduuhoxl9
	+rBsDK528+ELw5A8Vyt0ty+t0wmdeqmtuAzfDXdTQcBmgi9lNiJ8nxsVEm6zo8ka8B5rwB1QUCKxL
	M4csM47IUX0R0RcYt2yIZkI8fUytGP7Rl7BgXMHLGBm0kmzCtNw6uAHecqS2S+TffqqHvrEeCV6tI
	jgM4zA96DNKIIWuWj7PwSvOeZ3HyseDUPXvrIFGWyYu3q+mv4V2rWTZ+b121zOvJbcRbp7ejoGINl
	jphjMFCTQedfHaFhzrqWNdcjfP7TDL2GHMeRBeHsiKKI0lSL58ZREhC7ixf0Z3IYJmOoI9ck8PJUD
	G1/Z1vtw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48700)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rAVVw-0006pq-2E;
	Tue, 05 Dec 2023 13:31:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rAVVv-0001kI-DX; Tue, 05 Dec 2023 13:31:03 +0000
Date: Tue, 5 Dec 2023 13:31:03 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next 06/16] net: pcs: xpcs: Avoid creating dummy XPCS
 MDIO device
Message-ID: <ZW8mF5TuAEiW5FOU@shell.armlinux.org.uk>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
 <ZW8ASzkC9IFFlxkV@shell.armlinux.org.uk>
 <rgp33mm4spbpm5tmgxurkhy4is3lz3z62rz64rni2pygteyrit@zwflw2ejdkn7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rgp33mm4spbpm5tmgxurkhy4is3lz3z62rz64rni2pygteyrit@zwflw2ejdkn7>
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 05, 2023 at 02:31:41PM +0300, Serge Semin wrote:
> On Tue, Dec 05, 2023 at 10:49:47AM +0000, Russell King (Oracle) wrote:
> > On Tue, Dec 05, 2023 at 01:35:27PM +0300, Serge Semin wrote:
> > > If the DW XPCS MDIO devices are either left unmasked for being auto-probed
> > > or explicitly registered in the MDIO subsystem by means of the
> > > mdiobus_register_board_info() method there is no point in creating the
> > > dummy MDIO device instance in order to get the DW XPCS handler since the
> > > MDIO core subsystem will create the device during the MDIO bus
> > > registration procedure.
> > 
> 
> > Please reword this overly long sentence.
> 
> Ok.
> 
> > 
> > If they're left unmasked, what prevents them being created as PHY
> > devices?
> 
> Not sure I fully get what you meant. If they are left unmasked the
> MDIO-device descriptor will be created by the MDIO subsystem anyway.
> What the point in creating another one?

The MDIO bus scan looks for devices on the MDIO bus by probing each
address. If it finds a response, it creates a PHY device (struct
phy_device), and stores a pointer to the mdiodev embedded in this
structure in the array.

This device then gets registered as a PHY device, and becomes available
for use by phylib and PHY drivers.

This is something that needs to be avoided, but I don't see anything in
your series that achieves that.

> > No, this makes no sense now. This function is called
> > xpcs_create_mdiodev() - note the "create_mdiodev" part. If it's getting
> > the mdiodev from what is already there then it isn't creating it, so
> > it's no longer doing what it says in its function name. If you want to
> > add this functionality, create a new function to do it.
> 
> AFAICS the method semantics is a bit different. It's responsibility is to
> create the DW XPCS descriptor. MDIO-device is utilized internally by
> the DW XPCS driver. The function callers don't access the created MDIO
> device directly (at least since some recent commit). So AFAIU "create"
> means creating the XPCS descriptor irrespective from the internal
> communication layer. So IMO the suffix is a bit misleading. I'll
> change it in one of the next commit anyway. Should I just merge that
> patch back in this one?

This function was created (by me) to also create the mdiodev. The
function for use with a pre-existing mdiodev was xpcs_create().
But what do I know, I was only the author of this function, and of
course you're correct.

I don't like this patch anyway. Moving the mdio_device_get() etc out
of xpcs_create() is wrong. Even if you get a mdiodev from some other
place, then having xpcs_create() take a reference on it is still the
correct thing to do. My conclusion is you don't understand refcounting.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
