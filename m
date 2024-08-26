Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF0F95F91A
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2024 20:43:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wt01G40W9z30VY
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2024 04:43:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=89.163.150.210
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724697791;
	cv=none; b=Y/uWaUUUBVkiRYOyEuXCOTdv5VSGmKRFo33b06IyQYnHlauB8pjPxhRO7wRQArpm4w4fYwVEu4x3LTRwdQSiern7J14LheuTicrFmTdSI6w+vTVYxaz4PWoO8pBhRf2ByVW9onlYiTDYPzmfjdbDJkOGB44z+319lYCxZT0D4qdSfMSZ7EJB97vO/rhHEyhQJAvI44X3c5Y7Qz+QRnqiGUHHau9kSemeXCUGpftLdAAHbN33FMBY2JC7m4GZfbd1dPjgFvnfmXOJRjfrituziFXx1P01CHIeiAofuIAU/QwOWx9ANRYcNicygT8AyU95aToEUSt1WiUae4X5BldMFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724697791; c=relaxed/relaxed;
	bh=13bEpxcTLQVhi3RrJyd+u6v6KGDEpWPFwnZQPwwAxNU=;
	h=X-Greylist:DKIM-Signature:Received:Date:From:To:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition; b=XooIU9PfohSnMiioTuEO7ucF4aRkX2UOal8nuPRBJM12Zo/OvdaZd9s51XTMVKsNxDuMpxq40vcpf78q/MT5zUavmVjLam/CfsJmJ3TJ6FULMMnXyo5a8B/7T3hRsjKqwasTCum3jMWdIBmejKsbEJmH/rLBu1inGEl55w692/9MF3yE3Hz6Q8tIezrLxGE1WHCIBT8iCPNdMo09HkTKWUAcWlWMbs92ui4I1q29BLd27SSqvfTBoIm9bZk34NsvDTFWh2HeCdcsGX058nMwGq5gxtlXrTqR54Ku21YeKBTSzadAJWi023GqeVgU5CLyt9AjN/HEfeX4SApJQhFjlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info; dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=T6YWWDws; dkim-atps=neutral; spf=pass (client-ip=89.163.150.210; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org) smtp.mailfrom=truschnigg.info
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=T6YWWDws;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=truschnigg.info (client-ip=89.163.150.210; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org)
X-Greylist: delayed 442 seconds by postgrey-1.37 at boromir; Tue, 27 Aug 2024 04:43:10 AEST
Received: from truschnigg.info (truschnigg.info [89.163.150.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wt01B65KXz2yLJ
	for <openbmc@lists.ozlabs.org>; Tue, 27 Aug 2024 04:43:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=truschnigg.info;
	s=m22; t=1724697343;
	bh=zBBy/rUKwvMPqG+k7w6PyDT6h0wqcil3EU77DaRoMLw=;
	h=Date:From:To:Subject:From;
	b=T6YWWDwsADiYOJ3k33xib96HJplDG1GRXh/Ai+p68RPL/atUHlVIt6HrAI2rUuACU
	 tDlLFpwRAUAq2y/Yz5Uu1O05LieIsPiZ3OVbw/K/NzH/0I96w9wVNC5YxD5nEJBxxO
	 Y/qVMJAX1kSsCydDEuXg713SWjrvx6H80PJAS6W1iUoP7SG79kMRuClz/sLbMOgZI+
	 S+sH2xyijfgJojeE0lHdRZczgY7rrmwI35bFIYWHOiMsuUf0KD8DyWaNWu7QxtZkmj
	 YaTv9YtbMR6i3WLq6Cos26YC5rgXC8Q3dZYeaQL1aSxsUX6tnfijEAE9Uzt7rtxY7z
	 u0yCQ4Y929ozw==
Received: from vault.lan (unknown [IPv6:2a02:1748:fafe:cf3f:1eb7:2cff:fe02:8261])
	by truschnigg.info (Postfix) with ESMTPSA id 4F8F2201B2
	for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2024 18:35:43 +0000 (UTC)
Date: Mon, 26 Aug 2024 20:35:41 +0200
From: Johannes Truschnigg <johannes@truschnigg.info>
To: openbmc@lists.ozlabs.org
Subject: Plea for help with GPIO pin naming
Message-ID: <ZszK_Zj1QpH--xv1@vault.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TAbrMjHdI9ANUg2h"
Content-Disposition: inline
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


--TAbrMjHdI9ANUg2h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Dear list,

in my ongoing hobbyist quest to port OpenBMC to the Gigabyte MC12-LE0, I fa=
ce
some challenges that leave me scratching my head - hence me posting here.
Today's questions concern GPIO line names and x86-power-control aka
/usr/bin/power-control.

I've been reverse-engineering my board's GPIO pins for a while now, and onc=
e I
figure out what a particular pin is (probably) actually good and used for, I
most of the time have a hard time identifying the proper name/label for that
particular pin.

I don't have a background in electronics, much less PCB design, but I guess
most line names in OpenBMC's DTS files are lifted verbatim from board
schematics, which I do not have for my board. That, as well as the sprawl of
pin labels and names used between existing platforms and boards, makes it v=
ery
hard for me to infer the meaning of most pins defined for supported OpenBMC
machines.

My research led me to a design document from 2020 with the promising title
"Device Tree GPIO Naming in OpenBMC"[0], but since I can't seem to find the
proposed names in any of OpenBMC meta layers, I guess it always remained a
proposal, without proper uptake in the real world? This hunch of mine is
somewhat exacerbated by the fact that the x86-power-control package assumes
very different pin names in its default example config file[1] (although a
GitHub issue[2] exists that makes it somewhat plausible that might not be 1=
00%
deliberate)...

What I'd like to have is a solid guideline on how to interpret existing boa=
rds'
DTS pin names (unfortunately, I don't know what either of SIO_POWER_GOOD or
PS_PWROK exactly describe, or what the difference between the concepts the =
two
strings of characters map to in the physical world might be), assuming litt=
le
prior knowledge of these dark arts. Is there material on the web that isn't
buried under mountains of mainboard-designer-specific NDAs that could help =
me
with making sense of all the jargon I don't know? I'd be very thankful if
someone could point me a way!

Thanks very much for reading this far! :)

[0]: https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-n=
aming.md
[1]: https://github.com/openbmc/x86-power-control/blob/master/config/power-=
config-host0.json
[2]: https://github.com/openbmc/x86-power-control/issues/4

--=20
with best regards:
- Johannes Truschnigg ( johannes@truschnigg.info )

www:   https://johannes.truschnigg.info/

--TAbrMjHdI9ANUg2h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGu9IhkI+7/aKLUWF95W3jMsYfLUFAmbMyvYACgkQ95W3jMsY
fLWbHQ//bnDRaTiyDZNcyk3rmEm0WCVfwpNrX7cn5mB8crFKoFzVSIHQZ0p8HlxH
hQ5HxwdtmDKGwKtCtQn2/uLENSz0XY1PDk2vzxtAXlH7LfyNUFrz16DTYY2HEBCs
X6wIhHM2cbF/LYZRxBPj6uZI4mhwykiu276g164VKw2s/P2HYIut1/0OBufLr4LN
+grolkXBJamK1bvtRl3KyicIMGFRLvk66oGrU1CJ/iQkMD6R1ql1iQJA/guLQwWp
5J9ftcydYoZcQMfk/HF0ItjH14ZORctnWsnbj5Lw91a3+Jwh3zsaJBG38T8g3XcT
zo+xjkeIuxle73/iKvk6H6VM5Z1wU1rVFsk6WW7l7tFSCZg5YNyH/ZdaVurTbcIn
waYMfbZPb0VJI5/uc2Fhq5lol1T5XVjk+yVbFju8SC4QqRb7yfDLZEMFhtPOvMZx
xEcVbtgKJ0skGTIKm8GiTsTRlQhJSpA5jufLp1EQXB6m9yhofvV7LFueHMWj3jix
SY9j7RdlhjlJBR2Hz4VE1bP5CtgOU/oThN3cg7oWzExn/ugxieLwM39PoPMUilVk
sV+PfMba2JX2yeuPSJpja9ZRZjgceUCCw9uzuENiE1UwFVJUVmcdBPcI/EeiBWqB
ZmwQB0pt8VGruTkniAeOQWfQrkcO+E3oE/BASgUfrxExsRHOHHE=
=QFb2
-----END PGP SIGNATURE-----

--TAbrMjHdI9ANUg2h--
