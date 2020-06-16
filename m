Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E66561FBE54
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 20:43:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mcXB1jLDzDqZL
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 04:43:06 +1000 (AEST)
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
 header.s=fm2 header.b=ZG8s7TSV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=NtBk0q+7; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mcW73GwDzDqsx
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 04:42:10 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 560C777E;
 Tue, 16 Jun 2020 14:42:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 16 Jun 2020 14:42:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=lgJQsu++xOwvyGid9cpDtBYk33R
 DES53kwIVytG/3is=; b=ZG8s7TSVaNQnOpSbT8nb/m2VASlGq+tHXfmBgORGzRK
 dWeaZ7zj63MCmSClbv5KKzPVOzKU2pbSSEZb/FY8zZeQJWVCceGfunqNZsDJTC3c
 P6fijBZpucl7r3wsU6OSkxvcg7FMsJ+5facLwi6JScNJiH2p/dymA2O6XjdwgUWG
 ecIr3r5XRRozKBZG+2N0WbhCmLEuWmEO7gwoQIfueAETu+m33MY3pW7AqUXnce/R
 5HbtIg7VUFe+VE4tXfaEtHWNSbK+fwxU0OE6ZqLMYy5HVu9rQbaGigSmhzIZKBYd
 BTVGuiG1Amh3whBc4xOAAkn+3bOvs8PJs2LWmrXkAug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lgJQsu
 ++xOwvyGid9cpDtBYk33RDES53kwIVytG/3is=; b=NtBk0q+7k7ewjX5rkX7QkT
 FjbMQ5jY5xfunnbTrwTSzuTFdaoLXfzCkohOh365E2Kd9MpJ3JGgXnOYFK3hAVFV
 HPEjpXkyJm38mVD2rewU9VxF7OUXNSSdZmJ13dEYMZ5kbHkVHmz0PB40cdgbZH59
 v7IM1yPzFKsA+HRggdGgE4JQ/M+YGnS1Aoq5Qv/5yT6UGTQ8Okq9toio2SuT+ZrP
 +adPN5BzZEgno1Nk7ftKXajLR5qVazU3Pm4L8V484vWK3fArgu6suV/bPOZAZycU
 /3MyuJegnzmlZ6ENjKjzfBgRMesjqml+UAkRATuj8M9GQZ0ZX3XYJZyGfpvnDb7Q
 ==
X-ME-Sender: <xms:fRLpXn7OCplttBJDoQaLfIRWmC_W0VUB3Cfa_8oOh0O_wiqyX2MN1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejtddgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeduhfevieellefgffdttdelgfdt
 heegudevhffhgfefleehgeeiveefiefhtdejgeenucffohhmrghinhepihgvthhfrdhorh
 hgnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:fRLpXs47PcegMZmID8d1du94VsGnFrT7txOPIV_2r5zfZROq0TJARA>
 <xmx:fRLpXufiFZbNnuRh55RdBRxTdWsIBuY6Q1A766ZO5jL4qCodCR4FsA>
 <xmx:fRLpXoKSBFVYU6cF7pSkhF6ubsQQcoU5t4WGEPDLyP-D1j3iTn9_LA>
 <xmx:fRLpXgVLKxenDOqoyu9tlSa7vvcTnzwhWJCM8CaASokzA6-VPWY-Vg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1C21D30614FA;
 Tue, 16 Jun 2020 14:42:05 -0400 (EDT)
Date: Tue, 16 Jun 2020 13:42:04 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Justin Thaler <thalerj@linux.vnet.ibm.com>
Subject: Re: Patch for telemetry design
Message-ID: <20200616184204.GC4618@heinlein>
References: <8428bc15cb234328a6148d47eb2581c6@intel.com>
 <db250ff2-db9b-5297-31bd-fcae911aab25@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="m51xatjYGsM+13rf"
Content-Disposition: inline
In-Reply-To: <db250ff2-db9b-5297-31bd-fcae911aab25@linux.vnet.ibm.com>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--m51xatjYGsM+13rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2020 at 01:05:10PM -0500, Justin Thaler wrote:
> Would there be an option of considering compressed data like BEJSON?=20

Did you mean BSON here or something else?  I saw BSON come through in
one design or interface review ~3 months back and I recommended we use
CBOR instead and that change was made.  CBOR is a standardized binary
representation of JSON that has wider support than BSON.

https://tools.ietf.org/html/rfc7049

--=20
Patrick Williams

--m51xatjYGsM+13rf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7pEnoACgkQqwNHzC0A
wRnqAhAAgf/yCOpI0L4BwbwZ3jTQiL+6SVdhhkxzaADizqdS8ew//Nzf5abMPD9s
qiOlVd3zCnSAiJxcWvUEGnbeN9DFYa4uiyiFONOxSn1w9pU6x5AB/Ni8Y1fyjK6R
6hTuH5U8sJ7OPrr9aKj7O/IfNG9Gmx3/6ljiSHzHsz8FuZkLMkgXIcZTgDSapCSA
VOoljToSt++dWvCpxyC8GgtF2o5l4yW1wzUg1ll3q9/AdiB8v5WuYb1EKgqYTmvD
Bua1vWRha0EwbMH10NAwHJ2VSv9YPcIbCCX0tPjnO+o2Pjzce2rAy013Cvdt2Z4R
aQ0FgVyO8BMBAjw+4Oior6H/lgQxpuezC3SE6Pqb41+gLBKcmEt+yHV7EwpUsN8z
kMIxFkfoPpCYuaQDIA7sZTGEd9Y8tYxAdqcoWj2c2suYRtXh1Jy164SQkYwUz+sG
yv0asgiPouxeyTFB+vtbhG4U11BfXwLEjueXQIf0ccy6chTXCmLoznR4Ht6dcm9T
5m2eHY3RsVwR5yltVA8l3c+R4htpQpQ2LfpfxU3/nb/8s0k+egG4DeGucgaU3lfL
QgAXUETZ9RkMspL0BtB0vePKx/WAt0Qc954CjaQh+0e1FGZ0SZZVpRsLCN6Ggme+
L1V3ane+omYjF8aNrcwD4O1Zfn1MkoV5ko8gb0wtE1inygFTZMo=
=wcoU
-----END PGP SIGNATURE-----

--m51xatjYGsM+13rf--
