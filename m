Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A096817DD2
	for <lists+openbmc@lfdr.de>; Tue, 19 Dec 2023 00:03:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WPpwQ9xu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SvFk008zkz3c5j
	for <lists+openbmc@lfdr.de>; Tue, 19 Dec 2023 10:03:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WPpwQ9xu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SvFjD6M2Qz2xQC;
	Tue, 19 Dec 2023 10:02:56 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-80-147.adl-adc-lon-bras32.tpg.internode.on.net [118.210.80.147])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0D8F72014F;
	Tue, 19 Dec 2023 07:02:47 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1702940572;
	bh=YJxqecOL6R6o6l2AGHwi7QgNX0u29B+GDnVZRFgkI+k=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WPpwQ9xuCxjzJXTUKiuwMsoVkjUOhqrT6gnnb+LZcvdi72ZyLxsdejy13T3hs6sJn
	 jec0d5Yk7/2oi6H9++Tf2QiyR2h/vHmi1wIH91bYIFfcc9CVWxGyIlJswVcVgmvrdG
	 aQHnrOaw1d9VThcRuYhLTvTqr1q2qch4DLthL4XtR1PqjhgVw5TWULqAKdTkUc14mg
	 vJjWfXN1VFaLe6mLftYRcg2sz8Kpue0Z4pU6DtLCkYRXKq9Yc8hBsQaWwQXfZzUlae
	 Zz9md12KBZIi1UpqHb7lMHQA9Zl/6UKbC2FOyGuxuWTZjkk1LkZ/Nyx9j70mgR/Bgk
	 htzkxxHW79TMQ==
Message-ID: <477f1e8fbed91cc1160086af1f20030e7a6d853b.camel@codeconstruct.com.au>
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
Date: Tue, 19 Dec 2023 09:32:45 +1030
In-Reply-To: <7dfc99e5-4c76-413b-aabc-81b26e26249e@os.amperecomputing.com>
References: <20231211102217.2436294-1-quan@os.amperecomputing.com>
	 <20231211102217.2436294-3-quan@os.amperecomputing.com>
	 <2eab42cde34723a195e7a0287db08b25f8388a3b.camel@codeconstruct.com.au>
	 <54cba87a0df233b8762e43b742afe8e44a77a60c.camel@codeconstruct.com.au>
	 <7dfc99e5-4c76-413b-aabc-81b26e26249e@os.amperecomputing.com>
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

On Mon, 2023-12-18 at 15:45 +0700, Quan Nguyen wrote:
>=20
> On 15/12/2023 05:21, Andrew Jeffery wrote:
> >=20
> > ```
> > $ qemu-system-arm \
> > 	-M ast2600-evb \
> > 	-kernel build.aspeed_g5/arch/arm/boot/zImage \
> > 	-dtb build.aspeed_g5/arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb \
> > 	-initrd ~/src/buildroot.org/buildroot/output/images/rootfs.cpio.xz \
> > 	-nographic 2>&1 \
> > 	| ts -s
> > ...
> > 00:00:03 [    1.089187] Freeing initrd memory: 3308K
> > 00:00:05 smbus: error: Unexpected send start condition in state 1
> > 00:00:05 smbus: error: Unexpected write in state -1
> > 00:00:06 [    3.685731] aspeed-i2c-bus 1e78a400.i2c-bus: i2c bus 7 regi=
stered, irq 48
> > 00:00:06 [    3.688918] aspeed-i2c-bus 1e78a480.i2c-bus: i2c bus 8 regi=
stered, irq 49
> > 00:00:06 [    3.692326] aspeed-i2c-bus 1e78a500.i2c-bus: i2c bus 9 regi=
stered, irq 50
> > 00:00:06 [    3.693757] aspeed-i2c-bus 1e78a680.i2c-bus: i2c bus 12 reg=
istered, irq 51
> > 00:00:06 [    3.695070] aspeed-i2c-bus 1e78a700.i2c-bus: i2c bus 13 reg=
istered, irq 52
> > 00:00:06 [    3.696184] aspeed-i2c-bus 1e78a780.i2c-bus: i2c bus 14 reg=
istered, irq 53
> > 00:00:06 [    3.697144] aspeed-i2c-bus 1e78a800.i2c-bus: i2c bus 15 reg=
istered, irq 54
> > 00:00:06 [    3.699061] aspeed-video 1e700000.video: irq 55
> > 00:00:06 [    3.699254] aspeed-video 1e700000.video: assigned reserved =
memory node video
> > 00:00:06 [    3.702755] aspeed-video 1e700000.video: alloc mem size(245=
76) at 0xbc000000 for jpeg header
> > 00:00:06 [    3.706139] Driver for 1-wire Dallas network protocol.
> > 00:00:07 smbus: error: Unexpected send start condition in state -1
> > 00:00:07 smbus: error: Unexpected write in state -1
> > 00:00:10 smbus: error: Unexpected send start condition in state -1
> > 00:00:10 smbus: error: Unexpected write in state -1
> > 00:00:12 smbus: error: Unexpected send start condition in state -1
> > 00:00:12 smbus: error: Unexpected write in state -1
> > 00:00:14 smbus: error: Unexpected send start condition in state -1
> > 00:00:14 smbus: error: Unexpected write in state -1
> > 00:00:17 smbus: error: Unexpected send start condition in state -1
> > 00:00:17 smbus: error: Unexpected write in state -1
> > 00:00:18 [   14.080141] adt7475 7-002e: Error configuring attenuator by=
pass
> > 00:00:19 smbus: error: Unexpected send start condition in state -1
> > 00:00:19 smbus: error: Unexpected write in state -1
> > 00:00:21 smbus: error: Unexpected send start condition in state -1
> > 00:00:21 smbus: error: Unexpected write in state -1
> > 00:00:24 smbus: error: Unexpected send start condition in state -1
> > 00:00:24 smbus: error: Unexpected write in state -1
> > ```
> >=20
> > The smbus errors do not occur if I revert this patch.
> >=20
> > Can you look into qemu to see if it's a bug in the aspeed i2c
> > controller model's state machine?
> >=20
>=20
> Thanks, Andrew, for testing these patches on qemu.
>=20
> I'll try to look into it to see if anything can be improved, but I have=
=20
> to admit that I'm not so familiar with it. This is my first time trying=
=20
> it on qemu. Just did these tests on real HW with waveform captured=20
> sometimes.
>=20
> So far I could be able to reproduce the issue and start playing around=
=20
> trying to understand the model.
>=20

So `$ git grep -lF 'Unexpected write in state'` leads us to
hw/i2c/smbus_slave.c:193. From the switch statement there and the log
output above dev->mode must be SMBUS_CONFUSED:


https://gitlab.com/qemu-project/qemu/-/blob/039afc5ef7367fbc8fb475580c291c2=
655e856cb/hw/i2c/smbus_slave.c#L35-L41

The prior log message was:

```
00:00:05 smbus: error: Unexpected send start condition in state 1
```

So we entered SMBUS_CONFUSED from SMBUS_WRITE_DATA. Given the log
output above it suggests the master model is failing to send an
I2C_FINISH prior to I2C_START_SEND, as that log message is emitted from
`dev->mode !=3D SMBUS_IDLE` when the slave sees an `I2C_START_SEND`.

Perhaps the M_STOP_CMD handling needs to go above the M_START_CMD
handling in aspeed_i2c_bus_handle_cmd()?

https://gitlab.com/qemu-project/qemu/-/blob/039afc5ef7367fbc8fb475580c291c2=
655e856cb/hw/i2c/aspeed_i2c.c#L450

Andrew
