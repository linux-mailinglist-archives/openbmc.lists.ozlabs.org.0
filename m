Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E7D3FE9AE
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 09:05:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0X4K4mRGz2yYl
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 17:05:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158;
 helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au;
 receiver=<UNKNOWN>)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0X4410bxz2xsj;
 Thu,  2 Sep 2021 17:04:52 +1000 (AEST)
Received: from [172.16.66.18] (unknown [49.255.141.98])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E01AA20164;
 Thu,  2 Sep 2021 15:04:48 +0800 (AWST)
Message-ID: <513cb05f8d83d08a5c1e491dc0a9b6784195e7dd.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 3/4] soc: aspeed: Add eSPI driver
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au"
 <andrew@aj.id.au>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Thu, 02 Sep 2021 15:04:47 +0800
In-Reply-To: <HK0PR06MB37792273A075533C2570002391CE9@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210901033015.910-1-chiawei_wang@aspeedtech.com>
 <20210901033015.910-4-chiawei_wang@aspeedtech.com>
 <20c13b9bb023091758cac3a07fb4037b7d796578.camel@codeconstruct.com.au>
 <HK0PR06MB37792273A075533C2570002391CE9@HK0PR06MB3779.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Morris Mao <morris_mao@aspeedtech.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chiawei,

> The eSPI on BMC side is a slave device. Most of time it listen to the
> Host requests and then react.
> This makes it not quite fit to interfaces that act as a master role.

That's a good point, but I don't think it precludes using existing
interfaces.

> > 1) The VW channel is essentially a GPIO interface, and we have a
> > kernel    subsystem to expose GPIOs. We might want to add additional
> > support    for in-kernel system event handlers, but that's a minor
> > addition that    can be done separately if we don't want that
> > handled by a gpio    consumer in userspace.
> 
> eSPI VW channel can be used to forward a byte value to/from GPIO.

I'm not referring to the hardware GPIOs that can be connected here,
rather the logic values represented over the VW channel. The eSPI master
is transferring IO states over the channel, and we could represnt those
on the BMC side as "virtual" GPIOs.

If that model doesn't fit though, that's OK, but I think we need some
rationale there.

> > 
> > 2) The out-of-band (OOB) channel provides a way to issue SMBus
> >    transactions, so could well provide an i2c controller interface.
> >    Additionally, the eSPI specs imply that this is intended to
> > support
> >    MCTP - in which case, you'll *need* a kernel i2c controller
> > device to
> >    be able to use the new kernel MCTP stack.
> 
> Could you share us more information about the i2c need of kernel MCTP
> kernel stack?

The currently proposed mctp-i2c interface driver binds to a kernel i2c
device. If you expose a kernel i2c device here, we can connect that as
an MCTP interface.

With the packet interface proposed here, we can't do that, and would
need a whole new driver for this, implemented in userspace. The same
would apply to any other usage of the i2c bus (EEPROM access, etc).

> > 3) The flash channel exposes read/write/erase operations, which
> > would be
> >    much more useful as an actual flash-type device, perhaps using
> > the
> >    existing mtd interface? Or is there additional functionality
> >    expected for this?
> 
> The flash channel works in either the Master Attached Flash Sharing
> (MAFS) or Slave Attached Flash Sharing (SAFS) mode.
> 
> For MAFS, BMC issues eSPI flash R/W/E packets to the Host.
> In this case, it may fit into the MTD interface.
> 
> For SAFS (mostly used), BMC needs to listen, parse and filter eSPI
> flash R/W/E packets from the Host.
> And then send replies in the eSPI success/unsuccess completion packet
> format.
> This behaves differently from MTD.
> 
> To support both the two scenario, the MTD interface might not be
> suitable.

OK, that makes sense. In this case the BMC is acting as the virtual
flash device, right?

> > 4) The peripheral channel is the only one that would seem to require
> > arbitrary cycle access, but we'll still need a proper uapi
> > definition to support that. At the minimum, your ioctl definitions
> > should go under include/uapi/ - you shouldn't need to duplicate the
> > header into each userspace repo, as you've done for the test
> > examples.
> 
> In the first submission, I was told that the include/uapi patch is
> not going to be accepted.

This is what you were told in the v1 submission:

> >  create mode 100644 include/uapi/linux/aspeed-espi.h
>
> This userspace interface is not going to be accepted upstream.

It sees like that was a comment about the API itself, not the location
of the header (Rob, correct me if I'm wrong). Simply moving the header
out of the uapi directory, while retaining the same API, is not a
solution to this.

> In summary, considering the various applications that might be
> constructed upon eSPI transaction,
> we thought that the raw packet paradigm might be the first step to
> start with.

Keep in mind that you're creating a kernel ABI here, which has to stay
in place forever - even if it's the first step to something else, we
cannot break future compatibility.

Regards,


Jeremy

