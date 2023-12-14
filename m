Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCBE813D2A
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 23:21:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IMWJZBmt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Srmzf6vYGz3cYR
	for <lists+openbmc@lfdr.de>; Fri, 15 Dec 2023 09:21:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=IMWJZBmt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Srmyv3Nn5z3bdG;
	Fri, 15 Dec 2023 09:21:11 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-187-191.adl-adc-lon-bras34.tpg.internode.on.net [118.210.187.191])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D39A420034;
	Fri, 15 Dec 2023 06:21:05 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1702592469;
	bh=BGWPGfhl0ltwnlLE/nuPazf5YbLmd4b70ljGryNav64=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IMWJZBmtSZGz8fkLlX/NAMm/kPBlN1o06WmMS40kxpap8N23ucFlz0CsPwOLaEKK/
	 xMU3VCpaU72AIa+e8JbmcCL2FJOxa+/Y9kQCOsCSY+oFD/AEVCI4dxVGSAkMHhbubn
	 2/hPvLvNg5JNAlqNXTUmx9JomL2xwv9OF5MYmKaL5jYPtPzvVMSZyCKigNeFTf93BA
	 NA/cFW43MWxHVkgeFMmTDEh+vgM0OjDh0NKNvZh271S8Ve2HIwfU5jKZ90eyseTHiZ
	 tJsuMEKHJQpBNQLH3bZZ9KNddteV2ouDQ4GCA81DmsUnKgM3KI9uNVJnPkUp2rtJSW
	 MG+4P0YfwWZsg==
Message-ID: <54cba87a0df233b8762e43b742afe8e44a77a60c.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 2/2] i2c: aspeed: Acknowledge Tx done with and
 without ACK irq late
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Quan Nguyen <quan@os.amperecomputing.com>, Brendan Higgins
 <brendan.higgins@linux.dev>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>,  Joel Stanley <joel@jms.id.au>, Andi Shyti
 <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, Jae Hyun Yoo
 <jae.hyun.yoo@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, 
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 15 Dec 2023 08:51:03 +1030
In-Reply-To: <2eab42cde34723a195e7a0287db08b25f8388a3b.camel@codeconstruct.com.au>
References: <20231211102217.2436294-1-quan@os.amperecomputing.com>
	 <20231211102217.2436294-3-quan@os.amperecomputing.com>
	 <2eab42cde34723a195e7a0287db08b25f8388a3b.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Cosmo Chou <chou.cosmo@gmail.com>, Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> On Mon, 2023-12-11 at 17:22 +0700, Quan Nguyen wrote:
> > Commit 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in
> > interrupt handler") acknowledges most interrupts early before the slave
> > irq handler is executed, except for the "Receive Done Interrupt status"
> > which is acknowledged late in the interrupt.
> > However, it has been observed that the early acknowledgment of "Transmi=
t
> > Done Interrupt Status" (with ACK or NACK) often causes the interrupt to
> > be raised in READ REQUEST state, that shows the
> > "Unexpected ACK on read request." complaint messages.
> >=20
> > Assuming that the "Transmit Done" interrupt should only be acknowledged
> > once it is truly processed, this commit fixes that issue by acknowledgi=
ng
> > interrupts for both ACK and NACK cases late in the interrupt handler.
> >=20
> > Fixes: 2be6b47211e1 ("i2c: aspeed: Acknowledge most interrupts early in=
 interrupt handler")
> > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>=20
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

So I just booted this series on v6.7-rc5 under qemu v8.2.0-rc4 and
found this:

```
$ qemu-system-arm \
	-M ast2600-evb \
	-kernel build.aspeed_g5/arch/arm/boot/zImage \
	-dtb build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb \
	-initrd ~/src/buildroot.org/buildroot/output/images/rootfs.cpio.xz \
	-nographic 2>&1 \
	| ts -s
...
00:00:03 [    1.089187] Freeing initrd memory: 3308K
00:00:05 smbus: error: Unexpected send start condition in state 1
00:00:05 smbus: error: Unexpected write in state -1
00:00:06 [    3.685731] aspeed-i2c-bus 1e78a400.i2c-bus: i2c bus 7 register=
ed, irq 48
00:00:06 [    3.688918] aspeed-i2c-bus 1e78a480.i2c-bus: i2c bus 8 register=
ed, irq 49
00:00:06 [    3.692326] aspeed-i2c-bus 1e78a500.i2c-bus: i2c bus 9 register=
ed, irq 50
00:00:06 [    3.693757] aspeed-i2c-bus 1e78a680.i2c-bus: i2c bus 12 registe=
red, irq 51
00:00:06 [    3.695070] aspeed-i2c-bus 1e78a700.i2c-bus: i2c bus 13 registe=
red, irq 52
00:00:06 [    3.696184] aspeed-i2c-bus 1e78a780.i2c-bus: i2c bus 14 registe=
red, irq 53
00:00:06 [    3.697144] aspeed-i2c-bus 1e78a800.i2c-bus: i2c bus 15 registe=
red, irq 54
00:00:06 [    3.699061] aspeed-video 1e700000.video: irq 55
00:00:06 [    3.699254] aspeed-video 1e700000.video: assigned reserved memo=
ry node video
00:00:06 [    3.702755] aspeed-video 1e700000.video: alloc mem size(24576) =
at 0xbc000000 for jpeg header
00:00:06 [    3.706139] Driver for 1-wire Dallas network protocol.
00:00:07 smbus: error: Unexpected send start condition in state -1
00:00:07 smbus: error: Unexpected write in state -1
00:00:10 smbus: error: Unexpected send start condition in state -1
00:00:10 smbus: error: Unexpected write in state -1
00:00:12 smbus: error: Unexpected send start condition in state -1
00:00:12 smbus: error: Unexpected write in state -1
00:00:14 smbus: error: Unexpected send start condition in state -1
00:00:14 smbus: error: Unexpected write in state -1
00:00:17 smbus: error: Unexpected send start condition in state -1
00:00:17 smbus: error: Unexpected write in state -1
00:00:18 [   14.080141] adt7475 7-002e: Error configuring attenuator bypass
00:00:19 smbus: error: Unexpected send start condition in state -1
00:00:19 smbus: error: Unexpected write in state -1
00:00:21 smbus: error: Unexpected send start condition in state -1
00:00:21 smbus: error: Unexpected write in state -1
00:00:24 smbus: error: Unexpected send start condition in state -1
00:00:24 smbus: error: Unexpected write in state -1
```

The smbus errors do not occur if I revert this patch.

Can you look into qemu to see if it's a bug in the aspeed i2c
controller model's state machine?

Cheers,

Andrew
