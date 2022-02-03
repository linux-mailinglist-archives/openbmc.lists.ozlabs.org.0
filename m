Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8026D4A8604
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 15:19:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqLPz1F4Hz3bbS
	for <lists+openbmc@lfdr.de>; Fri,  4 Feb 2022 01:19:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FSyeyUgh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c;
 helo=mail-ej1-x62c.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FSyeyUgh; dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqLPb4wCwz30Md
 for <openbmc@lists.ozlabs.org>; Fri,  4 Feb 2022 01:18:41 +1100 (AEDT)
Received: by mail-ej1-x62c.google.com with SMTP id s13so9372676ejy.3
 for <openbmc@lists.ozlabs.org>; Thu, 03 Feb 2022 06:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dhJnZ8FiFenFf/QVcZDF5PExKtMBcbR901XeUZhtQpE=;
 b=FSyeyUghSHrnm3Ukzc9OuvivZXPnQfVk2Lfi1hhAJ5wwsk2d5DBMSvSz6Uho7/7c+/
 9SfCDCqkFqXXx2BW6DSA1Kaeh91bKeVXSnqGl5VywPWALVB3XsD6wBEiAlx1TiRgDkgD
 NoY0LZ8YT/QLoArkyMPRSH0I9mWEvgCgFInoWEssiWzRsR9+L8qsNEfrlJYRUIT2UjEo
 4OgR73RRfI4m8cvmQwWAIBmSKj5s1IrwPWBPm77lCGUks/l4ixqh8TLd69OI2NUpFJou
 3z6KVhmzsP1hd6RO9sM+WABpCJd2TW6hojc2UlWD5Fjidm9FZ6MXllqrT2H3D+6//cZA
 Igdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dhJnZ8FiFenFf/QVcZDF5PExKtMBcbR901XeUZhtQpE=;
 b=rYnPr7cxMMs/jolbGrTGb2irz9He75zE2eHdjbAwW3uri7sQ44gN0FR7iYFvlA441L
 v25AwqG6F/AY9XB+BH3+mwI8Dxz2HEb7QNjGKZ+tH3/IAKbDdy3NUSyD/CCCk9D1kr1c
 kmsv7HjbHJNdrZ7nKK0LuGHVwigvj64TtJBW/uxfJYX2eJT5FGx0Df3L0fdWEb136v2J
 QYeVkzWvx6ypbL4iX/LIiPgq6eskWhvN4RhXue2toIEHxx/aJBvonfe5r/4Y/Qitgppv
 xsvxbbHsqo5u2mQSZFIcrP0O9pRHYeZ8FrKJv5nRUuoWx2YT1cWi86h5N67tyQcI9flS
 oYfQ==
X-Gm-Message-State: AOAM532xlWBgf64273+q3mD2WG4ZTClKC6FtVWiG3m5FUcM5JD6IRuhl
 8lP9tU3e6DQF/juLaKckRbug+jQ2bzd/gmxdNII=
X-Google-Smtp-Source: ABdhPJwuIUg9TosbjJM4Qn4asT3/1NvGEHIVjromCf+JHFUQmLOIEe2LKK64aHHmj3b6N93AX17tBNoTR5JAjEAsAXo=
X-Received: by 2002:a17:906:c14d:: with SMTP id
 dp13mr30033151ejc.132.1643897911125; 
 Thu, 03 Feb 2022 06:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20220203133736.246397-1-j.neuschaefer@gmx.net>
 <20220203133736.246397-2-j.neuschaefer@gmx.net>
In-Reply-To: <20220203133736.246397-2-j.neuschaefer@gmx.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 3 Feb 2022 16:16:56 +0200
Message-ID: <CAHp75VfrygdyjgQJ7iRnGL-CELCQ+6D30r5aWwitCTUJvGVf_g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pinctrl: nuvoton: npcm7xx: Use %zd printk format
 for ARRAY_SIZE()
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: Benjamin Fair <benjaminfair@google.com>, kernel test robot <lkp@intel.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tali Perry <tali.perry1@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 3, 2022 at 3:37 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> When compile-testing on 64-bit architectures, GCC complains about the
> mismatch of types between the %d format specifier and value returned by
> ARRAY_LENGTH(). Use %zd, which is correct everywhere.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 3b588e43ee5c7 ("pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO dri=
ver")
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

...

> -       dev_dbg(npcm->dev, "group size: %d\n", ARRAY_SIZE(npcm7xx_groups)=
);
> +       dev_dbg(npcm->dev, "group size: %zd\n", ARRAY_SIZE(npcm7xx_groups=
));

Dunno how it's slipped away, but the proper specifier is %zu. I guess
that's what I also mentioned in reply to LKP's report.

--=20
With Best Regards,
Andy Shevchenko
