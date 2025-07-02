Return-Path: <openbmc+bounces-309-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59686AF0869
	for <lists+openbmc@lfdr.de>; Wed,  2 Jul 2025 04:19:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bX3Vr4SMYz2xlQ;
	Wed,  2 Jul 2025 12:19:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751421969;
	cv=none; b=eAVcUeh4yx19felQLGt1NJ1YqzUsBhEa1y/32DGRO3j/ZseIR9YHSbmPZO7izGLQGpLCPhlNfpg4HMZydvHeYsHJvr85B5KN2isnDDZNJlp9k3W23j7YjkOYjLyrrkXJJ9NNOdE9i3NzSYGs0Ffg1PKZVS7xxwVXfjp+0t6mytGxFH/tkODAd9UkyU0OTz/yoS4wPbuXYWglLJ/jI9a3FKVqSOnPihY4EmaY5Db/Tw/NBEX/T2nW0oAarnAVDuuKWYV5+02XlfJJFkPDRTyldacfOfeqsC6x2lHUJEeuZegTuJNZjW4AXWv8lzknk60tFuq+mbcW5veDSIDAq7zPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751421969; c=relaxed/relaxed;
	bh=+o9xo3ux0g9p/58C8pQqVfWYisjOvGF7KUvBPEyDqm8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IMkHYuliYDZDz4nbW6/NmBiLf9KBQownBRmBUBYcN8JlUNp3b6pPXqsBzIRx/0OjplZeYY79bbVTLFMSqw7tdnPTBvJm9rywI49U2KxQ1+k0+axRWahpGTkyiQFWvYINyhDBpl29dkyBdmiOIV7ffQ8yNMfIazGJDRVh6ccTDdoSVW3s6lxtTmUBrOoCiEFsaFE7WbjtG7q2Yaa7FJcLsagKCBtQjDC2RJ7jtrv17KufpUe5WmNqsokuIanbIA6KnT/9R07aLqTNoFhfQXG1BV0iYsuoToM8NVaqG2zYRpRKLepGfMLcxybTICfSqueIWvo2g3iSfNSCWWT/90nZ6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=YfTowk+D; dkim-atps=neutral; spf=pass (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=202503 header.b=YfTowk+D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canb.auug.org.au (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=sfr@canb.auug.org.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bX3Cc0clsz2xCd;
	Wed,  2 Jul 2025 12:06:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1751421947;
	bh=+o9xo3ux0g9p/58C8pQqVfWYisjOvGF7KUvBPEyDqm8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YfTowk+DvnG5yPaTyjRTIUi75q2iuBhxAUtH0egkYGmQ/LyHVD2NL4fZ1TPplSZup
	 HT7HmowUyutxgpuJmKN1MAZZoY6mEgqJe/wN6XeiII6pmssSFUEq5zNP9gX3tupHOu
	 Nva/S4nUjQ+PhkzbjUBwCV3gIQ0cqJ7z1iK0SeqJSSc5sELJDLCGD46lHHjNpJwQ9j
	 vBA7w1M5S5CaQx8OtJika7HToUdMF5wYZdLofeU9iWc/bGzgLElnaly9NDrnNIPl7K
	 +Fmcb0dOJbQslxWRMhN11Kw+vSjOcEiS37hzUacKliCXe1I4KlEzziJgUcUgr0lvoC
	 VWUlx+r0Pr5DA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bX3CH5Y1Bz4wyV;
	Wed,  2 Jul 2025 12:05:47 +1000 (AEST)
Date: Wed, 2 Jul 2025 12:06:00 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-next@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: Add bmc/linux for-next to linux-next
Message-ID: <20250702120600.33f3d49d@canb.auug.org.au>
In-Reply-To: <8b035557ad025d31ab347349ebf9b91ff668498a.camel@codeconstruct.com.au>
References: <2ae27beb3fa9266e8f73cfa10d8299465d872183.camel@codeconstruct.com.au>
	<20250702114941.5bfe1e5a@canb.auug.org.au>
	<8b035557ad025d31ab347349ebf9b91ff668498a.camel@codeconstruct.com.au>
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
Content-Type: multipart/signed; boundary="Sig_/v2D4X2v2d3y9CSJdoymqTvQ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--Sig_/v2D4X2v2d3y9CSJdoymqTvQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Wed, 02 Jul 2025 11:28:06 +0930 Andrew Jeffery <andrew@codeconstruct.com=
.au> wrote:
>
> On Wed, 2025-07-02 at 11:49 +1000, Stephen Rothwell wrote:
> >=20
> > On Wed, 02 Jul 2025 11:01:54 +0930 Andrew Jeffery <andrew@codeconstruct=
.com.au> wrote: =20
> > >=20
> > > Could you add the following to linux-next?
> > >=20
> > > =C2=A0=C2=A0 Repo: https://git.kernel.org/pub/scm/linux/kernel/git/bm=
c/linux.git
> > > =C2=A0=C2=A0 Branch: for-next
> > >=20
> > > This aligns with the recent patch to MAINTAINERS for the ASPEED tree:
> > >=20
> > > https://lore.kernel.org/all/20250702-bmc-tree-update-v1-1-c270cd8af0a=
b@codeconstruct.com.au/ =20
> >=20
> > So, does this replace the aspeed tree
> > (git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git branch
> > for-next)?=C2=A0 Or sit along side it? =20
>=20
> It can replace joel/bmc.git, however, it should be fine to sit along-
> side until Joel confirms removal of his tree with you. I've been doing
> the BMC SoC patch wrangling recently, and he hasn't been updating his
> tree with the branches I put together until I poke him about it. In
> this case I'll just hassling him to update his tree, which should
> remove any opportunity for conflicts or the like.
>=20
> > Either way, who should be the contact(s) for this tree?
>=20
> Both myself and Joel.

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/v2D4X2v2d3y9CSJdoymqTvQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhklAgACgkQAVBC80lX
0GzIXggAh4jofNHSLz7BOgy43fcczmnnsLSdxlrK6LJLuJV/CzVT6zzstte7DFIN
ajfzeg2+5fQOJcY7STGmZCCUl3ylvCwlDtMAJgSpuMKoLsN50VhGmpCPqSXjPeLH
A4twqQ5MagEgSSLzMjfj+nZBDL4x1Xg68F5r35hUORxgJWXBoBdp6q+1+Thotes0
LmenhRYqwNlQR6N0V2LAbj26JJUWcQGYzglY1H6xKFNr8vaf8s5blOsfYjTCEz+5
iqSGc9EUl1k31+Nw0vVbid3A7Rux0Yxwsz1ISFmCgDy2I3+wUCt3sjI1OmvowNVk
DlRZLBTcCBXA9BryPdwHjkKEA3O0LA==
=VPNz
-----END PGP SIGNATURE-----

--Sig_/v2D4X2v2d3y9CSJdoymqTvQ--

