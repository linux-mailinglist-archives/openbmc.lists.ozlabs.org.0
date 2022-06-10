Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3028354D840
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:25:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmGh10HXz3fBh
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:25:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nJO3QDlM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=noname.nuno@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nJO3QDlM;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKWkc5l69z2xZR
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 05:49:28 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id h5so37851242wrb.0
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 12:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=u9muj2CCpJ3bi2OBicnt3vUuhr/462OKXXDNMSoOjkA=;
        b=nJO3QDlMK8Oo8cC2rEDrsS8zHoFWKSvz9V9tp5Slqj6XFK8gGsnauvl4/5a9Zlujsw
         CorVf5dfKaQH6teMfzW+hEHcOqhkKmK+dqKhgaSLIk2OjK2OrHpiPiYlnLwU4fkOG5Z5
         4PmGHwSchAW9lf+n6mIfhoGZyeWAKEIX9r6hS5AcDvGRjX5QHRl7KdZO9iqyazhYBNgz
         7pfLKuBvFnE/1MuQV2//JtuGP6S3TUo035W5eNVrysQCBRxAgc/0GKH+7gd2XMdw+zE2
         BOR2sXaNMk/Pkqsivac6peQf8L0kcC+Xa3RD9v9FKZpipTo6kRu9/aVYFutE3X708T/B
         a27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=u9muj2CCpJ3bi2OBicnt3vUuhr/462OKXXDNMSoOjkA=;
        b=DNk75iEG7+IUjfzOErLpBARbtsasXwPNjn/LFmhpVYwD8RLVcw7WDKGtCDXnFJuMVD
         U8w6iaAVcHeln9VY7OExGYMn/5TGFNUufzHHk6UqnycfRKDMxEuiV+b4oPx+K4ru+ikM
         qYFfU/J3HUhBsG6XFTIVFvygX/S2aXyoPf0H8ThNbJ97uR7gbdOHSny3aujE0leHSgLm
         Jb4YiW1AWcVrCp/eJX5Cd+dlNMZ71gIkFXOzIow+FhXG3yVEIn19CiQe8ZSOULXiznJB
         0cGVNRPpj/TqDB8p4UHDLqDFA1XKBFw5bmtaERu7kNPWUsBhi5Rr2zwAF9kZIJcwJ4Mf
         IE4g==
X-Gm-Message-State: AOAM530wGEWvPAbByo0dsHcIg3zF1yVwJT962+7xIHChdHYSM5dxlsd/
	sAeT1IaUPkoGDW4BnrKu5dA=
X-Google-Smtp-Source: ABdhPJw1wyN/M1WFaQFuP+jX/NGTq2GqnLXXrOE71+r/B9uelliduc7dUH3CHihgz35kd6pD213QmQ==
X-Received: by 2002:adf:d1c6:0:b0:218:51ae:8812 with SMTP id b6-20020adfd1c6000000b0021851ae8812mr21038542wrd.178.1654890565371;
        Fri, 10 Jun 2022 12:49:25 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861? ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
        by smtp.gmail.com with ESMTPSA id g15-20020a05600c4ecf00b0039c4945c753sm4278743wmq.39.2022.06.10.12.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:49:25 -0700 (PDT)
Message-ID: <a67d3d01824db6376c2f15949021db4f2b6173cb.camel@gmail.com>
Subject: Re: [PATCH 06/34] iio: adc: ingenic-adc: explicitly add proper
 header files
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Date: Fri, 10 Jun 2022 21:49:22 +0200
In-Reply-To: <CAHp75VcU-oV4is_y9=oaOx2ugvTEOy53h2wvbd3-Z9_gv5Y=zA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-7-nuno.sa@analog.com>
	 <CAHp75VcU-oV4is_y9=oaOx2ugvTEOy53h2wvbd3-Z9_gv5Y=zA@mail.gmail.com>
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

On Fri, 2022-06-10 at 16:45 +0200, Andy Shevchenko wrote:
> On Fri, Jun 10, 2022 at 10:46 AM Nuno Sá <nuno.sa@analog.com> wrote:
> > 
> > Do not trust the fact that iio.h includes of.h which in turn
> > includes
> > all the headers we are relying on.
> > 
> > The ultimate goal is to actually drop of.h from iio.h.
> 
> ...
> 
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/mutex.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/of.h>
> 
> Ordering (from the context I don't see it's messed up already)
> 

Will double check on v2...

- Nuno Sá
