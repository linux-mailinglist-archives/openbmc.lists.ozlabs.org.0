Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1F43F93BD
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 06:37:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gwn4B5p8nz2yn9
	for <lists+openbmc@lfdr.de>; Fri, 27 Aug 2021 14:36:58 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gwn3s4vyZz2yJT;
 Fri, 27 Aug 2021 14:36:41 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F3B692012C;
 Fri, 27 Aug 2021 12:36:37 +0800 (AWST)
Message-ID: <3f2feea6c2fb21c2fdcb419cdc7ceddf3ade06ee.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 3/4] soc: aspeed: Add eSPI driver
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>, "joel@jms.id.au"
 <joel@jms.id.au>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "linux-aspeed@lists.ozlabs.org"
 <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Fri, 27 Aug 2021 12:36:37 +0800
In-Reply-To: <HK0PR06MB377997422D9508894936E39691C89@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20210826061623.6352-1-chiawei_wang@aspeedtech.com>
 <20210826061623.6352-4-chiawei_wang@aspeedtech.com>
 <7e7378c49ecfb21fef6a0640f92c1b3a7a5878d0.camel@codeconstruct.com.au>
 <HK0PR06MB377997422D9508894936E39691C89@HK0PR06MB3779.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Chiawei,

> The eSPI slave device comprises four channels, where each of them has
> individual functionality.  Putting the four channels driver code into a
> single file makes it hard to maintain and trace.

Yep, understood.

> We did consider to make them standard .c files.
> But it requires to export channel functions into kernel space
> although they are dedicated only to this eSPI driver.

What do you mean by "export into kernel space" here? The function
prototypes need to be available to your main (-ctrl.c) file, regardless
of whether you're putting the entire functions in a header file, or just
the prototype. There's doesn't need to be any difference in visibility
outside of your own module if you were to do this the usual way.

> As espi-ctrl needs to invoke corresponding channel functions when it
> is interrupted by eSPI events.
> 
> To avoid polluting kernel space, we decided to put driver code in
> header files and make the channel functions 'static'.
> 
> BTW, I once encountered .c file inclusion in other projects. Is it
> proper for Linux driver development?

It can be, just that in this case it's a bit unusual, and I can't see a
good reason for doing so. This could just be a standard
multiple-source-file module.

> eSPI communication is based on the its cycle packet format.
> We intended to let userspace decided how to interpret and compose
> TX/RX packets including header, tag, length (encoded), and data.
> IOCTL comes to our first mind as it also works in the 'packet' like
> paradigm.

But you're not always exposing a packet-like interface for this. For
example, your virtual-wire interface just has a get/set interface for
bits in a register (plus some PCH event handling, which may not be
applicable to all platforms...).

The other channels do look like more of a packet interface though, but
in that case I'm not convinced that an ioctl interface is the best way
to go for that. You're essentially sending a (length, pointer) pair
over the ioctls there, which sounds more like a write() than an ioctl().

Regardless of the choice of interface though, this will definitely need
some documentation or description of the API, and the ioc header to be
somewhere useful for userspace to consume.

With that documented, we'd have a better idea of how the new ABI is
supposed to work.

Cheers,


Jeremy

