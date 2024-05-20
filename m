Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 63BEB8CA54F
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2024 02:06:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=Y7w14h5o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vjvdv2S17z3g1q
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2024 09:58:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=Y7w14h5o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=truschnigg.info (client-ip=89.163.150.210; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org)
X-Greylist: delayed 106 seconds by postgrey-1.37 at boromir; Tue, 21 May 2024 03:34:30 AEST
Received: from truschnigg.info (truschnigg.info [89.163.150.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vjl7B4yTgz3frJ
	for <openbmc@lists.ozlabs.org>; Tue, 21 May 2024 03:34:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=truschnigg.info;
	s=m22; t=1716226358;
	bh=K25UrvTj/AnMzMqabP1xMdrSsI08Bvvc88pPspGAZ0k=;
	h=Date:From:To:Subject:From;
	b=Y7w14h5oF/THlSL0Dgq/3T4C424yi6loq8y9v8OkMnJM7vuPGusJCuu3BL6VqFMSn
	 NhOKubo4usElINLmflXDUjP8cbYdkuziwP3fYQTG1ViPjlP6MFzQ09EzNq9IzlCyXO
	 HvJZizR+XyXpkehmwvJXNjGXYKUzYL3f6QhIeYGgKOZoqobk1t2zwGWOKjRtxpnGA5
	 1wSSgHRDyNl92NN2jAdSD//Qf2XqtbSNQh03jdMuTJkj+yp6otzhwmf3XDK/tQwgq4
	 uF/ywG0sAQudBTJrpktbxu1mVB2QhE6J4Ve864T3qtXrNXkyqVwqvooN6S6KOCXDkI
	 /uTcTMbXkoFEQ==
Received: from vault.lan (unknown [IPv6:2a02:1748:fafe:cf3f:1eb7:2cff:fe02:8261])
	by truschnigg.info (Postfix) with ESMTPSA id 60750201D8
	for <openbmc@lists.ozlabs.org>; Mon, 20 May 2024 17:32:38 +0000 (UTC)
Date: Mon, 20 May 2024 19:32:36 +0200
From: Johannes Truschnigg <johannes@truschnigg.info>
To: openbmc@lists.ozlabs.org
Subject: OpenBMC replacing AMI AST2500 BMC fw on Gigabyte MC12-LE0 - questions
Message-ID: <ZkuJNJ9kFrRS3mQF@vault.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DrsR7diDFB0ew+0y"
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 21 May 2024 09:57:44 +1000
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


--DrsR7diDFB0ew+0y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Dear list,

I am new to this whole BMC-innards thing, and the very opposite of familiar
with embedded devices, so please bear with me on this :)

I have a Gigabyte MC12-LE0[0] mainboard in hand, which has an AST2500-based
integrated BMC running AMI-supplied (mildly customized, I gather) BMC firmw=
are.
I would very much like to try to get OpenBMC to boot on this BMC instead of=
 the
stock fw, but have hit a number of walls during my first baby steps with th=
is
over the last few days, which is why I turn to you to seek help and guidanc=
e.

The BMC implementation seems lean very much onto the AST2500 Evaluation Boa=
rd
(the unchanged name pops up in a number of places in the stock firmware), s=
o I
would guess that the OpenBMC evb-ast2500 machine should be able to get
somewhere (and even if it's just to see OpenBMC's instead of AMI's Linux st=
art,
and then crash hard due to some subtle incompatibility :)) at least.

Afaict, the AMI BMC firmware lineage uses another (custom, undisclosed?) im=
age
format that seems to be called "FMH" internally. While there are some third
party tools[1] and patches to support it[2] floating around on the net, I
failed to get anywhere with either until now.


My understanding is that there are two paths forward:

1.) To make OpenBMC's build artifacts into FMH-style BLOBs, and find a way =
to
feed them to the stock fw's u-boot, which would ideally result in OpenBMC b=
eing
able to boot this way.

2.) To replace the stock fw's u-boot release with an OpenBMC u-boot that can
load the evb-ast2500 artifacts natively, and have the BMC boot OpenBMC that
way.

Can you please confirm that this assessment is sane, or correct me if it is=
n't?

If so, I would presume option 2.) to be the easier road to travel, but I am
somewhat stumped as to how I can get OpenBMC's u-boot onto the BMC, *ideall=
y*
(but not necessarily) in a non-destructive way (as I do not know how to or =
have
a way to revert to the original state without access to the bootloader or e=
ven
stock firmware running).

So far, I tried to put the u-boot-evb-ast2500-v2019.04+git-r0.bin artifact =
=66rom
my OpenBMC build results into a memory location on the BMC using TFTP, and =
`go`
to that address afterwards - but that effectively reloaded the *original*
u-boot from the vendor fw. I don't know enough about the inner workings of =
an
AST2500 or u-boot (or any other embedded bootloader, really), but if you co=
uld
enlighten me as to what has happened there, I'd be very grateful (... maybe
u-boot does a check if it's already reloacted itself towards end of phys.
memory, and directly jump there if that is deemed the case?) Do you have any
hints how I could achieve what I am trying to do? Is this even feasible?

I did find a Github issue[3] from 2017 which hints at others having tried
something like this, but no documented successes.

I'd be very grateful for your input on this matter. Please keep my address =
CC'd
as I am currently not subscribed to this list.

Thank you all very much for your time reading this! :)


PS: I've included some potentially useful u-boot monitor output from the st=
ock
firmware at [4], as I am not sure if attachments of this size (or inline te=
xt)
would be OK on-list.


[0]: https://www.gigabyte.com/Enterprise/Server-Motherboard/MC12-LE0-rev-1x
[1]: https://github.com/ya-mouse/bmc-ami
[2]: https://github.com/ami-megarac/OSSW/blob/master/SPX-12/Kernel_amiext_e=
x-src/12-drivers_mtd_maps_fmh.h
[3]: https://github.com/openbmc/openbmc/issues/1649
[4]: https://paste.debian.net/hidden/43509e70/

--=20
with best regards:
- Johannes Truschnigg ( johannes@truschnigg.info )

www:   https://johannes.truschnigg.info/

--DrsR7diDFB0ew+0y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGu9IhkI+7/aKLUWF95W3jMsYfLUFAmZLiTAACgkQ95W3jMsY
fLXwpg/8CXhNaD0NgDMgBmnZzdRNsMDyHwsPHkRW45vkulJgkPEHxueiyAX9rEO2
OnmELM0i7M4LxzuF88BtwsfyTTOhL4hCLlFuuutRWhoGNrx1ZaW+D0kWE9aya5oi
adpHgmVG+fFKCzpn0JKZCgNGIYVH3FL56eHFMWgHp3LfSsyRVjRMGX2yrXizmJQp
jc5Ilw2Kxs45S7/eI1986BfIvKcE/L4BWQBMlqCfCXP3+wfO3bblxy49JX7j77H/
yv3Vyc6E5AKi6++UIyuwzk0XnFrvzgAgGaBpKv5JTcbj9Lyda4S4lg42tlnzZ2FW
TlYTHIOp2DgKJvUSKTMDi5Tma0ql2rW8n+gonaoP7184j6h51UcHVqH8hTa7QaxJ
YhDXuFtUJh7hZ5uPEHCeTKhm/BUVOjTRx+ah4OMg8P1QiYmvwrxQxRrj5ffbSVeq
n7vx/q4nzjE5kBWigZ1ToSE8LEWy+0/BMUCAAJieCcDDvImRZo0Q5lpETdSYLNEz
/jtx28/+RVjtuhopqlbOqTOIPJyl8KmkIiVq1K/H8Bu6ImJw542X4zddsLU3j2MT
zPSoC6rCA4zbjJ+h/uww1tD1FIEzmlToGjZdXbzXlJX9QthidYMEGvOs6LBvPvD/
6GwILSuy/NtnD/R3GQyODHOtL0gQHs7cQsM4iyyE9cetzY5X9Zg=
=8wQy
-----END PGP SIGNATURE-----

--DrsR7diDFB0ew+0y--
