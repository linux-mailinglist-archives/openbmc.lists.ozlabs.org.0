Return-Path: <openbmc+bounces-1212-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B988D270A2
	for <lists+openbmc@lfdr.de>; Thu, 15 Jan 2026 19:02:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsW6817Hjz309H;
	Fri, 16 Jan 2026 05:02:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768500144;
	cv=none; b=CzojlsQAJFV6GUVbd9229kIqkIPb7bVDHkaj4ch/ptokKWV+ctUp/VASRF2b0aH8VnoxJsF/UxkRAnotA3Oo0PEPS0F4Ew+zsqNQ4JAmfIhhxWpourZKla60sCLqbZgviJAU1Vu0OpytswmB09IEroOt1KyMfhm/RE+ZuNWhw1V/j+pZTHS97aSowf0uZyi8ZnHVZfNwZKQoLdxnPFs1KGCyr9ywAyffDYPhQ3h5aeRahK0fX9MpnhrXcj8h0Q+TfZLqkIXbTw4q+jdGhIIwWxeqO0XS6FYMJRu26ZF/r/OEv+9/TqVBbYAMnO5tWXvow3lP+KjxDjxKUXamRPQ6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768500144; c=relaxed/relaxed;
	bh=rJlnrgsaFVoPcoz34q36AUaoD7Zky3yzLdKE9x1VEEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVyOd27nvkiG0WzvPc/Gsn8s2sE/u7e3mOFZPyCLJ30lKFjc9/3plBqPE/pERZRZbghf3+iuwLdKF//Ugbexg2SxvMETG9BBK2abNJcjUvEDKcoeZsls+v/8Z0xwAp7N8UWBgtbej/O/H9gbKgEzussiFOvFPuAxyZ85PPbH4CQfRpvcc53HjbsQSUHCM00ZBOKj9a6Hpw7XwAs0I7lOBcSDRnaNzXNZysHJ9zsW2bDabNwJMUjPl45a2Wm3nU9bYdyeCIPwpgOReDju4vvvOJe5cLK19k89aHx7h/Y5Y5X4ynCtXpEFahWAnVWJiASfY5T1J87/lfcBPcjJ5udhsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EnqmmgYL; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EnqmmgYL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsW67314wz2xNg;
	Fri, 16 Jan 2026 05:02:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3043960130;
	Thu, 15 Jan 2026 18:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A19EC116D0;
	Thu, 15 Jan 2026 18:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768500140;
	bh=Kn6CM13muJURtMblhTu+B8XKHuWGrLq8ki08pxGulnM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EnqmmgYLIO6vRVPEhJA3xqQRcAHI6Tr3rX+0ylbgKHHb5hZzfFXPsbTSHSvUoTfcy
	 KSEvpK0KVybSKHRc9Mk22oQmrUiJfX6pOUH/YzS6T51JTeH3qJ38gmod01boQy8jqo
	 K35TBA4GxXb79819zJk5FTZ9ho+8gmxwDHciXSKrh45aHekKYMN+BJwNVdDSkq8hL7
	 IORdvIetisScuTmE9sGnsLeiqZOFuNuYEGCDYzZ3ZVovKy/YM8jkjJohVCRKXhg465
	 xtFDN2HOrzraBuxvz5OPud2GyD4ZVDXuC0Efsy/YU6x4r6gu2PY7zv5onXLoqE3IBh
	 AG+iQhZhbQCYA==
Date: Thu, 15 Jan 2026 18:02:15 +0000
From: Mark Brown <broonie@kernel.org>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Cc: clg@kaod.org, boris.brezillon@bootlin.com, joel@jms.id.au,
	andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH 2/2] spi: aspeed: Add support for non-spi-mem devices
Message-ID: <1adf54a9-56f5-4fc4-bba2-837a132fd123@sirena.org.uk>
References: <20260115150454.1575970-1-chin-ting_kuo@aspeedtech.com>
 <20260115150454.1575970-3-chin-ting_kuo@aspeedtech.com>
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
	protocol="application/pgp-signature"; boundary="xvW1NsWVoVmF5xI9"
Content-Disposition: inline
In-Reply-To: <20260115150454.1575970-3-chin-ting_kuo@aspeedtech.com>
X-Cookie: Are you sure the back door is locked?
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--xvW1NsWVoVmF5xI9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 15, 2026 at 11:04:54PM +0800, Chin-Ting Kuo wrote:

> +static int aspeed_spi_user_transfer(struct spi_controller *ctlr,
> +				    struct spi_message *msg)
> +{

I'm not seeing anything here that won't work with transfer_one() rather
than transfer_one_message(), that would reduce open coding so if you can
do it it's preferable.

> +	ctrl_val = chip->ctl_val[ASPEED_SPI_BASE];
> +	ctrl_val &= ~CTRL_IO_MODE_MASK & data->hclk_mask;
> +	ctrl_val |= clk_div;
> +	chip->ctl_val[ASPEED_SPI_BASE] = ctrl_val;

This should fit with the prepare_message() callback.

--xvW1NsWVoVmF5xI9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlpK6cACgkQJNaLcl1U
h9DIhwf/W8/a6WTvTXkoR6TsMYE4X1woUmylZmwsFN2UaCmgI1L/AfPz/YPV++Kg
zpWoAhy89sXrI0dewD0d/9r5c6eV/TvYD0nF4IHAwCU7lDxZf3fet4WOztYITdcI
J9XpQD+PGCwrjHTRjq+aXUYYhrS7vGhDUOUuY0xwgglOgygS/c8TRAAe7kcaR/jg
a2X3FYPadw1n/Y44EqG84FWyElTCFCz3V38pry5fc5IPQ9eYIgxD+MkxWa5ReSAg
byWuVsR0D55WyOEdf+ZSkYm4tvHmiM29MuVJmF5MXfP9jnJeG+2KSwKoDRYDQYWZ
9bvRisvSKoCqiQKNeacaATDXKGw6Eg==
=ENSf
-----END PGP SIGNATURE-----

--xvW1NsWVoVmF5xI9--

