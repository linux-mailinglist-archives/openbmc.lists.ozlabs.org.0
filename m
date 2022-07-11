Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BF6570538
	for <lists+openbmc@lfdr.de>; Mon, 11 Jul 2022 16:17:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhQtr3277z3c38
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 00:17:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X0asbNSZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X0asbNSZ;
	dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhQtS6zp9z3bnV
	for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 00:16:48 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id e69so8949810ybh.2
        for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2022 07:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vf+VTyyTWGsnZnHhl+GAHyRGdszNXCGk/WkrL9vpyfI=;
        b=X0asbNSZ/Y7jCOKEBpas/c4n4OwC80T9tb9l/BhDwIDJpeLk0iTbLxlHcXvyemkXSU
         OJC2nqFEO6p9/XMcyD4JBTnH4BLCtqV0Rol9+upzxpISvgbdEUWVeOWm31YoyL4bOj82
         mcgv4yXSZeCV0Y/ks8U0t8DyeDtJ0evxZplTay+u+RbCd1MufmfaA2VLTCAiG94333e7
         dtCNNyGUEd0k58gRIqkDdPIRMR3v2vfZPo711l4OtghEihiQLjPb7PtK5LYelUnO5hFD
         rhueqr7PJ7fqo/L9PZufFXYNU9h/eUX3nxNRYtSbqCpzv66JG96Hzna4Q9UDDxU2LoBu
         IAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vf+VTyyTWGsnZnHhl+GAHyRGdszNXCGk/WkrL9vpyfI=;
        b=PsFEXAeecAvAOps8Y1vlQaYZEjXWRezyxAowLN0r3gXWtknRRmOd1Vn1ox0V8SWiQ+
         puiTyseG0URAk6+GMcZmMXlCot04blHy+Q45ApsK7BdoWsioGhXTZr9UlLXw+qG87RGS
         0M+Lr9EbGy+VSJP9Hbs3+NBK9qmL+x2xCS6C+ykpk3YISjRe4hjF69a2L2a8V1OSgbwP
         +jKvHr042kBdBlG0oAu8QTs4xDLAIxH1DugfM/4BbSgVVgjFU16p1ni/bWkN6SxqL/Im
         z0btAVgXHprjtrnkENkOfqNGMxosJGiz/aegHbDk1SHSTCOvGeWWXmZusplFFGmhIBMF
         QEAA==
X-Gm-Message-State: AJIora+ai1JkbGc4ZaAxHvBfIwXJDtHWSxd4v6FWP9ZIrDUA4T61xkBP
	FrKnlB2n7J++n4HpNm2XmLVxnZaxn+/1iZMZaqs=
X-Google-Smtp-Source: AGRyM1tjs3lX/e7/uuqpiknfoZcI/CSEGGAMIL8sSGkCYSy5OiaTV9RyVK7prX3xacTNgQEQOM7zwicT+muV5R/LniQ=
X-Received: by 2002:a05:6902:10c9:b0:668:e27c:8f7 with SMTP id
 w9-20020a05690210c900b00668e27c08f7mr17319442ybu.128.1657549005246; Mon, 11
 Jul 2022 07:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220711134312.234268-1-tmaimon77@gmail.com> <20220711134312.234268-3-tmaimon77@gmail.com>
 <CAHp75VdXsiH9ityqopznRpjxvwOboS_Zbi9iO6nRZ03TuKxTtg@mail.gmail.com>
In-Reply-To: <CAHp75VdXsiH9ityqopznRpjxvwOboS_Zbi9iO6nRZ03TuKxTtg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 11 Jul 2022 16:16:08 +0200
Message-ID: <CAHp75VeCPRVUMHYdNWgPja2eWeStokRDSogW-7ALz10_yEaDMA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] iio: adc: npcm: Add NPCM8XX support
To: Tomer Maimon <tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree <devicetree@vger.kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-iio <linux-iio@vger.kernel.org>, Tali Perry <tali.perry1@gmail.com>, zhengbin13@huawei.com, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonathan Cameron <jic23@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Jul 11, 2022 at 4:14 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Jul 11, 2022 at 3:59 PM Tomer Maimon <tmaimon77@gmail.com> wrote:

...

> >         struct device *dev = &pdev->dev;
> > +       const struct of_device_id *match;

> > +       match = of_match_node(npcm_adc_match, pdev->dev.of_node);
> > +       if (!match || !match->data) {
> > +               dev_err(dev, "Failed getting npcm_adc_data\n");
> > +               return -ENODEV;
> > +       }
> >
> > +       info->data = (struct npcm_adc_info *)match->data;
>
> Instead of above
>
>   info->data = device_get_match_data(dev);
>   if (!info->data)


>     return -ENODEV;

Or

  return dev_err_probe(dev, -EINVAL, "...\n");

if you want that message to be issued.


-- 
With Best Regards,
Andy Shevchenko
