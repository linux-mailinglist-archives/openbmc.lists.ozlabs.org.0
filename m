Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 195DC8D56A5
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2024 01:55:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=eErIhRyc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr35r1ktSz2yvh
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2024 09:55:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=eErIhRyc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=truschnigg.info (client-ip=89.163.150.210; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org)
Received: from truschnigg.info (truschnigg.info [89.163.150.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vqr3r6PJrz3cVc
	for <openbmc@lists.ozlabs.org>; Fri, 31 May 2024 01:37:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=truschnigg.info;
	s=m22; t=1717083459;
	bh=satO1ECdtRKznhtAbWkeZrDU5uL+52fSOrW5U+b02yU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eErIhRycZU7GMwLIjM8bgRDUGQim0kJGNdvxp7yrv0i+/IJvGuaz8qntVSzh4rwq7
	 N352mKFqVcofh6gELi99iRcY6Vab3jd8DZETOBQWPMtxGfyhIzo5gj7HzSuXlqYOnE
	 GgDViRh8SBlIun1N6UPku/uPXoFwOozn9cqoa3cBwDBGZoKcVKmyEv/tv3LAHYuwmy
	 nxHyQ6X7HgpEiY83EO0Ja4wDp3EWE2xbV0Jxykj0vi5B9VpNpRBYKwEBNqQFYNlILK
	 0Id4fPBnt+aAIPDjYaGoM3QwWePE+stU+eKXtUBqujcb9BOvbh3SSeocLfAGjLGKkE
	 Tzzc+ESViPBwg==
Received: from vault.lan (unknown [IPv6:2a02:1748:fafe:cf3f:1eb7:2cff:fe02:8261])
	by truschnigg.info (Postfix) with ESMTPSA id D37BA20630;
	Thu, 30 May 2024 15:37:38 +0000 (UTC)
Date: Thu, 30 May 2024 17:37:36 +0200
From: Johannes Truschnigg <johannes@truschnigg.info>
To: openbmc@lists.ozlabs.org
Subject: Re: OpenBMC replacing AMI AST2500 BMC fw on Gigabyte MC12-LE0 -
 questions
Message-ID: <ZlidQI_ugTo4Gx_U@vault.lan>
References: <ZkuJNJ9kFrRS3mQF@vault.lan>
 <5e89654a02e2f870b71700c8cd75c2ef371fb579.camel@codeconstruct.com.au>
 <ZkzUX9JPPGAtNa2d@vault.lan>
 <640ed3fcae859ef35f3c57fad6c2f39400d6ef0a.camel@codeconstruct.com.au>
 <ZlTMYkCZhXmRb1av@vault.lan>
 <4b5f7c656fba2bbee92f41922f82903168441aad.camel@codeconstruct.com.au>
 <ZlYkVBwV2Voscqme@vault.lan>
 <9406926919364e4d99c7b207996d455c8e404858.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lNBmx8dyCJKdwBrA"
Content-Disposition: inline
In-Reply-To: <9406926919364e4d99c7b207996d455c8e404858.camel@codeconstruct.com.au>
X-Mailman-Approved-At: Fri, 31 May 2024 09:53:47 +1000
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


--lNBmx8dyCJKdwBrA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi list!

First things first, I wanted to share the good news that I can now boot the
host with OpenBMC running the show on the BMC: Fiddling with GPIO #539 on t=
he
OpenBMC root shell in the right way makes the host power up a few seconds
later. I do it like this for now:

```
echo 539 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio539/direction
echo 0 > /sys/class/gpio/gpio539/value
sleep 1
echo 1 > /sys/class/gpio/gpio539/value
```

I'd like to say thanks to my friend Paul on IRC here in public, because
without your patient guidance and steady flow of information and ideas, this
100% wouldn't have been possible!! :)


For posterity and completeness, this is what culvert has to say about the
BMC's state now that it runs OpenBMC:

```
root@grml ~ # /tmp/culvert -v -v probe
[*] Found 5 registered bridge drivers
[*] Trying bridge driver l2a
[*] Failed to initialise L2A bridge: -95
[*] Trying bridge driver ilpc
[*] Probing ilpc
[*] Probing 0x2e for SuperIO
[*] Unlocking SuperIO: 0
[*] Selecting SuperIO device 2 (SUART1): 0
[*] Found device 255 selected: 0
[*] Locking SuperIO
[*] Probing 0x4e for SuperIO
[*] Unlocking SuperIO: 0
[*] Selecting SuperIO device 2 (SUART1): 0
[*] Found device 255 selected: 0
[*] Locking SuperIO
[*] SuperIO disabled
[*] Trying bridge driver devmem
[*] failed to initialise devmem bridge: -1
[*] Trying bridge driver debug-uart
[*] Unrecognised argument list for debug interface (0)
[*] Trying bridge driver p2a
[*] Probing p2a
[*] Probing for SoC revision registers
[*] ahb_readl: 0x1e6e2004: 0xffffffff
[*] ahb_readl: 0x1e6e207c: 0xffffffff
[*] Found revision 0xffffffff
[*] Revision 0xffffffff is unsupported
[*] Failed P2A probe: -19
[*] Accessing the BMC's AHB via the ilpc bridge
[*] Probing for SoC revision registers
[*] ahb_readl: 0x1e6e2004: 0xffffffff
[*] ahb_readl: 0x1e6e207c: 0xffffffff
[*] Found revision 0xffffffff
[*] Revision 0xffffffff is unsupported
[*] Failed to probe SoC revision: -19
[*] Failed to probe SoC, exiting: -19

```

I haven't tried to execute gigaflash on the booted host yet, but it is on my
list of things to try next.


On Wed, May 29, 2024 at 10:22:09AM +0930, Andrew Jeffery wrote:
> On Tue, 2024-05-28 at 20:37 +0200, Johannes Truschnigg wrote:
> > [...]
> > Understood. Is that always the case for OpenBMC kernel images with defa=
ult
> > config?
>=20
> Depends on what you mean by default. Which platform did you build for?

I built obmc-phosphor-image for evb-ast2500.


> > [...]
>=20
> Right, culvert is likely missing some trick with initialising the flash
> controller. I'm trying to understand what that might be :)

I was hoping you were going to say that! 8-)


> > [...]
> > I do have strace capture of `gigaflash` running for the first time afte=
r a
> > reboot, but all the juicy bits seem to hide behind mmap() anyway, so I =
will
> > only provide it upon request.
>=20
> Well, consider this a request :D What it's mapping is of interest to
> me, along with what it's opening more broadly, and any calls to
> ioperm() or iopl().

I've uploaded the zstd-compressed trace result (it contains a lot of the
actual ROM content dumped with how I called strace/gigaflash) to [0]. I rea=
lly
hope it helps chasing down what you're looking for! :)


> > [...]
>=20
> The least-effort hack would be to place the stock firmware at
> /run/initramfs/image-bmc and reboot OpenBMC - this will write the stock
> firmware image back to the flash for you.

Thanks; this reads like a very easy way to revert to stock - I will play
around with OpenBMC on the physical thing some more before actually trying
that out, though!


> > Once I have established a surefire and straightfoward way to do what I =
have
> > done in such meandering and clumsy attempts, I would like to learn more=
 about
> > how the "M" is actually put into this whole "BMC" thing, and see how fa=
r I can
> > take that. The stock fw has some interesting description files regardin=
g i2c
> > configs that might come in handy, but I am just not educated enough (ye=
t, I
> > hope) to make real sense of it :)
>=20
> Yeah, the I2C configs will certainly help.
>=20
> Breaking into the stock firmware on the hardware and tracing things
> like GPIO accesses would go a long way. With the tools at hand it
> shouldn't be too difficult :)

Yeah that would be cool, but I had established with Paul that the stock fw
kernel doesn't come with debugfs and missing userspace tooling for tracing
syscalls, so it will certainly be a challenge (at least for me, equipped wi=
th
my current skillset, and the time constraints of having a day job with some
other meatspace activity on top of that :D).


> > Can you perhaps offer me advice on how to flash arbitrary new SPI flash
> > contents from either OpenBMC's u-boot or an OpenBMC root shell, or what=
 I would
> > need to look at in detail to learn how to do that?
>=20
> See the comment above regarding /run/initramfs/image-bmc. However you
> can also boot to an initrd and use flashcp. The main thing is you need
> to make sure no other accesses to the mtd device are taking place
> (hence suggesting the initrd environment).

Thanks again also for this! One of my problems is that I have no idea what
userland support utils/components even *exist* for that kind of embedded hw=
, so
I am very much in the dark what my options could be without such hints.


Meanwhile, due to a friendly user on a German web forum who led me to simil=
ar
matters discussed about an ASRock Rack-series motherboard (which also comes
with AST2500 for its BMC purposes), I think I have properly identified the
relevant IC where the BMC's firmware actually resides, and it looks like
SOIC-8 in direct vicinity to the AST2500 itself. I will have some new gear =
for
my electronics drawer delivered soon to see how/if I can deal with it! :)


[0]: https://johannes.truschnigg.info/tmp/strace_gigaflash_initial_.3305.zst

--=20
with best regards:
- Johannes Truschnigg ( johannes@truschnigg.info )

www:   https://johannes.truschnigg.info/

--lNBmx8dyCJKdwBrA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGu9IhkI+7/aKLUWF95W3jMsYfLUFAmZYnT0ACgkQ95W3jMsY
fLVmYBAAvcR31L6VWyx2FQjBK2om10rLECNZeRzg9POktVjgYpa9P9MrcMQygU2P
OFNS3upPnqPsPl8OQn/hWeyxc2TCLQ1wQjGSHdccCBFbPWlGvkrpfn+Hmxawr3z/
3ouQu6+vnQxGUzodhUheFbcVExE92UQP06xfX8Z3uJEuApAS8mJMWJuYTimojlXc
9LfZE26RSkg0f6iUw4/xk4+WwJ9LEd2THrjtpX8oxNr+7+E/T80/qLMr2tOPgLnW
Gw+atfT/4w5KHlHaRjuTlz5jyYiiQC4VZ//my1GR9C3NqGJ1BLX/HFTT9qC4s0vo
F0BECcRIh6d7m+FV9xwk5FFZWixb+PLQgztsf2fdz5EdEyp8kbW85utWUXPdDc30
kP4SFV6MChua3xiS6CBKnF/YvXqEOsvk/u7fzpHuSKXSDs6gIpaL4HBrqAadL80G
pckgf9LpiOyvJ/toRp8pAQfrQBGVF2f8xAP8iflH1Mk7COsW7hhBwuPwbYvBaCis
FAQKD1C41ojJ8hlkr8DEoiaYZPgVpSZIwiDl47KYxaQZKSjAD2iTrflodb9KbZdd
RDXG5If+CQuFRntYz+yhS7TPMA+0GHyX946o8SEkONwSr0eIYhNAwrDiOLzhoj8V
WZGjRlcvAHM4I9l98tiKKPoHxDS3PqFgdnmj+u0cBVjbTXrA8MY=
=i1xV
-----END PGP SIGNATURE-----

--lNBmx8dyCJKdwBrA--
