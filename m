Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6AD5713C1
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 10:00:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhtTg3RYXz3c3x
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 18:00:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D9uRYKok;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D9uRYKok;
	dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhtTF1PdYz3by0
	for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 18:00:00 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id n18so10896321lfq.1
        for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 00:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S+qr/rB1qp3jjME/ZnJzZQtFse2L01G1JMoWBlVLSGU=;
        b=D9uRYKokFim4JLJO9gvLlORuIh6vcIUQJfDCoZKNyWB35esEUVUh/49prmxrSVqZwV
         3KQ1TeNXyy/4v9rfTGx1At0tvDe26KiAp4lF+NNjE0yzw2mg2iHXSmNUVLtGn/ZiOTs9
         ROTw/puBgp1n1TEeFXFQWpIUSiW/kG7hjZjmTHNq7uU8AuMMyDsB5wclUERNySepNxP/
         +xEhyP0MKwMwQLBTEIjajP4XfENyyWToPSpmEMm19FCMtste/xtaECL+wPeUbUu/sFXt
         Z3h+62Qa9RN2XgHk2DQ6ceN8TshvjagwtjpSHeauWhdI3v4m9FW6jPd3dqs4vCMo3csa
         hBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S+qr/rB1qp3jjME/ZnJzZQtFse2L01G1JMoWBlVLSGU=;
        b=Mx3ya1okRMTnZxSgH22DysI2kmUUkDX2uiMm/pISkEMRNOr4woeutdulLwXqKlcmJN
         UvqMBxfo8f6cCP2i63SrC9oxJgYTHgZi7EzM+vO6mETlfirUe2rKFtQdMDQW+I/pD8tm
         0A3OnVQjuKe7omG+P5gP8XNkXxng3zzlwi3weFOCPmqRpHkYlZ37I6tlqXnS3IJs2qGm
         6bZqWf2hUZ3wXHpYegg7bAsotrYgVUqP7JXzXgPFG9/MW1x9Bd9yH14fv62V9bg3TzAo
         K49KkpN39ybQUhMJpZ3erwScz2myD+JrcJddS8lTaeYKrE2zCNFTNTtajbb34CjFpRXR
         QHPQ==
X-Gm-Message-State: AJIora/MvSuwezM/CpPN0uDP8nBx+OcPnpXdAXcI5CTXqjoODgLudpDU
	srg4ncXeQQmuggzDOi45gspLhqHiAqNhOlmR/XE=
X-Google-Smtp-Source: AGRyM1shi6v9DXsk4lwIdb0yjkJzIJOV8Bqm/mWXus8sJ5A9abScTn9/Us6KGjW2cBxKfXtDm7lOkhAKt2bBzLjAPho=
X-Received: by 2002:a05:6512:324a:b0:486:a915:7b70 with SMTP id
 c10-20020a056512324a00b00486a9157b70mr12988761lfr.265.1657612795528; Tue, 12
 Jul 2022 00:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220711134312.234268-1-tmaimon77@gmail.com> <20220711134312.234268-3-tmaimon77@gmail.com>
 <CAHp75VdXsiH9ityqopznRpjxvwOboS_Zbi9iO6nRZ03TuKxTtg@mail.gmail.com> <CAHp75VeCPRVUMHYdNWgPja2eWeStokRDSogW-7ALz10_yEaDMA@mail.gmail.com>
In-Reply-To: <CAHp75VeCPRVUMHYdNWgPja2eWeStokRDSogW-7ALz10_yEaDMA@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 12 Jul 2022 10:59:44 +0300
Message-ID: <CAP6Zq1j_-w0n9WTUG99UVTJwsyqY0Zcs294wmA7LuWdiF4KYMA@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] iio: adc: npcm: Add NPCM8XX support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

Hi Andy,

Thanks for your comments, they will be addressed next version.

On Mon, 11 Jul 2022 at 17:16, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Mon, Jul 11, 2022 at 4:14 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Jul 11, 2022 at 3:59 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> ...
>
> > >         struct device *dev = &pdev->dev;
> > > +       const struct of_device_id *match;
>
> > > +       match = of_match_node(npcm_adc_match, pdev->dev.of_node);
> > > +       if (!match || !match->data) {
> > > +               dev_err(dev, "Failed getting npcm_adc_data\n");
> > > +               return -ENODEV;
> > > +       }
> > >
> > > +       info->data = (struct npcm_adc_info *)match->data;
> >
> > Instead of above
> >
> >   info->data = device_get_match_data(dev);
> >   if (!info->data)
>
>
> >     return -ENODEV;
>
> Or
>
>   return dev_err_probe(dev, -EINVAL, "...\n");
>
> if you want that message to be issued.
>
>
> --
> With Best Regards,
> Andy Shevchenko

Best regards,

Tomer
