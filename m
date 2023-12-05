Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2036805691
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 14:53:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NktDqN5j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sl26p34BJz3d8T
	for <lists+openbmc@lfdr.de>; Wed,  6 Dec 2023 00:53:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NktDqN5j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl26G6bKfz2yLr
	for <openbmc@lists.ozlabs.org>; Wed,  6 Dec 2023 00:52:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=fp/k+9cjXPMJD2AI1NBPq4sHcsTLnY0P6a5ilpBrwwI=; b=NktDqN5jNI5Ylg9ZHDCm/VXu55
	z+DTg9FlA8wsQGtB2rP4e07ENtnZ+R782xG+VNf6Ve91GLktgfzGKWa6epkNfgsfR0hUo+dhFhhS3
	1CrG3fFgCQUD8ABXHVmW2Siqq94y127Lrsf4p0pvesSlcVu9tV0o9cHVqHfYFhdammPM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rAVqa-0026FF-6u; Tue, 05 Dec 2023 14:52:24 +0100
Date: Tue, 5 Dec 2023 14:52:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next 06/16] net: pcs: xpcs: Avoid creating dummy XPCS
 MDIO device
Message-ID: <e1806c15-757e-4af0-a8be-075aa77918c2@lunn.ch>
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, "Russell King \(Oracle\)" <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
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

Saying what Russell said, in a different way:

/*
 * Return true if the child node is for a phy. It must either:
 * o Compatible string of "ethernet-phy-idX.X"
 * o Compatible string of "ethernet-phy-ieee802.3-c45"
 * o Compatible string of "ethernet-phy-ieee802.3-c22"
 * o In the white list above (and issue a warning)
 * o No compatibility string
 *
 * A device which is not a phy is expected to have a compatible string
 * indicating what sort of device it is.
 */
bool of_mdiobus_child_is_phy(struct device_node *child)

So when walking the bus, if a node is found which fits these criteria,
its assumed to be a PHY. 

Anything on the MDIO bus which is not a PHY needs to use a compatible.

	 Andrew
