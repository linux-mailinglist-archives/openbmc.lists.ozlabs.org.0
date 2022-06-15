Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E73F54D897
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:45:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmkV41Rnz3dx0
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:45:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qz4+2/j3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112f; helo=mail-yw1-x112f.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=qz4+2/j3;
	dkim-atps=neutral
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNSLK2XbZz2xD4
	for <openbmc@lists.ozlabs.org>; Thu, 16 Jun 2022 00:27:03 +1000 (AEST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-31336535373so63146867b3.2
        for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2022 07:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xMSeDjVBl8Op1MiME+3ol3t5KwHqA10J2T41KnFjWVI=;
        b=qz4+2/j3HuKLbz8sDkEIpH8ZLP9Jo8DhJ+Q2ht5CP+YvOT59Zf+re5Tujl0ZB6ZFPL
         6eIRF/MkMH9d8XYNP4+51SwLnjpzBos7nFmTYB8Ul+O4d2U6PeoLZ7QjQijKEZ8jLm95
         SELWUDdWwSs1Mh2zeOOA3+M0iUdmkybKKFT7IjVpsD5/9ncX5E7fGGraLMKtF7YFOE15
         3ZsziFepyBJtS+OHCqnLHN05xHlLU+0K7/YCV5W8FlGwHDwuOBWTMVvTFAoqv5pVaZxz
         Rpqrs1a41xszHea5Bvl2plED3iCFlGdMsfyTuDfKIA63BBNAp8s43G582spKqlDGmWXf
         4qPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xMSeDjVBl8Op1MiME+3ol3t5KwHqA10J2T41KnFjWVI=;
        b=UfHb8oJ+352u9/Mvw0Khf+mvjM/jus395obEOicrFaA94OHQvKLjUft8oh++clRXgC
         kTBU2TwgYT2fv1T6eLUxMikbnDe7k3qjv0kK/2qjgZkafv6xjSZrKFEUMjuWAhZxrTl5
         lW4nL/FvPk+ZBtP4IIRvphAYFECkeKQVGExj/uZ6wlw4+ibO3SsPWBmlBCZBmQgWhH0O
         9oicab2IWEbbbFFnTV5SeaWootEjsx1yxZUE3fc7YJnfLfo/JQAUmmLVvgdoo8mTbePZ
         opn63jY+B4M/59e+PO/zwos6z+pyibj4nMGBeP50X9LL4huQWki0dU+PZVndQnEGBfVp
         xC3w==
X-Gm-Message-State: AJIora8eoSlkJkoxtTeISL/j9fz84AGRjw4pz6mpvwQ1ftwaNPRmfLcH
	jwO7lTR7TURvFGMmcLqR8Y1+zDdyTP/zcYI8hE+q4Q==
X-Google-Smtp-Source: AGRyM1uf8yFhBnEUo8jDPf5ukxxTZvvQvwcMTtNGMVxYlbJA7mSO+23X9N9/rXSOE+V75SpZAwzwan4QnL+Hc3y01yY=
X-Received: by 2002:a0d:e246:0:b0:30c:5e77:7104 with SMTP id
 l67-20020a0de246000000b0030c5e777104mr12571722ywe.448.1655303218482; Wed, 15
 Jun 2022 07:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220610084545.547700-1-nuno.sa@analog.com> <20220610084545.547700-28-nuno.sa@analog.com>
In-Reply-To: <20220610084545.547700-28-nuno.sa@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jun 2022 16:26:47 +0200
Message-ID: <CACRpkdYVqsEdDDHLSkfJzMDPbPgkVihxa+ukLg1XnoyGghcdoA@mail.gmail.com>
Subject: Re: [PATCH 27/34] iio: adc: ab8500-gpadc: convert to device properties
To: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 16 Jun 2022 12:05:36 +1000
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

On Fri, Jun 10, 2022 at 10:48 AM Nuno S=C3=A1 <nuno.sa@analog.com> wrote:

> Make the conversion to firmware agnostic device properties. As part of
> the conversion the IIO inkern interface 'of_xlate()' is also converted to
> 'fwnode_xlate()'. The goal is to completely drop 'of_xlate' and hence OF
> dependencies from IIO.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
