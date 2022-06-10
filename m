Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1BE54D84B
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 04:25:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNmHL1mPLz3f22
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 12:25:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DTARzN9Z;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=noname.nuno@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DTARzN9Z;
	dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKWmp1fsmz3btG
	for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2022 05:51:21 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id gl15so30943ejb.4
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 12:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bNY4bb5ZsDGbijlscX/zWHp76bvVhoKTJQjCK2gLBow=;
        b=DTARzN9ZKxLbpM5DnF604iI8/F/84/wIKw08CbQfw05YnVX88YGW6HVfBxQNHvMu4T
         MLrV3I1t6KM5Qc6HlnyeXHSTGoq8+8DaWtqoRUwsLbX6Mzc8EpX122ha3qRBRoFfEqzN
         Jk0f/3X9FLtgjhjaqJKanWVijWyNNRgDw6pmj5+2xfApIvc2SRAwOjLitceTonJ4eGE1
         a1A9wbvVgJFRqD/0S50YXqjQh+yziCS7x5lzFW9SKapPD3uUc9it44OjhImJd8j2+oZt
         Butz14g0HcCbwqNDkTuGrH/EVS+NkDJB41ZnGmOfym00EegEpO7qNAqhl52gA+RezkJc
         GTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bNY4bb5ZsDGbijlscX/zWHp76bvVhoKTJQjCK2gLBow=;
        b=WaYSZhWJeHpMRlML6msUHD/fGOSYjJMHQt0rN1eDhXSpKmx+X/CGVyEZ3rWgJFdgo5
         WQGwVWfNpCsJsAIKvkdqccXKth/XMikKR4Vfkfk1vw7KNhElLJWzVYbIEoRc1oOO/zug
         bALoItyHYZhA1bQbixJ83XhIDTyEjZoz+F3tFSxxpsv9VT7c7Vk8ZIkTL+cQKAN4Sxjj
         8qUe5fOLh3x2XHkUX7CexMnofh55FZG6qjEYuOsXC5DLE6BPyJr6Iw/D9n1POhvoLmS5
         POxWryytUUtipbO+0mtmNNXtHkV4rSUagi2iMDOceRZrsx0HCThCmNx+a7jxiDfBuaty
         uEeg==
X-Gm-Message-State: AOAM532lT+OUgkQYyLDMLcZfpHKumy2UmKWIxhhXMlLtC5nY4W1jS/bV
	4+gG6WUbMCG/qizXkZiZvw0=
X-Google-Smtp-Source: ABdhPJxHRykgXinV3uoaEPm9Ud4a9M4gnh2v3qf5U98udrI7NhTVLe93fDw1Gnx05NF5PsnFjGIIwQ==
X-Received: by 2002:a17:906:51d6:b0:712:c9:8a1b with SMTP id v22-20020a17090651d600b0071200c98a1bmr10665567ejk.656.1654890677793;
        Fri, 10 Jun 2022 12:51:17 -0700 (PDT)
Received: from ?IPv6:2001:a61:136e:3c01:8bd4:cf6f:76f1:a861? ([2001:a61:136e:3c01:8bd4:cf6f:76f1:a861])
        by smtp.gmail.com with ESMTPSA id ck16-20020a170906c45000b006feb20b5235sm12715703ejb.84.2022.06.10.12.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 12:51:17 -0700 (PDT)
Message-ID: <d083dd2c7e9e6eefb32124648a06799a9ebe8dfd.camel@gmail.com>
Subject: Re: [PATCH 34/34] iio: inkern: fix coding style warnings
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Joe Simmons-Talbott <joetalbott@gmail.com>, Nuno =?ISO-8859-1?Q?S=E1?=
	 <nuno.sa@analog.com>
Date: Fri, 10 Jun 2022 21:51:15 +0200
In-Reply-To: <YqNo6U8r80aNFzUr@spruce>
References: <20220610084545.547700-1-nuno.sa@analog.com>
	 <20220610084545.547700-35-nuno.sa@analog.com> <YqNo6U8r80aNFzUr@spruce>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Tomer Maimon <tmaimon77@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Miquel Raynal <miquel.raynal@bootlin.com>, Guenter Roeck <groeck@chromium.org>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org, Jishnu Prakash <quic_jprakash@quicinc.com>, Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Andy Gross <agross@kernel.org>, linux-imx@nxp.com, Olivier Moysan <olivier.moysan@foss.st.com>, Zhang Rui <rui.zhang@intel.com>, Christophe Branchereau <cbranchereau@gmail.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, Eugen Hristev <eugen.hristev@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, Gwendal Grignou <gwendal@chromium.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Benson Leung <bleung@chromium.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, linux-mips@vger.kernel.org, Thara Gopinath <thara.gopinath@linaro.org>, linux-renesas-soc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Cai Huoqing <cai.huoqing@linux.dev>, Shawn Guo <shawnguo@
 kernel.org>, Claudiu Beznea <claudiu.beznea@microchip

.com>, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2022-06-10 at 11:53 -0400, Joe Simmons-Talbott wrote:
> On Fri, Jun 10, 2022 at 10:45:45AM +0200, Nuno Sá wrote:
> > Just cosmetics. No functional change intended...
> > 
> > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > ---
> >  drivers/iio/inkern.c | 64 ++++++++++++++++++++++------------------
> > ----
> >  1 file changed, 32 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
> > index 7eb536560ded..526519cefcb9 100644
> > --- a/drivers/iio/inkern.c
> > +++ b/drivers/iio/inkern.c
> > @@ -45,13 +45,13 @@ int iio_map_array_register(struct iio_dev
> > *indio_dev, struct iio_map *maps)
> >         int i = 0, ret = 0;
> >         struct iio_map_internal *mapi;
> >  
> > -       if (maps == NULL)
> > +       if (!maps)
> >                 return 0;
> >  
> >         mutex_lock(&iio_map_list_lock);
> > -       while (maps[i].consumer_dev_name != NULL) {
> > +       while (!maps[i].consumer_dev_name) {
> 
> Shouldn't this be?:
> while (maps[i].consumer_dev_name) {
> 

Ups... Nice catch! I was probably in bot mode already.

- Nuno Sá

