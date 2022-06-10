Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A779054D83E
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:23:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmFF3mTzz3f8T
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:23:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iWSpr/Kt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=noname.nuno@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iWSpr/Kt;
	dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKWZs3R3kz2yw7
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 05:42:44 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id o10so249971edi.1
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 12:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Y54GLtlH6LdYaPPW/vT7zN8oinpgFewT/Kozy6U1sr8=;
        b=iWSpr/Kt7gr1R9ypw8jSjj+iOo2ix1stq9TO7FQZo6FT8oajeYFmxMX5790+z+QVIw
         C7Ph+qzRUt7nF1vNHdfJ0/2YZ2pZ+XOQ62dOWxjQJtnhLEBN5faftDizO1QR7VcaY1th
         B2gMlUAyrnpPEnSuXIjg0v7ebGj0D7jFND7r5/1yIqLtNPorMEV563M1TGbB6y5QzIzb
         69uRffN14fsfXA3NOeVWJp0NxUn7g4a5ccquY7moBAfqWHgcOt7DGfcfretFbABXDM7C
         mJOIUP9o2bGzA7CZMkUvUUHb0Oaw59fP1sckcKbdvg0t/ddeKFE7FxUbxOVDoWa0tvSp
         3ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Y54GLtlH6LdYaPPW/vT7zN8oinpgFewT/Kozy6U1sr8=;
        b=6Hqk61itJCwc1ZH0M7vU/Zo0bApQi32plgoGWlt6tG6e1Kmgu+U5o5P4zGKDIW0HPE
         EpV+gOrFVXaCNyuTDs6GRvvVYjXOyIDFFwgSz1oXQ+F3qHTPCYOH0lo0U2tP5VF8rTfH
         69c1+VhUODD6QE1CbMplKHbTmUpiGg418oDuIonpwGpoBNYi7s7QsxMZkQ0gYgkvXubh
         XhVq8prXN3BN0YdgE6Jpqrhb8oqLVk7Z7iVpm1w/kNePouvjAj9fsHW8Rx2vwmPXRehE
         o82CqCMKfx5BV9wDi/Fc5Z2xfkUW6AREp7krlHjGfx2yeY1fObySJDR59Hl+mfpSY9Og
         wvDA==
X-Gm-Message-State: AOAM533E09E72HftzeuXrhJf64dkPv2iXKaTrSB9/Py8GjDgeLTc8ljw
	srKi1D1xMP5yCKMFX63e6zo=
X-Google-Smtp-Source: ABdhPJzmp7JEbyf5YC9B40GJWfUYSStWlZjAXDQjdn7K/oR4H50lmJrnbL72tBcPT/obo+EANAlJ1A==
X-Received: by 2002:a05:6402:5c9:b0:420:aac6:257b with SMTP id n9-20020a05640205c900b00420aac6257bmr52750712edx.128.1654890155771;
        Fri, 10 Jun 2022 12:42:35 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861? ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
        by smtp.gmail.com with ESMTPSA id nd28-20020a170907629c00b00706c50870a0sm4261637ejc.194.2022.06.10.12.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:42:35 -0700 (PDT)
Message-ID: <b2260504dce967f3ce8b0bee190ab81464b01f3f.camel@gmail.com>
Subject: Re: [PATCH 25/34] thermal: qcom: qcom-spmi-adc-tm5: convert to IIO
 fwnode API
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Date: Fri, 10 Jun 2022 21:42:33 +0200
In-Reply-To: <CAHp75VdYsPAS_1KZCrWvK5=By020Xxtw_FtogZwJQ=Srajdjbg@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-26-nuno.sa@analog.com>
	 <CAHp75VdYsPAS_1KZCrWvK5=By020Xxtw_FtogZwJQ=Srajdjbg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio <linux-iio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Gross <agross@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gmail.com>,
  Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Thara Gopinath <thara.gopinath@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2022-06-10 at 17:20 +0200, Andy Shevchenko wrote:
> On Fri, Jun 10, 2022 at 10:48 AM Nuno Sá <nuno.sa@analog.com> wrote:
> > 
> > Make usage of the new firmware agnostic API
> > 'devm_of_iio_channel_get_by_name()' to get the IIO channel.
> 
> _of_ ?!
> 

Clearly not :)... Will fix it on v2

- Nuno Sá

