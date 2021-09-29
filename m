Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C6641C404
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 13:59:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKFKs2fF0z2xXy
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 21:59:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=PVbY/dJx;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=IXaperT3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=PVbY/dJx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=IXaperT3; 
 dkim-atps=neutral
X-Greylist: delayed 419 seconds by postgrey-1.36 at boromir;
 Wed, 29 Sep 2021 21:55:51 AEST
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKFFM6pz6z2yxx
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 21:55:51 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 48D5A5C0102;
 Wed, 29 Sep 2021 07:48:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 29 Sep 2021 07:48:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=RNSme47IMvyXqv7BNvAT7L+G+z0
 8D9PXNQOsE+gyTi0=; b=PVbY/dJxBAwpPm6Hxzey+utSth8flE4cwcqsbUV9ZdZ
 hGHK1LgZPhp46/sGbE4Llojgf9riaQkNO/i3chD2d1UM4EmQzyd5agtDN6/4UVqg
 +prvsb+cl+3homxsCxNGCUgZRXWbWwzA0LF3fL/S35csvwiZpRGFsBfe8eUAatIF
 9qJiuCduvvt7FOzSEG54x2V5ph8ZBOFIlxHL1x5irAt3w0tyXRnc4XAsU6VQpS4m
 lkcWAPIJKnNGicMAaRGDOf2kESnGUH1rB848EAJrDSqPDAmPhjUP7o4N2F8OzMJR
 MC75OqQ7BtOMyDnC+NYM2+yN1b/w9Jt7aeFwOPmU4Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=RNSme4
 7IMvyXqv7BNvAT7L+G+z08D9PXNQOsE+gyTi0=; b=IXaperT3/sTFHaXaBznq2w
 VCGxg1o4N8GE5PFQYM1Vg54xBFfUEyEjO+MnKN+QJfkztw9HXOmiLW8l5dlkDZ4B
 mRrgrCA5k/Au6L0ai0p9vDqCK3UStiJjXNFgpbyokW/2smmKLw6NgUBWJ4iiu42b
 M8YvdNOYAKRu5YNQeqsyNnyHSUvfgp3J3fWf3RDDmmRj9XOwfEmoXdxJvg2RF5Xr
 UOnWQof6porSaUSDHu45lhZcpfMldwO7Sbb1d2CXq48mD7iUTedThWMwNVAzt93G
 pTUIKFXZU+apFgAdMvZLORrkqtOpiORcXtr0V/YlQcU9To1yiqvb5sp7CcgIgjUQ
 ==
X-ME-Sender: <xms:mVJUYTLB9N2CE9aiKR-VsQ9Q5xaYsSK5NQsy8HC5ZXhEGmAqk8TleQ>
 <xme:mVJUYXJK1yTjJE4uLc7LC7bLyMhVKA6XCHnfAx-5liHxqzsdSArouDZfbQaa0ll67
 pVjIcoK368iV933PUE>
X-ME-Received: <xmr:mVJUYbt2BZFbG3zDvDZ8nrKxDf2_cKhlwxWYck3pkXeM6o6X9MvmE99pNSGPKgiL7nLUHoB4O5BoT0JSyOt-vKIfc3bHbo3bjGVL_7ODXjPSOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekvddggedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtroertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepfeeikedvjeejheetgeeggeefgeff
 teeugfegtddvudeggfeugfefjedvuedvveevnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:mVJUYcb7RovCrFVD9eRmwTjehXbzUxoWkpqrpDbv6iWHeJuufudwNQ>
 <xmx:mVJUYabbOB6O4wsKpIWZpJz-pKI3FE4NF2R58nLYXwoUAHU4SWNm1Q>
 <xmx:mVJUYQBGe-UXQkrk2up87_LO1dXKdkdg0oT2tjvvQQrFGJiMVCAYow>
 <xmx:mlJUYfPWvDr0iwVtORfvZcHlQhCyq5bbDWObMWbQp9-2RQ21g3f1TQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Sep 2021 07:48:41 -0400 (EDT)
Date: Wed, 29 Sep 2021 06:48:40 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Kumar Thangavel <thangavel.k@hcl.com>
Subject: Re: EEPROM Validation issue in Fru Device.
Message-ID: <YVRSmInJszjpBTsY@heinlein>
References: <PS2PR04MB3589B9346947C693802AE1F7FDA99@PS2PR04MB3589.apcprd04.prod.outlook.com>
 <PS2PR04MB3589C40CCE3B07C5A2B79A3AFDA99@PS2PR04MB3589.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jivuflkApA9amPp/"
Content-Disposition: inline
In-Reply-To: <PS2PR04MB3589C40CCE3B07C5A2B79A3AFDA99@PS2PR04MB3589.apcprd04.prod.outlook.com>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, Amithash Prasad <amithash@fb.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--jivuflkApA9amPp/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 29, 2021 at 05:53:33AM +0000, Kumar Thangavel wrote:
>=20
> 1.       How the function isDevice16Bit Validated for 16 bit device ?

My understanding is that Vijay wrote this originally when he wrote the Tiog=
apass
port.  You should be able to confirm if it works there.

>=20
> 2.       Is my validation and analysis is correct ?

Other people have complained (on Discord) that this current code doesn't wo=
rk
for all eeproms.  If you have something that works better and doesn't break
Tiogapass support, I would expect it to be accepted as a change in fru-devi=
ce.

--=20
Patrick Williams

--jivuflkApA9amPp/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmFUUpYACgkQqwNHzC0A
wRkFKBAAhAsBzdXxK/R3LnnePHyCKrU5tMmv4gMht+0rweG0BIEIkKauYZ2ONIAn
f4vyTurm40mc5jR2GnvceyE0+eEVH+Cfw2D0WGzz+nQMHeIAaCgHKX8kyviRUNUG
w01NKhiNbRwRGkNtQIXEKYs3xxW1zjlBR4nOvBCCtT8sYaXFKDkVmAsR7KnipnHo
QwHE+r4j8zz/NL2PPiksKHzMMeud9AYYsfP83GYmSBxEas0ywmUx/xWGRtjcwP68
bDUZwZQkk5WraRfH2QOUwzdcRpLXFbRkPR1KDcC0LyBDzZ1eBIOZG4vQFStm32sY
a6Q7ERH0yEXpR5w5CpbYaiSNV3ou1ghxaVWcvbKmuAwLqVv+Boh5u5/3zZ7HjCxu
MRGWx6CH0e8i2xYS0/V/t3KlcgwJWcPjoNNASPTNJfBK2iulDfzmXSzG7Fg894Q4
hVgTxoc5foNyB/9sWzpwYLtCCxgZaiIrGY1dkyic9MrfkLGo1jB2VfmwQxd+on6s
w6xPTiIGDASLtLlLOvFrS53xJFRuxbcR0Zlk2C/H+LagTJF5WFnN8WLAi8fXqn5p
l0EHm4PalXnAtMJmuLQrOU0JaYHRWPU2VnPcOPmWk+hPqflDGg/2V0AdbKuNbhCd
maA6EuvNRFnSlvZNK3HqDmPvetos3xlixtQAqoqM3hgcRkixEVs=
=8ZH1
-----END PGP SIGNATURE-----

--jivuflkApA9amPp/--
