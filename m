Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2158E14D1CF
	for <lists+openbmc@lfdr.de>; Wed, 29 Jan 2020 21:19:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487FFw4Xv9zDqTD
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 07:19:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.27;
 helo=wnew2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=revSzB4x; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=KUgKYjtC; 
 dkim-atps=neutral
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487FCJ6VtSzDqTy
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 07:17:32 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id E682270D;
 Wed, 29 Jan 2020 15:17:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 29 Jan 2020 15:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=WLxyGvPWjQ7+p+uriua9kG9+K4f
 mM0anaMMnPf0FFcY=; b=revSzB4xwBu6oMbzoQj72bZwDqkQ2zJnjKU8QDjauAO
 5TKnMez7JWCXQ2S+WSS8GP4J54UQ/TvpLAgFPyWXE3RuGamXjle9UEgs8X4c9p0X
 HN8U9r/UgQ7E2+pj7XsHNoAtLgo2YCe4sidcorKe5aHUVh6L6p+mYYcrodLWk/CY
 wOz7k5W5DZ1d0AEHUgGT+NUna6CRawxa9UAiqN/QREoyNxeYjUyDkUKjAGSDvT0F
 f/kxD29sUyApWBEk58hL/u1nUmmvZ/YWmsU6ExPrT1HYIXWVit2Sp+BPYmogLEMj
 PxkA8/5oIX3H4PtFNTNsPfZlhmYH1DSq67W2ruyp6Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WLxyGv
 PWjQ7+p+uriua9kG9+K4fmM0anaMMnPf0FFcY=; b=KUgKYjtCyRMpmBler9r/34
 CP2CzMN2W/Zad8hXr/3U2NOgA7q29coh9mVhSgh0VAIOesjvysj4ejnjVWGs8je9
 SPykc7AlZRZkwqJxwlXbS8n35kSDvdshMRDnSFu3tFmWAqP7z6NUI5MmOvFj8lmv
 7WLXplWNsVIF1Q3ZK80THVWnGP08IZ66ZD86eLeXm3D2r0iO3qAuT1ZolzLvGx+m
 aozi+7SYyJyB1hnsT0bKSPePQu7AGo6utYNZ1fnp6Ru4Bl1ofAug73jJ4rs6FAKp
 GoRn/SEM02DyMYlT1cDhQWfm+joD8Y3oOPyH9g8duzKy1ZKviNReqVp3hX1P5V+g
 ==
X-ME-Sender: <xms:WugxXomNIMdQOWyCoRuoG4uG5FZjwyVW8ZI01mflJ-Uyz-YGJyiSSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeeigddufeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppeduleelrddvtddurdeigedrudefvdenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
 iftgigrdighiii
X-ME-Proxy: <xmx:WugxXirriR8SJ9ZVS-c1sKgw75_Dmq0Hv7tWMlcOzt9MxOztbelzGA>
 <xmx:WugxXk6p4F8_p9MWRQ1jrBSGFQP5ijtyJkGRmOAYZOLGVtDLjJbAXw>
 <xmx:WugxXkLik2yk0zOm64MVR5mxb818YpjoPSujA0hkOmiZt4Y0cZxwIg>
 <xmx:WugxXjD-8qpxYlpBhsUUggqnTOEiVYREWjlRLahAExuMgBKGjwhqp37WZkp6SDsa>
Received: from localhost (unknown [199.201.64.132])
 by mail.messagingengine.com (Postfix) with ESMTPA id 27C423280059;
 Wed, 29 Jan 2020 15:17:30 -0500 (EST)
Date: Tue, 21 Jan 2020 15:58:18 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Subject: Re: Add OEM Interface in bmcweb
Message-ID: <20200121215816.GB59535@patrickw3-mbp.dhcp.thefacebook.com>
References: <98c85219-dc21-8012-09c9-6285c7a7a235@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline
In-Reply-To: <98c85219-dc21-8012-09c9-6285c7a7a235@linux.vnet.ibm.com>
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


--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 12:43:57PM +0530, Ratan Gupta wrote:
> 1) Introduce a compile time flag in the bmcweb

> 2) Put all the OEM specific interface functionalities in the new files.
>=20
> 3) Include the new files under the compile time flag as majority of the c=
ode
> in bmcweb written in header file.
>=20

Do we want OEM commands to be in bmcweb also?  Or more of a plugin
nature like the IPMI implementation?

It seems to me that there will be OEM commands that are not open source
either due to NDAs on certain hardware or secret sauce in data center
management software that various cloud vendors have.

--=20
Patrick Williams

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl4nc/gACgkQqwNHzC0A
wRn0KA//bMtFyHPiNVcP9e9iE4qJAyY3nK0Exx6IAYcIYoIO5I/NvEF1FowRn8Yd
eSLkrYlHSdBjRrojl16/kS27Tb6snR2j0DaZeI85U+ruytzj3/zkC/Vy1VceZ85Y
OvJeHnKv6t8CcOrtsJMNxvTQyCyAEVFJig3LBjG3TEehBGGtLO3fXC0DQ6UECXuQ
4bNA93UgbTcojA3dFzqawHwIaeiCwHuwgBefrM4OGALNGatapNL5Pl7KaclsJ2JQ
mGAvxwukNQaB+K/FbnqJk6q285QS7K7nN7CuyI1jKmtZc2rYEsY+ZWbCPjUpnZwZ
BMnzThK/IPZ+vjcLYRmevQ3leWtOzKGA13PBqQ4+hNpZ6Pg8FZ6tre8/1TqulaOc
s+6gv4ROb6oqRYryscj6gDmytMtn/sRPAXDmqSA4sBXFD08H3W3RHX3O6w6m7hP+
NAS9REf9VtGH9bmMcN/TdnsOhvAdjFNhU7DePtjt+BsNqX2/7ldzvv2RcZ0nmh53
1ndDbrWqBsohYNQNN7X416eudguwh97ekaA8MEPPZWiUEhGh7tJIykXtk7Wr4NVl
IqyMnG7yEckFQVKvLFFwa+rQKftGVeX+Qn3a/st3ykYuM++rFQ+3Ab9uyYYCydoC
SYk9EpXB0c7UQu11PuSubg0QkdQSo+zuBabaXk1qgZGngNzw884=
=N+bV
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
