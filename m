Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E744B57052E
	for <lists+openbmc@lfdr.de>; Mon, 11 Jul 2022 16:16:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LhQsY5YY7z3c2D
	for <lists+openbmc@lfdr.de>; Tue, 12 Jul 2022 00:16:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cTTCfqGt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=cTTCfqGt;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhQs60TTrz3bnV
	for <openbmc@lists.ozlabs.org>; Tue, 12 Jul 2022 00:15:37 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id 64so8896782ybt.12
        for <openbmc@lists.ozlabs.org>; Mon, 11 Jul 2022 07:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ix4O2cAc2pqsm/yRTiT9kWoGMUxUU7qp/Fyo8plM1cA=;
        b=cTTCfqGtaFGZ+SFT/jhxoT87e5ogtYhnJEcyTzj3Z5lfSxCtnwWBgcmbsRYIUbNXnf
         xJCYCN/yUjcCOmncmokzesQ6DIG2UQSSPGSTxNuqb70SspNU4OpX1+z/OAq74TEH6C3x
         GYmwKK2MYiIcaYOVbTatc0FOTr4ywxMf35H7adirzJ1xISOdUgaqJNermE0R49APbNxZ
         Dn074Zw6NrFCx4tZhYuiBnD+KDbd0oQoVUb9kaeGGUbnsZqPjJOEvjVetObWrN24Va6M
         0EDbTOd+7cASrit+fuTiz/trnizN5kCSn9KXUuEceU++n+lspHoZTrL9A/BgIgAv7iUd
         v9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ix4O2cAc2pqsm/yRTiT9kWoGMUxUU7qp/Fyo8plM1cA=;
        b=DUyTPYDi1WB3SWH7Hzkx+Zqc+pvX9pnX50h0XxZ9z+6YLZ8rJ64H3dgVnFBFOLn6U2
         ogK2eWy0rE2cOGE/eyhJDMxVVqQraz0/T4oMa9LJVskBVqoL9Yp6K2WyayNi7jI4RXO6
         PuLXJBUMzuNeZjIpqPAMCV3nIY/FyPt27Jg2j/8qEmQIwxOXCXU8Wl8tHC/90d6oqscy
         kzvB+nYmSyh0XULQ8aBbebGjeSUyLfxnwIpemDsv+pHO/38tucvg87pOnb9V9lLAgs8/
         Dw0jwo6hhgh/epl6p+2hLDbJCrBlQqBimH7Owch4T1EEokqHZWeOoAjHPXDZ6DzT8OY/
         9ICQ==
X-Gm-Message-State: AJIora94YFcopfs6/H+CHs2+Djft6vTHvNH8cViv7uCZw7qDjFg2XoLD
	e0wzDKVLOJ9seiImb+XS2dZ1kSG3XD4wlNOfW7U=
X-Google-Smtp-Source: AGRyM1tf30frz7OHaxUhejV0ZdDHvoYvg/3SFqbAGPPfSS3AwqAvh6ZWqpx45V0zmE6drkU04Pn22xREojWPsQI7t/M=
X-Received: by 2002:a05:6902:10c9:b0:668:e27c:8f7 with SMTP id
 w9-20020a05690210c900b00668e27c08f7mr17313697ybu.128.1657548933686; Mon, 11
 Jul 2022 07:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220711134312.234268-1-tmaimon77@gmail.com> <20220711134312.234268-3-tmaimon77@gmail.com>
In-Reply-To: <20220711134312.234268-3-tmaimon77@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 11 Jul 2022 16:14:57 +0200
Message-ID: <CAHp75VdXsiH9ityqopznRpjxvwOboS_Zbi9iO6nRZ03TuKxTtg@mail.gmail.com>
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

On Mon, Jul 11, 2022 at 3:59 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Adding ADC NPCM8XX support to NPCM ADC driver.
> ADC NPCM8XX uses a different resolution and voltage reference.
>
> As part of adding NPCM8XX support:
> - Add NPCM8XX specific compatible string.
> - Add data to handle architecture-specific ADC parameters.

Good patch, but one change can make it even better!

...

>         struct device *dev = &pdev->dev;
> +       const struct of_device_id *match;
>
>         indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*info));
>         if (!indio_dev)
>                 return -ENOMEM;
>         info = iio_priv(indio_dev);
>
> -       mutex_init(&info->lock);
> +       match = of_match_node(npcm_adc_match, pdev->dev.of_node);
> +       if (!match || !match->data) {
> +               dev_err(dev, "Failed getting npcm_adc_data\n");
> +               return -ENODEV;
> +       }
>
> +       info->data = (struct npcm_adc_info *)match->data;

Instead of above

  info->data = device_get_match_data(dev);
  if (!info->data)
    return -ENODEV;

-- 
With Best Regards,
Andy Shevchenko
