Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B509356943F
	for <lists+openbmc@lfdr.de>; Wed,  6 Jul 2022 23:22:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdXYf4XXVz3c3B
	for <lists+openbmc@lfdr.de>; Thu,  7 Jul 2022 07:22:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=I6DkDmx2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=I6DkDmx2;
	dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdXYF2MSjz3bd3
	for <openbmc@lists.ozlabs.org>; Thu,  7 Jul 2022 07:21:52 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id ay16so29220383ejb.6
        for <openbmc@lists.ozlabs.org>; Wed, 06 Jul 2022 14:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b+jNR09nevXwyZD3QcB2efT/aRwjkNE4wZb+r0B6XwE=;
        b=I6DkDmx26h+CaG/uyqSSoQf0Kpgi3UibjsyI7hR3HtcwlbuXqjSaN373PhsoVA8c/q
         dP48qLIWwvOkDivqhfCZ9qhqTvobqYE1RdzdhZgsY9X6p1WRrO8y8vZlwC4mJguHh3J2
         QVHtybfrf6REnR+cLGEVSkcYhTZoN+EAZzqyp91YnDE2h0AB5urwdz4ZAbag8iGXPhdf
         +G7Qe/WEhy5mYP3bU+JrpZquZQ5DIQOI4BCF/cQ1ezg8Awhq0CRvK74F06s5exP/dLGW
         dhns8DWwOEGwfzBkdzyAULDjp5+Hd43di+1wckPzbttZOsctcdW6qtLlSLhGgc2hRwlB
         lU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b+jNR09nevXwyZD3QcB2efT/aRwjkNE4wZb+r0B6XwE=;
        b=tBUTVpGZAyUc1sj94lJADYhPyuVswuepP9A7dZqhdlcvNqrf0kTX2oEwaniv9xnDeG
         sYPfgufFEhTONe1X7lb/qshXd7lbfkw+Hj3c5t5o+vsvye3RiD8schocE301ZgPS/U1B
         81wSDfqmdn+Ru5Fgtmk1gcchk7eGCVcdxl/1iHx9tjJ68Db9WBsavMQVjpRqqqAgMnt5
         66LSgklVuwjZP7a0AS+KxTtF1IDqUkbq0VoSTeAf1ckpOwzhst/Oaq11f8KRnzTJ8Zpu
         I4C88h8GiWu+BOz2pmfyeolGDPe61p/DGVcyN+ivC/1xkp4xq4MPjgmSo9eEGsQXBhbT
         IvMg==
X-Gm-Message-State: AJIora9QtaJlWrZwZz++InHotbzg8TNm0Wji4PZPnSOdDAKH12NKvk2P
	Oh2v5auSj4GRyGv5ERFK70NVfIEtiYBJRWLKOLlSfQ==
X-Google-Smtp-Source: AGRyM1unmOCSqJ1JoDSIrmquHUHd+3hyWJM/lpJegqaohJgOcShxHgQq8EC+4/uCGtnOiBPC//jVBWUzROPdZlv/7Ms=
X-Received: by 2002:a17:906:cc96:b0:728:baf0:ba03 with SMTP id
 oq22-20020a170906cc9600b00728baf0ba03mr40471193ejb.52.1657142508217; Wed, 06
 Jul 2022 14:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220625050838.1618469-1-davidgow@google.com> <20220625050838.1618469-5-davidgow@google.com>
In-Reply-To: <20220625050838.1618469-5-davidgow@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 6 Jul 2022 17:21:37 -0400
Message-ID: <CAFd5g45www4FZ0BoXN+mbqAJEkub07mM-nfzMtjm4p3q_VSCXw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] nitro_enclaves: test: Use kunit_test_suite() macro
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
Cc: Matt Johnston <matt@codeconstruct.com.au>, Andra Paraschiv <andraprs@amazon.com>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, Greg KH <gregkh@linuxfoundation.org>, Daniel Latypov <dlatypov@google.com>, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, Luis Chamberlain <mcgrof@kernel.org>, linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Jeremy Kerr <jk@codeconstruct.com.au>, Longpeng <longpeng2@huawei.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, openbmc@lists.ozlabs.org, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jun 25, 2022 at 1:10 AM David Gow <davidgow@google.com> wrote:
>
> The kunit_test_suite() macro previously conflicted with module_init,
> making it unsuitable for use in the nitro_enclaves test. Now that it's
> fixed, we can use it instead of a custom call into internal KUnit
> functions to run the test.
>
> As a side-effect, this means that the test results are properly included
> with other suites when built-in. To celebrate, enable the test by
> default when KUNIT_ALL_TESTS is set (and NITRO_ENCLAVES enabled).
>
> The nitro_enclave tests can now be run via kunit_tool with:
>         ./tools/testing/kunit/kunit.py run --arch=x86_64 \
>         --kconfig_add CONFIG_PCI=y --kconfig_add CONFIG_SMP=y \
>         --kconfig_add CONFIG_HOTPLUG_CPU=y \
>         --kconfig_add CONFIG_VIRT_DRIVERS=y \
>         --kconfig_add CONFIG_NITRO_ENCLAVES=y \
>         'ne_misc_dev_test'
>
> (This is a pretty long command, so it may be worth adding a .kunitconfig
> file at some point, instead.)
>
> Reviewed-by: Andra Paraschiv <andraprs@amazon.com>
> Signed-off-by: David Gow <davidgow@google.com>

Acked-by: Brendan Higgins <brendanhiggins@google.com>
