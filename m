Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFBF8FB053
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 12:47:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lg2ozGnc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtnNs6Pvlz3cYg
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2024 20:47:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lg2ozGnc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtnNH3gjmz3cSH
	for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2024 20:47:09 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-52b950aa47bso1146452e87.1
        for <openbmc@lists.ozlabs.org>; Tue, 04 Jun 2024 03:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717498020; x=1718102820; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i5WLooy2A7mlEfBwUMQTaBlwD5VzPh4lOZOOGWiXZ1k=;
        b=Lg2ozGnc4VfHR85K3GqV3XhhmaBVEg69jS/DHhI7o7OvVEb2j7XTh679JRzLMVcmpv
         Nh0W4K7FLrLOAa30FPcfRI/JJJVzF1ajxf0Jzv2fTaxWWw9ib13o/gZmZPjeEhv4w5ze
         KuWbkmwhLO5BQLLmWrujon6TYaq/cDk7aOnp/7cTf3od5fVR/mrLa4VXChvKxZwLYcmd
         UoxFxV6iRTNpx2l+pWZTt1me/fZFKDPbo8lltwzZzdyEBaNDuaJoMjPEtmNaGnu3BqAU
         c+WIZvTDGODAygm7WIXoCyi9LPJdZRN+wMoXzCqClQol6uDcK78AC5ovSVoSDi9p0Dzp
         OuoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717498020; x=1718102820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5WLooy2A7mlEfBwUMQTaBlwD5VzPh4lOZOOGWiXZ1k=;
        b=FRoObquVJO4p330Q8qASxkGcNxqVqq2lzLps1nteNf50CM/9TYWJiR22gGTKwMTDU4
         oqzBQcZlMyitAPk1+Rgnvln1LNHq6cy/9cmyxf9Yrz59D2AqM3SvuCQdug8OPSMoQ50z
         QIPfq2nv1cSl0E1PuRcO7HviFi0RltX14RCNpHVdEEGwXPI4P0xLiZ/30EWwS2VKqDlz
         EgKIMRxWt/I8rdJF1X7RuOK5JpfMWw/o3F8l73uduu4ZmrzharFZP3aF/UfBdONnr2hV
         HWLf7wPVYdYqhWnF/jqffbCUPMaRpKYQKADuQuo84t9JvqO9hd90WTYtt4p4HpvVsO56
         azTA==
X-Forwarded-Encrypted: i=1; AJvYcCXKWRNMkOjLBV3+1/6i9MwCxi/3nLUMA09TLO01Y3gXqJNHg/+yypIcYlYdc4yWYt7AIb57/FeyVjq4YXJAYxvQcdBSXlaK07I=
X-Gm-Message-State: AOJu0Yw/VVid3lUWpqeYhQVHSPGUMaqLzHUHi2nG+nUvX3UGSnIzKe7Z
	0fOEWfq65dJDp4GZhQCSo6BVUBZD/wKvzAopQ90IYkiF95/i7v5A
X-Google-Smtp-Source: AGHT+IFhpB4oLFNLONqB/WZnWU7eWkrmPR/i/a2NYKmzouexZTEd/9HPokyqyfou7PCwNPXhTpzSEw==
X-Received: by 2002:ac2:59c9:0:b0:52b:84bd:345e with SMTP id 2adb3069b0e04-52b8970c011mr6949767e87.43.1717498019597;
        Tue, 04 Jun 2024 03:46:59 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b9e2404d5sm394822e87.297.2024.06.04.03.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 03:46:59 -0700 (PDT)
Date: Tue, 4 Jun 2024 13:46:55 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next v2 10/10] net: stmmac: Add DW XPCS specified via
 "pcs-handle" support
Message-ID: <q6u6g6aqabsgwqwzrzi4q5nhw4qxuykleotfzwcds5gztxi5ji@e6nui6k6lrk7>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-11-fancer.lancer@gmail.com>
 <2lpomvxhmh7bxqhkuexukztwzjfblulobepmnc4g4us7leldgp@o3a3zgnpua2a>
 <Zl2G+gK8qpBjGpb3@shell.armlinux.org.uk>
 <equlcrx6dgdtrmrlnxxhdunpghw46sjcyn5z6m6lszyiddbag4@eo6oeotzsxef>
 <Zl7ehKqLlzTUQIJG@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zl7ehKqLlzTUQIJG@shell.armlinux.org.uk>
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

On Tue, Jun 04, 2024 at 10:29:40AM +0100, Russell King (Oracle) wrote:
> On Tue, Jun 04, 2024 at 12:04:57PM +0300, Serge Semin wrote:
> > On Mon, Jun 03, 2024 at 10:03:54AM +0100, Russell King (Oracle) wrote:
> > > I can't think of a reasonable solution to this at the moment. One
> > > solution could be pushing this down into the platform code to deal
> > > with as an interim solution, via the new .pcs_init() method.
> > > 
> > > We could also do that with the current XPCS code, since we know that
> > > only Intel mGBE uses xpcs. This would probably allow us to get rid
> > > of the has_xpcs flag.
> > 
> > Basically you suggest to move the entire stmmac_pcs_setup() to the
> > platforms, don't you? The patch 9 of this series indeed could have
> > been converted to just moving the entire PCS-detection loop from
> > stmmac_pcs_setup() to the Intel-specific pcs_init.
> 

> Yes, it's not like XPCS is used by more than one platform, it's only
> Intel mGBE. So I don't see why it should have a privileged position
> over any other PCS implementation that stmmac supports (there's now
> three different PCS.)
> 

Alas DW XPCS has already got a more privileged position. The STMMAC
driver calls the XPCS driver methods here and there (supported ifaces,
EEE or PHY setup). Unless these calls are converted to some
standard/new phylink_pcs calls IMO it would be better to preserve the
default DW XPCS init at least for the "pcs-handle" property to
motivate the platform drivers developers to follow some pre-defined
device description pattern (e.g. defining DW XPCS devices in device
tree), but leave the .pcs_init() for some platform-specific PCS inits
(including which have already been implemented).

As I already mentioned DW XPCS is of Synopsys vendor. The IP-core has
been invented to provide a bridge between the Synopsys MAC IP-cores
and PMA (mainly Synopsys PMAs) for the 1G/10G links like 1000Base-X,
and 10GBase-X/-R/-KX4/-KR. The reason we see just a single use-case
of the XPCS in the driver is that even though the STMMAC driver has DW
XGMAC support the driver is mainly utilized for the 1G MACs (I don't
see any platform currently having DW XGMAC defined). Since DW GMAC/QoS
Eth can be configured to have the standard PHY interfaces available
there is no need in XPCS in these cases (except a weird Intel mGBE).

But when it comes to DW XGMAC it can be synthesized with GMII and XGMII
interfaces only. These're exactly interfaces which DW XPCS supports on
upstream. Thus basically the DW XPCS IP-core has been mainly produced
for been utilized in a couple with DW XGMAC providing a ready-to-use
solution for the XFP/SFP(+) ports or backplane-based applications. So
should we have more DW XGMACs supported in the kernel we would have met
more DW XPCS defined in there too.

> If you don't want the code in the Intel driver, then what could be
> done is provide a core implementation that gets hooked into the
> .pcs_init() method.

I don't mind converting patch 9 to moving the XPCS registration in the
Intel-specific .pcs_init() (especially seeing it's just a single
xpcs_create_mdiodev() call), but having the "pcs-handle" property
handled generically in the STMMAC core would be a useful thing to have
(see my reasoning above).

-Serge(y)

> 
> The same is probably true of other PCSes if they end up being shared
> across several different platforms.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
