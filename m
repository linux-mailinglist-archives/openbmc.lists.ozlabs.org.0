Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 961132E0F8F
	for <lists+openbmc@lfdr.de>; Tue, 22 Dec 2020 22:01:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0pfj375bzDqTh
	for <lists+openbmc@lfdr.de>; Wed, 23 Dec 2020 08:01:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch
 (client-ip=185.16.172.187; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lunn.ch
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0pdx343kzDqLv
 for <openbmc@lists.ozlabs.org>; Wed, 23 Dec 2020 08:00:48 +1100 (AEDT)
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1krolm-00DS6O-5t; Tue, 22 Dec 2020 22:00:34 +0100
Date: Tue, 22 Dec 2020 22:00:34 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Aspeed, v2 2/2] net: ftgmac100: Change the order of getting MAC
 address
Message-ID: <20201222210034.GC3198262@lunn.ch>
References: <20201221205157.31501-2-hongweiz@ami.com>
 <20201222201437.5588-3-hongweiz@ami.com>
 <96c355a2-ab7e-3cf0-57e7-16369da78035@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96c355a2-ab7e-3cf0-57e7-16369da78035@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 netdev <netdev@vger.kernel.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Hongwei Zhang <hongweiz@ami.com>,
 Jakub Kicinski <kuba@kernel.org>, David S Miller <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Dec 22, 2020 at 09:46:52PM +0100, Heiner Kallweit wrote:
> On 22.12.2020 21:14, Hongwei Zhang wrote:
> > Dear Reviewer,
> > 
> > Use native MAC address is preferred over other choices, thus change the order
> > of reading MAC address, try to read it from MAC chip first, if it's not
> >  availabe, then try to read it from device tree.
> > 
> > 
> > Hi Heiner,
> > 
> >> From:	Heiner Kallweit <hkallweit1@gmail.com>
> >> Sent:	Monday, December 21, 2020 4:37 PM
> >>> Change the order of reading MAC address, try to read it from MAC chip 
> >>> first, if it's not availabe, then try to read it from device tree.
> >>>
> >> This commit message leaves a number of questions. It seems the change isn't related at all to the 
> >> change that it's supposed to fix.
> >>
> >> - What is the issue that you're trying to fix?
> >> - And what is wrong with the original change?
> > 
> > There is no bug or something wrong with the original code. This patch is for
> > improving the code. We thought if the native MAC address is available, then
> > it's preferred over MAC address from dts (assuming both sources are available).
> > 
> > One possible scenario, a MAC address is set in dts and the BMC image is 
> > compiled and loaded into more than one platform, then the platforms will
> > have network issue due to the same MAC address they read.
> > 
> 
> Typically the DTS MAC address is overwritten by the boot loader, e.g. uboot.
> And the boot loader can read it from chip registers. There are more drivers
> trying to read the MAC address from DTS first. Eventually, I think, the code
> here will read the same MAC address from chip registers as uboot did before.

Do we need to worry about, the chip contains random junk, which passes
the validitiy test? Before this patch the value from DT would be used,
and the random junk is ignored. Is this change possibly going to cause
a regression?

	Andrew
