Return-Path: <openbmc+bounces-569-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8A7B4123D
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 04:16:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGmS65sXPz2yr4;
	Wed,  3 Sep 2025 12:16:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756865766;
	cv=none; b=lU9vQOgYfRdExiCibw1k5UDML9HKg70i+hNPRDz+/JxcEqVUKUmruqFWf2OWJeFpenaPWh76QDuB0auZ6eDftFCQAi9gD8KyeWjBwgQD/Emkw39VYZ4Vd1+9DbLQjIOqOd8xdpBJnadXSI1CEy1yJutJbMXHWxTuJb5ferSFKlnismYc7uhEWmroafl/G0wcEFXUPl3ASmgh5LG4FSNJu1yBWW2RaL0nGfblaC6ySy0/XZTFcW4o+cKnvAknOY+YDAhNb+RgIoAo0pphBKcyD4dIgxKXsfG37LDYlbR8AlDgF8TWHl6qbYjLgjHQIz7zPG84o8fBqPElFOqwTKQdGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756865766; c=relaxed/relaxed;
	bh=O+91Ct0+f3KIg73Wo/2PalQsLNhzhpOTyEh86OEAFl4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mQHPvMx+GQsTiQvwfA5SC7ZzLJybNwUpfBHRsEnkKm259Wzm7577CBIeFqp5KnnpvT/Oq8IhXL6zVkKwftXNnUMdSdwHY5aXcuzI4GbKHyQPpwiMQdFF8BZMPaX/n3PDvchau8QroPJrVmIDjn9vYkYRoEic1uUOjTdKNssKfFsh82xV8GXH1qGUMbldr66c3cnzndaGXVIGaAYT7BOsicKJM45hQAwv4i99rlo9OEZw4JKRRv21OtX4J0MdGl965rfYT8nEtFTiuzwHCJOi4rz7w5xFCEdqlzYfbWDudVI+JIJswdLgbht2i12FhHVTC83Z8eXbca33xkncIhRfBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=EMDox6pc; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ecLxY7J5; dkim-atps=neutral; spf=pass (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=EMDox6pc;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ecLxY7J5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGmS00Z8Tz2xnw
	for <openbmc@lists.ozlabs.org>; Wed,  3 Sep 2025 12:15:59 +1000 (AEST)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.phl.internal (Postfix) with ESMTP id E3C79EC06CF
	for <openbmc@lists.ozlabs.org>; Tue,  2 Sep 2025 22:15:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Tue, 02 Sep 2025 22:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1756865756; x=1756952156; bh=O+91Ct0+f3
	KIg73Wo/2PalQsLNhzhpOTyEh86OEAFl4=; b=EMDox6pc2OpWeeConCmeWj3GWH
	gd3m8MTwav20d2shEV6/7X8X/RQtl0opdYS4xqUKLFJ58Rk+LRFQzr7HilGtghYf
	4s/YHHKU5kBFSv4o/o4FZgM83GoxtpO/ILnSImZyNI18/D2tpKPFkZktKPvp8zka
	7vGsq1r4DfZZKzxV1vLWVZc9weaRnBbLv8hKTEigUUYF93rUvYM09yhVlSrZKUfK
	pOTWMYlWm3y0KfMsOgt0g3kc8s4qEyzmKxG1moGdLnt4eInAlUl5zAsCo4CkmGHp
	vqZIUo5COOZ8UEEFiAR0UBUUVgCuS1R6nmgmfjp5YIjZjk8VyKKXEWiu7+Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756865756; x=1756952156; bh=O+91Ct0+f3KIg73Wo/2PalQsLNhzhpOTyEh
	86OEAFl4=; b=ecLxY7J5cFPq4sS4uQJKswSyM3GsUSOHK1kX96XM5Hogut23Gmm
	3HTg6CjFpsvW04fB2OBG1fWr4MMrh1nwZnW/R6oVqrOuf1Wr8Izv5Cl6ZxJfhSSI
	/WtyFRLpmJioiDCnrJq1TOw9BKSKus6qJzT3SgOfQ/F6wdcZzWyJo6Qe13HcE6eu
	NjmQZlmECPJCcYB86roqFx2GCX80skJDXo5Yc/T0HwnhCy11uGNsDou8cBv66LMZ
	2wNQxFwGpXu23WrD+UuG9o0rxlV9BCzg+LhaQhRmJxQ01klE8ZFkuqiFzEjAf+iN
	PqRJ9lJfHs9G+YMbt+6MW/eEdYj1LyWpt5Q==
X-ME-Sender: <xms:3KS3aKAIKkvWyuvzV7TyYpbo8jLaaz3HNbUYvwpIDs8bQFAWiUuDnQ>
    <xme:3KS3aGjXR_T5KFjjJt0nt6AxzU7drvAohE6-VSkOHUTiecAkhVjPtZspcqYbWL1pg
    beFe9slv9i0IuxTfTA>
X-ME-Received: <xmr:3KS3aG-oc7rm0-iMmcM6yPpeyhHQ9m89pSapSxMnOOhvrosMwi4-T1L6c-M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduledvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhluc
    fvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfh
    rhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgi
    drgiihiieqnecuggftrfgrthhtvghrnhepffehueeltdejvdegtdetlefgveeigfevfeej
    udfgueeghfdvveeljefghfduteevnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpmh
    gvmhgsvghrshhhihhpqdgrnhguqdhvohhtihhnghdrmhgupdifihhkihhpvgguihgrrdho
    rhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepph
    grthhrihgtkhesshhtfigtgidrgiihiidpnhgspghrtghpthhtohepuddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrd
    horhhg
X-ME-Proxy: <xmx:3KS3aK9mC3YpQuX5nOMxFfR9L84hn0Ec9TLE4RKZnkhUYrXjLRRDkg>
    <xmx:3KS3aHDfGq6mAiIp7NIGElCI2sBtOlgH1MEVn5ldYIZ-ICOP9G7_TQ>
    <xmx:3KS3aCzMbnACNnQ3M6SOK-_1u5EiHqCiEE5evns9RjwN-Ora4Kf_1A>
    <xmx:3KS3aEQWwKNBEo2uKl8tjkCmuGsRANOuzu-JlDMncKjcE8S8ZzUntg>
    <xmx:3KS3aI-h3faaE4cSyrBoSmyGcKANr46whxbKF_wh1x5xnR_geearEmaV>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Tue, 2 Sep 2025 22:15:56 -0400 (EDT)
Date: Tue, 2 Sep 2025 22:15:55 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: TOF elections for 2025H2
Message-ID: <aLek2wDSYDGMLPH6@heinlein>
References: <aKOKlY97pOtfuaEv@heinlein>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HKC10PqmWzvy/Gx2"
Content-Disposition: inline
In-Reply-To: <aKOKlY97pOtfuaEv@heinlein>
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--HKC10PqmWzvy/Gx2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greetings,

For the TOF elections this half, we had 4 qualified individuals
nominated and there are 3 seats expiring.  Therefore, we are going to
have to hold an election for the half.

Per the TOF election rules[1] (with minor date adjustments):
    - The election will begin on Sept 3rd, 2025.
    - The election will conclude on Sept 10th, 2025 (*).
    - The election will be by Ranked Choice Voting of qualified OpenBMC
      developers.

For refreshment, you are considered "qualified" if your Github user ID
is found at the rollcall[2].

The 4 nominated developers are (alphabetical by Github IDs):
    * dkodihal:         Deepak Kodihalli
    * edtanous:         Ed Tanous
    * geissonator:      Andrew Geissler
    * manojkiraneda:    ManojKiran Eda

I'll again say this is a Ranked Choice Voting.  That means you should
ideally vote for at least 3 individuals, in the order of your
preference[3].

As with the last election, we have a tool to facilitate voting[4].  You are
expected to fork the Github repository, run the tool, commit the
resulting JSON file, and create a Pull-Request to submit your vote.

If you have the `gh` tool this would be as follows:
```
gh repo fork --clone openbmc/tof-election
cd tof-election
=2E/vote --user <github-id>
# make your selections with 'vote N', 'save', 'quit'
git add 2025H2/votes/<github-id>.json
git commit -s -m "2025H2: <github-id>: add vote"
git push origin
gh pr create
```

If you don't use the `gh` tool hopefully you know the equivalent
git-commands / github webui operations.

Please reach out either by email or in #tsc-and-tof in Discord if you
have trouble voting.

(*) - Since the election rules do not specify a timezone for the
      election, please submit your vote/PR by 23:59:59 Samoa Standard
      Time (SST).

[1]: https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.=
md#terms-and-elections
[2]: https://github.com/openbmc/tof-election/blob/main/2025H2/rollcall.json
[3]: https://en.wikipedia.org/wiki/Instant-runoff_voting
[4]: https://github.com/openbmc/tof-election

--=20
Patrick Williams

--HKC10PqmWzvy/Gx2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmi3pNgACgkQqwNHzC0A
wRnuwg/7BrffyK5cRzN4XBuvIo+Z+R04r1MMKyc8Q8+359QoG9IMj53f8W8w/Fuh
DoQmOkm6Sx+ZAVRx5bygypLEmls6uh9jhE4X18rWlMNpBxOUKZcConi8suiaPkS2
ejR/zSdRmzVycs1rzBiYKSdsLwR6N9dquUkltt7XwZ4GKS/NZl1bx74Xo2i8E5uJ
TeOTokp4BIRhr4X8KyTgehjsbfqUAV9NSUifvNbmSkaQFXrPPmO2MuL1R0+BlQMa
5mjjlCtW7pYV44m8dgvAKrxNhbC0XDe88f7AU1gd+EMkL5vmAFHy+l+Gfr4kMZ0v
M1LLUK5eAeoJ0meNH6+UzKXnEksIKSv69Yx3QWF7CGxSqyZ96fkgEo50SB+K5RcB
G6VOpHKNVpRZeTAWzpTWvKcyzrPVxVvzI89NpizhAX3ZG8tZXLJsmcZWy53P15u0
e2i+tmyXWGuqFutbZg1fwkgJ3qsK8Gt4YA3+ZAdnk2koweBaZV1vJla1HqCIem/F
FKN2g7NssQbCCjIkzD6YQvHUvCHCNChsI8uXmdqnuyOPLPuD+kiqs1MmBKNjeo+r
M1zZl34u+TaDSRrf6z+/60VuWr3Kt0P2Od8anYjARDz4pX7CmOsy069m2Fs/Xe0J
QqQKxSlpFTuf6OaPI9G6GgrR3Kf5KrPgScdSkY7CHGdOJSaqjBI=
=FHtr
-----END PGP SIGNATURE-----

--HKC10PqmWzvy/Gx2--

