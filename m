Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE2852010C
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 17:24:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxlN11Y5tz3bqG
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 01:24:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n1VA/Klj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=n1VA/Klj; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxlMY6f7Sz2ymg
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 01:24:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0159E61166;
 Mon,  9 May 2022 15:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19B98C385AE;
 Mon,  9 May 2022 15:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652109861;
 bh=LEm6HgVppnlZQISFT+9HHMdM02TVToh0/TmdUIV0sOI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n1VA/KljPkrbN3E0VrXXWDAy85QXkbsJaVBAQiOF4F8Q5WDODiEjAoXQwzcENK7tN
 RzwmvpGgOcIbQ/Qy2a8jDuwRxGxHHf2vWRg3iR2QQxh2QGmvYOho/wWRTO+Wy1atUE
 ZyS+mZZBqXMm8+O1ruKF5FCPJf7VwS4d5aUDngSzTfTDj63nL0OlnAWtYux1vzy++8
 Vg+BM7BsoUDdeYa/So4urPkvgeLL1H8gZ9HP1MnQ1mQk3tYAFss1M2qSbvhuG/SKps
 IaQaM78dqK/jfp2RuYx2KXRAQrmm4kzq9QNiy0CfJTluGQkJK9u46KrXlsiVPsdcs7
 dqBHERaC60cvA==
Date: Mon, 9 May 2022 16:24:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Chanwoo Choi <cwchoi00@gmail.com>
Subject: Re: [PATCH v2 2/2] extcon: Add extcon-regulator driver
Message-ID: <YnkyIBh2HnXXLHw3@sirena.org.uk>
References: <20220505232557.10936-1-zev@bewilderbeest.net>
 <20220505232557.10936-3-zev@bewilderbeest.net>
 <e27ff1b2-c82f-8335-340f-ae1fa914ed30@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="WO/WlJ02k/DBZ1pO"
Content-Disposition: inline
In-Reply-To: <e27ff1b2-c82f-8335-340f-ae1fa914ed30@gmail.com>
X-Cookie: Boycott meat -- suck your thumb.
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
Cc: Zev Weiss <zev@bewilderbeest.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--WO/WlJ02k/DBZ1pO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 09:24:39PM +0900, Chanwoo Choi wrote:
> Hi Zev,
>=20
> I checked this patch. But, it doesn't look like the extcon provider
> driver. Because basically, extcon provider driver need the circuit
> in order to detect the kind of external connector. But, there are
> no any code for detection. Just add the specific sysfs attribute
> for only this driver. It is not standard interface.

OTOH it's something where if I look at the physical system with the
hardware there's a clearly visible external connector that I can point
to - it just happens to not support hotplug.  It's not clear what other
system it would sit in, and it seems like an application that displays
external connections on a system in a UI would be able to do something
sensible with it.

--WO/WlJ02k/DBZ1pO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJ5MiAACgkQJNaLcl1U
h9Bq8Qf+JNTLnMxAchMYbqY4M85vtiwxg4q/j0UC05QW3qbi2AF/jyk5zShlky7a
GUigz1AJUhq85ujG2dmNJTHX+rgGpDEbY1rl6Bw1Nl4XqKwGikC3HkSY+YS6DoA+
Mtz+7rc0NpPRlf6QqSTJDhag0sNf9ZMWbnY6uf5N2ORkKnqTxapInPGtFZRoLy4t
FYFnBcwnhsrmnDJmZnywyXY4sE2iEZ08C8Try6RE7KHQp2O6xTmB529/a1GwnrSb
3uzdV+52H4s/+2+yiEYC3kIDpjH6P5heCbT345RN9hOW7H5v1yBPD8K5c66cL8+7
6AWmwJPpjq37H7gG88KCZOS4EJfzGA==
=+dcY
-----END PGP SIGNATURE-----

--WO/WlJ02k/DBZ1pO--
