Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1701D8D5793
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2024 03:06:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GR0gygPG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr4hV2PrBz3fxw
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2024 11:06:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=GR0gygPG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vr4gt1WlMz3cP7
	for <openbmc@lists.ozlabs.org>; Fri, 31 May 2024 11:06:17 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B833A20135;
	Fri, 31 May 2024 09:06:13 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717117574;
	bh=6HhdH127CQhVxHeV1szXvKzY8Dx6ql+RgzbtdcHcXbk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GR0gygPGQcGI0ivbPdSDNlvYJzQzGxwlFcr01WDAaCv5Th4NasCXVw6olH1kq4slF
	 MMUk7KnuP38OLqAuv3iGlFRO48w+Mja2QULCSa5Yyg8m1IRr2CEAIjA0e8wNobIV4c
	 y6M/74Zbh1IUAGEGWL+n26++rHOkUDINAWfy4ImZ4HhSAy3HRRzF2A3sVGRB6R43Yz
	 5I3HOXiMP7NH5DnBvGpA3JqxKxLcyRUkVuzrUGvy9ep4NhKcHKDBreG7YSIwzLLIzm
	 pyzRajeaQoKu7gsXEPlQBiljU1+15AwXZ/HOmatsgc5c9recG++MQwljSjmf5owZQh
	 uXJ/eNRDTqjFw==
Message-ID: <87a1a14bd2076a7528be827ca9c69cb869c38295.camel@codeconstruct.com.au>
Subject: Re: OpenBMC replacing AMI AST2500 BMC fw on Gigabyte MC12-LE0 -
 questions
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Johannes Truschnigg <johannes@truschnigg.info>, openbmc@lists.ozlabs.org
Date: Fri, 31 May 2024 10:36:09 +0930
In-Reply-To: <ZlidQI_ugTo4Gx_U@vault.lan>
References: <ZkuJNJ9kFrRS3mQF@vault.lan>
	 <5e89654a02e2f870b71700c8cd75c2ef371fb579.camel@codeconstruct.com.au>
	 <ZkzUX9JPPGAtNa2d@vault.lan>
	 <640ed3fcae859ef35f3c57fad6c2f39400d6ef0a.camel@codeconstruct.com.au>
	 <ZlTMYkCZhXmRb1av@vault.lan>
	 <4b5f7c656fba2bbee92f41922f82903168441aad.camel@codeconstruct.com.au>
	 <ZlYkVBwV2Voscqme@vault.lan>
	 <9406926919364e4d99c7b207996d455c8e404858.camel@codeconstruct.com.au>
	 <ZlidQI_ugTo4Gx_U@vault.lan>
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
Cc: Zev Weiss <zweiss@equinix.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2024-05-30 at 17:37 +0200, Johannes Truschnigg wrote:
> Hi list!
>=20
> First things first, I wanted to share the good news that I can now boot t=
he
> host with OpenBMC running the show on the BMC: Fiddling with GPIO #539 on=
 the
> OpenBMC root shell in the right way makes the host power up a few seconds
> later. I do it like this for now:
>=20
> ```
> echo 539 > /sys/class/gpio/export
> echo out > /sys/class/gpio/gpio539/direction
> echo 0 > /sys/class/gpio/gpio539/value
> sleep 1
> echo 1 > /sys/class/gpio/gpio539/value
> ```
>=20
> I'd like to say thanks to my friend Paul on IRC here in public, because
> without your patient guidance and steady flow of information and ideas, t=
his
> 100% wouldn't have been possible!! :)

Nice work. For the record, the GPIO sysfs interface is deprecated and
likely to go away soon. Useful for PoCs, but longer term you should
look to the libgpiod APIs and tools[1].

[1]: https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/about/

>=20
>=20
> For posterity and completeness, this is what culvert has to say about the
> BMC's state now that it runs OpenBMC:
>=20
> ```
> root@grml ~ # /tmp/culvert -v -v probe
> [*] Found 5 registered bridge drivers
> [*] Trying bridge driver l2a
> [*] Failed to initialise L2A bridge: -95
> [*] Trying bridge driver ilpc
> [*] Probing ilpc
> [*] Probing 0x2e for SuperIO
> [*] Unlocking SuperIO: 0
> [*] Selecting SuperIO device 2 (SUART1): 0
> [*] Found device 255 selected: 0
> [*] Locking SuperIO
> [*] Probing 0x4e for SuperIO
> [*] Unlocking SuperIO: 0
> [*] Selecting SuperIO device 2 (SUART1): 0
> [*] Found device 255 selected: 0
> [*] Locking SuperIO
> [*] SuperIO disabled
> [*] Trying bridge driver devmem
> [*] failed to initialise devmem bridge: -1
> [*] Trying bridge driver debug-uart
> [*] Unrecognised argument list for debug interface (0)
> [*] Trying bridge driver p2a
> [*] Probing p2a
> [*] Probing for SoC revision registers
> [*] ahb_readl: 0x1e6e2004: 0xffffffff
> [*] ahb_readl: 0x1e6e207c: 0xffffffff
> [*] Found revision 0xffffffff
> [*] Revision 0xffffffff is unsupported
> [*] Failed P2A probe: -19
> [*] Accessing the BMC's AHB via the ilpc bridge
> [*] Probing for SoC revision registers
> [*] ahb_readl: 0x1e6e2004: 0xffffffff
> [*] ahb_readl: 0x1e6e207c: 0xffffffff
> [*] Found revision 0xffffffff
> [*] Revision 0xffffffff is unsupported
> [*] Failed to probe SoC revision: -19
> [*] Failed to probe SoC, exiting: -19
>=20
> ```
>=20
> I haven't tried to execute gigaflash on the booted host yet, but it is on=
 my
> list of things to try next.

What you can see from the output above is that OpenBMC has disabled all
the hardware backdoors that culvert tries to exploit.

The consequence of this is that gigaflash will (... should?) now also
fail to function.

You may want to play with these u-boot options:

https://github.com/openbmc/u-boot/blob/v2019.04-aspeed-openbmc/arch/arm/mac=
h-aspeed/Kconfig#L48-L85

Or we can add support to culvert for enabling and disabling the
backdoors at runtime, and run it with /dev/mem enabled on the BMC (set
mem.devmem=3D1 on the kernel commandline). Adding support to culvert
should just be a matter of wiring up some command-line UI - what bits
to flip and the necessary abstractions are already provided in the
implementation.
>=20
>=20
> > > [...]
> > > I do have strace capture of `gigaflash` running for the first time af=
ter a
> > > reboot, but all the juicy bits seem to hide behind mmap() anyway, so =
I will
> > > only provide it upon request.
> >=20
> > Well, consider this a request :D What it's mapping is of interest to
> > me, along with what it's opening more broadly, and any calls to
> > ioperm() or iopl().
>=20
> I've uploaded the zstd-compressed trace result (it contains a lot of the
> actual ROM content dumped with how I called strace/gigaflash) to [0]. I r=
eally
> hope it helps chasing down what you're looking for! :)

Given some of the discussion on the culvert issue, it may not, but I'll
take a look. And indeed they're using the P2A, so we'll need to
consider another approach to tracing the accesses.

>=20
>=20
> > > Once I have established a surefire and straightfoward way to do what =
I have
> > > done in such meandering and clumsy attempts, I would like to learn mo=
re about
> > > how the "M" is actually put into this whole "BMC" thing, and see how =
far I can
> > > take that. The stock fw has some interesting description files regard=
ing i2c
> > > configs that might come in handy, but I am just not educated enough (=
yet, I
> > > hope) to make real sense of it :)
> >=20
> > Yeah, the I2C configs will certainly help.
> >=20
> > Breaking into the stock firmware on the hardware and tracing things
> > like GPIO accesses would go a long way. With the tools at hand it
> > shouldn't be too difficult :)
>=20
> Yeah that would be cool, but I had established with Paul that the stock f=
w
> kernel doesn't come with debugfs and missing userspace tooling for tracin=
g
> syscalls, so it will certainly be a challenge (at least for me, equipped =
with
> my current skillset, and the time constraints of having a day job with so=
me
> other meatspace activity on top of that :D).

If you can coax it past u-boot under qemu you can trace the hardware
accesses via the qemu models (without requiring support from the OS).


> Meanwhile, due to a friendly user on a German web forum who led me to sim=
ilar
> matters discussed about an ASRock Rack-series motherboard (which also com=
es
> with AST2500 for its BMC purposes), I think I have properly identified th=
e
> relevant IC where the BMC's firmware actually resides, and it looks like
> SOIC-8 in direct vicinity to the AST2500 itself. I will have some new gea=
r for
> my electronics drawer delivered soon to see how/if I can deal with it! :)

For the record, Zev (who also helps out with culvert) is the OpenBMC
maintainer for the ASRock Rack platforms, so should be able to assist
you there as well.

Andrew
