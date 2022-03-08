Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 383C24D1F2B
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 18:34:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCj9z6mczz3bVP
	for <lists+openbmc@lfdr.de>; Wed,  9 Mar 2022 04:34:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=tvcV+Ls+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DSVm+VHX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=tvcV+Ls+; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=DSVm+VHX; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCj9V1yfZz3bNx
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2022 04:33:49 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 74E295C01A0;
 Tue,  8 Mar 2022 12:33:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 08 Mar 2022 12:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=efrL4j7e+o7VKBATbgagA/L8Ar/jNKUi6ovHiV
 MNEl0=; b=tvcV+Ls+VQSfYm/Q5/IBN5aDWJ5aafx+2y9ZXckaC4xX/ToBuRr5KO
 mJasAjMvEhoMWJ93jjmP7At/8zlsZWsNv097RX+10ssm7l3mYJM9Y3ONqDd1EN5V
 UAe/wHaFmIOuXq9GWkTLOe0jumnZpj16ofZe/OLL3K9udbN31fL5cZBWgD3QKu4M
 Nzwj4CGO0UCUUnwHBGr5BdSjVReVoUkJ/+n12Soi4DHL8z34GtJnebuZMjM04y+W
 5sx0EVgLCmNiyVan9b8itlABFjcZk3to87SHZphWOknOmVHmUbxOFKnLCvTJCjy7
 c3iasiofWBg0ELE4uLW4nVebC9879ncg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=efrL4j7e+o7VKBATb
 gagA/L8Ar/jNKUi6ovHiVMNEl0=; b=DSVm+VHXf3bHGoHvoLF6ELXXycDNfsya4
 EIDADYSpnK14Ikoj/WwG+4lZVFsbgEAsckTWEsB/1qp2sHOApiJVgo/PyO9Zy76B
 jDxX2piS7cn9kIVZ9H1ab7gvvHQ2jd/gr+jZS4AuHs4Y9aG1GVmClOt+a2MI2oVC
 Dr1yci2yf3c3/20LpwKIn4t0T1B8HW6VcGyXjiUP3Y+a6XFyGpQWjeCL3vDvE1LX
 2/23r/GBLFkss973SUZBbQBgEQ+4ce3ahQPvyO288tkiBIYC7m62LJvYiJA9c1mY
 flq++ZWZmh1FZ0XbO8/VZ8penF/0fsx6uYWODjO52U09Y13ncqjEw==
X-ME-Sender: <xms:eZMnYmcbSpm7PbE6N1mNwkKzepzaen2ZuvvXN54Xl47YNaKT20KRNg>
 <xme:eZMnYgNRFrYn-coDGR4I8GNurbYbC4vlxtFcCmxTwjYGbdDo2MeJerJYeDc9gkJ-E
 nbo9_zrdFX6wKtf3PQ>
X-ME-Received: <xmr:eZMnYniIbdQgYqNEWf8JW8Ty5lXijQE6BhwRgAknrrKz_Nl4bdfmLIepHM8ATzeBuUcb5QQ5KcPC8f44YpPdisKnYm5kN7FV>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduiedguddttdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhepff
 fhvffukfhfgggtuggjsehgtdorredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhl
 lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
 hnpeefieekvdejjeehteeggeegfeegffetuefggedtvddugefguefgfeejvdeuvdevveen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrh
 hitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:eZMnYj9Xwv7mK8DPeO50i_QCnV7FvJ012-NVDQbYVysL6jyEJM9wpg>
 <xmx:eZMnYiuEeV-rgP1dl1NBw7BZqWLSQh4FnVlXfGm2qp0wf76wKBANsQ>
 <xmx:eZMnYqGEBnZniJhjSflpt1VJyliRvnHz9BzCo9eRNteYB0q8CUga3Q>
 <xmx:epMnYo08htO7oHsXlKA-YxVvTaUrzlKHvjvQRvBfL3xvzvoX-TNOAQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Mar 2022 12:33:45 -0500 (EST)
Date: Tue, 8 Mar 2022 11:33:44 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: pooky@sysmate.com
Subject: Re: [Help] I want to know how to make an image for w25q256JV flash
 memory.
Message-ID: <YieTeLalmiLBiRnB@heinlein>
References: <000001d831cf$88c2f8e0$9a48eaa0$@sysmate.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k/ZdMR1+ai5fnNbT"
Content-Disposition: inline
In-Reply-To: <000001d831cf$88c2f8e0$9a48eaa0$@sysmate.com>
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


--k/ZdMR1+ai5fnNbT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 12:00:42PM +0900, pooky@sysmate.com wrote:
=20
> I am developing a motherboard using AST2500 chip using openbmc.=20
> It is booting with w25q256JV flash memory attached to the AST2500 chip.
> I want to know how to make an image for w25q256JV flash memory.

That chip is relatively small for our codebase (32MB).  We still have some
machines running that size but we typically have to reduce the features in =
order
to make it fit.

Building an image doesn't really concern itself with the particular model of
chip but the size.  The more important thing for your system is all the
configuration information you need to provide about your motherboard so tha=
t the
software knows how to operate the hardware.

In our repository you'll see a lot of 'meta-*' subdirectories.  Most of the=
se
are the Yocto layers for machines designed by various companies.  These are=
 the
configuration data on those machines.  You may want to take one that looks
similar in design and start with that.

Specifically on your question regarding this chip, the only thing we really=
 need
configured is the FLASH_SIZE variable.  This will build the 32MB image that=
 can
fit into your chip.  Nothing else should care about the specific model beca=
use
u-boot and Linux should use the JEDEC model information to determine the si=
ze of
that chip when they access it.  Here are a number of machines configured wi=
th a
32MB flash layout:

```
$ git grep 'FLASH_SIZE =3D "32768"'
meta-amd/meta-ethanolx/conf/machine/ethanolx.conf:FLASH_SIZE =3D "32768"
meta-asrock/meta-e3c246d4i/conf/machine/e3c246d4i.conf:FLASH_SIZE =3D "3276=
8"
meta-facebook/meta-tiogapass/conf/machine/tiogapass.conf:FLASH_SIZE =3D "32=
768"
meta-facebook/meta-yosemitev2/conf/machine/yosemitev2.conf:FLASH_SIZE =3D "=
32768"
meta-ibm/meta-palmetto/conf/machine/palmetto.conf:FLASH_SIZE =3D "32768"
meta-inspur/meta-on5263m5/conf/machine/on5263m5.conf:FLASH_SIZE =3D "32768"
meta-intel-openbmc/meta-s2600wf/conf/machine/s2600wf.conf:FLASH_SIZE =3D "3=
2768"
meta-nuvoton/conf/machine/evb-npcm750.conf:FLASH_SIZE =3D "32768"
meta-quanta/meta-gsj/conf/machine/gsj.conf:FLASH_SIZE =3D "32768"
meta-quanta/meta-olympus-nuvoton/conf/machine/olympus-nuvoton.conf:FLASH_SI=
ZE =3D "32768"
meta-quanta/meta-q71l/conf/machine/quanta-q71l.conf:FLASH_SIZE =3D "32768"
meta-supermicro/meta-x11spi/conf/machine/x11spi.conf:FLASH_SIZE =3D "32768"
meta-tyan/meta-s7106/conf/machine/s7106.conf:FLASH_SIZE =3D "32768"
meta-tyan/meta-s8036/conf/machine/s8036.conf:FLASH_SIZE =3D "32768"
```

--=20
Patrick Williams

--k/ZdMR1+ai5fnNbT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmInk3cACgkQqwNHzC0A
wRmyPA//XYh8jnbGDBYL5SOQt1PSMZ4tYc1mBjJlVoWlC8intxhvsfSm7Ft22rAy
g0yHA9BekThFKEf+kWo+gEGHo/X4FD0hjhpWp3j7CIVtm86gb1t4SNd6IER/rYvj
McDWZj1BXZhePN23IRsj+8f6Knu8Bmyxma2BvroMzloLZclXmG1SAfFFKbCiqe18
QKgnb/TrK0hlcd0RtD4ZPw05Yk0lApLE4kt51aDbrC81rNH5ddAI1p541y48F7Fl
k9KwUuLyJ6uI+nm9wf2qVdf5LspjMtCSsGTRnk4ZFl6ivUxyLbvKfqHVuiiBqSAd
m9RKq5xy0Rf2duhUdeyavXSCaa+HvTJ/rerifRkz64AUQtRrRw9QnSqcIhbc2iM9
grOjPBznSJmptwz+Fqkwly2AxeR/z9zORK7A/8hRefInb4aZhSS02H10yk7i0KPm
O/BM7Sa0fABISrs9kPQPfdjT+5U8+0JBxXl77MlyhzHdFO2omyjPxUijM5sbsjxM
Z1HEDkmAQasKd/bAH1AhnmYFaXwuZ+8VYqJARgary1cxjKIBwRuDYKj62Fv6zYY4
g4GSYc9c2olpuQ+L4EHe3tsBMoklQeYECoElmyapAsAkk43KtOVUmAwlAbflMYzp
sHgNrJ94/zO8Yd0dIw8KMeG7ItyXMqJoFc1fmKsV5PFDOT+RbxA=
=JuRJ
-----END PGP SIGNATURE-----

--k/ZdMR1+ai5fnNbT--
