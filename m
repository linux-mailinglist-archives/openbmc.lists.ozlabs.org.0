Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F1686D9DF
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 03:47:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=KJT6GbrD;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=OQhFSns1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmCD35QG7z3vZf
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 13:46:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=KJT6GbrD;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=OQhFSns1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 454 seconds by postgrey-1.37 at boromir; Fri, 01 Mar 2024 13:46:27 AEDT
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmCCR0fGLz3cST
	for <openbmc@lists.ozlabs.org>; Fri,  1 Mar 2024 13:46:27 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 223455C04F8
	for <openbmc@lists.ozlabs.org>; Thu, 29 Feb 2024 21:38:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 29 Feb 2024 21:38:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1709260727; x=1709347127; bh=FjAK8uGiYK
	ra4W+m7FIxnKEDjdrKYb1SPnFVhiVOQ5Y=; b=KJT6GbrDagdNyKfNkf8MQRfp7X
	MFE6No2I/RYd0lOyEcN2XbU22JjpDDltIUs1b/j78SbQUHW3nLYrj6/KqU1S4Kcb
	PsFYU0JqzLZSGW2n17S64ceuIHuusN8M+RVWF4ZfN83DhBTswYpYqxRSFjAJlsU4
	pCsOAR/6lwRVRWjixnw7O+a+w9OUuBy3hK/2uOBllK4BJR65rBBp6Jqo/W+g59ZH
	B2XvuYcHDdaKf35rQO32Bf/hhxTx0l6ZhRaKqum6kpuUD0zy5C7HMvgkEmNNFILs
	RKrazEj9cSGIzCibm3MKfA25GDoabSl6kHvh1sREKMhIh3mEd/P4eyW8SiQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709260727; x=1709347127; bh=FjAK8uGiYKra4W+m7FIxnKEDjdrK
	Yb1SPnFVhiVOQ5Y=; b=OQhFSns1hxK5lIlYmj60ExCVPGvMUXFhTWflG2CPS7Fj
	ygFPQFRtQyJs5MlpA2Ec8PyyGU9632rx1zr6N5g6j7IpMMCjhlWfbTr2Y7L35vy4
	Wh1yo75oCWC+ItQ2XwmdY0yq8W3ii0BZf2xrvE1giWdEOr/OVyZo8Npr/HrdXvNV
	1j4uIB/JtIBq5a3ujsPnV3rsxK7O1wiGQMULBKTyFkH07asV8cKPIHyWElgKW4g+
	WaljXKRl+AxFuymCV0vTtN3pWnCER+taXKdNZZMH6ZVmthwM2Dd7a9bllY+n8PE/
	Tw7Djr80ygJbdVtW/mSpSfXO5kVyUnPdcasOCmk/VQ==
X-ME-Sender: <xms:tj_hZYJYj3Smq8nTzij4Qc9WiivMY1wDqLoQog48LqvAjpS7CzSh1A>
    <xme:tj_hZYKXWwb1NzbgNplDQPS8DxopwgzScadACyG9a9ppC2fqyhJXEMxt0hq0cArOD
    tXru4glanD2t5tBjDE>
X-ME-Received: <xmr:tj_hZYumVl4zoW06S7YSSTxDOlKPzhdG8dYQ85kj0Vh7oInRwpXtsIMxtsalgO5cWvFjnW2uM4iFKNtXnJ9GWsjmDSDE9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrhedtgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculddvfedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
    necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
    iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeekveeggefffffhtdekfeekfedugeeh
    ueelheehgedvhfdtueetveevvefgjeffueenucffohhmrghinhepghhithhhuhgsrdgtoh
    hmpdhmvghmsggvrhhshhhiphdqrghnugdqvhhothhinhhgrdhmugenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftg
    igrdighiii
X-ME-Proxy: <xmx:tj_hZVY3jVs0p3bZ-PcswNzCcwnlo6rvcrULNTYIaz9uJcui6s9mIw>
    <xmx:tj_hZfaXY64fxBNo4Q7-kNiyTUZa5JbjbRuOAJuaSBXFGIOvQ-NVTQ>
    <xmx:tj_hZRBUnaajCycwsElIcEw_mrDSW5lN4fJqV3vwtg9IpwHAtHt3IQ>
    <xmx:tz_hZZ14dsjmeH09VMNj1i6uAgW0OAUrwX_TGkw1OWm5oAyadWMv6A>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 29 Feb 2024 21:38:46 -0500 (EST)
Date: Thu, 29 Feb 2024 20:38:45 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2024H1
Message-ID: <ZeE_tWHOZLdtPXu1@heinlein.vulture-banana.ts.net>
References: <ZaWZY3A4TZth-ons@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nz/mmtCtVYaIhZic"
Content-Disposition: inline
In-Reply-To: <ZaWZY3A4TZth-ons@heinlein.vulture-banana.ts.net>
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


--Nz/mmtCtVYaIhZic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings,

For the TOF election this half, we had 5 qualified individuals nominated
and there are 4 seats expiring.  Therefore, we are going to hold our
first TOF election.

Per the TOF election rules[1]:
    - The election will begin on March 1st, 2024.
    - The election will conclude on March 7th, 2024 (*).
    - The election will be by Ranked Choice Voting of qualified OpenBMC
      developers.

For refreshment, you are considered "qualified" if your Github user ID
is found at the rollcall[2].

The 5 nominated developers are:
    * amboar - Andrew Jeffery
    * jmbills - Jason Bills
    * pointbazaar - Alexander Hansen
    * wak-google - William Kennington
    * williamspatrick - Patrick Williams

Since this will be our first election there may be some rough edges.
Please reach out either by email or in #tsc-and-tof in Discord if you
have trouble or concerns.

What I have done is written a tool `vote` at openbmc/tof-election[3]
that will help facilitate recording your vote for the election.  You are
expected to fork the Github repository, run the tool, commit the
resulting JSON file, and create a Pull-Request to submit your vote.

If you have the `gh` tool this would be as follows:
```
gh repo fork --clone openbmc/tof-election
cd tof-election
=2E/vote --user <github-id>
# make your selections with 'vote N', 'save', 'quit'
git add 2024H1/votes/<github-id>.json
git commit -s -m "2024H1: <github-id>: add vote"
git push origin
gh pr create
```

If you don't use the `gh` tool hopefully you know the equivalent
git-commands / github webui operations.

(*) - Since the election rules do not specify a timezone for the
      election, please submit your vote/PR by 23:59:59 Samoa Standard
      Time (SST).

1. https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.md=
#terms-and-elections=20
2. https://github.com/openbmc/tof-election/blob/main/2024H1/rollcall.json
3. https://github.com/openbmc/tof-election
--=20
Patrick Williams

--Nz/mmtCtVYaIhZic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmXhP7MACgkQqwNHzC0A
wRkoJBAAnpVrawQxd1Dapm0+V1qZul+7iafUBemXcwpNMKDeEUC5s+DLNuDPbKfv
vlsoniia1GZ8z8D2aGYzRLj4g+LeCqejpvS2tzQV2/ND1NRtlg7A8B0JYn+EvSRY
Ln2fye3aPQLPcEQ41NlejY/gfnvYowNB9169t/w13VcC3CzDG5/mXGCoAn8+KdDY
FxfGy4OG6JZHcwEKiY4JcBCJ7+TsYVHj1whW4mfT5v6tnGtbnYhgfmdoKxRalBEI
UQEM+r/IprJc1kD572GA5uifmO+wh7yO2iG5t7D31RJDSwBM7JqTZPc9Tf5ET52V
Mh+Hpp6hEoNaq9LtUOVpiuxD4tL4GQYzOHkRIJZ9Nk0gVrvWI2aYc12saINjqGKp
ALR6tR6x/QJGcEnGDzLHX6NXQ6bmw9qpddUYmM47Wp/yghlo5w41ezxfAZZCeolI
la6MBxks7svksyH0aJvjbzBKmdJNoB3Qg2xzWlxeyWQ2dlqTsMd3yIySkcxhtnMj
DM2YGPdYdLnoNcBE4WY2Xy9L/PHGYd0PsSoj2/M3zthic9r8EfJnyEM6BobPmEkO
gXOk9wFHux5zecoAwGT1EHqbQhzZknDu19ecdYdb17wF0DqGtvIcK9nP90883H7b
ashgviNX3XjxZfYT/5f1cWlpfjcxKEtNSJ2GqxRSKQxvy5C50NU=
=W337
-----END PGP SIGNATURE-----

--Nz/mmtCtVYaIhZic--
