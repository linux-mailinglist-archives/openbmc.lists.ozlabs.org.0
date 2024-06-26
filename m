Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AEF9199DC
	for <lists+openbmc@lfdr.de>; Wed, 26 Jun 2024 23:40:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=UfNFiktM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=icjQbIdI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8ZqQ6BC0z3cVq
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 07:40:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=UfNFiktM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=icjQbIdI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.153; helo=fhigh2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8Zpt4rS0z30Sv
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 07:39:34 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 3BB88114017A;
	Wed, 26 Jun 2024 17:39:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Wed, 26 Jun 2024 17:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1719437973; x=1719524373; bh=SAtd+t8/ZL
	eDH63drhQy5dC8D1Y9twU4I89TWKKse2w=; b=UfNFiktMpepnOHFiosi8zBUpHn
	C2msOBxp0EDBFKCHmDsriUk1UmF7i08/dHkwr9kw9ltR5F9PYzEeeyslhqcJQUvB
	HfqOPF4UGOarLOOicANxwgABicSXPnFDoE6ObWzAVjONOrk9wB8XOEL6ksArswyC
	xXkwmnYc9B1VTWeyWmnukp/ZKPeV5a0YktxriHr1jnSsskObQ5iW9lRYg6SivST2
	x5bfuo0N9he+dufoVSjGz3IU13pRyHcsl3J/Wy8LtKvJLwK8c5aqpzAPLz0zEU/Q
	+O2nn24qSBCL9+2laLELj/nlBaU1vDT1awok5u04XpzoTRG9S1ZP27FWXmmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719437973; x=1719524373; bh=SAtd+t8/ZLeDH63drhQy5dC8D1Y9
	twU4I89TWKKse2w=; b=icjQbIdIbLixMXX8XZLyBgNythA/eCm35dlcNBPvpufO
	/6v1JCk3MZi67MRwav5LNl/YeTp607dldow+ZYOSWNlVkMuRkfjLpVtOyGJni0zh
	wvQ57h+HMT0c+7k0pjPJQOA2bNhXwCMPTJpY8SqzHmGkQMDtNXm1YJ2C2CY5meVI
	phdUJyeL4C7h47Z0CrqXnIVdFbDccjeMC9sG4A19E9SgdL2mkpYa07rkO0fVmnn3
	0kWrnDtP8JUvdCpUtJVJJhMS0702V7nNx5LZeAPu/TK1c2+5nOJYY6e4q2hJSGuE
	/0wksvg4A0BEkaKdL4K+/vCaNvJHKQXK1w6MbVvt7g==
X-ME-Sender: <xms:lIp8Zl3I03faIt9UTjrkdWmlE1JJKEjWPuIKFuHARKzDGGBVxLmKiQ>
    <xme:lIp8ZsH54e4pHWqBip-qa_RnelLQjY0KZoDcIkKfs6YDB5SHh6OAKRJN4yqOJLQ4u
    rSBmH3w2eE17pLFqs0>
X-ME-Received: <xmr:lIp8Zl4V508qLtIn6GAEtitDmw4evwdb6xe7Aer3rpKHwWX0QTTqw9_iEPfWy_dd53bOx_DWmNbue8fAhJRFC8Jbp1YoBSGyI_8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdefucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhluc
    fvnfffucdlfeehmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecu
    hfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsthiftg
    igrdighiiiqeenucggtffrrghtthgvrhhnpeehfeejheeftdejiedvfeekffehledukedu
    leelffekgfdtleduledvtdegtdehkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:lIp8Zi35IR4Ora8pHMGE-igqGbpdJ1jL3G4fTecKJxF1ziBfZV0zGw>
    <xmx:lIp8ZoFKFVI4XmIeIZLh84pAnX7UPKtrMliDfbizw8lBbxH-4L7F7A>
    <xmx:lIp8Zj870yH76YtdL7jOXCjcGl7dk4IptdyC9nrypu566HYrmwq8rg>
    <xmx:lIp8Zlll3OD0JETutEnvyEGiBkyV9owLxM-6JGi5qDNYP0m8KnefZg>
    <xmx:lYp8Zt7-52kx7yFnFaT6a968XljanEDCu_fhc5Xl38nJnVF-N14k9l0u>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jun 2024 17:39:32 -0400 (EDT)
Date: Wed, 26 Jun 2024 16:39:31 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Gunnar M <gunnar@gmills.xyz>
Subject: Re: Request for a new vue3 branch in webui-vue
Message-ID: <ZnyKk8xOmIgqAbs0@heinlein.vulture-banana.ts.net>
References: <1403524602.354586.1719434789488@privateemail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GliLQglju4Pmp3eJ"
Content-Disposition: inline
In-Reply-To: <1403524602.354586.1719434789488@privateemail.com>
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
Cc: "kirankumarb@ami.com" <kirankumarb@ami.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "a.nikhil@ibm.com" <a.nikhil@ibm.com>, "sivaprabug@ami.com" <sivaprabug@ami.com>, "Renuka.Sharanya.Pundla@ibm.com" <Renuka.Sharanya.Pundla@ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--GliLQglju4Pmp3eJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 02:46:29PM -0600, Gunnar M wrote:
> Kiran and his team have volunteered to sync patches merged to master to t=
his new 'vue3' branch bi-weekly. Thank you, Kiran! When the migration to Vu=
e 3 is complete, and all commits are synced over, this 'vue3' branch will b=
ecome the 'master' branch.

We need to be careful about how we do this.  You don't want it to appear
on github as a rewrite of the "master" branch and we absolutely need to
at least keep the vue2 code in some branch so that it doesn't get pruned
=66rom the github history.  If we don't do this, it will become impossible
for people to build older OpenBMC releases.

I would suggest either:

    a. We do the opposite: create a 'vue2' branch and update the recipe
       to point at it.

    b. We use this as an opportunity to migrate from 'master' to 'main'
       and use 'main' as the vue3 branch.

--=20
Patrick Williams

--GliLQglju4Pmp3eJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmZ8ipEACgkQqwNHzC0A
wRmHDQ/9H4g6Jilwnb7LYKwFkYkonlUZUj9lLmOPYcP+BDki/qFpCApRKzUiEBzT
VzfJ+Lc7pET5k3VvjtwAViSn7aKfNkYNbm9JtllofN2N4gWyobR9SyF2mH27KLfA
nkD3knttVHzTTvGMNub5S6yAsB43QIp5rzkzzkyciFu/XxRZC02JbrY3G4MISbLr
fFZcA9qNRFXE61pI9VJz+gElsBhu5mlnM+b4WCUPQ0tsZnbEPpLPBoKdfU5FoKJV
+l34zy9xmH6CXqAMXnOfR+u3ORAKqnfSMVblmN9CEepAi2L5lxJa+TSVqvuSkdoO
Vfz0S47CxmAjuZv27bHWm8WhZJbod9FvadkH7ZAT9830Uit0B5nBm11LNyVOmavu
t+U6Jq2tUUmcwIKXlTAcQk6GjZFtMP8von3m6VPw0vPRQNuXk2yUSGwnpvw0E/i9
7Shc+TFoeivma01v6GQ4ypu+Fe6hbKoOJx3UO0dIrE2nz3FrB4cPOv9F1FWs5Nqh
BBPeSWkraPJ+1YRkYJtU8ntrAPQQmErHKrh6XqoEpT0La2BONDMsH8YToJAH2u+S
D7IEhvsa2WZFohTaDWQ5b1icQs8Fqo4m79nLadqH4o7nWAKChRAQOrfaKFNwGVFL
IiwGWriWZOIRcTbuj4UId4JNW+h/ITsUa+thUi90kLpzp8WXBrk=
=Q65x
-----END PGP SIGNATURE-----

--GliLQglju4Pmp3eJ--
