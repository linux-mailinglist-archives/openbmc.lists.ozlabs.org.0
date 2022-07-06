Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC7856944A
	for <lists+openbmc@lfdr.de>; Wed,  6 Jul 2022 23:24:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdXcc5Pvjz3c3S
	for <lists+openbmc@lfdr.de>; Thu,  7 Jul 2022 07:24:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fQNvjxAJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fQNvjxAJ;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdXcG3Z4Qz3bxZ
	for <openbmc@lists.ozlabs.org>; Thu,  7 Jul 2022 07:24:30 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id o25so29218648ejm.3
        for <openbmc@lists.ozlabs.org>; Wed, 06 Jul 2022 14:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+IXn0jI0ldRL7YIjp8QrMhyxAPtVIFHuatfuckvUqnQ=;
        b=fQNvjxAJ1U+/Z5BLvLosjiWEbNpCZr4z3sBkgnVLosoYyjz5Kec9u9Kf+o2d4q/jrl
         zJwnBFX/aQaqwYhjaVXnYTPOA2N2wRNI1ZdXo3LS5c53rJQDBg/01HLlXC+3nnmX1FkL
         MSdhueU1Cby+/ZbGkB6Mdv+e7uPB4fONBcFU7hDeLOqJrh0okawS2UkVcxgAZSr0S41d
         EjuYNIXct/or+FpmV7ItHH0l+xZ+FN4ZCnWFp1FCF0qr6P13rCX9ffwocjeI/nUoEGLH
         Lz9yGwfWbHPhHgAWaHOOnshg+WGNM0O/k+l0h1lGaoviuCLThNi+10/uzCb/6nd4wSY3
         rrjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+IXn0jI0ldRL7YIjp8QrMhyxAPtVIFHuatfuckvUqnQ=;
        b=SZbomE7xtn7VwIE8tTuwRxtU7JboA4DxXFMxbsNDxS7ZwLWh0SSNTlxbKcZ6fcniEI
         wf5qEQAQD/Ijzn1A+wKA7Hg/sdXVvy+tH/civeopLmJpL1yKpBbihc2U9BPUVhMyTHfZ
         UnAsYIxQyyLvJgQsBlDU8QGPMqNpAZs9qe/wRNz6tCpLo8haTVrR4YdfQH5zxznvTFRl
         wRptBtBbkpgWOa8SH3HbV3IpLC4ygBi5OQimLISHMh08AVGDjtYB/AERMYhguaITtdIr
         jQjCDKa20+R8OCU0em7jVr7otdwQe0ItEsz4FfjIRVoLSwiMnc5aUq6RLg93I+Fh8UfG
         Mltw==
X-Gm-Message-State: AJIora+tqfCRy+meUaEgqvGxOQjk4FL9gs4Lp3/VdBJ+VmLLqumu39dY
	vKJtQOlrshtFHsQSJj32pv5TO4E2uVadU5MQh8Nygw==
X-Google-Smtp-Source: AGRyM1sbHYk2Pqpc9qaurG8ACQ+7E+4bfTKqXLTRu9d3ipv8YkEaaHIX9oSlPBTljwJ+/ekeV3QqQO0PmuZmUQvJ4AU=
X-Received: by 2002:a17:907:3f81:b0:6ff:1a3d:9092 with SMTP id
 hr1-20020a1709073f8100b006ff1a3d9092mr41359251ejc.319.1657142667241; Wed, 06
 Jul 2022 14:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220625050838.1618469-1-davidgow@google.com> <20220625050838.1618469-6-davidgow@google.com>
In-Reply-To: <20220625050838.1618469-6-davidgow@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 6 Jul 2022 17:24:16 -0400
Message-ID: <CAFd5g45-SPvFs7JUNEsm=bMbDEZYTA57r0bA6cgRbSGoMz9-uQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] mmc: sdhci-of-aspeed: test: Use kunit_test_suite() macro
To: David Gow <davidgow@google.com>
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
Cc: Matt Johnston <matt@codeconstruct.com.au>, Andra Paraschiv <andraprs@amazon.com>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, Greg KH <gregkh@linuxfoundation.org>, Daniel Latypov <dlatypov@google.com>, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, Luis Chamberlain <mcgrof@kernel.org>, linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Jeremy Kerr <jk@codeconstruct.com.au>, Longpeng <longpeng2@huawei.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, openbmc@lists.ozlabs.org, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jun 25, 2022 at 1:11 AM 'David Gow' via KUnit Development
<kunit-dev@googlegroups.com> wrote:
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
> Acked-by: Daniel Latypov <dlatypov@google.com>
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: David Gow <davidgow@google.com>

Acked-by: Brendan Higgins <brendanhiggins@google.com>
