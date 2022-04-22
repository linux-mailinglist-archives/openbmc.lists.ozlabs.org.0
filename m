Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5833050B833
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 15:17:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlFLW1MnWz3bcp
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 23:17:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 277 seconds by postgrey-1.36 at boromir;
 Fri, 22 Apr 2022 23:16:49 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlFL93z1Wz3bWx
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 23:16:49 +1000 (AEST)
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1My3In-1o6r342ss3-00zYMv for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022
 15:16:45 +0200
Received: by mail-wm1-f48.google.com with SMTP id q20so5087385wmq.1
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2022 06:16:45 -0700 (PDT)
X-Gm-Message-State: AOAM530ZkQOZ8JQHlufD+gTcB7i4ZN4xCia8bYbtIy8YD/rBc8t34I2i
 oCcssNGyvV//R8xqjbpkevpv8S05g4xMKsfZQKo=
X-Google-Smtp-Source: ABdhPJxeDeGlM4KsxTL2fJVmPu/+29E0jbGm2nSe2StzLYwh7apsoD80pUq0biSCyqwgmsTxzw01zlCwk3xa5LHZS6k=
X-Received: by 2002:a7b:ce15:0:b0:38e:b7b0:79be with SMTP id
 m21-20020a7bce15000000b0038eb7b079bemr4115953wmc.71.1650633404925; Fri, 22
 Apr 2022 06:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220421192132.109954-1-nick.hawkins@hpe.com>
 <20220421192132.109954-5-nick.hawkins@hpe.com>
In-Reply-To: <20220421192132.109954-5-nick.hawkins@hpe.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 22 Apr 2022 15:16:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0nQ1BrtfBJ7sUSaLkA=pbVwx83bEUpZczvLOSOHDR=dw@mail.gmail.com>
Message-ID: <CAK8P3a0nQ1BrtfBJ7sUSaLkA=pbVwx83bEUpZczvLOSOHDR=dw@mail.gmail.com>
Subject: Re: [PATCH v5 04/11] clocksource/drivers: Add HPE GXP timer
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6UwPfuWBlAjYSog27gYW3DmOyQdhY95+21c2/ts9FQSQIgv7dZV
 y+f46GgBOCK9/y3GiXZ8Xzn0nQJ0+gDTVvWREUzHulq6X/8PXcO6Lm5EMUeT4NhHhuRBAw5
 CJAWinBHneplsIYlvnrzG/0ljia8Ziutmn0fpXLinjl7Uo7KpT3xCcLBZ4daKTITeSdksoy
 MlwTjBWoxf4osBSUfA4zQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6nX7y64ttB0=:jPba3uPo2CVfNhPA130AmI
 FxImrWStwcqsJ/Cck0gP/QE3afW66XzPZYGoNHc+jH5mFDbMqQQcIEswKZT8tjeyiAAo6xAPF
 7ZSG66bahtjbGgthC88cjkC7dqj93x5cYvMpgm3w61VF41AowHTZgmDXeNMXPn9x9cqgz5M5Y
 z09xMpuR7rksS7xGrDCSnIb7vDdX7Lee+tlk+Pk+72kwjieherxdKY9XqjSe4T2tfZjDvMDdW
 0IRk5PCpgog82knUKhiSu+vFkNTlZKJgFuzCAiBXHJnpw8P7Aen7El6PBDISm182ePMyYxt5w
 FfaqUxycRJez3basL4RUAVpX6qHK4h9yEEFa+rMa0Z4yOzVzhIu1aXZUSSywLo8m1jrZw8cW0
 bsi4tthMEbDktSMjhzAOX6nkxsARZ7jQJLNTZJX0ViPmX2A8WtWE7Q0ClWPW0EGOaLnSAGxg9
 CfOZjZO5oOof6QUuMmmWusllPD/norv3ckS4PQxiMjwXstcbrRYX6zrSSYB6L62xJSDIQ6WMC
 5InH4RrKCQ9nn++lpcOG2FlM9nlUfYIJQeVMVd9ogXoIaMAnbEM12jwh3fDKg3d2Fev9m4luI
 kUmFJZzB0hh6Sen1RvQ4jnkjzH5HCTUSkTMeWOrEZcgk+Fs+p29vREn6A/IFIQOOQiY2aqMIJ
 n+5Q0FvxzyoDBDDF769thJoy5g6zN0tUT0PKW4t9Qt2ONpQVEACPH4vavpNLjeYhwKx4lIwTI
 cuN3JRfeeYQViobYDQEDJApCl3QnZ0fZYIay0tJgHXYISub5OrckdaxEWWfNYhdBeV6D0EPo7
 qJTjfNtSCb/yuyF92wBdlCdqLzqbdXWPC2iRL8swRJyoDYYm4I=
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
Cc: Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 "Verdun, Jean-Marie" <verdun@hpe.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Joel Stanley <joel@jms.id.au>, Thomas Gleixner <tglx@linutronix.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 21, 2022 at 9:21 PM <nick.hawkins@hpe.com> wrote:

> +
> +static struct platform_device gxp_watchdog_device = {
> +       .name = "gxp-wdt",
> +       .id = -1,
> +};
> +/*
> + * This probe gets called after the timer is already up and running. This will create
> + * the watchdog device as a child since the registers are shared.
> + */
> +
> +static int gxp_timer_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +
> +       /* Pass the base address (counter) as platform data and nothing else */
> +       gxp_watchdog_device.dev.platform_data = local_gxp_timer->counter;
> +       gxp_watchdog_device.dev.parent = dev;
> +       return platform_device_register(&gxp_watchdog_device);
> +}

I don't understand what this is about: the device should be created from
DT, not defined statically in the code. There are multiple ways of creating
a platform_device from a DT node, or you can allocate one here, but static
definitions are generally a mistake.

I see that you copied this from the ixp4xx driver, so I think we should fix this
there as well.

      Arnd
