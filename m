Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE519D06B7
	for <lists+openbmc@lfdr.de>; Sun, 17 Nov 2024 23:45:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xs5SC40zdz3dRS
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2024 09:45:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731662018;
	cv=none; b=hj0bf0+3n2nQT7qsdlvXNeuvKPC9gfxF8VtdxM3IKlLTYxhsBEjwCgJl9jn6nn8Ovfac0rk8uEjj1UPRNm6PJ45Unvk+PeC96VXVAq7kWIReCBpj/A/VMAXahrlbJ7yS0TD85DeZvOrXLw2c6WCCRi9Y8q3VsdOh9j05AgQjH/EFZ4BesN044w1pV/Nvlu9TyTdu5+qV7X6DuHTBD4ppaQ2XQPGFgmPGGjV1mcz3ANudpEy7NoHI65Q1sxcdc7Zcg6toCQ6BSQ85H7C33DRVWbzX5JKnfiZFCj9nbRSP6n274tFPIIquOkWcCv8E/9kQNatYHFNYHbSXfEldQj716w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731662018; c=relaxed/relaxed;
	bh=yPZVsgKXclOlJH1qoJgcuarPoZsvQmU+kn7v0TjKgwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVzrsBNixmFOiwPpXMMGK0wgPDGAsF8zo4rL+RmAvBBYK0okvQhmDZlRNec63JihNBZ4bnDSCP2wzIWqz7R9adxL9J1mPzoXLTwx8lk17RVI3V0yiIXuaB57i3nwTfu8igCpkLjoN4AtStmS8xEbxr7YJed2zbn0gEUTW7OVcpmZSx8+mCyloYxReSaCLEsrsLyIhLKvQjwWgUEPSocKB6cKq88l1YVIJBhyKtVn0Mxx1fCi1jxA4lCZkJEh6F/bPpkd0Q2RgbDt0VyVyDnKtgy4hNVQ3YIW4KhH/1JLcjy47ksjNLwCocRdaRgjwdRxf30gvLmvvph09IglHjStuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Zsb7PJ5B; dkim-atps=neutral; spf=pass (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=sang-engineering.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Zsb7PJ5B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 394 seconds by postgrey-1.37 at boromir; Fri, 15 Nov 2024 20:13:31 AEDT
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XqWXW6kYNz2xYs
	for <openbmc@lists.ozlabs.org>; Fri, 15 Nov 2024 20:13:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yPZV
	sgKXclOlJH1qoJgcuarPoZsvQmU+kn7v0TjKgwM=; b=Zsb7PJ5BXCpssQ0r+SWz
	lH2RNcqPi4KUfnvHZ6wJb1EWjoitv0ZP5RTR9j+jlhEqbzfX+k4VIwnHdLXXdGk5
	Qse5Q8hoznXgveNraWKDo/szDYToU33oCRGd0OuwtPZvli2eaH/xvO+4wGc4JrRl
	zjz57QkZX4sK5vlA2t+d92Y3YxHoIVRupK7aNk7ROaee0B2tJOJy5nysUiJeE3eH
	/Z5rTmX9b/U2MR6YPN4Ginosjgp81gH4iz5xtcAh38Tvh93auPytpSGyaRzFEvxV
	sjEedwRNwrt9hTKZYe1Hq/IZ+a6+S/BNZVzo/mYnMvOl5fiB2kL65BI1ss8tgj0o
	QQ==
Received: (qmail 3419175 invoked from network); 15 Nov 2024 10:06:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Nov 2024 10:06:47 +0100
X-UD-Smtp-Session: l3s3148p1@nSH84u8mLK9ehhtH
Date: Fri, 15 Nov 2024 10:06:47 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from
 Brendan to Ryan
Message-ID: <ZzcPJ9sweqxLZOGf@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Brendan Higgins <brendanhiggins@google.com>,
	tommy_huang@aspeedtech.com, benh@kernel.crashing.org,
	joel@jms.id.au, andi.shyti@kernel.org, andrew@codeconstruct.com.au,
	wsa@kernel.org, ryan_chen@aspeedtech.com, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
	brendan.higgins@linux.dev
References: <20241115044303.50877-1-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nK9GppicB146/nY+"
Content-Disposition: inline
In-Reply-To: <20241115044303.50877-1-brendanhiggins@google.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 18 Nov 2024 09:45:09 +1100
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
Cc: BMC-SW@aspeedtech.com, ryan_chen@aspeedtech.com, andi.shyti@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, wsa@kernel.org, brendan.higgins@linux.dev, linux-i2c@vger.kernel.org, tommy_huang@aspeedtech.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--nK9GppicB146/nY+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 04:43:03AM +0000, Brendan Higgins wrote:
> Remove Brendan Higgins <brendanhiggins@google.com> from i2c-aspeed entry
> and replace with Ryan Chen <ryan_chen@aspeedtech.com>.
>=20
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> I am leaving Google and am going through and cleaning up my @google.com

Thanks for your work on this driver.

> address in the relevant places. I was just going to remove myself from
> the ASPEED I2C DRIVER since I haven't been paying attention to it, but
> then I saw Ryan is adding a file for the I2C functions on 2600, which
> made my think: Should I replace myself with Ryan as the maintainer?
>=20
> I see that I am the only person actually listed as the maintainer at the
> moment, and I don't want to leave this in an unmaintained state. What
> does everyone think? Are we cool with Ryan as the new maintainer?

I am fine, depends on Ryan as far as I am concerned.


--nK9GppicB146/nY+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc3DyYACgkQFA3kzBSg
KbakuxAAhyZAhgBDfdxkF5LlZpy0BWTyWqEP8GXLw6CcwvZK8FtelfWQ7fJp2q+N
WVUtpFgaiHmEdRr4OGD+1HVFtQgRVu8ybw/jyAt6P3ht1v0AZazUbKrxhJU9atKb
JbMDn5fMwiZu4YXAnfMXDA4VIrLYG3oTAjdDk4dYR4QwCh9EVRA9SJ4Oi+GkKdWg
jEu/KQiKNNTchEmr4Hm/A1tql1hOVKfKCg1dcOtnmzFJrrmWfL1zx2TurjyntpET
+DnDJGYx/96tWCxEVgmp517xxr1A4ontZeGw1VaozHzRjmOBXoW9NECyEg/J7zCd
hz1HefaJvPHACQH8vDYqtYUcAgdQqa06b/emsybRKhyIKkRkY6EG04ExbKEEM4tN
h+CMRFszsBPSIUQF9tErfHCXnK5z3cVHFrl56RVdBUx6Pb4uqIIVeoHGVjPKoCrs
HGSlFczraaD1v2bqneRbpdXoBBmbQjp/N555olQ8k9r9HYKxIYr7wr6eM+4quRz4
pSvGANzlRd6MDxCIInT3bNJ2Agl0qtQxNcjvJHosSuvHNS9Go2fx2To+Qogthww2
+p9jR8SFgPR6Obt0+jj2EoyrPI1ecFreTUxR7D6114J48e7N3oOgEgUsjysS6DBJ
Qz5L3N28hseO7jDZE16gbtqLJgVOKVjUmqJYo3sOSf3wYcy5sJI=
=yNAx
-----END PGP SIGNATURE-----

--nK9GppicB146/nY+--
