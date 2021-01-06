Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 608002EC6EC
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 00:31:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DB5H95BGQzDqlp
	for <lists+openbmc@lfdr.de>; Thu,  7 Jan 2021 10:31:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=gdBQHqNb; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=CK8PaOi1; 
 dkim-atps=neutral
X-Greylist: delayed 314 seconds by postgrey-1.36 at bilbo;
 Thu, 07 Jan 2021 10:30:57 AEDT
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DB5G94GLfzDqkf
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2021 10:30:57 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 98A51140D;
 Wed,  6 Jan 2021 18:25:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 06 Jan 2021 18:25:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=rfT2sgZWCks9fsmFF0GwoehLaMJ
 sAV9R3EJ161s8btE=; b=gdBQHqNb6VeF+jLdh16TJT0B+zQpAD5uzly94BvXrzy
 2ulTRWj2Zn2nl25ZCl5ryFsjw17cRLBi46qWM7dVFCm/wr996lv4xKjdwwvTWHF+
 14NdoyMz/RqTWtGV50Cu1jKqp8Kbnglc6jDP9Hi71qcthkf1APd/eto7CnaE4qIw
 4KgXILdA+kvTrxAqK3E0yHx/CqyrkJy72z3j2oxrdoxcK1gqRe9HuWnp99tIK5y7
 O7sbFvTE/OF+HyaC3qCZgU6IveKvpHRWWMC6E7bz7YnjU4mV71QDqHQ3F2juiTSZ
 CPcejX0gCDyTV7kwccnECjBdXuL41ix3DB8FRAuIrww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rfT2sg
 ZWCks9fsmFF0GwoehLaMJsAV9R3EJ161s8btE=; b=CK8PaOi1CJ1pCN1ATwPwfY
 lumdXWlZtMyU0DJ0QmpSil7yX8aCYKNJexDscvN1KloTAh+BGaXOGSLT6JXVBr7k
 Nr0Fs0iQX2rarfiN75k3CbeX86CDZRc2XH8pQiEVAd3XECLM9BP0IEo5dzDNEWhU
 XBHSmsyHo4yoloER6365e8Xg7GgzFqDolrA3NWxbgRfS2srxn9pV/9OI+tfVxcOl
 WTeTrmar13LpSLLuHvi7ye8ZPuxJwgahKHjTJDq2g38+PFpayfemwGxMVy/cE3f+
 1Qhehflf4R8qHFp3ZpsxT2sw8uPkv/dlCtPM8BvZD8TrlABNZcMy8JgRv/qGmGXA
 ==
X-ME-Sender: <xms:8Ub2X2aGDhOlVmRQKwBUBYzPwyvhkHE0_xqkt_nCB33_HTL6n_NAHA>
 <xme:8Ub2X5b57Mt7HNyWDk_dsUNqM10Kfr3_HPvnGIzAycNUSQX18YsVrk7ydp6fYPIfc
 XendmOqBxuzVSFHxyk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegtddgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 udenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhephfevhfelieetkeevffefgfeffeeg
 kedvffejiedthfffudduhedvieevfedukedtnecuffhomhgrihhnpehprhhojhgvtghtrd
 hnvghtfihorhhkpdhgihhthhhusgdrtghomhenucfkphepjeeirddvhedtrdekgedrvdef
 ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprg
 htrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:8Ub2Xw9hy93ZAlpdzBaM2zZuWs9cpO1FEBmQCpLLJJNxITxuMHVglw>
 <xmx:8Ub2X4o5g-m9yCpZdB8KdOQuWIgXE5XlzZq9S6dV3RblMkOGQn2nOg>
 <xmx:8Ub2XxpADUYCXPYNLa0QOcFMUrt6s9yw_iybn5S1kVsSjFT1W-ud3Q>
 <xmx:8kb2XzGJAiXYBr0P7AfGhRZzfG1NS68bwoSyoT-E2s_ECRoKQnetZg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9E80924005C;
 Wed,  6 Jan 2021 18:25:37 -0500 (EST)
Date: Wed, 6 Jan 2021 17:25:36 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: phosphor-dbus-interfaces ChannelAccess regression?
Message-ID: <X/ZG8N5buQuCKVQw@heinlein>
References: <778bd779-c6fd-0d77-a39a-b0da2ffafa0a@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iKUGIuw4brYYHWS+"
Content-Disposition: inline
In-Reply-To: <778bd779-c6fd-0d77-a39a-b0da2ffafa0a@intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--iKUGIuw4brYYHWS+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 06, 2021 at 03:13:15PM -0800, Johnathan Mantey wrote:
> It appears there has been a regression in phosphor-dbus-interfaces in
> how it combines two different YAML files. My guess is the problem
> occurred when the transition from CMake to Meson was performed. I'd
> appreciate some guidance from someone more familiar with how Meson works.

phosphor-dbus-interfaces doesn't do any combining of YAML files.
They're all processed one at a time to create a C++/header pair which
mostly just contains a single class to represent the dbus interface
defined in the YAML.

> Details:
> In dunfell, and CMake when I issue this command from the BMC console:
> busctl call -j=A0 xyz.openbmc_project.Network /xyz/openbmc_project/network
> org.freedesktop.DBus.ObjectManager GetManagedObjects
>=20
> I receive:
> ...
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "/xyz/openbmc_project/network/eth0" : {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "org.freedesktop.DBus.Peer" : {},
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
> "org.freedesktop.DBus.Introspectable" : {},
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "org.freedesktop.DBus.Properties" : {},
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
> *"xyz.openbmc_project.Channel.ChannelAccess" : {**
> **=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "MaxPrivile=
ge" : {**
> **=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "type" : "s",**
> **=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "data" :
> "priv-admin"**
> **=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }**
> **=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 },*
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
> "xyz.openbmc_project.Collection.DeleteAll" : {},
>=20
> ...
>=20
> The same command issued from gatesgarth, and Meson, I receive:
> ...
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 "/xyz/openbmc_project/network/eth0" : {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "org.freedesktop.DBus.Peer" : {},
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
> "org.freedesktop.DBus.Introspectable" : {},
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "org.freedesktop.DBus.Properties" : {},
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0
> "xyz.openbmc_project.Collection.DeleteAll" : {},
> ...
>=20
> Any pointers on how to restore the missing D-Bus data?
>=20
> --=20

This would likely be a change in whatever daemon is presenting these
interfaces for you.  Do you know where they're coming from?  I would
have expected `phosphor-networkd` but I don't see anything in their code
related to ChannelAccess.

Doing a search on github I only see some IPMI-related code.  I don't
know why eth0 would be represented by those.

https://github.com/search?q=3Dorg%3Aopenbmc+ChannelAccess&type=3Dcode

--=20
Patrick Williams

--iKUGIuw4brYYHWS+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl/2Ru4ACgkQqwNHzC0A
wRl4tQ//dr92yYYLuOjdJzGvyUyMtjZlba/WuM0V4061lm1tyEG1f5INseWbryrl
yBYydaIr+Fm05EUIuD3kiT/wk572c6BgrLrUHwzPYBZKnEbsxneZZbQuTOY5YF3P
4Fr4S8/zIJ8U7uYfqZesAXpztKGQJ7+ykDI+JPfViTMJOTiFuMdxRac8jIhfszu7
ozqLGcgkTtaAP992jqezf0js2dRVD8+AdguAtxVMPNPUH5/YNd9J8ciFeGIMhtBF
G9xxo1f4wfB8pBpqViY5gPv2RBMV2gVmffxQIsZDeQ6StvjCod8w8BaXGTi6YhLQ
XiMxduS/TJzgKH9g2zG1c3GDldQ/2nQi1V0Nr6nWf7xcn86zS/PJ2+YdhVf+nn+p
b7OaEc8E/E3/GSrq408GlY7ZQBZMC/hutizKTc+xVONMRRbzIQmJtwR39Qw6NshN
yKspXmO4tYmMqNdvaHUP4vL3WaZXFq6b/NB27SHOCf6oabCyHueqsbV6o4NKClsZ
yoa9mpja563OkUiKA4GDYGye3fOkwZ57xt+mIB2voj2aE5T/rQ/aMInVWs9W+geW
mSMja/KnLuHbS22xoFfu3i+xCadeNyJDTxzzsflPE2Xy2VoEkXXoMU0VVXiXDkmi
emDd+dmPPLutm0LflIBN2KxEpL/cggSXVfLrPVSKbstyMyiSD2M=
=R2yQ
-----END PGP SIGNATURE-----

--iKUGIuw4brYYHWS+--
