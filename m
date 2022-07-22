Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0186F57E6E7
	for <lists+openbmc@lfdr.de>; Fri, 22 Jul 2022 20:58:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LqJbs5n7nz3blS
	for <lists+openbmc@lfdr.de>; Sat, 23 Jul 2022 04:58:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZGN2F3os;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZGN2F3os;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LqJbR2rShz2xt3
	for <openbmc@lists.ozlabs.org>; Sat, 23 Jul 2022 04:57:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 32401B829C7;
	Fri, 22 Jul 2022 18:57:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08E4EC341C6;
	Fri, 22 Jul 2022 18:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658516253;
	bh=qlEQPdf/GEeiUyuZqjpiKhRwwr7dWbJkJKm74rG3gHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZGN2F3osr2Hq6PPOQhOQ1WeOpiCkN0aTbcI154Js7LbHdACxRictYupgPmRkj0YOm
	 KaxMujrBOXVITl+gkBHSpoEJ4Vi9BNIL0BDBiBc5SXX69HEKrVdTGbc/xUTLGnhECE
	 RyguhwKcwHJPR1y8pEastYamufBv956gW1ottf49KfeGF5IugfxDV5r3zOWh5+JqmP
	 JOqJdIpmfqvq0Q2r28sMpQFXcDt3F7ezx6NxJ7LnRmpNmVFKpJ6zMZy9SWOruNb5H4
	 ZRCCIytU+J9x80IHBCtrT5WpjHCV1U1qV9ZTYdzCKYEoPQJW+DvbvmqERDiGzuRYrO
	 e3MM8tTzWWemw==
Date: Fri, 22 Jul 2022 19:57:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 2/2] spi: npcm-pspi: Add NPCM845 peripheral SPI support
Message-ID: <YtrzF9BFJrXfxiz0@sirena.org.uk>
References: <20220722114136.251415-1-tmaimon77@gmail.com>
 <20220722114136.251415-3-tmaimon77@gmail.com>
 <afae04e0-76a3-1bcb-5b47-9944fa9ab2c0@linaro.org>
 <YtrvyyMGm64hFG5j@sirena.org.uk>
 <0c8688d5-b0c1-8cc1-ec27-292acbb38dfc@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UbxSBqEr8U0AN/GQ"
Content-Disposition: inline
In-Reply-To: <0c8688d5-b0c1-8cc1-ec27-292acbb38dfc@linaro.org>
X-Cookie: Yow!  I want my nose in lights!
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-spi@vger.kernel.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--UbxSBqEr8U0AN/GQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 22, 2022 at 08:47:24PM +0200, Krzysztof Kozlowski wrote:
> On 22/07/2022 20:43, Mark Brown wrote:

> > ...with a fallback list required by the bindings so the driver actually
> > binds.  Note that bindings are currently not in YAML format so there'd
> > be even less enforcement of that than normal, and as they're currently
> > written the bindings don't require fallback.

> Yes, the bindings document should be rephrased but we were living like
> that for few years. :)

The binding document as it stands only has one compatible, there's no
existing problem with it other than the YAML conversion.  If we're
adding something new that requires a fallback we should be explicit
about that rather than have something that's actively misleading where
previously things were clear.  I don't mind if we add the compatible to
the driver or document the requirement for the fallback but we should do
one of the two.

--UbxSBqEr8U0AN/GQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLa8xcACgkQJNaLcl1U
h9CC6Af+Kw0oDGAT+xBaRBeKTXmSgfg/pO7Y8Mf9MVM+HhbN19e3qM65lfnixOKg
fcMyys82+nUBbEDFf77vFrXDJzaPNjsNdDBfczogsFMkJDhNO0bPwMs4Op1T444k
Bp/OYMF3fxgsrparA9XaVn3J4g25TZeNq9z3YaJ4eXtmLFbUybaLFF8KaN3byzLm
0aAcUtXMB4v7jaa+x6GBNhMQ2NkLUUEEGltmV78/l6w/PTCvjwGH6EpB69mmWFDM
dHxqz/Ac6Y/TiiR3ZgaHdbJBjOfOydiyINeMHyeGE5P6Xn5KCVvl41kIaq3g6rG7
sGK66BmAjWTb1mDHmmwM7wa+WbjHLQ==
=yVCU
-----END PGP SIGNATURE-----

--UbxSBqEr8U0AN/GQ--
