Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF14580EE22
	for <lists+openbmc@lfdr.de>; Tue, 12 Dec 2023 14:53:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dtTH9ehf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqKnR2tXKz3bsS
	for <lists+openbmc@lfdr.de>; Wed, 13 Dec 2023 00:52:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dtTH9ehf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqKms1Q7Nz30fF
	for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2023 00:52:27 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50bf4f97752so7323619e87.1
        for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2023 05:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702389140; x=1702993940; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cFnllcfa91c1zJc4Gntywu/a8dFRpUHFeO6CvIvFtu4=;
        b=dtTH9ehf05oGsXb0QVvqV80TOAiBV4Zwh5rtWH0VBXSruDcuLACeJnab2jJKivMuC3
         rBuHThGG1kZWH++Nrn/gapidRD9TUVo6G3NKLk4via79wUy2TgqWLRig8yY+h8NFrXcS
         AgjQUxwvRhJZQi8NFhMsZLmo/bv8wCNUaaFF8Oz39YBoxvu2D7tUfDlDVETH5humkWqu
         AAau2XwacP4pGr5bDqJjFBMbV0ZY9ZcTvEtr9x+UbZA810ZjcXPRpO/442eXVltm55lV
         zv1mU6js7D3/spwDvgmcAqiHOlA6BPiBfFLnJMjEWni2j9kw2WdzJ3bTQaJftT3wi2Kt
         AgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702389140; x=1702993940;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFnllcfa91c1zJc4Gntywu/a8dFRpUHFeO6CvIvFtu4=;
        b=jJQlF6CruXOlY3XK7WN55AKB+BC9w7aMWBtVOuwlI8fX0QnLj678TGy6avoH4NRmsh
         4kx2uXB44M4BGCObsCIyJQLsUWccRxWlRhnw7CS/IAxZlqA53gXM3OVqkHfHJB0KXrIN
         WU0oOBFw2EKKwrOxPTSZY7dYRF47timbRo7jYyKknikmYLccOl4oQtJofwdE/BK4kt7j
         gaJiR0GXPYNYozFv2YZxFOaWbInvvqspLPlD7WyTR9TT++DzGF+AOZCBrnWhpQr7g1vl
         3YgrahxyBYxIaco3aODZvg6urkK/Sz8yet3ilKZ1/Vyw3BG689GY1eKMdtAQlAd5sczY
         MGQw==
X-Gm-Message-State: AOJu0Yw0xQBNjlwylwG1qC9kBt4U5Apce3LWXgOv63gKieQICtzrvUNR
	9FZ892QeN//Gf1AR6QHTgD8=
X-Google-Smtp-Source: AGHT+IHQrUXSxuBn29LhUoJX1ePcDGg56snRNXblvB5VLnQAdFUNh09t5mpngpSLdnTnZAS3jpzzfw==
X-Received: by 2002:a05:6512:3b8d:b0:50c:c8b8:669a with SMTP id g13-20020a0565123b8d00b0050cc8b8669amr3958930lfv.92.1702389139829;
        Tue, 12 Dec 2023 05:52:19 -0800 (PST)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id g4-20020a0565123b8400b0050bfb2a5661sm1363163lfv.103.2023.12.12.05.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 05:52:19 -0800 (PST)
Date: Tue, 12 Dec 2023 16:52:15 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
	"Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH net-next 06/16] net: pcs: xpcs: Avoid creating dummy XPCS
 MDIO device
Message-ID: <na6krkoco7pmsl62dfuj2xlrvpsnod74ptpfyy6gv7dzwmowga@mzsiknjian2i>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-7-fancer.lancer@gmail.com>
 <ZW8ASzkC9IFFlxkV@shell.armlinux.org.uk>
 <rgp33mm4spbpm5tmgxurkhy4is3lz3z62rz64rni2pygteyrit@zwflw2ejdkn7>
 <e1806c15-757e-4af0-a8be-075aa77918c2@lunn.ch>
 <ZW840qQMbVRto442@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZW840qQMbVRto442@shell.armlinux.org.uk>
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

Hi Andrew, Russell

Sorry for the delay with response. I had to refresh my understanding
of the series since it was created sometime ago and I already managed
to forget some of its aspects (particularly regarding the MDIO-bus
PHY-mask semantics).

On Tue, Dec 05, 2023 at 02:50:58PM +0000, Russell King (Oracle) wrote:
> On Tue, Dec 05, 2023 at 02:52:24PM +0100, Andrew Lunn wrote:
> > On Tue, Dec 05, 2023 at 02:31:41PM +0300, Serge Semin wrote:
> > > On Tue, Dec 05, 2023 at 10:49:47AM +0000, Russell King (Oracle) wrote:
> > > > On Tue, Dec 05, 2023 at 01:35:27PM +0300, Serge Semin wrote:
> > > > > If the DW XPCS MDIO devices are either left unmasked for being auto-probed
> > > > > or explicitly registered in the MDIO subsystem by means of the
> > > > > mdiobus_register_board_info() method there is no point in creating the
> > > > > dummy MDIO device instance in order to get the DW XPCS handler since the
> > > > > MDIO core subsystem will create the device during the MDIO bus
> > > > > registration procedure.
> > > > 
> > > 
> > > > Please reword this overly long sentence.
> > > 
> > > Ok.
> > > 
> > > > 
> > > > If they're left unmasked, what prevents them being created as PHY
> > > > devices?
> > > 
> > > Not sure I fully get what you meant. If they are left unmasked the
> > > MDIO-device descriptor will be created by the MDIO subsystem anyway.
> > > What the point in creating another one?
> > 

> > Saying what Russell said, in a different way:
> > 
> > /*
> >  * Return true if the child node is for a phy. It must either:
> >  * o Compatible string of "ethernet-phy-idX.X"
> >  * o Compatible string of "ethernet-phy-ieee802.3-c45"
> >  * o Compatible string of "ethernet-phy-ieee802.3-c22"
> >  * o In the white list above (and issue a warning)
> >  * o No compatibility string
> >  *
> >  * A device which is not a phy is expected to have a compatible string
> >  * indicating what sort of device it is.
> >  */
> > bool of_mdiobus_child_is_phy(struct device_node *child)
> > 
> > So when walking the bus, if a node is found which fits these criteria,
> > its assumed to be a PHY. 
> > 
> > Anything on the MDIO bus which is not a PHY needs to use a compatible.
> 
> Right. I'd actually forgotten about the firmware-based walking, and
> was thinking more of the non-firmware bus scanning as the commit
> message was talking about being _unmasked_ and the only mask we have
> is bus->phy_mask.

Back then when I was working on the series and up until last week I
had thought that having a device unmasked in mii_bus->phy_mask was a
correct way to do for _any_ device including our DW XPCS (which BTW
looks like a normal C45 PHY and if synthesized with a PMA attached
could be passed to be handled by the PHY subsystem). Can't remember
why exactly I came to that thought, but likely it was due to finding
out examples of having mii_bus->phy_mask uninitialized in some of the
PCS use-cases, like in drivers/net/dsa/ocelot/felix_vsc9959.c (but in
case of DW XPCS the mask is always set indeed). Anyway obviously I was
wrong and PHY-device is supposed to be created only if a device is
actual PHY and handled by the PHY subsystem drivers. So the correct
ways to create PHY MDIO-devices are:

1. Call mdiobus_register() with PHY-addresses unmasked
2. Call of_mdiobus_register() for a DT-node with sub-nodes for which
of_mdiobus_child_is_phy() returns true.

and the correct ways to create non-PHY MDIO-devices are:

1. Call mdiobus_register() with non-PHY-addresses masked and have
those non-PHY device registered by mdiobus_register_board_info()
beforehand.
2. Call of_mdiobus_register() with DT sub-nodes having specific
compatible string (based on the of_mdiobus_child_is_phy() semantics).

Only in case of having a non-PHY device registered it's allowed to
use it in in non-PHY MDIO driver, like PCS, etc. Right?

Please correct me if I am wrong or miss something.

> 
> It seems to me that this is yet another case of a really confusing
> commit message making review harder than it needs to be.

From the perspective described above the patch log is indeed partly
wrong. Sorry about that. I shouldn't have mentioned the mask at all
but instead just listed two use-cases of creating the non-PHY
MDIO-devices. I'll fix that in v2.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 
