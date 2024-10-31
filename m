Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF249B73DC
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2024 05:31:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XfB0M5l7rz3bxl
	for <lists+openbmc@lfdr.de>; Thu, 31 Oct 2024 15:31:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730349104;
	cv=none; b=NBCyO43KH0PmScBrmcqfVkzMn7Z0p9tUfCb53wUCrBagptHI6DIVot8sxU2gFhIjFFxrPHxTyVFf921V5HhTOypJtHFnWOTmi00D4ayn6of1wkzeVEm9lJZBKPOsSFPtGlW72pR4qUbB+hK08O6QfgBaRZO/LI3h6TA685YRu9db22F5aw8RqNeXv9ngk1AhSvoiZr9xJELrFRB7/5u7q9nkutA8HTN2tHDshXIHgRDdFmQ0LzJyTppOpCee3cM2/P9xYHz4AH7qWWB/nFgMlvOla78BYJuEMltOVYg4QGRtEyMCYbp70Q1aqQJ1hrdOF6l+Ys9G/O1516p2dchVtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730349104; c=relaxed/relaxed;
	bh=e1dg3KD/8Bx1nFtTVMDqETpD7fqt9sdvJHLwlaqw2B0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m0VGw1rvegYzEa5manlalX20SkEZgqWoJ9nZCxPibiLOkiGnN4xZmOonqPApOKpPliUGPyP6OlNe0owAOrHN5u4IN8BseUt0MJkHWkc+3C/AEq+mVexHlOh+4b8Rg+4vnag+dwL5f6Mf9WET4dHzxIADLW7NEo+e+7lWXyvC7GcILeOaFF4gVK5IGLkyLYn+1JEdIM9nEAPD2UTwCoQdh7JtxA8k8sXQM/GaQz9W1lolOCHRfSXesNM9iLqETmbLH0ZP4HiadWwtLmODFhxMDgC7PnkB/bBpTIKuYnqPQMkXDN1R4EmMp73pTRNiNJ5fQ1Se+AT8D1mXhhdqQvPrpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=eUh5p15u; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ln9F4SUE; dkim-atps=neutral; spf=pass (client-ip=103.168.172.145; helo=fout-a2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=eUh5p15u;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ln9F4SUE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.145; helo=fout-a2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XfB0C3KBsz2yGZ
	for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2024 15:31:38 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 2841B1380132
	for <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2024 00:31:35 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 31 Oct 2024 00:31:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:subject:subject:to:to; s=fm2;
	 t=1730349095; x=1730435495; bh=e1dg3KD/8Bx1nFtTVMDqETpD7fqt9sdv
	JHLwlaqw2B0=; b=eUh5p15ujwfQZEf5MvNme4yHFUR6oO9Njmm8XwVRqqplzGOp
	MZ9Vt/hA4Rslzn52P1qyPh+ZVc9OmZPEt8RaKWYMnmzpXXtzYsGjA4uYyOo/rzSK
	jLbmmLnW7uixZTaXrlEtWqh3UB2Rn0oxrJL6BOUkDwx6vA6VgYdzEZrQb1LMkva2
	b/z53CXI/Oekfj2jvJNEMmyeMbAh++YjJJZEesgKJZMqLP88+08+mBf2Pf4Xw/Jp
	WIOhioni+71MjvLYPUZaIMax8/+p77QoAHDDFz+o+NbX646bgakYThJ3Udy9jVcR
	n6Fqtl7N4MwtLPIocJZ+VcbXskzantwVgey5YQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730349095; x=
	1730435495; bh=e1dg3KD/8Bx1nFtTVMDqETpD7fqt9sdvJHLwlaqw2B0=; b=l
	n9F4SUEjb+vZPpblHSywOr16VBGli4S/vREa5nE3B1xe9HlxNbkKFg19cT5oe97B
	Rjtxr7St1KHdOyhVjYBiimo4/US0wVMeHWw/0Dt3DWbyxy5w9z8PGOVIks4K1zcp
	1FXEnRHzlFjPXVl+CKt83CKVBtLXEKDmoXIQngOpB3Iy5RARTfX2cwpDex5+SdbI
	8NwV4Xo5wLq03GwdEbqAgqQ4kgyHPwxzFaatHDdJpVS5cCfmd6HttA0d4e61glE8
	An+/Hp1bkUfESAFMQjQV5s6jO+a+JCxBJWgWoQZ3ykX+LBinDKBFGfk9KRb0j570
	bfpbAtZfe9ZtANXU9z56w==
X-ME-Sender: <xms:JggjZ_8UV1dzWJ9fKTf6r-HoWV493U5YtIqM0qHy2Gof9de_aRorKg>
    <xme:JggjZ7sm-zFQLyePNqgeyywj-PBmjTlwLIrogVsT2_SOUDtMLB9xQX64EU5Lx0M-l
    jV2r37pH8ZhmQBoohY>
X-ME-Received: <xmr:JggjZ9DXf8L6PUtZYYJf0-P2dnMtu9RWJz6llff4LxYhwtP4pXrMAMHg6Zs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdekgedgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnegfrhhlucfvnfffucdluddvmdenucfjughrpeffhffvuffkgggt
    ugesghdtroertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceoph
    grthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepgeefveeiveeu
    jeevheegtefgkefggefgveelgeduledukeetkeegffdvvedtffeinecuffhomhgrihhnpe
    htrhgvrghsuhhrhidrghhovhdpphhhohhrohhnihigrdgtohhmnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgi
    drgiihiidpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhg
X-ME-Proxy: <xmx:JggjZ7cv90SS0Xr2SMivyA-YzDi_mxuJPgEwUEpxLLRohnAGHVYz0g>
    <xmx:JggjZ0N_FV0zvJ-D0Veww9n3Ip8JxS1OHkFF9yb5Xin09TtPJGz_CQ>
    <xmx:JggjZ9n9J98d4BXnHjcy0JNEwT1nMwj_3IJJ6c5Fbv6H6oWVcsCXXA>
    <xmx:JggjZ-ucwZYrkGbQcDk3Ko2dilrFBU3h2HAuEVdczE2tt4M-lgc0rQ>
    <xmx:JwgjZ-3aSRSs9c7y21TqtnXzxAwMO08uwqWpHAmQEUCAvbhiEmHfeI_9>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Thu, 31 Oct 2024 00:31:34 -0400 (EDT)
Date: Thu, 31 Oct 2024 00:31:33 -0400
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: Update on some maintainers / contributors.
Message-ID: <ZyMIJfBoYDPeJhxK@heinlein.vulture-banana.ts.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NfsFlKZ8+tnpURRg"
Content-Disposition: inline
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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


--NfsFlKZ8+tnpURRg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

This is not a great situation for Open Source as a whole; involving
legal issues and international politics.  Since there has been some
public activity on other Open Source projects, especially the kernel,
it seems like we should be more forward about what is going on.

In early 2022, some of our contributors associated with a specific
company lost access to GitHub.  As a result of this they were unable to
access Gerrit.  Since that time, access has not been restored and they
continue to not be able to contribute to the project or provide feedback
as maintainers on sub-repositories (which some of them were).

I assume the reason those developers had their GitHub accounts
suspended was due to their company's appearance on a US government
sanctions list[1].  Recently, the Linux Kernel has removed a number of
maintainers for seemingly similar reasons.  A good article on the
situation can be found on Phoronix[2].

I have not seen any official/public policy from the Linux Foundation on
this situation, but it appears that high ranking members of the kernel
community decided to act based on some non-public guidance they were given.

The way we are handling the situation is as follows:

   - We use GitHub for authentication to Gerrit and have no plans to
     change from this.  Anyone interacting with the code there will
     need to have GitHub access.  Anyone who has been suspended /
     blocked by GitHub will not be able to interact with the codebase
     by either contributions or reviews.

   - We are not accepting new CCLAs from entities on the sanctions list
     or accepting ICLAs from individuals associated with these
     entities.

   - Maintainers who have lost access to Gerrit are being removed from
     OWNERS files to provide clarity to contributors.  I believe this
     affects one full repository and one meta layer.  I am assigning
     myself as the OWNER of the affected repository to ensure continuity
     of reviews but would greatly appreciate if someone else has an
     interest to take it over.  If the situation changes and the
     previous maintainers are able to resume participation, we can
     restore owner status to them.

   - No change is being implemented to the mailing list or Discord.

I do not have any advice for individual contributors on the project.  If
you have concerns, you may want to seek guidance within your company.

[1]: https://ofac.treasury.gov/faqs/topic/1631
[2]: https://www.phoronix.com/news/Linux-Compliance-Requirements

--=20
Patrick Williams

--NfsFlKZ8+tnpURRg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmcjCCIACgkQqwNHzC0A
wRl0HBAAjrXIjUZGFlm+WZPMF2tj9lPOcEBaSS07qFLiYq6BxqBPN1F9mNb9f8TN
4lWc3NJ5eBf1PbVgoTRHDlnGSQnZXEDRnHn6gjd6HW47yhAMW9DUmwJdeeUvui+J
wNW5OU8HeWlMavTjEN250RWBMU0zCmcrHhY2HD/HZ5Vcz6hI6rdv1NJUq1TLhcQl
JgLvNy/jEWZZMkTs8x5Ny3IgWsSf06fjyuoov9k0JlYWzwvsAAZFs9OF+4Ej6mX/
TfbM089G/vdru30Azxwd0mHIEse343/4IKaAruIdMn6SZs0LRI6XGLSNoWQTOqoR
DE26AGu3ibbh2denij3wvQ+CMKhV320YZJYguYaBqGpT4ySy6ReZBRU3P3FuErDa
E0iAcewvSTeQdJZ6d9JmMGdL+InTQ9j2ewY8vY+fWKOcQ7lw58aawI9SanxgxcPW
DVVPMe1oATusFHQSRk7TiqhVCnWyiL/TxF9m4CIXY/RK8xT5DhaIqwqa/rTBaulu
J9DamYbKO83dFUvxR03TjAMb70A/zmKGkl+sFO97NfDRRWD5sfBWhrYLMt65zcm5
NHvZBEi0bzYxLA89FV60IlvDUMftBbMgeNsbxIRmax3CqBSbsDriP2jSPKUrENs/
9pVlT9edzXuefG7KdjCknmyML6+YiWTj/Pn1XWBVfji/EFjQ6kQ=
=SlQ9
-----END PGP SIGNATURE-----

--NfsFlKZ8+tnpURRg--
