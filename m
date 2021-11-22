Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8F345937E
	for <lists+openbmc@lfdr.de>; Mon, 22 Nov 2021 17:55:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HyYLN2JCdz301j
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 03:55:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=WPmBCCVe;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Sv58wYTS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=WPmBCCVe; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Sv58wYTS; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyYKz3Vjmz2yZh
 for <openbmc@lists.ozlabs.org>; Tue, 23 Nov 2021 03:55:19 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8FF625C0273;
 Mon, 22 Nov 2021 11:55:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 22 Nov 2021 11:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=u0QbRM5NRka4w8KhhwU9eLMT1/e
 1wZo1X4URTTH/sP4=; b=WPmBCCVeguE82Dlue0kShLsIoguP8gSI+aXRi1sU3Ir
 zTlnDJtbLUPHUuCPyy7HbJOv4A4ZJPS7dJXsp6PyCL5mNuhpqf0alAsngbY4zr2U
 VIY6TD4Ag1nWZvUhSAl6D6vQmQ84yd1JirUcWoE2igJDVTFB6V8x8b1tWm5vEM1V
 Qyg6RSlD8PY1znLvGCV0XzievGuvpcI4UPB4ws23pyUfhuaYYhpidptWhB1YQlB1
 RAc1HH3y4tfr8WDS7NxtubSs10PMMvhqhRfq7oRhP6r97Oq/kvYuFiMBn2RDB+0D
 uIrYlR2hJhF9NNZ6fxYP1aQp9doN2n6K5OueJMrFzcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=u0QbRM
 5NRka4w8KhhwU9eLMT1/e1wZo1X4URTTH/sP4=; b=Sv58wYTSrMkVSBpFAHrXe2
 Zeo1Cl7X/gHqUnJWqYv6QNM39LBIXpTIzAcI7tObaL/D36Jp6LHKJeUcj5aBb99R
 LQYpiDHJ57sLQSP4iE1MyaUoZzMramhcCvwYLBI6pCOZVBi2VW+btZGwMZtRcuQ8
 V0bbQi3SmjTnxxhNYgKM5wW4VrssaH2LUTQslik4j/bXMshFe8QBDqN3pVQ+hAEv
 qMRa3UxIijSPLt3t86W+dTbmxf79L386Rev9TEd/3NdzWD+yxK9RRgmNSw9p7zgz
 zr5N2B/uOMIRJvfxvZ/6N+gdBG8D2vIFmcFrZagumRV9S4ZsGDkN6hXsI/BxhMtQ
 ==
X-ME-Sender: <xms:dcubYfg4qGYKsQSM9gEwZhDqEAO2tKrsAXwdaeD1tZf-9oYRqMy3Hw>
 <xme:dcubYcAtZbWgvEwXZnyExv0kskLISAQXfV7rrdCKb27n2JOhDrdKbF92Ggms2PEI2
 ZskW14OSyBo9EmwjTk>
X-ME-Received: <xmr:dcubYfFSj8fhDW7U28nXlX69NIbkTdXfmY8QBkKGg719wY1QV4CnshML_517T7l5K_3pAl_Vw6vdehP2nN4VcAnOJRCJg1ADzJ-r3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrgeeggdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpedvhfejueduveeuteegvdevudffteeu
 hfeuieejfeffgedvteejkeehleekuddugeenucffohhmrghinhepohhpvghnsghmtgdqph
 hrohhjvggtthdrgiihiidpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:dcubYcRCmnUMEz7jyy2Eq0_xpRhpqO18_rIKNMPN1aJrcn7lrDrt4w>
 <xmx:dcubYcxJnmte3dZvxIDNQtc3VJbK0AX_le3O-CokDBDjcetg7P9ezg>
 <xmx:dcubYS5QqXlH0CWkwChGA3bU_dJyF5WLP1zLvFnmsmPVqCbH16Y1QA>
 <xmx:dcubYY9N7uXCfWsPgg7PIM__-PB5lsj3vZYETNvc8C66RFJrkE87GQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Nov 2021 11:55:17 -0500 (EST)
Date: Mon, 22 Nov 2021 10:55:16 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Oskar Senft <osk@google.com>
Subject: Re: Making obmc-console_git.bb more generic (again)?
Message-ID: <YZvLdFJnQM+GB9yy@heinlein>
References: <CABoTLcRtPYy_Yim20FCcX6qS--t7KD81GOZyT9pKV8OwuhLPrg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wvlfmXBJ0qdPHCUs"
Content-Disposition: inline
In-Reply-To: <CABoTLcRtPYy_Yim20FCcX6qS--t7KD81GOZyT9pKV8OwuhLPrg@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--wvlfmXBJ0qdPHCUs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2021 at 05:01:25PM -0500, Oskar Senft wrote:
> Hi everyone
>=20
> I noticed that as of
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/30369 (aka
> https://github.com/openbmc/openbmc/commit/abf95efe7c3a34cc2e5d7424abb5971=
0fb4a1d4d),
> obmc-console_git.bb assumes that we always want to use ttyVUART0.

There was a push to move service files outside of the openbmc/openbmc repos=
itory
and into the underlying repos.  Brad could comment on why as he was
asking for it.

> We used to have support for OBMC_CONSOLE_HOST_TTY and then create the
> symlink /etc/obmc-console/server.${OBMC_CONSOLE_HOST_TTY}.conf as
> needed.
>=20
> From what I can tell, OBMC_CONSOLE_HOST_TTY is still used in quite a
> few machine layers. Some of them (e.g. meta-amd and meta-facebook)
> even went so far to replicate the previous behavior by deleting
> /etc/obmc-console/server.VUART0.conf and then re-creating the correct
> one.

Speaking for the Facebook machines, we have some machines which use a diffe=
rent
vTTY and we have other machines which manage multiple hosts and thus have
multiple vTTYs.  We probably should have contributed code to pass the desir=
ed
vTTY(s) as a meson-option.

> Is this actually the expected behavior? Or was that just an oversight
> in the commit?

I think it was the "put the default/typical config into the repo and let
everyone customize it otherwise if they need" approach.

> I'd be happy to send a review request to make this generic again if
> people agree. A bunch of follow-up commits could then remove the
> duplicate code in individual machine layer overrides.

I'd be thankful for this.  Please feel free to add me as a reviewer.

--=20
Patrick Williams

--wvlfmXBJ0qdPHCUs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGby3MACgkQqwNHzC0A
wRnikw/9Hf8zlwjJjOWbm4BtRCLhT5vdodfT16WxLoKWE0mPuJ42S64mybDyqCSQ
32oAxdC/6kOe7hxBv0Qw3E0QrZ64cSsHW9QvmNbOAkh/Siaecy/cQkyX7ExkkFCP
KJdTf4oaJMYIpvzmN6uNk3+nIjTbgDPEYReZ/Q/FvYBQ7RzZ/5wFPMAbVotrnyE4
DSwpOzHP11s1bnMZdIsd/FpjvwtT2Q1F86g84M+S+IDFvdElgci/8XjsNeJLPALq
LG/A82QYtCQwQiIIAduvPIyDRc6HpVL6NCBVgLZ1Hkq561XImuCSCXJ4dtsFNC1n
NcHO4uW38L6Ya3Od85sZqDsPPAMsuwtBkqroEWsT4AINz5qe/6aTLZHSz/TiREWu
lbGlCitrJSFghMFijncJfEg++54ETnVPskiZ5Lk8YCBEtQFVAJRTTuF1DRNHh9fV
DRl33gxkVyjeiUHNNTgfDy4UsfAyyjmuV6PVdLLQIpJQ6Kph7FSxOm/RIfNQLMKq
HcRrOVGmjikbKqB70KYO3oLR6z8M3YQ0sJckOpV245LMb47yBnZn5cH1YBqTKPfb
a6Nk/JmKZumcchBds0/7/il9H+DqY+1oNgKkPzax7qAaHVzu4GgkvoWZ+bBWVsip
zm2TAQqejcgiKXpKeK6rWVVm29TNl6JzJG4P6heZawtV4KLuepM=
=I8LY
-----END PGP SIGNATURE-----

--wvlfmXBJ0qdPHCUs--
