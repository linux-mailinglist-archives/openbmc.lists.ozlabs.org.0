Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2196638AF7
	for <lists+openbmc@lfdr.de>; Fri, 25 Nov 2022 14:14:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJb0t59gPz3f3Q
	for <lists+openbmc@lfdr.de>; Sat, 26 Nov 2022 00:14:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dziZ9fUn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dziZ9fUn;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJb0L1y5mz3dvP
	for <openbmc@lists.ozlabs.org>; Sat, 26 Nov 2022 00:13:38 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B111623F2;
	Fri, 25 Nov 2022 13:13:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A39F2C433D6;
	Fri, 25 Nov 2022 13:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669382015;
	bh=15v5vT1o94q1zWPbBatM3U012KtqfwSE2fCg22cs3lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dziZ9fUnIsrbJdHkuW6OKycY42EJf894BVXiqiZ7HlZX9Lm63LPzIcEXHVionFXbO
	 YGcn9ECkfFAs2j8iuO1lG3uTx4v+4Y4oE162wu9eVjDrybkGQnuz5u7HhKVzWegTGe
	 STMjsc0Puj5nreItrIkfJmSYqddjt1jsVRzPRulerDxc1yYVD31fsxGQ/Z7BNLOm4d
	 n8H660lI0TpE5svxCjNE4Lm98R5gNaSA8QmZWsALnHtWbOwHWknoolRKXJUF1LdRNf
	 X4KWdQ8FTwJ39DIaIisKgHfABvezQWtiivLL3qY7L4jjDE+TM/fYhwbumRS8WMhNoj
	 fDrqY7q0HjiSQ==
Date: Fri, 25 Nov 2022 13:13:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 1/3] dt-bindings: spi: Add Nuvoton WPCM450 Flash
 Interface Unit (FIU)
Message-ID: <Y4C/eSGckOyBY4XG@sirena.org.uk>
References: <20221124191400.287918-1-j.neuschaefer@gmx.net>
 <20221124191400.287918-2-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uh2Odge++OPiW7fu"
Content-Disposition: inline
In-Reply-To: <20221124191400.287918-2-j.neuschaefer@gmx.net>
X-Cookie: Time and tide wait for no man.
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--uh2Odge++OPiW7fu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2022 at 08:13:58PM +0100, Jonathan Neusch=E4fer wrote:
> The Flash Interface Unit (FIU) is the SPI flash controller in the
> Nuvoton WPCM450 BMC SoC. It supports four chip selects, and direct
> (memory-mapped) access to 16 MiB per chip. Larger flash chips can be
> accessed by software-defined SPI transfers.

You didn't send me the cover letter for this series.  As documented in
submitting-patches.rst please send things to the maintainers for the
code you would like to change.  The normal kernel workflow is that
people apply patches from their inboxes, if they aren't copied they are
likely to not see the patch at all and it is much more difficult to
apply patches.

--uh2Odge++OPiW7fu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOAv3kACgkQJNaLcl1U
h9D3+Af/dr8oudCjG6HCjJCSX0ET5Kh0ns3cy5l53sdp6xXk36FJlYuSz672ESY9
lVt66VHn0m5ydQ5bU+xqrehDBNsb2qsw5pNO3Hp2fWanfPg+MkL/ZPEoe8bpZpq6
BWlL7kKeKy69EIXjIPvASt/gkP3oibODEhZdRpDkebwzmMGQN0FZyiBPM5L/ucaa
NEo/WmS2kXvOotOQnqHLX3H8y1XDrtc1PlbJ/maO/BwyhA83r4fRdaKGfEXTjnoa
28PXELKSk6WWrsTfRd9G4cRsCpfngne372dhyM/3kxJWSNk0VqG20aBdF9Db6MmT
jm7WKBNHXQA83af1jzClA6PbllFszA==
=++xd
-----END PGP SIGNATURE-----

--uh2Odge++OPiW7fu--
