Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C53F01A0079
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 23:51:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48x43y3QWBzDqyn
	for <lists+openbmc@lfdr.de>; Tue,  7 Apr 2020 07:51:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=nFc8JfYF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=uCBEZF5U; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48x43H0NzZzDqkP
 for <openbmc@lists.ozlabs.org>; Tue,  7 Apr 2020 07:50:34 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id BCDA07AB
 for <openbmc@lists.ozlabs.org>; Mon,  6 Apr 2020 17:50:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 06 Apr 2020 17:50:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm1; bh=s3GUkJUZPgy6Eu1ZTbfXKFoADojm7HASG8v9vJhmXqE=; b=nFc8JfYF
 EN9oy6XuXC6MPIzhb67IXVjS6ovzYigE/Ocx79t0ZjH0xFbcoWBH4RxjyJ6/GYnc
 HOzXfj8ZCE/LoX2XfP7kHZvbbxTPcy3AgaAquRTIEPiyOubKRoBp5WB6V6ADIWOj
 jp8EbR3fzR5pApxQLzAtIfGvcolRq8gS8lPECYci008cTIwKmRwzzSwiV0V45vwx
 +6QguFHyCNcf+Q7Aj60RQ4/EPhlAx4t8VCTWDWZ81ZXiXoPyp/Z+RFApGwxkatif
 8vPPhLBnaRCl6wDFy92KmL19Cfv0oMhbxlh0GgAY1L6oH5bNfmWHj7riqxJ0LW7G
 2BLsoqnDAuf6Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=s3GUkJUZPgy6Eu1ZTbfXKFoADojm7
 HASG8v9vJhmXqE=; b=uCBEZF5UDNYgg+mlqpdqdTx1HGbZB6qalh6etO86LCZUf
 BJYcJzIEuZzOVBsxijbfzjPE+CHyo/0UXkVIwwz2v10UuoQkxbHwzng0IZtzS3jp
 LCy3e7QLZw7g5AYvcisrMNXy2BC5pmWF/JssOoFv6fw//+1UFiqVWoPUA1YInnpG
 5WbU634z/53izQsYbPZ0u5MOLTrqtGgXXpJktNoUF650SVo10f+wXeo3mJU07Ctc
 NkwrRiqi19WxkTEIRlkHAp6myOZoZkJ7a69rWdmBNgRbT6Lsw5SdU5kbADItPkfF
 sBrVGy/t2UKMZ/iNAbSTxRoh8yK4W4EUE1EhBj1Lg==
X-ME-Sender: <xms:JaSLXtHUc_a166ee01H6JGro59LyWVGo-3zHxPc50IJ2UO4Kjb5FoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeggddtvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepfffhvf
 fukfggtggusehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghm
 shcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucfkphepuddtjedrledvrdehle
 drvdehtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:JaSLXp26KCfMRtnQeKf05q1Ja6jIRt16FUyaUgMVtu_LtPRSdm4ngw>
 <xmx:JaSLXlOZYPwfklg-VYEOetv0LmJH7KRZaKiXuL-pZEDxnSswIPkkYA>
 <xmx:JaSLXhLkFuHmuOcWa43H47pIlKRJfsrsXYfeDJnP95lJmPrCnsQ4CA>
 <xmx:JqSLXqBNfgCfULLuKz-lxbcaNfuzSS0t9akqU6SpNrn6VS8iF1HUuQ>
Received: from localhost (mobile-107-92-59-250.mycingular.net [107.92.59.250])
 by mail.messagingengine.com (Postfix) with ESMTPA id 44D613280059
 for <openbmc@lists.ozlabs.org>; Mon,  6 Apr 2020 17:50:29 -0400 (EDT)
Date: Mon, 6 Apr 2020 16:50:27 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: Old PREFERRED_PROVIDERs using python2
Message-ID: <20200406215027.GA5368@heinlein.lan.stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

As part of the python2 -> python3 migration I was building a few
machines to confirm that they did not have python2 installed in any way.
I noticed right off that tiogapass does.

Tiogapass has obmc-phosphor-chassisd and obmc-phosphor-flashd pulled in,
which are old python2 applications that aren't suppose to be used
anymore.  I did some investigation and these are picked up due to
PREFERRED_PROVIDER values in phosphor-defaults.inc.

Are there better PREFERRED_PROVIDERs we should update in
phosphor-defaults now?

PREFERRED_PROVIDER_virtual/obmc-chassis-mgmt and
PREFERRED_PROVIDER_virtual/obmc-flash-mgmt both seems to be a custom
package group for most machines.  Can someone with more expertise in
these subsystems define a better default (or set of packages to make up
that default)?

--=20
Patrick Williams

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl6LpCEACgkQqwNHzC0A
wRlCsQ/8CyPnYTJr0PXWMeS+avmAGnKyPjEcdAEpVL2S7LhSmcnJFVuLaLNF7Nkj
ekN5wrfITptouN3aCnWHLdjivcumlpl82gPxqsvJWQeg4WdOlDlL5OkJ534ak34B
psVpXllue9VPYwiLuSPHy6WwQtCiebXWkixORNCbW/Nh+ApMWK2bj0zWo8PjD87h
3n4Rk5cL7qyADSVZ40vdC4Rn+vn1+4fQQEO2GHKpYVIt4I1hlXw/2XlqAFqmPqde
g4O67jk1ljruiljxw6RTcmXnJNxq2lVX0eC67/Ey8G2k/cTGou9MYsuKIy9F7c9/
n++M7k2b2Tpw3rD7Uxj19aBCweb77Z5jS1qjx9h0i3wGdq2OIRc6f5wQgrryJ+gw
6g1Xx+QYFe1/EMPNXe6CQNZ+mEXgYUNxEEanAZeClw49foIh0Q6COKQlbu1ognwg
97jCONh914q7lH76eLLhklfyLFX04eu1Kb8pHjy8YHY/zimfaMwdo08Q+mJv9//N
QqrNYVTKLrfVzsU8ziTPtMlII9jHtUVPEGL+iEEHk40RU024zvU5rJOadzVan4te
D00B18ZrrBeEWjv7L5Tu3ONosyyAZUIzDo/JW3b5RjufodTZ3+4Prce04hc5aUyU
GQxyGuVV+Db5CQt7ehRxVhwtJyvIvvhZUjzEOGbEGInYgye0oOo=
=287m
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
