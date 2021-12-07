Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0822447281E
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 11:10:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCHLt5pl6z2xCy
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 21:10:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gRh0LSOO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a;
 helo=mail-wm1-x32a.google.com; envelope-from=thierry.reding@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gRh0LSOO; dkim-atps=neutral
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7YrJ2dvFz2ywH;
 Tue,  7 Dec 2021 19:49:19 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso1168805wml.1; 
 Tue, 07 Dec 2021 00:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=QR97QPW6f+NCgAfPv43w1fjZD41f7yPQgmLStq1mi9A=;
 b=gRh0LSOOXgIypuCdQaadqe7XgZFROTeqpk1WWlszBVKUUUiTyjV00+KOcnYsNRAX47
 5X3ALW2nTtvtWHqgaUe9zA4UUUjrNu10vXPJPvxB58W9EN1tSP8hz05dDkuR0k+s+AZh
 xrzBKOxupUAn/CqiBNghQJtdF4tjfmSatN2sUUoqaqD3IEIMToLSi2Ke5c6iim46iQys
 Kb/0orwNvVJywlOh8k9fd9C/fPMILruFbp5RSzOfYaZ5dPnRThCRcSGb3qjJ9RpA3+KZ
 yn3g2KlCui30P8L+KmIAw671RtfrcvdbaCtIGh26eFGhOlnNJG3uH0yXlWBodbi7NoaO
 BQNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=QR97QPW6f+NCgAfPv43w1fjZD41f7yPQgmLStq1mi9A=;
 b=I6UqSSE4XaG7mukR1OtNwOvdLFZvm/bEoUxgdKtQhVl5JZrKs9JnYqEup65AgvvuFu
 5N1ySjco6VPplqvYhiWeH/KjEh1b+YvCSWRtYR8WNbyt6k28osLW7s+Qovc0aBY+8qbS
 0uUYLt51Rjd4WakhBIGbS8ziPS92oqoZvWTYPso/EJV3ZSH6pRaPAIvUqKbP6SBvkjDl
 VejZHot0fa7LXD17W2w5vo3mvy/KnupaBmbMJ9EbpGl+hVPAqJXKbxZVjgctvpebxg9W
 Kqqhj85rO+iz93Fkfk534wylVidpgqecmzii0b2jsi2x/m9Eyn5P5THnVu0L43Vh1Tg8
 VYdQ==
X-Gm-Message-State: AOAM53099jrfIw3WuNH8Dbj7JbtBe1EbM7VWhYgo+eJDu1GDtPwi5r93
 zqx5cRbX6toLqMHYpEkAkK4=
X-Google-Smtp-Source: ABdhPJwlcEDhqDKisTkge+HksHvcucpIyuEWBZi2ohpxLgw/uhMKKUgIA3jxgrmbJ1OgEC7tsfbrEQ==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr5272284wmi.35.1638866955262;
 Tue, 07 Dec 2021 00:49:15 -0800 (PST)
Received: from orome.fritz.box ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id x1sm13693748wru.40.2021.12.07.00.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 00:49:14 -0800 (PST)
Date: Tue, 7 Dec 2021 09:49:11 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: i2c: aspeed: Drop stray '#interrupt-cells'
Message-ID: <Ya8gB4mu3yFYCbhp@orome.fritz.box>
References: <20211206174237.2298580-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ICqRkSFbTbP5VtpW"
Content-Disposition: inline
In-Reply-To: <20211206174237.2298580-1-robh@kernel.org>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
X-Mailman-Approved-At: Mon, 13 Dec 2021 21:07:47 +1100
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Rayn Chen <rayn_chen@aspeedtech.com>, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ICqRkSFbTbP5VtpW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 06, 2021 at 11:42:37AM -0600, Rob Herring wrote:
> '#interrupt-cells' is not documented which causes a warning when
> 'unevaluatedProperties' is implemented. Unless the I2C controller is
> also an interrupt controller, '#interrupt-cells' is not valid. This
> doesn't appear to be the case from the driver, so just remove it from
> the example.
>=20
> Cc: Brendan Higgins <brendanhiggins@google.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Rayn Chen <rayn_chen@aspeedtech.com>
> Cc: linux-i2c@vger.kernel.org
> Cc: openbmc@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-aspeed@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/aspeed,i2c.yaml | 1 -
>  1 file changed, 1 deletion(-)

Interestingly I have a patch for this as well but it does the opposite
and adds interrupt-controller and #interrupt-cells. Upon closer
inspection I was tricked into this because the i2c-aspeed driver
includes linux/irqchip/chained_irq.h and linux/irqdomain.h and therefore
I assumed that it was indeed implementing an interrupt controller. But
none of the symbols in those files are ever used, so your version seems
to be correct.

Reviewed-by: Thierry Reding <treding@nvidia.com>

--ICqRkSFbTbP5VtpW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGvIAcACgkQ3SOs138+
s6HGYg/+O+id0oZwHJkCp6siA2gEqNUXVYkH6mzWDT9oDmO7ABtPrYBDdQi8FLda
Y2GS9i6jKuW6j/EP8fDX61ksJhBBuu1Aj89ivX3aPE9QwZXOHCUaVYnRjEVPyUN3
eFv0QSBMWxsLDNQ0bpOFA5ZpxkJ87wnh1z9u5Vkf4F9q6yUZcWuICwJJImgF5Udm
LcUaBVBLys7gLX4ixJPHymnB9ogCxS87QTdGXSY94E3iR46Spkr2LKOXVaKbqVKJ
OBQIdlk64ZSpQOQ1mUDRAdkSoZtyEik4MBbdOwb5/9bT9QvPu7h1Yi+DWxwJpW9x
40KZD8JDK0xNlJAlUtkiwbu9frmpZrSz359rnQ9HXLbze5p89xsvpLtOiYDemTBW
VYfFjGVMYAhLx5UgIMDTO4f5oQeBeG4N7XkrSAIEK4zZ9OAjwJ25w5aojJuULqgH
/jtYeTcU6dkJ0RD3V7+vhaiznwlPZr4tfu63Fqt3Ai3EVYMqKks78wZhwtrrhrOO
/SpWSv4jyAC7Mh1R6KnDD193ar6IPdW6DkCeuEokRVCpdRjtBGSX2aplXgVlRk+r
YB3WdOKqkaJuEqKhzYuUdaHsTyRSdzSrb19hWbtHjZc+nuQHLs4GqpAxCxNHoXNR
V8bGdcm7GQOiVRbaaY9a0+d82p6+hk0rvv9TtKqE+afw/enojQI=
=8Ial
-----END PGP SIGNATURE-----

--ICqRkSFbTbP5VtpW--
