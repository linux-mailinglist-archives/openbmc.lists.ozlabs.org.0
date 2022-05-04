Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B59F751A018
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 14:57:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtcKm59cMz3bdJ
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 22:57:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j4hq9cpx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j4hq9cpx; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtcK05DS1z3bpT
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2022 22:56:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC608618B4;
 Wed,  4 May 2022 12:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D48C385AF;
 Wed,  4 May 2022 12:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651668978;
 bh=gdxj5YVJJXTcWteagPD81sMBdc9Aq1VtB4tSVNICDTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j4hq9cpxhq7G29FUlZFS8TbG6vfR1K8u5AaC8crxTXMBO8geP2iXkvV5HrxQhV7C2
 OYV9YCzCTcqQOzl7h21grCFKxuXr81cupttv+s7iGkul7dU+ttNGGKFCzgPUFmyhgM
 +bPU0LKLn51pn4zYmtEdLgXViWNUnbBPMkKLyv1rWojkcr5RB8qSizIzF1yzkPmeVY
 JNr3D1amGpASDewu/l9N74CqKXGtuB4AyKI5BX3joIAqmkLDDY02po6BxuqSFqDkWn
 JQq5VEkE2gBeQzUM0VErYAHoufbIIR/8PLdurA9AugZmb6avbELzkkWOQs7wgfqqAN
 O2AETqevLiLdQ==
Date: Wed, 4 May 2022 13:56:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 0/6] regulator: core: Add support for external outputs
Message-ID: <YnJ37QysSaa+gAps@sirena.org.uk>
References: <20220504065041.6718-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w/VS4GgcCdfjbUlx"
Content-Disposition: inline
In-Reply-To: <20220504065041.6718-1-zev@bewilderbeest.net>
X-Cookie: Your present plans will be successful.
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 openbmc@lists.ozlabs.org, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--w/VS4GgcCdfjbUlx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2022 at 11:50:35PM -0700, Zev Weiss wrote:

> The DT bindings changes (patches 1 and 2) consist of a boolean
> regulator property to mark it as supplying an external output, and a
> reg-external-output binding to act as a downstream device representing
> that output.  The redundancy between the two maybe isn't entirely
> ideal, but it was the cleanest approach I've been able to come up with
> so far in terms of working with the regulator subsystem; I'm certainly
> open to suggestions for better ways of going about this.

Nothing in the series articulates what the purpose of the redundancy is
- your description of this is a consumer, why would the regulator itself
care what's connected to it?

--w/VS4GgcCdfjbUlx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJyd+wACgkQJNaLcl1U
h9BkfQf8C9n7pk9sOlU770h8zAnMrgTZX6YUlmWUCZ20GO3OG+Y9Ufo6DjYIFFMP
/23xU738nEL1GCU0/vktgE+r09jGXVQNtAXZRILLt2CxulR7Pe2ojiCmxHAOc5Dv
bBwKwPk+N5L+9dvMQeTQDuLjfTrdbabEE6yEEfv5xu9cqjG2phSuqjvaIS6GA2Nj
g9AP/t2UHV34bc2xeGRhLdJGcsu02FVjXxP/DPnofadK+p6YwiHBOd6MCxMrpoty
iKwdy6ruqlM4NURMVpi89+pcwimfcH7M/XiXd6YnV53HAwx6Fsbd7zlk9QyRKxx4
BOFFM9X5TWf7//qC2U+sIqn35dco7w==
=dy9O
-----END PGP SIGNATURE-----

--w/VS4GgcCdfjbUlx--
