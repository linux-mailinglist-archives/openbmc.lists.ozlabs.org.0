Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 245DF8052EA
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 12:32:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mELkeUkE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Skz0J4L5Hz3ckL
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 22:32:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mELkeUkE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skyzm3R8Lz2yVh
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 22:31:47 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-50bf69afa99so2686552e87.3
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 03:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701775904; x=1702380704; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iWABwC93ZRSAHZ+Njf9xIdiKvJp/CP14/ZzB27UiO+I=;
        b=mELkeUkENy5g/xUHpyHwAc6/CX6zzQ87NVnY2QAukvz/6iyWMX/PznNQ1zmTHjIEry
         yJGSnICXtM8wBQTxEv4v7cG/NyZVchhLtDCtK+qIkaspnKqO9u7cS1n1cz9GBdKqfCOD
         pQIBtkQYTlOfTVfRxv4nQB7Uqhl9ZC2rKuJdWVCpiTuqKyCgR4WS8cdsn3JKqjxBQLA/
         +t0GKeqyGc1dL4NjL+l040si0+FU7OUQr0UlM1IdVVTYG9PMo9PbrE3ooGsHrMfiK2OJ
         pbvVH8zpF5I8uEKoBMuB1UZvbE092T6HDfOLUgL7pRgazPoZ7/Zoabmb/aJcD6b8mL2P
         Yq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701775904; x=1702380704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWABwC93ZRSAHZ+Njf9xIdiKvJp/CP14/ZzB27UiO+I=;
        b=Fhz04cJPeRx9z1JBTBXuSfcK7Oxs6YqK/HGxpoHoLinFg97+688nBdOBVGJIbzUcAV
         QtYUZodv7mIW2v2wF9YAqyC4qg/NTC1PLNZgS+awa+qFr/rnlf5OmY9eyrfYM/qrF7IF
         6LbXgK1+d1LTlUGJX23hupCq/NOg6T3FDtlzobdA66rQVlW5jzlufRMB7JNI5gENGzpH
         mKW1qJ8ciQxSWwjKS7isPkSVQ6AzvcCfCHQ6uR0SuiuyVRFL8ecykNFLYkxx0GY6gc2K
         iRQWaDAgz2M3NI+k2ePQ+2NY4GXLW7bTh9qx1bDGhbXuxellKkc7epwpkz0K1F7xpoDI
         4f5w==
X-Gm-Message-State: AOJu0YxW9kO06IlgnLG452sCsmshP03lgDkegezT/frKNwp6azjeV+7F
	c2cAD38zeSJvlyuFJZ6rGSY=
X-Google-Smtp-Source: AGHT+IFOyPrsnNLbi6atUEGuAJC2I0o2XaEEchq0I+1cdYruq2/3i2EBhY8YCpuSc2tnpJmsGAzuyg==
X-Received: by 2002:ac2:5490:0:b0:50b:f2e0:4997 with SMTP id t16-20020ac25490000000b0050bf2e04997mr1735238lfk.103.1701775904378;
        Tue, 05 Dec 2023 03:31:44 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id bi38-20020a0565120ea600b0050bfd88075asm395757lfb.287.2023.12.05.03.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 03:31:43 -0800 (PST)
Date: Tue, 5 Dec 2023 14:31:41 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 06/16] net: pcs: xpcs: Avoid creating dummy XPCS
 MDIO device
Message-ID: <rgp33mm4spbpm5tmgxurkhy4is3lz3z62rz64rni2pygteyrit@zwflw2ejdkn7>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
 <ZW8ASzkC9IFFlxkV@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZW8ASzkC9IFFlxkV@shell.armlinux.org.uk>
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

On Tue, Dec 05, 2023 at 10:49:47AM +0000, Russell King (Oracle) wrote:
> On Tue, Dec 05, 2023 at 01:35:27PM +0300, Serge Semin wrote:
> > If the DW XPCS MDIO devices are either left unmasked for being auto-probed
> > or explicitly registered in the MDIO subsystem by means of the
> > mdiobus_register_board_info() method there is no point in creating the
> > dummy MDIO device instance in order to get the DW XPCS handler since the
> > MDIO core subsystem will create the device during the MDIO bus
> > registration procedure.
> 

> Please reword this overly long sentence.

Ok.

> 
> If they're left unmasked, what prevents them being created as PHY
> devices?

Not sure I fully get what you meant. If they are left unmasked the
MDIO-device descriptor will be created by the MDIO subsystem anyway.
What the point in creating another one?

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

> No, this makes no sense now. This function is called
> xpcs_create_mdiodev() - note the "create_mdiodev" part. If it's getting
> the mdiodev from what is already there then it isn't creating it, so
> it's no longer doing what it says in its function name. If you want to
> add this functionality, create a new function to do it.

AFAICS the method semantics is a bit different. It's responsibility is to
create the DW XPCS descriptor. MDIO-device is utilized internally by
the DW XPCS driver. The function callers don't access the created MDIO
device directly (at least since some recent commit). So AFAIU "create"
means creating the XPCS descriptor irrespective from the internal
communication layer. So IMO the suffix is a bit misleading. I'll
change it in one of the next commit anyway. Should I just merge that
patch back in this one?

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
