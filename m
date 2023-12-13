Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 788D280FBB3
	for <lists+openbmc@lfdr.de>; Wed, 13 Dec 2023 01:02:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lmt2is1J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqbJf6XNZz3c8h
	for <lists+openbmc@lfdr.de>; Wed, 13 Dec 2023 11:02:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lmt2is1J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqbJ44BfKz2xYt
	for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2023 11:01:55 +1100 (AEDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2c9f099cf3aso94983581fa.1
        for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2023 16:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702425709; x=1703030509; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VryqNPAZN0PkatF1K0X8vt4MAOW1TOMh6E4WJPxdE5M=;
        b=Lmt2is1JEwOaRFbJVayqX3BblYT2dnRR+Kc3PSjJDcJ/v0vv3I1GYCOkMcTI2TGM0U
         X5XAIjdcpnXcNRIMccRG35cVxq/zMX1ex5ivQdtQnGIW90UeysD/IzJx4/RVHJ2+t35r
         /0012gsRY5j6nJYYhEcQcr+BtbIYm51ADSF+fQit1/GtC6ZrLOAAkOmSvb+OZuIi4mW3
         t6FD+OnLHwxwGgkFryFbKmn6nNFNxdKtlrRKsDvoPu8dTqdc7qbiCO2ZFDJ2IiFwBrD+
         sMdY7spmqFm4yQ5leWFMXqz3LJG+/xOy3zjUFztB5vmO0VLV1ghDqi2QrbzHwShmj3nH
         q7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702425709; x=1703030509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VryqNPAZN0PkatF1K0X8vt4MAOW1TOMh6E4WJPxdE5M=;
        b=AZkjhF9IjS0YSzmn7f1jJ9+D5mQjAFTBkhaYoAbJlZVnuxX1vZVocQkWnctI4CpI7G
         nShMoGIvTTIabFkoywB1vN2ow7VN9Qd20qML47QsU/qITeCHWA8QT5D77H01rfJbcTy9
         V6RmgMU4LVnai+TUyEIunuwrkKKI8icDWNsuaE5xZdGZ43spKJxiq0WdmHv6rUzy3xUk
         xgSchN0zgJJPMub8dtAzBryIK6vm6jZYJT7tx8g56nmVDcOBzSgdOzQi0OEEwd/hV0Xo
         AIWbUHa4B52oBhn+DQLHxiD28dAxEuDYQwE0rlQaNjvP8LTJvswdVTUaZZmyOdysHeX+
         ZFMA==
X-Gm-Message-State: AOJu0YwXyMMMKjZd1gASwzK1BvZbX4X7sd+Us0U+FEvp9290LEaRu713
	TslZBPDUIs/rsDpk+xFY6+A=
X-Google-Smtp-Source: AGHT+IENnuG3VrAA1W6qkKzWhJ1vIToPV4vIsRy3hjLPjuA8T5HfiInAiU3+NFHOZnakbSvOFJD53A==
X-Received: by 2002:a2e:5c01:0:b0:2cc:27f4:4abb with SMTP id q1-20020a2e5c01000000b002cc27f44abbmr1295705ljb.51.1702425708353;
        Tue, 12 Dec 2023 16:01:48 -0800 (PST)
Received: from mobilestation ([95.79.203.166])
        by smtp.gmail.com with ESMTPSA id y26-20020a2e545a000000b002c9f2a716e2sm1775969ljd.54.2023.12.12.16.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 16:01:47 -0800 (PST)
Date: Wed, 13 Dec 2023 03:01:45 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 06/16] net: pcs: xpcs: Avoid creating dummy XPCS
 MDIO device
Message-ID: <gbkgtb4yp3cwyw7xcuhmkdl3io2wlia2gska2xmjbwjvhigpz3@w52b6tdyugqo>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
 <ZW8pxM3RvyHJTwqH@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZW8pxM3RvyHJTwqH@shell.armlinux.org.uk>
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

On Tue, Dec 05, 2023 at 01:46:44PM +0000, Russell King (Oracle) wrote:
> On Tue, Dec 05, 2023 at 01:35:27PM +0300, Serge Semin wrote:
> > If the DW XPCS MDIO devices are either left unmasked for being auto-probed
> > or explicitly registered in the MDIO subsystem by means of the
> > mdiobus_register_board_info() method there is no point in creating the
> > dummy MDIO device instance in order to get the DW XPCS handler since the
> > MDIO core subsystem will create the device during the MDIO bus
> > registration procedure. All what needs to be done is to just reuse the
> > MDIO-device instance available in the mii_bus.mdio_map array (using some
> > getter for it would look better though). It shall prevent the XPCS devices
> > been accessed over several MDIO-device instances.
> > 
> > Note since the MDIO-device instance might be retrieved from the MDIO-bus
> > map array its reference counter shall be increased. If the MDIO-device
> > instance is created in the xpcs_create_mdiodev() method its reference
> > counter will be already increased. So there is no point in toggling the
> > reference counter in the xpcs_create() function. Just drop it from there.
> > 
> > Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
> > ---
> >  drivers/net/pcs/pcs-xpcs.c | 26 +++++++++++++-------------
> >  1 file changed, 13 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> > index 2850122f354a..a53376472394 100644
> > --- a/drivers/net/pcs/pcs-xpcs.c
> > +++ b/drivers/net/pcs/pcs-xpcs.c
> > @@ -1376,7 +1376,6 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
> >  	if (!xpcs)
> >  		return ERR_PTR(-ENOMEM);
> >  
> > -	mdio_device_get(mdiodev);
> >  	xpcs->mdiodev = mdiodev;
> >  
> >  	xpcs_id = xpcs_get_id(xpcs);
> > @@ -1417,7 +1416,6 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev,
> >  	ret = -ENODEV;
> >  
> >  out:
> > -	mdio_device_put(mdiodev);
> >  	kfree(xpcs);
> >  
> >  	return ERR_PTR(ret);
> 
> The above two hunks are a completely Unnecessary change.
> 
> > @@ -1437,19 +1435,21 @@ struct dw_xpcs *xpcs_create_mdiodev(struct mii_bus *bus, int addr,
> >  	struct mdio_device *mdiodev;
> >  	struct dw_xpcs *xpcs;
> >  
> > -	mdiodev = mdio_device_create(bus, addr);
> > -	if (IS_ERR(mdiodev))
> > -		return ERR_CAST(mdiodev);
> > +	if (addr >= PHY_MAX_ADDR)
> > +		return ERR_PTR(-EINVAL);
> >  
> > -	xpcs = xpcs_create(mdiodev, interface);
> > +	if (mdiobus_is_registered_device(bus, addr)) {
> > +		mdiodev = bus->mdio_map[addr];
> > +		mdio_device_get(mdiodev);
> 
> This is fine - taking a reference on the mdiodev you've got from
> somewhere else is the right thing to do.
> 
> > +	} else {
> > +		mdiodev = mdio_device_create(bus, addr);
> > +		if (IS_ERR(mdiodev))
> > +			return ERR_CAST(mdiodev);
> > +	}
> >  
> > -	/* xpcs_create() has taken a refcount on the mdiodev if it was
> > -	 * successful. If xpcs_create() fails, this will free the mdio
> > -	 * device here. In any case, we don't need to hold our reference
> > -	 * anymore, and putting it here will allow mdio_device_put() in
> > -	 * xpcs_destroy() to automatically free the mdio device.
> > -	 */
> > -	mdio_device_put(mdiodev);
> > +	xpcs = xpcs_create(mdiodev, interface);
> > +	if (IS_ERR(xpcs))
> > +		mdio_device_put(mdiodev);
> 

> Without the change to xpcs_create() you don't need this change - and
> this is why I say you don't understand refcounting.
> 
> The point here is that the refcounting management is in each function
> where references are gained or lost.
> 
> xpcs_create() creates a new reference to the mdiodev by storing it in
> the dw_xpcs structure. Therefore, it takes a reference to the mdiodev.
> If something fails, it drops that reference to restore the refcount
> as it was on function entry.
> 
> xpcs_create_mdiodev() as it originally stood creates the mdiodev from
> the bus/address, and then passes that to xpcs_create(). Once
> xpcs_create() has finished its work (irrespective of whether it was
> successful or not) we're done with the mdiodev in this function, so
> the reference is _always_ put.

Can't deny now I fully understood the whole concept indeed. It was the
first time I met the double refcount management in a single place. My
understanding was that it was enough to increment the counter once,
when a driver got a pointer from somewhere else (like another
subsystem) and decrement it after it's not used for sure. From that
perspective getting a device in xpcs_create_mdiodev(), putting it in
the cleanup-on-error path and in xpcs_destroy() was supposed to be
enough.

You say that it's required to manage the refcounting twice: when we
get the reference from some external place and internally when the
reference is stored in the XPCS descriptor. What's the point in such
redundancy with the internal ref-counting if we know that the pointer
can be safely stored and utilized afterwards? Better maintainability?
Is it due to having the object retrieval and storing implemented in
different functions?

While at it if you happen to know an answer could you please also
clarify the next question. None of the ordinary
platform/PCI/USB/hwmon/etc drivers I've been working with managed
refcounting on storing a passed to probe() device pointer in the
private driver data. Is it wrong not doing that? Should the drivers
call get_device() or it's derivatives in probe() if the respective
object is stored in the driver data? If they shouldn't since the ref
is already counted by the bus-specific probe() methods, then what
makes the DW XPCS create/destroy methods special to have the double
ref-counting utilized there?

> 
> For your use case, it would be:
> 
> 	mdiodev = bus->mdio_map[addr];
> 	mdio_device_get(mdiodev);
> 
> 	xpcs = xpcs_create(mdiodev, interface);
> 
> 	mdio_device_put(mdiodev);
> 
> 	return xpcs;
> 
> which illustrates this point - we get a reference to the mdiodev by
> reading it from the array. We do something (calling xpcs_create)
> with it. If that something was successful, it takes its own refcount
> otherwise leaves it as-is. We're then done with the mdiodev so we
> drop the refcount we took.

I do understand the way the refcount management works in your
implementation. It's just hard to figure out the reason of having the
second get/set pair utilized for the internal reference.

Anyway thanks for providing a very detailed comment and in advance for
answering my questions.

-Serge(y)

> 
> There is no need to make the code more complicated by changing this,
> so I regard the refcount changes in this patch to be wrong.
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
