Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B0554D84D
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:26:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmJq56qvz3f03
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:26:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CwmfAF6X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=noname.nuno@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CwmfAF6X;
	dkim-atps=neutral
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKX8x71nbz3btT
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 06:08:47 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id x6-20020a1c7c06000000b003972dfca96cso163581wmc.4
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 13:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EYdxdXjqZnMfe3vNUEt1qvnu5edzLozRvBmutng2gcs=;
        b=CwmfAF6XHzbKO8jEH1gk+bM/1vpPQGL/FBas2sxdEfvaPOWCrmy31A4DGlV+qRbNLh
         EhE7R/0Apge67rflwIqv8xb8iI3MVz4tH/cjgvlR0njUgo8D/mQ1I7jC3EKVSvYMwwcI
         sbxI1wxllvZ09BnK2w2SbAc5pxLTidgyMANYo96BcCZ/obK1SZsjQnLrn4I8/dPp07XC
         G1yQR1Yy0wNiRGatiMcWPC3BBg8FGpQTCb/lIQdyvipx939yxhZ6fvPdX3cj8ChHvy5k
         k6USF7TyLBfpolWfhPNfaJpv5ZIkxehFF9XkoRvK3oVX5QPgU1PKY2VQfWO+6rp3rB/o
         VRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EYdxdXjqZnMfe3vNUEt1qvnu5edzLozRvBmutng2gcs=;
        b=KyBUZ6fKRhsuFqKHsPoYrI6GwiCnWq7c3nsXHE1ZMg8gGpdoq17e5uTMvEHkxczlvr
         aSOCpMAYm8/TJ+oIBvHG7FWIWSQxeSyxinQHypQRsWhdSBxUiPz1rC3Y0B7fTshSk8jD
         SbyfZOdeZlzdLpqzOvI4oiQIrDxXn9u7RygwV2pE5vJQR9sZnDx+i9kyyMnZ3tIZKKpV
         8bhaWqb494iklIVcj3KlZvte+VtNhOAxTxlLwi8BuIWpz9849wswXxpr1jRuG6+Eytue
         YcZYSNLICkzJFv/EFl9wllVxuW7CaYvcInq31MSDXEA4WB8hI9gI8kOAh/cr0vnVX3UV
         v8KQ==
X-Gm-Message-State: AOAM531p322FmF6k5YcMEDgUNs8iOMgQIJY4kVWFTJUFkKyzxF4uaoHK
	gJ50SC9IaXCqjXD+j48g1Kw=
X-Google-Smtp-Source: ABdhPJzFMI/kZj6Y7ZsIIRkgwHejQ91g4pjv9UVjVQoEdMHpUhK/4CORgOZeBhdrhfbjPGUylvA40Q==
X-Received: by 2002:a1c:f704:0:b0:39c:6684:b375 with SMTP id v4-20020a1cf704000000b0039c6684b375mr1346597wmh.66.1654891724476;
        Fri, 10 Jun 2022 13:08:44 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861? ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
        by smtp.gmail.com with ESMTPSA id e10-20020a5d4e8a000000b00210320d9fbfsm436482wru.18.2022.06.10.13.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 13:08:44 -0700 (PDT)
Message-ID: <ef73aa5801ae1c8078e6a930f22feb6214038176.camel@gmail.com>
Subject: Re: [PATCH 20/34] iio: inkern: only relase the device node when
 done with it
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Date: Fri, 10 Jun 2022 22:08:41 +0200
In-Reply-To: <CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-21-nuno.sa@analog.com>
	 <CAHp75VcdwjTYDF2c-StsL7-pLKtV3vGxinX8+1nJydqB_WNXiA@mail.gmail.com>
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

On Fri, 2022-06-10 at 16:56 +0200, Andy Shevchenko wrote:
> On Fri, Jun 10, 2022 at 10:48 AM Nuno Sá <nuno.sa@analog.com> wrote:
> > 
> > 'of_node_put()' can potentially release the memory pointed to by
> > 'iiospec.np' which would leave us with an invalid pointer (and we
> > would
> > still pass it in 'of_xlate()'). As such, we can only release the
> > node
> > after we are done with it.
> 
> The question you should answer in the commit message is the
> following:
> "Can an OF node, attached to a struct device, be gone before the
> device itself?" If it so, then patch is good, otherwise there is no
> point in this patch in the first place.
> 

Yeah, I might be wrong but from a quick look... yes, I think the node
can be gone before the device. Take a look on the spi or i2c of_notify
handling and you can see that the nodes are get/put on the add/remove
notifcation. Meaning that the node lifespan is not really attached to
the device lifespan. If it was, I would expect to see of_node_put() on
the device release() function...

Again, I might be wrong and I admit I was not sure about including this
patch because it's a very unlikely scenario even though I think, in
theory, a possible one.

- Nuno Sá

