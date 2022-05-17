Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39847529942
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 08:04:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2QZB1DgPz3brp
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 16:04:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QhDkSXzt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QhDkSXzt; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2QYj4MGNz3bpf
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 16:04:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55D0DB81678;
 Tue, 17 May 2022 06:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F0BC385B8;
 Tue, 17 May 2022 06:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652767460;
 bh=FgE6LrLuJ3LeyvdaaxAW7dFJk8FTlG8i7HpgFaazl5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QhDkSXztayy6bs5gf3G4/xyEiLlU5CZzhRwEXzrX24pHhEkIdDn06LO5VIwTuozP+
 q8yhj+V/mKS36NtDJr8a0+LeE58nFyHFlObbQsJ3wc23P6d+6B2y9vlWNpGw8lxiHB
 VvUPpV8B8ZhN5dAy/HYlUFva46wrAWZvrRscvw1eF/e9VbyxWoJPH82JuLi/47tUWv
 PgLUKQWTyBLzHo4emDomwHq+N0jduMwBe+oANXk2RVfPquL5uSVWm6HT/vlaYIpi5V
 DTg+Np+LPBPDAf0uRxS42t7LUX82JBVG3xaPeVz77dh2vznyXH1Mlg5QfsaVTfyL6N
 iVIAK65zYkecw==
Date: Tue, 17 May 2022 08:04:13 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v4 2/9] i2c: npcm: Change the way of getting GCR regmap
Message-ID: <YoM63XoYZbFGJ8s7@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
 Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,
 andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
 semen.protsenko@linaro.org, sven@svenpeter.dev, jsd@semihalf.com,
 lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de,
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
 kfting@nuvoton.com, openbmc@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@canonical.com,
 jie.deng@intel.com
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-3-warp5tw@gmail.com> <YoKqdfLSeJ69WFhi@kunai>
 <CACD3sJa3koHGsC3PBbfZuBhTfVHhjF=3g3YysxZ0+TvQ1qwfyA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ZD0WxnqJMfI4UMfN"
Content-Disposition: inline
In-Reply-To: <CACD3sJa3koHGsC3PBbfZuBhTfVHhjF=3g3YysxZ0+TvQ1qwfyA@mail.gmail.com>
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 jsd@semihalf.com, krzysztof.kozlowski+dt@linaro.org, benjaminfair@google.com,
 krzysztof.kozlowski@canonical.com, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com,
 KWLIU@nuvoton.com, arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org,
 Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, linux-kernel@vger.kernel.org, kfting@nuvoton.com,
 tali.perry@nuvoton.com, jarkko.nikula@linux.intel.com, olof@lixom.net,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ZD0WxnqJMfI4UMfN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> After reviewing these two links, we decided to keep only the author's
> SoB for each commit.
>=20
> https://lore.kernel.org/lkml/YiCZlhJoXPLpQ6%2FD@smile.fi.intel.com/
> https://lore.kernel.org/lkml/YiCb7LNY9tmMCZx7@smile.fi.intel.com/

When Andy said "chain is wrong", he meant the order. You must add your
SoB, otherwise I can't take the patches. But yours should be last. The
SoBs need to be in the order people worked on it.

Does that make sense to you?


--ZD0WxnqJMfI4UMfN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKDOtkACgkQFA3kzBSg
Kba2dQ/8DA/NMvr5xjTQrg+KZeVKu1FP8k7R6RkznvixaWJUaDTuRTuPXcFExLAu
urIUfpDjZiVWqRQCqBKp2AGAh7yFnZU/V0GAEzhMI6OReamobsqq/TUPFdQ+TAgr
ronrfnzaCMmjEFNzbZyhrcusCbtL0QczMxa1RIkfRzZSyYscuxVm8Nj8Ypy09r8k
wd3UU+SHyow27742jNfoSYEVjC2J9r++Qb5ms4bjrW3JvsrTIHvP0FedPDBbJVrt
fnXeEgOHkX6PYdopvaEVQb8/Dz1D04lgBtkZoqScHC3JHKskbaeNPoWkafRL9oKI
AHuhRw1zebM82X+UpEfGzZDQprSikW1iKA780VwbI7xiR3ZTWTYPpRzqKayDWT5m
X8cFQqWiaVXMOK2va2IdQT4hh8A1Y4kRlcV2w7u2Uk+K3qefl7PlN5xK2ysb+9Ij
srbNuXUjeI0CXDg4CT20eHLiom5uhRQyd0ih8HZtkW+uddWXd/zaTfHxdFbXYUcj
d/dpYAToxGjFPvyt9bbx8uGTs/NoEiNvTXyvgbCKR3wv9PhfQ0Duq7rPfH1BY1S0
uNxh4nXMZeviqgx1Qu1ouL+5AJlGDp8hjW+58RzaIhvreLNn1GREPJ8X/s5vf+gb
MG2K2pIS45sucLXqB5t+vWdYQDQigOx1IOt/x7YtUo2+IRqccVI=
=71Iy
-----END PGP SIGNATURE-----

--ZD0WxnqJMfI4UMfN--
