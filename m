Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6875958FDB4
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 15:50:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3SqK1k13z30D8
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 23:50:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.170; helo=mail-qk1-f170.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3Spv2Nmtz2xGG;
	Thu, 11 Aug 2022 23:49:42 +1000 (AEST)
Received: by mail-qk1-f170.google.com with SMTP id b2so754435qkh.12;
        Thu, 11 Aug 2022 06:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=ycqVFDjjlSz4BGsRWhX/Rm6K2hCv5ji5U2hZQvy6Esw=;
        b=TY+tNNJK82Ym3MEAaupWCV4og5CNQFdoAIAVahXERxFe0nsMPNrfPymosYAGbYNYBl
         h9nfc3HsX22/6zke7sFZgJIk2N61k5YL1QOzL0vTMYAI46cR7QotweWHKezXwEpmk8Jt
         wAxgpDOj8qkWktUMiX3da+Wn3oaCyOhoQ2lrN7wedAto3uwTZt/AbisIk6Dr4gk4YebR
         sBl/17iEmnkBkCBS03q35zMMHpQBCWjDd+5p5vFN+Xui2y/6ZSSWP0Ky++6rfQHdZ9ba
         mR6fgyH5AdiK/7toHlcx0urKK8vIM7IG5tfgQYKNvLdPIQwpaz9NQdIK6XZ3FHhBQlgC
         xoTA==
X-Gm-Message-State: ACgBeo0zElIiMzjgDrEf3cxthpYvPCK6023ZlmDDeO/c9qsGcpM2pSqO
	E/U6mIfnPMGrlVQXumAAlxcEKjvx9YpJ4rlS
X-Google-Smtp-Source: AA6agR6bIxnzV05GpIAj+LKM3iX2K3P/y/Q8K1mpOmztitQg6qxNxgbqUr1P7Ou/Ur9OIPNskVqCHQ==
X-Received: by 2002:a05:620a:1a87:b0:6b6:d63:cb80 with SMTP id bl7-20020a05620a1a8700b006b60d63cb80mr24072058qkb.575.1660225778945;
        Thu, 11 Aug 2022 06:49:38 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id fz19-20020a05622a5a9300b00342fbe7f3a2sm1677767qtb.70.2022.08.11.06.49.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 06:49:38 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 199so28292004ybl.9;
        Thu, 11 Aug 2022 06:49:38 -0700 (PDT)
X-Received: by 2002:a25:da0b:0:b0:67a:7fb6:8ae with SMTP id
 n11-20020a25da0b000000b0067a7fb608aemr29654576ybf.89.1660225777780; Thu, 11
 Aug 2022 06:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220709032001.819487-1-davidgow@google.com> <20220709032001.819487-2-davidgow@google.com>
In-Reply-To: <20220709032001.819487-2-davidgow@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Aug 2022 15:49:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdvGyMFyDSX3cSGDz9x3Q0+z1e0nQB5cB0GFazyPcK3A@mail.gmail.com>
Message-ID: <CAMuHMdUdvGyMFyDSX3cSGDz9x3Q0+z1e0nQB5cB0GFazyPcK3A@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] kunit: unify module and builtin suite definitions
To: David Gow <davidgow@google.com>, Jeremy Kerr <jk@codeconstruct.com.au>
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
Cc: Matt Johnston <matt@codeconstruct.com.au>, Andra Paraschiv <andraprs@amazon.com>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, Greg KH <gregkh@linuxfoundation.org>, Daniel Latypov <dlatypov@google.com>, USB list <linux-usb@vger.kernel.org>, Brendan Higgins <brendanhiggins@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, Luis Chamberlain <mcgrof@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Linux MMC List <linux-mmc@vger.kernel.org>, Longpeng <longpeng2@huawei.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, openbmc@lists.ozlabs.org, linux-modules@vger.kernel.org, KUnit Development <kunit-dev@googlegroups.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi David, Jeremy,

On Sat, Jul 9, 2022 at 5:21 AM David Gow <davidgow@google.com> wrote:
> From: Jeremy Kerr <jk@codeconstruct.com.au>
>
> Currently, KUnit runs built-in tests and tests loaded from modules
> differently. For built-in tests, the kunit_test_suite{,s}() macro adds a
> list of suites in the .kunit_test_suites linker section. However, for
> kernel modules, a module_init() function is used to run the test suites.
>
> This causes problems if tests are included in a module which already
> defines module_init/exit_module functions, as they'll conflict with the
> kunit-provided ones.
>
> This change removes the kunit-defined module inits, and instead parses
> the kunit tests from their own section in the module. After module init,
> we call __kunit_test_suites_init() on the contents of that section,
> which prepares and runs the suite.
>
> This essentially unifies the module- and non-module kunit init formats.
>
> Tested-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Signed-off-by: Daniel Latypov <dlatypov@google.com>
> Signed-off-by: David Gow <davidgow@google.com>

Thanks for your patch, which is now commit 3d6e44623841c8b8 ("kunit:
unify module and builtin suite definitions") upstream.

Since this commit, modular kunit tests are no longer run at all.

Before:

    # insmod lib/kunit/kunit.ko
    # insmod lib/test_hash.ko
    test_hash: loading test module taints kernel.
        # Subtest: hash
        1..2
        ok 1 - test_string_or
        ok 2 - test_hash_or
    # hash: pass:2 fail:0 skip:0 total:2
    # Totals: pass:2 fail:0 skip:0 total:2
    ok 1 - hash

After:

    # insmod lib/kunit/kunit.ko
    # insmod lib/test_hash.ko
    test_hash: loading test module taints kernel.

The actual test code (and test init code, if it exists) is not run.

Reverting commits e5857d396f35e59e ("kunit: flatten kunit_suite***
to kunit_suite** in .kunit_test_suites") and 3d6e44623841c8b8 ("kunit:
unify module and builtin suite definitions") fixes the issue.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
