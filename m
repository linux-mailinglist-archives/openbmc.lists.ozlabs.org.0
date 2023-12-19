Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C055C818C33
	for <lists+openbmc@lfdr.de>; Tue, 19 Dec 2023 17:28:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LKeqm4yx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Svhvv3WvLz3cSg
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 03:28:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LKeqm4yx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvhvJ0wlYz3c3H
	for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2023 03:28:10 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a236456fee1so254414566b.1
        for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2023 08:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703003287; x=1703608087; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5A2uKEheZ7E6+Gx3ENGsEnMLTERDeCTHi0P6ZhpItmE=;
        b=LKeqm4yxfq4MZboYr1mh60hJYX/xw8eQIYaci20j6Re1tAgRzyrbn4koIT5+y5fd3C
         HIkAQFl7u8TBrod8M/Kjp8o8hVJDyaCnLS/FhodFQlRoiBp3WelQaHdqLFDphoFjMi1I
         f3Mh9c7P40xYpnymtAni6zZI70lAKK5HHnYzX56g67q6b2WNnRYoV5QYIJ1Y064Lshe8
         kNdkOfS/WwjDMpRWYgoyr4/7jA75yRHcWjl+X1kYVDMk/OMIfXUNouC/wYKj9gYRASLT
         rROSONfG2PFC6o/dkqeF+K1RlRYh3Jo9hDbiS1OXKae+f/MprT/KJVe2zIvzREhHhRRs
         vJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703003287; x=1703608087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A2uKEheZ7E6+Gx3ENGsEnMLTERDeCTHi0P6ZhpItmE=;
        b=ZLMnlryxAe9ubAyF6PtN/9dXgjgnPARL8gK/8/lZA4EsgIR5eUY45rOA7SQoxZgYg2
         EO1aSetnTXnnCFRtSjUdtwS0AYWLj95TUN5hkoOxBzscbzpXzydHoLXmvqPEOL+py33u
         s1yKVXb3r00sQScGHk1n5cX9dByk6ZnLIKAVNSFpGPSpJyqScVnxRVhD0ih/+jDZdIZu
         L3eLAWjaZpndru76HvuK6NdPgIAfw2asCrbp4oL7eaKqVp2pb5Xv1Z85we0yLe43GjUT
         SDwUqr5YXNug7XaaFVrbUAujeDNiU9q3guBLPOBnt6qEaF+53j0U7CnKsCppYWfF5TeM
         +I7Q==
X-Gm-Message-State: AOJu0YxulTn3TZmkRW4BBTzrsGu7ezlJClcvz2QQy8Ttwb8IkBc047bs
	PmDVK3f7PEmBXDoWx2/Qrmc=
X-Google-Smtp-Source: AGHT+IF8//j/NsDS1bDOy5SJbtYNxLhpqbC9NTYmHThfGbnA9oFEXqsg+VrfR1MhyrcvnvVmOT89Xw==
X-Received: by 2002:a17:906:b299:b0:a26:85bb:6355 with SMTP id q25-20020a170906b29900b00a2685bb6355mr425523ejz.77.1703003286811;
        Tue, 19 Dec 2023 08:28:06 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id l17-20020a170906a41100b00a236eb66b2fsm1333363ejz.82.2023.12.19.08.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 08:28:06 -0800 (PST)
Date: Tue, 19 Dec 2023 18:28:03 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next 06/16] net: pcs: xpcs: Avoid creating dummy XPCS
 MDIO device
Message-ID: <20231219162803.kmb3jb6aevef3kj3@skbuf>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
 <20231205115234.7ntjvymurot5nnak@skbuf>
 <wnptneaxxe2tq2rf7ac6a72xtyluyggughvmtxbbg5qto64mpa@7gchl5e4qllu>
 <jlcyqvcw5hsjtmvf77sm7qni6tzihxudo6baoq7wi7zgqx3lvs@ykbsxgmjkvnf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jlcyqvcw5hsjtmvf77sm7qni6tzihxudo6baoq7wi7zgqx3lvs@ykbsxgmjkvnf>
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tomer Maimon <tmaimon77@gmail.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 19, 2023 at 06:48:09PM +0300, Serge Semin wrote:
> > > Sorry, because the commit log lost me at the "context presentation" stage,
> > > I failed to understand the "what"s and the "why"s.
> > > 
> > > Are you basically trying to add xpcs support on top of an mdio_device
> > > where the mdio_device_create() call was made externally to the xpcs code,
> > > through mdiobus_register_board_info() and mdiobus_setup_mdiodev_from_board_info()?
> > 
> > Basically yes, but there is more of it. The main idea is to convert
> > the XPCS driver to using the already created non-PHY MDIO-devices
> > instead of manually creating a 'dummy'/'redundant' one. From my point
> > of view there are several reasons of doing so:
> > 
> > 1. mdiobus_register_board_info() provides a way to assign the device
> > platform data to being registered afterwards device. Thus we can pass
> > some custom data to the XPCS-device driver (whether it's just an
> > xpcs_create_*() call or a fully functional MDIO-device driver
> > registered by the mdio_driver_register() method). For instance it can
> > be utilized to drop the fake PHYSIDs implementation from
> > drivers/net/dsa/sja1105/sja1105_mdio.c .

Ok. Seeing an alternative to the NXP_SJA1110_XPCS_ID hack will be interesting.

FWIW, I'm looking at reworking the dsa_loop probing to use software nodes.
Since dsa_loop is the only current user of mdiobus_register_board_info(),
maybe that will lead to its deletion. It appears a matter of timing, but
the mechanism looks promising.

Maybe we can also use it somehow to add compatibility with existing
lynx-pcs device trees where there is no compatible string, so a struct
phy_device gets created. Device tree breakage was the fundamental reason
why Sean Anderson's patch set couldn't make forward progress.
https://patchwork.kernel.org/project/netdevbpf/cover/20221103210650.2325784-1-sean.anderson@seco.com/

> > 2. The MDIO-devices actually registered on the MDIO-bus will be
> > visible in sysfs with for instance useful IO statistics provided by
> > the MDIO-bus. Potentially (if it is required) at some point we'll be
> > able to convert the DW XPCS driver to being true MDIO-device driver
> > (bindable to the DW XPCS device) with less efforts.

Ok.

> > 3. Having an MDIO-device registered that way would make the DW XPCS
> > IO-device implementation unified after the fwnode-based XPCS
> > descriptor creation support is added in one of the subsequent patches.

Unified how? You mean that "XPCS will always operate as a driver bound
to an mdio_device"?

You're not planning to unify the mdio_device and MMIO register handling
by using regmap, right?

> > So based on the listed above I've got a question. Do you think all of
> > that is worth to be implemented? Andrew, Russell?
> > 
> > I am asking because the patchset advance depends on your answers. If
> > you do I'll need to fix the problem described in my first message,
> > implement some new mdiobus_register_board_info()-like but
> > MDIO-bus-specific interface function (so MDIO-device infos would be
> > attached to the allocated MDIO-bus and then used to register the
> > respective MDIO-devices on the MDIO-bus registration), then convert
> > the sja1105 and wangxun txgbe drivers to using it. If you don't I'll
> > get back the xpcs_create_mdiodev() implementation and just provide a
> > fwnode-based version of one.
> 
> Folks, this is the only issue left to settle so I could move on with
> the series fixing up. So the question is: taking my comment above into
> account is it worth to convert the xpcs_create_mdiodev() method to
> re-using the already registered MDIO-device instance instead of
> always creating a stub-like MDIO-device?

I can't exactly say "yes, this is worth it", because it also depends on
what the phylib/phylink maintainers say. So I haven't said anything.
But I also don't have any objection, as long as the conversion doesn't
break existing setups (in new ways; see the "unbind MDIO bus driver"
case which is already problematic).
