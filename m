Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2922B616C
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 14:19:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cb63k2zQlzDqH6
	for <lists+openbmc@lfdr.de>; Wed, 18 Nov 2020 00:19:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=nIdcEN8P; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=UG+YJ9PQ; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cb6075Fs7zDqRY
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2020 00:16:21 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8D5285C01EF;
 Tue, 17 Nov 2020 08:16:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 17 Nov 2020 08:16:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=BKZ6svqaEuM4RL6hp165Os9gbhc
 5GjOvtlJGbF9iD44=; b=nIdcEN8P4kHEMzODTOv/AGS188K0M4gxQwD//S6Geyy
 bUXG9v5iKm2lLlLmoLC1M3LZHLTyDNHioLylcHHvvHviB4TFSaqgc0SCTyeOy7O9
 wU9uxN2llZ8QfYi9sjaAkElbyKhFr5QjPntS/x96ISL7h0Vj5J7HWq4yp3fYvyob
 0/bj339TEjsv19VF8RJli7TB7UIdK98WsfZw+zmG6v45YzY3FAoTqAJoCuPFqJL5
 D2vFQmM5U9bOPvu71hOTuHBoUaBzTkQCbSDcbGA/tcnajxky6DtjifNc19/165Fu
 DUnbiRmNg0NP2V5LsMcpe6pAWGBRTS1/1TZ9BKjnAPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=BKZ6sv
 qaEuM4RL6hp165Os9gbhc5GjOvtlJGbF9iD44=; b=UG+YJ9PQpF8+MoTTdMBnn6
 VEe/7uQtseYaVRICPtx41Jvep1nHXLpU7R0nqVoc2LuirNf4S4jD8x7sgPht6o6d
 XTQBo6YHYGgTJ9yMPydhJ8tTOI2y9GqripftFJQw3qS+bXyOwYygEV5Z/d8j7VDd
 fec4NWmqWESSpSGhiNN6e9PdqBkfwhJpZHJs1vSExtD5f4yZFTwlQ0c4/vpkf6EG
 ylZ0IPv7hEuOMZXRiDbyRIrfcgd9WXpyfxf42vPCod+Z0T/Yzcxjri42Zf46Mot0
 MWEvJ0pem4wVPaotIP8tdKCmYZoqloyaEUb+HJe2Y+Yo/FOqNqoc+GXrT6dmZLPQ
 ==
X-ME-Sender: <xms:Hs2zX6r8MO9rQrHWdP7CfnvgNly0mJfnU2byTYXqsH41NbPbb3dZSA>
 <xme:Hs2zX4psintqz7zciFFXW4cSIYANeo0abDKn2mcsgP9tK4yNhAS2xgnUjae_WkkVL
 fB4Jr00fJTawMf88Ks>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeffedghedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtjeenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epkedvheduveekhfeuvdettefhfeelhfdvheeigfdugedvgffgteffveektedugedunecu
 ffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:Hs2zX_OKDKrDq_Ui5aJlPnr9UseQtt2R5RKMxqh7GE25S8RLt38w7g>
 <xmx:Hs2zX57nFMNxkU-_N5t2barmFAfVnH0B53mAeaxIgyFFEmXxhtgfbA>
 <xmx:Hs2zX55W6p0Uxvv_EFKF6u9NfUeQyWI3CH_GZXQ4GeVysEHs9f3Ibw>
 <xmx:H82zXzlyQwIdKoxvWRDSAQBUe2e4OeF2BXac9I5Od-1OH1OyB5uSpA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id BA98B3064AAE;
 Tue, 17 Nov 2020 08:16:14 -0500 (EST)
Date: Tue, 17 Nov 2020 07:16:13 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: =?utf-8?B?5p2o5YuH5YW1KOacq+WyqSk=?= <moyan.yyb@alibaba-inc.com>
Subject: Re: =?utf-8?B?5Zue5aSN77ya?= =?utf-8?Q?I?= just want to join the
 openbmc developer community
Message-ID: <20201117131613.GE4495@heinlein>
References: <8da567c0-b5a4-47c0-90d6-d2de96ae99e5.moyan.yyb@alibaba-inc.com>
 <0647d5b3912534e4cb81d7e4953a26799851e857.camel@fuzziesquirrel.com>
 <cc0cc576-62d0-4c63-93d2-11d585b557a6.moyan.yyb@alibaba-inc.com>
 <F137C3AA-8FA4-4404-831F-C8BDA5B1465F@fuzziesquirrel.com>
 <196c13b1-92cd-48eb-83a3-8accdee838f6.moyan.yyb@alibaba-inc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nHwqXXcoX0o6fKCv"
Content-Disposition: inline
In-Reply-To: <196c13b1-92cd-48eb-83a3-8accdee838f6.moyan.yyb@alibaba-inc.com>
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
Cc: =?utf-8?B?5bi455CzKOeJueedvyk=?= <terui.cl@alibaba-inc.com>,
 openbmc <openbmc@lists.ozlabs.org>, Brad Bishop <bradleyb@fuzziesquirrel.com>,
 =?utf-8?B?5p2O5b+X5YW1KOi+ueiNkik=?= <zhibing.lzb@alibaba-inc.com>,
 =?utf-8?B?5p2O576/KOS5ieWkqSk=?= <yitian.ly@alibaba-inc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--nHwqXXcoX0o6fKCv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2020 at 03:46:09PM +0800, =E6=9D=A8=E5=8B=87=E5=85=B5(=E6=
=9C=AB=E5=B2=A9) wrote:
> Hi Brad,
>     I see the meta-alibaba has been create, that's greats, thank you. But=
 while i send the file to the Repository,it has some question as below. If =
am i have no Authority=EF=BC=9F
> Thank.=20

Hello.

Your issue is that you're trying to push directly to the branch and
bypassing review rather than pushing to a gerrit review branch.

Please see this document and especially the "push code change to Gerrit"
section:=20

    https://github.com/openbmc/docs/blob/master/development/gerrit-setup.md=
#push-code-change-to-gerrit


--=20
Patrick Williams

--nHwqXXcoX0o6fKCv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+zzRsACgkQqwNHzC0A
wRni+A/8DbfO18H4pDwRClrfmaKysGE+io7CQp9PoAsea8wFKGqoT9fWAZUDNiLU
WRyNIp7LcckGTkRT9fm7KBwElN5HFm+2qpDFQY5o9twGcfYFfBKUKlwcYldRZEnd
R7zjLZGBF9qDDz7HjjkuPR7GoC/4IJ98HuvkVnlfn8wZxaVHVD0FdN03D19Oq0/c
guHzPJX9/ImZxzEwRcIukWLc+vG70jxr2672Bcn90QZmerZ5bndyomnML09XOJzA
GdneqcwGUbD9iNu86qkHLUCtG2IzuTJ4KnZRTDEEfPjxXNI1MERDKIi2E7CSP5LE
5IqI7p+KtQ3PjQcJ/pXbvy1XR4kld1WtrSo6lJEduK3cRl4uM67oM3Tk50o4DVBM
iljQugEfqlrg8Y6JPJWtKxqE0emNJ4bHAmT9GA1JT1woJBZhhfgqB10A+2rvUUCv
W5jq8TqjnM3ES8QUxitHas8ZT8HYeGOXJq3mNGGDHaIISiQClkWPewH2FgLHOlKU
5CkyIZ6gCXgqEnfOcKCuFkDjpq9BhdFIehVYOvZjXCpGrGXZv6/ZvG4VHGUB29rD
JaOqaXzy0BT9qImsQIFvqAM8JcBIVGKFXfAjCIZR6LqFy0Akp07NdYojbxRahmYb
58gbdfdezXNe+fgZbQqE7Q/dxhXNIBu6KlipLAnKMJPMrmrFwVA=
=unw3
-----END PGP SIGNATURE-----

--nHwqXXcoX0o6fKCv--
