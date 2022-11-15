Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1001962935C
	for <lists+openbmc@lfdr.de>; Tue, 15 Nov 2022 09:37:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBKL91wNzz3cGs
	for <lists+openbmc@lfdr.de>; Tue, 15 Nov 2022 19:37:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=tbk8RUwT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=tbk8RUwT;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBKKW0X9Yz3c2j
	for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2022 19:36:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1668501363; bh=SMuJ5CnM48woOFev34AuT8M3VAxDczRjA8Lr8YXHzn4=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tbk8RUwT6kPI4AO5dGkWI16ZqMF9TvysIgpeWzrgMWjZDi6nOsmR5xnkAqQM90Uw1
	 dCtushIxS+PiS3N6cyGq8zRsbRIznRmTVojfl0RUT7CkdbYwqUI6pJ9CHn4zCs3nkr
	 if35G7iEljrtUxpkwxQvlyk1ncNf+En9Y5FpmD+MZGGadPI2ItBzsozRYJJipak+3T
	 pnQZ9fRJGZA3POjw2EGJgky2hNKIusOV4y84hMjuiU3S03GCF+OtCshJLED034sCxI
	 iE+V4EdkhFOmJNsAXuqDDpEbd3u1PVmcM2OdAxnEtWu1JlSyWFeE1s0gP45JJnR60d
	 78vTQrUBOQaSw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRTN9-1oZd6k1TvR-00NUTQ; Tue, 15
 Nov 2022 09:36:03 +0100
Date: Tue, 15 Nov 2022 09:36:01 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Wei Yongjun <weiyongjun@huaweicloud.com>
Subject: Re: [PATCH] irqchip/wpcm450: fix memory leak in ap_init_qci_info()
Message-ID: <Y3NPcfuS9M6BSoEW@probook>
References: <20221114110854.554220-1-weiyongjun@huaweicloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OpoW+8ODgSOojoM3"
Content-Disposition: inline
In-Reply-To: <20221114110854.554220-1-weiyongjun@huaweicloud.com>
X-Provags-ID: V03:K1:4YFhk3Q0olA+Oyv1nYM5g9upHbjQ6BiqSpOWt6jQ1C1JFJzG2NP
 erLoDBgF6h/MNAuBG06W++jseaJp7kjvQf2aTHoRKajBK0S+YBweTWYnVkFrJWKAjRvelji
 hx5E//LqgP184mSzBA7gPiNt0KyRkUu/A/lqEGE8fYtJpi5y8M1B3yuPfWfZydV0E1IalFG
 DUF5SQhA9motwLI5IxB/A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:OJBTx31lpRg=;Uf9LVFh/uWQET4QMzShH3U0PXhA
 ESsYM+KiwJ1wlDCcOwtWtkBcblRQgF5JUkupzTZsbTJXWi/TDOZ0vdoJl2cqVUXFF15dabY9g
 9j/xh4rl3uDepnDMjPnuM5RSXSq+W9mPLZTJjUKwwHJx1K3dtXNp2WXYJtnBeJWWn4FtRXTfp
 wmw2Nh5iHVmV4KLS86XU2aYeWPNpOJ8NEZROTBdyCzbBQmTgP3WGB0XKtX50wZU7fwlKwwKno
 3GGZFDm1+qQvtvRX+1xd2p+SRbZITop+SzExkOK8pXgFWS/M++Bs70GY64f0+jNBZ798RNjZt
 DyY1BcOjIJx16OcGxEkbQcDtiCRqUg6jvR3gD1CCRUBvFyyzmTuENRuPyj2hrstFM0mBgGfGI
 bwCYNi4f8ry0Z8eX8Y0i+NlVFsKePmcAhrjrvyDUm2/4fYd4aakXgRqJJZ13+dJacHAwY7giS
 4RQgP+9LfoiuUg4pUkyfN4Rr093cS7Lth3REvtM8f2N6qWmCJsE+V9coQQ5zkOX82lOAgXgcG
 Gp9uCmeDAqvuAyuLrKQfZXURgqDRoJmJbBaNkv5JmTc8iWP+K/n+ddFoP0kfF+GCCocAD16OG
 dEu3xOccHCOFCEPFmWx8ySaB1gjGxvn8pzLQUI1o32GvF5uz1blMXBIx1GQFcnnNRhDNnKai5
 bJu9lgE9emYexBXc1Y6tndAv+v1YdhxeceMuUpHI1XVWTuq/pSsMEMIorZjig5zViWTxYpwN2
 1sAvxe78ae9hgt5/434CU2ZL6Gs4RI0+++BKLSe6Uy4auiIkJxkRd3uqZv7jqs8ctlCSLaewT
 FWgAvUzhfHbFoz2RL64E5Ddak0NVVe2uoWrPpkl/Ku98tACN4hcGz9nWWctC7Pj248jNQZd3G
 iGp09fSXy/oJsbMzlmXxRJ97uScIO+Q+HsNbcb4L1zExVjuei7WWVSl5KmyOZLcqmZByeLSZ8
 NXw4kg==
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
Cc: Marc Zyngier <maz@kernel.org>, openbmc@lists.ozlabs.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--OpoW+8ODgSOojoM3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

the function name is wrong in the in the subject line. Other than that,
the patch looks good.

Thanks,
Jonathan


On Mon, Nov 14, 2022 at 11:08:54AM +0000, Wei Yongjun wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
>=20
> If of_iomap() failed, 'aic' should be freed before return. Otherwise
> there is a memory leak.
>=20
> Fixes: fead4dd49663 ("irqchip: Add driver for WPCM450 interrupt controlle=
r")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/irqchip/irq-wpcm450-aic.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/irqchip/irq-wpcm450-aic.c b/drivers/irqchip/irq-wpcm=
450-aic.c
> index 0dcbeb1a05a1..91df62a64cd9 100644
> --- a/drivers/irqchip/irq-wpcm450-aic.c
> +++ b/drivers/irqchip/irq-wpcm450-aic.c
> @@ -146,6 +146,7 @@ static int __init wpcm450_aic_of_init(struct device_n=
ode *node,
>  	aic->regs =3D of_iomap(node, 0);
>  	if (!aic->regs) {
>  		pr_err("Failed to map WPCM450 AIC registers\n");
> +		kfree(aic);
>  		return -ENOMEM;
>  	}
> =20
> --=20
> 2.34.1
>=20

--OpoW+8ODgSOojoM3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmNzT0sACgkQCDBEmo7z
X9tK2RAAjTt5BNtkhcsie3OPZWUiTCBinyz3x/TksHO9LRDI+DNoO7dVCLnZFYsX
Rc/ucClYW8qNxsLF462dXKSxSUZPA/hqcnsr9rU5nbRSCob5gMrpKiUVuXgi4/tT
/OvO8R5RGa0v55xpE3m9QZHK1oOLTzXCvq8MYZtKBajU92nrZN7KqSrF1BSt3mSZ
pUmioq+qZnEcHnIXJEF89W2DVqwyTmGhcXI3AUdPyiNCkAjw1quJqzQgDY7BUOBH
UbMpBxqdntxcaVy9s+4q5/GLIovYaTxtJNgY/TD9Q7Tl3Z7kRR3wGmKzeE3BJ2Tm
dgm0fbk4M28M6Y3GRAHKtT3emiRg8iIJ3/h4SFC18rv+tczqHUz1kKHJ2Wg0zzKL
P59GgslJIWdjwPKWzGjQ6SqGiKpEDJxx0qS+2PM3jLrULBQWQhmNnmA7t5vfUJn5
eoZuygQH8/XISq+JciA2WGr9evUwKc5jeH1sL22UjkRpEFyhvLByxkmKnKT8eGvG
6Y7AcTRWrzuyDMzoC93uQ5DrRP2wsSKS6sZMFzw9quDdqjZrI69n3Z6aF+aYlWBS
RdZl/z9x9rIaWWu6Ea/6LlLxa68bwIADjEx7mX18qSvpdD9lZIm18jX1qZHwkfB/
J+69kdFfAkJ2V0I7o5TpdoC8xPfhkDQReRsuy/hnj3cr/Mb4uX0=
=klm6
-----END PGP SIGNATURE-----

--OpoW+8ODgSOojoM3--
