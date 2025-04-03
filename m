Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 327DFA7A5ED
	for <lists+openbmc@lfdr.de>; Thu,  3 Apr 2025 17:05:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZT4ll71Tnz3c9q
	for <lists+openbmc@lfdr.de>; Fri,  4 Apr 2025 02:04:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743692689;
	cv=none; b=ds88Drjc645quvEin93irnXTaLnenk+zkD+CL9lJsgRsfV/us0EpFYtr+iskrf/iMoxEGOZGdMVAHntFyni17m3RmXWIQFMpPZv/YlxO+WTRUN3EfWgu2SVLjBbeL6hQ2zaK5alyNUsh7fknhCKg40QjqZS7PNBqOMhlZoI6U/wo6Pfj6JvazBfM/NwQ/kX7rHaFrt0A/gCwELzXolYO0WeHIcj3mhlorbIYhTvKjCWMpIAtwpeeNU6gRVorTzYntmObgDI7ykDn6mittfLF6jmALErE3B634lD2ZtFTz1nKhB9L7I+flU1T3Xbp9c0tCLwd7K2PBbep5+Uu6tyWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743692689; c=relaxed/relaxed;
	bh=GuukJQEhAi5gbZoDzdgaMWfnxvhxybHj6igfeZSy8os=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlQU+XgFh2yMd6Ah/QUi11RX6fnz6ycZ8111UHc66U/oLR2O2SgNDSkq5RNGiibYzsATlKzd/Vqx7JjfSrp/3FY9ICuWBDfC/NH3q6ylScdbvWNdu0YOTUDZPbTeULSXS2o6zHM8VBBDBz448TXXxEdMCYp/N0/tJMLvEDs21JTvKY79eWeLJUFBPMXq5Vvi4JarKrkwo4ffSbeOwAIu/WWVh91g0VA61cf8mwzbsewMGyVvwSruA1qtGIOoLpA8P/1fbIjVi0Ib2qzaauOmtrRFb2JDDLRyuv89FKAiGDSDDEP8NKxL6weeSIILUMlVY/jWx4BA0z5pMY8mimMvWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=jAVPQuW9; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=trE46oFU; dkim-atps=neutral; spf=pass (client-ip=103.168.172.153; helo=fhigh-a2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=jAVPQuW9;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=trE46oFU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.153; helo=fhigh-a2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZT4ld6bWNz2yrY
	for <openbmc@lists.ozlabs.org>; Fri,  4 Apr 2025 02:04:45 +1100 (AEDT)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9C9ED1140215
	for <openbmc@lists.ozlabs.org>; Thu,  3 Apr 2025 11:04:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 03 Apr 2025 11:04:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1743692682; x=1743779082; bh=GuukJQEhAi
	5gbZoDzdgaMWfnxvhxybHj6igfeZSy8os=; b=jAVPQuW9ixbHTA0PWmGJGW5opJ
	77qAOeq3wlTJXfquqPV8VYW9JEeMez38gIrWojqSRNbpaGGgmHddEP1NRvpYq/Rn
	cABVh/4WQnhkQyCUK8TNebkwRUJszHMF8Dn4GGrRRFOKblM4unnLfXTyDsSxLmdV
	pKjF/bH90cepIpaFhl1AJI7ODnSER9dhiuMXdTvUqIzlS2AGjQMp4ETjb48fjyMS
	LjA0QsvsrEWWAtO+KK5O45TA+aGQdH+DMUFutXPYHdAGvzmO0NBY1bvbHjD63LM0
	Xgdr7rVlXVH7AxUvUSA7HuIKkvNlb89NZSVqqVpjl6FMd+QyvUhksXk2cxCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1743692682; x=1743779082; bh=GuukJQEhAi5gbZoDzdgaMWfnxvhxybHj6ig
	feZSy8os=; b=trE46oFUYbgMFg/SLSmGnfLEjslbSxy1xn+fr6n3fV747Qgj0T0
	y/OvsL57359Q6EbcYenGz3XeMetGiWbrJ83a4Fl9SSKvR5EJjqVwgMcxNXMey1BI
	Cb9v+h9yb4PrD2wJbFO3RSKTbm9Qs+oa1Mle0eNBV28zi3nEzzKfMdbxqAitRfW8
	PBbIGF9YP4khthBvsH8Aef+r7Lr8F3LA6ORFVHOISUN/rt/wkXcmUeEBZ+moBqlk
	I8WPSdoWbm4qozG/p5twoAyN9XdODD+iilXpL9937zRiACltvzcfzVtIWLnHxmnR
	GVDZ5UPIMleBynvtimZG3/pIdXJBO8keqAA==
X-ME-Sender: <xms:iaPuZwjLvDt3KNkWwSt6WjweayFZoa3xmCy-vChrZlEscUXUhVe4LA>
    <xme:iaPuZ5C-IXEOFM-Lynn61tfOeSbAegJswDV3z6kxxTk0sFKp59ko8SDUucJA7DHOc
    wBk9bhs1Sj6D13s4fc>
X-ME-Received: <xmr:iaPuZ4HbswDn93j0pyf6tswzCQEYduGZ_7dOdhTQ6r7ynjbAp8BZ9EC1kOY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekkeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnegfrhhlucfvnfffucdluddvmdenucfjughrpeffhffvuffk
    fhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmh
    hsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdeh
    ffffudefieetgfdugfduiefgieevfeffieehiefhieeutdekgfeivdekiedvnecuffhomh
    grihhnpehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhtrhgvrghsuhhrhidrghho
    vhdpphhhohhrohhnihigrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihiidpnhgspghrtghp
    thhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepohhpvghnsghmtgeslh
    hishhtshdrohiilhgrsghsrdhorhhg
X-ME-Proxy: <xmx:iaPuZxTImWELugbh9DTt5Qdi_QGmFP4DvGabjJywY498rRsMJYCANQ>
    <xmx:iaPuZ9zs775v0mNFEuKY6GVhyYqnkE60qzVasqYY0v0cFbnXr9Z1zg>
    <xmx:iaPuZ_4drH7ai21KFV3mBGMHXX65NWCTWs7PbcA0Xk1LkZhtCwkH_g>
    <xmx:iaPuZ6yKAO8x8LXMKpCLh622RDwHhYlgwxFIyn8qqG4UAZ1Im_Zimw>
    <xmx:iqPuZ9jxtpXs3LFpQ5RZcD3A8irxWNN0BaKKTG1WAEUKhOFWp7lPjUiO>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 3 Apr 2025 11:04:41 -0400 (EDT)
Date: Thu, 3 Apr 2025 11:04:40 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Re: Update on some maintainers / contributors.
Message-ID: <Z-6jiKlhgkOStFZp@heinlein>
References: <ZyMIJfBoYDPeJhxK@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YUmXRSN7TyQ86ZUx"
Content-Disposition: inline
In-Reply-To: <ZyMIJfBoYDPeJhxK@heinlein.vulture-banana.ts.net>
X-Spam-Status: No, score=-1.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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


--YUmXRSN7TyQ86ZUx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The Linux Foundation made a clarifying post on this situation[1].

[1]: https://www.linuxfoundation.org/blog/navigating-global-regulations-and=
-open-source-us-ofac-sanctions

On Thu, Oct 31, 2024 at 12:31:33AM -0400, Patrick Williams wrote:
> Hello,
>=20
> This is not a great situation for Open Source as a whole; involving
> legal issues and international politics.  Since there has been some
> public activity on other Open Source projects, especially the kernel,
> it seems like we should be more forward about what is going on.
>=20
> In early 2022, some of our contributors associated with a specific
> company lost access to GitHub.  As a result of this they were unable to
> access Gerrit.  Since that time, access has not been restored and they
> continue to not be able to contribute to the project or provide feedback
> as maintainers on sub-repositories (which some of them were).
>=20
> I assume the reason those developers had their GitHub accounts
> suspended was due to their company's appearance on a US government
> sanctions list[1].  Recently, the Linux Kernel has removed a number of
> maintainers for seemingly similar reasons.  A good article on the
> situation can be found on Phoronix[2].
>=20
> I have not seen any official/public policy from the Linux Foundation on
> this situation, but it appears that high ranking members of the kernel
> community decided to act based on some non-public guidance they were give=
n.
>=20
> The way we are handling the situation is as follows:
>=20
>    - We use GitHub for authentication to Gerrit and have no plans to
>      change from this.  Anyone interacting with the code there will
>      need to have GitHub access.  Anyone who has been suspended /
>      blocked by GitHub will not be able to interact with the codebase
>      by either contributions or reviews.
>=20
>    - We are not accepting new CCLAs from entities on the sanctions list
>      or accepting ICLAs from individuals associated with these
>      entities.
>=20
>    - Maintainers who have lost access to Gerrit are being removed from
>      OWNERS files to provide clarity to contributors.  I believe this
>      affects one full repository and one meta layer.  I am assigning
>      myself as the OWNER of the affected repository to ensure continuity
>      of reviews but would greatly appreciate if someone else has an
>      interest to take it over.  If the situation changes and the
>      previous maintainers are able to resume participation, we can
>      restore owner status to them.
>=20
>    - No change is being implemented to the mailing list or Discord.
>=20
> I do not have any advice for individual contributors on the project.  If
> you have concerns, you may want to seek guidance within your company.
>=20
> [1]: https://ofac.treasury.gov/faqs/topic/1631
> [2]: https://www.phoronix.com/news/Linux-Compliance-Requirements
>=20
> --=20
> Patrick Williams



--=20
Patrick Williams

--YUmXRSN7TyQ86ZUx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmfuo4YACgkQqwNHzC0A
wRkb8w//SBQZ9UFk/iODomlYNC/C1hi17FElJLfky8Y4zeHNyUXj618ip2I3Uqij
+/LO8o4rriGSWYjTxkDEyAxFIM/cwAFINZFUIhQgJzeo25X0NVa0m3iuAbMGCU0k
MnjlnwGcTmwrpEMPtPFV1XOc5GTj19RMMkvHITuPGKkq/OZWA4Z1CcDKMtgoy8sU
RAABSbgP7h2ofVg3W0mKFc3wBK8uQBfAbnY5SwTvCdB0lXi4AAB9CBlDDJrejHNY
ZEQIaBI5Ic0FZgG8I3eKICHpxHoL2vymGRBRj9r2g/iowEexft2evjt8YFw4lfsj
6vPwYdEX6Ag96R1rRwUrNZLRTrBNmI0/0gJ7HO1I1Y4eGcziWyQRAwAJ7aGAcGVH
Aml+mciLUeKzuElsqJundF0czoMBZ3UTOZF1gygyJQEPPmxFyTOQtpv9mZAyjAPH
vPImwgzaO4mVwiUrBGQ82w6WOEEoJk7Q2RwE8K4NTAVerWEgq5bR14Kmx3mYqVvG
dGAMSqxpzBgBoO0BeiFEd7b915SE+hGKeKJvnaFkKTiM2shLF+geWEMnibZh2/3g
p9ZWuJbJ/oq4+pBtpOtskGBRocmFW4sJ3DbBC4XNFujs+Ssyc/lM7043yOOIeIpr
Sl7ARwxmxr1UP6/Duc+o5lrpgaQksrKGyBC0kIFhnujMeo3CLe8=
=4FHa
-----END PGP SIGNATURE-----

--YUmXRSN7TyQ86ZUx--
