Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E591B8A39
	for <lists+openbmc@lfdr.de>; Sun, 26 Apr 2020 02:03:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 498p5c2wvbzDqL9
	for <lists+openbmc@lfdr.de>; Sun, 26 Apr 2020 10:03:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=WIU+e7zq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=mCMYfZnB; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 498p4G0ygRzDq5k
 for <openbmc@lists.ozlabs.org>; Sun, 26 Apr 2020 10:02:04 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E7DD11572;
 Sat, 25 Apr 2020 20:01:59 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sat, 25 Apr 2020 20:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=DRfpY
 Hj0rqmjKvY7O2KwNIHKkTnKjlzsSFMHl76eHuw=; b=WIU+e7zqwPI2iYQUnXn+M
 S7AdZh2Fv+OYS0XIuD7A0tVg3wU1Mopcv76awgkE66KWfkPH2VrU9+V4Ml60yiIc
 iLIRFeCNqz8yT700sOK/+4vMpGxY+Fbww6Pb9GIqsaH1kFo0lCTv+lMcdnB4iyLd
 T7jH9hoHbyUtc0BVcfcNw8stgDh3nvAt3WfC2ESLhNej7KY4qvA84ADENWxQl0Gn
 /Ugawy273HELLm4ysEHxLsyNxHiiFSFwmFKFF75lTC/k1yICJtcl/mIMEdqzce2g
 HpHtx/c4/bwVCCGLDJVjk1itIzxKlqz38lNkxQAGyvsY5cZByYcDcIHTYR4SmepN
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=DRfpYHj0rqmjKvY7O2KwNIHKkTnKjlzsSFMHl76eH
 uw=; b=mCMYfZnBaUHFmdZD/sj+HKLl6i0QGIuksMxCO4Vir5UFQUz/BN5e92cVN
 PsE3N7qOnas3Wj/L5ohG/B9A5TPvYnKkD8gyxJmRMSFNXQAqMj4R/OX+NSyUH54Y
 SGesXtFfR+2KRJGwHIfIz6I75GwZxyB8C6hSK5E7kgczNHKNwDC5raN2BIj6STm5
 w63AWZMwSY9lH10gsgxifr2iOTd/+IgjV38vPFVKpKtQ6ZpYwQKL4d1pzr8kPhHQ
 LaPPtiN5akP9wlBlIvisMS1NJT3s77tVPPLjjugVtE2Rpjw8GUEanvxBFwTh95hM
 HspvBqn5voiXykKN1ALZg4V7OwhcQ==
X-ME-Sender: <xms:ds-kXrjaHClxy5tvIN2OgKahtWuUB5rdNuixkTXuDS5d6HTmnSCrYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrheehgddvkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:d8-kXmhdVN-oqKEXlBnq7bCG81L5fwOKZSplWZQdYfMVC6WvhqaeTw>
 <xmx:d8-kXjcrrZefKRc-QTrlAOP5MsDDo1PMx2IuwCzu3T1oZHsU8PMtJw>
 <xmx:d8-kXqHkhRFgkGdZ9kIfk1cyugYaHr5UJbb-OsjSIw_Zc-PnPiB_9w>
 <xmx:d8-kXuZUf2_iKH0G3HqixkC3o5uImzyc5d00k5UBhohwWy2pZ-mPfA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E27B8E00A9; Sat, 25 Apr 2020 20:01:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-351-g9981f4f-fmstable-20200421v1
Mime-Version: 1.0
Message-Id: <4813264f-fe81-4563-838d-f5356acb768a@www.fastmail.com>
In-Reply-To: <tencent_2D6AE7A4D981E94342BD340BC7DF4EBE7F05@qq.com>
References: <tencent_2D6AE7A4D981E94342BD340BC7DF4EBE7F05@qq.com>
Date: Sun, 26 Apr 2020 09:32:35 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?=E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=B7=E3=82=A8=E3=83=A9?=
 =?UTF-8?Q?=E3=82=B4?= <1181052146@qq.com>,
 openbmc <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_How_can_the_host_access_BMC's_SPI_Flash_via_LPC_and_How_do?=
 =?UTF-8?Q?_BMC's_CPU_read_uboot_from_SPI_Flash_when_power_up=3F?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Hi Liu Hongwei,

On Fri, 24 Apr 2020, at 23:58, =E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=
=B7=E3=82=A8=E3=83=A9=E3=82=B4 wrote:
> Hi, Greetings
>  A BMC usually uses aspeed's chip. To learn BMC I read the spec of=20
> aspeed's AST2500. I have long been confused by two questions when I am=
=20
> learning BMC.

>  1. One is that: How can the host access BMC's SPI Flash via LPC? I=20=

> read from AST2500's spec that the host can update the BIOS stored in=20=

> the SPI flash via LPC.

Okay first thing to address is separation of concerns: There are separat=
e
SPI controllers for the BMC and host firmware.

> I also seen from AST2500's spec that the SPI=20
> controller in AST2500 can be access by host through LPC. It seems like=
=20
> the architecture is as below.
>  Host CPU---->LPC---->SPI controller---->SPI Flash[BIOS]

Roughly, yes. There are a couple of other critical pieces of the puzzle:=


1. The SPI-attached storage is mapped into the BMC's physical address
space
2. The BMC's LPC slave controller contains a bridge that allows host
accesses to the LPC FW space to be converted to accesses to the=20
BMC's physical address space.

So the picture looks like:

Host CPU
    -> LPC FW
        -> LPC2AHB Bridge
            -> SPI flash mapping
                -> SPI Flash

>  I do not know how it works, does this need to install a LPC driver in=
=20
> host OS and openbmc OS? And does this need software intervention?

The host OS or firmware likely already knows how to drive the LPC bus. T=
he
LPC bus is typically part of the host's boot path, particularly if the B=
IOS is
stored on SPI flash attached to the BMC (though on Intel systems eSPI
supersedes LPC, but the concepts are roughly the same).

>  2. The other is that: How does BMC's CPU read uboot code from SPI=20
> flash when power up? I know that the uboot(act as bootloader) is store=
d=20
> in a SPI flash, and uboot is the first code that is executed by BMC's=20=

> CPU. I do not know whether it is right or wrong but I think BMC's CPU=20=

> can only execute the code stored in DRAM.

This is where you're falling down. In theory the BMC can execute
instructions from anywhere in its physical address space. DRAM is
located somewhere in that physical address space (on the AST2500,
it is located at 0x80000000), however there are other areas of interest
in the physical address space, namely the mapping of the BMC flash
to 0x0. This is the reset vector for the ARM core, so when it is release=
d
from reset it starts executing whatever instructions are present at 0x0.=

The SoC hardware design handles the fact that the instructions at 0x0
are fetched from the BMC's SPI flash so no driver is needed.

Andrew
