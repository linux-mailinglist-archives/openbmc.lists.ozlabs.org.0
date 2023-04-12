Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E52C6DE90A
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 03:39:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Px5400HJlz3cNj
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 11:39:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XC3oz/Dr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=XC3oz/Dr;
	dkim-atps=neutral
X-Greylist: delayed 485 seconds by postgrey-1.36 at boromir; Wed, 12 Apr 2023 11:39:13 AEST
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Px53P6wqCz3bhY
	for <openbmc@lists.ozlabs.org>; Wed, 12 Apr 2023 11:39:13 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9CDD320033;
	Wed, 12 Apr 2023 09:31:04 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1681263065;
	bh=1PJyWsCHIkHWkyH/8d3OFsIPhmsetvKKYrwLMicwqkE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XC3oz/Dr0Lx0t472X/T+bkV3Jj3nb++04qj8QtMAYgYhEiRfpX2Ed35KxI8h7DASY
	 mGIokEO8Fbfd47btqyBOM7Ew0GNbVYvnyxpzn2vgjbffWcZHkPg0fFlMxeMHicVSWn
	 VbQLquoxtkKLpQMbJxwA5yh3TfqdqHGhR+A7EAUv1tw1wt8/84GYIMk4wQHqEoiMNP
	 VNyfR6XjmnhlCK4Dyl0qRlqSjUB4X/FhPitxd6JSsM1VkYoFaecmCJyz/IbylJMYNI
	 UUDU3HQqC0bwsICn0DhQMeJbTm3BD3fckv/5IiHgYTaBshjQJQ+QInaskOSMVdoK2z
	 hoLqxDhYyYhPA==
Message-ID: <89dcad45a290fd9ac964b89c014a8fdd6ab11411.camel@codeconstruct.com.au>
Subject: Re: OpenBMC - Support NVMe drive health monitoring
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Hao Jiang <jianghao@google.com>, Lior Weintraub <liorw@pliops.com>
Date: Wed, 12 Apr 2023 09:31:04 +0800
In-Reply-To: <CAB38=p2VtC14fADDXGjDqGEy5b79tndPP5T-xN2_aeYfVmfg=Q@mail.gmail.com>
References: 	<PR3P195MB055546905D984A24BEB9D474C3969@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
	 <c9adff03-16f4-40d4-8334-6cdbbdea2407@betaapp.fastmail.com>
	 <PR3P195MB0555D8C52C5F2EBE2FA1E299C3969@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
	 <CAB38=p21yk1O8eQvq9Rtq4TuKpoJeU7Zy189KJRmGCcQ0NqyQw@mail.gmail.com>
	 <PR3P195MB05553184971B4F0E15989893C3979@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
	 <CAB38=p0anKYhBGTDxjSOQGDm60XNu+nv399-QoVCsKMxeoOznA@mail.gmail.com>
	 <PR3P195MB05551C7B1C589C972BE03873C39A9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
	 <CAB38=p2VtC14fADDXGjDqGEy5b79tndPP5T-xN2_aeYfVmfg=Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
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
Cc: Andrew Jeffery <andrew@aj.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, "rashmica@linux.ibm.com" <rashmica@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Lior,

> > If so, can you please guide me how to do that?
>=20
> The prerequisite for nvme OOB is the mctp layer, including:
> 1. mctp linux kernel - starting from 5.15
> 2. libmctp
> 3. mctpd
> + Jeremy as the author of MCTP.

Thanks Hao!

Lior: the general method involves getting the MCTP network established
so that we can route messages to the NVMe drive, and then using libnvme
+ nvme-cli to perform NVMe messaging over that MCTP channel.

I've put together a bit of an introduction here:

https://codeconstruct.com.au/docs/nvme-mi-firmware-update/

- the context for that document is NVMe firmware updates, but you can
perform any other (supported) nvme-cli commands too.

> > Can this tool be tested on QEMU or RaspberryPi (running OpenBMC
> > image)?
> I am not sure if you want to emulate a nvme mctp device in QEMU.
> RaspberryPi is doable but you need to rework the raiser for I2C from
> PCIe.

There were some discussions about adding a NVMe-MI (over i2c) interface
to qemu; Klaus' patch set is here:

https://lore.kernel.org/qemu-devel/20221116084312.35808-1-its@irrelevant.dk=
/

For Raspberry Pi: the MCTP-over-i2c transport requires an i2c
controller that supports both controller and device modes; I think the
rpi hardware only supports controller mode.

And, as Hao mentions, you'll then need some way to route those i2c
signals to your actual device.

>=20
> > Is there a tool that runs auto discovery and will give a map of the
> > devices it finds? (kind of like nvme list)?
> That is mctpd. https://github.com/CodeConstruct/mctp

Yep, mctpd can enumerate local MCTP networks, and exports the
enumeration results over dbus. The libnvme MCTP implementation can then
use that enumeration data for the object iteration functions to query
the available subsystems.

However: the enumeration needs to be triggered by something; when a
device becomes available we need to tell mctpd to start enumeration at
a particular physical address.

On OpenBMC, Entity Manager provides that initial trigger (based on=20
discovered FRU data). If that doesn't suit, it would also be possible
to use other events - like presence signals, or bus-specific discovery
(eg., SMBus ARP) for that too.

If he hasn't mentioned already: Hao has put together the higher-level
infrastructure to export the discovered NVMe subsystems over standard
OpenBMC dbus and Redfish, which allows an OpenBMC-integrated
interaction with NVMe devices, sensors, etc.

Cheers,


Jeremy


