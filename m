Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3066149BB
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 12:47:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1pDK49QGz3cKb
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 22:47:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=rrF+YsPA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=rrF+YsPA;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1pCj2f4Dz2y84
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 22:47:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
	t=1667303193; bh=JJv66pqUZLGSuwjn2/9tXQQ7SlOBgLn8HpmJOkx7aPg=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=rrF+YsPAa3IV99mB0UyIPdZwWMj2a1Sd0W7yTqGVoVzjeF8p5DGkY21ppeA/EkzVP
	 z29N0cxCAoRyzprHerp0+BAqwljinzvwpce1Lg7MiZ1vJP9Rk37TF1FM37YSicCAfS
	 GvgTL6gQ03dZbcvlZ7yBfu9G2Pqa+3c3dBIDpjQnOoAxXaDG3pyBZpDwjCpnqOsON/
	 tttbO5e9jyjL7PdPPwFl16q8Z0rlbEb/Ege3qZYNr1RKU8QPTEFjv1UccAXSXyyPJm
	 QUNd8yjya2RYv6Se09sOur3sGcgB1xfB9HItkpVppf5L0QmhhhOtmFsSx9tzaAxVuM
	 R6kxCeq4gnCAQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([95.223.44.31]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1oSIKp2Fsg-00T9OQ; Tue, 01
 Nov 2022 12:46:33 +0100
Date: Tue, 1 Nov 2022 12:46:24 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v3 2/7] clocksource: timer-npcm7xx: Enable timer 1 clock
 before use
Message-ID: <Y2EHEMja1KuhUJda@probook>
References: <20220508194333.2170161-1-j.neuschaefer@gmx.net>
 <20220508194333.2170161-3-j.neuschaefer@gmx.net>
 <0972c833-432d-a850-958f-0d4f482e25a4@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cg4Yx/SYZOk1zL3s"
Content-Disposition: inline
In-Reply-To: <0972c833-432d-a850-958f-0d4f482e25a4@linaro.org>
X-Provags-ID: V03:K1:nQWEA620M0xDRJA3lx//ZeEp2fNJGNFvQyYu7/vR8QZvRV2AKUU
 cSEYUB1J0pIUVc5JeZ2F/CgCHKgi6EA8TJF0TaTBz1hrzvsJrSw+LR/YoClr6L0s9FNay4e
 jrrN+GvUJYPXquSebUUbVnWqeUkfq+nlBn3j/nkhv9R+WufeU26d+h7jEsD8Jp8IBc7qepy
 xhmnYem6U8/Xzz52cQr1A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:K8gGFXdxteQ=;f+EuOcF2T+Nx30Flx0u0xHWGvPw
 zziIdeP5O68bmUXfyk/H2heXB3PcrROiY5DzSCTaX5UPhQs9h5DRdnFWsQwOE7x1K3urzYsTW
 eORz1MN0uvXw2vEBv5nPWyM8NPwQMuBddVXqQQljlpEqE3nnZb1EdY5c7i0lrN3A5aJanrzQU
 L/eBIFF/XdT5gx9TT5Vcmo/VgNbNn2kDYhWYMVzKfp+BrRsq150Ah6hHc0VeeVu+t66TFi5Kh
 q2zMJVvUhjSaom/4uvlJesJTzhkzHCmE9XP+wK0UK1JNXfI8k37bi86NMoptJAuDsHXHUUiP4
 XzgwSuDJObE6H/Uk9ID96wuqTZBAmQzGusKFiATq3ZA1OvCvUvJhpTICJ0BBEidqTmvirMxHE
 PZegy8D9J7Ioajz8NV91MYVk7/cvv7S1q/a1uSxsqtzUBTAjxA9tnm7VQXsDgiuiDeSNfPRXg
 68hV3VYt8emm19JfVjW+z9HRJljWYFGQMgjPucsBj7HDnDgUQTMb3lXOl2pwNhTvYP0VgWsU7
 +w8dzpIddaG+7Cet54hmjAHXscoSb8oyCaI898FGxmAVE6VN5KtQVqa02QlrnwKSbTEh0vm+w
 5/VGC4guFNGSHaBZ9/YUcKA3fPBvzTif8rb10dS11sOMF/wV8ukzx6wDeN1ZJ/4yponjo+1BH
 Qb5/Zzi4B7P+u4oanm1+0zKrRd4lXnTGRDR3TVC/BdtiJyBJIX9TqQch3POA/i6HPB2glmGiK
 y83xB46YjNmmv4Igi1LZQdrpY31k9osWi7f7+a3qsHQ0MLdR8TEgg7q+I2Ek9mhVxaMDc4ykZ
 H+neKgeBt0upoGbGora8TQBDbr8K5YuNoLLEW+s/6cF9Uy2Gv64M/ZGUKWZzE/UaOInC1xLBO
 rcV3DsTsM1EctieH6rybO4oH71kbpNIcoxVuXZ6JraJQIfmRgfhTkY7Bk2Aw+VTd/yALlYiJT
 VAi5nms9oxarNm0kKWwiKfpr8fQ=
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
Cc: devicetree@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Benjamin Fair <benjaminfair@google.com>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>, linux-clk@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Cg4Yx/SYZOk1zL3s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 09, 2022 at 01:37:40PM +0200, Daniel Lezcano wrote:
> On 08/05/2022 21:43, Jonathan Neusch=C3=A4fer wrote:
> > In the WPCM450 SoC, the clocks for each timer can be gated individually.
> > To prevent the timer 1 clock from being gated, enable it explicitly.
> >=20
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > ---
>=20
>=20
> Applied, thanks

Hi, I didn't see this patch in linux-next. May I know where you applied it?

If it got lost somehow, I can also resend it later.


Best regards,
Jonathan

--Cg4Yx/SYZOk1zL3s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmNhBu4ACgkQCDBEmo7z
X9veJBAAzD5hLwhrXHZk7IC3NjXxmXkEvjxqi+k1w8isyz9tr6/ldQGEmQ9m2YJc
Lqw+QYmq2MvpPeEDYzsX+wGq8kjbQmdn5rztX/k5wx2I4MaZEtKmHEl8WlAJ973M
ryvuLYqzsdparwWYam7WdjdhIPBsrtDvlQYtThoCYSSQlDgUgwv1/pfZE2Rh3nXT
KhTmM/eZ0xVh0DT9VzaiVQForAg6mokDB0OdTBf0ZcXTctCTAkHo8Mjr5Yb7iIlZ
lWnM5NG7Nhykn8AbVFOE6dQMIaiPJzwhpYY35APp+5qvPLJcYMc1H8hsDowVXK2c
rwEEhKFOreq8ovc9zjFiQ37QH71Qvv4o1xJ3/1Q0HmF06KiF9zidWopokC8o5pe6
RT1HY+7+D14CHL2+HnF9vjCqhyfZsVUraGBxscolgxoK/q3sfX0tWunle6qM17vc
MjeYmkjnjV5SyQg7TL8/8BKttzYt/wC9mqEtkFzCnHtCtBpGgJJ9QbP8OfCJxZTs
Fw4iww/01aZQSvC1HvBISotocCFDmXejtBjkQCdkbQOQbHI7u78Z/2RTG3DNtq6r
lgi0ZvzjeA47j7XAX+jLm2K4XhnGJnhv+X30z2llNFfPa+fFt3UovL7het7hIXfR
NONeccaOnV9J5M0Y/hPw2cGEi4RwJCjjxIv2/YK3sfnXX2QUPIM=
=g5U2
-----END PGP SIGNATURE-----

--Cg4Yx/SYZOk1zL3s--
