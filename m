Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B21E46F8A1
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 02:42:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9DDK3s8mz3c63
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 12:42:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=dy3rIqlj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dy3rIqlj; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9DCv13VSz3051
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 12:42:00 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id bj13so11337621oib.4
 for <openbmc@lists.ozlabs.org>; Thu, 09 Dec 2021 17:42:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CAEs6TA9o6xsdCdp2MRvi3WB7zMwWYnia8jBx/umBqs=;
 b=dy3rIqlj8uvzBxhcQD03MQEGT9iCSV29dHj5Ey3cpl0BkhBgxHQFcrOPBPvwRGWJEG
 QuDzh4CPlUK4jhFiKS9pADBoO8aOQSbsfXVlQrwqntPpixr7cwuKCaFtcuO1H+991Hid
 8hLR5aHaCEKX/BmOB9p6/8vIgQBjssvCGSYahyUURzmIDe4aqboHjLcYBITJWLZdYxRi
 FRRXvgj5fW8qZCPiyLjsApkXnfGNxKit0nMVPW82luqBaO9Lpq0BYqWYw9xKiIHBLKF7
 5bNF94kSietC/r1t8Ktl4XUouYu6Wokjei8QFCHTQbDMYg/zl6kwJaFEihy2Y9HIUx2d
 kZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CAEs6TA9o6xsdCdp2MRvi3WB7zMwWYnia8jBx/umBqs=;
 b=s+VUgrrSsm1uqLBlysg4GB3wzBTTfcg4DZ0QktsqgXG8L55/+KW1qnFcwZNC5aVVkQ
 EDXMqGpYhUupdxuxjNocdAK8txNtd8vdlI/sjWO6d0JFumIt5XuXceX6krPeY147Gz2o
 KvKVfewBAI0G+LD+P9P8BgNZ/mpO1DV2PgaHfkFqj5B2zeIyL0hUoJAARfShcZ9XI/Ia
 ZOUanvkuE5QNu78nDBHrdkTPBDFSFIjuEtYXeyX8dUn5Lp3tS3JEp55BE22dBTa2ZZDI
 wjI1aUa+LcFXTTr+4hU7QU2xX9rKIDA4Xd2nFcwwteR0tL1MdZUl1Q7hKK8x2UIigitw
 4cGw==
X-Gm-Message-State: AOAM533F3XQGp6u5r91+9e/5x6vvB36WNzy0ESCrHy93UfzOsca7bOx/
 DmX4Y+UMjjO8y/T0XULRSTCeEPmCJxfUrXkP8G4bQQ==
X-Google-Smtp-Source: ABdhPJwBcRbgcZxhHro1YSDmrt7rzHSafyA3nD3aKcE4a+q4d22XA0r2ItBipMJp1FnUniZp6IqKB/rEgM/fmK1Ki1k=
X-Received: by 2002:aca:120f:: with SMTP id 15mr9624499ois.132.1639100517622; 
 Thu, 09 Dec 2021 17:41:57 -0800 (PST)
MIME-Version: 1.0
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
 <20211207210823.1975632-6-j.neuschaefer@gmx.net>
 <CAHp75Vew=M_ofNM5pmeHtTJHXRUbbO4RrtgYAtLBznTBm3CS6Q@mail.gmail.com>
 <YbC6Bv2teZ5CFhFQ@latitude> <20211209082623.GF25091@packtop>
In-Reply-To: <20211209082623.GF25091@packtop>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 10 Dec 2021 02:41:45 +0100
Message-ID: <CACRpkdb_zGz4+8R0=ORCbbbVeJVkLqBG2CDXAzi2VAA7-PPZ6A@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] pinctrl: nuvoton: Add driver for WPCM450
To: zweiss@equinix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 9, 2021 at 9:26 AM Zev Weiss <zweiss@equinix.com> wrote:
> On Wed, Dec 08, 2021 at 05:58:30AM PST, Jonathan Neusch=C3=A4fer wrote:

> >> BIT()
> >
> >I'll use it, but in this case, I think it doesn't simplify much the
> >whole expression all that much. Is there perhaps a macro that
> >constructs a continuous bitmask of N bits, perhaps additionally
> >left-shifted by M bits?
> >
> >Maybe somewhere in the bitmap_* API...
> >
>
> There's GENMASK(), though it takes a high bit and low bit rather than a
> bit position and count, so it'd require a small bit of arithmetic, e.g.
>
>   lastbit =3D gpio->first_irq_bit + gpio->num_irqs - 1;
>   ours =3D GENMASK(lastbit, gpio->first_irq_bit);
>
> or a manual shift:
>
>   ours =3D GENMASK(gpio->num_irqs - 1, 0) << gpio->first_irq_bit;

I think this can be handled with FIELD_PREP() from
<linux/bitfield.h>? Some examples at the top of the
header.

Yours,
Linus Walleij
