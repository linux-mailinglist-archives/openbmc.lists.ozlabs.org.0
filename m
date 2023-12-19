Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C20B818B8F
	for <lists+openbmc@lfdr.de>; Tue, 19 Dec 2023 16:48:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OrzbUMuH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Svh1z0hTwz3cMH
	for <lists+openbmc@lfdr.de>; Wed, 20 Dec 2023 02:48:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OrzbUMuH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Svh1M3wSJz30gD
	for <openbmc@lists.ozlabs.org>; Wed, 20 Dec 2023 02:48:21 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2cc6b56eadaso33507751fa.1
        for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2023 07:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703000895; x=1703605695; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHBvVe16meGg4xyfLMaFr60bPo1Y/fXZgMP5gNJkkWM=;
        b=OrzbUMuHRVZElYIyIA0DX6wgN10ynOBbzgNGyrQ9Yaf8rJuEOg5s8VepAZI4PxQIVk
         rIIdIOiHSiZmrGbFkRuOaxJx+051pIc1/xvvDyeGAo01dXg+LYBpgNDp3/lueqFRO788
         nw6LHHsYNxCIedT7dv90SDyRhKPH9OVWWLf7xl9mbBwqxfthJIzjBl23PmLYdPmLTCGG
         2+oFFl3xHQpS6GCT3tmbQpU8y4XBy6/9gdM2JOhAN+5AoN3DvSJ/XuTZtkXxMoWu0KKI
         ytgMwm97uNA80a/H6CIO4TJ5tXFKUxIZcrGjKCtm/Odgq9fXxd8j0qr7xJEG2H92kGGG
         eL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703000895; x=1703605695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHBvVe16meGg4xyfLMaFr60bPo1Y/fXZgMP5gNJkkWM=;
        b=X1x6YSUegS+Mbvw6LfdsA9UTZgogFOzqG9h7XSbcPe+uxGNlEBymZ1Cuzb2PMs26XD
         L/hBcy0SyYUpkxbd0/zkI9ExS74WGJOWt//fXBIO8NCYt8eW2kVqXngBmuBop67wE/xu
         gPfB7hxC1qGBtlCjTdukxJVmh5l68GBzPXwS6gsynh9fgBHghAlFJEL7NijWKT5gIog7
         tKc7K3DdUizcSNq6lYbnjBFpZllPf5w/2eIe4ozjTPxMRRlXJOxRe7Tour1GN/l4jL5Y
         jUEJIuD+4Xn9/W9dJmAEY10eRg+BxKvzyKy+8HHOGJRTFaA7REVutRKfGjcKVw2VfS1+
         1Avg==
X-Gm-Message-State: AOJu0YxlDN9jtvFM9HnJVoUD4DTPb3ZKtkHVYFBDMLxHM+bPpcnLv/q0
	oQKMRZnd/aj7b5mod475ZxA=
X-Google-Smtp-Source: AGHT+IGfQs+sW02LYV7xCGI4kPDbeudvbqoTTCdckhRYVnDN6KFJhGUVm3qryVYmY8/VNjdwF7kAmA==
X-Received: by 2002:a2e:a58a:0:b0:2cc:7575:edf9 with SMTP id m10-20020a2ea58a000000b002cc7575edf9mr1990855ljp.91.1703000894531;
        Tue, 19 Dec 2023 07:48:14 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id cy20-20020a2e9a14000000b002cc4ab0c174sm1654394ljb.81.2023.12.19.07.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 07:48:14 -0800 (PST)
Date: Tue, 19 Dec 2023 18:48:09 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 06/16] net: pcs: xpcs: Avoid creating dummy XPCS
 MDIO device
Message-ID: <jlcyqvcw5hsjtmvf77sm7qni6tzihxudo6baoq7wi7zgqx3lvs@ykbsxgmjkvnf>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
 <20231205115234.7ntjvymurot5nnak@skbuf>
 <wnptneaxxe2tq2rf7ac6a72xtyluyggughvmtxbbg5qto64mpa@7gchl5e4qllu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wnptneaxxe2tq2rf7ac6a72xtyluyggughvmtxbbg5qto64mpa@7gchl5e4qllu>
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Vladimir, Russell, Andrew

On Wed, Dec 13, 2023 at 06:27:57PM +0300, Serge Semin wrote:
> Hi Vladimir,
> 
> On Tue, Dec 05, 2023 at 01:52:34PM +0200, Vladimir Oltean wrote:
> > On Tue, Dec 05, 2023 at 01:35:27PM +0300, Serge Semin wrote:
> > > If the DW XPCS MDIO devices are either left unmasked for being auto-probed
> > > or explicitly registered in the MDIO subsystem by means of the
> > > mdiobus_register_board_info() method
> > 
> 
> > mdiobus_register_board_info() has exactly one caller, and that is
> > dsa_loop. I don't understand the relevance of it w.r.t. Synopsys XPCS.
> > I'm reading the patches in order from the beginning.
> 
> Well, one user of the DW XPCS driver is updated in this series in the
> framework of the patch:
> [PATCH net-next 13/16] net: stmmac: intel: Register generic MDIO device
> https://lore.kernel.org/netdev/20231205103559.9605-14-fancer.lancer@gmail.com/
> 
> I can convert of them (it's sja1105 and wangxun txgbe) and then just
> drop the MDIO-device creation part from xpcs_create_mdiodev(). As I
> also described in another emails thread below this patch I used to
> think that unmasking non-PHY device is also appropriate to get the
> MDIO-device instance. I was wrong in that matter obviously.
> 
> Anyway I just realized that my solution of using
> mdiobus_register_board_info() is a bit clumsy. Moreover the patch 13
> (see the link above) shouldn't have the mdio_board_info instance
> allocation (it can be defined on stack) and most importantly is wrong
> in using the device-managed resources for it. The problem is that
> mdiobus_register_board_info() registers an MDIO-device once for entire
> system lifetime. It isn't that suitable for the hot-swappable devices
> and for drivers bind/unbind cases. Since there is no
> mdio_board_info-deregistration method, at the simplest case the no
> longer used board-info descriptors might be left registered if a
> device or driver are unloaded. That's why the device-managed
> allocation is harmful in such scenario. At the very least I'll need to
> convert the allocations to being non-managed.
> 
> > 
> > > there is no point in creating the dummy MDIO device instance in order
> > 
> 
> > Why dummy? There's nothing dummy about the mdio_device. It's how the PCS
> > code accesses the hardware.
> 
> I call it 'dummy' because no actual device is registered (though
> 'redundant' or similar definition might sound more appropriate). The
> entire structure is used as a communication layer between the XPCS
> driver and MDIO device, where the device address is the only info
> needed. Basically nothing prevents us from converting the current DW
> XPCS driver to using the mdiobus_c45_read()/mdiobus_c45_write()
> methods. Though in that case I wouldn't be able to easily add the
> fwnode-based MDIO-devices support.
> 
> > 
> > > to get the DW XPCS handler since the MDIO core subsystem will create
> > > the device during the MDIO bus registration procedure.
> > 
> 
> > It won't, though? Unless someone is using mdiobus_register_board_info()
> > possibly, but who does that?
> 
> As I said above I wrongly assumed that unmasking non-PHY device was
> ok. But mdiobus_register_board_info() could be used for that as I (a
> bit clumsy) demonstrated in the patch 13.
> 
> > 
> > > All what needs to be done is to just reuse the MDIO-device instance
> > > available in the mii_bus.mdio_map array (using some getter for it
> > > would look better though). It shall prevent the XPCS devices been
> > > accessed over several MDIO-device instances.
> > > 
> > > Note since the MDIO-device instance might be retrieved from the MDIO-bus
> > > map array its reference counter shall be increased. If the MDIO-device
> > > instance is created in the xpcs_create_mdiodev() method its reference
> > > counter will be already increased. So there is no point in toggling the
> > > reference counter in the xpcs_create() function. Just drop it from there.
> > > 
> > > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > > ---
> > 
> 

> > Sorry, because the commit log lost me at the "context presentation" stage,
> > I failed to understand the "what"s and the "why"s.
> > 
> > Are you basically trying to add xpcs support on top of an mdio_device
> > where the mdio_device_create() call was made externally to the xpcs code,
> > through mdiobus_register_board_info() and mdiobus_setup_mdiodev_from_board_info()?
> 
> Basically yes, but there is more of it. The main idea is to convert
> the XPCS driver to using the already created non-PHY MDIO-devices
> instead of manually creating a 'dummy'/'redundant' one. From my point
> of view there are several reasons of doing so:
> 
> 1. mdiobus_register_board_info() provides a way to assign the device
> platform data to being registered afterwards device. Thus we can pass
> some custom data to the XPCS-device driver (whether it's just an
> xpcs_create_*() call or a fully functional MDIO-device driver
> registered by the mdio_driver_register() method). For instance it can
> be utilized to drop the fake PHYSIDs implementation from
> drivers/net/dsa/sja1105/sja1105_mdio.c .
> 
> 2. The MDIO-devices actually registered on the MDIO-bus will be
> visible in sysfs with for instance useful IO statistics provided by
> the MDIO-bus. Potentially (if it is required) at some point we'll be
> able to convert the DW XPCS driver to being true MDIO-device driver
> (bindable to the DW XPCS device) with less efforts.
> 
> 3. Having an MDIO-device registered that way would make the DW XPCS
> IO-device implementation unified after the fwnode-based XPCS
> descriptor creation support is added in one of the subsequent patches.
> 
> So based on the listed above I've got a question. Do you think all of
> that is worth to be implemented? Andrew, Russell?
> 
> I am asking because the patchset advance depends on your answers. If
> you do I'll need to fix the problem described in my first message,
> implement some new mdiobus_register_board_info()-like but
> MDIO-bus-specific interface function (so MDIO-device infos would be
> attached to the allocated MDIO-bus and then used to register the
> respective MDIO-devices on the MDIO-bus registration), then convert
> the sja1105 and wangxun txgbe drivers to using it. If you don't I'll
> get back the xpcs_create_mdiodev() implementation and just provide a
> fwnode-based version of one.

Folks, this is the only issue left to settle so I could move on with
the series fixing up. So the question is: taking my comment above into
account is it worth to convert the xpcs_create_mdiodev() method to
re-using the already registered MDIO-device instance instead of
always creating a stub-like MDIO-device?

-Serge(y)

> 
> Note we already settled that converting DW XPCS driver to being normal
> MDIO-device driver is prone to errors at this stage due to a
> possibility to have the driver unbindable from user-space. I'll just
> move the DT-compatibles check to the xpcs_create_fwnode() method and
> drop the rest of the MDIO-device-driver-specific things.
> 
> -Serge(y)
