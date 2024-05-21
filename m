Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id AF4258CB66D
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2024 01:56:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=iXn+QtCs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkWLt13RFz3gGg
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2024 09:47:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=iXn+QtCs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=truschnigg.info (client-ip=89.163.150.210; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org)
Received: from truschnigg.info (truschnigg.info [89.163.150.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkLRS6mhZz3fw3
	for <openbmc@lists.ozlabs.org>; Wed, 22 May 2024 03:05:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=truschnigg.info;
	s=m22; t=1716311137;
	bh=jT6pL0k1cN7hT1QjccENb1Xce9TdJV21B/FCqkThfbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iXn+QtCsr2xcMrWtvIk3JGmh4S1z6/+z8GNQHVhYjDYslxx1GV1X6nDivgn5PevFn
	 Q72MGg7qMf0EYF60R53ChKnVHkC0T+zNlCOPvd703ApjEGxk/Ar3RMfgRpsE4HQvNo
	 Mt5k2us/YDm98qMZOjITAXcK7QrahOtkTcUe/xgxpZSFKthkbCqcK6geu4veUY87dS
	 fCMU0jxV2dztEdwirEL20QlvpQwRMjYlsvVtbQGqOfjTuIxRxGyvFPjPRI+0s07BtV
	 MlgJtPH9DGOLb4khBad6Mr4ARB4VYTnQkUmJiIw/4yZS5vXAG+uMxiiF2zPdzmLocs
	 T6hZUmSOSvYJA==
Received: from vault.lan (unknown [IPv6:2a02:1748:fafe:cf3f:1eb7:2cff:fe02:8261])
	by truschnigg.info (Postfix) with ESMTPSA id 1E66E20726;
	Tue, 21 May 2024 17:05:37 +0000 (UTC)
Date: Tue, 21 May 2024 19:05:35 +0200
From: Johannes Truschnigg <johannes@truschnigg.info>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: OpenBMC replacing AMI AST2500 BMC fw on Gigabyte MC12-LE0 -
 questions
Message-ID: <ZkzUX9JPPGAtNa2d@vault.lan>
References: <ZkuJNJ9kFrRS3mQF@vault.lan>
 <5e89654a02e2f870b71700c8cd75c2ef371fb579.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="32whCS+4B1ZZ4pKk"
Content-Disposition: inline
In-Reply-To: <5e89654a02e2f870b71700c8cd75c2ef371fb579.camel@codeconstruct.com.au>
X-Mailman-Approved-At: Wed, 22 May 2024 09:46:50 +1000
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


--32whCS+4B1ZZ4pKk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

thanks so much for your kind response! I've come across your project (culve=
rt)
on my little quest to liberate my board's BMC already, and I'm eager to try
working with it as soon as I manage to build it (which will leventually
happen)!

But first, I need to share the good news: Yesterday, shortly after I had se=
nt
my initial post to this list, my friend Paul on IRC supplied me with ideas =
and
instructions to get the OpenBMC stuff to fly on the Gigabyte-supplied AST25=
00,
and we had smashing success after a rather short while! We patched OpenBMC's
u-boot to assume a CONFIG_SYS_TEXT_BASE of 0x83000000, tftp'd the resulting
binary to that address, issued

`go 0x83000000`

in the AMI u-boot monitor, and... had successfully chainloaded the OpenBMC
u-boot on the Gigabyte BMC!

=46rom there, I could load the OpenBMC FIT and went to a initrd rescue shell
rather quickly. The sequence of commands was, for posterity (assuming a TFTP
server on 192.168.2.123 can supply the mentioned artifacts after successful
DHCPv4 autoconfig):

```
### original/stock AMI uboot monitor:
AST2500EVB> dhcp
AST2500EVB> tftp 0x83000000 192.168.2.123:hacked-uboot
AST2500EVB> go 0x83000000

### chainloaded OpenBMC u-boot:
ast# setenv ethact ethernet@1e680000
ast# dhcp
ast# tftpboot 0x84000000 192.168.2.123:openbmc-fit-image
ast# setenv bootargs console=3DttyS4,115200n8 root=3D/dev/ram rw enable-ini=
trd-debug-sh debug-init-sh
ast# bootm 0x84000000
```

I have provided a copy of the `hacked-uboot` file contents at [0]. Its
sha256sum hexdigest reads
  2937963c78f577355dc3bd15b8b8e57dcacf72fd74cd82854d1136bb26356e68

=46rom there, I could reconfigure the BMC's Ethernet interface for my LAN,
shuttle in the OpenBMC squashfs-xz image via tftp onto tmpfs, loop-mount th=
at,
and chroot into the resulting directory tree - the userland seems to work,
too! :)


What I am struggling with (as other plans leave me little time today
unfortunately) is how to boot into this environment after manually massaging
the rescue environment into the half-working state. If you have any advice =
on
how to streamline my boot process, I'd be eager to read about it!


On Tue, May 21, 2024 at 10:35:34AM +0930, Andrew Jeffery wrote:
> [...]
> > The BMC implementation seems lean very much onto the AST2500 Evaluation=
 Board
> > (the unchanged name pops up in a number of places in the stock firmware=
), so I
> > would guess that the OpenBMC evb-ast2500 machine should be able to get
> > somewhere (and even if it's just to see OpenBMC's instead of AMI's Linu=
x start,
> > and then crash hard due to some subtle incompatibility :)) at least.
>=20
> Perhaps. While the SoC itself is obviously supported, how it's
> integrated into the rest of the platform will likely be very different
> to how things are wired up on the EVB.

I think I've already discovered some of the rough edges that are still comi=
ng
for me and this attempt at liberating the Gigabyte BMC, as the host does not
seem to want to power on without the (stock) BMC running. That, and all the
other obstacles that are sure to come, I will try to tackle in time :)


> > My understanding is that there are two paths forward:
> >=20
> > 1.) To make OpenBMC's build artifacts into FMH-style BLOBs, and find a =
way to
> > feed them to the stock fw's u-boot, which would ideally result in OpenB=
MC being
> > able to boot this way.
> >=20
> > 2.) To replace the stock fw's u-boot release with an OpenBMC u-boot tha=
t can
> > load the evb-ast2500 artifacts natively, and have the BMC boot OpenBMC =
that
> > way.
> >=20
> > Can you please confirm that this assessment is sane, or correct me if i=
t isn't?
>=20
> Yeah, that's sane. I'm not familiar with FMH so can't really comment on
> how feasible that approach might be, but my intuition is it's probably
> a bunch of pain.

Because of the successfull attempt at chainloading a hacked u-boot, I think=
 we
can safely discard trying to travel down path #1 and skip learning more abo=
ut
FMH than absolutely necessary :)


> > If so, I would presume option 2.) to be the easier road to travel, but =
I am
> > somewhat stumped as to how I can get OpenBMC's u-boot onto the BMC, *id=
eally*
> > (but not necessarily) in a non-destructive way (as I do not know how to=
 or have
> > a way to revert to the original state without access to the bootloader =
or even
> > stock firmware running).
>=20
> Something to consider is using qemu to boot the proprietary firmware,
[...]
> ast_eth0, ast_eth1
> DRAM ECC enabled
> Hit any key to stop autoboot:  0=20
> Image to be booted is 1
> EMMC and EXT4 is not enabled - Cannot locate kernel file in Root
> Initing KCS...done
> Uboot waiting for firmware update to start...
> Uboot waiting for fwupdate to start timed out
> Disabling Watchdog 2 Timer
> AST2500EVB>
> ```

Thanks for this; while I've had success in booting the evb-2500ast artifacts
in QEMU (as documented by OpenBMC and QEMU), I had not successfully tried w=
ith
the AMI-supplied artifacts yet. This saved me a ton of time trying to figure
that out!

However, what I do not really understand about the situation in the emulator
is that `fmh` will not list any FMH-style blocks/partitions/area in that ca=
se,
whilst it will on the physical BMC. As a consequence, I cannot actually boot
the stock firmware in QEMU passt the u-boot stage, as that relies on `bootf=
mh`
and the FMH areas to be properly recognized.

Maybe the munging of the image size with `truncate` changes something that =
the
FMH format can't cope with? I am unsure, and haven't yet looked into the
public FMH bits to confirm this theory's merit.


> If you want to do something more destructive and overwrite the firmware
> on the flash, then you should probably have a flash programmer handy,
> and/or become familiar with something like culvert (which I maintain):
>=20
> https://github.com/amboar/culvert

I'll be sure to try my luck with culvert as soon as I am able, and I would
have tried working with it earlier more eagerly if I had not made such
unexpectedly quick progress with the other ways tried ;)


> Note that gigabyte do ship "gigaflash" in that zip file above, which is
> a closed-source application similar to culvert, that derives from
> Aspeed's own "socflash" tool.

I noticed that (but did not know about its lineage), but cannot get it to
actually work for me on my Linux-based host system (grml 2024.02 for amd64 =
at
the moment), neither for updating nor for dumping the BMC ROM.

Since the binary is not stripped (and seems to have some understanding of F=
MH
and whatever funny signature business that is going on in the `rom.ima_enc`
parts of the BMC FW ZIP archives), it might still be useful in other ways
after all...


> > [...]
>=20
> u-boot is linked at 0 and uses XIP from the SPI-NOR (which is memory-
> mapped at 0), so I suspect it has read out the vendor copy again.

That's what Paul and me guessed on IRC yesterday, and the first attempt at
working around that seems to have been successful, as stated above! :)


> [...]
> A potential collaborator on Gigabyte stuff is bielids. I don't have
> their contact details, but you can find some of our past discussion
> here:
>=20
> https://github.com/amboar/culvert/issues/51

Thanks, I've had this issue bookmarked since the start of last weekend
already, and your patient and helpful approach there actually was one of the
main motivating factors for me to actually embark on this journey :) It's k=
ind
people like you who make FOSS a great world to engage in - so let me say th=
ank
you for your service to the general public! :)

Have a nice day!
- Johannes


[0]: https://johannes.truschnigg.info/assets/AMI_ast2500_hacked_u-boot_0x83=
00000


--=20
with best regards:
- Johannes Truschnigg ( johannes@truschnigg.info )

www:   https://johannes.truschnigg.info/

--32whCS+4B1ZZ4pKk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGu9IhkI+7/aKLUWF95W3jMsYfLUFAmZM1FwACgkQ95W3jMsY
fLUILw//WOAmGCxCnUqauqT2rYhEX/D68IgYUrgOMscuqjGiitCNZZl8L1gryzFE
+zXj5KOCadgcqSMDEUsC+OJ1qn3nROOOqmbPxTXEkNg+Vzc0B3myCHiT4jkW8wUA
hQxtBJtJ94QRBbizXfSnnzQxtF9+3Nyc0SbtqW+k7ikGP4BD8YuZK+yCZ/fg6nO+
KJqr9KAZOgNMKLfSgd9eEMScP93nbYU38OU8E9E4+Jc9BUEAk0Apd8iOawfw/Kkg
wqh70/LWN1F780+nmAIfM2BeTDFUJ1HfytS4I7vJHQMBynQoQLOBkWF3m7GZV6IG
VAN7kX2BqRUPOQgEh1K2cxvGDQaP123xZXcUXjEw/OgE5pS+e+6f9QHnhKzh2anr
xhHHgUI7BQCQAVaF4UXDEgcy2xV6b5yNyluquFu5A5AfV7MFkowQulA0jlGtbZCp
7xB7Dq8c1P6UlR6h6YAGbjJSo4kAFD7pFPDE+ZRZj1ZG2oB+EntvqBLxxaleSIiq
HFj6jkKUkX0BjI9iD+gY17uvM49ya6n9viRvkWc1bshwqRIdgptSq2FE3VUSdjHR
oIfavKwJ5wTQYcQkrO9bO9+zkF1WnW5Fu/JS34QYFb9KUKsTuu2nYoL4726sr0h6
eMTXqzJQZ+4eS0STpyyreaqc60um7Kx2AO9gQ1t4euDEBtagYNw=
=TKjI
-----END PGP SIGNATURE-----

--32whCS+4B1ZZ4pKk--
