Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EC76100C8
	for <lists+openbmc@lfdr.de>; Thu, 27 Oct 2022 20:55:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MyvyD6WzHz3cF9
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 05:55:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gG3+6gQ9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gG3+6gQ9;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Myvxc3fX4z3c2h
	for <openbmc@lists.ozlabs.org>; Fri, 28 Oct 2022 05:55:00 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3278062461;
	Thu, 27 Oct 2022 18:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B693C433C1;
	Thu, 27 Oct 2022 18:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666896892;
	bh=Kun1EPlhNAljLOOaLOtA+3eyTsZ+9G8Vw30cBcFPzrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gG3+6gQ96c5YkWOO1XAfUf+tlK5NY4nF4uTtmxhAOG9iUO7MH9NjYl9uV+zXmZ6Bm
	 kFj0j3YREptD0FDWmPJ24tgUVBO3t0ApQhzUwcvP9b2hiUTQqC9d47bFYNT1vs8hwQ
	 i/c6SqDjPDKCrAbV6p1kiVsv2/u5agF8eijGbDwULjDnDHxoF0sbAcvBzcfkCtwfnd
	 TSL+BgYXXEBX+dHAAH2unY4GjcdQ6sKFPNi8ZompKDMZwhl0/GacW8Sj5E+kYczgjr
	 cpztnNKpPTfvQHkzReT7E4YAqXTDz3MCDfL0W9XJtJO6W5s9ZgKbivsWxULuzcx8hK
	 kgFA8999iDY4Q==
Date: Thu, 27 Oct 2022 19:54:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 2/3] dt-bindings: regulator: Add regulator-output binding
Message-ID: <Y1rT96QzwIn5pIVn@sirena.org.uk>
References: <20220925220319.12572-1-zev@bewilderbeest.net>
 <20220925220319.12572-3-zev@bewilderbeest.net>
 <20220929210714.GA2684335-robh@kernel.org>
 <YzYNt+IQRomycRLs@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M3zmNXbrrfzH3Cim"
Content-Disposition: inline
In-Reply-To: <YzYNt+IQRomycRLs@hatter.bewilderbeest.net>
X-Cookie: Forgive and forget.
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
Cc: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Naresh Solanki <naresh.solanki@9elements.com>, devicetree@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--M3zmNXbrrfzH3Cim
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 29, 2022 at 02:27:19PM -0700, Zev Weiss wrote:
> On Thu, Sep 29, 2022 at 02:07:14PM PDT, Rob Herring wrote:

> never as any sort of default/automatic action.  The two obvious things to
> guard against there seem to be automatic enablement during initialization
> and automatic disablement on de-init (shutdown, unbind, etc.).  The former I
> think can be avoided by simply not setting regulator-boot-on, so I added
> this as a corresponding property to avoid the latter.

> I'm definitely open to suggestions for a better approach though.

regulator-boot-on mainly exists for handover of state from the
bootloader where we can't read back the state of the hardware rather
than as a control for boot purposes.

--M3zmNXbrrfzH3Cim
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNa0/YACgkQJNaLcl1U
h9B8Rgf8Du4thvptLuiv5L6LjqHMUAYet63k3rRYwGIvleliwoEFk8gYQZEKdFGB
UEvvGOWF+AY0gTKrHEtdHgYUOi2QTwN2quCetFLxTajIVYtluNKZ76hi+9Zt7xaN
JlSpqehmuCeCHsxzSjMfCgDTPJL7jnVFORAk7azYpQt+22dzgGwimK/QUq0BDwEX
Sz7moED/aqfH5MiDo9tIS6OoePaXDqlUOBAgoQOe8pDwNN/ZZsvJ8H5AlDMBV7tL
KbCtshLetmnDzd7a/pbi6zOkagoRhqHkP1TQAdxZXdDN/RThDsMXZ40IK7YEKbLy
zar4ki4tO6ZqSMJ31ztcMXVgYzaQmg==
=S//I
-----END PGP SIGNATURE-----

--M3zmNXbrrfzH3Cim--
