Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 76DFF8D2919
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2024 01:57:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=mTvNi/Iu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vpq3T6GQVz79bc
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2024 09:48:53 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=mTvNi/Iu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=truschnigg.info (client-ip=89.163.150.210; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org)
Received: from truschnigg.info (truschnigg.info [89.163.150.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vph7w2fYwz3vh0
	for <openbmc@lists.ozlabs.org>; Wed, 29 May 2024 04:37:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=truschnigg.info;
	s=m22; t=1716921431;
	bh=2HX36lHQPGAWmzsl/Vk0cGo8pYVocPOWLFHz6clhMMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mTvNi/IuieeFcQZLrj7qp9luNSHLMIwFPX2IAYqk6fiTkC51Wx+k+6CI6bbkLJT/P
	 l6CTp1ldunR1UfD0N3ISKDjav8eACGORWXzHhg5KtzljbC+E4MC7BW4AUzTBlMa7Fw
	 lZWCrLfq64qHLJNI4s4YXCuWxJ1dQvzn5Xy0gTbgk7yfGaIixVMSgsfs7CijAg5Ug5
	 sgSK2FqZNx0VGoXF55naaayvzfr8hmIfcZ3oiHvACkIKMqu1pnvBkH3mWRMTiKaM5u
	 fTqdqjGBKpnRMjzw4Iw1OZzgM05Set2mSEL8dDtvVpjQheNuyAHJXOvZNX0rUNE1rN
	 EpL1fS+DzDBzg==
Received: from vault.lan (unknown [IPv6:2a02:1748:fafe:cf3f:1eb7:2cff:fe02:8261])
	by truschnigg.info (Postfix) with ESMTPSA id 9CFF320149;
	Tue, 28 May 2024 18:37:10 +0000 (UTC)
Date: Tue, 28 May 2024 20:37:08 +0200
From: Johannes Truschnigg <johannes@truschnigg.info>
To: openbmc@lists.ozlabs.org
Subject: Re: OpenBMC replacing AMI AST2500 BMC fw on Gigabyte MC12-LE0 -
 questions
Message-ID: <ZlYkVBwV2Voscqme@vault.lan>
References: <ZkuJNJ9kFrRS3mQF@vault.lan>
 <5e89654a02e2f870b71700c8cd75c2ef371fb579.camel@codeconstruct.com.au>
 <ZkzUX9JPPGAtNa2d@vault.lan>
 <640ed3fcae859ef35f3c57fad6c2f39400d6ef0a.camel@codeconstruct.com.au>
 <ZlTMYkCZhXmRb1av@vault.lan>
 <4b5f7c656fba2bbee92f41922f82903168441aad.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iw+mGuryAjZ7XNfN"
Content-Disposition: inline
In-Reply-To: <4b5f7c656fba2bbee92f41922f82903168441aad.camel@codeconstruct.com.au>
X-Mailman-Approved-At: Wed, 29 May 2024 09:48:27 +1000
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


--iw+mGuryAjZ7XNfN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi again! :)

On Tue, May 28, 2024 at 09:56:38AM +0930, Andrew Jeffery wrote:

> [...]
> > ```
> > root@grml ~ # /tmp/culvert probe
> > [*] failed to initialise devmem bridge: -1
> > [*] Accessing the BMC's AHB via the p2a bridge
> > debug:  Permissive
> >         Debug UART port: UART5
> > xdma:   Restricted
> >         BMC: Disabled
> >         VGA: Enabled
> >         XDMA on VGA: Enabled
> >         XDMA is constrained: Yes
> > p2a:    Permissive
> >         BMC: Disabled
> >         VGA: Enabled
> >         MMIO on VGA: Enabled
> >         [0x00000000 - 0x0fffffff]   Firmware: Writable
> >         [0x10000000 - 0x1fffffff]     SoC IO: Writable
> >         [0x20000000 - 0x2fffffff]  BMC Flash: Writable
> >         [0x30000000 - 0x3fffffff] Host Flash: Writable
> >         [0x40000000 - 0x5fffffff]   Reserved: Writable
> >         [0x60000000 - 0x7fffffff]   LPC Host: Writable
> >         [0x80000000 - 0xffffffff]       DRAM: Writable
> > ilpc:   Permissive
> >         SuperIO address: 0x2e
> > ```
> >=20
> > (Before my mishap, whenever I tried to run that command, all but `ilpc`=
 yielded
> > nothing, and even `ilpc` reported "Restricted" - none of which I know h=
ow to
> > interpret at all, by the way! :D)
>=20
> So I have a bit of an educated guess here:
>=20
> 1. For AST SoCs prior to the AST2600, disabling the hardware backdoors
> must be done in firmware
> 2. Your process above has corrupted u-boot
> 3. The corruption is such that u-boot fails prior to applying the
> backdoor mitigations (if that's where the mitigation was done to begin
> with - however it's where we do the mitigation in OpenBMC)
>=20
> As for the culvert 'probe' output and the
> Permissive/Restricted/Disabled states:
>=20
> - Permissive means there are no constraints on the bridge - culvert can
> read and write any AHB address
> - Restricted means some constraints apply to the bridge - either the
> address space is restricted (e.g. XDMA is constrained to the VGA
> reserved memory), or write access is disabled for some portion or all
> of the AHB address space (e.g. the P2A write filters for the listed
> regions)
> - Disabled means what it says on the tin, the BMC's AHB address space
> cannot be accessed via the bridge at hand, we cannot read or write.

Thanks for this summary and explanation. The "I know some of these words" is
strong in me still, esp. during the later paragraphs, but I think I have a
chance to get to understand more about how it all comes together eventually=
 ;)


> > So I guess I have at least six questions now:
> >=20
> > 1.) What happened when the kernel called it quits, u-boot reloaded and =
decided
> > to format some of its flash?
>=20
> Not sure, but you'd do well to boot a kernel that doesn't try to mount
> partitions from the flash.

Understood. Is that always the case for OpenBMC kernel images with default
config?


> > 3.) Can I restore the original firmware/SPI content on my board by any =
means
> > from the now running host OS? If so, what way would you suggest I try f=
irst?
>=20
> > 4.) Does having `culvert` have this new level of access have any new ad=
vantages
> > or open possibilities that I should be aware of?
>=20
> So one of the motivations for culvert is to reflash the BMC over the
> AHB bridges reported in the probe output. This works regardless of the
> state of the BMC firmware, so long as it hasn't disabled the hardware
> backdoors. You can try it with e.g.
>=20
> ```
> # culvert -vv write firmware < $firmware_image
> ```
>=20
> (you may want to experiment with `culvert -vv read firmware` first).
>=20
> That said, experience in [1] suggests Gigabyte have introduced some
> gremlins that aren't accounted for by culvert, and that you might have
> more success with gigaflash.
>=20
> [1]:
> https://github.com/amboar/culvert/issues/51#issuecomment-2129043859

So I did play around with this after I'd read the above github issue's late=
st
additions (how nice it was to learn that someone actually could use what
little info I had produced so far already! :)), and I concluded I would want
to try to get `culvert` to not flash back stock fw, but the OpenBMC phosphor
image I had prepared a while ago.

And indeed, it can be done, and I did it. I am just nor exactly sure *how* =
or
*why* I could do it, but maybe you can figure that out with the information=
 I
gathered.

First, I used `gigaflash` to dump BMC ROM to a file, and that worked somewh=
at
unreliably at first, to my surprise - the first `gigaflash_x64 -dump somefi=
le`
attempt caused my host to hang, but it recovered to its original state (BMC
dead, live distro (grml amd64) booted OK) after a power cycle.

The subsequent attempts using a more up-to-date release of gigaflash worked,
and while fooling around with culvert and gigaflash (to check if gigaflash
always produced the same result and to find out if the switches that Gigaby=
te's
provided wrapper shellscript used to updaye fw actually made a difference),=
 I
noticed that at some point, culvert suddenly could (correctly, bit-by-bit
identically!) dump the ROM, too!

For posterity, this is what it looked like when gigaflash successfully dump=
ed
the image for me:

```
# Tools/gigaflash_x64 -dump test.img -cs 0 -2500
gigaflash v2.0.10
Failed to connect BMC, try to dump image!
--- Dump image from BMC...
Find ASPEED Device 1a03:2000 on 4:0.0=20
MMIO Virtual Address: a4e84000=20
Relocate IO Base: f000=20
Found ASPEED Device 1a03:2500 rev. 41=20
Static Memory Controller Information:=20
CS0 Flash Type is SPI=20
CS1 Flash Type is SPI=20
CS2 Flash Type is SPI=20
CS3 Flash Type is NOR=20
CS4 Flash Type is NOR=20
Boot CS is 0=20
Option Information:=20
CS: 0=20
Flash Type: SPI=20
[Warning] Don't AC OFF or Reboot System During BMC Firmware Update!!=20
[SOCFLASH] Flash ID : 20ba20=20
Find Flash Chip #1: Numonyx N25Q512=20
Backup Flash Chip O.K.                =20
--- Dump image finished
--- Wait 90 secs for BMC ready...
```


I tried to arrive at a minimal reproducer on what I had to do after a power
cut to get `culvert read firmware` to work, and in the end, it seems to be
that one needs to run

`gigaflash -dump some_filename -2500`

=2E.. once, and *only then* culvert can read the data as well.

A session log I kept when it successfully dumped looked like this:

```
[*] Found 5 registered bridge drivers
[*] Trying bridge driver l2a
[*] Failed to initialise L2A bridge: -95
[*] Trying bridge driver ilpc
[*] Probing ilpc
[*] Probing 0x2e for SuperIO
[*] Unlocking SuperIO: 0
[*] Selecting SuperIO device 2 (SUART1): 0
[*] Found device 2 selected: 0
[*] Selecting SuperIO device 12 (SUART4): 0
[*] Found device 12 selected: 0
[*] Locking SuperIO
[*] Found SuperIO device at 0x2e
[*] Probing for SoC revision registers
[*] ahb_readl: 0x1e6e2004: 0xf7cffedc
[*] ahb_readl: 0x1e6e207c: 0x04030303
[*] Found revision 0x4030303
[*] Trying bridge driver devmem
[*] failed to initialise devmem bridge: -1
[*] Trying bridge driver debug-uart
[*] Unrecognised argument list for debug interface (0)
[*] Trying bridge driver p2a
[*] Probing p2a
[*] Probing for SoC revision registers
[*] ahb_readl: 0x1e6e2004: 0xf7cffedc
[*] ahb_readl: 0x1e6e207c: 0x04030303
[*] Found revision 0x4030303
[*] Accessing the BMC's AHB via the p2a bridge
[*] Probing for SoC revision registers
[*] ahb_readl: 0x1e6e2004: 0xf7cffedc
[*] ahb_readl: 0x1e6e207c: 0x04030303
[*] Found revision 0x4030303
[*] Selected devicetree for SoC 'aspeed,ast2500'
[*] Found 15 registered drivers
[*] Processing devicetree node at /aliases
[*] Processing devicetree node at /memory@80000000
[*] Processing devicetree node at /ahb
[*] Processing devicetree node at /ahb/sram@1e720000
[*] Processing devicetree node at /ahb/bus-controller@1e600000
[*] Bound trace driver to /ahb/bus-controller@1e600000
[*] Processing devicetree node at /ahb/apb
[*] Processing devicetree node at /ahb/apb/spi@1e620000
[*] Bound sfc driver to /ahb/apb/spi@1e620000
[*] Processing devicetree node at /ahb/apb/spi@1e630000
[*] Bound sfc driver to /ahb/apb/spi@1e630000
[*] Processing devicetree node at /ahb/apb/spi@1e631000
[*] Bound sfc driver to /ahb/apb/spi@1e631000
[*] Processing devicetree node at /ahb/apb/memory-controller@1e6e0000
[*] Bound sdmc driver to /ahb/apb/memory-controller@1e6e0000
[*] Processing devicetree node at /ahb/apb/syscon@1e6e2000
[*] Processing devicetree node at /ahb/apb/syscon@1e6e2000/clock
[*] Bound clk driver to /ahb/apb/syscon@1e6e2000/clock
[*] Processing devicetree node at /ahb/apb/syscon@1e6e2000/strapping
[*] Bound strap driver to /ahb/apb/syscon@1e6e2000/strapping
[*] Processing devicetree node at /ahb/apb/syscon@1e6e2000/superio
[*] Bound sioctl driver to /ahb/apb/syscon@1e6e2000/superio
[*] Processing devicetree node at /ahb/apb/syscon@1e6e2000/bridge-controller
[*] Bound bridge-controller driver to /ahb/apb/syscon@1e6e2000/bridge-contr=
oller
[*] Processing devicetree node at /ahb/apb/syscon@1e6e2000/debug-bridge-con=
troller
[*] Bound debugctl driver to /ahb/apb/syscon@1e6e2000/debug-bridge-controll=
er
[*] Processing devicetree node at /ahb/apb/syscon@1e6e2000/pcie-bridge-cont=
roller
[*] Bound pciectl driver to /ahb/apb/syscon@1e6e2000/pcie-bridge-controller
[*] Bound scu driver to /ahb/apb/syscon@1e6e2000
[*] Processing devicetree node at /ahb/apb/watchdog@1e785000
[*] Bound wdt driver to /ahb/apb/watchdog@1e785000
[*] Processing devicetree node at /ahb/apb/watchdog@1e785020
[*] Bound wdt driver to /ahb/apb/watchdog@1e785020
[*] Processing devicetree node at /ahb/apb/watchdog@1e785040
[*] Bound wdt driver to /ahb/apb/watchdog@1e785040
[*] Processing devicetree node at /ahb/apb/serial@1e787000
[*] Bound vuart driver to /ahb/apb/serial@1e787000
[*] Processing devicetree node at /ahb/apb/lpc@1e789000
[*] Processing devicetree node at /ahb/apb/lpc@1e789000/bridge-controller
[*] Bound ilpcctl driver to /ahb/apb/lpc@1e789000/bridge-controller
[*] Bound uart-mux driver to /ahb/apb/lpc@1e789000
[*] Initialising flash controller
[*] fdt: Looking up device name 'fmc'
[*] fdt: Locating node with device path '/ahb/apb/spi@1e620000'
[*] ahb_readl: 0x1e6e2000: 0x00000001
[*] Initialised scu driver
[*] Initialised clk driver
[*] ahb_readl: 0x1e6e2070: 0xf120f287
[*] ahb_readl: 0x1e620010: 0x00002400
[*] ahb_readl: 0x1e620000: 0x8007002a
[*] ahb_writel: 0x1e620000: 0x8007002a
[*] ahb_writel: 0x1e620010: 0x00000400
[*] ahb_writel: 0x1e620094: 0x00000000
[*] Initialised sfc driver
[*] Initialising flash chip
[*] ahb_writel: 0x1e620010: 0x00000407
[*] ahb_writel: 0x1e620010: 0x00000403
[*] ahb_readl: 0x20000000: 0x02020202
[*] ahb_writel: 0x1e620010: 0x00000407
[*] ahb_writel: 0x1e620010: 0x00000400
[*] LIBFLASH: Init status: 02
[*] ahb_writel: 0x1e620010: 0x00000407
[*] ahb_writel: 0x1e620010: 0x00000403
[*] ahb_readl: 0x20000000: 0x1020ba20
[*] ahb_writel: 0x1e620010: 0x00000407
[*] ahb_writel: 0x1e620010: 0x00000400
[*] LIBFLASH: Flash ID: 20.ba.20 (20ba20)
[*] LIBFLASH: Found chip Micron N25Qx512Ax size 64M erase granule: 4K
[*] LIBFLASH: Flash >16MB, enabling 4B mode...
[*] ahb_writel: 0x1e620010: 0x00000407
[*] ahb_writel: 0x1e620010: 0x00000403
[*] ahb_writel: 0x1e620010: 0x00000407
[*] ahb_writel: 0x1e620010: 0x00000400
[*] ahb_writel: 0x1e620010: 0x00000407
[*] ahb_writel: 0x1e620010: 0x00000403
[*] ahb_readl: 0x20000000: 0x02020202
[*] ahb_writel: 0x1e620010: 0x00000407
[*] ahb_writel: 0x1e620010: 0x00000400
[*] ahb_writel: 0x1e620010: 0x00000407
[*] ahb_writel: 0x1e620010: 0x00000403
[*] ahb_writel: 0x1e620010: 0x00000407
[*] ahb_writel: 0x1e620010: 0x00000400
[*] LIBFLASH: Enabling controller 4B mode...
[*] ahb_readl: 0x1e620004: 0x00000701
[*] ahb_writel: 0x1e620010: 0x00002400
[*] ahb_writel: 0x1e620004: 0x00000701
[*] Write-protecting all chip-selects
[*] ahb_readl: 0x1e620000: 0x8007002a
[*] ahb_writel: 0x1e620000: 0x8007002a
[*] Exfiltrating BMC flash to stdout

=2E...............................................................
[*] ahb_readl: 0x1e620000: 0x8007002a
[*] ahb_writel: 0x1e620000: 0x8007002a
[*] Unbound instance of driver uart-mux
[*] Unbound instance of driver ilpcctl
[*] Unbound instance of driver vuart
[*] Unbound instance of driver wdt
[*] Unbound instance of driver wdt
[*] Unbound instance of driver wdt
[*] Unbound instance of driver scu
[*] Unbound instance of driver pciectl
[*] Unbound instance of driver debugctl
[*] Unbound instance of driver bridge-controller
[*] Unbound instance of driver sioctl
[*] Unbound instance of driver strap
[*] Unbound instance of driver clk
[*] Unbound instance of driver sdmc
[*] Unbound instance of driver sfc
[*] Unbound instance of driver sfc
[*] ahb_writel: 0x1e620010: 0x00002400
[*] Unbound instance of driver sfc
[*] Unbound instance of driver trace
```

I did also try to get mmiotrace, which you mentioned in the GH issue (I have
never worked with it before, but I am familiar with ftrace, so I am not 100%
but reasonably certain that I did not hold it wrong), to work, but I could =
not
make it emit any tracing data while either culvert or gigaflash were dumping
ROM. Only when (un)loading the `ast` driver, lots of tracing data could be
collected.

I do have strace capture of `gigaflash` running for the first time after a
reboot, but all the juicy bits seem to hide behind mmap() anyway, so I will
only provide it upon request.

Then it dawned on me that `culvert probe` before and after the gigaflash
"unlock" might hold the key, and when diffing two runs' results (one before,
when culvert could not dump anything, and one after, when it very well coul=
d)
yielded this result:

```
$ diff -u1 culvert_probe_initial culvert_probe_after_dump=20
--- culvert_probe_initial
+++ culvert_probe_after_dump
@@ -121,4 +121,4 @@
 [*] ahb_readl: 0x1e6e2070: 0xf120f286
-[*] ahb_readl: 0x1e789100: 0x00000000
-ilpc:  Permissive
+[*] ahb_readl: 0x1e789100: 0x00000040
+ilpc:  Restricted
 [*] ahb_readl: 0x1e6e2070: 0xf120f286
```

I do not know how to interpret this, but here's goping you can tell if this
might help solve the mystery also reported in the GH issue? :)


> > 5.) Suppose I can restore the BMC's original SPI content and behavior -=
 what's
> > a recommended way to have the TFPT'd kernel boot into an OpenBMC rootfs
> > *without* having it store on the BMC's main storage/overwriting SPI?
>=20
> If you're looking to deal with OpenBMC directly then this collection of
> patches from Patrick will probably help:
>=20
> https://gerrit.openbmc.org/q/topic:%22no-rootfs%22

Thanks a bunch, this seems like a very useful reading list for when I sorte=
d my
immediate trouble with the board/BMC resulting of what I am about to detail
at the end of this mail! ;)


> > [...]
> > 6.) Assuming this cannot be recovered in software - what are my chances=
 of
> > identifying the SPI flash on my board as such, and re-writing its conte=
nts
> > using an affordable SPI programmer solution, given that I've never done
> > anything like this with hardware before? :^)
>=20
> From the manual[2] I expect it's in the unmarked socket between the
> PCIe x4 (27), M.2 (28) and PCIe x16 (29) slots.

Thanks, I was afraid so - despite the diagram in the manual, the IC is not
socketed, so I guess I'll have to find someone who'd be able to desolder it=
 for
me, or find a test clip that is compatible with that kind of "socket".


Anyhow, like I hinted at above, that's not the end of today's episode: I did
try if I could get culvert to *write* my OpenBMC flash in from my root prom=
pt,
and it readily complied on first try (after I'd gotten it to dump first).
Unfortunately, I ran it with `-v -v` in effect, LOTS of debug output
overwhelmed my generous scrollback buffer, and I could only preserve the la=
st
few thousands of lines it put out while writing and verifying flash. It loo=
ks a
lot like this:

```
[*] ahb_writel: 0x1e620010: 0x00002407
[*] ahb_writel: 0x1e620010: 0x00002400
=2E[*] ahb_writel: 0x1e620010: 0x00002407
[*] ahb_writel: 0x1e620010: 0x00002403
[*] ahb_writel: 0x1e620010: 0x00002407
[*] ahb_writel: 0x1e620010: 0x00002400
[*] ahb_writel: 0x1e620010: 0x00002407
[*] ahb_writel: 0x1e620010: 0x00002403
[*] ahb_readl: 0x20000000: 0x02020202
[*] ahb_writel: 0x1e620010: 0x00002407
[*] ahb_writel: 0x1e620010: 0x00002400
[*] ahb_writel: 0x1e620010: 0x00002407
[*] ahb_writel: 0x1e620010: 0x00002403
[*] ahb_writel: 0x1e620010: 0x00002407
[*] ahb_writel: 0x1e620010: 0x00002400
[*] ahb_writel: 0x1e620010: 0x00002407
[*] ahb_writel: 0x1e620010: 0x00002403
[*] ahb_readl: 0x20000000: 0x03030303
[*] ahb_writel: 0x1e620010: 0x00002407
[*] ahb_writel: 0x1e620010: 0x00002400
[*] ahb_writel: 0x1e620010: 0x00002407
[*] ahb_writel: 0x1e620010: 0x00002403
[*] ahb_readl: 0x20000000: 0x00000000
[*] ahb_writel: 0x1e620010: 0x00002407
[*] ahb_writel: 0x1e620010: 0x00002400
[*] ahb_writel: 0x1e620010: 0x00002407
[*] ahb_writel: 0x1e620010: 0x00002403
[*] ahb_readl: 0x20000000: 0x81818181
[*] ahb_writel: 0x1e620010: 0x00002407
[*] ahb_writel: 0x1e620010: 0x00002400
=2E
[*] LIBFLASH: Verifying...
=2E........................................................................=
=2E........................................................................=
=2E........................................................................=
=2E....................................
[*] Performing SoC reset
[*] fdt: Looking up device name 'wdt2'
[*] fdt: Locating node with device path '/ahb/apb/watchdog@1e785020'
[*] ahb_readl: 0x1e78502c: 0x00000010
[*] wdt_readl:  base: 0x1e785020, reg: 0x0c, val: 0x00000010
[*] wdt_writel: base: 0x1e785020, reg: 0x0c, val: 0x00000010
[*] ahb_writel: 0x1e78502c: 0x00000010
[*] ahb_readl: 0x1e78502c: 0x00000010
[*] wdt_readl:  base: 0x1e785020, reg: 0x0c, val: 0x00000010
[*] wdt_writel: base: 0x1e785020, reg: 0x0c, val: 0x00000010
[*] ahb_writel: 0x1e78502c: 0x00000010
[*] wdt_writel: base: 0x1e785020, reg: 0x1c, val: 0x023ffffb
[*] ahb_writel: 0x1e78503c: 0x023ffffb
[*] ahb_readl: 0x1e78502c: 0x00000010
[*] wdt_readl:  base: 0x1e785020, reg: 0x0c, val: 0x00000010
[*] wdt_writel: base: 0x1e785020, reg: 0x04, val: 0x004c4b40
[*] ahb_writel: 0x1e785024: 0x004c4b40
[*] wdt_writel: base: 0x1e785020, reg: 0x08, val: 0x00004755
[*] ahb_writel: 0x1e785028: 0x00004755
[*] ahb_readl: 0x1e78502c: 0x00000010
[*] wdt_readl:  base: 0x1e785020, reg: 0x0c, val: 0x00000010
[*] wdt_writel: base: 0x1e785020, reg: 0x0c, val: 0x00000013
[*] ahb_writel: 0x1e78502c: 0x00000013
[*] Waiting 6000000 microseconds for watchdog timer to expire
[*] ahb_writel: 0x1e6e207c: 0x00000001
[*] wdt_writel: base: 0x1e785020, reg: 0x04, val: 0x00000000
[*] ahb_writel: 0x1e785024: 0x00000000
[*] Unbound instance of driver uart-mux
[*] Unbound instance of driver ilpcctl
[*] Unbound instance of driver vuart
[*] Unbound instance of driver wdt
[*] Unbound instance of driver wdt
[*] Unbound instance of driver wdt
[*] Unbound instance of driver scu
[*] Unbound instance of driver pciectl
[*] Unbound instance of driver debugctl
[*] Unbound instance of driver bridge-controller
[*] Unbound instance of driver sioctl
[*] Unbound instance of driver strap
[*] Unbound instance of driver clk
[*] Unbound instance of driver sdmc
[*] Unbound instance of driver sfc
[*] Unbound instance of driver sfc
[*] ahb_writel: 0x1e620010: 0x00002400
[*] Unbound instance of driver sfc
[*] Unbound instance of driver trace
/tmp/culvert -v -v write firmware <   190.48s user 69.45s system 97% cpu 4:=
25.94 total
```

The result is both very encouraging and also disappointing, because as you
intially theorized, the BMC boots fine with OpenBMC flashed onto it - but n=
one
of its host system manmagement capabilities actually work. I do have the
vanilla OpenBMC web application available now, with DHCP, DNS, NTP et al.
working fine for the BMC, can log in via SSH, but all the peripherals the B=
MC
ought to be able to manage and hook into do not work at present.


The next step that I would want to take is that I find a way to revert to t=
he
BMC stock fw with having only OpenBMC running, since the host apparently ca=
nnot
boot any more (same situation as with the stock BMC fw when u-boot had
initialized, but no BMC system was allowed to boot up, afaict - the power
button/contacts just do nothing) in this state. After that, I would like to
establish a sane (and hopefully easy) way to convert the board's BMC firmwa=
re
=66rom OpenBMC to stock, and vice versa.

Once I have established a surefire and straightfoward way to do what I have
done in such meandering and clumsy attempts, I would like to learn more abo=
ut
how the "M" is actually put into this whole "BMC" thing, and see how far I =
can
take that. The stock fw has some interesting description files regarding i2c
configs that might come in handy, but I am just not educated enough (yet, I
hope) to make real sense of it :)

Can you perhaps offer me advice on how to flash arbitrary new SPI flash
contents from either OpenBMC's u-boot or an OpenBMC root shell, or what I w=
ould
need to look at in detail to learn how to do that?

As always, I am very grateful for anyone's advice and time. Thank you! :)

--=20
with best regards:
- Johannes Truschnigg ( johannes@truschnigg.info )

www:   https://johannes.truschnigg.info/

--iw+mGuryAjZ7XNfN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGu9IhkI+7/aKLUWF95W3jMsYfLUFAmZWJFAACgkQ95W3jMsY
fLXYvw//cnxla2535XQ1O8G6bLc7krWfEptPpub2JrOmclxtDpvBMZwt6NW0dTFB
gpUJ/8u0RNV41IKSR01jrH/5I6YdAO6/0KdaTpAGbUtFrf5zJ5Fg36uoEaM/yLRG
7YLqpWNIdH7cBdKMQDvb9QcUo4PcGThdhDxq1+YVdWoAaEb7ZB2c8pBa8l1Ii+KW
dOgLTxo0ATq2Lm0pxaFEksvZ+YgEa2s8xdjQzrtVoFYDKmOAjjAB53b4Fm3Q55+u
hZoqbckvfiX3RfuVoqyk5dBNLqFEFNxKGz6TTxJcSKXNe9CRueV9hFrAOeVJtkNJ
wMSG5sbnIpqfsNaD/1T+xgB3YxuVzPsdFlxyy24J9WuS6asornQ4SGCBl8yFJvrn
gZuwPvSAhMR1Ny5VauJchpmxG5upm7/LTl/eoPsbhNR6mDWWQUtBT+q8+TZ6hFkN
WROagFWVUzlvcsXP2KDv4D6QKyita/213f1YP4LVMTQXolVusnLO9nWMLolunzNo
NDlIV6ExOGPr3VvCiS6ZP/wxiiQFigds7pKSqYYZAo8ITzb0W4FpPGbRwd2raR9A
lFcbU4tmhKc+josxfl63hTwetL9LCAbWKB3nEG7cG+9CRJzbTrRTdf4k4N6/0v4w
r+D1gDnHb1zvQm798PvF86ex1+pEve0AKir92Wit/4IbCsS9Ots=
=Jm/n
-----END PGP SIGNATURE-----

--iw+mGuryAjZ7XNfN--
