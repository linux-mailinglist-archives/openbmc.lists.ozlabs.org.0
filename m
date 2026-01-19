Return-Path: <openbmc+bounces-1237-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C705D3AA77
	for <lists+openbmc@lfdr.de>; Mon, 19 Jan 2026 14:37:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvs2P4kzJz3bhq;
	Tue, 20 Jan 2026 00:37:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768829837;
	cv=none; b=A4c5mlpqR3Y97gzDl2IS/upENo01d+wKpPNrVvATCzp6w1X7pI8HKAkckQA498WyzdaCqxCI3ZHGxbdIxWslDrm6FR4PZbn0UoFTZleGaoqiBK+ulaGHhvvNmpi1a+mVmSp39H/nosWDPXfmqbsCWSwcWftZYdnicsNcMpfrG6GbeaMOcoMNWEN87SkGh7BxIRtaWu0oFSHY8HfJOnymRjS4GxVMR4C11zRBBXtlpRGlxck30okwE473WMTkkNYUf120c9QTX7C0WhIc2uOvb9xrboHTP+HLfjbooX4FzT7RsH3ylN92RiWQ07n4mlZYqxDPY4g+IIUGNFwHxM5p+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768829837; c=relaxed/relaxed;
	bh=lJb3R19nkiYopQmNx5R8476OrkmBP08hMcFQKv47fKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E07VvsF7uSsUPP+Wpx7B7zxrliVg7zt0xet8F2szTtCZe+EoYrXle50ROZ0QeAWhJl8wItka+AlPhW1cwSKIFdGxkSbZEz50TfCGRdurMABz0FkbVBr1RFiRqBDumxLPeMXTcPTJBoLDku65dWPdNUPQqqu/BZB3cAZ2Fi8801uf1slj/ieNu4cEK90sGWbealBTcj5uJaaJI4LkRCYiWt2BHX/U4GYRXtfVwx08TRu1H9djlkW9sjeNWQICr/FTngpCExOv//CkM8HKEwKAAUL5hz+wAkJ7bn+7S5jWbnMChjVfJwhIb5Hghzj881MLDSst93FPTaNBiz6ICT4JCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A0Yy+O9m; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A0Yy+O9m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvs2N64tKz3bfY;
	Tue, 20 Jan 2026 00:37:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 677F543C4C;
	Mon, 19 Jan 2026 13:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E63C116C6;
	Mon, 19 Jan 2026 13:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768829833;
	bh=NQhlNmakp9XzCvOKm+K/DiXWdOuvD8Ykc7UWybaRfrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0Yy+O9m3bpEWejSb8AZVey2Vkiwx0Eax1Yq7MFX+zQfpIW9vXJjBQavwlH/TErRH
	 qW66JhnYseJiJfY2MKbXCI54CthEcjVWyI6bb/ms2w53GHTvZLz6J3jazd5/uSl2Ps
	 FTn7n87f/C1RBrwV1i6bt5ETR8tzAWb0QlnyYbPPk0g6AQe4B1dYCGNXRpxzsRjpvG
	 O/O1cX7wCx42r0asHpVNvtwg9Az048pE37WW7oOey/+uBFiI33P8bnOHzVHf9i0y12
	 XwB/K0dlvP1LZpCmhHgmmT6v5qbWg3jaahCpW3/N9FB90ik68JPzCM7hNszYr4JJ4q
	 hXVNgNbeGbjXQ==
Date: Mon, 19 Jan 2026 13:37:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, clg@kaod.org,
	boris.brezillon@bootlin.com, joel@jms.id.au,
	andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 2/2] spi: aspeed: Add support for non-spi-mem devices
Message-ID: <e4f133db-928e-49ae-9ee8-99e119d14708@sirena.org.uk>
References: <20260117134216.595436-1-chin-ting_kuo@aspeedtech.com>
 <20260117134216.595436-3-chin-ting_kuo@aspeedtech.com>
 <3153512e-8325-4d0b-a869-a2a5062abefd@molgen.mpg.de>
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
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gk42q0GFzUogNGdb"
Content-Disposition: inline
In-Reply-To: <3153512e-8325-4d0b-a869-a2a5062abefd@molgen.mpg.de>
X-Cookie: Does not include installation.
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--gk42q0GFzUogNGdb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 12:48:37AM +0100, Paul Menzel wrote:
> Am 17.01.26 um 14:42 schrieb Chin-Ting Kuo:
> > The ASPEED FMC/SPI controller may be shared by spi-mem devices and
> > other SPI peripherals that do not use the spi-mem framework.
> >=20
> > The driver currently assumes spi-mem semantics for all devices,
> > while the controller also supports direct user mode access commonly
> > used by non-spi-mem devices. This mismatch can result in incorrect
> > behavior when different types of devices share the same controller.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--gk42q0GFzUogNGdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluM4MACgkQJNaLcl1U
h9AOpAf+KY6H92cdg3gOoQqgQu7crH6a+7XIW9D8d4DUyutJ3AVxvUSJHgxNAl3c
V4ilv0msLOJJ6HpX/r5PQwBxtXyJ8B+4awixyqucFxMc5rOTbOhTUfSQs5CEk0Ye
ZA0i4zbi0ugsYRl329wp62zOsYNbdZu0zDZmaAwIGUnZhuyarMsk3xfSkg8i7oor
/uQhG8Z+bw1Y9rW5+WBFPLHsEiOhsf/o7pIIKUtTkaJkrE8hvfvszgIzObDQwKPM
EXIlzMbd2tlKgIHfwIRcRK+NzbpvC/BIHEBZmiYPR/Ura1meOTlsrD9UR0rpd5Gg
RrZG1vxcsH4KwCDJfTCUxBBlMfcFlg==
=Arfl
-----END PGP SIGNATURE-----

--gk42q0GFzUogNGdb--

