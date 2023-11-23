Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2EF7F95ED
	for <lists+openbmc@lfdr.de>; Sun, 26 Nov 2023 23:51:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=brZod0h3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SdkV558k9z3c03
	for <lists+openbmc@lfdr.de>; Mon, 27 Nov 2023 09:51:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=brZod0h3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbbQ02hC1z3bpp
	for <openbmc@lists.ozlabs.org>; Thu, 23 Nov 2023 22:25:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1700738724; x=1701343524; i=j.neuschaefer@gmx.net;
	bh=LkE5Nuq5cpUfZVO4p3a9aPdP5nVFWe7nwzvBcr5GDNk=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:
	 In-Reply-To;
	b=brZod0h3WdfkBr/ye6CfH0QkzzXnYZa/auLGk7raZHJKQ1Rlkpx1+Bx7bre7I/Wc
	 kZotKA7a4fAL8q/ogBVfgW6s3iz2glxq3sfC1G3lkx2vFXaR+/BbKx3q7Rc4MFWPl
	 E/yROf66+ZnpQYh0ai1s0j+HOkqQjaa7TBQl0UD91RfUehvTKk7BY7AzMd4QLnkpN
	 BNBF5JX2fozDsJj/DEGBRvSSNaNigEywIEPBJRqR1LQpOo2qlY6zV/kkF6MELYd1A
	 i04TZTjHXuMEVWNNdW9NlaOCq2Rk7CPhvCw7zcrMhhti80S1Bel5a1fiwj/Rnc0U2
	 A+gTmeghCTss2IhbHg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.47.44]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHEP-1rY1Ne2r3T-00gsCP; Thu, 23
 Nov 2023 12:11:01 +0100
Date: Thu, 23 Nov 2023 12:10:57 +0100
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 00/17] pinctrl: Convert struct group_desc to use
 struct pingroup
Message-ID: <ZV8zQZyT4Kwom-m_@probook>
References: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ITcYWtdfuDR2w/Y2"
Content-Disposition: inline
In-Reply-To: <20231122164040.2262742-1-andriy.shevchenko@linux.intel.com>
X-Provags-ID: V03:K1:wGI5Xyg60PX5Zi8dLHVTABR+Ax9JUsCqbiZjKL4ncgCtAcMMEAg
 dvO2Gv8Fy9M1TFaBXJaUQ52G9VUbCo0zhirW5WpIJmiSbL4Ad71TGzG5CInLYjx4k0znTxp
 MsYKpvrDvhRcT8VzpTAal6yl9EyYSd4HX/pNnbueeTP18AtDFXhKZ/baUvLS1o0FqHAC39e
 kaH9t9h50tBeo/979hVUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:pNO34pxJSFY=;DVUdTPpkLsmom8l4zXBC6Q9dCMQ
 /UWKm8Upk1DCxLFfp36k2gEoUClXZhPLHIqIU1XSyUzwKkwR5ZtWMPqC1JXEskoTij6iRGdLs
 Vm74Ps1bJDvO5r1/0rsjVzmNzZxbbYGGhNkA45yUwtefaEsirw9ckrQ2422JxW+BxiU/4sJgM
 XaY3rM2ogcZcE8LGjTSQlBTFpj353nNO5GSTqq/UfAiDcfLtNdYR89h+JvNKaC78CAnVXoyG7
 sjafDebEgPTOCN6Zl6jAbXyNUcpxv3JepSc2edFd/Vhva15JjZ4ZeXeDqon8Xybs5Q/U4OAwj
 wSOS0K32p4pu5usWx94vGaersbGoTDfPaDjL9cVNZbIkBVGg+g4l+1r/JCVz6cFN9DMbGn7X3
 +eEewQ156Z1OoWIqEc53KHyNDsTsSmvQS5B5My5LdBljxS02hs/lhT/Z0eOMBK/XMsGVKVe89
 +GKpopJF/Mbi9a6EDKqOjaUtYWt66n1PnOyM8PE4cvygnPTtdleEqLDfHI/BwfTF3dkb2HNwu
 HdJdfcXS8DCUUkVWpKFXSI5i4RSO9J1vAAAqB8NdvS0giH1hy/+Q4GtjPwGtiYfH0ehxJcJv7
 P1I7x23b0BTs1AfxJQTA5j6YBKc4+TXUR5ecvJjVyWH1qrQ9FiaQaPq/F9cbSK2r3LvVsFEbg
 j8iodPy9/CkUDyF0jJvvtj1viZWt31AxcBdty9mohKjzebdWnt7zDWKSwxFAH7iEa1yJJG3gH
 qgAd8B0at7qktyub34bc5zmJgf5Oyv7M8UI9Lrys/WMorLSswHXtFwapsP3gmPYbQwlEXnK13
 X69LPrquK2ekgxhbPRn68Ifu8ZTkP6qFDmMAA7Eh7ug9E5lASC5Y0Ib3ToH7dlwjs1yfOG4+E
 dYuU7kTJpTxwzE09Y8MdAW+L4EttCFJrbQt0VZbIuPM71s4dkOe7a6nqDQQREH8nQGV+YAMyO
 /8P2nw==
X-Mailman-Approved-At: Mon, 27 Nov 2023 09:50:01 +1100
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
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Linus Walleij <linus.walleij@linaro.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>, Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, openbmc@lists.ozlabs.org, Hal Feng <hal.feng@starfivetech.com>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, Ray Jui <rjui@broadcom.com>, Emil Renner Berthing <kernel@esmil.dk>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-gpio@vger.kernel.org, linux-mediatek@lists.infrade
 ad.org, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, Biju Das <biju.das.jz@bp.renesas.com>, linux-arm-kernel@lists.infradead.org, Dong Aisheng <aisheng.dong@nxp.com>, Scott Branden <sbranden@broadcom.com>, Bjorn Andersson <andersson@kernel.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Jianlong Huang <jianlong.huang@starfivetech.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ITcYWtdfuDR2w/Y2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 22, 2023 at 06:35:32PM +0200, Andy Shevchenko wrote:
> The struct group_desc has a lot of duplication with struct pingroup.=20
> Deduplicate that by embeddind the latter in the former and convert
> users.

It is strange to me that struct pingroup was introduced without any
reference to the pre-existing struct group_desc, but it's good to see
them unified at last.

Even better might be to move the definitions next to each other in the
same file, so that anyone who finds one, also finds the other.


Thanks,
Jonathan

>=20
> Linus, assuming everything is fine, I can push this to my tree.
> Or you can apply it (assumming all CIs and people are happy with
> the series).
>=20
> NB. This series contains previously sent patches for Qualcomm and
> Nuovoton. Here the updated version for Qualcomm that splits previous
> patch to two and fixes compilation warnings.
>=20
> NB. The function_desc is in plan to follow the similar deduplication.

--ITcYWtdfuDR2w/Y2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmVfMyAACgkQCDBEmo7z
X9tfixAAghfTTH5Cq8CFefsef3u1AwmB5dL8brGS/xkDMXHN/RwR0sn/Zr/kxANZ
Ko9qr9vnCVoSmNi8MwdIRBGOugPq+ZnD40EXBsBtW0BzwkqH9U3tRMhbpucS7F+7
k+BDoiMeVa7vBNvRQK6XltOa9KRlbppR6wmesPZkzsTJyk/iLCCNTcNBekW8KbQp
HNCfDoQS0m4cpYW66VdUP7hgBleB/Fjn6ttt0udhrEuFFL5hlKLn87dEo43224nm
o/DNGFVXXt9Mn+FxxWhhAx01nvc3TaGlCuLqbPXb8v/cyffRFY9SmRa1aJY21zJN
vr/a+eW7RB5Pi3MAKu8hYEv6nG7Hu/GCN9/hRGpfCv6hat+qyQU0TGRuAmJTKLre
PxlacpHbRhsGZByRg/sT1cfYA17+EMDuWHDIO7Yj06TNSJdZKO4ucPwdC4Q6zjJc
pf+gQDIGOU+A/rLwh0HD4ZH30vavQ5uEj0xJhmsUmL+rb+EY78Xj90sGSXvrpCNE
J/A/1gRjF670OFsRq8+4eMxZ3e5DUx/oNobi5IbAHNnfHh88kjlcYJ1TSBPkvIfR
czTkc3e6E+n1whHAD9XzIdI+QuftgWXoHr2FFozxoH36a01YAM9t1WJX7BvLCS/9
YL9i3b/NVhvojwn71TmOgomDm0aKznw/Q2QtJ9PYINrXbh1pyCU=
=qPNB
-----END PGP SIGNATURE-----

--ITcYWtdfuDR2w/Y2--
