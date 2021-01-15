Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C9D2F7C97
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 14:28:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHMTF6ytvzDsg3
	for <lists+openbmc@lfdr.de>; Sat, 16 Jan 2021 00:28:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=r30Ou9DM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=F9TLeTdg; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHMQQ1BNKzDsPt
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jan 2021 00:26:20 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B0CF5C00CD;
 Fri, 15 Jan 2021 08:26:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 15 Jan 2021 08:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=+pR8KOs+pEOkNSraxYEEoh34oVb
 rvtEeM1YIbE4pMFA=; b=r30Ou9DMfIok49aGI9UAk8oYbr1OeoKr2jnlKiIhvCF
 d4KfPkeJnbvTgR8huwr7TCBFJBp8tOfQPwCyQYEUvvnlX2knmJlCLQlK/1fI8uS3
 eLEFKDkeuZpDsVTAjlHdjsBP4l6qVk2ahLlwA60IWHgZRol8PDtFhHzFS6Cq+qXc
 sPGFVtPdMiXxovV65Ogfr7uay+7hY6ShlKA2Utin7bvR/p0grefTmpalEtzikxi/
 ogJuWnXZj+HVpvbPH7PwRehPpv10BAP1c53Fj3IhhqHETIrAfiLovF5CnEfGv801
 b2XBbEUaAmqEWnR6/KK4DYOzcTO5EbWZfTtfwM32nyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+pR8KO
 s+pEOkNSraxYEEoh34oVbrvtEeM1YIbE4pMFA=; b=F9TLeTdg4aahUsOO69fNJ2
 nTCgf+zmJYkV282QvXGNFjSyXSBECJRbB1oXcovtiCxEwvCagrrkx2CHzCY2puIS
 RnxmHQyGZuRkkwKcEOQ96p3gE6nTbmMKdOtc0gqeKP7VLMlHv8dikZ4mrtctFPX6
 M/F1Qn9i+naJmm3Ea4UiVDMxLHhtQwaKyzJaY5MIsuPiQpjRHAIGODZLgY2c5OKV
 nibo2luQRCgMAzVkstJIaurBaiBDLWFsTZr0NqsDPOKGit5yBKSF/jEWNBtHP5X3
 063r8D+A7zNITHSiSBaj3NlE8nLz/ANP0WmmlIdbHr8U7hotUDE3XnM3eK1aq8MQ
 ==
X-ME-Sender: <xms:95cBYEsWF7n943KfnZ5awhCRXa82PaOHHIAJiCekM08pNJ5tBfzHFA>
 <xme:95cBYBf89WsGaggVdtU7akt0Tve5POSrBa2BeImJYG8de5rNU52vAVO548sTqqDGE
 WkunVr35isywjL_yPs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddvgddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekudeutdefiefhheefheefvdejueej
 ieektdetheelvdfhleehkeegvdeiveekhfenucfkphepudeifedruddugedrudefvddrfe
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:95cBYPxXzUYm3CJovcArHVD-ou_nSRc--U1AOj7IOuWkMJwWDoj7LQ>
 <xmx:95cBYHNKroucei1ZGQ5kh6sKDmFh1TY-xlZ6vU1j2sguAeZ1QPJMKQ>
 <xmx:95cBYE_JYKgTXK7tOWAhQFbb9gFDtP2XUyqzmLlJf5h2ABltA7JbGA>
 <xmx:-ZcBYGIRuLesmQO-okI_M5I8YdQvSoJRpfodOuePYP-dG6l-jlRcag>
Received: from localhost (unknown [163.114.132.3])
 by mail.messagingengine.com (Postfix) with ESMTPA id 74630108005F;
 Fri, 15 Jan 2021 08:26:15 -0500 (EST)
Date: Fri, 15 Jan 2021 07:26:13 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrew Geissler <geissonator@gmail.com>
Subject: Re: CI build for yosemitev2
Message-ID: <20210115132613.GA47865@patrickw3-mbp.dhcp.thefacebook.com>
References: <PU1PR04MB224835088E75178D9AB64B85A7C00@PU1PR04MB2248.apcprd04.prod.outlook.com>
 <4C410766-951F-4543-AE09-BC3F31197F5E@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Content-Disposition: inline
In-Reply-To: <4C410766-951F-4543-AE09-BC3F31197F5E@gmail.com>
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
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 03, 2021 at 07:27:06PM -0600, Andrew Geissler wrote:
>=20
>=20
> > On Dec 21, 2020, at 9:32 AM, Velumani T-ERS,HCLTech <velumanit@hcl.com>=
 wrote:
> >=20
> > Could you please help us to add the Yosemitev2 machine in the CI build =
verification.=20
>=20
> Hi Velumani, glad to see a new system added to openbmc!
>=20
> Getting a new system into CI doesn=E2=80=99t have the most defined proces=
s but
> I think in general it has to fall under one of these due to our constrain=
ts
> in compute power for CI[1]:
>=20
> 2) Donate a jenkins compute node to openbmc CI

Facebook will allocate a few compute nodes to the Jenkins pool.  Andrew,
I'll work with you to get them online and integrated with Jenkins.  Once
that is done, we can enable Yv2?

--=20
Patrick Williams

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmABl/MACgkQqwNHzC0A
wRnQsA/+LniU0D0WMF6Mgwd3ULQi0EAZ8Ug1bhk+fCsWSvdC3uZBLj5PhYlRbaIi
W4fJLH41K5hlEBiySJisSWMYd5M7esBxlVQUBi7hQG91mtyOsINhaGTvUHKMUoYL
O7/QVTBtOqSWQvY8wMI6rBuqyllPiXj5uvYcW2IuPLRLwfT0osJctabhNH2v+Scw
Lj6UoF+VhKGNoXUMPltGjqTXgOzrTvt3KM3NnH7LcarAep+rWQmyVkzs0r0h9KfA
aQWsv4VuQUMB05LnObRn45YoC9ifOHwyozFUCOzHXqv1EX0RgHFivLV5+CS373kF
A05KvjLE+xJkyPnNf9YmerEov3ylE1KuE8PUtu8CqkUO6BM+uQpZzZZqP/q7ZrZ9
qzQy/QnFmsoKsFp+IPdCX+Y881b30oUzpzLwPyqHkJTKmGm0WbatxZGKgCCi1AxF
PVhqWbOdnar/FntgI6OBmmFUaBVYPOx7fE5QrNPsGZ2lj6YAUtslYZG+E91dfdH4
b8btD5Z4dKKO0AZCDksh2oOzmbZJ6JaK/I+WoQK7Ug57HndwkhH152BaXyVdFsuP
czvExGCNvCX9eCJC7Som6hc5/aQxZbc2obZzR4aKTNW5DcUsQw3hQMH/yQgOBoJy
02O7ttV8STKlpBVhdf8wmGnXyfuQnpPvjejqsLv0l5kXFA6KvUk=
=+Rnw
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
