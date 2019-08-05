Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B897581BBB
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 15:17:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462JFz6FnpzDqGq
	for <lists+openbmc@lfdr.de>; Mon,  5 Aug 2019 23:17:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="GuxWmFT6"; 
 dkim-atps=neutral
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462JDL4zk6zDqPy
 for <openbmc@lists.ozlabs.org>; Mon,  5 Aug 2019 23:15:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mMVLKd7RxWHn6VLFRfZGxtHqq0KuNG0+8uSax8MKgBQ=; b=GuxWmFT6OVlx+jFTv+Z7Zd1Wgb
 HphyPBudXIGS+EiQ8QoZ0QBY8tClZVVgGH5iPyjTABd+o77dK7kPqS96WGxmNbyS3buiX0OWBD12U
 o8xM2c2KshtAzrMQ6a4sx0Tmjso0+eGJYJfo1uWDAsb/qyqgyryz6iyaVVQ0fXOUX5MM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hucpn-0006Tb-Fe; Mon, 05 Aug 2019 15:15:31 +0200
Date: Mon, 5 Aug 2019 15:15:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Tao Ren <taoren@fb.com>
Subject: Re: [PATCH net-next v3] net: phy: broadcom: add 1000Base-X support
 for BCM54616S
Message-ID: <20190805131531.GB24275@lunn.ch>
References: <20190802215419.313512-1-taoren@fb.com>
 <CA+h21hrOEape89MTqCUyGFt=f6ba7Q-2KcOsN_Vw2Qv8iq86jw@mail.gmail.com>
 <53e18a01-3d08-3023-374f-2c712c4ee9ea@fb.com>
 <20190804145152.GA6800@lunn.ch>
 <2dd073b2-8495-593f-cd56-c39fd1c38a42@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dd073b2-8495-593f-cd56-c39fd1c38a42@fb.com>
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, netdev <netdev@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 lkml <linux-kernel@vger.kernel.org>, Justin Chen <justinpopo6@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 05, 2019 at 06:38:16AM +0000, Tao Ren wrote:
> Hi Andrew,
> 
> On 8/4/19 7:51 AM, Andrew Lunn wrote:
> >>> The patchset looks better now. But is it ok, I wonder, to keep
> >>> PHY_BCM_FLAGS_MODE_1000BX in phydev->dev_flags, considering that
> >>> phy_attach_direct is overwriting it?
> >>
> > 
> >> I checked ftgmac100 driver (used on my machine) and it calls
> >> phy_connect_direct which passes phydev->dev_flags when calling
> >> phy_attach_direct: that explains why the flag is not cleared in my
> >> case.
> > 
> > Yes, that is the way it is intended to be used. The MAC driver can
> > pass flags to the PHY. It is a fragile API, since the MAC needs to
> > know what PHY is being used, since the flags are driver specific.
> > 
> > One option would be to modify the assignment in phy_attach_direct() to
> > OR in the flags passed to it with flags which are already in
> > phydev->dev_flags.
> 

> It sounds like a reasonable fix/enhancement to replace overriding
> with OR, no matter which direction we are going to (either adding
> 1000bx aneg in genphy or providing phy-specific aneg callback).

> Do you want me to send out the patch (I feel it's better to be in a
> separate patch?) or someone else will take care of it?

Hi Tao

Please send a patch.

Thanks
       Andrew
