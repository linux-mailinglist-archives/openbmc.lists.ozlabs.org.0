Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E26055015F
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 02:33:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPxjM1Tbsz3cjF
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 10:33:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hfe7mj1K;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hfe7mj1K;
	dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP2kl5pD0z2yRK
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 23:16:47 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id t1so2149253ybd.2
        for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 06:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=hfe7mj1KZcI8jwu/+nrNcYUQkpbisjdMGB5MdUDVHZURXKTI0fpPSwYzVJTSQIvUQj
         mQ+FkQDUQOvueZPXCdzZ+WEb9CVEmydueaKmiNl4EduEP7G5KldCbqyuT6DrH619ltMs
         SiQd+lbSkJ/2ztzapTtqInm6GdRXCWf5M7sFxt2WgQ72hgoUmjnoNNk2kM6AO8hHEKNE
         9YK5KNalKb6+DMnwTXh0W8DordCVtz41PW0ZjsKXzkeRiewzu8ZSaBVNIEHFdWdQ6ziQ
         lQIpZXEuEWineyu9YQb+gIhoNcGOJyB0hu2Lyui1EO16WO1/xuKLHNgfFYiihKSzkXkW
         MS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=EjYnXNiYVCWC54TJMXxMrmoUG4DyRqgFC6wqfzk4/DpN/oZPKnd72KVMxhutfyaCTH
         RKDaxz6BhrDF20MdXz92/655QSdbu6GfbtQIJZyJZdMJj90lNCHtxnNNF1oTUMBQiZ5n
         k8akC65wVfL5WSCyk0HVTNjYrWYIsCiNQ37CAf1CaWn50iH3ha0gnlorgNOFI40y2iXR
         CqsTw9w98X4FAvjGtMWCDQLO9cqD1zH8fXRni0dn3hKqLgBE3/+Ks/qGvF0xd4Rb+uyG
         xX46e4qHRNJD9/MiowkPiMf1BcQWzRAE6az0i25mvv13VmmvzmA0I8V5GF/fyJQgdotn
         n6FA==
X-Gm-Message-State: AJIora+bme5/7Ofg78mrUYwLiBNLcYiirCZupkfG0PP/X6M7ekTkIAGP
	Uokjc0sTkOHS4PAjcQ/kgZGAFO7OiesIjSlCYjnF7g==
X-Google-Smtp-Source: AGRyM1uSi6CDKxBHFMyZRQ8/7cL0ndy869mFvAGFrCTYZ+gYNuQVO0PO7I97kA8jFrTxg7Fugxfs5Adf3pgP5atidCY=
X-Received: by 2002:a25:2642:0:b0:664:c89e:b059 with SMTP id
 m63-20020a252642000000b00664c89eb059mr5336121ybm.369.1655385405187; Thu, 16
 Jun 2022 06:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-32-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-32-nuno.sa@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jun 2022 15:16:34 +0200
Message-ID: <CACRpkdY4DMPwkxTGdyj31YsS=xCv7vv7Zwp5Awy3aNRgUMZcfw@mail.gmail.com>
Subject: Re: [PATCH 31/34] iio: adc: qcom-spmi-adc5: convert to device properties
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 18 Jun 2022 10:31:55 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>, linux-imx@nxp.com, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gmail.com>, Saravanan Sekar <sravanhome@gmail.com>, Mi
 chael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org, Thara Gopinath <thara.gopinath@linaro.org>, linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.bezne
 a@microchip.com>, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jun 10, 2022 at 10:49 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> Make the conversion to firmware agnostic device properties. As part of
> the conversion the IIO inkern interface 'of_xlate()' is also converted to
> 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
> dependencies from IIO.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
