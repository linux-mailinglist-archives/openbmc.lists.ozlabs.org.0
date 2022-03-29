Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A184EB27C
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 19:08:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSbcx5VKdz2xsG
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 04:08:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=N3RtwZA/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=VwxiXgkN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=N3RtwZA/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=VwxiXgkN; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSbcY2t1dz2xBF
 for <openbmc@lists.ozlabs.org>; Wed, 30 Mar 2022 04:08:29 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id EA1E432021E4;
 Tue, 29 Mar 2022 13:08:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 29 Mar 2022 13:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=jvPMxR9q+yWFejae5OI11dwt2wusc7Jmf7g8hc
 dfKlY=; b=N3RtwZA/78hsbte4IuBoXTnLNbf+QOckkvoLSr1gsIfjIirdujN1VJ
 UsuRxdIVdFsECcglQaHgQZEqixszZtHjuaj0rn0Q/MjGV+ZhZoa/fNQqJpxJyvxX
 ya8U30+KeMQ3YapBYvYddxPLQiQyEksSMaJT7RD1+L+LXDzYbaitXt0e8wjDXsPY
 rCr1CInZA9A2ZNd4Pkv/JvEcDFgfUIm5Cn4lovZ6z62/z4YCmUc2qgryPzeRUv0r
 TWqv1aoKQfx5qXcdhtnz4qlguOM6dgA7z0ODwPRSQXvmpIkEBaABnYXvfVfZAJ80
 btqSBzio5W9ZSPftIw/K+gOheOqmU3qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jvPMxR9q+yWFejae5
 OI11dwt2wusc7Jmf7g8hcdfKlY=; b=VwxiXgkNb80y5muigCIL6pmoxNVTH2dsy
 bELr1HO/+lNOQkqQ7p0GNF65Q9vxoHx5n2OsyUXVW4/vWcwy7meSPyaLW7vDLa1x
 CDDAPi7Q+10pPjyNrY8ng30/7IUsfQ8HVRZa2Uykg0m9Ipn3uOzZ5Q4Jv5WM9JgA
 F8d3azaZ2CYa8dNhyMSJGN/P7n+FssE/ErMr4kcIWnRdCU4N6RkfFvUb9zXVTU/0
 7O5l/ucW7ZTPgELG1yiufo99rDPOaJzMyZAy62vfLRSKs1iSNWbXeI9ci7y/2QVp
 kptQj032dr8/D5smlmHSDYGaq0DqQJrJQaFbcB6fjAxYZB4aUxaVg==
X-ME-Sender: <xms:CT1DYm61uOQ-gdLMo1wuWySvmqT8J2F93sAQ0EnJayKoEs_ui5_OeA>
 <xme:CT1DYv4vBEPgmzpUMU12vUrUSz1g20uRhbjAbm7HlCt4hRFClo9J5-N9kEp9EBRGP
 ss0TpIaRNZR_WpZ6TA>
X-ME-Received: <xmr:CT1DYlf7bsV3IGbaemC_jitoJfMa9lQEHSI97BnFElxSSd2llvIyzPpxhy4OSiowjO1WWqS1XFi1QVQV7zWnJddpHRWDIhc1rMI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeitddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:CT1DYjKaKDHdYAfkSrbs8t_aARXqKJzCPg9kLMYPWCeM8-y1ghvTDg>
 <xmx:CT1DYqJXLidLNZzum672dqJGrvJbuxysxAek4AQPapEM9WeFOXTUGQ>
 <xmx:CT1DYkx4tRdlnPKw-5iQB9Iot4n5G_0Fx3VE-dNHhgDr4vLlKst8hw>
 <xmx:Cj1DYrq18f0dqcRllZbFngKEqmOjhPHdv-0NIBAiUXOSn27PAfBjZQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Mar 2022 13:08:25 -0400 (EDT)
Date: Tue, 29 Mar 2022 12:08:24 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] peci: PECI should depend on ARCH_ASPEED
Message-ID: <YkM9CPbeARpWHMPw@heinlein>
References: <f7ea35c723da72a89028da5b976ad417fbd7bf52.1648545587.git.geert@linux-m68k.org>
 <YkLgapMN2JqM+Lte@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="z4wolAb7mS9MAQex"
Content-Disposition: inline
In-Reply-To: <YkLgapMN2JqM+Lte@kroah.com>
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
 Iwona Winiarska <iwona.winiarska@intel.com>, openbmc@lists.ozlabs.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Joel Stanley <joel@jms.id.au>, Jason M Bills <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--z4wolAb7mS9MAQex
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 12:33:14PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Mar 29, 2022 at 11:21:37AM +0200, Geert Uytterhoeven wrote:
> > The Platform Environment Control Interface (PECI) is only available on
> > Baseboard Management Controllers (BMC) for Intel processors.  Currently
> > the only supported BMCs are ASpeed BMC SoCs.  Hence add a dependency on
> > ARCH_ASPEED, to prevent asking the user about the PECI subsystem when
> > configuring a kernel without ASpeed SoC support.
> >=20
> > Fixes: 6523d3b2ffa238ac ("peci: Add core infrastructure")
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> >  drivers/peci/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
> > index 89872ad833201510..0d3ef8ba0998d649 100644
> > --- a/drivers/peci/Kconfig
> > +++ b/drivers/peci/Kconfig
> > @@ -2,6 +2,7 @@
> > =20
> >  menuconfig PECI
> >  	tristate "PECI support"
> > +	depends on ARCH_ASPEED || COMPILE_TEST
>=20
> I hate ARCH_ dependencies as there is nothing specific with that one
> platform that means that this driver subsystem will only work on that
> one.

The motivation in the commit message isn't even accurate because the chips
under ARCH_NPCM are usually used as a BMC as well and PECI is just as impor=
tant
for them.  HPE also has a custom chip they use as BMC and they've started t=
he
process for upstreaming that support.

> I'm all for fixing build dependancies, but it should be fine to build
> all drivers for all arches.

There are a few drivers, like PECI and FSI, that are likely only useful
when being used in the BMC space.  Is it worth having a "config BMC" for
drivers which are likely only useful in a BMC environment and that we can
"if BMC" around these drivers so they get hidden from the menuconfig for
typical use cases?

--=20
Patrick Williams

--z4wolAb7mS9MAQex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmJDPQgACgkQqwNHzC0A
wRmUxQ/+PopAViu2crFxUxSdeLGnJt8czmB3zKxtmlaUU06S07tm0FcbGqljwTIK
Nghx8aPmUjbnOIskWOPRM0BLyk0QrNM8OgGfY7+mTuMqhPTh/42XTJ+bKHnENtTP
d5VxxLNrqUkEiLqO130YqgEAiRmlRsZOEIuxHeA9KQdPr9KkSyBez/3WK5FhVVHI
8kJT1Ht6aVNWWflRMrHqRMUyWvqDmCsegHnsDboU29+xlgKwMb4KgtmnzVeSqpyJ
5qJZZ24PbOYPLsOlFHHwcB9IaWrOeNNDyvOwoQBndRq3hsGEL7DMIwtHBUJWbgUm
Z4Tpy7oanwY+uFDdLExhy+HhoxwyEStzW28q1xDPprZzhwjQRPMczRyQ3vXvpRq0
mib9w8xfYF0YFG28sTS394jpRtuVuZf40AJxHubMhjo+F8GNK4doO1GvGZMNnbRY
KuR2xAUL5o+nNhiBxTKVDsG/uZa5ffqcVfOiqoWMW6wCeW1IV/usk0NUP1XCsaUh
3Zx2OujVymFsXfdyPyhPVQdiKstZ0FM9Ef8mqT4Xn73FxsJA0nyubeGj63uENTiG
iOwn6YauefJybKd7LxBHSXSd+b5pBBcYDqph5IxE4qhdzOsmEg8yyJ0KWXtcIj7Y
4AkAPp8U9dWbrVxS6ItFjDQeJyNBHTTVmGQR85eYFnNeyGia5P0=
=89Q3
-----END PGP SIGNATURE-----

--z4wolAb7mS9MAQex--
