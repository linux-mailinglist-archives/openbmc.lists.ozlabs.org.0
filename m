Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F17354D83F
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:24:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmFy3RNbz3f9g
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:24:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VnmBwWKv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=noname.nuno@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VnmBwWKv;
	dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKWjV0pTtz3btY
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 05:48:29 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id c21so4695227wrb.1
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 12:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Uw42AgxCz2OX29JjZrfK1zeziXwl4MAn7te6Qnb21ik=;
        b=VnmBwWKvliqZ17mqAO3YFUhuijHFVCA0X/6JoDEeNmtQ5fuB2ME76Abp7kguBl57K7
         M9/alivbnhSTovq/B//wCei53pyxQ+HtrJaffG1iGtF9Ndaudu7kcr9ovspAlwBkBSrl
         Qk8wAlB8QCS5xW3y97CMGT7D89Ky4udjBupXK19Q8pH4R+6TZMpKLOBEkE6ub91Xaf7Y
         S7oL2lI6/EzqlSBNis27lv8/Z8dTYnHGhUC0YHRirC4Dqxm1vVmg/6fapPeKzP00VvFU
         tNNMy6jrpva6Bk+UcwypSwoLQSKLiQbVV7FbXXq9G/VEvyzMlVefQmke6B2XscRqIWLl
         voDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Uw42AgxCz2OX29JjZrfK1zeziXwl4MAn7te6Qnb21ik=;
        b=eTonmvVPFzD9nKcnBrn7S6HuGsua3BeHXedbfMG4ffd1rVWpMpKJ4jDs8gk2kjYDJl
         O0/Rv/+4Nv/dN3tGA2kcwt0B55emZFxvZ9YB0HSKZkzVL7Cj9BvF03vg3uTrHb+UuSQC
         5Nwh2SykLOmjpaJXIHh+1OemP7yL/WgZoTFznRBkWOmTBFUg0KO8Rby2ybcaH5R0EgZ3
         BRZbxkPci8IL1/EeBy/Te8ei5S+p2mHVQ2ZdLxOuB5t6e8M5LhpGR+5sK4lvqrVpTycB
         ssRwiQpxCNCrPZd48zAjGZs8vYvVznfkZOTOdZqb5F+xeqpNffzeavUWLdPCBtM1wv+3
         lI+Q==
X-Gm-Message-State: AOAM532/JgCci61bcV+niazg63jTnByum6Atbt1EX+QWvjmYMKkOdW72
	WbDQymq4w/7PGEK0vVdSjGI=
X-Google-Smtp-Source: ABdhPJy5G62/5XmSgGYkKL4gT5Hd/Ethb/qClZrbwW5M3Zb4SLtoP92M/h2fB9W3tywpi7sFv5O92A==
X-Received: by 2002:a5d:5983:0:b0:218:519e:78a5 with SMTP id n3-20020a5d5983000000b00218519e78a5mr20645990wri.718.1654890504947;
        Fri, 10 Jun 2022 12:48:24 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861? ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
        by smtp.gmail.com with ESMTPSA id x3-20020a5d6503000000b002103136623esm257905wru.85.2022.06.10.12.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:48:24 -0700 (PDT)
Message-ID: <25e286370d34419c3fc32a75896d5bfebc4128ea.camel@gmail.com>
Subject: Re: [PATCH 22/34] iio: inkern: only return error codes in
 iio_channel_get_*() APIs
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Date: Fri, 10 Jun 2022 21:48:22 +0200
In-Reply-To: <CAHp75VcPoZ4FKTwDN_F76EZAcWYzAe1CHmuRuaP0wg3BgmPtfA@mail.gmail.com>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-23-nuno.sa@analog.com>
	 <CAHp75VcPoZ4FKTwDN_F76EZAcWYzAe1CHmuRuaP0wg3BgmPtfA@mail.gmail.com>
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

On Fri, 2022-06-10 at 17:05 +0200, Andy Shevchenko wrote:
> On Fri, Jun 10, 2022 at 10:48 AM Nuno Sá <nuno.sa@analog.com> wrote:
> > 
> > APIs like of_iio_channel_get_by_name() and of_iio_channel_get_all()
> > were
> > returning a mix of NULL and error pointers being NULL the way to
> > "notify" that we should do a "system" lookup for channels. This
> > make
> > it very confusing and prone to errors as commit dbbccf7c20bf
> > ("iio: inkern: fix return value in
> > devm_of_iio_channel_get_by_name()")
> > proves. On top of this, patterns like 'if (channel != NULL) return
> > channel'
> > were being used where channel could actually be an error code which
> > makes the code hard to read.
> 
> ...
> 
> >                 np = np->parent;
> >                 if (np && !of_get_property(np, "io-channel-ranges",
> > NULL))
> > -                       return NULL;
> > +                       return chan;
> 
> Shouldn't it return a dedicated error code and not some arbitrary
> one?
> It may be I missed something and chan has a correct error code in
> this
> case...
> 

Since in this case we won't look for channels in the parent device, I'm
just honoring the code returned by 'of_iio_channel_get()'.

> ...
> 
> > +       if (nummaps == 0)       /* return -ENODEV to search map
> > table */
> 
> Comment is superfluous, the next line is self-explaining.
> 

Well, I agree. I just kept as it was on the original code. Can hapilly
remove it if no one objects against it.

> > +               return ERR_PTR(-ENODEV);
> 
> ...
> 
> > -               if (channel != NULL)
> > +               if (!IS_ERR(channel) || PTR_ERR(channel) == -
> > EPROBE_DEFER)
> 
> Btw, in the GPIO library we have a macro or inliner (don't remember)
> that represents such a conditional.
> Perhaps make it (if it's a macro) global, or introduce an inline in
> IIO?
> 
> Okay, it's here:
> https://elixir.bootlin.com/linux/v5.19-rc1/source/drivers/gpio/gpiolib.h#L179
> 
> It's similar, but not the same, so just play with an idea to
> introduce
> something in this file, maybe it's worth doing this, maybe not.
> 

I would also argue that could be something done after this series gets
applied...

- Nuno Sá

