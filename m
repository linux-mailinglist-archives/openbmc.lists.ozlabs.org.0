Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9C21F5D2D
	for <lists+openbmc@lfdr.de>; Wed, 10 Jun 2020 22:27:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hz7q1fPfzDqkV
	for <lists+openbmc@lfdr.de>; Thu, 11 Jun 2020 06:27:51 +1000 (AEST)
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
 header.s=fm2 header.b=Rx6AxQXF; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=cHHwyyVo; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hz6r2WyPzDqjJ
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jun 2020 06:26:58 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id BAD495C00FF;
 Wed, 10 Jun 2020 16:26:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 10 Jun 2020 16:26:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=/5fyOwyg8jVexFtxm/50lxKyOSA
 +T6PrmgPigBxwOAM=; b=Rx6AxQXFKvrZwKKpYXU0NiQSo7tblRZ6Jk7bCEC5RXs
 0olyo0V09/zYXbh5UwXjLitWYHzhaPBYlnytRtW2vxDw8avG2VH4Q7gDRv/1ZEVh
 wMjo9pvc5qrIxd55YsJqAvVy+tE9wSNw5QbBQ2U0DJFWOHAgyUSsTz7li/Gn8Oh7
 ZoVBR716EK166F7+/eEq0XC/MQNqvV3WEcfw2YrrBrh9PylEkhS7tFsgVh/rQsMz
 /MxaP9/R2jm853x2zQQhZ3wc4b0AiCKmCO5oYRumTgwkBeYKsQxLLoB3lJyKO/Gk
 YxYQT3CeFSXb7Ascrh2eHcTSl1YvzxFVkcM7B5E7UtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=/5fyOw
 yg8jVexFtxm/50lxKyOSA+T6PrmgPigBxwOAM=; b=cHHwyyVo9zqSQb8o2FrLH0
 LuDiQEkA4uyLHCxiJQjFELFNKSobWvHbEoV9WH49jcXAa1Wf5WwaEprpLqMv+c5r
 bF06cOvZNwSHMksPlNlS+HCQr6AZyz7y6fWXdbybSugTE0XvnorLjPoiC0Kf2Zy0
 cTOg+1LDo9EExHBOxRGyAeoLwQB/RHoqcpGlv0smob4IJMKLGAUcEKw9eD7D4i95
 hVCioChIgAFQfzL0GsFQ2tO0ilk2aZPCx0lSAWuj8++zicMKumYyh80JCX67Gfni
 gW5vWmFt0d/kixtZ3yLh5ZeLg/usTC4TUYf9ej/DL5twg8BUOU+ws6KDXjg1+d7A
 ==
X-ME-Sender: <xms:BULhXu59yleKpR3J9fUaw4porXdMe3biGk1FUtG5CH-nfQgjZZ_LIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudehiedgudehfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepff
 fhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpefrrghtrhhitghkucghihhl
 lhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrh
 hnpeekudeutdefiefhheefheefvdejueejieektdetheelvdfhleehkeegvdeiveekhfen
 ucfkphepuddtjedrledvrdeitddrvddvieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:BULhXn6OuRE2JneHwUr5UhmKdM_G2uR_CTldjjIBgUB23JeunsH2mQ>
 <xmx:BULhXtc3j9k_SNSMyeVRO1zuKfHqnZgfbcIsTA1uvhuMfJePHRfvtw>
 <xmx:BULhXrJcPX_nIJRn5r6CSfv2TZ_3urFm3rTXau3GxODhpC1KPmLCNg>
 <xmx:BkLhXhnTZdJxVXkobuJlOPvyxykJCxFHZtlY_9tRzmqYl8To8066MQ>
Received: from localhost (mobile-107-92-60-226.mycingular.net [107.92.60.226])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6178E3280064;
 Wed, 10 Jun 2020 16:26:45 -0400 (EDT)
Date: Wed, 10 Jun 2020 15:26:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: =?utf-8?B?5ZGoIOi/nOa4hQ==?= <zhouyuanqing8@outlook.com>
Subject: Re: sensor disabled
Message-ID: <20200610202644.GE5289@heinlein>
References: <HK2PR04MB3826A575A7AA400905596A58FE830@HK2PR04MB3826.apcprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C94crkcyjafcjHxo"
Content-Disposition: inline
In-Reply-To: <HK2PR04MB3826A575A7AA400905596A58FE830@HK2PR04MB3826.apcprd04.prod.outlook.com>
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
Cc: "uperic@163.com" <uperic@163.com>, openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--C94crkcyjafcjHxo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2020 at 01:26:30PM +0000, =E5=91=A8 =E8=BF=9C=E6=B8=85 wrot=
e:
> Hi=EF=BC=8C
>=20
>     After openbmc is started, all sensors are in the disabled state, plea=
se help guide, where need to be configured to enable by default?

Is this all sensors or just DIMM sensors like you've listed below?
Likely, DIMM information comes from your BIOS over IPMI so the sensors
won't be enabled until after your host starts up and begins
communication.

> dimm0            | disabled          | ns
> dimm1            | disabled          | ns
> dimm2            | disabled          | ns
> dimm3            | disabled          | ns
> dimm4            | disabled          | ns
> dimm5            | disabled          | ns
> dimm6            | disabled          | ns
> dimm7            | disabled          | ns
> dimm8            | disabled          | ns
> dimm9            | disabled          | ns
> dimm10           | disabled          | ns
> dimm11           | disabled          | ns
> dimm12           | disabled          | ns
> dimm13           | disabled          | ns
> dimm14           | disabled          | ns
> dimm15           | disabled          | ns
> dimm0_temp       | disabled          | ns
> dimm1_temp       | disabled          | ns
> dimm2_temp       | disabled          | ns
> dimm3_temp       | disabled          | ns
> dimm4_temp       | disabled          | ns
> dimm5_temp       | disabled          | ns

I don't directly recognize this output.  What tool is it coming from?
It may also help to know what machine / architecture this system is.

--=20
Patrick Williams

--C94crkcyjafcjHxo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl7hQgIACgkQqwNHzC0A
wRlAVA//Ul5bw9GxtpKkGPbpNAOf0DJx+fo5QuzqwtuZTCE8Y2nZgWJNJlt2evR/
T8B/7WkK/XpFIgw5+/fHhnieflHKd6/8CboMaSeUb4PEQRcDQcbkH8CF/WYLarXy
b/bDOT7n0Sw3JxxEeACe0ISxkQgzX2UG1Q3VkCkRoKjjjrx/0uK/c/aQosFy48QC
kTkRPfnnI8GMzdEnmyPl4782twAAz6cfPX1IVWMdurlyinTBE8dADo8KMvTibcbT
Qgqv7bUuv8bO4qmSpwFK+l/OgpMHWppwXSBoyAgUfRztadDfqmrGKX7rBzK5Ij2E
MqJAxTzrfK8ahiqiaOz8Afvv41aWElpfQRWb5obOCt8dc/vfxBripB4mjJoWj7+i
ngK0SkXsBSiY2Xx+MJhJtlTqWAGcM1MZpXWYdUjSBiz6b6i9/QoASiqrZbmYXpUZ
u94sl36ZJDpJJT8Ea4BXjgPvzMA5BJxcuTEx4o1pxRLnppFZFx3EEp0P+B5jeHQL
ozFTFfdqiHUp0FVCLSSkiTExRSJtWlQEnvU9AaPhiJ/uoCeD+D0L1ZJ4Vdn8uFsg
Ce1qpROoXf8P4e/gVes6tids8EANF/DKJD74BIAhqC16nAiZ2qCkqr2WbsZ7VUlo
rG31bA/ft8fKPusH6s/rfBVkC4hX6Ja5xfJkO/Py77MRF7lFFvo=
=ktX+
-----END PGP SIGNATURE-----

--C94crkcyjafcjHxo--
