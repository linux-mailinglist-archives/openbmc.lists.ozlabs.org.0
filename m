Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFBF22F25B
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 16:39:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFjB26kmVzF1Q0
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 00:39:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm2 header.b=W7sGULn5; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ZKUxmGpl; 
 dkim-atps=neutral
X-Greylist: delayed 501 seconds by postgrey-1.36 at bilbo;
 Tue, 28 Jul 2020 00:31:13 AEST
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFj0d4ZYDzF14V
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 00:31:12 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 95BB55C0058;
 Mon, 27 Jul 2020 10:23:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 27 Jul 2020 10:23:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=LNLoseXlbkvDWJl7qTUwhB5CvOX
 OMryIboyWRc6KjMI=; b=W7sGULn5ghlCh8Ol1QdMYVxAndAUH2TgB6ce2KxUq9O
 jZAF+7jWLw7zgDbJuntNYDw9Klceg6GwvqJS0xRZurwHY3faiDfnSkqyKNwWAVcg
 cJGUHgsgXhKInmD+cv8YXJQ32Ucja72ygM99oZfzIaPn72mfsZgb2+PcCrwvz7Ts
 f21Hj2+u20FcltVXU93IijpOgQoOWaWj/84RnDXj6j+h+YxzMzIRWPXRLVaU9uhS
 t91qbkq2zViU3oyh6ud3LFQTS6zeyKOGGKkxZ3GRUea7RIQYQShYbYOs/Lmc3LIL
 XT59zo/b1o7UCGHcm81f55gDDy/ovBiARek9pdtzmwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LNLose
 XlbkvDWJl7qTUwhB5CvOXOMryIboyWRc6KjMI=; b=ZKUxmGpl0kOH3rXrGF9DaF
 ITc7E7Px+POujKuCQatHqR9sbRtPS4fOTQVl1MkB8LLGaEwQHvqTCsz9I5ERs9yH
 pUlgwUGbrqKEUnXVnNsUvrwKU+L00o1YJsTy+TIIhn1rxNqNfKRqAn+L2Xz1ca0Z
 tHc596NlC4LcZjAPP6WBmzAO9jDTQ6bcy2lh8QThCHjSNtEnjOFjoF5bczCXWUin
 ZjI53cnt3vHN/1B+HaAu3p92LF3Q2KGMCow7vhyc2wN4b+dyF1oG48aImM3raWQr
 DM+Nj59gO8cXwvlAqIP4zUy7Pq4HdOSVBn55dSyKgQM/XX1iiI2Ht5BYk6pUuIKA
 ==
X-ME-Sender: <xms:Y-MeX4qILsOmD4tPltFDGyp0i4A4b2zpny_eXBrVtxB4Ah4NpOZRMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedtgdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepudeiiedrudejvddruddvuddrud
 dukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:Y-MeX-o6qryxHy_G-2qhVIsBHhcDl2FhgGlsPaQhW9xS9ltBTW4snA>
 <xmx:Y-MeX9OpgXirW3FThmj232tgh8BnKdbsI1eaLDQhCcKLn3LH8uJM_A>
 <xmx:Y-MeX_5MMJtpT4QJdsBTGIEFQfHmZVJNc4bQX5cith2OiAVo82xRAQ>
 <xmx:Y-MeX3Ef0HhMbN77tpExPO6GXEPXXVnLATiIb5ZWJhR9_rOBOq36hg>
Received: from localhost (mobile-166-172-121-118.mycingular.net
 [166.172.121.118])
 by mail.messagingengine.com (Postfix) with ESMTPA id 26EFD30600B1;
 Mon, 27 Jul 2020 10:23:31 -0400 (EDT)
Date: Mon, 27 Jul 2020 09:23:29 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: Re: Fix content rendering issue on RemoteBiosConfiguration doc
Message-ID: <20200727142329.GN3922@heinlein>
References: <CS1PR8401MB11443DA57173714807F29080FF740@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <877be4a0-fac1-1787-c31f-9a670e1cfa7e@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AA9g+nFNFPYNJKiL"
Content-Disposition: inline
In-Reply-To: <877be4a0-fac1-1787-c31f-9a670e1cfa7e@linux.vnet.ibm.com>
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
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Chang,
 Abner \(HPS SW/FW Technologist\)" <abner.chang@hpe.com>,
 "suryakanth.sekar@linux.intel.com" <suryakanth.sekar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--AA9g+nFNFPYNJKiL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Brad and Patrick maintain the openbmc/docs repo, so I would like to ask=
=20
> them - are you okay with merging PRs or must Abner push to Gerrit?

Irrespective of who the maintainer is, if we're managing a repository in
Gerrit we have to merge the code in Gerrit.  The mirror is one-way.

--=20
Patrick Williams

--AA9g+nFNFPYNJKiL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl8e42EACgkQqwNHzC0A
wRlsug/+NBx9ZppFp07gsum/3L4w1s/gx3SV+1JETVgvTjV11Vk0h/kSZ+Dk79Ob
mCGLYDkwjkxj2PghdxRPuXhUGuzw/Uy3zzWyOB2LOeG7k3txnBIcI0Sugf5re/hv
HLlwYSAn9HIyswLGxJbU4LILWAb21VmcITsrQ+LbUX5u60IaJMvu8fHKeL4ST9/N
9Dvdu2DQeRFQiz7AaqeqwYc7thXCns69SG9F5w8SMObilhQ35u3JR6Rf2BbVMSfX
u/zgVQRacsKimBdInh4IfYqilvOXTsx9V1XNfdkzQd73CapF0/v+s/EMbtg3iT2d
qjxE2m9BPEWzqyMiKW9USXuKxqHlXyyyzCeuwYTEEFcs6kA/PH8I5Wcgkr3CQvqN
Z6J/K2fkaFjL+c8vSJVqvn2bbzE5GqBYYHdgtgtyzi9OIlBlFu1iSvnWttr+eMAI
YvDSpbp1Y+o8ClWu2cWwdQUGJbQMOREcOQZbiHToqbKSEJTpePULy3Db+kfhh+uj
cBEoGWtkgErT+d8fRZP6PI6vftN+U0f6Lq++srqutgRoNr70fIq/nDUr+S/SVfJp
HmrJ2e3nRgTFvNDJAcCoYeRi0aK/D0MuUzXe4W+t36i8A9H+XcqUeTm7qclLRN+M
6tMon85uX8CGThujilhJP218suUnTcIwaPxHWoe503Mm2DNyMpc=
=4hPa
-----END PGP SIGNATURE-----

--AA9g+nFNFPYNJKiL--
