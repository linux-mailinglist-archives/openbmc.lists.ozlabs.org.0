Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 838831A109B
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 17:48:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xWym45yrzDqvY
	for <lists+openbmc@lfdr.de>; Wed,  8 Apr 2020 01:48:16 +1000 (AEST)
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
 header.s=fm1 header.b=snwnO5zu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=jsv+NtI1; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xWxK5DB9zDqS4
 for <openbmc@lists.ozlabs.org>; Wed,  8 Apr 2020 01:47:00 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 49579719;
 Tue,  7 Apr 2020 11:46:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 07 Apr 2020 11:46:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=qC6+JtSCmT5Mb9rYE8xWkki6It3
 8LOmwi4FIGzmnPU8=; b=snwnO5zugDKh335PzF0ZOzxlX9jjFqdtnN9TL19mV5O
 omMNdjmiL5W33t/1HJBpdQ7BTIvFyNtTvVWQQY0bjFV6kTHN3wJX7DA9BFZTgNq0
 sLOQW7/Hv2yPEaW/8JiOGwmGuSqdb5/6FwhP+/TGuDE8SXKBRGr2p33NqJZblJCA
 Gk1Xxv/G4rJ1Fp/HPM+InhwfnBlWKIerBlgiCzd9vIlF/e09ir1vGr0edYLYwBqu
 HGuhnDTowXcjBO74Loifk9XQ1JUHJEVs5HGlkZA+Bqh5a1G0V8v8QwwcqVhR2igO
 87VYrD0af8idvqc9hdp6gKLPKG8lIaRSZglS6x1RJQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=qC6+Jt
 SCmT5Mb9rYE8xWkki6It38LOmwi4FIGzmnPU8=; b=jsv+NtI1GxvFcZQI+Mmt6A
 qzd6DdjVMNGQPIlzyMfueZf1NLPdrZX9G3VMUsE0tBrFAT7sGX6/GheOuX4JSTTn
 wQNzokIE1iowsL5CA502a2kBPz9aMwPrW4VZoFAQidhaIHTfDh/cBXx/WiCIzGLL
 8CZlt7YhND3nR03xF3fIObYAH77o+DKR4mhX6cw/DH+HvZGyyfAcp4Ze5DWIWRT6
 8mPIyWoUCBKchuH1t/OrrCrqX+0+Dgnj3MQEOw0MNpOH9tv5I4H5ZNld1MHJYVY3
 YWYdPirjqReQP5Ea16UdloG5MgwE9NTTmU1OfyQH6xguuJDwGPMiETDObaj65ung
 ==
X-ME-Sender: <xms:b6CMXkTBoRwqEV8bwGG60VjhGduHiUaZRY7l7TDF9dVocUhrHE6dvQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehgdeludcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddu
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucfkphepuddtjedrledvrdeitddrvdefleenucevlhhushhtvghr
 ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
 igrdighiii
X-ME-Proxy: <xmx:b6CMXmBXV0hsKWpBkGPeVocxkPF4m5gwmI1AsV6reP6eugFTfWYmaw>
 <xmx:b6CMXs1g29OOKx65Mw2LcnihoyXK0y_yS_8Iu8IYfnoiLXDh-4Lytw>
 <xmx:b6CMXsVuW1-N2aAxbOFgafQQXCBCeBiRaQNyw7pMZ0uHUwAeUkb_hg>
 <xmx:b6CMXij_r2geUV2LrTGClUF7MV4Df8afWBbXq7Oy7_4vEYQwi_d2_g>
Received: from localhost (mobile-107-92-60-239.mycingular.net [107.92.60.239])
 by mail.messagingengine.com (Postfix) with ESMTPA id C053A306D5E8;
 Tue,  7 Apr 2020 11:46:54 -0400 (EDT)
Date: Tue, 7 Apr 2020 10:46:53 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Re: Why does OpenBMC use Avahi mDNS instead of SSDP?
Message-ID: <20200407154653.GB5368@heinlein.lan.stwcx.xyz>
References: <64ed3841-fc25-50d2-5353-d778301ce06d@linux.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline
In-Reply-To: <64ed3841-fc25-50d2-5353-d778301ce06d@linux.ibm.com>
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
 Gunnar Mills <gmills@linux.vnet.ibm.com>,
 ratagupt <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 07, 2020 at 09:58:15AM -0500, Joseph Reynolds wrote:
> Redfish specifies SSDP [1] [2] as the standard discovery service but=20
> OpenBMC uses the Avahi mDNS discovery service [3].=A0 I asked Redfish to=
=20
> add mDNS to the spec [4] but they don't want to, and pointed to their spe=
c.

Avahi is a particular implementation of mDNS.  We implement mDNS using
Avahi.  MacOS also uses mDNS with an entirely different implementation.

mDNS is used more in the UNIX world, SSDP is used more in Windows.

I don't see any reason why we couldn't support both.  We initially
supported mDNS because OpenBMC is Linux and OpenPOWER machines were
likely running Linux, which more likely had the mDNS software installed.

> I want to allow the BMC admin to enable and disable the mDNS discovery=20
> service.=A0 How can this be done?=A0 Options:
> 1. Implement ManagerNetworkProtocol.Oem.OpenBMC.mDNS.
> 2. Move OpenBMC to SSDP and away from mDNS.
> 3. Re-ask Redfish to add a ManagerNetworkProtocol.mDNS protocol.

I don't see a strong reason to "move away" from mDNS, but I certainly
think that *any* network service should be able to be disabled by an
administrator to reduce the security footprint if the service is unused.

So, either #1 or #3 seems best to me.  Adding optional SSDP support would
be reasonable, but likely only to be added by someone who cares about
discovery in a Windows environment.

--=20
Patrick Williams

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6MoGsACgkQqwNHzC0A
wRkfQQ//U6WTB+wH9x6Y8p2SCqSChq41HG2MdScFpYCJP7Fq5KIJ/fc3P66SGspQ
q2FVhNb5iVVCXjrsEtj2WYHGkj9FtGjLaP5jU4+tqaWghNHo5/jrigdZ1PCyOv3I
s1xwEFm6WgEypKKEbhY6Emis4PluwCyn8cW0Mr1UbzNJR7Ic0DngYi+yLl2NkEDr
HksgPoRzJplRtF5l4E/Y676DCTgFbm832n87cjkC7n0Hi6E/0mRvl9/Wf2RNE2xx
VNmQeMDigbkhTHJlODM75Orb1pNvpQ7SYEMn0PRUcZXGjZmt0+2cg5UZaDz2zT1q
/3OYyxPwwhj3pEC4EtcitY7P7TRVA7Nk3hUBTsY9W8alFGLqks7H7CsdEzkp/XLj
KYLyOXCUbj0j9QLZPnObKRSGKkLloK/XkCso9iycY2x2IiMwO88FWmZQ4sMHnN1l
cZvQgCEreEmiuHj9T5gGTsz81K+ENwM1gplcNFQ9Qtr8/hVWjEyYU7/9bw23cLuq
UxAjSeOkZ5BU6743MuhKQyC5k5mZ41l9vjsxd4OY6xX3J5PztQhuUjA1t1AMqZAf
c64BYqARLX1C6gk4lFANu3lzWp9oZ3sDeihm7zmv6i2MeKWbsb6uX2Iyd+UeHhC7
rpWLBeQqCPRSIAKJFpiiQxnkuraRIw7QJB0wP7WhIjePufR38uk=
=v7Fz
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
