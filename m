Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3C01E5E33
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 13:27:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XlmN1Xb0zDqWs
	for <lists+openbmc@lfdr.de>; Thu, 28 May 2020 21:27:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=BlBv0GRm; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=nQZFNTQ2; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Xllc2m0czDqWp
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 21:26:51 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 88EE15C00F0
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 07:26:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 28 May 2020 07:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:subject:message-id:mime-version:content-type; s=
 fm2; bh=g3xKlhlLz11MDHau2YMZCkLH7fZ9EvwiTvSZl9sP8NM=; b=BlBv0GRm
 WvnYkzsPchhK2/72eAUso5BqnJ15sKALBT4BbRuYVaUewFDjBjZKPb0tzOo4QAd7
 RwOrOkEYwClAfcb9jWBtswDTkf2vxvucW9Y/1eVqbFZMlYdxJEgpsgWJiHNNQE7B
 Jc3Kx1Pmfk8s2OnPjioHupUwCk2+Ie7nWV41G6HYNJFx3TVgZlLEAlffYjQZP9KI
 4bHBL/rC1vijTwyTDtiXiq1JCFf7NnYZQc19wy6paaA5nRKV3za8VQCiavX8Jjj5
 5Rs8I9Y0LDxiwYjG+49gkJuAZ0VvJqDqXQ5MybPapggvVR79w9ely2V9UZtRNb52
 JcdCVTfG8U/15g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=g3xKlhlLz11MDHau2YMZCkLH7fZ9E
 vwiTvSZl9sP8NM=; b=nQZFNTQ2TaZvYYA1N6ZhYCXEJ0nwtgVDp9n5JhPwZ8JYg
 r63PtX2zN6Rg8GkK4P1b4/QCRbxdv2aBzJDnYKqXBYzBxpSBxZJMXTpJ79IbldIJ
 qs+6UcP2dB1SnUPK2QFg+nq+50j67IiIcA5VwL/MbhQKtvxBvkehiC0Qav9vBHh4
 zUEV/eQEkvBOBHmSxokA48zSyAbqCMRlo38/JE9myrvbbsXyj7HjTYY/hLU9Tpno
 p4oEnqT4ZQzxDLRH8qx7o+B69GGPovlU46zD1NZOrOwhqs0EiZ/drLRKwrN16GLK
 RGuSe51Zv10QOmb+PENiWpj1KlTQb3MRFkeFOECRQ==
X-ME-Sender: <xms:95_PXgLfBZoGFG1jZS-GrT4xQka2gLBE6aesslBCzYUwC0u6RFJreA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddviedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkgggtugesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgr
 mhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepud
 euvdeftddvveejudeuleelkeeiudevjeffffffvdffvdejkeeujeevteeifeefnecuffho
 mhgrihhnpehgihhthhhusgdrtghomhenucfkphepjeeirddvhedtrdekgedrvdefieenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhi
 tghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:95_PXgLcqXTNn-zn-HGOzciU36wUoDNz1MObAYVjfmFceuzw8nYfyg>
 <xmx:95_PXgvRNM3C1BwysjydIH-KPCOCb0YUixGo0QNY5yC3QyXWoleohw>
 <xmx:95_PXtZPVFiOISIJa7h4HaxchumXdxpFg85FhX1072-XwD6OTniIkg>
 <xmx:-J_PXvphLmVnuL1reG8hkzg0J-RjPVcvIPojei0InrttnGo4rFQZUA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 585C43060FE7
 for <openbmc@lists.ozlabs.org>; Thu, 28 May 2020 07:26:47 -0400 (EDT)
Date: Thu, 28 May 2020 06:26:46 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: openbmc <openbmc@lists.ozlabs.org>
Subject: clang-format update
Message-ID: <20200528112646.GB17541@heinlein>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
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


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

All,

There was an update to clang pushed into CI last week[1].  We are now
running clang-10 on the repository-level unit-tests.

There was one change to clang-format that added a new `BraceWrapping`
option called `AfterCaseLabel`.  If your `.clang-format` file doesn't
have it set to `true`, this new version will likely reformat your case
statements in a way you don't desire.

I have put a fix into the common `.clang-format` file in docs[2].  My
suggestion is that the maintainers sync their local .clang-format files
with the one in docs[3].

1. https://github.com/openbmc/openbmc-build-scripts/commit/80d0728e6d5d3d62=
3cda26a1bfe93d2eac4a8d3e
2. https://github.com/openbmc/docs/commit/b6de1960d9b896f2b48e6b0c676035afa=
0e432a6
3. https://github.com/openbmc/docs/blob/b6de1960d9b896f2b48e6b0c676035afa0e=
432a6/style/cpp/.clang-format
--=20
Patrick Williams

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7Pn/QACgkQqwNHzC0A
wRkefRAAioy+PJSc3e+oVcbPbcM+n07Exl35/tNXawqR7LLe8xZ7BDPIkZvnB6Wk
v1tRXfhMQkX3hqqd3X5XLa5ksH9HpSa9Y7wHjxd144VID2zpGuoYCCrq28ZYhOnJ
6s10CoHzAvhZFYPjPswew7d5U9+EFoyJQehllga+i16Q9uMD5GhmMPCy8euLZbOX
gTY0g2GqNspbvbdVovcn3UgaDbroyPWQ3bQvmSdW19uMmBROj8rcy16qSJTKdwp2
YuSREgW70CgGyzBorkkHUe6WgHEceRK8Dkc4gxdqRS6OIBRvKmQEpyooHueVkbyL
/38h2eujinPGCvyGcDc/Sj2uyUBqcbMZ/Yj/E7ydiBc0D2Dmxgouahhh53rusJ76
s8QfHDW81LWMmqFAqoqrG0noebIJe+E5XFkaxk3C5QavKuGqqFozPhelh4zoOZMd
uDR5b2RHEhKm8JwhY62MIUcGQnf+Z1r+wpTh3wf0OsxPktX4CF5GYhoTU8DD/4Z8
Zlpo9tAzEx+I2Yy+5dPK/aFtNnib15XLJZeJHj04AYG94LzIL1zCGRIpC98IYcRe
zNU2Wos7RvhcYpFnCQuGE7Cd6njnFJPVAxWENySlyN38naLH4UcB0R5YTXeq3lYi
kkf9oPD6R6rmmgxOT6XLATKQIS3yJJL6P9Sh2qHTnH0j7UiXojM=
=83An
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--
