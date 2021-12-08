Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC2746D907
	for <lists+openbmc@lfdr.de>; Wed,  8 Dec 2021 17:56:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8NcM5cwwz307x
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 03:56:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=OFxhNDZl;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Vd/bp/07;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=OFxhNDZl; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Vd/bp/07; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8Nbt2gHjz2xZm
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 03:56:25 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3076C5C0233;
 Wed,  8 Dec 2021 11:56:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 08 Dec 2021 11:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=HkKal48JqOtwZLmiPcvaJr89A4o
 JbMV+KOixhPqjwj4=; b=OFxhNDZlGdMeqL+7dhzelnvQ+vXuigDKmcOZuIjsw+S
 fcnJWEuzx1m3UUP7wzD8GNm3/BAFT8cJmWpGci5swKZuunBJyii6Xp31I2IwFJ6q
 864kHKq6J+4Wy/xkQBCtKeyfJ/SyrJM4KjM7zREX9MXQSUUPRPGW7hVWabD+XaC7
 md0KufSiMD1Nq2HdUO+JkwGHkWKQiuDe1MWs0uX3cI7JzavaTkoTtnayqNMWiG1/
 EbMNRom9gGH6bDGoqKBrEc+2GxnngJwah2rJ6AoVwWifGGQE7fz/sPlK/OZ/Icq5
 wDz5mvOzknu6C6Vj5k6fX/XI0ju8w6eEn9PENjcFgGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=HkKal4
 8JqOtwZLmiPcvaJr89A4oJbMV+KOixhPqjwj4=; b=Vd/bp/07YqSQrGlwZ1Sc2G
 XwxeNWo2eKXovLoirO1iEDGTIb2iLKz5PEkchE8Tz6oAlp+4eK7hkwc4cPm2SyJa
 WBHd41DDwcsp4gL40MD9or3IKERrd/+dX0CoaXyv7zVQejLyu4tcICwDoohz0aiL
 2W7QyQe5aLcKvnbKZ3X4YhKL0nVLqHOXhvrFbhJwgU/zjkBjfZDgfUQklWnYDnks
 o8/5HsK2oGgeB/dR3DBYX61K0U6T/sElfuR7FydGi4RP+lxK+Wh21yDVFiin5+GJ
 bsbko1luzGkixaqA1ZXpea3RBN/Hxg2LT01qsQpIutXMI0NjSTbn/3VDcccmdKAQ
 ==
X-ME-Sender: <xms:teOwYX749KPH_6V_QNlh_9wKW6ajvcZzY20Co4zRmH6Gm3yww7PpTg>
 <xme:teOwYc4drYamCYt8bZEOUngpuSwLKnVj6Bkif-c5jKMQjGHNoDTxYZkHDc6F5CsFW
 zDr42Qo2sJ6t0S1dDE>
X-ME-Received: <xmr:teOwYeccxfXK7kh6CI0wcAf04EAC1cbboLBdZpLhbc0XdQ6H6Rj4wocwuh0OlYWYzz4guftq1zhx4u2qbuD2pHf-126CMbGp9IZISg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeekgdelfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtdorredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtgfdvjeegvddtkefgveefhffhffeu
 hfeuiefgvedufeelieetjeekkefhtdeufeenucffohhmrghinhepghhithhhuhgsrdgtoh
 hmpdhvihhrthhurghlqdhmvgguihgrrdhmugenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:teOwYYJEvPgI4-BnYWKqPEEpZ1ryZum-zyvlHSPWHipFV469Eiuztw>
 <xmx:teOwYbK70S0TT0S3gYFcoQ4uNV0h2QZgyhkqaUJk0uumpEoCXiTv7g>
 <xmx:teOwYRxz7dUouwAf4ZfXX26SrBEVsc7In4-OYXtAilbVzqAyVADu6A>
 <xmx:tuOwYdxPDOpHv0LPZFiyxaj8xUwpEde37YvoYlPWmmFY5bU99bec1A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Dec 2021 11:56:21 -0500 (EST)
Date: Wed, 8 Dec 2021 10:56:19 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: "Hawrylewicz Czarnowski,
 Przemyslaw" <przemyslaw.hawrylewicz.czarnowski@intel.com>
Subject: Re: Virtual Media repository request
Message-ID: <YbDjsxZYYtnNPsCK@heinlein>
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="yzIPxjtNeqDgQ9ZO"
Content-Disposition: inline
In-Reply-To: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--yzIPxjtNeqDgQ9ZO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 03:50:47PM +0000, Hawrylewicz Czarnowski, Przemysla=
w wrote:

Hello Przemyslaw,

Thank you for wanting to work at getting this code mainlined.  I know there=
 has
been quite a bit of interest from various people outside Intel.

> I would like to request for new Virtual Media service repository (based o=
n the design document located here: https://github.com/openbmc/docs/blob/ma=
ster/designs/virtual-media.md).

I know you've got a pending commit to update some pieces of this design.  S=
ince
none of the code has been submitted since the design was originally written=
, do
we need anyone to re-read it and see if anything has changed in the rest of=
 the
codebase that needs design updates?

> The service itself is a reworked Virtual Media which early stage is avail=
able here: https://github.com/Intel-BMC/provingground.
>=20

What did you have in mind for maintainer structure on this?  I'd ideally li=
ke to
see someone outside of Intel be a co-maintainer with you since:

  - This code was initially written as experimental Intel-only repository
    without any community feedback and
  - The current code hasn't been touched in 2 years and best practices have
    likely changed.
  - You're not currently a maintainer on any other repositories.

> And additional question: is there anything to do in order to enable CI fo=
r this repo?

Once the repository is set up, Andrew G can enable CI on it fairly quickly.

--=20
Patrick Williams

--yzIPxjtNeqDgQ9ZO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmGw47IACgkQqwNHzC0A
wRk2aA//Zip+2+8W15svAhA7UgxfAXXC+l+cxDPuVFNco4pbxri+rZoMF8kg1dy0
estBQ01eBnWJVBJzJGM1QIW4a/BHnvxpoaAp77Nb6bNRRZXy7tBgXFivf8O7qDlu
EHOVt0FF9dqTzRIpPuMDM6mu2ClWWr3PaetkX2CD/liyOfToNOrxfCgCwqmkhpMX
3Zc2/P3DmDe7p6wT5IsiQengnIVXRYHI8HbcIKpORmFOtdv51weQTCxrwN8LNLBI
1+Xt2ewzm4M4IYB58DJf+bqbTH+FABIFlpxtPQEUmFTdk/TQuuyvFLKYjIKwu1l0
ffnyagjwezr3YxVXzzm88gBl2S+S7BzAXpn4bIrqsfTvpyMP+PskU5DYXZFE9GZW
cEj2lc9d8NamhBJtchW9/iaZvKrIkhIcwetMAArdF65gDrIT1jNsfawIDOF7gGo4
eml+VzTUbP4IUBNRz/qGp2w8SrAOe77ESuRZsdisprtpws9gEL07SpLI6I2LbPKF
3uHCQ1aYMTNK2Q0DPoPPchI9rEb0YLPkVwFRePXTiAVkwLqNcCS8Cmho1jIiWIWN
qDHZtbcIZdxeJQGQ0ht3IEWxPaRpZhgUJXGVCGKrGFqZBgOxmVUrvwTOru334WJ3
6PLZhlJE/+jcTXiks6Ni8xa4rv70SlyvAnRouuoeAlMxjKXNSu4=
=7w3h
-----END PGP SIGNATURE-----

--yzIPxjtNeqDgQ9ZO--
