Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF81533D63
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 15:12:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7Wh76zHdz3bqs
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 23:12:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=kZmjyxYE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=wfXfxVC0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=kZmjyxYE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=wfXfxVC0; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7Wf94Js8z3bl8
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 23:10:56 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9544532001AB;
 Wed, 25 May 2022 09:10:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 25 May 2022 09:10:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1653484251; x=1653570651; bh=XTElGPWSnf
 3oPp4kqQyjeZ3Lh44Vp6HlP/IT7qeFuUk=; b=kZmjyxYEcVSHbQPJrDAUl9xNHY
 xAbssA9XXcgvppWgs6DBtwry8bQ7Xf0In49xO6SNuDnLEuNH9HHTWnGeJQBpTtBb
 QmD6tT5dp9ASVhNEVLhdfRLemKDfLDbtXK+QG47F6PM1UT3OOIwqrLhjk+DvTF5e
 4OE5aGkShQ2BEXfQlSu7hJKQztNSfnHbspwbl33W8qq6of8Mc/2RZLA2O83gqnar
 vtdd96yl3cTv90mcpmEdpaP/v6Fz4IR8JTXsrmGX0QLfPvw0r/UcZTvYPe2tKiuG
 9hhIL8pDPwWW9Y541n9OHwAIcmPC942ikTd9XaXdBpJt92CvqV2s5U1Z9OHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1653484251; x=1653570651; bh=XTElGPWSnf3oPp4kqQyjeZ3Lh44V
 p6HlP/IT7qeFuUk=; b=wfXfxVC0IHqKpdHeEiY6mPiBk1uREczdoS06HVU42prm
 V+HqYJPYXTq0VA7q3xSvMN0DNOQ0li0c6PtzkeYkQaHMixOcNiW0xD52fR2z8PkG
 5UCvw7g6GS0+HYBjNu4RJmx/iG20/nD2FCrkkGOzmt1jjctvYsl0+kiOzfankhVK
 cDIpqW6TX7Rekc9JvpXr2a2alj5CX/B61a5tPOUpNsLC3KmexO1sy3W9vLN8Q8Q6
 aNPJGcHtX5p+mQJj5J53iiVXV0teiyNdCROZt2sk/rbDWbCCtOnpimsVnWH9wJgo
 rea57TJukQmeVljvc7J4ERlhkMoqDNRTKJrehIrGHg==
X-ME-Sender: <xms:2iqOYqS2JLbsVBZV7lP9NjMJ1qnsgG2hD8Cf9dMaU4VZS7saxV9zlA>
 <xme:2iqOYvw332hL4y2CgEcPAV1sW7nQzhb_zW_Iyo8ljkg6hQaNSvkoAf2CE8NZd6G_n
 1TQi1EDrY8sRV0d7Gs>
X-ME-Received: <xmr:2iqOYn2WB08T2BCFo6iDnWI8sZsZRyRw_KkZ5Pqv7ordyyfMCt4qWf21daKfATFkxavy4G2r5URM2-LBKgt3Lw-uHnc_Zo7fUzQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeehgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddvfedmnecujfgurhepfffhvf
 evuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgfevvddvgfejgeffvdelvdetheelkedthfehjeeliedtvdegteelfeduheduheefnecu
 ffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiih
 ii
X-ME-Proxy: <xmx:2iqOYmDNjt0p7Dpv_g4kxt3V8B-iOkW49HLDyjtxg-wOfaAuXCvWqA>
 <xmx:2iqOYjh2FXO2rTQ6IF24EIhkIGbTPon1FZvmrJHEEK8UiLK7Bl45qA>
 <xmx:2iqOYipC4FShuZg-HhM_eGE4UXnB_9rS9g1aMwxM-Lxmn0zdx9UrIg>
 <xmx:2yqOYjIm0HEqpkpYgmo749C-1zE3TKOnJSb6iXREmmIID-6T05Nq5Q>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 May 2022 09:10:50 -0400 (EDT)
Date: Wed, 25 May 2022 08:10:49 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Prashant Badsheshi <prashantsbemail@gmail.com>
Subject: Re: Need help in creating Namespace Journal logging
Message-ID: <Yo4q2fyEkOp8ywDY@heinlein.stwcx.org.github.beta.tailscale.net>
References: <CAD5wtF146Axtj5XCDMFY=EEXpDUE3sGRD_76kVyBq8jJ9RQOpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x+z39HsWxACdoZgj"
Content-Disposition: inline
In-Reply-To: <CAD5wtF146Axtj5XCDMFY=EEXpDUE3sGRD_76kVyBq8jJ9RQOpQ@mail.gmail.com>
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


--x+z39HsWxACdoZgj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 24, 2022 at 11:43:45AM +0530, Prashant Badsheshi wrote:
> I am working on a yocto based openbmc project, I am trying to add namespa=
ce
> journal logging.

Can you elaborate on what "namespace journal logging" is?

If this is what you're talking about, I don't think we've leveraged this
feature:

    https://www.freedesktop.org/software/systemd/man/systemd-journald.servi=
ce.html#Journal%20Namespaces

You'd probably need to propose a design and add support to
phosphor-logging.

--=20
Patrick Williams

--x+z39HsWxACdoZgj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmKOKtcACgkQqwNHzC0A
wRnl/Q/+JPGexPu2L3zn4biQLP2+g96kOKwzW5GK1j56qwy8wHzut1b6vhIF9iWH
Dwu555yyIxBNx2kqG+GbZKbicnpDRR4YhUu0updaPlk1TT2p5MsO+WCW8hDhxX/K
Kp9Z0tL87AP+u4G2g7FTEt4zZAhEqJJ5kP6fraEAM7yrXvn7Lpkp2BFakPm2cHbI
GS7Auuqc/aGQbt9FPnME6XDSoBpWWFZfE79NwBJL4ONNZ7c9PfqrbQFgzKcToI3C
6smZxteSwVMBbdw7jDHrge3FG4pVBjozDX6Zl3sulXyM8gW220MdLH6DHmVFu6bo
wGOqUlJxeeT/BGpGAa9/9T1IcQTIrBIk1JsdbSUsIIoOKYiQT98SRhvAHn2YXL//
nEtBVYFG2jXuZl+AUBQg6ucJYhVFMYw8TXJNWkJAyYkDV2z7zzsMptnEagjNe6sU
4RDfv/tkXGIo/A1PdbkO7y3fyQsX9U6JsoJYfEVsFYEvDktA65wExBK+twy0txCx
KZqWghKltq3NOrdRQRgluRH6uREu2FrcDsceJTmtb8820QussMWCniPNKQFBzYnl
VphlQNTFM53zszzZ2a9Ikqq7RiinpfK4CC/ZGGRQLNL9unvCnsUB99VbwJrtx6QL
xR3qSNifGUurgSXrh3N2GzkjQXsuscg3EB1olVAtDmnf5K0+Mrc=
=l235
-----END PGP SIGNATURE-----

--x+z39HsWxACdoZgj--
