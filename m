Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F08880527B
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 12:23:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=VGsUfrlk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkypJ4Ch1z3cT9
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 22:23:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=VGsUfrlk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+openbmc=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skynl2dRdz3cQg
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 22:23:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ixJ2HNTOflVEtkIw9lPsvgsuTF/SutHy/lni6jq+Myc=; b=VGsUfrlkXC8ZAyffXZfVwcCK+8
	DQgoZkbr0CEW7jsTuw1iqVIrncKemqyj6pLzVxB+hTGKPXkYwJZfZc+kN6Bs/NvR7kW+kXH7NLTQr
	F5dcMBnv3p5gVQONwXCpvP5ihezZNLsrTY183aXqPu5wGuX1BcSDc08SVXf4p4LbFeYmWs6OGiohl
	gdrHylSYM2T+21z66PWK7vsB/WA3lcEhylu5b5o+gTDOfbT8YnZVRZ/ONo9giZZw/cISb+U7/LHDJ
	KkYMqAnTvnjMucWpxOOz9vryxqz2wOjG5rVdXYiLQNWgiwSh/4UdKAZx9BMXX2citboGRoHZz8nWA
	0osNnBWg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55396)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rATVq-0006gB-1w;
	Tue, 05 Dec 2023 11:22:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rATVq-0001fI-HX; Tue, 05 Dec 2023 11:22:50 +0000
Date: Tue, 5 Dec 2023 11:22:50 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next 05/16] net: pcs: xpcs: Move native device ID
 macro to linux/pcs/pcs-xpcs.h
Message-ID: <ZW8ICvzwIHJhoV9U@shell.armlinux.org.uk>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-6-fancer.lancer@gmail.com>
 <ZW7/TrtSols1igy/@shell.armlinux.org.uk>
 <bas6l42vk2zzrwo22ss7fuganf4ekvhtvkb32duydjise7ui3o@o4f3rbcpokur>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bas6l42vk2zzrwo22ss7fuganf4ekvhtvkb32duydjise7ui3o@o4f3rbcpokur>
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

On Tue, Dec 05, 2023 at 02:14:34PM +0300, Serge Semin wrote:
> On Tue, Dec 05, 2023 at 10:45:34AM +0000, Russell King (Oracle) wrote:
> > On Tue, Dec 05, 2023 at 01:35:26PM +0300, Serge Semin wrote:
> > > Generic MDIO-device driver will support setting a custom device ID for the
> > > particular MDIO-device.
> > 
> > Why future tense? I don't see anything later in this patch set adding
> > this.
> 
> After the next patch is applied
> [PATCH net-next 10/16] net: pcs: xpcs: Add generic DW XPCS MDIO-device support
> the DW XPCS driver _will_ support setting custom IDs based on the
> platform data and the DT compatibles.

What is confusing is that the sentence makes it sound like it's some
generic driver that can be used for any PCS, whereas in reality it is
_this_ XPCS driver which is not generic.

"This driver will support setting a custom device ID in a future patch."
or explicitly state the summary line of the patch concerned so one can
refer to it. Future references are difficult to find whether they're in
email and especially once they're merged into git.

> It can be used for instance to
> fix the already available SJ1105 and SJ1110 MDIO bus implementations,
> so instead of substituting the XPCS IDs on the PHYSID CSR reads the
> driver could just pass the device ID and PMA ID via the device
> platform data.
> 
> If my patch log text looks unclear anyway, just say so. I'll change it
> accordingly. I guess it would be enough to say that moving is required
> just to collect all the IDs in a single place.

You need to adjust your attitude - I did exactly that. There was
something which I didn't understand, so I raised the issue. Sorry
for spotting a problem, but do you always get arsey when a reviewer
picks up on something wrong? If that's your attitude, then for this
entire series: NAK.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
