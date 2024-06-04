Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9D78FAED7
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 11:31:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=dxHUTOg0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtlj22fFPz3cWk
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 19:31:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=dxHUTOg0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+openbmc=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vtlh254cxz3cVv
	for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2024 19:30:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cJHyOTgW8f0pN+pCyR+4SzbNPLvRm+LG1KsjKfxQdzA=; b=dxHUTOg0VSgGtqy42SOW3p4CjT
	xELElaKATDvZn+4zAtgTGWkoldejd08xOyaxJnIVgQrlu8tIkMwvMKusSfH5yaJYR4ZwGpBBf0FAH
	Xx/+52i5aucCmHzD3vNYfLHSBr2DBCkYJIuir2Iwup7LzHLfVGH81x0O+yMQM31E70ybtpqcPgQON
	KD8qUlExo9NOnB0TWy+Gtj+/o4Pz3Vr1bM4mLE8d7amME2uyD9EiHLAXZ53LXPwxzJXRx79T3XBh6
	VSNb3uuDcU9x+wM7+4GuK80w2hl5VMkilDZjm7QoOCZ4b05S10EOXS1E6XXblqfHNMGb24x/u1VUh
	KiaYStGQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49244)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sEQUD-0003hA-0U;
	Tue, 04 Jun 2024 10:29:45 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sEQU9-0001IS-3H; Tue, 04 Jun 2024 10:29:41 +0100
Date: Tue, 4 Jun 2024 10:29:40 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next v2 10/10] net: stmmac: Add DW XPCS specified via
 "pcs-handle" support
Message-ID: <Zl7ehKqLlzTUQIJG@shell.armlinux.org.uk>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-11-fancer.lancer@gmail.com>
 <2lpomvxhmh7bxqhkuexukztwzjfblulobepmnc4g4us7leldgp@o3a3zgnpua2a>
 <Zl2G+gK8qpBjGpb3@shell.armlinux.org.uk>
 <equlcrx6dgdtrmrlnxxhdunpghw46sjcyn5z6m6lszyiddbag4@eo6oeotzsxef>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <equlcrx6dgdtrmrlnxxhdunpghw46sjcyn5z6m6lszyiddbag4@eo6oeotzsxef>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, linux-stm32@st-md-mailman.stormreply.com, Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org, Maxime Chevallier <maxime.chevallier@bootlin.com>, Jose Abreu <joabreu@synopsys.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>, linux-arm-kernel@lists.infradead.org, Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "Da
 vid S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jun 04, 2024 at 12:04:57PM +0300, Serge Semin wrote:
> On Mon, Jun 03, 2024 at 10:03:54AM +0100, Russell King (Oracle) wrote:
> > I can't think of a reasonable solution to this at the moment. One
> > solution could be pushing this down into the platform code to deal
> > with as an interim solution, via the new .pcs_init() method.
> > 
> > We could also do that with the current XPCS code, since we know that
> > only Intel mGBE uses xpcs. This would probably allow us to get rid
> > of the has_xpcs flag.
> 
> Basically you suggest to move the entire stmmac_pcs_setup() to the
> platforms, don't you? The patch 9 of this series indeed could have
> been converted to just moving the entire PCS-detection loop from
> stmmac_pcs_setup() to the Intel-specific pcs_init.

Yes, it's not like XPCS is used by more than one platform, it's only
Intel mGBE. So I don't see why it should have a privileged position
over any other PCS implementation that stmmac supports (there's now
three different PCS.)

If you don't want the code in the Intel driver, then what could be
done is provide a core implementation that gets hooked into the
.pcs_init() method.

The same is probably true of other PCSes if they end up being shared
across several different platforms.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
