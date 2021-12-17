Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC56478C07
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 14:11:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFq9k6NGMz3cHC
	for <lists+openbmc@lfdr.de>; Sat, 18 Dec 2021 00:11:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=cIJPs9OP;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=SiaH67q5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=cIJPs9OP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=SiaH67q5; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFq9J68rPz3bhh
 for <openbmc@lists.ozlabs.org>; Sat, 18 Dec 2021 00:10:44 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E39FF5C01E9;
 Fri, 17 Dec 2021 08:10:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 17 Dec 2021 08:10:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=jcS0z+DLyGlTM6B1p7IJe4Y2j1g
 WrH6TBS10Oi7FnaQ=; b=cIJPs9OP9I0A8Y1sDDrfdLiMAfPYxi5QSx2+Z3D7a8E
 DZsGiPQ54ORIA2TIMeBwY4y1x/47s3/owNlVSe6UOv/oJiioK1ufox1JbuHGwrtI
 dw5KT/zxEmu+BicKB0eoTfHWPT5A72/7iFtAA9ul6L5MoCsLKLymas++srUsPHk8
 hvRfhUhvQEevJ7N6mlWOP7ihYK0V+jpBSQVUoBNYMW9f/7jA/CFI8Y5QcWgKUAh2
 OpX63208x13EvdgY0gHnz/ergkIZ9yasR9GznvF6oz6vALUWgfE5FVKJNsuwtZac
 w3aoqSw6Z6+iVbfQiAGoS8FppPVj4a8nHfpsRZ9a9FA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=jcS0z+
 DLyGlTM6B1p7IJe4Y2j1gWrH6TBS10Oi7FnaQ=; b=SiaH67q54rqnduSNLo6UI0
 YeP9562xva7ulCndQg7jLmlgAS0l3xae/N/KYpkPX0ydW41uwC3FHCvAZwboeTCf
 XYA1esF8zdRRjYmIusK+cK7pXdS6YWSxIRl4Y50S6uQkdSGEkoO8Y7YpCX9E+ghl
 InXJ3mCfXVqGVmB8wjkY4sewHb9DeEBAOWBdtjuSFzi9kxFKAUYbMuTyZjRa0KD/
 QIo+TdiIVg5+dLzTJycouovQ+mKWhIpqcdtMHCJbBSF9Opn8MtpJf29pp1leIXso
 MlxtiyaOxSV5v+CDnryrdsqxdiY+W9T+pQzHi7ojsvhXsC6cy23d1qIrhwboMiLg
 ==
X-ME-Sender: <xms:Uoy8YexSwviaFa7Pn_JnS2VJ1IWR0VLoFh0t_xa65vdsdXkxhZidPw>
 <xme:Uoy8YaRyw-K6PjPuFmUqwgi1PAu2IUPcBjV3Rmu2Kb4RVDHU46PET4lBzGACYOOvY
 uaqhzFI-1_XzKs28MI>
X-ME-Received: <xmr:Uoy8YQWAxwTxsdSYtATpNlX5fOW3BWGygfMmjfBOlt2xBPFdSZOp46vmiVR5uoH8zpdywQAmskEhxzAMPNAwa_d1DsvPYZd0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrleeigdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdejtddmnecujfgurhepfffhvf
 fukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpefrrghtrhhitghkucghihhllhhi
 rghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpe
 fhffejffeiudelgeffleeitdeuudelkedvgedvfffhkeevieelhfdvuddvueejffenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitg
 hksehsthiftgigrdighiii
X-ME-Proxy: <xmx:Uoy8YUhsdeX7O7Z7Tz4Au85MkflI-39DOqNLytusfUE9HZxAGO1I6g>
 <xmx:Uoy8YQCP67A87oEOLjAUrZMbTi2CYI0kXJItHHCX2AV90vqMzwVJmA>
 <xmx:Uoy8YVJ_rEvfZ1sidGPIXp9QvRotXYY61qXCv-lj_HCLlWPOeNIi2g>
 <xmx:Uoy8YZ64IvxEyhNyEQVBN31D2Fh8VJX-2E2N9ssXtoSnPw8-P0emXg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Dec 2021 08:10:41 -0500 (EST)
Date: Fri, 17 Dec 2021 07:10:41 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Landon <cld795@163.com>
Subject: Re: OpenBMC web sometimes jump back to the login screen problem
Message-ID: <YbyMUeXNLwjlcHyD@heinlein>
References: <78340dc9.749f.17d5ab53990.Coremail.cld795@163.com>
 <687802ca.772b.17d5ad02872.Coremail.cld795@163.com>
 <20211126215734.GH22508@home.paul.comp>
 <459566ca.670c.17d6b13a847.Coremail.cld795@163.com>
 <18a75e7d223e2c054e93e9a83a6c0ba474125518.camel@yadro.com>
 <6fc4e62.472c.17d7a6a0885.Coremail.cld795@163.com>
 <2f6c7248.c41.17d9291a38e.Coremail.cld795@163.com>
 <8e645b4.344b.17d93d37f8d.Coremail.cld795@163.com>
 <fabdbd3d04e3db2cef14346bc5b7e3fe71101c40.camel@yadro.com>
 <c5bba33.2c37.17dc20f1cb1.Coremail.cld795@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0zcuHMZmA1MqMLA4"
Content-Disposition: inline
In-Reply-To: <c5bba33.2c37.17dc20f1cb1.Coremail.cld795@163.com>
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
Cc: "jason.m.bills@linux.intel.com" <jason.m.bills@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--0zcuHMZmA1MqMLA4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 16, 2021 at 03:05:10PM +0800, Landon wrote:
=20
> I try update the webui-vue  =E2=80=9Cwebui-vue_git.bb=E2=80=9D of the SRC=
REV, but There is no effect, the problem is  still existence.
> sorry to have troubled you so much!

This seems just as likely to be caused by a bmcweb change as a webui-vue ch=
ange.
If you're using a fork (Aspeed's tree) you're far less likely to be able to
update bmcweb without there being lots of other compatibility issues with
internal BMC services.

--=20
Patrick Williams

--0zcuHMZmA1MqMLA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmG8jFAACgkQqwNHzC0A
wRkiaw/6AyGZMLf/tMmvH9Ayzlkbf8Id+/osYKNh8pcXhphBQHH4H5WBdrm1uCXG
1CZN4/F59Z92ecKYFjzmLJC7h1oWbWKB7yNfvODm0oj1tn9xiVX6NT0WaL2Lx9s4
ZoTIqdz6NfoyZzhuAsRUnsg8mkmfcaQEAw7KOeg7gyfS9SdcooWKRZXAyodvIzvG
9tziZ6yrnHcH8Q1sltHKwrNZMkuuc0efDeYUuFssAAcraSx0/PHeSSj2X3MVhREZ
K9+pMtKMvnnGzEbXYMTmjWxkQ2YWKojYhPmh7sMNUyH2TMp6+b0sYi7ekUBCk9pJ
fMScMSIm5LJQgI/JAFwoTCHCTKTn/c/N3t2qhpjFXIeqJHAvdiWJ7Eu5/XG+Ot5s
tBFdxjQ/xeUZgGdQytiVs9iZBn50X1xICp8a0DPtxNQq/d9GVDhCCJIJj+iu8iHU
q/adYODqAbjPCi3vWUAoSpFWQmmiUEONfA1yGHCStWPNRbB+kzcuePpNLunTdekW
6JIBhQgYEoJLh80+32e+5H/sPcpMlofTkNRp5wLSzRki+YO+pnfsbjLvd+WpYwNO
k1A+9T2zqyYeEP3H7chM3XmfLdOIq4Br6RpHhuZKiH0a3RN7vI12D2fzp0uq/iXu
D6pd+KlrH++CvcRlCyB+2nHVp51frCyZPzPCF6jJJaro4nhGTQw=
=jJBw
-----END PGP SIGNATURE-----

--0zcuHMZmA1MqMLA4--
