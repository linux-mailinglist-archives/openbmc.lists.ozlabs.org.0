Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5F2543D40
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 22:04:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJJ9L5kBCz3btt
	for <lists+openbmc@lfdr.de>; Thu,  9 Jun 2022 06:04:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OMH2DLW5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OMH2DLW5;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJJ8G0ndCz3bxk
	for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2022 06:03:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2A2E1B82AC7;
	Wed,  8 Jun 2022 20:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EA1DC34116;
	Wed,  8 Jun 2022 20:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654718632;
	bh=wQ4rfPIpVagVQ3QT8pEsLwCxUHgmosnjPiIiTGUJX/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMH2DLW58onHtg6XT4XI6AVhrm9/HKYtuzy9jVNgUgXc/hJa0TRxcEBesmDeE0toh
	 RmGCrxE4o2aFz8LhsIHXXCBVT3bVJSk4juEinfMdUDcvjaEE6A2PPPlJsHTTj8x7Ez
	 GE330D5XzW24g0bRl4ZcuqXXARDIOzXxa9MZ4d5jg1+c3zoB4RP2CNMYwCJEhpRVKe
	 RrKzzBzUjszVxVJpAHqI6TbnkhEa+djDreE0lml3SSuHk2eBNNQ2r59+wgCAMwtE8t
	 179pbrkTbzMr9KzCmQKOl2ZcfKikQfREcAcSOnFyXzYVbECi0VLhpNQ4tB5Fp6XzLV
	 1uoN+zszgrrWA==
Date: Wed, 8 Jun 2022 22:03:49 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v6 4/5] i2c: npcm: Support NPCM845
Message-ID: <YqEApWattWwRIS2H@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com,
	tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
	yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andriy.shevchenko@linux.intel.com, jarkko.nikula@linux.intel.com,
	semen.protsenko@linaro.org, jie.deng@intel.com, jsd@semihalf.com,
	sven@svenpeter.dev, lukas.bulwahn@gmail.com, olof@lixom.net,
	arnd@arndb.de, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com,
	tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
	kfting@nuvoton.com, openbmc@lists.ozlabs.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20220525032341.3182-1-warp5tw@gmail.com>
 <20220525032341.3182-5-warp5tw@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kPJC/WFnuB86hUei"
Content-Disposition: inline
In-Reply-To: <20220525032341.3182-5-warp5tw@gmail.com>
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com, jsd@semihalf.com, krzysztof.kozlowski+dt@linaro.org, benjaminfair@google.com, openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com, venture@google.com, linux-kernel@vger.kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, jarkko.nikula@linux.intel.com, olof@lixom.net, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--kPJC/WFnuB86hUei
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 25, 2022 at 11:23:40AM +0800, Tyrone Ting wrote:
> From: Tyrone Ting <kfting@nuvoton.com>
>=20
> Add NPCM8XX I2C support.
> The NPCM8XX uses a similar i2c module as NPCM7XX.
> The internal HW FIFO is larger in NPCM8XX.
>=20
> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> Acked-by: Tomer Maimon <tmaimon77@gmail.com>

Applied to for-next, thanks!


--kPJC/WFnuB86hUei
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmKhAKUACgkQFA3kzBSg
KbYQ9w//cBr2k5EfU2chzotArllPjkfze2BvQOoDT/QrNM4SmzFk+6/12/IZq0hA
ix38ggW1Qaa4HX14GrqqEwHkgI7FRbt8ISrpYOwA6zTZCf8rUAUcmBBM7YT4Ccqm
HsMVgoJfeWKusIDOFJ44hIcFDc4sN4qIUmCXNk/u6+cIX95TePt1lcx7E2fZo+Bg
YHFxm759oUTxtfrUYJNMM/F7lP2Zl8qzTHshBoeHwwsGA7o+5h8k8+Kf7gc4UnGf
m+BOdy8uHEjF0L53nlsj0Acg0eAKUryGwUMYjdZssxmcyR/tgSJrmn5AEG8/YvoD
OgO53WoPVyVkAa/jWHaPdGT0q8NrK418g4T3dTjWBcq/0fBMe3bDMVzNq0Wohoe1
sws46hWbBGRLMEAK/Y5tktwqUpvUrUG1mTZZFpEQBJRLuhuTtS3JIljqfgFfwto5
oeCRs/toZkEjmMNsiAUdNJui999XzwWvwBdEx+DMlkvUmbIBmz5CmyE9qszuVKQa
pgmJ+ZhcWI2S+dbuoYWapE3voz+uE+6Htq1zH3F8X3hWJ1a1WwTCW6Cvah6CmDVy
W8WKWdWyMgY32ii8IUC3PqBs4FJj1mgs9ee1cSKaVejh/WH1/qkrfts++nSefiML
zVZht9FVqq0Oi0rVgN9pZoJACAc9LDuxCf36U9N9mrRJ27OPt1A=
=FUS2
-----END PGP SIGNATURE-----

--kPJC/WFnuB86hUei--
