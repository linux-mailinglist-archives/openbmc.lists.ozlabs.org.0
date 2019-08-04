Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C706B80BAC
	for <lists+openbmc@lfdr.de>; Sun,  4 Aug 2019 18:23:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 461mQn3DxhzDqd7
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 02:22:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="Cs44fTZH"; 
 dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 461mQ91ggvzDqWq
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 02:22:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kr2uYMmZDpUO1/Oyu8nKDJ6LDea+x/hpCdWyFJ2gDTs=; b=Cs44fTZHL2QOmZcTJs/4ZTf/DF
 cTsDYmlPmbt4OW5rNafTkzyTfqh58YvggPoH6X3zb2cydczTyzvLQyI6NLcWNJf5G3Wh6YtDW/KAh
 9JLxBFZUi3a0gVJZBsjvttQq4Whku/az7H3iS6CP5LryJbVWnHy+b/uCILS/L7VjZmAI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1huJGx-0002MZ-U4; Sun, 04 Aug 2019 18:22:15 +0200
Date: Sun, 4 Aug 2019 18:22:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next v3] net: phy: broadcom: add 1000Base-X support
 for BCM54616S
Message-ID: <20190804162215.GE6800@lunn.ch>
References: <20190802215419.313512-1-taoren@fb.com>
 <CA+h21hrOEape89MTqCUyGFt=f6ba7Q-2KcOsN_Vw2Qv8iq86jw@mail.gmail.com>
 <53e18a01-3d08-3023-374f-2c712c4ee9ea@fb.com>
 <20190804145152.GA6800@lunn.ch>
 <CA+h21hrUDaSxKpsy9TuWqwgaxKYaoXHyhgS=xSoAcPwxXzvrHg@mail.gmail.com>
 <f8de2514-081a-0e6e-fbe2-bcafcd459646@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8de2514-081a-0e6e-fbe2-bcafcd459646@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, Tao Ren <taoren@fb.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 lkml <linux-kernel@vger.kernel.org>, Justin Chen <justinpopo6@gmail.com>,
 netdev <netdev@vger.kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> > Even if that were the case (patching phy_attach_direct to apply a
> > logical-or to dev_flags), it sounds fishy to me that the genphy code
> > is unable to determine that this PHY is running in 1000Base-X mode.
> > 
> > In my opinion it all boils down to this warning:
> > 
> > "PHY advertising (0,00000200,000062c0) more modes than genphy
> > supports, some modes not advertised".
> > 
> The genphy code deals with Clause 22 + Gigabit BaseT only.
> Question is whether you want aneg at all in 1000Base-X mode and
> what you want the config_aneg callback to do.
> There may be some inspiration in the Marvel PHY drivers.

As far as i know, you cannot actually advertise 1000Base-X. So we
probably should not be setting the bit in advertise, only having it in
supported?

	Andrew
