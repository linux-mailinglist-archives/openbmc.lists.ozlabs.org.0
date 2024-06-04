Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C37698FAE48
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 11:05:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=euhW3Vgz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtl7B6fg5z3cWV
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 19:05:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=euhW3Vgz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vtl6c2rF5z2xQH
	for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2024 19:05:10 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ea903cd11bso56017591fa.1
        for <openbmc@lists.ozlabs.org>; Tue, 04 Jun 2024 02:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717491902; x=1718096702; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ra/05RG+I2wv8KgtJlT+4wpFEIAZV3HX8GrU0T/bo6E=;
        b=euhW3Vgz5eCSrIsKnsvGW8KXZwiWp9ikF969LKQDswkwTn6hFUwDK0W4jjoQjneHht
         jVVch8sgjSCIg+mNjEQ3NAo8xC6A4Ouj4VR/B6CWJnaXbHM4/hL5ZQahCK6caQX+TmfB
         u1GuiDtehOH1TbSpDF73LZQ0zXMbP+aTIB7YKWDkeyXdoM/wy7DRy/xg+3t0kMrO/bIW
         CgXSlSej9vuhGbhtoB6qVD99ZDlNha3fFWU5KjXU//GueDHUbQodmqdwVtG7X5pXzpFs
         fCWXb5pSFnIORZzJYqD3k4m1mrQuGk9c12mo3kdVfQgLz9Q9lSTXe3ZLQpry2joUThW6
         KYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717491902; x=1718096702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ra/05RG+I2wv8KgtJlT+4wpFEIAZV3HX8GrU0T/bo6E=;
        b=IgPz6l3zXj1IDTbHfSC6yjaFshbgJdtobXsL7jPC5y7huAlxOWd9clk5FEbfY1F3Pu
         zmqFZqhR7uDLUacSaYpH3A27x1FSETcq71TvMyiYVBTF+QkQD/vIR2StHtHjH5diGOCb
         Dytyy1DH8ibYJ6AzidwMd8cJUsV4d26d7q581Y8jFvDEgTRpsjWGw1NvkGD2EHQ21ceI
         HzNTOVD8K2liuu9encbvBS5gmm9W0miD4d9u+FlgjNHWwNewT55034pLtZ+M1gleb4M3
         n3buNmOUu7wqXK+o5BslIljrgPNOm3MKlnvSjxS4ZPDkhlcS4fyaf6Xn+bJbHuhmgtlp
         Ckuw==
X-Forwarded-Encrypted: i=1; AJvYcCX/GaxJiKLIkwXTCbu63DiUAwAJ52aTkgzl+rh8DHbEl9emWfExM0VBYeL8V1EMbCYMI8MJh+prahTEN2MN8P7MpqUuZXCVrT8=
X-Gm-Message-State: AOJu0YxfpGRpwRLR5r1wuXHmX0/nIGJFZlCMIVxwLNsJ7hlnlASxPGpl
	jYYHtXVl33yEDbGYQyFkDDOsX/0OpXO0oL85s3sdtR69NbLgGDWP
X-Google-Smtp-Source: AGHT+IGxu8ZeKox/ETHOIGY9tQlCyxdSpOaMcwX3b4V+1NwYwnwZiIpRFm6IZBuIp5wxpDQGIUfJ0A==
X-Received: by 2002:a2e:3c0b:0:b0:2e5:3f56:2a0e with SMTP id 38308e7fff4ca-2ea9516108emr89381841fa.24.1717491901400;
        Tue, 04 Jun 2024 02:05:01 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91bb4e24sm14583141fa.55.2024.06.04.02.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:05:00 -0700 (PDT)
Date: Tue, 4 Jun 2024 12:04:57 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v2 10/10] net: stmmac: Add DW XPCS specified via
 "pcs-handle" support
Message-ID: <equlcrx6dgdtrmrlnxxhdunpghw46sjcyn5z6m6lszyiddbag4@eo6oeotzsxef>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-11-fancer.lancer@gmail.com>
 <2lpomvxhmh7bxqhkuexukztwzjfblulobepmnc4g4us7leldgp@o3a3zgnpua2a>
 <Zl2G+gK8qpBjGpb3@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl2G+gK8qpBjGpb3@shell.armlinux.org.uk>
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

On Mon, Jun 03, 2024 at 10:03:54AM +0100, Russell King (Oracle) wrote:
> On Mon, Jun 03, 2024 at 11:54:22AM +0300, Serge Semin wrote:
> > >  	if (priv->plat->pcs_init) {
> > >  		ret = priv->plat->pcs_init(priv);
> > 
> > > +	} else if (fwnode_property_present(devnode, "pcs-handle")) {
> > > +		pcsnode = fwnode_find_reference(devnode, "pcs-handle", 0);
> > > +		xpcs = xpcs_create_fwnode(pcsnode, mode);
> > > +		fwnode_handle_put(pcsnode);
> > > +		ret = PTR_ERR_OR_ZERO(xpcs);
> > 
> > Just figured, we might wish to be a bit more portable in the
> > "pcs-handle" property semantics implementation seeing there can be at
> > least three different PCS attached:
> > DW XPCS
> > Lynx PCS
> > Renesas RZ/N1 MII
> > 
> > Any suggestion of how to distinguish the passed handle? Perhaps
> > named-property, phandle argument, by the compatible string or the
> > node-name?
> 

> I can't think of a reasonable solution to this at the moment. One
> solution could be pushing this down into the platform code to deal
> with as an interim solution, via the new .pcs_init() method.
> 
> We could also do that with the current XPCS code, since we know that
> only Intel mGBE uses xpcs. This would probably allow us to get rid
> of the has_xpcs flag.

Basically you suggest to move the entire stmmac_pcs_setup() to the
platforms, don't you? The patch 9 of this series indeed could have
been converted to just moving the entire PCS-detection loop from
stmmac_pcs_setup() to the Intel-specific pcs_init.

But IMO some default/generic code would be still useful to preserve in
the stmmac_pcs_setup() method. When it comes to the fwnode-based
platform we at least could be falling back to the default DW XPCS
device registration if no plat_stmmacenet_data::pcs_init() callback
was specified and there was the "pcs-handle" property found,
especially seeing DW *MAC and DW XPCS are of the same vendor.

Based on that I can convert patch 9 of this series to introducing the
pcs_init() callback in the Intel mGBE driver, but preserve the
semantics of the rest of the series changes.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
