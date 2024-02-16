Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE06185AE6F
	for <lists+openbmc@lfdr.de>; Mon, 19 Feb 2024 23:30:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bGr3Hh1A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tdy0Q4qJ4z3dV6
	for <lists+openbmc@lfdr.de>; Tue, 20 Feb 2024 09:30:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bGr3Hh1A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tbpqx338Mz3dWX;
	Fri, 16 Feb 2024 22:00:27 +1100 (AEDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a3dbc8426f3so69500566b.1;
        Fri, 16 Feb 2024 03:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708081220; x=1708686020; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PLhCxXeXfTy0oKV1PZq76pGTpwbsrb7RXVp5Ag35IfA=;
        b=bGr3Hh1AmSU5iVf5IeIAmOLNssLn64RTsRlndNprmjjJRsiGhgQyZLhTVM4nitB2hY
         zrq1DhGfQ7duXm7jFvqp3dODlXmym6ZQ7gpck5vqpp72UjncJccR49bjJg29EEv/hYW6
         m43kFwrMviElYcRRlZpj1WijORAFxVO49dkolpAuFLkle/yyg9CEIj8bv4u5L/zSvMz8
         XonMETOhEpLfgimzDOcBrnYOPmIEqiEfje+F1HKM3sVJmJnMeijM6XwO82VftrFfl44c
         OGAyteXOAOzjU3Qj2/KW9kS4nuKGtx86r+g9DfsAxUrCZE0CvZBVt0wpaqafPcfk85c4
         4d9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708081220; x=1708686020;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLhCxXeXfTy0oKV1PZq76pGTpwbsrb7RXVp5Ag35IfA=;
        b=ETew7elIe8jhArKJLdYEYiLzHo8bQ/6yrtAxL5hA6XcDE333Jt213+kcdGXGPivwGe
         L2/iPdmBZsuITmqr55q+ROB9B+pNSW3WsMromyDl21ju6mYw41wE0cRntyO24HPkl+TM
         E7UpRwYXwUY1uNKyianMGAjjwT2n8aGgLm8keFH5cwUbIzxPvRC4aocjV9XP4dM1O+c9
         qyb0GPTl9QOQT7bJhTsVh1/ZnuiRQZxbcBFxBgnFWSHAW3IlKKMCzKxg9IutgDCfYkuT
         0jvQh0HglbSfXP0YEwNktxsWdXlR0xnbQvov/opWGbYMMEjvDcZ3Zh1YLCjeqJiBOzBq
         sauw==
X-Forwarded-Encrypted: i=1; AJvYcCWBVt4YUwb2dOvtI9JNsIjRzgH6VccNXxBywZehS7RmCJm85PrNJ3BJjsntLHsf5aeySzDvDG+qijxrXhBQEueJxLyznAk3kUa+8XtAl6SGNrY6qTUVpXpayB6+Zh5h0Euk4+9abAil
X-Gm-Message-State: AOJu0Ywz/qhjrp5m+nngNRbRN6MAp8V3gQN5g9nJEwpByjK7RCo68oGN
	8KuQRtVImGO9MLInSfD7kjVFrxI7QUxt1Mnfp+kcu3Nmj1GdwcUe
X-Google-Smtp-Source: AGHT+IGJg1U3l1s0cZ7SNrJJLULfB++IrJsj8RGS0gGWbyw09mvwxmMXattq7dTy3fEu4mQVbz3vaQ==
X-Received: by 2002:a17:906:46da:b0:a3c:f6dc:ea46 with SMTP id k26-20020a17090646da00b00a3cf6dcea46mr3038631ejs.49.1708081220098;
        Fri, 16 Feb 2024 03:00:20 -0800 (PST)
Received: from localhost (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ts4-20020a170907c5c400b00a3df003b6a9sm219235ejc.119.2024.02.16.03.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 03:00:19 -0800 (PST)
Content-Type: multipart/signed;
 boundary=3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 16 Feb 2024 12:00:18 +0100
Message-Id: <CZ6G9AYXMMHZ.3ABQKCJUHPSLU@gmail.com>
Subject: Re: [PATCH 2/6] arm: dts: Fix dtc interrupt_provider warnings
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Rob Herring" <robh@kernel.org>, <soc@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "NXP Linux Team" <linux-imx@nxp.com>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Tsahee Zidenberg" <tsahee@annapurnalabs.com>, "Antoine Tenart"
 <atenart@kernel.org>, "Joel Stanley" <joel@jms.id.au>, "Andrew Jeffery"
 <andrew@codeconstruct.com.au>, "Ray Jui" <rjui@broadcom.com>, "Scott
 Branden" <sbranden@broadcom.com>, "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Gregory Clement" <gregory.clement@bootlin.com>, "Sebastian Hesselbarth"
 <sebastian.hesselbarth@gmail.com>, =?utf-8?q?Jonathan_Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Stefan
 Agner" <stefan@agner.ch>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 =?utf-8?q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, "Tony Lindgren"
 <tony@atomide.com>, "Chanho Min" <chanho.min@lge.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Linus
 Walleij" <linusw@kernel.org>, "Imre Kaloz" <kaloz@openwrt.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nicolas@fjasle.eu>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
 <20240213-arm-dt-cleanups-v1-2-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-2-f2dee1292525@kernel.org>
X-Mailman-Approved-At: Tue, 20 Feb 2024 09:27:24 +1100
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Feb 13, 2024 at 8:34 PM CET, Rob Herring wrote:
[...]
>  arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi      |  1 -
>  arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi           |  1 -
>  arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi          |  1 -
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXPQEMACgkQ3SOs138+
s6F44g/+KPT4RF0vNadKSFIV9/iihK84gvvjHc/8S/+Ks+sJw7//4Zws8JtsGdab
UvvmQ8R5uIrvLpONlnmdl8cjWpnA3OV1VMJRgXeYIR/kKZxuoiZF03R8COiGQvfJ
Cf4mq2od1sc4OOIFxTV0KJfp6XbmI09stW6zm5wk1F5CjbnMD0TTgxQhEAsOLfum
aDJefFKp6T8QOlCQhCeYYnXwUIBdoYs7z+SRXBuJWJvgwdPMnyc4M7/5PtW57UXZ
Vn2Hri2+u9imbcIzSUkrPLev1Kg5sWTF7CSICzmA+jTvHQUAZFQQMyjrGFkFTeI/
g/J4ljpwRqBlhXRx5ioNbGqYmptZvuljjH6bT8hDzTRNPdfvZfKJSX2+wWb5+kM7
/CdKfwORAUgMMqqABa4mSxHys/mmyeLJ2idQj/buql4pC7EpgD7SZRadqnaAkD/S
3zxA6VBVq4Jt+6X3kjgGySa0tUyBMSWydLjH/TTkcZtwu8iEEggp7MxiYA2wJhne
Pf5VjnhX5nLnPJuJn/Av5GHF1jvsrt9lENJTmpLFZIzxhxWrPntynrvfbpAV50e3
eWqEDRu7eWFatZNZTrnRhmOHcGO197HIErp20X4PVISOY0uolzuiHFpjQBCUGQdV
1xaTRZPbjaTB4pcqWNxi+mI4M6jIyDJc6COrC2G9t5GYMcbE6W4=
=HY7z
-----END PGP SIGNATURE-----

--3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b--
