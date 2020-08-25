Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E08251AF8
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 16:37:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BbWmr1rHszDqLP
	for <lists+openbmc@lfdr.de>; Wed, 26 Aug 2020 00:37:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=OVDdgl4s; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=sPjxDMOI; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BbWYW2pfmzDqN9
 for <openbmc@lists.ozlabs.org>; Wed, 26 Aug 2020 00:27:59 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 604EAC34;
 Tue, 25 Aug 2020 10:27:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 25 Aug 2020 10:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=SUYQNxewUQ7Zh1Y/mxbH3aCG1ho
 otns3RIznbZUWwLk=; b=OVDdgl4s70Bl4xZXCuKXmiU9aOA0IjDgkhAzoNRQZSj
 yIt39iQaIZovs6UpYE0xQo0jKpH+UxKYYDyaurK3g8l2XwWLEsjRtTdj74pxZPK5
 gMuj714i5LbDZJXQBBiLLaF+31OCyYzzRJlkOpOHa49be5KMq1K1nQ3k0aSaHZ8L
 a1914wA4cZg4e+s9z14OYzkVBSuTlsRRnnlOCQbgewlQiRI3PGl5X+z2K9xAPY4K
 ZeSk1GQnf8BbDVKFQphmedfn/20KSPzWq8MZPP27U6kKC8b4yy+4ySH/AMF1QSXR
 5376rWCcCwffwyQRaEn11q40a/h182RpoLbMi5Da3Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=SUYQNx
 ewUQ7Zh1Y/mxbH3aCG1hootns3RIznbZUWwLk=; b=sPjxDMOIcZmuaFtbk0aKVi
 +QncHqLe+W7ScLd5lm69jVRxAWqmi+x+M9wJUYZ+pcZCtv6d7XYDTsc6kKsvrxfJ
 Jwov0mQ4SZVtKFj/Hf2ma7cWJFt3N/yubnl1ODtOLWAuYq5AV9M+cmJMlOydGfF+
 plRmvQShNDQX9GbsiWAOd7tu1ZResa0nSixtYC5bF+XK8iYMtrR7pecXwRulZ4H0
 uDHpFsYFp8R3P5YFXR3M0qJtv9vaCwed23R9JAwpy5Mf+hHXiB/Br62mivEsj75I
 HWb/eCd87KaVYQ3AiBsKK4kI37BDRsa76uS3Jp15JKUyNd/gE9L4PTmhz/cOsL/A
 ==
X-ME-Sender: <xms:6x9FX7plDuHQdso4f5y0EUd3oeihoJ6QJ65S4276DYFgO7yAlUN3Bw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedruddvtddgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnh
 epgeehheefffegkeevhedthffgudfhgeefgfdthefhkedtleffveekgfeuffehtdeinecu
 kfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:6x9FX1qI9B2JHxq2M5Awbo2j054nglhJFd-NA1zSk2Ag1xtwFY_1wA>
 <xmx:6x9FX4NC9ylaxT4b88k4QDMQU0J1q36YoAwo0UYNsk-HaLShomZKgA>
 <xmx:6x9FX-5vsDMYOnrQb8eLfF3YZE_3VHQkbNiGXNQiEt3PFfUW3V8EnQ>
 <xmx:6x9FX3Ws-8fKYFPEhRDuA9pUZkg3XtfyzsEwAJGtdcojQM0jX0oHnQ>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 92A403280063;
 Tue, 25 Aug 2020 10:27:55 -0400 (EDT)
Date: Tue, 25 Aug 2020 09:27:54 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ed Tanous <ed@tanous.net>
Subject: Re: moving meta-{openpower, x86, arm} content to meta-phosphor
Message-ID: <20200825142754.GJ3532@heinlein>
References: <d6d450e638d016d29496ef1713083e80551a84bd.camel@fuzziesquirrel.com>
 <20200820162955.GC3532@heinlein>
 <CACWQX80NWqfES4vA7M4+jwrfp9Z+HWt=_ni3cMzc4yaw9skekg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="x0KprKst+ZOYEj2z"
Content-Disposition: inline
In-Reply-To: <CACWQX80NWqfES4vA7M4+jwrfp9Z+HWt=_ni3cMzc4yaw9skekg@mail.gmail.com>
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


--x0KprKst+ZOYEj2z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2020 at 09:53:21AM -0700, Ed Tanous wrote:
> On Thu, Aug 20, 2020 at 9:32 AM Patrick Williams <patrick@stwcx.xyz> wrot=
e:
> > 1. What do we do about risc-v which has a dash in the architecture name?
>=20
> Technically isn't RISC-V the same thing as power9, and we just drop
> the version from it?  Or is the "5" an important part of the name?
> RISC-V is definitely a case where having the company in the naming
> convention is going to be important, given that (to my understanding)
> the design can be picked up by anyone and modded as they see fit.

risc-v is the full architecture name, not the chip model name.

Linux has chosen to put it in a 'riscv' subdirectory though, so dropping
the dash seems entirely reasonable.

--=20
Patrick Williams

--x0KprKst+ZOYEj2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9FH+oACgkQqwNHzC0A
wRkilQ//QGgVRPed2jzGtWxlwOXZmQ5bJp0IynBg77KVReiwWMQbH0U7kIpv9Z4G
Ujhtv5bDtOVMc5FQi5B2MEodgt7qSSaWmy+ijFNx6FT2T2YnnV8Ju74DKypBUk8m
5x8FhnqEkrlLqnNzV/6w3VOGAdzxcyo6bBFR+9WyXsleH7TpHRWRKegGfy4pk1CP
nSdfVd1HxiRroTOSi8ZGN5KZA+0xmhN85jPwW+OxcsilLTtV5qNyF7+izcc9i6jE
1o3uga+fRGf3ZjxCTBMnE10pg+FhUfWN9kb/Na9yGqT61D6Or4+DY+EAeI/0w1gz
+rZub9t5j7D1TY9VQOT+VIgP/doYj2OhNDFSgDoQYV77QZ42lTCJeo+8fYVrJX2X
vGfzm9jzoMzZg2+yMF/IvoPyYo2WgUeqYuJ5SIaRI8pyWylKlAzONKfXJ2RPMNFK
0INaOnR4zLbhM92KhVGpHnkhbUngBP/jqCxJG/AvmMrnCNH0skhnQrHmM4oo7MnM
9PBvlwJIVJ5TgMuTu2LFLIDYeoTUHWbUeNTw5hX6tcCLSBtCSt2GKek1Uv5rHw3D
hGjQ063OwPiTIALZRzWXZdrZ/6uLo+FHpY756bmwE0hc92n/ygvviR1Q4u09utGO
jK/+swO3PnFeKJOVO8+BitC5QqwiOyE+oImatUbTQCip2r7Gu1g=
=3iWe
-----END PGP SIGNATURE-----

--x0KprKst+ZOYEj2z--
