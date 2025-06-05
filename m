Return-Path: <openbmc+bounces-126-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 371A4ACECED
	for <lists+openbmc@lfdr.de>; Thu,  5 Jun 2025 11:37:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCfWD2Kl4z2yLB;
	Thu,  5 Jun 2025 19:37:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=78.41.115.137
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749116264;
	cv=none; b=IfeidPP5CpOhdkUP9fz7SMJDzizjMJWLbNTe7/brrjtszz92VKFZikYFdrfXbGHnnq80L+nt4yB4VLZ2Y3xYQ88uUFP6gG1HhRbFrd4uFO2PMoDoD6JAr0QxyBGIW13JN8TETyYnvHQ5KqaJUHPRC5J4cp1mVdm27VUqIX/KicE6NuhfXIiW+6FA/KBxhktsqIjASXpco93xvx70QEXf5F/LGj0r7p5KPuUMjV2gI7PkgOghQgr1YL2z93nOWqyLnj7oFDyzxnt4blSKBQob6PHDWLrz/5okooER3RP0o7DxKeNcMg3RNRlhWtGUg3/3R7pgdEMJZcS0LuFUYvngcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749116264; c=relaxed/relaxed;
	bh=tmg5V14BNdpmAb2knJ75xN/RnyvJ6xb7k6PmLvgCtJo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxm1+auCO06TL+/dIYnof1zhkBNLee26xcJBjC9egOE1ggOy8k1J/r61ym8sBSyJ/IrNeYp9I7x8IaKkbt3Zb625EB9cL3xphZIgBaRboGrh8Yvem63dAL+kSFvpNu4t3e8LgFmOS6XFQRC/GhqH6mNBCFRXFEHBcWowW0h9gReMlQQMoYyK0+Q4s4J2WHwdZMF3vJCZCrx2Acj8JzXHgsrIfUeuhtG90thQJUbPoC4gdtZK7MLd3tGKyi84Y0F3kjYk7DAe4DM7PP699ZsF4eBmMgW3otVFdEO/yRqYAz8uKms3aez2+0hW8tXvjKWXPi9mLZd4Q08TMxlg3kTe/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info; dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=rcJsFmH3; dkim-atps=neutral; spf=pass (client-ip=78.41.115.137; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org) smtp.mailfrom=truschnigg.info
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=truschnigg.info
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=truschnigg.info header.i=@truschnigg.info header.a=rsa-sha256 header.s=m22 header.b=rcJsFmH3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=truschnigg.info (client-ip=78.41.115.137; helo=truschnigg.info; envelope-from=johannes@truschnigg.info; receiver=lists.ozlabs.org)
X-Greylist: delayed 549 seconds by postgrey-1.37 at boromir; Thu, 05 Jun 2025 19:37:42 AEST
Received: from truschnigg.info (truschnigg.info [78.41.115.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCfWB5Q5sz2xH9
	for <openbmc@lists.ozlabs.org>; Thu,  5 Jun 2025 19:37:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=truschnigg.info;
	s=m22; t=1749115709;
	bh=/8t8I93FygPM/ep892GDnAJacuNo1FXIIJFIO2/Iy2E=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=rcJsFmH3N+jTcvht1wH692psQFkpLgns2VpwwC8ZSP+56BjCgNhMT3Kc99u6STByo
	 37MmQ52DC61KJE9EJCeIs76jSfybPRR/Wha71sDfIlYOX0oUMEF9alkhpmfNAUkSgX
	 c63ynRi96bz8spVV/FRneTnXz/c8Dp84MDF0aLuTCCG9B8i62JVZlv5CutSvGpd6SN
	 PyAanI/JcPFSiugPFugLA4v1FJA6wAhRo1B0yhyx9aCPB083bdBSDjk5/gGiTI1kCw
	 Uh+jjN4BDPtpiCGCDypkqnvwWw9AI5V5xWgt37DLK2X6J3vuek5MUZQdOMn43Qzpo0
	 DKh+dWRNkMaIg==
Received: from vault.lan (unknown [IPv6:2a02:1748:fafe:cf3f:1eb7:2cff:fe02:8261])
	by truschnigg.info (Postfix) with ESMTPSA id 422A6402ED
	for <openbmc@lists.ozlabs.org>; Thu,  5 Jun 2025 09:28:29 +0000 (UTC)
Date: Thu, 5 Jun 2025 11:28:28 +0200
From: Johannes Truschnigg <johannes@truschnigg.info>
To: openbmc@lists.ozlabs.org
Subject: Re: Settings backup and restore tool prototype using Ansible -- RFC
 on a published project
Message-ID: <aEFjPIgHlz4i5VG0@vault.lan>
References: <Z9ftA+zMr2ljEbZg@home.paul.comp>
 <F4A34EF4-9572-4863-97BB-8ACA4B7FF1A5@linux.ibm.com>
 <Z+MP02Uckh6jt/3O@home.paul.comp>
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
	protocol="application/pgp-signature"; boundary="01gL5qGfIjwBcsGw"
Content-Disposition: inline
In-Reply-To: <Z+MP02Uckh6jt/3O@home.paul.comp>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--01gL5qGfIjwBcsGw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 11:19:31PM +0300, Paul Fertser wrote:
> [...]
> What do you think about my approach though? I would think it can work
> right away with many different existing Redfish backends
> implementations without going through standartisation process and
> covers a wide range of actual usecases. [...]

I just wanted to let the list know that `ansible_redfish_settings` helped m=
e a
great deal in getting a small fleet of ten new servers deployed the other
week, even though their BMCs are not equipped with firmware based on OpenBMC
at all. I highly recommend taking a close look at Paul's approach if you ha=
ve
to wrangle many BMC configs at once.

--=20
with best regards:
- Johannes Truschnigg ( johannes@truschnigg.info )

www:   https://johannes.truschnigg.info/

--01gL5qGfIjwBcsGw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGu9IhkI+7/aKLUWF95W3jMsYfLUFAmhBYzgACgkQ95W3jMsY
fLXc2xAAkYbHfDGCm7vsLq9hB7cmOD4MMH3pCCLwC1C0knCws/UkRxMkwJ9yq6sL
X8y8rBqyvZaqK+B1+Y7VqHvfVugkTfiAVNlHZZWVsL3TdeDLl89/GmJvnDSjWwzH
Ff2Z0xpq/RQRFpYuMoNQjj5EbVYItK7jiSPfEZjLXQNXU36aeHIP+6ANG01ncuzt
QWVg6KFAUI0p77PpVLs4MWpeoOE/RrfYYLlJ6638RKx1jSeWtih0zY6R8chAi6FO
6TwIyLvNgc9qQJ5deUqTAgfE1nUDICY8JZM2ottyHNEtkjKFPYffNX2msTrfSoL9
6FTZDvLm4NUlPOkyIrclQrLFOOfyZM43eHyHwFlw5lw15Pgm04cIb0noLza4eJUY
d+MAHXi1ODgljq6MKFOhHowBcQ9yIfAoW/dSfoHHZ4/sofZMVlx/UtEsIZmu1CNo
vAKHB0z0Jgydru+U87f6nYVFjpHnk0+KNIT9ALnUJVIMbPdS9bK7l3XodCdd7RPz
ICv9EvjWueXrXunLkDJticFuiuaqJbbzHDil+PD6JEKXizR3gjaXCeSW/FfojWtR
5ejj3zpEtMTPVtRlZFaBN7/1hZSLhn7bUlx8LgNTl/KS6uzlWRg7hhY96VbFEqlh
ZNUELbZsW/eIXbTET2Du3oL52aDlvCiK3b/vwa/hRdxg8FdQiC0=
=mV7Y
-----END PGP SIGNATURE-----

--01gL5qGfIjwBcsGw--

