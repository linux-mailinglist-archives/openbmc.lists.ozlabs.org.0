Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6485585327
	for <lists+openbmc@lfdr.de>; Fri, 29 Jul 2022 18:02:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvXND627xz300x
	for <lists+openbmc@lfdr.de>; Sat, 30 Jul 2022 02:02:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ssl15nCp;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rRlXzoDE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=ssl15nCp;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=rRlXzoDE;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvXMj6fN5z2xJJ
	for <openbmc@lists.ozlabs.org>; Sat, 30 Jul 2022 02:02:07 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 2694D5C00BF
	for <openbmc@lists.ozlabs.org>; Fri, 29 Jul 2022 12:02:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Fri, 29 Jul 2022 12:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1659110522; x=1659196922; bh=M26bL10P4LZc1IkNvuE3uCVYOuF+Ji7GQpD
	zynNv0LE=; b=ssl15nCpl53FD4/eheM14KqJ+lhw098fCIIMDNU1g4RWvhjAvKU
	Di8/RYHr3QUygZpUnvPYKPqo/A7NRQ7U0jCQJ/BUc2/XEN6pKKU05ck4sVkERa1M
	Rm0pMqBrbJeS6AH3F9LfiH830gLn8AnSH3DJ3dwcHlgmzw2y36LYHMuhdkqq1eCG
	/uElJwl1ML1nZCvAQ1uppLyF4Mv55SklugUo9/WyqgXTKaitO1qOy1VGNNleN65l
	fvjOVJ8I+ACHjsMUQTPrULrmgCMMcpLLcBOrp3v+b2OEWhalECvp2Ww/Spa+ggN3
	zGaXsqdWaCu3Q4pqZQjXLpKPeoiCbUBojww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1659110522; x=
	1659196922; bh=M26bL10P4LZc1IkNvuE3uCVYOuF+Ji7GQpDzynNv0LE=; b=r
	RlXzoDEzwOcHjbn953I03JNT0NWowviRbT22LMQPKXbsgC0PG9zSKgAfL8yk7XnF
	nXFffzLp6DEiv5WhQ8OAuZj+j2vPKDFx0OUF0V2cb9wJYh+ZptoaC2HAMMGlKsE3
	QSUv1f1EUlhb1E/hHnOgExvMhRDJcFHKwTym+QVcx7Bdx/tKKoL6e0Tv6vZMSU7D
	vs9Adu43H+xPbwJGkPbxG0Il4ZBm2ayjHZNLwS8saTPVJc5MQV9GNxM/XoR5MSyc
	HWpw6S3JSVD5pmTZD32vL6G5qpO0MuVfTQ9D9HUaPiYRFc0VBmfBanwo9Z+pfoEd
	xC6NyywA3jN13CAqJllhA==
X-ME-Sender: <xms:eATkYlW8jAw1XPyDWS2sb8PNcHWgmNWtNXtGiJGOcoymrmFBJr_4xA>
    <xme:eATkYlmqcmV-bIevlnZ_0Owdt6zryy53RFDqdWd-9zf7yjA7DZNpw3wbhpVQhEDxx
    jAuwWdJZ-IvYknkaOg>
X-ME-Received: <xmr:eATkYhbWSmbDHk50ftppYqy8ayrlevRm7eE7iXTibPY5uMbmy5eDtuOESvzTM_gR7tIbDDzOTA-_TVrUH6xJRiaHXudUhm9t>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddujedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkgggtugesghdtreertddtvden
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnhepjeffueelheelvdefveejueffjeejveeu
    veehtdduffdtgeelkedvtdevveetgfetnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:eQTkYoVXYH_ViW1hPhcbx5oxCRYLAfqNz86Is9S7Lb96EUP4x3t8lA>
    <xmx:eQTkYvmFhguuMdc-cfHFLCFLFLVGd4VTt6Cm3LdQu7w7mpW29YK0NQ>
    <xmx:eQTkYlddF7W3yJgk8wku5IlS-n6bODHFFGntfMiyRTRcywiUfg4M7w>
    <xmx:egTkYlRvNqFqwinPlO1p8rBs8Sd-hIAuQ9kU9HS6eTc9IVHuYX6NHg>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 29 Jul 2022 12:02:00 -0400 (EDT)
Date: Fri, 29 Jul 2022 11:01:59 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC List <openbmc@lists.ozlabs.org>
Subject: OpenBMC 2.12 release candidate
Message-ID: <YuQEd4Ql+r0IVfPK@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oyIpmx3fQuHz03lu"
Content-Disposition: inline
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


--oyIpmx3fQuHz03lu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

Yocto 4.0 (kirkstone) was released back in April and around the same
time I had branched our own openbmc/kirkstone to match.  I've been
keeping this branch updated as upstream kirkstone fixes have come but we
haven't made an official OpenBMC 2.12 release yet.

I just made two new tags in our repository: 2.12.0-rc1 and 2.13.0-dev.

  - 2.12.0-rc1 is the tip of openbmc/kirkstone and intended to be the
    release candidate for OpenBMC 2.12.

  - 2.13.0-dev is the point of split between openbmc/kirkstone and
    openbmc/master (really 1 commit later on master).  This causes
    `git describe` (and corresponding /etc/os-release files in builds)
    to show 2.13.0-dev now.

I will leave kirkstone / 2.12.0-rc1 open for 2 weeks for downstream
users to report issues.  If there are no reported problems (or just
minor problems that we're not going to backport fixes for), by
August 12th, 2022, then I'll tag 2.12.0.

As usual, we'd appreciate any downstream testing that contributors can
provide.

--=20
Patrick Williams

--oyIpmx3fQuHz03lu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmLkBHcACgkQqwNHzC0A
wRnnhBAAgXXwxMHGw0XnODHhVpNmQ+vf+ecsXLXVP9XIODDnfLJb+ueVxG393naS
XES9Al9ueHbgDmaBkmshNu5S+FKEn/8OLR3C/rXc9bmD//8lK8XwaAT1k9UmIdyA
69mpoRhgoW3C14djJpWnj9i9w88nfi6pklqbrVR0GvXDls/eKA6kpKuuhhT+6lvZ
C6iowUukooxj0lqGMCXvl2y0QLPaszF16OadlPLBP2UVsED/Ay2nnNx9YuysjlnD
MmLRDp2l/yOumyc0TeBQj5zhd67Z/C0fDQNJqibJIgk6uZ/9F7kkObWdvPuaEgwk
e7PIGkrcoYuNbEO4sOiD8xee8Chk/E+i49SlAj0iKziWvd3pFqtGaO35Vb0wcPKh
Qkp2W0HcXZ4tfP0FfEP8DYCXPCSi9IyXzXlpLkPY5drewjucyLRVHjkFHTB6bLqo
03qTWpNamJK2/Y7TankbqYyFBLWq0lqyesGotmWxYfzLB4K3W88Jaw/mhvbdMXJN
IIEw3BOI4t+BfVsL5SSSZm1RPn6S+H2XiV1V2vc3uofh+dtlNJgS9wegO3vlJYp4
69N05gXdUUAOinvWkU1ugdNaHBQaIePICaPcU/YECIhG7541Yi3CEZUWXs9OsACY
3wzQM5H8++ERL7WVA4c6oLnyUf+XkrCZ9++Efn2tn2qAW0AiJ/k=
=BNBi
-----END PGP SIGNATURE-----

--oyIpmx3fQuHz03lu--
