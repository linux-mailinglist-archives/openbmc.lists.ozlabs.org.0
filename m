Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0FA1E539B
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 04:01:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XWCm185fzDqXG
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 12:01:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=IrWPPhhS; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=JWpmLMlu; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XWBV5kFqzDqW0
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 12:00:50 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 94AED9DB;
 Wed, 27 May 2020 22:00:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 27 May 2020 22:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=D3UdPJp2cNxa1p2lMMQ/gO0GXzr
 NLERsovRIlljKTLY=; b=IrWPPhhSjAV5ee2VnwMkpiaSECnQW/4F8zBYh1b/VUK
 j4sTMBpJhy8hYjcWiBsAi221rTj5ZqUEI2JvG813/O+WowdJBQEM1Gphmg2v/2VG
 ybJfrX/vkesy2bZ+tZOgvVTwcVc6yqIZDdcARFpTcWljDGzwjrImmeCmbY8Myk5X
 uN2yYVscRZp/QZdXY11Mq0ZQdXJSo3X8oXz0uRY+NPk3/QYhkpuGTO8bjXDLCHMR
 0t+iUmn2nGRe/zziMXCQ4bm0k0JE3vq5OsA1r6ruD8egYPiXNsFEJiO4jyMwVlP3
 CXkAQat54Xu52Av5ksZv9g1TVGlW0i9ni2JRmPg0YfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=D3UdPJ
 p2cNxa1p2lMMQ/gO0GXzrNLERsovRIlljKTLY=; b=JWpmLMluB/LyWWNnOQIFqx
 hR6AiWOUCCED7eisxRaOa7DPSpqVKfMkemynPXpBWrjJNEGkY+/wJ6TIsARV/I1U
 VQR+sj08QManj4gwY62xBlGcQDlOZ96HOmcobwceeEHHsvt74SoQA9TS6SkdGOrD
 3FNaRKitdRO277e+6z/79HR0Os3O56wUrED4AaOpewHXH3ij+5HdH0DhZt+cbJD/
 K02tLku5NTuGJfC3kNGmCAxpONGuFJId8v5/gTpcVtLz+8lpBUMtFIuhPIQa1KZA
 dlplj1wLLbe/QSXpeFTpJzAcz3NVDpMtQeiDUOmNICFvZ+OEhZWE5zsLxyYMUW4A
 ==
X-ME-Sender: <xms:TRvPXsAeTmfTsEiSkVUntbU6Iv5NMMDmxPzQ0YQMxwfGEJAXFmprCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvhedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhephfejkeevffeguedtfeffvdffiedv
 ffdukeegledvuddugeefheduffdugfdtieegnecuffhomhgrihhnpehophgvnhgsmhgtqd
 hprhhojhgvtghtrdighiiinecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
 htfigtgidrgiihii
X-ME-Proxy: <xmx:TRvPXuiz2UzzK7wH06oaQd-tWKspTz3pvMt-EKuofAhZ-OMK5TvNNw>
 <xmx:TRvPXvlhlFHdTWp-OyDc0ksX2J56VeeI8v2hsGPLyAGx8lXafAbwIA>
 <xmx:TRvPXizZopAOT5VqGlYT6-QDYf5bKeagNp3zKCEyOPcKMTn4mSkOTw>
 <xmx:ThvPXsN7Gafmq_nPYLGLvahc-EZsQrlycJI80UBf1UOA6EGv4ihYBg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 880D43280065;
 Wed, 27 May 2020 22:00:45 -0400 (EDT)
Date: Wed, 27 May 2020 21:00:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: article on data in OpenBMC
Message-ID: <20200528020044.GA17541@heinlein>
References: <58a733f5aac22446c8cab43535aaa2a133a20717.camel@fuzziesquirrel.com>
 <E3CB1347-0E32-416F-9837-A955BF0F0613@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <E3CB1347-0E32-416F-9837-A955BF0F0613@gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2020 at 10:56:19AM -0500, Andrew Geissler wrote:
>=20
>=20
> > On May 22, 2020, at 3:46 PM, Brad Bishop <bradleyb@fuzziesquirrel.com> =
wrote:
> What=E2=80=99s your vision for this article? A doc repo? A wiki? Wikis def
> make it more likely to get updated.

A few people asked similarly, but he had already submitted it to Gerrit
before posting to the ML:

    https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32735

--=20
Patrick Williams

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7PG0oACgkQqwNHzC0A
wRnJ/Q//X34H16aaqpFmbGyC/KHiUKNWSj7CbsEghQO8DJUV5VkUqszV3z/rBdAs
Ue7Vkj9A4oh7s19rP1gl8CkvGdsnt4o3X3hJb+NZ/mfXhU99MimcBqwE2wq8N+DM
22CpfZ3AfEUifxSGEJh2pUBwwY38CYX9FJNApMSSj7EOWPsBZEPYZ9Yyj5jFekq+
sLNgGd+Zmy+bPpgc0NW/lGQHuc/xw7SIvdkH5j+HsBCduCWGqurTN4OfHiPU8Wfh
pNB7hbGnxnuCHaO2bCZGRgSD4/Qe2G9aFikKBVRTX9o8YM7orVh87acOkS0eBr/2
kSDYFS8sAzidHugy3GqdohctPW5DROy3ye0f0uz6tK6R33ZmJypBCaAyABBE8h7V
6SAQvdOE06mkFIbAwpY0FKYm3/KKq84S3a2A3kP1uy5Fr6RGae4QnYrtRg1KZVq4
bTY4WXHKC7snsMfXil1I86bl5pDm7Ko2cp9zm0EVU8SzQdNxaOO/GEFlGslnNpDE
vtJxIsPOgoLeOfskxm5SEgT1pQTUk+BDL2qtWviyxaK+iUCibrq6o9nC6Fvw+ozs
R1D1wPLsQmx2wDJO/2WUNHvJYWYJ2XaCkNik9T0UgQlooaWC0n4KNjmTWM5ehbov
+qlsDocA1nhBDALI9J41IyWVRQ9VN0khLOov5OFQkIt0N/crnFk=
=aboB
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--
