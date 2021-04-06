Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E81355E49
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 23:59:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFLz23sk0z30Cs
	for <lists+openbmc@lfdr.de>; Wed,  7 Apr 2021 07:59:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=ZJ63vrne;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.15.15; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=ZJ63vrne; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFLyn3Mw5z2yRP
 for <openbmc@lists.ozlabs.org>; Wed,  7 Apr 2021 07:59:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617746340;
 bh=HTprFb9yvRvBoW3G9/dHX/fAH1KOecMkyEVg4p7DniY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ZJ63vrne6ocuY+SPF3t/R1FivYXLy591gJug7O57oIqsTqhLaFrghJ0BOaHU1RBYe
 S2LvC+hFgXMYsMNQjRCi4fbYzmqK109n6Havy1k4wqsPNx7QuhfKz75uZtf6rdLD5B
 kHutqOCrMnkXXiDppTYxXqYnd3THBTFtC5rRC/2Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfYPi-1m58E0081w-00fy9g; Tue, 06
 Apr 2021 23:59:00 +0200
Date: Tue, 6 Apr 2021 23:58:57 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 00/10] Initial support for Nuvoton WPCM450 BMC SoC
Message-ID: <YGzZofPvT80b5gS5@latitude>
References: <20210406120921.2484986-1-j.neuschaefer@gmx.net>
 <CAK8P3a0VfnUucvZNkA9PdxrWiYUOkisV00v-375PmgQYp4aXoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WN3Z533fK2dw1UDf"
Content-Disposition: inline
In-Reply-To: <CAK8P3a0VfnUucvZNkA9PdxrWiYUOkisV00v-375PmgQYp4aXoQ@mail.gmail.com>
X-Provags-ID: V03:K1:5gcOpCHQmH2HH66wHlC3bdbl5uTQY68EaHslQFlMiXdwu1yPMGu
 XAZOwdk8oXIK9z0Mq3J2eD6QiO+K24Z4WIcQGjnOv7DDxr0C08MTAuPsRQe0Ztl9Fd0n1vU
 Y399EkErkUPzQwjmRICQPQQoStkG62g0HnWFpta2wwMupvF+e9YHjP4w7IgLElXNEsm3MRW
 Yx3pl3jKTNt0ELRrwtTbg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:lwS1WdEU8AI=:AgUACw6w7/JwB/hgyaWAKV
 GaNzw+AyvPWWXF4SBfzVn3otv+6VJzWvTAi+xc9QrVaXserhQxCksqGEPLj32XmzIfFoCp7G5
 rAPCkYAq3aGQ6pnlu/74O9DdMj8l0PeX/98c4Tsw2OjrX+dlgTi2/JqVwTl5oBjOD4wd0BpLD
 ZqOzPKnf7XGhP8gFZ3BL6M3Ag+HMbqJ3z8s/4O2M/Q3qjLLYymv4LPLOL0pG8V1+UtLNE/00d
 /K6Nc0BlINjOu0ue0DRsUjAlnPi54azecv9V2MIhXpGiJKVuGoa0ITJG2NTmtChUqMfM41Ot3
 bjqT5X3Z/TxjrPA+Sc9p24ifc1i3MAzzSPnMXJsH44qDgHCgc4bFfcCvwSeuVsw2t5Rm+MYlS
 lykBDpuFxVok6REdoI7JpcmYW7otQRYABFFQjK8RIsnX9hITMY6WvGkQv17AXT+cQvGR1LGpa
 fFj4WM2cbwrBUQz1YhX0GUzYjegrUGeOJISd42JjcKWbUpiSaAAeQlDWOWcr4j9dgjeucj3Vk
 IdW22rEZ0TKHlyxiJawJciAhWitHMFTsEMXFnTDbD1Mxigk2O/bVRZvh99D0ZiP270UIvelts
 LYlN7hAsiKeReyqoBbA3gK5oPt4iQjyXqJ9potZOg8B5L71gkQEbdQhpmd1ovVXW16fixMuf4
 8wpxwXXKC8PLy0Hu6ODBHDhEBaU5XM6bkBUeJipr2SiVm5cs2lrxDL2LzWt+bB58ZFjMX3f7u
 f7lrl/qSH+EcNEHMF9gw6lD6e+ZQI0EN/0OonZQAgY3pSv2qJs2+xzlneIPLDASdEX2YtAE3w
 XT5i4w9SaPrjg3USRX2VGmrID3D4TfMO/9BXDqSD2EhFQI5+KTF7b+F6tAcjrxu99eflaZGYy
 GdTw4wCjB0Cd/wcWkYXHjtYBB4NXmBdTcPFpN8/sO9L8Bypj4fP36/TdpR5UUrQ3vYjODRqSy
 htxSX+ZQL1DAfCj+bvrn+1DHWzfnqXG166eXNoJ7diEyH9S0ASQJVp8DunuIQwtliD8wJWGLw
 oOs19Ed9DXMMpeRvgJF6J0cScoS+eYJg3fMLZDOQPdiBzz3oxBy0nzJpWjK4O4aFX1tT30IiE
 t2fckz4ADTpsP5ad6G7menqFZn+miL89AAGnXKj46lfeXPSfhkWhLZgMFqrzlWqNhni1SJN9/
 YTW6Qgf3YgjVkxURbujSe4oIywYCODJQ5b3L6rXA/x3Fo3CzgRnY3KISMqhzJLW9NQbzFNBhn
 qG1nHPjyHBbIZlr5d
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
Cc: DTML <devicetree@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--WN3Z533fK2dw1UDf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 06, 2021 at 05:15:01PM +0200, Arnd Bergmann wrote:
> On Tue, Apr 6, 2021 at 2:09 PM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> >
> > This series adds basic support for the Nuvoton WPCM450 BMC SoC. It's an=
 older
> > SoC but still commonly found on eBay, mostly in Supermicro X9 server bo=
ards.
> >
> > Third-party documentation is available at: https://github.com/neuschaef=
er/wpcm450/wiki
> >
> > Patches 1-4 add devicetree bindings for the WPCM450 SoC and its various=
 parts.
> > Patches 5-7 add arch and driver support. Patches 8 and 9 add a devicetr=
ee for
> > the SoC and a board based on it. Patch 10 finally updates the MAINTAINE=
RS file.
> >
> > Patch 2 requires "dt-bindings: arm: Convert nuvoton,npcm750 binding to =
YAML"
> > (https://lore.kernel.org/lkml/20210320164023.614059-1-j.neuschaefer@gmx=
=2Enet/)
>=20
> Hi Jonathan,
>=20
> It appears these patches are doing roughly the right thing, and we may st=
ill
> be able to get them into v5.13, but I'm not sure what your plan for maint=
aining
> them is. The two options are that you either send your patches to be pick=
ed up
> by Joel, or you send everything directly to soc@kernel.org once it's fully
> reviewed.

The route via Joel sounds alright with me. I've Cc'd him on this version
of the series.

> I only noticed your series when patch 9/10 made it into the soc@kernel.org
> patchwork because of the Cc, but none of the other ones did.
>=20
> If you end up with the second option, we can go through what this involves
> off-list.
>=20
> Regarding the Cc:soc@kernel.org, please add that only for patches that
> are already reviewed and ready to be picked up, ideally with a cover lett=
er
> that describes what the plan is for merging. If you need me to review the
> platform code, use my arnd@arndb.de or arnd@kernel.org addresses.

Ah sorry, soc@kernel.org slipped in automatically because of get_maintainer=
s.pl.

The platform code[1] is rather simple, essentially just hooking up the
nuvoton,wpcm450 compatible string.


Thanks,
Jonathan


[1]: https://lore.kernel.org/lkml/20210406120921.2484986-6-j.neuschaefer@gm=
x.net/

--WN3Z533fK2dw1UDf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBs2Y0ACgkQCDBEmo7z
X9suURAAuUHlH2kJ/uuM/4HlCCKWBuZ/sYW7xJ61HDfk1IAUiWMQiz8scjXpwJwS
K+79pQaCaxHvjReE8KAkziPdG0pkgyCg0HNojFs5F9ihpm5BS3BPgNTnofsVUBr5
UCSe/EKJSgOuGiPs3CXQMYnqbnIbBpLgqpce0QyOlxUjzU/5GV2QHvsksgO1z296
vgEYRwj11fveE4mtlEjvKPZ+gKUjuwvzDOXCGtmmVPTj+ogC2IRFxDGkmky67z2g
FSE9v6Esljj9kBCKkScpRqASIkk7EzSf06D/IR7VP39E5NjnR/JtuyLCnlRplDAl
Pigvs6mVp+NJNqfMwmHcsUwfEg/fmLOhhSM25w10DYHrCM7Sb5zoqotdZyl5Vp9A
f9p/sYeUrCqBrBCBud6W19pIZwIKPk5b5z22cjEayJJD0+KZ9snC8acrhTLBHvhx
KU6Gn3K9bXiqGJKbH1SlsFcympSs9/8YjeY8RiM7xL10Rq37xH7D7+V8pLwyciNv
6hNQotcNgV87mg71nvwdblt7dZUAyUwvIae+MU8q8TrNkvssZzYGZRR07FSDEpk6
Hx/AiAxGK3pXpD/ycfoDUXd6Xyp8vftGISold3qGpmDp/3iky8Ot66YpXVzDZ3Hn
oiymkHp0epFTY0p3D2bieAbruGpYzAbN2cfF7evnXiqOOOp49Uc=
=BEFd
-----END PGP SIGNATURE-----

--WN3Z533fK2dw1UDf--
