Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC9D55015C
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 02:33:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPxhg5RGHz3cdW
	for <lists+openbmc@lfdr.de>; Sat, 18 Jun 2022 10:33:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PZJxPerU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PZJxPerU;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP2jx12d6z2yMk
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 23:16:02 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id v81so2182113ybe.0
        for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 06:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=PZJxPerUVnWQ+ZJJXabeQPCvU+odG2XM/cCiTR2s9bg1u+Kq80JX5ApFI/RzXK0+5N
         91YSIyl3oArnIPhPglVuZa3e9yXet958I4d/aO29mbsfdc4wxqC+2Ha3GHxRa7P+C/W0
         /MeUW3hhtK1/8mt84BKomTg927useCl9wQUSKU9FmvhKIMrNLBmnrhUc6Q4NF8cAc8mk
         ISrwiouIgmkW9h2OrdhUIyQlvlxunlAeC03V1t+VlOn4UBEozATF/u6cpGazZNV0c/oJ
         OgqMMNyBlhjXRfOdGukXu/bRFb/aQF/PlDjPiPinMUucqHC6ndgFmuTlQ5RWfPsM5sUQ
         QFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fsun78rWieFnLaLeD83Q2xWjxjOs241/wdwG/0QCsic=;
        b=TmLcU67npcfe0v1QPqHItYaaAhfBmE0ObxDFveh57toweRXsD1X1P057BR0newCUQK
         aBe/ECoHQjXPuRV8V7czcqeuIN8Kd6Z5q2G850JU49eyTrJK5unnTROIDgDnVdLRhYet
         wDmY9/a+RcW2GuE+P80maXWQvNX89mPmIHeDzHEc6gjRQppKwm6jgfsICMK9yKBBY73h
         a8xSepeQxMDJWRHGiZjNHcxG//+dARaJ8cfLTFGi5dZPmxA9Y1njT6W87RN0lisXHwWz
         ku7/DatHIMhd+Nn9ugsS76r2HVWDulvcurlPs5yAek2wVXJhOZdI/+wwLZA+YPM1ka/Z
         2m8g==
X-Gm-Message-State: AJIora9JbLYWnPVWV8dgABIqkOtzzHFxrNpgIfCLcT079zwfnM1kQhEV
	Nv5XMqsR2XVM5bRY2ls10e+XLrSgABtyAOda65LaBg==
X-Google-Smtp-Source: AGRyM1tKpRdJdPfQy0oaslWa7sXFz+A5JxujSmEL8Ch+XWKV8Tm8gJp6YIJusqmVvKOdq2xVRX8SI1z84IJEfDM3b38=
X-Received: by 2002:a25:3417:0:b0:664:aab3:7c44 with SMTP id
 b23-20020a253417000000b00664aab37c44mr5143357yba.533.1655385357716; Thu, 16
 Jun 2022 06:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-31-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-31-nuno.sa@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jun 2022 15:15:46 +0200
Message-ID: <CACRpkdbTkyd0zwXU-7O-n3HejHhY+Vg-QKuSpatZ+O0QPgqbag@mail.gmail.com>
Subject: Re: [PATCH 30/34] iio: adc: qcom-spmi-vadc: convert to device properties
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
