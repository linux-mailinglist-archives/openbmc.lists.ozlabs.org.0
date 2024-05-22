Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 6FABC8CB87F
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2024 03:36:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=D7VxyXfa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkYdj0mTGz3gJW
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2024 11:30:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=D7VxyXfa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkYd36RsTz3g0q
	for <openbmc@lists.ozlabs.org>; Wed, 22 May 2024 11:29:43 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 032E120178;
	Wed, 22 May 2024 09:29:40 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1716341381;
	bh=7hjpcaRayI8LREHHVVG8s2ad3CxPHk+UZC8Dee7q3N0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=D7VxyXfa7pTvJgguYQVFhsqE6/jNkAmw98jsCWTvaGisoo4uG911lN21SkL7LV2xy
	 3RWkUAkh32j1cy51HoGd8zyCq3klWHNQms05P2sair2OjFOohXSHbw9KI4prRaHel+
	 totHeOj2jiBPb0YJcu0/SuWmXl0Fy7VWljQArv4JwZ5/4vaJgYlENJhanx7/Tv2KuS
	 iuGUFUQorNmujDSvp7kTzy4um8Q1LEtzrTAZN+LnjsYdWnEJm7x0XGnmaBo3+gFqzF
	 7+D4CwmQHZFeTvLD+NpCEeusISXuA0Y7F0hZJlFEw4RENy83kx3np5py8xTghTfXCe
	 aMv3q0jspnEZg==
Message-ID: <640ed3fcae859ef35f3c57fad6c2f39400d6ef0a.camel@codeconstruct.com.au>
Subject: Re: OpenBMC replacing AMI AST2500 BMC fw on Gigabyte MC12-LE0 -
 questions
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Johannes Truschnigg <johannes@truschnigg.info>
Date: Wed, 22 May 2024 10:59:32 +0930
In-Reply-To: <ZkzUX9JPPGAtNa2d@vault.lan>
References: <ZkuJNJ9kFrRS3mQF@vault.lan>
	 <5e89654a02e2f870b71700c8cd75c2ef371fb579.camel@codeconstruct.com.au>
	 <ZkzUX9JPPGAtNa2d@vault.lan>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-05-21 at 19:05 +0200, Johannes Truschnigg wrote:
> Hi Andrew,
>=20
> thanks so much for your kind response! I've come across your project (cul=
vert)
> on my little quest to liberate my board's BMC already, and I'm eager to t=
ry
> working with it as soon as I manage to build it (which will leventually
> happen)!
>=20
> But first, I need to share the good news: Yesterday, shortly after I had =
sent
> my initial post to this list, my friend Paul on IRC supplied me with idea=
s and
> instructions to get the OpenBMC stuff to fly on the Gigabyte-supplied AST=
2500,
> and we had smashing success after a rather short while! We patched OpenBM=
C's
> u-boot to assume a CONFIG_SYS_TEXT_BASE of 0x83000000, tftp'd the resulti=
ng
> binary to that address, issued
>=20
> `go 0x83000000`
>=20
> in the AMI u-boot monitor, and... had successfully chainloaded the OpenBM=
C
> u-boot on the Gigabyte BMC!

Nice!

>=20
> From there, I could load the OpenBMC FIT and went to a initrd rescue shel=
l
> rather quickly. The sequence of commands was, for posterity (assuming a T=
FTP
> server on 192.168.2.123 can supply the mentioned artifacts after successf=
ul
> DHCPv4 autoconfig):
>=20
> ```
> ### original/stock AMI uboot monitor:
> AST2500EVB> dhcp
> AST2500EVB> tftp 0x83000000 192.168.2.123:hacked-uboot
> AST2500EVB> go 0x83000000
>=20
> ### chainloaded OpenBMC u-boot:
> ast# setenv ethact ethernet@1e680000
> ast# dhcp
> ast# tftpboot 0x84000000 192.168.2.123:openbmc-fit-image
> ast# setenv bootargs console=3DttyS4,115200n8 root=3D/dev/ram rw enable-i=
nitrd-debug-sh debug-init-sh
> ast# bootm 0x84000000
> ```
>=20
> I have provided a copy of the `hacked-uboot` file contents at [0]. Its
> sha256sum hexdigest reads
>   2937963c78f577355dc3bd15b8b8e57dcacf72fd74cd82854d1136bb26356e68
>=20
> From there, I could reconfigure the BMC's Ethernet interface for my LAN,
> shuttle in the OpenBMC squashfs-xz image via tftp onto tmpfs, loop-mount =
that,
> and chroot into the resulting directory tree - the userland seems to work=
,
> too! :)
>=20
>=20
> What I am struggling with (as other plans leave me little time today
> unfortunately) is how to boot into this environment after manually massag=
ing
> the rescue environment into the half-working state. If you have any advic=
e on
> how to streamline my boot process, I'd be eager to read about it!


Perhaps using `setenv` to write a u-boot script with the commands above
(executed via the `run` command`) along with `saveenv` might get you
some way to automation?

Anyway, nice work.

>=20
>=20
> On Tue, May 21, 2024 at 10:35:34AM +0930, Andrew Jeffery wrote:
> > [...]
> > > The BMC implementation seems lean very much onto the AST2500 Evaluati=
on Board
> > > (the unchanged name pops up in a number of places in the stock firmwa=
re), so I
> > > would guess that the OpenBMC evb-ast2500 machine should be able to ge=
t
> > > somewhere (and even if it's just to see OpenBMC's instead of AMI's Li=
nux start,
> > > and then crash hard due to some subtle incompatibility :)) at least.
> >=20
> > Perhaps. While the SoC itself is obviously supported, how it's
> > integrated into the rest of the platform will likely be very different
> > to how things are wired up on the EVB.
>=20
> I think I've already discovered some of the rough edges that are still co=
ming
> for me and this attempt at liberating the Gigabyte BMC, as the host does =
not
> seem to want to power on without the (stock) BMC running. That, and all t=
he
> other obstacles that are sure to come, I will try to tackle in time :)

:)

>=20
> > > If so, I would presume option 2.) to be the easier road to travel, bu=
t I am
> > > somewhat stumped as to how I can get OpenBMC's u-boot onto the BMC, *=
ideally*
> > > (but not necessarily) in a non-destructive way (as I do not know how =
to or have
> > > a way to revert to the original state without access to the bootloade=
r or even
> > > stock firmware running).
> >=20
> > Something to consider is using qemu to boot the proprietary firmware,
> [...]
> > ast_eth0, ast_eth1
> > DRAM ECC enabled
> > Hit any key to stop autoboot:  0=20
> > Image to be booted is 1
> > EMMC and EXT4 is not enabled - Cannot locate kernel file in Root
> > Initing KCS...done
> > Uboot waiting for firmware update to start...
> > Uboot waiting for fwupdate to start timed out
> > Disabling Watchdog 2 Timer
> > AST2500EVB>
> > ```
>=20
> Thanks for this; while I've had success in booting the evb-2500ast artifa=
cts
> in QEMU (as documented by OpenBMC and QEMU), I had not successfully tried=
 with
> the AMI-supplied artifacts yet. This saved me a ton of time trying to fig=
ure
> that out!
>=20
> However, what I do not really understand about the situation in the emula=
tor
> is that `fmh` will not list any FMH-style blocks/partitions/area in that =
case,
> whilst it will on the physical BMC. As a consequence, I cannot actually b=
oot
> the stock firmware in QEMU passt the u-boot stage, as that relies on `boo=
tfmh`
> and the FMH areas to be properly recognized.
>=20
> Maybe the munging of the image size with `truncate` changes something tha=
t the
> FMH format can't cope with?=C2=A0
>=20

I doubt it; the `truncate` command I used actually extends the image
out to the full 64M. The image supplied by Gigabyte is a few bytes
short, and qemu barfs if the flash image size does not exactly match
the size of the emulated SPI-NOR part.

But yeah, I'm also unsure about the FMH stuff. Perhaps something
interesting is that the u-boot output under qemu talks about eMMC not
being enabled:

> EMMC and EXT4 is not enabled - Cannot locate kernel file in Root

Not sure of what influences that output, but maybe try hooking up the
eMMC as well?

>=20
> > Note that gigabyte do ship "gigaflash" in that zip file above, which is
> > a closed-source application similar to culvert, that derives from
> > Aspeed's own "socflash" tool.
>=20
> I noticed that (but did not know about its lineage), but cannot get it to
> actually work for me on my Linux-based host system (grml 2024.02 for amd6=
4 at
> the moment), neither for updating nor for dumping the BMC ROM.
>=20
> Since the binary is not stripped (and seems to have some understanding of=
 FMH
> and whatever funny signature business that is going on in the `rom.ima_en=
c`
> parts of the BMC FW ZIP archives), it might still be useful in other ways
> after all...
>=20

Nice.

>=20
> > > [...]
> >=20
> > u-boot is linked at 0 and uses XIP from the SPI-NOR (which is memory-
> > mapped at 0), so I suspect it has read out the vendor copy again.
>=20
> That's what Paul and me guessed on IRC yesterday, and the first attempt a=
t
> working around that seems to have been successful, as stated above! :)

Glad we were all on the right track!

>=20
>=20
> > [...]
> > A potential collaborator on Gigabyte stuff is bielids. I don't have
> > their contact details, but you can find some of our past discussion
> > here:
> >=20
> > https://github.com/amboar/culvert/issues/51
>=20
> Thanks, I've had this issue bookmarked since the start of last weekend
> already, and your patient and helpful approach there actually was one of =
the
> main motivating factors for me to actually embark on this journey :) It's=
 kind
> people like you who make FOSS a great world to engage in - so let me say =
thank
> you for your service to the general public! :)

Ah, thanks for the kind words :)

Andrew
