Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 172DF92AC86
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2024 01:21:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=VZduAQ9E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJ0VM53Vvz3cVW
	for <lists+openbmc@lfdr.de>; Tue,  9 Jul 2024 09:20:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=VZduAQ9E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=truschnigg.info (client-ip=89.163.150.210; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org)
X-Greylist: delayed 349 seconds by postgrey-1.37 at boromir; Sun, 07 Jul 2024 19:25:16 AEST
Received: from truschnigg.info (truschnigg.info [89.163.150.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WH20X3SjRz2ysX
	for <openbmc@lists.ozlabs.org>; Sun,  7 Jul 2024 19:25:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=truschnigg.info;
	s=m22; t=1720343962;
	bh=2GxS1qXcLAuT/n0Y6aOBXDTUFbNa0RZU9NQH0aMRGpA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=VZduAQ9ELWIwRZ7y0I6HLkIFXDJ6SuxCs/2sCen5AVPMZVeN475BYBHQSip2RSfnV
	 ciUpCIZzhzPXBjGkufELofr9THGCjwHKu8+LoqyTpDT0oMLGH7BtemFixAsIU8TOR8
	 0Ja2d0kVzQccA1Ra40oXnvjRWKuBrf+7BNd05UV0rjnvdmgX3RJ3Dm6mgYOjdZol/u
	 5jnMBPm6dBnmuL+FmNUD/fe9eg/JIY6i++tX5WV5XrsgYtnabot4zosUj7rqsPV0Wf
	 B+o/4O+Tx3AOZizgbrC6PbZQnz3y83ca3VCoVKp7t7mjz2bVx5l4lkoVcdBEVVFkGc
	 +nttu4AfH3Q8w==
Received: from vault.lan (unknown [IPv6:2a02:1748:fafe:cf3f:1eb7:2cff:fe02:8261])
	by truschnigg.info (Postfix) with ESMTPSA id 821E920082
	for <openbmc@lists.ozlabs.org>; Sun,  7 Jul 2024 09:19:22 +0000 (UTC)
Date: Sun, 7 Jul 2024 11:19:20 +0200
From: Johannes Truschnigg <johannes@truschnigg.info>
To: openbmc@lists.ozlabs.org
Subject: Re: OpenBMC replacing AMI AST2500 BMC fw on Gigabyte MC12-LE0 -
 questions
Message-ID: <ZopdmHie3na3U6qi@vault.lan>
References: <ZkuJNJ9kFrRS3mQF@vault.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sv/CXM0b3KIc2HsU"
Content-Disposition: inline
In-Reply-To: <ZkuJNJ9kFrRS3mQF@vault.lan>
X-Mailman-Approved-At: Tue, 09 Jul 2024 09:20:32 +1000
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


--sv/CXM0b3KIc2HsU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey list!

Sorry for my long radio silence -- I've been busy (with other things, but a=
lso)
quietly working at this porting project of mine, and made some imho rather =
cool
progress. I have also, however, hit a few roadblocks I cannot seem to surmo=
unt
on my own, and so I turn to you, dear reader, for advice and/or consolation.

I have my own "meta-gigabyte" layer including a board-specific DTS for u-bo=
ot
and linux-aspeed, with results of those that seem mostly OK. The
ultra-barebones bmcweb function is there, and I have iKVM working.

My plan was to get host power control and the ID button/LED working as a ne=
xt
objective - that way, the most important features from my POV would be ther=
e,
and I would feel OK-ish with publishing what I got. For the past few weeks,=
 I
had been living under the impression that poking GPIO 27 the right way did =
just
that (power up the host), and so I went on to reverse engineer the ID
button/LED stuff with `gpiomon`. I figured out a number of functions this w=
ay:

The Front Panel Header (FPH) Power Button corresponds to GPIO 24.
The FPH Reset Button to GPIO 26.
The FPH ID Button (as well as the board-mounted ID button) to GPIO 134.
HDD LED activity seems to be wired to GPIO 111.
The ID LED on the board itself is controlled via GPIO offset 49.

Having poked at all these GPIOs somehow made my GPIO 27 interaction to boot=
 up
the host ineffective, however. That change persisted and survived even a cy=
cle
of going back to the stock firmware, and then flashing OpenBMC again. I hav=
e no
idea what went wrong there, but I might have since managed to recover/revise
the procedure, and can get the host to power again as a consequence: After a
*ton* of experimentation, I think I also have figure out the proper minimal
sequence of gpioset and gpioget invocations to make the host boot when the =
BMC
is online; it seems to be this magic spell:

# gpioget 0 25; gpioset -m time -D open-source -s 1 0 27=3D1; \
  gpioset 0 25=3D0; gpioget 0 25

(I cannot help but notice that these pins are adjacent to the RESET and POW=
ER
buttons!)

What I am struggling with now is how I should best make x86-power-control o=
r a
functional equivalent benefit from this knowledge, too, and how I can make =
it
manage host power state in my stead. I was hoping that someone on this list
would be both knowledgeable and kind enough to give me advice on how to
proceed. The OpenBMC tree has a number of other machines where a shellscript
that's a machine-specific part of "phosphor-state-manager" does the required
`gpioget`/`gpioget` dance and then uses `busctl` to let the rest of the sys=
tem
know how things are (supposed to be) after that - is that what I should be
purusing, too? Or would it just be a matter of properly naming (*is* there a
canonical (sub)set of GPIO names?) the numeric IDs in the DTS, and I could
expect things to magically fall into place on their own? If there's some
implementation I should be looking at in particular, I'd be happy to do and
then try mimic that.

Also, since right now the FPH pins/buttons don't do anything apart from
registering in gpiomon, I was wondering if it's normal to be the BMC's job =
to
wait for these event firing, and then doing the proper GPIO magic to perform
what the user asked for pressing the respective button. I guess that is what
has to happen, right? If so, can anyone maybe tell me where to look at for =
an
example of how this is set up for an existing, working machine?

Furthermore, I am not sure which other operations I'll still have to figure=
 out
GPIO sequences for. Graceful shutdown (I expect this to have to generate an
ACPI Power Button event in the host, or is there some other magic involved?)
probably, "forced" shutdown/cutting power - but what else? And does anyone =
have
any concrete advice on how to methodically tackle that (find out which GPIO
needs which treatment to generate which event)?


What I also wanted to learn is how I should best integrate my custom .dts a=
nd
resulting .dtb in my machine-specific layer(s), so that both the kernel and
u-boot "pick it up" correctly. The kernel part was relatively easy, since t=
he
build infra seems to automatically include any additional .dts named files
placed in the proper location and be able to use that via setting
'KERNEL_DEVICETREE =3D "gigabyte-mc12-le0.dtb"' (in my instance), but u-boo=
t does
not, and I ended up overwriting arch/arm/dts/ast2500-evb.dts with my own in=
 a
`do_patch:append() {}` block and setting 'UBOOT_DEVICETREE =3D "ast2500-evb=
"' in
my machine config.

I guess the *intended*/preferred way is to upstream the (correct and suffic=
ient
- which I do not have yet) DTS artifacts into both kernel and u-boot, and n=
ot
to have this problem in the first place? Assuming that's not an option for =
now,
how should I *properly* integrate my local modification (actually: addition=
) so
that OpenBMC upstream would be in a position to accept the "meta-gigabyte"
layer including it with good conscience? (That is my eventual goal :))


Thanks a lot for reading this far, and for all the support provided to me o=
ff
and on list to get this closer to actually working! :)

--=20
with best regards:
- Johannes Truschnigg ( johannes@truschnigg.info )

www:   https://johannes.truschnigg.info/

--sv/CXM0b3KIc2HsU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGu9IhkI+7/aKLUWF95W3jMsYfLUFAmaKXZQACgkQ95W3jMsY
fLUbNxAAtwIMroaINg4juo9PuaKd6w2I3eT0H0gE9LXQU3bbR6wE9I4Bp7jByoeJ
UNsMhTkrRvMcySIE0hZXO+2KJNDQktu/HDm3EmUmGR6Ee6j5ktjLiUXRLrJv54cW
3gE/xsNgrUX9cKcrjP27qJI63KH/BoxA7lfbIH8p3ExE1gE1lANmvvgSFVGX4txz
9A0w+rZvDcBm6sMMYtVmhtY1WWH6op3K7ZQ/QzlEfZnRa+QKcYGpkHV74kQMu7Se
MVIQT0Z1xu0JbvP+Eiml+NcP308JSuq1/3Jo8ZA5gCEL7NeaCFOqpFQLuwNT3aEi
mPYVk6JAlLBq7TvZWMhZ7swem57IQKb9r0NCYp1aGoG0Ljpdo1ryDIfKC5UATXiH
RrCis7FnHRQJJEOs+9D+Bvm45kKWu6FxR+Pwp/2+jnroRJ0HCeARxOA8MuXCuBH7
nGHmnsMcqkVOZwLFmnwmOsZwtJEA9jFf2ppR+35CJuTxnarSXgi1bWnptwFCEgRP
OanxekQD56DgBYCrpYZUtHM9nuUtYEkcoLY4bOnHGDuWaYQMyul5447JgkdTDobK
LTV/k89RgsuDgLMSDKOK5NkJE1YW9S0SE/4GMjyLR5efbBe2MInAsgy9oUIhmgOA
8+q1EFL1u1mPusDK/C9AFfn+KbmozFbmerSZQ8Sgur5YunNQPxo=
=pWCl
-----END PGP SIGNATURE-----

--sv/CXM0b3KIc2HsU--
