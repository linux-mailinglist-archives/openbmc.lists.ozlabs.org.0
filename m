Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3528D7E37
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 11:14:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=B/GXgkrR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vt7Mk6n1xz3cSd
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 19:14:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=B/GXgkrR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+openbmc=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 546 seconds by postgrey-1.37 at boromir; Mon, 03 Jun 2024 19:13:53 AEST
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vt7M51Q9jz30VP
	for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2024 19:13:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PL2tpWgubRP0I1wFdl1ZHWzMi0qsZ0DU3zEaEHooRQY=; b=B/GXgkrRVf4Kx2g9TuilFMzYS2
	U9NTJ5sySISyPgH9X1HT28urmVye+m8mf3bX59ZQDteLTM3jnFc1Kzc+tmlAFyVnmxXtbYs0av3NO
	OmLqHpnPC3byTnIq33a+gZJnip3nRKGZul8W89TBkvBRFJ3JHiAwenoET9L5h8IZwUzENpMQUAMOp
	uZWQu6OKtFlZCvBAv4hF9G3Y3hTj/hTIKsrrPn661EXWRJZ/hIJmtTR9est5xH+53rgZ7RoQL2Dnr
	KDSvpFP9+i3sAVYcUhzW8UeuDOaW9ZGHARWbtggPnAP4+E0DPiweET4f+R95aIdfxnRFa9XdvgzvH
	ZnB0owOQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45002)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sE3bi-0002Tb-2G;
	Mon, 03 Jun 2024 10:03:58 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sE3be-0000IR-OA; Mon, 03 Jun 2024 10:03:54 +0100
Date: Mon, 3 Jun 2024 10:03:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next v2 10/10] net: stmmac: Add DW XPCS specified via
 "pcs-handle" support
Message-ID: <Zl2G+gK8qpBjGpb3@shell.armlinux.org.uk>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-11-fancer.lancer@gmail.com>
 <2lpomvxhmh7bxqhkuexukztwzjfblulobepmnc4g4us7leldgp@o3a3zgnpua2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2lpomvxhmh7bxqhkuexukztwzjfblulobepmnc4g4us7leldgp@o3a3zgnpua2a>
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

On Mon, Jun 03, 2024 at 11:54:22AM +0300, Serge Semin wrote:
> >  	if (priv->plat->pcs_init) {
> >  		ret = priv->plat->pcs_init(priv);
> 
> > +	} else if (fwnode_property_present(devnode, "pcs-handle")) {
> > +		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
> > +		xpcs = xpcs_create_fwnode(pcsnode, mode);
> > +		fwnode_handle_put(pcsnode);
> > +		ret = PTR_ERR_OR_ZERO(xpcs);
> 
> Just figured, we might wish to be a bit more portable in the
> "pcs-handle" property semantics implementation seeing there can be at
> least three different PCS attached:
> DW XPCS
> Lynx PCS
> Renesas RZ/N1 MII
> 
> Any suggestion of how to distinguish the passed handle? Perhaps
> named-property, phandle argument, by the compatible string or the
> node-name?

I can't think of a reasonable solution to this at the moment. One
solution could be pushing this down into the platform code to deal
with as an interim solution, via the new .pcs_init() method.

We could also do that with the current XPCS code, since we know that
only Intel mGBE uses xpcs. This would probably allow us to get rid
of the has_xpcs flag.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
