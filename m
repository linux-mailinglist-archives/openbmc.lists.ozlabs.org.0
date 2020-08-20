Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5156124C337
	for <lists+openbmc@lfdr.de>; Thu, 20 Aug 2020 18:17:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXVD70q71zDqLY
	for <lists+openbmc@lfdr.de>; Fri, 21 Aug 2020 02:17:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=UpAwdw3k; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Cld4H9/Z; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXVBD0mJkzDqLY
 for <openbmc@lists.ozlabs.org>; Fri, 21 Aug 2020 02:15:47 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 1D3565C0197;
 Thu, 20 Aug 2020 12:15:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 20 Aug 2020 12:15:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=UEZOcoeY9WBcdBiKliFgc1uoy2J
 6cAQjasi9GNQvAWI=; b=UpAwdw3k1/msd5RHJ06tYlpOQHVVsSWwoU+5utkA2sA
 tkU8IgUT0xXMgvMTjS4f0Nj6bJ+WvNH3Adu25mS5KJHGpcKjhwsiNHocgEeKSJ6j
 QQQXgcRHgXiJDJvVxtsozLIFxHuIDM/NzZHNHL0zhKl456BLMMvVwu1a2ZdfBpLM
 SEyAHJktH2alYyzl7TCwaiK+T0WoiSYpHZQ/vt2z1R7G9sysCxpyZCfpmu7x4MiX
 Z1hpNz5yv2DCjGv5okpqFegNjdq6IdPog7+Ixshxu5ZF942ksxpprrFnYHL5Zlqr
 StS1DgAtyBGIyWr8nUG+MLUr2wc2nfRCAT2sMngidlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UEZOco
 eY9WBcdBiKliFgc1uoy2J6cAQjasi9GNQvAWI=; b=Cld4H9/Z+gkT8PvcRD1ZTd
 dtlMuzZO6l6kDF1ux13vN8GzXegtelLb8I1P+6fTXwJXZJkA9+GGI+zRBXLOH7iM
 ldCB6uqJZ3qerNWc+EkjpbY2A0IrU7hcB9fvDFEYwH7gWRxXmc18+ACFVV1Jcbpo
 0nRpzoSIZGTFv1fo1V9qzqw4abcs5p2J2+DJOyjpYYEI+BywTvp8lsttOZh/d/Io
 wn947JwLqK2RpKXgqL+nbIeWvHFNYUNzOjMfeWt790bGKYFvgmk7AEcAFUbO7jMR
 rtMn30oJxlY7VI2SCTSphiU0WNofWGjWkXWuDb17mI2nWcgMg++DsYovMMS7CPLw
 ==
X-ME-Sender: <xms:paE-Xwju-Zgrd8Fn2k__vSDgRVCo_35-chD34y4ANsXpbFLulI6HCw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddutddgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeduieeirddujedvrdduvdefrd
 dvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:paE-X5Clm1XdfD9teKsSgULcMBuiI820hhtmP0dvsK2wxQ0WmIDGbQ>
 <xmx:paE-X4E2JcKLgaCvdLfsfB4FQPcIqB72oLZc5APifeW_7Y2zvHow_w>
 <xmx:paE-XxSHn3qwEdGooSiZpQ6VmsMK4DKgTEh8_VWv15S5m_OEJEm2Ag>
 <xmx:p6E-X2v6eIIWhuOErJiR8WU-l9Bl8eTSEGuMTEB-FFqQW33Vqcnssg>
Received: from localhost (mobile-166-172-123-22.mycingular.net
 [166.172.123.22])
 by mail.messagingengine.com (Postfix) with ESMTPA id ADA5230600B1;
 Thu, 20 Aug 2020 12:15:33 -0400 (EDT)
Date: Thu, 20 Aug 2020 11:15:32 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Maxim Sloyko <maxims@google.com>
Subject: Re: Board Sensor Calibration
Message-ID: <20200820161532.GA3532@heinlein>
References: <CAFR_W8pG0gLhS5Ycxdhvx=1xdm7J2mCP0VfiHyuZOofB3gWHhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <CAFR_W8pG0gLhS5Ycxdhvx=1xdm7J2mCP0VfiHyuZOofB3gWHhw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 19, 2020 at 10:39:15AM -0700, Maxim Sloyko wrote:
> Hi OpenBMC!
>=20
> We would like to have a value reported by a certain sensor changed
> according to our calibration results. This is a temperature sensor and the
> calibration has nothing to do with the sensor itself -- so no need to
> change the driver or anything -- but with a sensor placement on the board.
> Basically we want to infer the temperature at a different location by
> calibrating the sensor.
>=20
> Are there any tools in OpenBMC that would allow us to add the calibration
> curve to, say, phosphor-hwmon and have it report the value different from
> the one reported by the underlying sensor? Did anybody else have to deal
> with something like this and what was your solution? Do people more
> familiar with sensor architecture have any recommendations on how best to
> handle this?
>=20
> Thank you.
>=20
> --=20
> -MS

There is work being implemented now under phosphor-virtual-sensor[1]
which is intended to cover exactly this case (among others).  We have a
similar situation where sensors need to be calibrated based on values
=66rom one or more other sensors.  An example might be a voltage regulator
which reads high as it gets hotter.  phosphor-virtual-sensor will allow
you to forumlate a secondary sensor (the "virtual" sensor) using math
applied to one or more real sensors.

--=20
Patrick Williams

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl8+oaIACgkQqwNHzC0A
wRl/8Q/+KqiFq2bw2LM8Annb/G4uIF1fZWru6ADE4Q9ZszUjMwNfQUwXR0/ApYNc
HtidJ89akWVH6Ioy5/jcd8Y+MuuWVLX4CBeYyV7cDfbMwZYbdttNRo8p3wU6XRjM
Fj/Qozh0sQgrNiyV4J/0W57AzV2OwlbAXjr70Ca2gTtFP/NWXb2jKD/QrLV9uQ85
2/LcIR82eg4ecEf0onSNps9Iw6/khomqvEPRSy6tWy7cmk4CpzojmFqbVaA+e0UO
+5p1YDb1ZJIm546St6K1tu4f9yu2rhBM3PTiVoIzJ8MCg9mQTJBLQVVABKuFkzE1
0OFMHVqPjYGDsrgcoiZAe1EqJudtG63H5eYesACPZWvyzR0CtfeYPB3Qr54x80Ic
loaJlI0yOIqE4kECsJwep/wUtFpnQhCPIcvtWYfsqds11GyCKQ/eWLNiJ5mXyrXY
Ngcun9uYE5L+Ub/Bsxjb4+eh0eB0J59Gcfv6c9diFxZCQkr7QQ3StYMSmxc1rLjW
pnnVn7uAWelC4YUj1dpVA6hRcIf3RXObfqk1pZWTpZDjHJqQjCWBdqPVUwneVFTp
/JlzqpcnkZS6mZyOYJEuV/lJq1riu8wTym0ed5/zvqD/Znsgxnp29PlcaL0TuCW9
sp1q5gXI2Ws5SjH9JkfuOcMU39XA15Wh1N7JHAU6AbgAizQSE3s=
=LRWy
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--
