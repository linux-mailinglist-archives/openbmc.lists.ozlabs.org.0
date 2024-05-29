Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id CBB148D29BC
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2024 03:01:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=iGdh9QKE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VprTB0LV4z79KV
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2024 10:52:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=iGdh9QKE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VprSc17WBz3wM3
	for <openbmc@lists.ozlabs.org>; Wed, 29 May 2024 10:52:15 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D84542014A;
	Wed, 29 May 2024 08:52:12 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1716943933;
	bh=DBdc8honvsxjCPPyWHQbysgZSyIbIvj/1R1Dc3eYHxU=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=iGdh9QKEwcyRhNKLP9ZK/iFagMOY90DVecwIRo84mnkRMS74CRYY9et5SG16+wHRw
	 rpJm+kkvo4n2VtTGkS3mteTAYHGR1ZgFS3OhtBSZ06yX1tJrtrLAPvVxgT9OHd/mUg
	 m4TqxkdQRrS4qL6HX6t/xDzC9EnuEOfisdc+l+8T9GgC6ytwufyvbm0VEQbjKa3ldR
	 JvEiHIpHMvdfM+cG9Eu7fM5H1DoGgd1O/LYqLAgw5LWjMC9yHjaKtqVg2/PrAQV1iT
	 6XKpmc7cg/O2QSw0z75LO0Azxg6ABZacw2p9fambKAfakl4fAARxB4L9/eDFJInMBb
	 T3G9xhvOCesgA==
Message-ID: <9406926919364e4d99c7b207996d455c8e404858.camel@codeconstruct.com.au>
Subject: Re: OpenBMC replacing AMI AST2500 BMC fw on Gigabyte MC12-LE0 -
 questions
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Johannes Truschnigg <johannes@truschnigg.info>, openbmc@lists.ozlabs.org
Date: Wed, 29 May 2024 10:22:09 +0930
In-Reply-To: <ZlYkVBwV2Voscqme@vault.lan>
References: <ZkuJNJ9kFrRS3mQF@vault.lan>
	 <5e89654a02e2f870b71700c8cd75c2ef371fb579.camel@codeconstruct.com.au>
	 <ZkzUX9JPPGAtNa2d@vault.lan>
	 <640ed3fcae859ef35f3c57fad6c2f39400d6ef0a.camel@codeconstruct.com.au>
	 <ZlTMYkCZhXmRb1av@vault.lan>
	 <4b5f7c656fba2bbee92f41922f82903168441aad.camel@codeconstruct.com.au>
	 <ZlYkVBwV2Voscqme@vault.lan>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2024-05-28 at 20:37 +0200, Johannes Truschnigg wrote:
> Hi again! :)
>=20
> On Tue, May 28, 2024 at 09:56:38AM +0930, Andrew Jeffery wrote:
>=20
> > > So I guess I have at least six questions now:
> > >=20
> > > 1.) What happened when the kernel called it quits, u-boot reloaded an=
d decided
> > > to format some of its flash?
> >=20
> > Not sure, but you'd do well to boot a kernel that doesn't try to mount
> > partitions from the flash.
>=20
> Understood. Is that always the case for OpenBMC kernel images with defaul=
t
> config?

Depends on what you mean by default. Which platform did you build for?

>=20
> The subsequent attempts using a more up-to-date release of gigaflash work=
ed,
> and while fooling around with culvert and gigaflash (to check if gigaflas=
h
> always produced the same result and to find out if the switches that Giga=
byte's
> provided wrapper shellscript used to updaye fw actually made a difference=
), I
> noticed that at some point, culvert suddenly could (correctly, bit-by-bit
> identically!) dump the ROM, too!

Right, culvert is likely missing some trick with initialising the flash
controller. I'm trying to understand what that might be :)

>=20
> For posterity, this is what it looked like when gigaflash successfully du=
mped
> the image for me:
>=20
> ```
> # Tools/gigaflash_x64 -dump test.img -cs 0 -2500
> gigaflash v2.0.10
> Failed to connect BMC, try to dump image!
> --- Dump image from BMC...
> Find ASPEED Device 1a03:2000 on 4:0.0=20
> MMIO Virtual Address: a4e84000=20
> Relocate IO Base: f000=20
> Found ASPEED Device 1a03:2500 rev. 41=20
> Static Memory Controller Information:=20
> CS0 Flash Type is SPI=20
> CS1 Flash Type is SPI=20
> CS2 Flash Type is SPI=20
> CS3 Flash Type is NOR=20
> CS4 Flash Type is NOR=20
> Boot CS is 0=20
> Option Information:=20
> CS: 0=20
> Flash Type: SPI=20
> [Warning] Don't AC OFF or Reboot System During BMC Firmware Update!!=20
> [SOCFLASH] Flash ID : 20ba20=20
> Find Flash Chip #1: Numonyx N25Q512=20
> Backup Flash Chip O.K.                =20
> --- Dump image finished
> --- Wait 90 secs for BMC ready...
> ```
>=20
>=20
> I tried to arrive at a minimal reproducer on what I had to do after a pow=
er
> cut to get `culvert read firmware` to work, and in the end, it seems to b=
e
> that one needs to run
>=20
> `gigaflash -dump some_filename -2500`
>=20
> ... once, and *only then* culvert can read the data as well.

Okay, handy to know. That jives with my comment above.

>=20
> I did also try to get mmiotrace, which you mentioned in the GH issue (I h=
ave
> never worked with it before, but I am familiar with ftrace, so I am not 1=
00%
> but reasonably certain that I did not hold it wrong), to work, but I coul=
d not
> make it emit any tracing data while either culvert or gigaflash were dump=
ing
> ROM. Only when (un)loading the `ast` driver, lots of tracing data could b=
e
> collected.
>=20
> I do have strace capture of `gigaflash` running for the first time after =
a
> reboot, but all the juicy bits seem to hide behind mmap() anyway, so I wi=
ll
> only provide it upon request.

Well, consider this a request :D What it's mapping is of interest to
me, along with what it's opening more broadly, and any calls to
ioperm() or iopl().

>=20
> Then it dawned on me that `culvert probe` before and after the gigaflash
> "unlock" might hold the key, and when diffing two runs' results (one befo=
re,
> when culvert could not dump anything, and one after, when it very well co=
uld)
> yielded this result:
>=20
> ```
> $ diff -u1 culvert_probe_initial culvert_probe_after_dump=20
> --- culvert_probe_initial
> +++ culvert_probe_after_dump
> @@ -121,4 +121,4 @@
>  [*] ahb_readl: 0x1e6e2070: 0xf120f286
> -[*] ahb_readl: 0x1e789100: 0x00000000
> -ilpc:  Permissive
> +[*] ahb_readl: 0x1e789100: 0x00000040
> +ilpc:  Restricted
>  [*] ahb_readl: 0x1e6e2070: 0xf120f286
> ```

So something (it's unclear to me whether the BMC has rebooted in your
test here) has set the bit to disable writes via the iLPC2AHB bridge.

The reason I ask for the strace above is the mmiotrace output in the
github issue only shows a couple of accesses to the P2A. I'm wondering
whether gigaflash is exploiting iLPC2AHB and LPC FW/MEM cycles instead
(or perhaps I need to improve my understanding of the limits of
mmiotrace).

>=20
> The result is both very encouraging and also disappointing, because as yo=
u
> intially theorized, the BMC boots fine with OpenBMC flashed onto it - but=
 none
> of its host system manmagement capabilities actually work. I do have the
> vanilla OpenBMC web application available now, with DHCP, DNS, NTP et al.
> working fine for the BMC, can log in via SSH, but all the peripherals the=
 BMC
> ought to be able to manage and hook into do not work at present.

Yes, this is expected. Configuring the BMC applications to match the
integration into the board is the biggest challenge.

>=20
>=20
> The next step that I would want to take is that I find a way to revert to=
 the
> BMC stock fw with having only OpenBMC running, since the host apparently =
cannot
> boot any more (same situation as with the stock BMC fw when u-boot had
> initialized, but no BMC system was allowed to boot up, afaict - the power
> button/contacts just do nothing) in this state. After that, I would like =
to
> establish a sane (and hopefully easy) way to convert the board's BMC firm=
ware
> from OpenBMC to stock, and vice versa.

The least-effort hack would be to place the stock firmware at
/run/initramfs/image-bmc and reboot OpenBMC - this will write the stock
firmware image back to the flash for you.

>=20
> Once I have established a surefire and straightfoward way to do what I ha=
ve
> done in such meandering and clumsy attempts, I would like to learn more a=
bout
> how the "M" is actually put into this whole "BMC" thing, and see how far =
I can
> take that. The stock fw has some interesting description files regarding =
i2c
> configs that might come in handy, but I am just not educated enough (yet,=
 I
> hope) to make real sense of it :)

Yeah, the I2C configs will certainly help.

Breaking into the stock firmware on the hardware and tracing things
like GPIO accesses would go a long way. With the tools at hand it
shouldn't be too difficult :)

>=20
> Can you perhaps offer me advice on how to flash arbitrary new SPI flash
> contents from either OpenBMC's u-boot or an OpenBMC root shell, or what I=
 would
> need to look at in detail to learn how to do that?

See the comment above regarding /run/initramfs/image-bmc. However you
can also boot to an initrd and use flashcp. The main thing is you need
to make sure no other accesses to the mtd device are taking place
(hence suggesting the initrd environment).

Andrew
