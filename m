Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E96A31B8C
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2025 02:51:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yt1WC1Nfsz3cYb
	for <lists+openbmc@lfdr.de>; Wed, 12 Feb 2025 12:51:19 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739325075;
	cv=none; b=lc03E/6iHaw66qGgW+XEI3LhZ0MN+NeFYcGHHN6s69A2zPrBm/Ci9KnrT7as0e4l2ZlyYws+waiPXGPhBDPfFqxqMx8PZJElkKqxYZwpxlR9u7AubtXpi1TCI1gyCeqGYp6Qh1BRpY8ooS0ol9bQToucxKf6yN9S+QrigouwFWS5/EXCdbJ248cYqvNgyY3c94Sqf7aDQ0zaeLMpiAnPn8bYbfsBp6RcUqTboEvQRnc1A9ZN4Ixho5ZwvP686lDMNdNXMPC32EQzakpiSjnQb7updUEFXJh26BkymaWZ+i3Ar0eQEsk2ZZukKM+iB4cJk8dOeWvsmqM1b52EYzt6Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739325075; c=relaxed/relaxed;
	bh=jbPamGD9nDKoVBUqNXCjCxmKuJFwyCuQVIUT9oREops=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsqObyGfidMLDVf/40MQYASKzjcJOjpGVxhzTOsORCbVxBTLxkXNiQw8kwGUc0D/vnoBuxsicXnsh6flJxcX0Hf43dUcY3O0DbZuCfmjdRVEfhHnylOPjfLSlwVLur6G+5057bWmb7LyPHExKGYEcNvCw4N7R7B3qRHTryNkZUL+adFFNtzIQ/xX+axecR+qttZ92kb0w55MDyOWgXAmcjaqABQ/vPW2C+zUuJaJ7ZkFbEV8eFYPLFsgrHxMdi5dCUJz9cEIYwmV4r7y3ZcOgGt/PXPIJIq3sOy+LxLmB+9I29TgyWUxay5Z55fYVrbwzW+pZMITZvOpy0Uk9GKulQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=SSp0Ckjs; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0Mv2cndS; dkim-atps=neutral; spf=pass (client-ip=103.168.172.146; helo=fout-a3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=SSp0Ckjs;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0Mv2cndS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.146; helo=fout-a3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 513 seconds by postgrey-1.37 at boromir; Wed, 12 Feb 2025 12:51:12 AEDT
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yt1W40cmlz2xmk
	for <openbmc@lists.ozlabs.org>; Wed, 12 Feb 2025 12:51:12 +1100 (AEDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id CAFF6138098F;
	Tue, 11 Feb 2025 20:42:36 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 11 Feb 2025 20:42:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1739324556; x=1739410956; bh=jbPamGD9nD
	KoVBUqNXCjCxmKuJFwyCuQVIUT9oREops=; b=SSp0CkjspyhkA2cl/zZyqD4jpz
	B/3SUYDaZwWKFAMrRgM1KLd132O/sfmlpyokSRyVYSYsSsDpkSfeO6ZbxtyTrZRU
	JoCgl88uYbYpI/XWGwmc+o7vpZp/vL5HELp4Ws+RuGOkKyg7ZxRPFaL7I7XpByh7
	1H8ywVHmVWQsO7Wvj4RkEzVkL68DvDTVyL6nx7NuhehKU53pyS/aZp2n8YeT6z4g
	JKnZoPvHB4kC+ZalIIB1CqEsX6b3vwZbkd6Qov0WVYcX57NVnbTmA03sEtzK6gib
	ET2vLcstqWmSx/WdS46XZMiUTaG4lHzQIDP8zwciddYe1vn7ufHX2Oi59iiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739324556; x=1739410956; bh=jbPamGD9nDKoVBUqNXCjCxmKuJFwyCuQVIU
	T9oREops=; b=0Mv2cndSTT/2O/0G2048n9np/woff44RVsYZjaFHvKKVd6gkhwW
	cueHP9CoN0bp3bW+gzeVRw+BKsAF5HSeeB+2LoIN/gPGzpqRRa9ogJxkYe3upKGc
	KHcYKxX7pFERJacOBdV3AYNGFQ5gcVzDIiLm6GaMQZb4m6HmrmxaY2EDAwhGQMHG
	5KmLW7PG/nGKf27omLoTZwNFjEqWNeumIeTPACRSoVMY6xcOPl7cVYuBSJsxjbgg
	X9XC2g3vhUKEiur/7Z4F42GRQDnC51lgQP9NKdmxm9KwmbWDc7TPP3DhrJODThOG
	KA+WbjasUhgpr0TXmKwJFmoqzDvtR+MY2YA==
X-ME-Sender: <xms:i_yrZ3POi5T6ULprH4KXhZgPaWVY4zCD7xD-SXsagccvC-zUuAkJnA>
    <xme:i_yrZx9V_C6UmQhGOucz9rMnyeDNGP_RMoXruEPu4TnE_rLiNbzaAMZEZo02qwua_
    ygEPUwxvtytSn5EShE>
X-ME-Received: <xmr:i_yrZ2Rw3gcoMww810CcFAWp5gAyCJ1DVZtPNqm7RQ2o4aLhpW-2zrc6QKo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegvdehlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculd
    dvfedmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhep
    rfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihii
    eqnecuggftrfgrthhtvghrnhepkeeifeeggfevvdduudehveegvdegtdegffehjeejkeek
    gfeifefhkeeuueejgeetnecuffhomhgrihhnpehophgvnhgsmhgtrdhorhhgpdhgihhthh
    husgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehprghtrhhitghksehsthiftgigrdighiiipdhnsggprhgtphhtthhopedvpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopeihuhhlvghirdhshhessgihthgvuggrnhgt
    vgdrtghomhdprhgtphhtthhopehophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdroh
    hrgh
X-ME-Proxy: <xmx:i_yrZ7sew8vZWiNqDBh8OSM0k0RoyVgSURqdZF28eNnfZV2jMU7NOA>
    <xmx:i_yrZ_fbV8qQuR_4JNqU-IGKx5GaNOPHy222I1GKnP7E-bpEnQ5JnQ>
    <xmx:i_yrZ30uo5ETBq08j8juO7_LAyuiQj13BPcLauoAMA-YfSzDu7PG_w>
    <xmx:i_yrZ7-qGFKxOTGUMxTkKG_5Fsh5G-jPDcxTnKsHqk2jZ4hz9OoZ1Q>
    <xmx:jPyrZwrRb5fnSgOVpJoSHn7h7hAwfWTibuPSzBSYEMVgxTzAEaSrpCPO>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Feb 2025 20:42:34 -0500 (EST)
Date: Tue, 11 Feb 2025 20:42:34 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Lei Yu <yulei.sh@bytedance.com>
Subject: Re: About meson clang-tidy issue on some repos
Message-ID: <Z6v8ivnGwbt1QCDk@heinlein>
References: <CAGm54UHxNhSkzC84hS7fh_s-DpdOuii0g2O=GU4Z1aPQ6YMgKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bcNFpnwLEqK6OjLX"
Content-Disposition: inline
In-Reply-To: <CAGm54UHxNhSkzC84hS7fh_s-DpdOuii0g2O=GU4Z1aPQ6YMgKw@mail.gmail.com>
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--bcNFpnwLEqK6OjLX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 04:58:40PM +0800, Lei Yu wrote:
> This email describes a repo-ci issue on some repos related to
> clang-tidy and requests for comments to fix this issue.
> An example of such an issue is
> https://jenkins.openbmc.org/job/ci-repository/100565/console
>=20
> # Background
>=20
> 1. At first, openbmc-build-scripts uses `run-clang-tidy` to run and
> fix the clang-tidy issues. This works ok.
>    `run-clang-tidy` will parse the `compile_commands.json` and
> **only** run clang-tidy on the specific files to be built.
> 2. Later, build-scripts changes it to run `ninja clang-tidy` [1]
>     This effectively changes the files to run clang-tidy, that in
> meson, it will use `git ls-files` and a suffix filter to filter all
> the c/c++ like files to run clang-tidy.
>     The benefit of this change is that it will run header files as
> well, and potentially find more issues.
>     However, it does not call "fix" and thus does not automatically
> fix the issues found by clang-tidy.
> 3. Then meson introduces `clang-tidy-fix`, that does call
> `run-clang-tidy -fix` internally, and thus it could "fix" the code.
> build-scrtips is changed to call `clang-tidy-fix. [2]
>     At this point, it introduces a side-effect that `run-clang-tidy`
> will filter the files from the `compile_commands.json`, and the hpp
> files will be filtered out.
> 4. Now with meson 1.7.0, it changes the internal `clang-tidy-fix`
> behaviors, and it will check all the c/c++ like files again, with
> `-fix` support.
>=20
> # The issue
>=20
> With the current meson calling "clang-tidy-fix", it introduces another
> issue in that it runs **all** the c/c++ like files of the repo, even
> if it's not configured to be compiled.
>=20
> For example, `phosphor-debug-collector` has the
> `openpower-dumps-extension` feature disabled by default, and its
> `dump-extensions.cpp` includes `openpower_dumps_config.h` that is
> generated when the feature is enabled. By default, it's missing, and
> it gets a clang-tidy failure on checking this file.

Can we just fix the issues?  We merged the fix for the phosphor-debug-colle=
ctor
one already today.

>=20
> # How to fix
>=20
> I would like to ask how to fix such issues from OpenBMC's perspective.
>=20
> Several potential options to discuss:
> 1. To fix meson's clang-tidy to run only files from `compile_commands.jso=
n`.
>     Drawback: this way, it will not run clang-tidy on hpp files anymore.

I think we/you should discuss this issue upstream with Meson.  I'm also
surprised they made this change, not because of the hpp, but because of
dependency issues like the one I fixed in phosphor-debug-collector.

> 2. Change back build-scripts to call `run-clang-tidy`. This is
> effectively the same as option 1.
> 3. Keep current behavior, and avoid any repo that has a similar case
> as `phosphor-debug-collector`.
> (https://gerrit.openbmc.org/c/openbmc/phosphor-debug-collector/+/78065
> does fix this from the repo)

How about we just fix them?  This should be a one-time effort, right?
>=20
> [1]: https://github.com/openbmc/openbmc-build-scripts/commit/1eb1994bbcce=
b70d575458dc7a968c0f26b5b6e7
> [2]: https://github.com/openbmc/openbmc-build-scripts/commit/ac9c9c7
>=20
>=20
> --
> BRs,
> Lei YU

--=20
Patrick Williams

--bcNFpnwLEqK6OjLX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmer/IgACgkQqwNHzC0A
wRkoIg//QY+CYM/kGPTc/9Lq7jTy8154WIgCQ1FKoWhq4Tbd/lR/eIltGoXDsI5n
LEdjx1lFrT+OMwnCpEWdJM+U6WLmrLavrGLUxtHb8yoosaHzP+SVbLZoOZfGeFWu
OP16AmgyHEk0GlDYUpjLeO9gc/6RcKA7MGOKbhPw0pBOrURv8bm2msxRWvUX0t5e
RJGPjJjol1fDjs3UrnYki0+L9cLNXZtaySXh4zUww/JH38qqGK+Y9AYWwBPyjC+6
404nWLgaIxNE9Ugr/w3AyjXwyWkMOEMRPYvkxOV69RBVqPJPeMLI5f884F20CMxB
zmfmWO38AHIZ/O7w41F9NgGOtX1+o3XYFvBethNTghKeHPZbCzrOl/ub/5Za1yvQ
QIS0c29GKv4QbuYWHgs24vzmn2pahEKZNiOsasSENXpYyRq0EhGr1PtIabsLGNhv
11OYzNrL1pSqTOaMpM10p7l6a0Qxp8ifmDHrOJ/nE1XpE/9A+wMMAvQNvTKYzG0R
2b9S6aKa9Lr5hHO7WQ1CvLwoUH+GOjgr5IoK750TigMvcI2qEInpmJymj6PJBBUC
yEZTWn/2aUrYbCY8bibEgsbDO+FaxQvxwuSM9O1+/HWeRmC1UxUfcSUOhwqND3dB
7CTf1ZxVA4jcfw8AnXsAC9YxroQEk924RgcF3152g1Q2GD+Fwa4=
=Sp5X
-----END PGP SIGNATURE-----

--bcNFpnwLEqK6OjLX--
