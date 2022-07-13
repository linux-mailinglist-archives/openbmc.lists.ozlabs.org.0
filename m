Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C7E5733F2
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 12:15:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjYRL03W1z3c3p
	for <lists+openbmc@lfdr.de>; Wed, 13 Jul 2022 20:15:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vs9KktZr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=andy.shevchenko@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vs9KktZr;
	dkim-atps=neutral
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjYQx46Y0z3bmP
	for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 20:15:19 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-2ef5380669cso107247247b3.9
        for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 03:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WYDOSgJ5NnZWQaiNiMMrpM7JfcdIK7GvasjcwWRXaTc=;
        b=Vs9KktZrNStk7Gb+Q53QQHAx25Obv0AT++AQan+rXKOPJKW/9utoZ0luYdqMShPdGo
         +iI663FR/w2xxsIdlbSXYGEQLspqaKb62rucUmZcYSNput22YEEk+T+KnWHIMrP/8Ehm
         w79BD+PzInzZfui+DtnS2hCVsDSRvKjpOrZph+Wp9prdGr370SJCBA7HK6mD0tMLfwNp
         Y+mLiO7nnmGn/UMt6JiEGHa6WgLh4zrlOc0jl6LSJ0JtyPYANk3vSgbPeZOyLszAiv54
         Q7vMpmpCfR3vWaCS/557XKTBeBeVcl0qd4Z5RMBDSg+JKdLfS63boOWifporZ8KOKTg6
         R+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WYDOSgJ5NnZWQaiNiMMrpM7JfcdIK7GvasjcwWRXaTc=;
        b=nv3PFpmMepOrb8tShINM38kgUFOIin78M7Dgx86agonovRRzYT+oZYrCMI3LMPgTWk
         I3ffhz/5dSsduOx/bhin68GFSxlE6TSZwxkfWuwZGCI9R6McjifbOuEySxJxTJaOOkw8
         eTZsMZEI+KJ+M+nekd7KMVjSXNJXpGv5tA6Ojbt/8+9+9mVZbJB4rhT3c8G53PpLsUNf
         g9y3xW751PPFTmWsYLZBjaLMOYUICTd+bE3ukuoU5Ro5qcyXlmMbc45CFmxyuTy3cIJJ
         0haSPt90yv8sdzsJKQ+dv16/HieEhUgVFfUxcFlg1j9YLinokMfE6pMEOsRtqNP2SquC
         clmw==
X-Gm-Message-State: AJIora+EJ6JUw50CmzNwjt6dervSQB0p7/Il/rkaabNo2WA01zrLdRgS
	7Mc3uLv1eAve2hSj3HMBEVgaR98tg/hQtgGwX0Y=
X-Google-Smtp-Source: AGRyM1sQXRfigyKAuelhDXMbGkqWFtkCmYoj5dAwRd8ziMquql5BHqHo/TFXo8YxnVXNKf8I1chgJXedUPi/ksvtqDk=
X-Received: by 2002:a81:8397:0:b0:31c:8a02:3f6d with SMTP id
 t145-20020a818397000000b0031c8a023f6dmr3282416ywf.486.1657707315877; Wed, 13
 Jul 2022 03:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220713070517.172852-1-tmaimon77@gmail.com> <20220713070517.172852-3-tmaimon77@gmail.com>
In-Reply-To: <20220713070517.172852-3-tmaimon77@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Jul 2022 12:14:39 +0200
Message-ID: <CAHp75Vcx_G-b2GHLmNcs1AUOzchOQHbvKhq=2FZJyLdAPWunVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] iio: adc: npcm: Add NPCM8XX support
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

On Wed, Jul 13, 2022 at 9:07 AM Tomer Maimon <tmaimon77@gmail.com> wrote:
>
> Adding ADC NPCM8XX support to NPCM ADC driver.
> ADC NPCM8XX uses a different resolution and voltage reference.
>
> As part of adding NPCM8XX support:
> - Add NPCM8XX specific compatible string.
> - Add data to handle architecture-specific ADC parameters.

...

> +       struct npcm_adc_info *data;

Can it be const?

...

> +       info->data = (struct npcm_adc_info *)device_get_match_data(dev);

...and hence no dropping qualifier is needed here, i.e. remove the casting.

-- 
With Best Regards,
Andy Shevchenko
