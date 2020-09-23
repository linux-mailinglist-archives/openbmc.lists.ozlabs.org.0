Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E05C32760C7
	for <lists+openbmc@lfdr.de>; Wed, 23 Sep 2020 21:11:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxSTb3Tn4zDqch
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 05:11:47 +1000 (AEST)
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
 header.s=fm3 header.b=irdsUkDn; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=r0bFgC3x; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxSSd19xvzDqSF
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 05:10:55 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 5CCBA5C00F2;
 Wed, 23 Sep 2020 15:10:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 23 Sep 2020 15:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=fZbntJSw5AC/6/ErSXVjURPQla5
 ylhYeqrlp/G4isjA=; b=irdsUkDnTAN0uTReHuPMTurZmhse/GRMXE8RJVsEvP4
 gy7lv3moWDfeAc7RdnI0csbZ9frE7ozjbkiR6rbGQggThzIz4SYvUZfSqIlsLUMe
 SlK8dSVpByF5/3hGnLOzstBi+sRaUQI26KgYZZ5NqHUR47cP6wSNNcMFlnNVRwJz
 k4Nnbq+fywaN+aQ5ZA5koyH2QPRyTypaohBBOr/UQ7HK1AwFX21MdR87ryLklauN
 rF318TqCSCk2N5oWyakYXfeXpWCv0qz3Umyi3GqZUtYlniuItuo5F6uJUyRx/w3X
 4/1RMqaFFsKUaKNpNRIP0k3ASlbi+MXvumYan9LWWoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fZbntJ
 Sw5AC/6/ErSXVjURPQla5ylhYeqrlp/G4isjA=; b=r0bFgC3x1g9+qFcadfuGFs
 AQSsAJsp6xJBsc7IJiiBnlsmXMiIZbKeuyFJ0zxMcFDIYx24JjMEOKuV8kGdVTbj
 esvxXw6O+VTmG1G+sSj1eoGaxFm3cJXf3yQMhG3fxmNC5E2Ay9M8sdRSLIQvy14a
 EicIkIz6G1tMH9tA3jRlaA9d60WQjG0FWK+jp5rypGcohy03pHYgXYMjX/5201fK
 iCZhe4jksEmD1QjXtNxd6y9ee9RFq155dXE22LVX77bEu+KL6CKafKneye7O7sJ1
 +2wlwdIth5LNK/eGxXxCqj6/UW5jzheJDZk358Apbp0THPbmNe2AcPdJOdsmHzPQ
 ==
X-ME-Sender: <xms:u51rX0M17SGAyZIRhXVQ1_ZGy2HPNIGTBous-HFSwkaWm0W7tUFjkA>
 <xme:u51rX6_7kwsaAiiocmRQESLwBBgNQY9mQ2dQO0BqPn_MBbLEJPG0oqUPQVvQeBD2o
 BIpf8GauvmXXc5xuBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigddufeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeehheefffegkeevhedthffgudfh
 geefgfdthefhkedtleffveekgfeuffehtdeinecukfhppeejiedrvdehtddrkeegrddvfe
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgr
 thhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:u51rX7S71aBEh_qR69E3omxklqbeNy5HgpY4DYGGoIIifkEWeHA_PA>
 <xmx:u51rX8sPeOgzOxCDlsNkDKN87MzfJ3UxRQbLI7zBpbLW0z3FIvrMmw>
 <xmx:u51rX8fftq6bmN8c3LUQiyGr3SOLKug9JyOX2hsG7dcO7W59RJsfJw>
 <xmx:vJ1rX0kbc5CWZmHqUeW8e1CssZ4XlxsfVkdMHKdAACyz9_tQr8MQNw>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id B12643064610;
 Wed, 23 Sep 2020 15:10:51 -0400 (EDT)
Date: Wed, 23 Sep 2020 14:10:51 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Vijay Khemka <vijaykhemka@fb.com>
Subject: Re: Chassis reset
Message-ID: <20200923191051.GR6152@heinlein>
References: <46F3C05C-7CEC-42FD-A9B7-8E55AE56FE3F@fb.com>
 <CACWQX802HpRT20Zj2YFEnVE7XXBOJXx66-8B1E7TEZdCNwPbsQ@mail.gmail.com>
 <9EC0D657-2D58-4544-BA9E-65D3C4148A81@fb.com>
 <CACWQX80SivNLLE3gAUk+Ao=0eHf_ooezumXGmkkkVhVPFyyNSA@mail.gmail.com>
 <C6292DFD-EAF1-4658-85A7-F81941B12D5A@fb.com>
 <CACWQX83GJ9V9--5WGmVjvacYnw2=fr7URhqOcwkSq4C8GpFoiQ@mail.gmail.com>
 <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AsKt9WDFSpw8OJmf"
Content-Disposition: inline
In-Reply-To: <F46D657F-D4DA-49BD-B78D-CDD420768728@fb.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--AsKt9WDFSpw8OJmf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 05:45:51AM +0000, Vijay Khemka wrote:
>=20
> Yes I have 2 chassis instance xyz/openbmc_project/chassis0 and xyz/openbm=
c_project/chassis_system0.
> Later one is used for AC reset.

Can we do a query to see if 'chassis_system0' exists and use it first
and then 'chassis0' if not?

I think we need to do some enhancement to x86-power-control though also
to only create this 'chassis_system0' object if configured.  I believe
the current code change you did does it always, even if the
systemd-target is empty.

--=20
Patrick Williams

--AsKt9WDFSpw8OJmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl9rnbkACgkQqwNHzC0A
wRll/g//b1ZfCR9GKEzXnDN9p0d3B2uXDuvar5mWFwLAl3MZLx8ZLTVUXB97DHl8
zEqoJ6RF2foHh/i4k9McvhxoTUFkOgy3Tbej5odZDUH4WvGBOHukEfqQBkr2+6wS
Pmn4IP0f25dJKby2dpu97m2wVPW5O9bCcRX7kzDHy9D+m+PMgPzgHda1Rm7srDYm
cTBatHCkm6ip4fv//skrjxROYi3kjhdYMl1zoZWL1vreModWBbHyIqC6nCDKAA2g
EpzusjvSVCHfOIDLonefLiHrh/yhfMuPHQS/LmYvn7w9KrLijaOJCzKo351AE1kU
1Owf/MDy5BtFlM0wkbkZi6Me2ENEgGXUJWOMMnBgwu9X2t8eECPYcMtrsO+XH34W
GEZlke9UaSKRBKXoxWd9iCFozuBK5aBivSDiKFj7vJ/fQj3VczqrzAq+twD74tW9
Yl6U+0MzxElLSgEDLu3c19P2MwcEFBZikbvGwkKdPBlDgoiQcgOCL0cWn5Wv28Q/
0lF/ggG+eaAlnI/C5dNrGo9DCZlxo/s2ZVnXsteO5wgE54dX7NTZr1BhihOkYlOx
NVI807UiLD5X3MMpn9EdUPhibQX+c9uhrEBBhDjQmccaj/vLei97fkbYE3CvPexd
bPrBFEseEoscTiAeDIx/aIjy81hTrHLAtqQ+kD37CHs+cxgqQZU=
=ry+5
-----END PGP SIGNATURE-----

--AsKt9WDFSpw8OJmf--
