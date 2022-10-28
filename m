Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B5C61165D
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 17:52:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzRrc5fKdz3cHZ
	for <lists+openbmc@lfdr.de>; Sat, 29 Oct 2022 02:52:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j8UEdhNz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j8UEdhNz;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzRr436Cfz3cFw
	for <openbmc@lists.ozlabs.org>; Sat, 29 Oct 2022 02:52:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A2AF06292A;
	Fri, 28 Oct 2022 15:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D3CC433D6;
	Fri, 28 Oct 2022 15:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666972320;
	bh=YuD9edLwCKn8/1OHDoLVRahTHEgWClfCgIAXeXZRoSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j8UEdhNzF8n6KQcXq89uYZwAHbJEAUUJhEpnNKFzYI8s10zxSitlX9EOVW7Cq2hy0
	 CXLbwnBJTZ+VhmkI2CnYNkKdvgYC81sTjuzanUbbAe0i7+iNR55FDKaH32zAWCRRfW
	 gl7BdQdSH/4n+/HelSLGU7DRW5kYvA2OFPUgubJYqCbgRlDpwxLQXaRJNgyEHPakLc
	 wZ7l9uS2h9D+cBtoyvzjm17Llg24l0pjFxpVEJTssTbSOm0uGHN1a2BNHjB4Xj9ZkO
	 VizvUDXmZ39UiAXEo12EwnLAeOeYxNvALbcoCPhHAYDa0L15TYix0rNAflH6WHFgDf
	 p7mTcP8UEHdfQ==
Date: Fri, 28 Oct 2022 16:51:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH 2/3] dt-bindings: regulator: Add regulator-output bindingg
Message-ID: <Y1v6migO2PNV4ksW@sirena.org.uk>
References: <20220925220319.12572-1-zev@bewilderbeest.net>
 <20220925220319.12572-3-zev@bewilderbeest.net>
 <20220929210714.GA2684335-robh@kernel.org>
 <YzYNt+IQRomycRLs@hatter.bewilderbeest.net>
 <Y1rRCq9Kdd2zPPkw@hatter.bewilderbeest.net>
 <ee37b5a1-5afc-71b3-f777-add295d9ce17@linaro.org>
 <Y1tWpikPogEtV0+x@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7NOnigghnnBn635q"
Content-Disposition: inline
In-Reply-To: <Y1tWpikPogEtV0+x@hatter.bewilderbeest.net>
X-Cookie: Life -- Love It or Leave It.
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Naresh Solanki <naresh.solanki@9elements.com>, Patrick Rudolph <patrick.rudolph@9elements.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--7NOnigghnnBn635q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 27, 2022 at 09:12:22PM -0700, Zev Weiss wrote:

> I can see why it might look that way, but I'd argue it's actually not.  The
> systems this is intended to support provide power to entirely separate
> external devices -- think of a power distribution unit that might have
> arbitrary things plugged into it.  It seems to me like a property of the
> hardware that those things shouldn't have their power supply turned off (or
> on) just because a controller in the PDU rebooted.

We don't turn things off on reboot?  We don't do anything in particular
on reboot...

> > I guess it easy
> > to understand in case of Linux which disables unclaimed regulators
> > during. But what if other system/firmware does not behave like that?

> In this case, then no change would be needed -- a system that (unlike Linux)
> doesn't twiddle regulator state on its own would just continue to not do
> that.

We don't turn unclaimed regulators off until userspace has had a chance
to start, if there's some problem with system integrators arranging to
do this we can look into how that works, for example making the delay
tunable.  I don't think this is really meaningfully different from a
driver deciding to turn things off from a binding point of view.

> > And what is the "external actor"? OS is not an external actor?

> It's admittedly a bit vague, but I couldn't think of a clearer way to
> express what is a sort of nebulous concept -- essentially, some entity
> outside the "driver" (or analogous software component) using the information
> in the device-tree.  In many common cases this would essentially mean "a
> human user", since in the PDU-like systems I'm targeting here the only thing
> that should ever be deciding to turn the regulator on or off is an operator
> logged in to the system to manually enable or disable an outlet.  I was
> aiming to leave the wording a bit more general though, since in some other
> context I could imagine some other piece of software toggling things
> automatedly (e.g. lights getting turned on and off on a schedule or
> something, if that's what happens to be plugged in).

This is policy stuff, it doesn't translate into DTs at all.

> > I could not get the problem you want to solve with this property - I
> > looked at cover letter and at commit msg.

> The problem is that a driver deciding on its own to enable or disable the
> regulator (e.g. during boot or shutdown) would be a critical failure for the
> kind of systems I'm aiming to support.

If the driver is doing something like this it should be addressed in the
driver.

> > I can only imagine that you want to keep regulator on, after last its
> > user disappears... but for what purpose? Do you expect that after system
> > shutdown the pin will stay high so regulator will be also on? If so, you
> > need hardware design, e.g. with some pull up (if control is over GPIO).

> As described above, the regulators involved here (in these sorts of PDU-like
> systems) provide power for external systems and devices.  It is critical
> that the controller's boot and shutdown sequences not alter the state of the
> regulator.

This really sounds like a full stack system integration problem, not
something that can be resolved with one software component.

--7NOnigghnnBn635q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmNb+pkACgkQJNaLcl1U
h9AmNwf+PU1nGinh9Sa0B+FKy242nXvLwhyaRVwk0UbA1tzlYICW0ZG5rfK9hAC+
EPLyzaA9o4xfgY7ghbvBCKgvxuNsooPzcqO4Qroe5G+EMn+iWUEkTIHbIElxaRAW
SucCtYBzqvyw4ZiJ4fPeGAnmD0FXQru3QbUrnfHWN+lFpBUFYFawuk7OrioIbBIn
Vybk6Q+4PfuWDORXU35NExOeAkXJpFOd6rTVe+pL7FObV8hJOEelqLYoipCw2J0w
7a/tuDF0Jd7QJM1+qS/2cWtQikWTh4ndiPOmx+zxsUth3jPg8/ZcQip+TCqy+z9J
u+Xd/9ueAkcRHDQjRFGeN/TcXASmJA==
=Fa5f
-----END PGP SIGNATURE-----

--7NOnigghnnBn635q--
