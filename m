Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 070554BA7E7
	for <lists+openbmc@lfdr.de>; Thu, 17 Feb 2022 19:14:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K02zR3GJLz3cVL
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 05:14:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bjgBJHKo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2e;
 helo=mail-qv1-xf2e.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bjgBJHKo; dkim-atps=neutral
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K02z52Fkqz3cGG
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 05:14:24 +1100 (AEDT)
Received: by mail-qv1-xf2e.google.com with SMTP id a28so9887600qvb.10
 for <openbmc@lists.ozlabs.org>; Thu, 17 Feb 2022 10:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K49iyUfP87GUSWjSsQDrw9184z8W1wX9twPD7fJ5DdI=;
 b=bjgBJHKoVTIzjZh3TmK6la8r3vIUyGMNAK24MTaOPb6docls8lRqvD/AFi3e5NyXKK
 TCmevyglQ7g2F+IgIKqpwf2V03nQF7ZYx/2bbI5ANGBUOvEj6r7kkCOaxKMSaJ54VmV4
 zSf1LBF4o4KnEon7TGh3bpCsrjUVq4L8zOoQKnArLV+7gihJNitVkreWa62ch2IcbGsW
 dl4tYq3tA8CN5ZNC9W7eTZy01p0d8u0VSek5TbY+n7krrC5zO2DZNUA7qlTfLzocbpYY
 CIgRnEv1xGZNwHcQ1Ux8m5OCFxxdcd5WoGljDECICzITVLL1o9rX9HB1O2J2XynHQiFg
 Kdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K49iyUfP87GUSWjSsQDrw9184z8W1wX9twPD7fJ5DdI=;
 b=igYATeJCEf2PKOEdSDE6ugSSjTyg8w9ZUR2iko+kz5X8R7w8Eu43FJHt1aloX2s9jb
 abYiRoHZIv87fWGPcin3kQjG/Uui35ExnQRKjnD1KuBsw955KE/ertLGWOgx4Nmw9HIb
 7NY4Bdwu0dRT1+Nz1kUUhvXA5sqZkaGPlrC0pCr5S45CFFGRbwyl8Dk4e3CmSC7GVFXV
 7rXct2wPI7R5xDIgns6vOvgBSWPlOqIPBMGYv44oz3OCONNXSbOS8hEOESRv+uibssSg
 QuU7Dy2wGy02lWECzCG2fbvlGR6fOHTh2qbowAkd/6MrWF/MzkPP2LKrU9Ew1zmTbmrm
 4vTQ==
X-Gm-Message-State: AOAM532tRT2tMM5dUkODooLH0D45MzJbg/5xaZa/SQV/fDh7zX8e8jhH
 sehfr0sQaRoLNNmA2cMlkDA=
X-Google-Smtp-Source: ABdhPJx9Kr9K7CaT4uf99J5p6k4IB7qjpuwkNpxc9I74+w8uJKlDLM85H41UC8A+sKnvawNpUmdEKQ==
X-Received: by 2002:a05:622a:1007:b0:2d6:5ac4:6b78 with SMTP id
 d7-20020a05622a100700b002d65ac46b78mr3534147qte.668.1645121661036; 
 Thu, 17 Feb 2022 10:14:21 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id y5sm20490979qkp.37.2022.02.17.10.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 10:14:20 -0800 (PST)
Message-ID: <5b0b69cf-5688-3679-dd77-49179e0b17bb@roeck-us.net>
Date: Thu, 17 Feb 2022 10:14:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 0/4] misc: Add power-efuse driver
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>
References: <20220217104444.7695-1-zev@bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220217104444.7695-1-zev@bewilderbeest.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, openbmc@lists.ozlabs.org,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/17/22 02:44, Zev Weiss wrote:
> Hello,
> 
> This patch series is another incarnation of some previous efforts [0]
> at enabling userspace access to the OPERATION state (and now status
> flags) of PMBus devices, specifically with respect to efuses
> protecting general-purpose power outputs.  This functionality is an
> important component enabling a port of OpenBMC to the Delta AHE-50DC
> Open19 power shelf [1].
> 
> The first patch extends the pmbus core's regulator support with an
> implementation of the .get_error_flags() operation, mapping PMBus
> status flags to REGULATOR_ERROR_* flags where possible, and the second
> patch adds regulator support for the lm25066 driver.  These two
> patches are essentially independent of the power-efuse driver (and
> each other) and could potentially be applicable individually, but are
> necessary for the power-efuse driver to be useful on the AHE-50DC.
> 

Nevertheless, the first two patches are orthogonal to the remaining
two patches and should be separate.

Guenter

> The third and fourth patches add dt-bindings and the implementation of
> the power-efuse driver, respectively.  The driver is fairly simple; it
> merely provides a sysfs interface to enable, disable, and retrieve
> error flags from an underlying regulator.
> 
> There is one aspect of its usage of the regulator API I'm a bit
> uncertain about, however: this driver seems like a case where an
> exclusive 'get' of the regulator (i.e. devm_regulator_get_exclusive()
> instead of devm_regulator_get() in efuse_probe()) would be
> appropriate, since in the intended usage no other device should be
> using an efuse's regulator.  With an exclusive get though, the
> regulator's use_count and the consumer's enable_count don't balance
> out properly to allow the enable/disable operations to work properly
> (the former ending up one more than the latter, leading to
> enable_count underflows on attempts to disable the regulator).  So at
> least for now it's using a non-exclusive get -- I'd be happy to hear
> any pointers on a way to allow an exclusive get to work here, though.
> 
> 
> Thanks,
> Zev
> 
> [0] https://lore.kernel.org/openbmc/YGLepYLvtlO6Ikzs@hatter.bewilderbeest.net/
> [1] https://www.open19.org/marketplace/delta-16kw-power-shelf/
> 
> Zev Weiss (4):
>    hwmon: (pmbus) Add get_error_flags support to regulator ops
>    hwmon: (pmbus) lm25066: Add regulator support
>    dt-bindings: Add power-efuse binding
>    misc: Add power-efuse driver
> 
>   .../devicetree/bindings/misc/power-efuse.yaml |  37 +++
>   MAINTAINERS                                   |   5 +
>   drivers/hwmon/pmbus/Kconfig                   |   7 +
>   drivers/hwmon/pmbus/lm25066.c                 |  14 ++
>   drivers/hwmon/pmbus/pmbus_core.c              |  97 ++++++++
>   drivers/misc/Kconfig                          |  15 ++
>   drivers/misc/Makefile                         |   1 +
>   drivers/misc/power-efuse.c                    | 221 ++++++++++++++++++
>   8 files changed, 397 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/misc/power-efuse.yaml
>   create mode 100644 drivers/misc/power-efuse.c
> 

