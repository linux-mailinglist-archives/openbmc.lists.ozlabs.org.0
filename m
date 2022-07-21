Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C695457CA8D
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 14:20:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpWq34WLkz3cBw
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 22:19:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tWtei2IC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tWtei2IC;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpWpc4ZpGz3bf9
	for <openbmc@lists.ozlabs.org>; Thu, 21 Jul 2022 22:19:36 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A230BB82296;
	Thu, 21 Jul 2022 12:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61BA7C3411E;
	Thu, 21 Jul 2022 12:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658405970;
	bh=90w2BUPeykw3L6eLJY+/iA8CSo+mOdpNtZFfyxQV4f0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tWtei2IC7LLKMGuWx7OGmZgtYIVw4sviob/MPlLdZgzbvwsFiP/8QcIl4G3V+Jvho
	 EMkotHCrFkkBqURuWz6tyy4e0rBs0ijIZBiOy8NOcA5fZk0JYz28r2x1Y/qTJs8dFi
	 48859ytlpZ9sB6o4XpUx8xz42gNEGucfsNaeKrenBeK0gckaR9rJ4SC8jN2B/BHIsp
	 dvdcJzDw70LRng0iclAuYiZiVmOXJz0hG9jlFrmhJ89tzmsojekCLxUayku0d+EkVp
	 TBUnYrXukoA1iQ2z0YnXsXC/B6KVtUgOtbTL/zQr/bc7now+6sRMymqX1AjdcSlqab
	 RM2EviGUa5vlw==
Date: Thu, 21 Jul 2022 13:19:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v1 0/2] spi: npcm-pspi: add Arbel NPCM8XX and full duplex
 support
Message-ID: <YtlES7MX6nJr8l+L@sirena.org.uk>
References: <20220721101556.118568-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O7bov1l8TjWxvFne"
Content-Disposition: inline
In-Reply-To: <20220721101556.118568-1-tmaimon77@gmail.com>
X-Cookie: Exercise caution in your daily affairs.
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
Cc: devicetree@vger.kernel.org, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--O7bov1l8TjWxvFne
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 21, 2022 at 01:15:54PM +0300, Tomer Maimon wrote:

> Tomer Maimon (2):
>   spi: npcm-pspi: add full duplex support
>   dt-binding: spi: npcm-pspi: Add npcm845 compatible

It is not obvious why these are a series, they appear to be entirely
orthogonal.  If there's no relationship between patches it's generally
better to send them separately, that way problems with one patch won't
hold up unrelated patches and reviewers aren't left wondering about why
things are grouped.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--O7bov1l8TjWxvFne
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLZREsACgkQJNaLcl1U
h9DmJQf+M5sCikLx8XCc5AhzopEJBxC42hfe5IBR6mlpIWp/dv3JYI8Q+8rvNl/F
7lXeQgGxQHJoFGE0RihkSSZYdEFw6Rb8OXhyodqQbyI8iukuiSTL8NzA0JbpzCTu
tZm+JRU3zWu39jyFdRGST22mgJHxfrSWxEdAm0T+0AOYY4GNAn4cquIHVH9wwU/g
bPqOsc+nDa0B0aZrDrdrndq2iBFKuHkKt+Ig8vGmsn/U1eyIFK6Rr+SXEqS6zQnS
mEdWhyIyEWkz9+61h+bzkTvtmlaLgIAoWjA+Kc/3droutXOp9BK9inOEcgA0u1Av
P3IrCNU8vqB0vHqWtrNU+S3lXuOolA==
=wHf8
-----END PGP SIGNATURE-----

--O7bov1l8TjWxvFne--
