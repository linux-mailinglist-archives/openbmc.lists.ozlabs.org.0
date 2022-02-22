Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE74C0117
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 19:17:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K36pD1Rxjz3bb9
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 05:17:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=inlck0W+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gD7pnm3W;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=inlck0W+; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=gD7pnm3W; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K36nk1Szjz3bPK
 for <openbmc@lists.ozlabs.org>; Wed, 23 Feb 2022 05:16:57 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id A5E683200495;
 Tue, 22 Feb 2022 13:16:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 22 Feb 2022 13:16:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=Dj/EnBj7nvDtkLaAh1EeRTpwaQvYXZYZejJJ05
 I/7TI=; b=inlck0W+Dii24dV4rpxocqa+FEEoHC2QqBLphnkNpGMf9iad2CqG7S
 v5EOLuF90Rrym5xw+CDmvUrEIBc6d0A9VpB30Ixx9IxmzzjSGQKlVm+qt0ZFC3GU
 /ZJ+u3A+Sl2yTR1nYIVbnf5XjprerrGE48e/7q/ffTDBf2QZ3HYb3mf57FN7TlAU
 SIz02rtMNte9sknpXlIHH/ZL+Psy1T/NYQR+tt96WGKrvY3R/im/Wgp6GJoq7VHe
 gJvwdhs2eB6BygoCaCL5YE/wZ+d271MWi6IyS/9/XtJTTQv5JSdFw2kvR2ZwisyQ
 v/0F+WRe+FN+TxcnHywwWLZr0xi/Ua7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Dj/EnBj7nvDtkLaAh
 1EeRTpwaQvYXZYZejJJ05I/7TI=; b=gD7pnm3WQLsWyBeE8f7OmUvSoGbxzp/CG
 /k++o71dR+wAWLEC9M+o92YsPGZ/A17VDnyNd3wlOmR05njdPkv4ZrFIev4YumLO
 KMbM73ghVlS5jv7oGRq9DTbeGKJboCM91NdAQkwVbIwy8TkPpEb0PKnQDt96D3GJ
 lHjNlY2Iw4bLW2br35y9U8byo0YArZVwN/TEdgd4L4/VaiWg+HRm5gsJHw62cmoV
 n1i1bAAPY3AHaPgiCxtREsqC7t5pshdHtb7NxxnEmhM1xiuCc+ovE52VJmPju3Pz
 fproP/WH2GVZHlP9Y/eGSvBkniaf2buapmmzeTndKPZhCYyWBYxwA==
X-ME-Sender: <xms:lCgVYvoz-WdSAn5pE4RTRhVkxNrLfKk35UhhaAP3u4apiRB-6DZrOA>
 <xme:lCgVYprZOyjQ5vEaVINafNMbPtlZoZefHQBOwLCLBLvpC39gNQkhL7tYM3StP27Sh
 3zZHnubv3xmd9gkyXI>
X-ME-Received: <xmr:lCgVYsNaVAS31jv36dAIovIKseupAYFWmy7Mo0De62WYcWbAbP5WH87VBvJjtbmxMb6bTEem52PTMwySNGgE0UTKP2W14OolTw4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtroertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdduveeitdetvdefueeljeelgfff
 vddufeetteeggedutdegteegkeetieevjeetnecuffhomhgrihhnpehgihhthhhusgdrtg
 homhdpohhpvghnsghmtgdqphhrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighi
 ii
X-ME-Proxy: <xmx:lCgVYi5DHay8_MLb4RwIPqydgfBOgc5vEDUnS3-AEA27R10jLGWzSQ>
 <xmx:lCgVYu6yfKEJNpewGsFU2lUM7d6R66fLrK8DCjjKj5wAgi21KOT7hQ>
 <xmx:lCgVYqifKKNoe88UhW7KgpMXawuswWVa2e8kGVNKZnfI3IdFDQFnHg>
 <xmx:lSgVYruLY1GKxuCUxld3OaT60BGq-1wr735zlWDKVQn4B3uzicGxnA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 13:16:52 -0500 (EST)
Date: Tue, 22 Feb 2022 12:16:50 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Gaurav Gandhi <gauravgandhi@google.com>
Subject: Re: Supporting removing interfaces from settings daemon
Message-ID: <YhUokhiQYSXiwQFr@heinlein>
References: <CACxmPJM0b_rxoRfx5qBXSsjOXL2tZtLJSZ8+64ekwXEs9q01DQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UeWkCNdaCPNdBog6"
Content-Disposition: inline
In-Reply-To: <CACxmPJM0b_rxoRfx5qBXSsjOXL2tZtLJSZ8+64ekwXEs9q01DQ@mail.gmail.com>
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
Cc: openbmc@lists.ozlabs.org, anoo@us.ibm.com, deepak.kodihalli.83@gmail.com,
 Ed Tanous <edtanous@google.com>, geissonator@yahoo.com,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--UeWkCNdaCPNdBog6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Gaurav,

On Fri, Feb 18, 2022 at 03:55:46PM -0800, Gaurav Gandhi wrote:
> Hi All,
>=20
> Currently DcmiHandler
> <https://github.com/openbmc/phosphor-host-ipmid/blob/05d17c036facc0e91259=
59abe3c816aa631333e1/dcmihandler.cpp#L25>
> in
> phoshor-host-ipmid only supports the power_cap interface exported by
> Settings <https://github.com/openbmc/phosphor-settingsd> daemon. To make =
it
> generic we can use objectmapper here
> <https://github.com/openbmc/phosphor-host-ipmid/blob/05d17c036facc0e91259=
59abe3c816aa631333e1/dcmihandler.cpp#L116>
> to get all objects implementing power_cap interface.
> But it poses a problem: which object to call when setting/getting the pow=
er
> cap if multiple services are exporting objects implementing the power_cap
> interface.

Why does it matter if multiple services are exporting the object?  It sounds
like your concern is if multiple objects exist anywhere?

> Also I think dcmi commands are supposed to set the power of the system and
> it's not safe to set the system power using multiple services.

Why or why not?

> To avoid this we can make sure only 1 service exports this power_cap path
> <https://github.com/openbmc/phosphor-host-ipmid/blob/05d17c036facc0e91259=
59abe3c816aa631333e1/dcmihandler.cpp#L25>
> used by dcmi handler. But the settings daemon
> <https://github.com/openbmc/phosphor-settingsd> always exports the power
> cap interface by default. Currently there is provision to override default
> settings using .override files. But I am not aware about any way to remove
> a certain interface from settings daemon.

I don't think expecting just a single instance of the object is workable be=
cause
it completely omits handling of multi-host designs (like Yosemite v2).  The=
re
should be a different power_cap object per host instance and the DCMI handl=
er
should know, based on which IPMB channel the request came from, which host =
the
request is for.

> I am planning to add support for .remove.yml files in merge_settings
> <https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-pho=
sphor/settings/phosphor-settings/merge_settings.py>
> script
> to remove interfaces along with overriding them.

I don't see anything wrong with this, but I don't think it really solves
whatever your underlying issue is.

> Please share your thoughts on this. I have created this review
> <https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/51394> for refere=
nce

--=20
Patrick Williams

--UeWkCNdaCPNdBog6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmIVKJAACgkQqwNHzC0A
wRm0CRAApw9Bv0XuKXm3QL7ylcguPDf2g2pSWrqdwxdPehAtHG+Oplo1j9ZuAyGv
Iy15JR2UYfmnaEVQHjat1+Q8FziLWd3M/XUnbebm4mjtO9T/mAT6PQVtH+ZPoaTd
2V1EAoDYydMw55eX0XmJVMtFevDvpkkEh/HJBAy5vDWfAukTIhUypF576Y6zDPHB
gVRlKw0L0IlRP8eEhgwb+2/ZVf+rGfdM+XWiqV0r9e7wiDoH4wd84Z7Dv6jkQEKm
K57tTpjmUYvgDyn0mdJnxPapMdbgpmNTd633V8DkRnKIPwr4Go6B3JgZ2WsZ3hHz
oxMa04SkVpgucEmS3H4Os9H6txUPIt7eNYg7jBwtnUsIttyKse5sn/1wK4zFrnio
wAb/h+DYHB3O1yWq7vmjVhQj2l2GKGiBUV8dDKi0lvZfikEtxDvRHJcXaQnN2fGP
QulQf/fMcTHrk6qspN1DDry2DCbzVdAUQNLQ8FJ2pUSUNdOc5lgIqE9vKlBV9M4o
dKeNKwBBAktUgv7JApsKhIH3/W0TF64sNJyiD+WiyCp7opLTRmjRGRsUG2259PGM
YTCpWbMazRN1DL1ckssDzb1WDJUiMGqMsDopJ85J5/oLF9P6nE0TdOtIMu4QzT4x
TjqFn6zcNS8aCV0M0WhbQDyu0Jjq4iR0Rk0p7xa17DrHFvzP9pI=
=S5eY
-----END PGP SIGNATURE-----

--UeWkCNdaCPNdBog6--
