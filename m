Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B7781181B
	for <lists+openbmc@lfdr.de>; Wed, 13 Dec 2023 16:48:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cIfWWacl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr0Hk4vRfz3c2C
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 02:48:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cIfWWacl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr0H50Zmsz3brC
	for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 02:47:27 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2cb20c82a79so76047951fa.3
        for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2023 07:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702482443; x=1703087243; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EhvWEh807oUIcSem4VDgk6dTPM+cYeOF5hlufV89DoI=;
        b=cIfWWaclBpImgn2Gj52kL5XClstXjvFt/O+ZBBvJlbHUyWgJgNLSP0BDNHSnQ5HgKr
         Aap565to2hQMYgkX9Hsah9v2imeFVSzX39wtKyf0F8p/J+TwFeX+iDcwqvgvm8bR+ZCw
         4WZwRr873MAAc2KV0ockNsWx2xGGipvuCuuuw1XPBu4NwwGdoms+eLZb9jOl7KTC4AfB
         p1EHNSny+ey/g7zD5leucVQI+INev5m0Zu+yJpEUYJWK7grLFvV5tnI18lLDq44K4dzI
         duSWki+AvCgHxTvWp0mppzUcGlx+XwdKKavC7p60HDILmh5lWSu3+a62DhurhrQhrNwW
         +enQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482443; x=1703087243;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhvWEh807oUIcSem4VDgk6dTPM+cYeOF5hlufV89DoI=;
        b=Tf4EKVRcA+CSp76Q9hwXVSjG1ydResizDaoJi6YR6AXfZJxyH4AExjhWJR7E41Qo9d
         QDBtrc1nGiWNJAMvVeqktdZIRVTMw64zGYn18l+tWJ0pNUacq0+n4hwKOv3/azMBuClf
         N0eEXTb+Cg/OkotdKvjNhM1qGNh8vryEbaOgOacoQrZq/z05jp4m6vvpfDE02yjImz8V
         EZvQ/Juyv50VjVGHmjd2nRUi2RwK1b/2cxJrl6qA+AClXVM2jxBfsCqpuqnQz6ghplX2
         DxRLGjSqcM8UNTKFdx3Yuc99DACGECSg4eUEMcaZqCWr/WVC2rKy0xGHlViNZ+Q1tzcH
         Ub6A==
X-Gm-Message-State: AOJu0YyXf30uH6qfhdAAYA17oV/f9iWEBflXEGigcd2jh7CZJJmlq29u
	r6hCbQ2IqK1U0VZvEdIVKb8=
X-Google-Smtp-Source: AGHT+IHfEac18zoY0gBPJcbuOObR91TUzD3b56b0y+7kI2XbIcuwhPK2c/DDUaHKl+amw8uRZizW/A==
X-Received: by 2002:a2e:a103:0:b0:2cc:1dc8:4e96 with SMTP id s3-20020a2ea103000000b002cc1dc84e96mr4567741ljl.24.1702482442739;
        Wed, 13 Dec 2023 07:47:22 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id p8-20020a2e8048000000b002ca026f777fsm1867436ljg.48.2023.12.13.07.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:47:22 -0800 (PST)
Date: Wed, 13 Dec 2023 18:47:19 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 06/16] net: pcs: xpcs: Avoid creating dummy XPCS
 MDIO device
Message-ID: <eeyhdczfpgxwxbtljjc7tkjwi64avqkn2h7tehh56xq6pss3x3@7cun56p633o4>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
 <ZW8pxM3RvyHJTwqH@shell.armlinux.org.uk>
 <ZW85iBGAAf5RAsN1@shell.armlinux.org.uk>
 <kagwzutwnbpiyc7mmtq7ka3vhffw4fejuti5vepnla74rocruh@tryn6lxhwbjz>
 <ZXivRofyIpvmfOyR@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXivRofyIpvmfOyR@shell.armlinux.org.uk>
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

On Tue, Dec 12, 2023 at 07:06:46PM +0000, Russell King (Oracle) wrote:
> On Tue, Dec 12, 2023 at 06:26:16PM +0300, Serge Semin wrote:
> > I would have used in the first place if it was externally visible, but
> > it's defined as static. Do you suggest to make it global or ...
> 
> That would be one option - I didn't make it visible when I introduced it
> beacuse there were no users for it.
> 
> > > At some point, we should implement
> > > mdiobus_get_mdiodev() which also deals with the refcount.
> > 
> > ... create mdiobus_get_mdiodev() instead?
> > 
> > * Note in the commit message I mentioned that having a getter would be
> > * better than directly touching the mii_bus instance guts.
> 
> What I'm thinking is:
> 
> /**
>  * mdiobus_get_mdiodev() - get a mdiodev for the specified bus
>  * @bus: mii_bus to get mdio device from
>  * @addr: mdio address of mdio device
>  *
>  * Return the struct mdio_device attached to the MII bus @bus at MDIO
>  * address @addr. On success, the refcount on the device will be
>  * increased, which must be dropped using mdio_device_put(), and the
>  * mdio device returned. Otherwise, returns NULL.
>  */
> struct mdio_device *mdiobus_get_mdiodev(struct mii_bus *bus, int addr)
> {
> 	struct mdio_device *mdiodev;
> 
> 	mdiodev = mdiobus_find_device(bus, addr);
> 	if (mdiodev)
> 		get_device(&mdiodev->dev);
> 	return mdiodev;
> }
> EXPORT_SYMBOL(mdiobus_get_mdiodev);
> 
> should do it, and will hold a reference on the mdiodev structure (which
> won't be freed) and also on the mii_bus (since this device is a child
> of the bus device, the parent can't be released until the child has
> been, so struct mii_bus should at least stay around.)

Right. That's exactly what had in mind. Thanks for suggesting a
ready-to-apply solution. I'll add it to the series as a separate patch
if we decide to keep the proposed in this patch change.  See my
question in the next message:
https://lore.kernel.org/netdev/wnptneaxxe2tq2rf7ac6a72xtyluyggughvmtxbbg5qto64mpa@7gchl5e4qllu/

> 
> What would help the "the bus driver has been unbound" situation is if
> we took the mdio_lock on the bus, and then set the {read,write}{,_c45}
> functions to dummy stubs when the bus is being unregistered which then
> return e.g. -ENXIO. That will probably make unbinding/unloading all
> MDIO bus drivers safe from kernel oops, although phylib will spit out
> a non-useful backtrace if it tries an access. I don't think there's
> much which can be done about that - I did propose a patch to change
> that behaviour but apparently folk like having it!
> 
> It isn't perfect - it's racy, but then accessing mdio_map[] is
> inherently racy due to no locking with mdiobus_.*register_device().
> At least if we have everyone using a proper getter function rather
> than directly fiddling with bus->mdio_map[]. We only have one driver
> that accesses it directly at the moment (mscc_ptp):
> 
>                 dev = phydev->mdio.bus->mdio_map[vsc8531->ts_base_addr];
>                 phydev = container_of(dev, struct phy_device, mdio);
> 
>                 return phydev->priv;
> 
> and that should really be using mdiobus_get_phy().

Regarding the driver bind/unbind. I guess the maintainers just forget
about that problem. Do you think it's worth reminding them about it? 

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
