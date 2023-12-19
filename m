Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ADE819283
	for <lists+openbmc@lfdr.de>; Tue, 19 Dec 2023 22:48:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M5DmGYGn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Svr1N1yS1z2yV3
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 08:48:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M5DmGYGn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Svr0l4wjLz2yDD
	for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2023 08:48:22 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50e4b6b13d4so1237294e87.2
        for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2023 13:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703022497; x=1703627297; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lprg6JFS3aa/Q9wpziRGhKZIoy46UrPyfAtrU4sp3T0=;
        b=M5DmGYGnmmBnDMfY55iMLN1F0SxSuB/B0YxQpoLudCVpzdroWQruGh3APg19fPHRWP
         cZR4Yja67wMhsWFMHu/7U2joq46dtFXkP9LnnGOebsai/0P0K+3sU4QY2/GO7Jlq4uCZ
         Sy/LE6t7e75lCLvtNv2woRxNkGxobjAcwbigchpjHI6dHXThJRn9AwJ8rU72D4gderUG
         APDfScgCtgJ2mTKU8nJT8uzEVdpHfL4sADH9PKSp79jyVlZnD4A7D1NuZa0qVnuPXppY
         P4pn7O6UlCqpZEfMRDKJR7foNmS1QlzvG7rknRut3uDdteS/dTSHzijRz9Ijg0KCCyyJ
         q3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703022497; x=1703627297;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lprg6JFS3aa/Q9wpziRGhKZIoy46UrPyfAtrU4sp3T0=;
        b=deDUmTzPopmwrmUVvh67MyGn1Xw6/yaUM91n5jojPN+PQ3TkJcx18/9pOTYAYEhfwk
         pz1233iaOOlv068yNo19Ezh6FcsynqBMZNDpg0G+x0s2SUQQjRRKvMNvHkN+VR7HHbch
         iT56RjM//XShbn7k1KRHO6o/oCRjh/JaigzFfa8rBvf7Ix8UYIAQ57+X4lHffUi73uL/
         6ETLUqk4iCw00gv5E9ArSRuGDtd6kmypTjhFhoL+VWD8kVwk3n1n8GkWh3APkjngfLss
         uDhlZM4AlAPeDucsTwom851SvtzfuVVAjp4ptemKfLgVxlll2v6/T+n9qzJH3S8z/kng
         W18A==
X-Gm-Message-State: AOJu0YwV0VGE6bIRUVf1fNNUWMdWMVlFQuK7aKtm0VNFFMpDJZGpwx3x
	To1R6Okedx3YZitc8a11XaE=
X-Google-Smtp-Source: AGHT+IEB+5cf7++qXG0g34O2AsAhdODA0sjPyL5qPtyv6kIILgJXYpXLUB7o3MU6cMihDa1zGaqQCw==
X-Received: by 2002:ac2:5928:0:b0:50e:4631:d57a with SMTP id v8-20020ac25928000000b0050e4631d57amr816260lfi.85.1703022496711;
        Tue, 19 Dec 2023 13:48:16 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
        by smtp.gmail.com with ESMTPSA id y7-20020a199147000000b0050e4c716d17sm176828lfj.231.2023.12.19.13.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 13:48:16 -0800 (PST)
Date: Wed, 20 Dec 2023 00:48:14 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next 06/16] net: pcs: xpcs: Avoid creating dummy XPCS
 MDIO device
Message-ID: <2jlqxp3jyjautzpf2hn7jeys4omkcntcrx6prjyaativsuqam6@f4szkixopvek>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
 <20231205115234.7ntjvymurot5nnak@skbuf>
 <wnptneaxxe2tq2rf7ac6a72xtyluyggughvmtxbbg5qto64mpa@7gchl5e4qllu>
 <jlcyqvcw5hsjtmvf77sm7qni6tzihxudo6baoq7wi7zgqx3lvs@ykbsxgmjkvnf>
 <20231219162803.kmb3jb6aevef3kj3@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219162803.kmb3jb6aevef3kj3@skbuf>
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

On Tue, Dec 19, 2023 at 06:28:03PM +0200, Vladimir Oltean wrote:
> On Tue, Dec 19, 2023 at 06:48:09PM +0300, Serge Semin wrote:
> > > > Sorry, because the commit log lost me at the "context presentation" stage,
> > > > I failed to understand the "what"s and the "why"s.
> > > > 
> > > > Are you basically trying to add xpcs support on top of an mdio_device
> > > > where the mdio_device_create() call was made externally to the xpcs code,
> > > > through mdiobus_register_board_info() and mdiobus_setup_mdiodev_from_board_info()?
> > > 
> > > Basically yes, but there is more of it. The main idea is to convert
> > > the XPCS driver to using the already created non-PHY MDIO-devices
> > > instead of manually creating a 'dummy'/'redundant' one. From my point
> > > of view there are several reasons of doing so:
> > > 
> > > 1. mdiobus_register_board_info() provides a way to assign the device
> > > platform data to being registered afterwards device. Thus we can pass
> > > some custom data to the XPCS-device driver (whether it's just an
> > > xpcs_create_*() call or a fully functional MDIO-device driver
> > > registered by the mdio_driver_register() method). For instance it can
> > > be utilized to drop the fake PHYSIDs implementation from
> > > drivers/net/dsa/sja1105/sja1105_mdio.c .
> 
> Ok. Seeing an alternative to the NXP_SJA1110_XPCS_ID hack will be interesting.
> 
> FWIW, I'm looking at reworking the dsa_loop probing to use software nodes.
> Since dsa_loop is the only current user of mdiobus_register_board_info(),
> maybe that will lead to its deletion. It appears a matter of timing, but
> the mechanism looks promising.

I think I'll be able to fix my series within two weeks. Seeing it's
going to be merge window soon and Xmas/NY holidays then, the patchset
will be re-submitted afterwards.

Note in my case mdiobus_register_board_info() isn't that well
suitable. As I explained a bit earlier in this thread,
mdiobus_register_board_info() isn't working for the hot-pluggable
devices and for the case when MAC/MDIO-bus drivers unbinding is
possible. What could be better is to have a method like this:

mdiobus_register_bus_info(struct mii_bus *bus, struct mdio_board_info *info, unsigned int n)
{
	// Add devs-info's into the internal mii_bus-instance list
	// for each of which the MDIO-devices will be then created and
	// registered by means of the method
	// mdiobus_setup_mdiodev_from_board_info() called in
	// __mdiobus_register().
}

Which could be called for the just allocated and not yet registered
MDIO-bus descriptor in order to prescribe the non-PHY devices on the
bus.

Alternatively, what might be even more preferable and easier to
implement I could:
1. Globalise and export mdiobus_create_device().
2. Make sure all non-PHY MDIO-devices are masked in mii_bus instance.
3. Register MDIO-bus.
4. Call mdiobus_create_device() for each XPCS device.
5. Then call xpcs_create_mdiodev() for each registered device.

> 
> Maybe we can also use it somehow to add compatibility with existing
> lynx-pcs device trees where there is no compatible string, so a struct
> phy_device gets created. Device tree breakage was the fundamental reason
> why Sean Anderson's patch set couldn't make forward progress.
> https://patchwork.kernel.org/project/netdevbpf/cover/20221103210650.2325784-1-sean.anderson@seco.com/

In case of DW XPCS the solutions described in my comment above are
only required for the runtime-registered non-OF MDIO-buses. DW XPCS
DT-based devices are unsupported by the current STMMAC driver (adding
that support is the main goal of this patchset). So my case is
simpler.

But regarding your proposal, I guess the first version of the
solutions described in my comment above could be suitable for you if
the _of_mdiobus_register() method is somehow fixed to considering the
DT-nodes with no compatible strings as non-PHY MDIO-devices. For
instance the _of_mdiobus_register() function can work that way if it
detects some pre-registered mdio_board_info data in the being
registered mii_bus instance. Alternatively you could introduce an
additional mii_bus structure field which would indicate such non-PHY
MDIO-devices.

Note in order to make things backward compatible you would need to
tweak the drivers/net/ethernet/freescale/xgmac_mdio.c driver so one
would detect the platforms (for instance, based on the platform
compatible string) on which the Lynx PCSs are specified with no
compatible strings and activate the mechanism above. Then you can
freely convert the currently available Lynx PCS dts nodes to having
the compatible strings. The kernel will be still backwards compatible
for old dtbs and will contain the Lynx PCS DT-nodes identified by the
proper compatible strings.

> 
> > > 2. The MDIO-devices actually registered on the MDIO-bus will be
> > > visible in sysfs with for instance useful IO statistics provided by
> > > the MDIO-bus. Potentially (if it is required) at some point we'll be
> > > able to convert the DW XPCS driver to being true MDIO-device driver
> > > (bindable to the DW XPCS device) with less efforts.
> 
> Ok.
> 
> > > 3. Having an MDIO-device registered that way would make the DW XPCS
> > > IO-device implementation unified after the fwnode-based XPCS
> > > descriptor creation support is added in one of the subsequent patches.
> 

> Unified how? You mean that "XPCS will always operate as a driver bound
> to an mdio_device"?

No. I meant that mdio_device would be registered as a normal device on
the MDIO-bus in both fwnode-based and runtime-based cases. No driver
will be bound to those devices, but some platform-data could be
specified and handled identically in both cases. Eventually when the
net core is ready for it, the DW XPCS driver could be easily converted
to being normal MDIO-device driver and bound to the XPCS devices
registered on a MDIO-bus.

> 
> You're not planning to unify the mdio_device and MMIO register handling
> by using regmap, right?

No. It will be too tiresome especially seeing the current
devm_mdio_regmap() implementation doesn't support C45 IO ops and using
regmaps would cause having redundant abstraction layers. I see no much
benefits in that at the moment. In more details I explained it here:
https://lore.kernel.org/netdev/cv6oo27tqbfst3jrgtkg7bcxmeshadtzoomn2xgnzh2arz4nwy@wq5k7oygto6n/

> 
> > > So based on the listed above I've got a question. Do you think all of
> > > that is worth to be implemented? Andrew, Russell?
> > > 
> > > I am asking because the patchset advance depends on your answers. If
> > > you do I'll need to fix the problem described in my first message,
> > > implement some new mdiobus_register_board_info()-like but
> > > MDIO-bus-specific interface function (so MDIO-device infos would be
> > > attached to the allocated MDIO-bus and then used to register the
> > > respective MDIO-devices on the MDIO-bus registration), then convert
> > > the sja1105 and wangxun txgbe drivers to using it. If you don't I'll
> > > get back the xpcs_create_mdiodev() implementation and just provide a
> > > fwnode-based version of one.
> > 
> > Folks, this is the only issue left to settle so I could move on with
> > the series fixing up. So the question is: taking my comment above into
> > account is it worth to convert the xpcs_create_mdiodev() method to
> > re-using the already registered MDIO-device instance instead of
> > always creating a stub-like MDIO-device?
> 

> I can't exactly say "yes, this is worth it", because it also depends on
> what the phylib/phylink maintainers say. So I haven't said anything.
> But I also don't have any objection, as long as the conversion doesn't
> break existing setups (in new ways; see the "unbind MDIO bus driver"
> case which is already problematic).

Ok. Thanks. There won't be MDIO-device driver binding. I get to decide
later what solution described in my first comment to implement (unless
you insist on some of them particularly or suggest an alternative).

-Serge(y)

