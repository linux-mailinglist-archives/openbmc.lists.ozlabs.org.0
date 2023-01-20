Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BDF675118
	for <lists+openbmc@lfdr.de>; Fri, 20 Jan 2023 10:29:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyvNN5qMgz3cFW
	for <lists+openbmc@lfdr.de>; Fri, 20 Jan 2023 20:29:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W8j4vr4N;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=W8j4vr4N;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyvMj17TDz3bXr;
	Fri, 20 Jan 2023 20:29:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9F5CEB81851;
	Fri, 20 Jan 2023 09:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F75C433EF;
	Fri, 20 Jan 2023 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674206955;
	bh=brDlj3Fbi7upMkdhiJd32zzx8QN9gAkdfZZv5Lf1Gjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8j4vr4NyGHU0KDJCAMomXPRTzRsjAiZTqQWD6Pg/q4KJtPMNiiHpkTK+jnoLpOkN
	 RSuOb4UKU0XMvTOBt9Y3e0k3Xzr6Ulmuu/QGAyRY5tO/J/BWT3pC8ogKmyyiA9t0t7
	 93Ejw+NCYdBFUZcQZR8ublOTOx6Ok46g1ejvIP41mRxyAdRz392B6uQfrLS2RLa91d
	 GMkrM7DuGoSoB9qgNpnU1gxWIiU2HbY4KcvyzmZtBcK1GFT5wdmcYRR4Q3z+Vpxd32
	 aFhcLft3d+09gntu8uqh8Dkk0Bmir6ZVgLnCd8oJeWXO201CvuGPyOruleKDefPJir
	 SsiFlCMoPqc/g==
Date: Fri, 20 Jan 2023 10:29:12 +0100
From: Wolfram Sang <wsa@kernel.org>
To: ye.xingchen@zte.com.cn
Subject: Re: [PATCH] i2c: aspeed: Use devm_platform_get_and_ioremap_resource()
Message-ID: <Y8pe6PWZQ4TVHlqi@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>, ye.xingchen@zte.com.cn,
	brendan.higgins@linux.dev, benh@kernel.crashing.org, joel@jms.id.au,
	andrew@aj.id.au, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <202301191715319948743@zte.com.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7B4quZu9JV9hqI/T"
Content-Disposition: inline
In-Reply-To: <202301191715319948743@zte.com.cn>
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, brendan.higgins@linux.dev, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--7B4quZu9JV9hqI/T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2023 at 05:15:31PM +0800, ye.xingchen@zte.com.cn wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
>=20
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>=20
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

Applied to for-next, thanks!


--7B4quZu9JV9hqI/T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPKXugACgkQFA3kzBSg
KbbyJw//XiPV3HIZdzP6F3LPYW27GANPJVSQz0jiB9jz7JrumN/9nsWScOx8T15z
RtNzubE0tYP2sq8HxytaRfnjrw7g0paQQqm82vXGlqpCbMRduiZK3RDY3GCuMEuD
tgGMYR1wcY6gv7vYUcfR4eegbRaCaDG327a60lNI7ec2pgBT2sEWbwrmoDlXn9FL
putgoKAGFCoVXq3FgiyKcfNwb78K7EBRcWuIowhMMI1Jv/ZS0PWuWcSFa1UTLnoL
q41vgTgsCNJJBMIkp/ewXUK4r8DXdXN73nR7Ld8El6+su4RcRGSwEOJUiWjq6sxV
w9dy8E2Wrp3jgNvQV4jXFi17XKmos3ueH289nvUKRodwa7GWZLoGl1X+DQa8Ctg+
mqGcsDSs6VAnMHO34tVGHE1rZr2VogxXPO8PI2AddNRUO1Drko5reMPxezzM+LUN
u6oT5v/Siml9Nl4b6mzgGQF02BCuZT7sJp1xaA27a6mqPXqT6NaG8bNz6bZqWd4k
D6KbIRgO7oRgLY3HMXzmXHn/TQfAoEcMcCMjxCsNnCD2YnOzJLOOiJR8AjL0mH2H
IXAKFDh51pBhDPXWjSbzGpr0osZAPoF0jRgFa3NoFQtBu8eFTVkTctPKY4OUDM/7
wR56ThbF3BhDp5L0SuuZGO5vFK8fMQu9IxLX9D+uuzf7SZq15X0=
=AWQ7
-----END PGP SIGNATURE-----

--7B4quZu9JV9hqI/T--
