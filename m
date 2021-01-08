Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE592EEB92
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 04:00:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBnsq4S2DzDqHJ
	for <lists+openbmc@lfdr.de>; Fri,  8 Jan 2021 14:00:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=hXyKJvBW; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBnrf2ycbzDqjN;
 Fri,  8 Jan 2021 13:59:43 +1100 (AEDT)
Received: by mail-qt1-x82b.google.com with SMTP id g24so5698256qtq.12;
 Thu, 07 Jan 2021 18:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m1UOnZQlSUpnf6aKPwE+X4haOuAWzcolUyB8HXclKZk=;
 b=hXyKJvBWO47USxHNP91v+gMyjfU65MiJCuufIGMJTAK222NvZmZlCtJt1Rzl/mycDM
 Nf6XnQh73y7OiZqLNySBMgSDSqzmV+j7kIbNHCajVDqQnY13pPqMEIuFKjq67rTQq0xj
 F5eNNsi3tEDYhNIFGi/ztmmRfOHrQty8CJ3/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m1UOnZQlSUpnf6aKPwE+X4haOuAWzcolUyB8HXclKZk=;
 b=GacVq9EGmrnsU6ukR4igxJfKX80cPuqKBWbPiB5ZIEGP9sHo0winwhPm952vWqEvyd
 MpCOmdXD1orx2Nqb3ew4Z+DLdnBqlwRsIoa6pY31Sv5LY3ET/yGJuetvb/r9jO30AjFZ
 76R32MtB/y21WCbGPi0VfnA1K64rxJAgz5CtdNskf/2DVEVH0YvB0o/Zc3yTbRq7tYmd
 8Pew5Dk4/aujHTNObRJ+AFkygNy9LqhPfapUPfBi1ZFgM5dHrh2A5ygPJNt896vDRTQv
 MygZ5zQKml9xrao4UGJC6sQdUH4krtcWsoVrq/MRRKlNzGeDnS7DCIt4XrBvGJxpJ6n6
 2Zig==
X-Gm-Message-State: AOAM530w+evdcnb/EH5P5HVAvcAKVnZF/oWhYYDpbfn/8Ye6W4i2/V79
 xKVKMdt/bwHID/hie11vBLymZ2OcdSJcZB+fcnE=
X-Google-Smtp-Source: ABdhPJzgwxO1QYsS1AD103dGGMwHdDtcECTAh5zBmhiw0tIxXUY3pxQQ/nGQO979T5rDAeRPM0TxIO3GFuCFkyqwz0M=
X-Received: by 2002:aed:2d65:: with SMTP id h92mr1632947qtd.263.1610074779999; 
 Thu, 07 Jan 2021 18:59:39 -0800 (PST)
MIME-Version: 1.0
References: <20210106055939.19386-1-chiawei_wang@aspeedtech.com>
 <20210106055939.19386-6-chiawei_wang@aspeedtech.com>
 <20210106153202.GA2258036@robh.at.kernel.org>
 <HK0PR06MB377987E19F57E53CC4F32FF991AF0@HK0PR06MB3779.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB377987E19F57E53CC4F32FF991AF0@HK0PR06MB3779.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Jan 2021 02:59:28 +0000
Message-ID: <CACPK8XfCpUDXi-e1Sh1t+wm_-vXNihRchkmQby7fUXi0mCdMwA@mail.gmail.com>
Subject: Re: [PATCH 5/6] soc: aspeed: Add eSPI driver
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Rob Herring <robh@kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "maz@kernel.org" <maz@kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 BMC-SW <BMC-SW@aspeedtech.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 7 Jan 2021 at 02:39, ChiaWei Wang <chiawei_wang@aspeedtech.com> wrote:
>
> Hi Rob,
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Wednesday, January 6, 2021 11:32 PM
> > To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> > Subject: Re: [PATCH 5/6] soc: aspeed: Add eSPI driver
> >
> > On Wed, Jan 06, 2021 at 01:59:38PM +0800, Chia-Wei, Wang wrote:
> > > The Aspeed eSPI controller is slave device to communicate with the
> > > master through the Enhanced Serial Peripheral Interface (eSPI).
> > > All of the four eSPI channels, namely peripheral, virtual wire,
> > > out-of-band, and flash are supported.
> > >
> > > Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> > > ---
> > >  drivers/soc/aspeed/Kconfig                  |  49 ++
> > >  drivers/soc/aspeed/Makefile                 |   5 +
> > >  drivers/soc/aspeed/aspeed-espi-ctrl.c       | 197 ++++++
> > >  drivers/soc/aspeed/aspeed-espi-flash.c      | 490 ++++++++++++++
> > >  drivers/soc/aspeed/aspeed-espi-oob.c        | 706
> > ++++++++++++++++++++
> > >  drivers/soc/aspeed/aspeed-espi-peripheral.c | 613 +++++++++++++++++
> > >  drivers/soc/aspeed/aspeed-espi-vw.c         | 211 ++++++
> > >  include/uapi/linux/aspeed-espi.h            | 160 +++++
> > >  8 files changed, 2431 insertions(+)
> > >  create mode 100644 drivers/soc/aspeed/aspeed-espi-ctrl.c
> > >  create mode 100644 drivers/soc/aspeed/aspeed-espi-flash.c
> > >  create mode 100644 drivers/soc/aspeed/aspeed-espi-oob.c
> > >  create mode 100644 drivers/soc/aspeed/aspeed-espi-peripheral.c
> > >  create mode 100644 drivers/soc/aspeed/aspeed-espi-vw.c
> >
> > drivers/spi/ is the correct location for a SPI controller.
> >
> > >  create mode 100644 include/uapi/linux/aspeed-espi.h
> >
> > This userspace interface is not going to be accepted upstream.
> >
> > I'd suggest you look at similar SPI flash capable SPI controller drivers upstream
> > and model your driver after them. This looks like it needs major reworking.
> >
> eSPI resues the timing and electrical specification of SPI but runs completely different protocol.
> Only the flash channel is related to SPI and the other 3 channels are for EC/BMC/SIO.
> Therefore, an eSPI driver might not fit into the SPI model.

I agree, the naming is confusing but eSPI doesn't belong in drivers/spi.

As it is a bus that is common to more than just the Aspeed BMC, we may
want to implement it as a new bus type that has devices hanging off
it, similar to FSI.

Cheers,

Joel
