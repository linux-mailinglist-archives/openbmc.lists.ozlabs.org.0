Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DA43E22FC
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 07:43:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgvXX6nSLz3cXQ
	for <lists+openbmc@lfdr.de>; Fri,  6 Aug 2021 15:43:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=C6xnuEj2;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=YDB8ZZqy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=C6xnuEj2; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=YDB8ZZqy; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgvXB6Nqsz30Hb
 for <openbmc@lists.ozlabs.org>; Fri,  6 Aug 2021 15:43:06 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id A083E320090C;
 Fri,  6 Aug 2021 01:43:01 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Fri, 06 Aug 2021 01:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=6DofN
 E8dbDH5X7+IWH/JbzMkz0oXr6KiLLPsfwuJeCA=; b=C6xnuEj2jmLidMj5NbBQY
 2KDh2Rp37vuEVcjLdpRLcCJLQu4kpZ31qPyThL7A87FGVedUruJlH50Ct03IoYF6
 e3sQeKWXZOZFm/CpcxClM9wsvd8wM804tLX7ztCZztwp3eeN+k5wkaYi96Q3drfS
 xGPHN8S5eCnUddMzKeZCrL1CPGPnrY+nnNmeNqMF5pA2rpj7HsoYSl7X/2DDjF4E
 kVu3NRLxPvW3QbB+c27hDiaJS1Tw8qUg+KuTjulyFuSsDmRcFy8dbUiWiJmw+UEH
 DhEgZLEgmbSEmXcMDngKBhLlCtacnZuVVy0b/AoOZnhBMHMM6f6PPvaRA4Tmp7UG
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=6DofNE8dbDH5X7+IWH/JbzMkz0oXr6KiLLPsfwuJe
 CA=; b=YDB8ZZqyPHxfI9QtDlPQjLgCh+xaDlM9Y5nSYrGCgJi6IgAJEeGQnN5ln
 hSFA+VLjbCpfoQz1kHcUpu8EFj30mpDGtQhWZFfMZlxoUQHS0ZAdCzzwaA2EcJCV
 jhTzmh5PpQ0pn8Dd8lY4a8x/MtJPgPMpYJtCLRUNDw4qMHGxjFFc2jsdhBI+s+nn
 Z6MJuCx+aeCMYD2NnQIbF1WMcMNqHvEkZ6iYXTZt/MlsW7uSl4GRNQwELSsofYmv
 SDRWWNjKtwCBh9+dTS2mAR4Sunh8fgOMTyceO2/KPDpXTRDKdUIuv/46lmF/CGH3
 8odoOWlOe7JaEg24nn+ThR5qlvabw==
X-ME-Sender: <xms:48sMYQJ-svLS6PcDX6D8RfbSljA7WsAnYu_4KzRLubGbTHdGllS8LQ>
 <xme:48sMYQKPA-H4NtUENeDJvmMVu2xdDPTnp875033lSfasgDY487RT8wrygEYuo1yIB
 _Ycf3bKHYnGNf9aGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrjedtgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddujedmnecujfgurhepofgfggfkjghffffhvffutgfgsehtqhertder
 reejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrg
 hjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeethffhfedttdeiffeigeeltdevvefh
 ueelveeuleevjedtlefgvdelheeluefgueenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiidpghhithhhuhgsrdgtohhmpdhkvghrnhgvlhdrohhrghdpmhgt
 thhpqdhkvghrnhgvlhdrmhgunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:48sMYQsIOIqZuRp7INV0j8cp4RBzTEcss0p8lizVQGJVkmgY_7zg3g>
 <xmx:48sMYda6HGqNOm8oNNcKDsDxy40ve4YvsEAnQfiQi5iEiOoy3VESDQ>
 <xmx:48sMYXaVowsgvG69L2OHv5RX-l2MbJJG2f6hqV6IBmm8mDwU94jCVQ>
 <xmx:5csMYb7dVqgdpNxU1fmv4EMCzzDzTbkmMhx-i67cFekr8Fu_CiDVAg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C604FAC0DD0; Fri,  6 Aug 2021 01:42:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-552-g2afffd2709-fm-20210805.001-g2afffd27
Mime-Version: 1.0
Message-Id: <863f7fca-7088-450e-a855-92261ba56b9d@www.fastmail.com>
In-Reply-To: <6fa87e93-863e-94a6-651f-8d6126557553@linux.alibaba.com>
References: <6fa87e93-863e-94a6-651f-8d6126557553@linux.alibaba.com>
Date: Fri, 06 Aug 2021 15:12:39 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Heyi Guo" <guoheyi@linux.alibaba.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Question about NVMe MCTP in dbus-sensors
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, Ed Tanous <ed@tanous.net>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Heyi!

On Fri, 6 Aug 2021, at 14:47, Heyi Guo wrote:
> Hi,
>=20
> We can see that NVMe sensors in dbus-sensors relies on MCTP to get=20
> hardware information. It is using libmctp interfaces to initialize MCT=
P=20
> and SMBus.=20

To be clear, it's using a fork of libmctp that implements an SMBus=20
binding via a fork of the kernel that exposes a I2C API that isn't=20
upstream.

For the SMBus binding to be merged in upstream libmctp I'd like to see=20=

the necessary kernel interfaces merged into the upstream kernel tree,=20=

but I don't expect that's going to happen any time soon. More on why=20
below.

As an aside you may be interested in this patch which allows nvmesensor=20=

to use the basic management command to fetch temperature data:

https://gerrit.openbmc-project.xyz/c/openbmc/dbus-sensors/+/43665

> However I don't find the code or component who is responsible=20
> as a bus owner, to discover endpoints, manager EID and update routing=20=

> table. Isn't necessary for a central component to do such things?

It's not strictly necessary in that it's valid for systems to be=20
completely defined in terms of static endpoints. Doing so isn't covered=20=

by the MCTP spec, and it's also pretty limiting, but it is enough in=20
some circumstances.

> Will=20
> there be access conflict if non-NVMe devices (MCTP capable) are also=20=

> connected to the same SMBus=EF=BC=9F

No.

>=20
> We also found another implementation from Intel:=20
> https://github.com/Intel-BMC/pmci. It implements mctpd to provide MCTP=
=20
> message transfer interfaces on D-Bus, while PLDM, NVME-MI and others c=
an=20
> rely on the D-Bus interfaces instead of libmctp.

This is a direction Intel chose to go however it's not the direction=20
that upstream OpenBMC will be using. The use of a pure userspace=20
solution such as libmctp went far enough to expose the need for a=20
kernel-based solution. We will shortly have that, thanks to the efforts=20=

of Jeremy and Matt at Code Construct:

https://lore.kernel.org/netdev/20210729022053.134453-1-jk@codeconstruct.=
com.au/

This series is now in net-next, and Matt and Jeremy have also been=20
developing the in-kernel hardware binding support and necessary=20
userspace components[1].

[1] https://github.com/CodeConstruct/mctp

You can read more about the application of the socket syscalls here:

https://lore.kernel.org/netdev/20210729022053.134453-16-jk@codeconstruct=
.com.au/

and here:

https://github.com/openbmc/docs/blob/master/designs/mctp/mctp-kernel.md

Once we have AF_MCTP in the OpenBMC kernel tree with some binding=20
implementations we'll be switching the userspace applications over to=20=

use it.

Hope that helps!

Andrew
