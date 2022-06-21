Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6B2554009
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 03:26:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSQhv0C9pz3bq2
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 11:26:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=D4OeYr5D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=dlatypov@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=D4OeYr5D;
	dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSLXg4tblz3bkW
	for <openbmc@lists.ozlabs.org>; Wed, 22 Jun 2022 08:19:31 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id sb34so1316839ejc.11
        for <openbmc@lists.ozlabs.org>; Tue, 21 Jun 2022 15:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5TxB5mhSxXbS5+BgbfWYorbl1xw2wo/iBLR21P4z7SQ=;
        b=D4OeYr5DObfkZ5SxU78+21kychVQSbaYxc23HIiBZL/HdobOEgoPwRKlVkqu1qxzwz
         OMerWfBiqhPqNfus9CMllIQSBRuu8B0VSmqLAsRaVcsaJrJJuGEgFuQc3DonJ/KE+aLR
         iLQdIyL/eb6AaFyiD53AvNC7yxOApi+ZRt5U2foiWaMwt0nuJZ+L81yHFaWh5xPh5n/0
         aiU025tdZv1lG2fC0/5QfmsBWN+BZ2R4Q2xd7tyXdDCxKX4vUnvB8uLqyFudoI0U0u6C
         25Mz9INEgtxhNkLP8DYKCeIzC0BrjXWVVeo3stEgIF35rQhqOLf6uwKpnMAvnoEaMeQs
         h+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5TxB5mhSxXbS5+BgbfWYorbl1xw2wo/iBLR21P4z7SQ=;
        b=MUsjRwT62z7fTZOecgYjIURUB0cXfh0eA4YNjNlEV9g7U2fAaJbEKlJThpFg6pZJz+
         PscZ0JSu8YbWOz0kjbjIwfDqTvKK3JopBzQa4gWNFBdKGZdIX0wol3Px2I1kg90Kg9cb
         0EuzuQnJyYSYc6oHDNE3rJaj/0xqVTVaRt4NNElsCkBDJyGYUIwKfUWdm92rMJQI6m+e
         Z6IPMGnfoPgFw83+N+/4w0ru1aCajcQB0OyDSPcMXlU2Et4xuVegeZMExZBpd30zvvs6
         McpcRZrN+Wv7wflwfLh0VSVHQ3x3jWxSyC8cBUosuIgDHNnFxfLSr06MOsJyEVmnFBq5
         XJ2g==
X-Gm-Message-State: AJIora+ZfYsHheUYzB+kNBn8c0qD8Ft351B1oPUcnTmC5L7GcwSp93J4
	uWAN0i25KRX2eh8jIymi/lEqHNOaCeAt2cf/LrvijA==
X-Google-Smtp-Source: AGRyM1vVeJpl5YmahMIBRWKENGAY/5q7qFCUrgPBVWAl++5JmH2yrju9aDpjPk6EPGCreQdfMELmoUi+rubgGYVlS7Q=
X-Received: by 2002:a17:906:728a:b0:715:2fb5:19f9 with SMTP id
 b10-20020a170906728a00b007152fb519f9mr270868ejl.170.1655849962024; Tue, 21
 Jun 2022 15:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220621085345.603820-1-davidgow@google.com> <20220621085345.603820-6-davidgow@google.com>
In-Reply-To: <20220621085345.603820-6-davidgow@google.com>
From: Daniel Latypov <dlatypov@google.com>
Date: Tue, 21 Jun 2022 15:19:10 -0700
Message-ID: <CAGS_qxp6ZK9K0Sy1JcuU-SGqChOyr6-+5HDxgesOpxjxvDkiXQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] mmc: sdhci-of-aspeed: test: Use kunit_test_suite() macro
To: David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 22 Jun 2022 11:24:09 +1000
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
Cc: Matt Johnston <matt@codeconstruct.com.au>, Andra Paraschiv <andraprs@amazon.com>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, linux-mmc@vger.kernel.org, linux-usb@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Luis Chamberlain <mcgrof@kernel.org>, linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Jeremy Kerr <jk@codeconstruct.com.au>, Longpeng <longpeng2@huawei.com>, kunit-dev@googlegroups.com, Mika Westerberg <mika.westerberg@linux.intel.com>, openbmc@lists.ozlabs.org, linux-modules@vger.kernel.org, Paraschiv@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

 On Tue, Jun 21, 2022 at 1:54 AM David Gow <davidgow@google.com> wrote:
>
> The kunit_test_suite() macro is no-longer incompatible with module_add,
> so its use can be reinstated.
>
> Since this fixes parsing with builtins and kunit_tool, also enable the
> test by default when KUNIT_ALL_TESTS is enabled.
>
> The test can now be run via kunit_tool with:
>         ./tools/testing/kunit/kunit.py run --arch=x86_64 \
>         --kconfig_add CONFIG_OF=y --kconfig_add CONFIG_OF_ADDRESS=y \
>         --kconfig_add CONFIG_MMC=y --kconfig_add CONFIG_MMC_SDHCI=y \
>         --kconfig_add CONFIG_MMC_SDHCI_PLTFM=y \
>         --kconfig_add CONFIG_MMC_SDHCI_OF_ASPEED=y \
>         'sdhci-of-aspeed'
>
> (It may be worth adding a .kunitconfig at some point, as there are
> enough dependencies to make that command scarily long.)
>
> Signed-off-by: David Gow <davidgow@google.com>

Acked-by: Daniel Latypov <dlatypov@google.com>

Minor, optional suggestion below.

>  static int __init aspeed_sdc_init(void)
> @@ -639,12 +620,6 @@ static int __init aspeed_sdc_init(void)
>         if (rc < 0)
>                 goto cleanup_sdhci;
>
> -       rc = aspeed_sdc_tests_init();
> -       if (rc < 0) {
> -               platform_driver_unregister(&aspeed_sdc_driver);
> -               goto cleanup_sdhci;
> -       }
> -
>         return 0;
>
>  cleanup_sdhci:

This goto was added in 4af307f57426 ("mmc: sdhci-of-aspeed: Fix
kunit-related build error") to allow for this extra call to
aspeed_sdc_tests_init().

This could now be reverted back to what is
        rc = platform_driver_register(&aspeed_sdc_driver);
        if (rc < 0)
               platform_driver_unregister(&aspeed_sdhci_driver);

        return rc;

but let's see what the maintainers think.
