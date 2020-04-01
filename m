Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB4619B7E7
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 23:50:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t0HJ6TdVzDqWQ
	for <lists+openbmc@lfdr.de>; Thu,  2 Apr 2020 08:50:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=Hpd3kWwD; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=EeaKLSnd; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48szvH3QtWzDqWb
 for <openbmc@lists.ozlabs.org>; Thu,  2 Apr 2020 08:32:58 +1100 (AEDT)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D63865C034D;
 Wed,  1 Apr 2020 17:32:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 01 Apr 2020 17:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm1; bh=TgUDlSiUkIzg/5/lHLvBsGgUKzeodAY6mLveysgjJ9U=; b=Hpd3kWwD
 mIvuob2XB5nZDf2/6gbGWVUzA9pFxLCH8C/XpecRUCbSwltfflAREbVRKFNucNIi
 FrJvwEvpIz2fPc1wPQw7k7YDBkG2pcOkA2fiPBYgUyaYV8Bh2dAuVbfDOLji03KF
 pt7oEgsefb4sbu23tjzXQw+rzWa/cE2PX8DeWCXV7M/sO4349iweWj42y1wBTCrW
 Gt3/f7Z5G46UibluFn6L0cVve77MAsHJ22C9kevgMPQ9KN2Mtwaw0WfiKvPbddSy
 I2O6y4F6honPqQinvSqHInFmyxinEytISxaSz51G9buy7sKTuIxdp8xzejEfqBm7
 8VzrDn9ygjhbTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=TgUDlSiUkIzg/5/lHLvBsGgUKzeod
 AY6mLveysgjJ9U=; b=EeaKLSndeAD5rAUrQCYbxVPH4q1LW21vaa+FIjswJXTNr
 lcM1RS8ueCuTGL/SJ5k/nYanSLfwuzdfMuz3bBywzIN5OZLLEFTyvC7mi7+q9URp
 kHLwPS3gguIAAMbexBbTo72vHuyF6C9gtxDoT0/bKdJqNkLre8v7xQLBAclk+54T
 PHhA/oMSTiCRZYvjnfN7tJ9khpwaZvMM0MYvpssg5jZQIwCAIp51UOETGrHkUOwt
 z3lrmrhlCftM+GZ63JfLB3aC8yy5PEvVJPZGLaOsyoaQlzbf070T1+DaV77dzrLv
 Fa2W55GIq86ngkZ2o7JD8dHv3i4UsWq1FNKKz0SLw==
X-ME-Sender: <xms:hQiFXgHcIt8_NWPTB5AALo70nryYBsNQ_jW8Hnfo6u28Y5nav3OFXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdefucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhluc
 fvnfffucdljedtmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvdenucfhrhho
 mheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgi
 ihiieqnecukfhppeduieeirddujedvrdduvdefrddvvdehnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgi
 ihii
X-ME-Proxy: <xmx:hQiFXgMOzmzFT27IPaZ--BHRJe-F4wY5sT5PgCzOvA_-etFx4c0HGg>
 <xmx:hQiFXnEqqAPXaIuEcj5hHPgxjzEbZsRh8vhDNV35f-HKMDS6ZGY9aA>
 <xmx:hQiFXvOhujBfaexwdLi4mEr9jN3Yo_2a_92CIcnJ9gCMfg3LN-tScA>
 <xmx:hgiFXsU8Amz947ImxBBbI09M_fT47X2Qh2kyGJbx_gZsx0srxERsxg>
Received: from localhost (mobile-166-172-123-225.mycingular.net
 [166.172.123.225])
 by mail.messagingengine.com (Postfix) with ESMTPA id 550FC3280060;
 Wed,  1 Apr 2020 17:32:53 -0400 (EDT)
Date: Wed, 1 Apr 2020 16:32:51 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: Dead machines?
Message-ID: <20200401213251.GA580847@heinlein.lan.stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
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
Cc: Patrick Venture <venture@google.com>, Yuan Yao <yao.yuan@hxt-semitech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

As part of the python2 -> 3 transition, I was looking for recipes that are
still have a "inherit pythonnative" line to see how much farther we have
until python2 is eliminated.

I came across two machines that have recipes using the very old
"config-in-skeleton" feature and include python2 machine configuration
scripts.  Running python 2to3 on the contained scripts give parsing errors
even.

Do these machines even build and run anymore?  Is anyone planning to mainta=
in
them, or should we delete them?  The last time either meta was touched
in a meaningful way was a year ago.

=2E/meta-hxt/meta-stardragon4800-rep2/recipes-phosphor/workbook/stardragon4=
800-rep2-config.bb
=2E/meta-qualcomm/meta-centriq2400-rep/recipes-phosphor/workbook/centriq240=
0-rep-config.bb

--=20
Patrick Williams

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6FCIEACgkQqwNHzC0A
wRn84BAAkqfyDrDXG5mGJhvuy7jzngw9taJ0MKK4n7MnubWJeAWKnbapIS1M9RxJ
Be1wQB5CYxKeSup8/VlDKrGNeSM6MWwV0R7k1dzwtyI+nRyenCRxLOtgngSVLgHP
N0PT08cyuQcdtMLOm6qP+Ssd3+hrV1cKhJJyz5UqZlNp5p6sSOEhal9yjWxVaNwd
cSMWOOq8gNYq4PLLH81GvSCc73XBsRcTjGuuic6E0q27IilkT+oCNenY7X3f/rA4
1/66l0VHkH3BOtVLGGTnhTRhFcPxoXZJNmM1C4Zxr57UZWvOEnn0/BY3/Cb1XaO1
WUFLUH7j48JrNRyeRkwO6hHkX7N+++6dbVbK3N5Xqupn2ADl+XLqvDxGOOOOXpMi
Ar1GYpbj0aZmXvhkDO/4/xl3Kt4y3KxWEh0WS5eTSyiZ8bE8lj0ggJ1SrRYYVM2+
fmRkOTikcMFu5H0QXmCdexA1PqjjbgcqvB+1WWd18U3u722bQR7xlB/ZZIX9LviN
aYFtn8bQzYXxo0h8IoCo+6rNH/0d1cQuAaLt8hIh27cl6fTbaMdzZGDZteP6BLdW
dkvwq1ICEQStZHZhBLeekVTd4VEa366XfYSRAakVewdbjkmE6wC1wUrdZ9OYA/CW
hF4CzXYiH7Rq6E2X+gB/G9LoviHWfDgQJnaleyhejj2pBD3G9w8=
=f9nd
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
