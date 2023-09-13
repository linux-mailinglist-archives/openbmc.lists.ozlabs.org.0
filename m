Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0289179E2F3
	for <lists+openbmc@lfdr.de>; Wed, 13 Sep 2023 11:06:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RgKAHHOW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlvh366B9z3cC2
	for <lists+openbmc@lfdr.de>; Wed, 13 Sep 2023 19:06:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RgKAHHOW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=wsa@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlvgP1JGZz30NP;
	Wed, 13 Sep 2023 19:05:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1C29BCE20E0;
	Wed, 13 Sep 2023 09:05:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B174DC433C7;
	Wed, 13 Sep 2023 09:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694595929;
	bh=6FecySnQuRhCzbTetrFBUb76t576bbB7ARX9N22lPOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RgKAHHOWf4RKi3bmN34LKt0UiUCGxSPXtPevmz8Ivwp28OMwfDvS9BYrO+Jt9U0/U
	 OXiTOFzzTnm3wngTZVcsN+LwXUeBEL8kYg5cAsDK1RO23Ph/sdujxOfQyGpT3eHMuU
	 4EEumlI2a4RykpayWdFKUXeGEE0z6EUKD3XqVx3juQDF/zhTaqNareNmcQAn4l5O11
	 c2FIw3A/uT1OQDQ5secn0ICnX7AiVxim9olwjYDHq0jbThvr8XI5EHexMnAzyjz7x+
	 xqWVGCq7BwqVde5A/IHj0wi7M36Qs05ZddHubkLuBMORJl3oiBF2X0yOUlDGrn2dmd
	 Qqw9sWC+3pfEg==
Date: Wed, 13 Sep 2023 11:05:25 +0200
From: Wolfram Sang <wsa@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH v3] i2c: aspeed: Reset the i2c controller when timeout
 occurs
Message-ID: <ZQF7VeckiRciWMRI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Tommy Huang <tommy_huang@aspeedtech.com>, brendan.higgins@linux.dev,
	andi.shyti@kernel.org, p.zabel@pengutronix.de,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	benh@kernel.crashing.org, joel@jms.id.au, andrew@aj.id.au,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
	jae.hyun.yoo@linux.intel.com, stable@vger.kernel.org
References: <20230906004910.4157305-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dUIDfYP66VOSGajJ"
Content-Disposition: inline
In-Reply-To: <20230906004910.4157305-1-tommy_huang@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, jae.hyun.yoo@linux.intel.com, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, brendan.higgins@linux.dev, linux-i2c@vger.kernel.org, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--dUIDfYP66VOSGajJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 06, 2023 at 08:49:10AM +0800, Tommy Huang wrote:
> Reset the i2c controller when an i2c transfer timeout occurs.
> The remaining interrupts and device should be reset to avoid
> unpredictable controller behavior.
>=20
> Fixes: 2e57b7cebb98 ("i2c: aspeed: Add multi-master use case support")
> Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.1+
> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Applied to for-current, thanks!


--dUIDfYP66VOSGajJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmUBe1UACgkQFA3kzBSg
KbagKhAAlPB23FAYIEs98C82AzXuSnnGgVlMDEeeo2Usaq4u44eE1q9+cIfz4tGz
a2ER6xUsGLuwY7D9Rpopcrw0d+awaUvoN2uJuquBhoVww3K7FkYtPnJ3XuubA8jp
ljcdyrMEvQxwTWz4FFTYxFQNQUIyk1j5idSdrwpqc5Qhg2Ftz3Ta+y66uEAIJA+u
nBfvsy93Cq1/TKDHeG3CS6LGFWE2YVD9XQ7NwXKSnCRjLxssWUYUuxTrJSAI5NwY
Z5IpvbmxyOu30hOJdibuTSP8w0LhbQCZbB7Sx2pYTKhKln5NfUDtZRBxOO7obTMO
7NxS2AzU3otP20ydbtxdJ81S1N7VJ84CAIVHAzUs+65Puq1+vDS/IgTdtmNaG7Ak
vE+rIt0PpRjExnlh5Bssd4JVg1WcRdGlpknHLqoaZ1pGMcbSuvyU8VcZSCi9LfKb
d64zGCbmssdTbgEPRPBKqlf1KL4ob0rjnReMIjbIZ+D1iTll9MnOsPSaQlV3B1rC
4aoWqtnXr23WX73FK/Pv40CT2/QVFX4Bityn+Be8BqD97R+M2yoFBS/d95hVf2is
RYf+fLTqCyh4TqsouJJnL5PRDMuxdoHA5DK9RCIQ09fvPuWcGkRxBbhucmXM4JCl
OiS1uN/a+fDDFj84vMxXLgC5QxKRyGpXuBZFrcCUdNE+kV0iarw=
=OD/J
-----END PGP SIGNATURE-----

--dUIDfYP66VOSGajJ--
