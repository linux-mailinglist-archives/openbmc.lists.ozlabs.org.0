Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB733DF9FC
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 05:29:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gfcfc5h1Jz3bX3
	for <lists+openbmc@lfdr.de>; Wed,  4 Aug 2021 13:29:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=B74bIBu3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WQCKm2bd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=B74bIBu3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=WQCKm2bd; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfcfM0Jv5z2yYJ
 for <openbmc@lists.ozlabs.org>; Wed,  4 Aug 2021 13:28:59 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B7585C0129;
 Tue,  3 Aug 2021 23:28:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 03 Aug 2021 23:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=VJ8odbqD+Dse1DcVlLd0zu5uTMM
 EqZUulLJ/xYEBRlY=; b=B74bIBu3lOHDQZrq6nKW56Pc/mgyEpqkTtWhElicMbr
 s1ezKexHzWzqmdEIk1/XsxxljpVpHfkK+0a9fmXtxeWO/+He3aq+rGPLA/7M2f3N
 6PLcHLDMGhHZOjnsxoLXqTtmFdlFIG9h16eh7QGCtyq8M1R/u0RNSmH7BhIl+9Rv
 H4QWOE5ppPqtNn0a/iAjJFG2XhzC7ptVS5IMB0YhvfDilEVI/io9eoAF2aYlanvk
 JP4QwvuPOXjCcNT4vEO/fOGDfXX9LdqKHbvdsESOQnzZ7uZsqdXnkAMRWObjIz2K
 G+EIoUzLWVryXE7lnr4SI49AVP9qEi8tYNCqufWvkxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VJ8odb
 qD+Dse1DcVlLd0zu5uTMMEqZUulLJ/xYEBRlY=; b=WQCKm2bdsFpxwZHXdFmxhJ
 oiCnfOxMk4Bg31YpXDC36FrijwTgdPFFDvg5SS2zbw+YZ988S4BSl3QVaZcCWWEK
 Et1HJeOBfR6JblxD9C/7DXpUH9N6gAuLq9NIm4Zrr8BPqK6MAi8El7onRIsoyHq5
 sd49I7Dja2cIbE9dMhwvoUrknWTgxP0cySkKSubRh6+a5BlVAejx+7g3AiBEMyle
 AGrzh6NPQki5VrOe/j90x02+eMOBhLlyy3+J3rmfUIveqEUny4nzJCx6IN/aNi+Y
 1lYsPSJmBg7aTMdZmS22iWrYB7FH/+d3NpX+TGUBTc9dRVkJGUBl1v7szIZ6/CJA
 ==
X-ME-Sender: <xms:eAkKYR7TfVQnhb-zzD4nDAYQ9tNOfg7FUXsIZ6jzpRyxq5sBUkY_8w>
 <xme:eAkKYe7z3fBnIyKNPfDOgOYnodQWc9IeOxDgt50hOtgtK97oy3kU0fW2IinrBbhU7
 CGBC5vN_hHAvAUxvU4>
X-ME-Received: <xmr:eAkKYYcIcTI4mgrcKvhnmqS4I-oktlYPzlRJueXadJc983EOltCxVzMn7rpm9vBQr5jd_rU4fxaeegaY5izUzDcW_6liHqCtDMGddsqlhv_Luw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieehgdeijecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduudefleeuhefhleehjeejgfeujeeh
 hfdtledufeehkeduudevkeeiuddugfegkeenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:eAkKYaJXITux7RYGrfQWaoD3od_NoeGXRyQndwXqTvqJ1QyIO0HPxg>
 <xmx:eAkKYVKgiaMisCl3OjgWwWrJmHFJcrr3I1q7KaO-ubWmyEx_rNlInQ>
 <xmx:eAkKYTyLIbAnya9iPY61skOdqqCJQtBAayLikGbkHTrD8qs6hbVNYg>
 <xmx:eQkKYXwPrvFykTLOH_I_lJX3yhCSjGocpEsk5Koi46MKV8T_wI5JKQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 23:28:54 -0400 (EDT)
Date: Tue, 3 Aug 2021 22:28:47 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday August 4
Message-ID: <YQoJb72EMj1Sk1Lg@heinlein>
References: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/5ayGqijRQElnH//"
Content-Disposition: inline
In-Reply-To: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--/5ayGqijRQElnH//
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 03, 2021 at 05:57:52PM -0500, Joseph Reynolds wrote:
>  2. (Joseph): Updated password hash algorithm from MD5 to SHA512 (while
>     keeping the same cleartext password)
>     https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/45214
>     <https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/45214>

The big hangup on this one right now is that there are tons of overrides of
EXTRA_USERS_PARAMS in a bunch of `local.conf.sample` files.  Does anyone kn=
ow
why these are there rather than relying on the ones we get for free from the
meta-phosphor layer?  Does anyone have a problem if they are removed?

```
$ find -name local.conf.sample | xargs grep usermod -B1
=2E/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample-EXTRA_=
USERS_PARAMS =3D " \
=2E/meta-evb/meta-evb-aspeed/meta-evb-ast2500/conf/local.conf.sample:  user=
mod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-evb/meta-evb-aspeed/meta-evb-ast2600/conf/local.conf.sample-EXTRA_=
USERS_PARAMS =3D " \
=2E/meta-evb/meta-evb-aspeed/meta-evb-ast2600/conf/local.conf.sample:  user=
mod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-evb/meta-evb-enclustra/meta-evb-zx3-pm3/conf/local.conf.sample-EXT=
RA_USERS_PARAMS =3D " \
=2E/meta-evb/meta-evb-enclustra/meta-evb-zx3-pm3/conf/local.conf.sample:  u=
sermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-evb/meta-evb-nuvoton/meta-evb-npcm750/conf/local.conf.sample-EXTRA=
_USERS_PARAMS =3D " \
=2E/meta-evb/meta-evb-nuvoton/meta-evb-npcm750/conf/local.conf.sample:  use=
rmod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-evb/meta-evb-raspberrypi/conf/local.conf.sample-EXTRA_USERS_PARAMS=
 =3D " \
=2E/meta-evb/meta-evb-raspberrypi/conf/local.conf.sample:  usermod -p '\$1\=
$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-facebook/meta-tiogapass/conf/local.conf.sample-EXTRA_USERS_PARAMS =
=3D " \
=2E/meta-facebook/meta-tiogapass/conf/local.conf.sample:  usermod -p '\$1\$=
UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-facebook/meta-yosemitev2/conf/local.conf.sample-EXTRA_USERS_PARAMS=
 =3D " \
=2E/meta-facebook/meta-yosemitev2/conf/local.conf.sample:  usermod -p '\$1\=
$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-facebook/meta-bletchley/conf/local.conf.sample-EXTRA_USERS_PARAMS =
=3D " \
=2E/meta-facebook/meta-bletchley/conf/local.conf.sample:  usermod -p '\$1\$=
UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-hxt/meta-stardragon4800-rep2/conf/local.conf.sample-EXTRA_USERS_PA=
RAMS =3D " \
=2E/meta-hxt/meta-stardragon4800-rep2/conf/local.conf.sample:  usermod -p '=
\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-inspur/meta-on5263m5/conf/local.conf.sample-EXTRA_USERS_PARAMS =3D=
 " \
=2E/meta-inspur/meta-on5263m5/conf/local.conf.sample:  usermod -p '\$1\$UGM=
qyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-inventec/meta-lanyang/conf/local.conf.sample-EXTRA_USERS_PARAMS =
=3D " \
=2E/meta-inventec/meta-lanyang/conf/local.conf.sample:  usermod -p '\$1\$UG=
MqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-portwell/meta-neptune/conf/local.conf.sample-EXTRA_USERS_PARAMS =
=3D " \
=2E/meta-portwell/meta-neptune/conf/local.conf.sample:  usermod -p '\$1\$UG=
MqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-qualcomm/meta-centriq2400-rep/conf/local.conf.sample-EXTRA_USERS_P=
ARAMS =3D " \
=2E/meta-qualcomm/meta-centriq2400-rep/conf/local.conf.sample:  usermod -p =
'\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-quanta/meta-q71l/conf/local.conf.sample-EXTRA_USERS_PARAMS =3D " \
=2E/meta-quanta/meta-q71l/conf/local.conf.sample:  usermod -p '\$1\$UGMqyqd=
G\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-lenovo/meta-hr630/conf/local.conf.sample-EXTRA_USERS_PARAMS =3D " \
=2E/meta-lenovo/meta-hr630/conf/local.conf.sample:  usermod -p '\$1\$UGMqyq=
dG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-lenovo/meta-hr855xg2/conf/local.conf.sample-EXTRA_USERS_PARAMS =3D=
 " \
=2E/meta-lenovo/meta-hr855xg2/conf/local.conf.sample:  usermod -p '\$1\$UGM=
qyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-microsoft/meta-olympus/conf/local.conf.sample-EXTRA_USERS_PARAMS =
=3D " \
=2E/meta-microsoft/meta-olympus/conf/local.conf.sample:  usermod -p '\$1\$U=
GMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-hpe/meta-dl360poc/conf/local.conf.sample-EXTRA_USERS_PARAMS =3D " \
=2E/meta-hpe/meta-dl360poc/conf/local.conf.sample:  usermod -p '\$1\$UGMqyq=
dG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-supermicro/meta-x11spi/conf/local.conf.sample-EXTRA_USERS_PARAMS =
=3D " \
=2E/meta-supermicro/meta-x11spi/conf/local.conf.sample:  usermod -p '\$1\$U=
GMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
--
=2E/meta-asrock/meta-e3c246d4i/conf/local.conf.sample-EXTRA_USERS_PARAMS =
=3D " \
=2E/meta-asrock/meta-e3c246d4i/conf/local.conf.sample:  usermod -p '\$1\$UG=
MqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
```

My feeling is that the majority of them can be removed and were probably ju=
st
copy/paste jobs from somewhere else.  The only ones that we may need to
reconsider are the ones in meta-evb because I'm not 100% convinced that tho=
se
machines always use meta-phosphor.

I haven't had time to yet, but I would suggest just making a commit to dele=
te
all of these and see who is outraged by it.

--=20
Patrick Williams

--/5ayGqijRQElnH//
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmEKCW8ACgkQqwNHzC0A
wRnCzg/+P4GA0YPZ6tqZxY4V1Ny92FLN9Pm4aG+s3wzoBw6Tn9JuMU2YZMF7SkaW
7v97cGjwNjDJEiY9bohnOn5OGjzt9NL8DbJWodH/ly14qs6jy0pj8m7VQhGplW2o
IPn3EUVLSk6JFAjzH7wscz/hhLWj5+GmvBNLdk6SBrzg2UYDiSe3TrpS5okjFgy5
wUT3Kv2PJB+xDz+dJw9PU9cWiN2+pm6/Xni4k58J4CBvUV5DtwYuN5wNlz+L0xZ8
oiHGiIl1zXZyU0xIQHK54jCkci1ffIQ5F3kMX6iwhikhEEm1qKwKYOwKzKFyrjoY
DUNePxbB8CZ9RXzQ7gms6L5H/yZu/qyWtdgfMLJalLfWDpEipgP1728qSph1IRM/
kXDD6CsIqFQTKIns321bnDvJMs2SBTstVMAagXOzhlVXt5tGJ79vwAjpTGFEkrXK
mLcDz4zL0EmiB3R5Fc0Bi+Q86z5r+0SWEunZsRQ0ZSg9LO4cCZKMbeDIwD6BRBgV
sNS+RCCfB+7eJj8jzpOgTI+VMy5+uOm48kVPRBxCWh9VrXzf3V4XKb5j7bOPK3tN
fPj3EXbGXzBzszoyB1nXcn6PEkheqojCgwdwgN7i7XsTTQyuwnPbFr3UearDH5ns
rfqeVMO9qq+XVn5AyEepKcxVBRqHkjbS530D6WdDuuzyTonR8yM=
=AzqB
-----END PGP SIGNATURE-----

--/5ayGqijRQElnH//--
