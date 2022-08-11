Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8FF59052F
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 18:56:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3Xyb3DxCz3bjX
	for <lists+openbmc@lfdr.de>; Fri, 12 Aug 2022 02:56:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bY6Z46A2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::a2e; helo=mail-vk1-xa2e.google.com; envelope-from=davidgow@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bY6Z46A2;
	dkim-atps=neutral
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3Xy76K0jz2xX6
	for <openbmc@lists.ozlabs.org>; Fri, 12 Aug 2022 02:56:14 +1000 (AEST)
Received: by mail-vk1-xa2e.google.com with SMTP id t64so3230172vkb.12
        for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2022 09:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=G0jqPx9rziCQX4VfMuTReGksQVA2TXCq4FcbporBUUE=;
        b=bY6Z46A2sYDi7bnO93xe0wKNlM2kWwf1rZ8WXR+o0b9U0kcPZQvX/b6U7wJuCkJ0ra
         OtVWeOHzn2C13uh/TAQVBKdSyMwxAlLY5vMkRXrVW0tXv57ai1ksQg9RI5TbRzp4x43d
         Fj94pCnbuUVMLnlRNzV+CFBDUDJq1DUFhFZ+dmA7JCHH1VtL9Pb1qqG4go1GIUX/eEI5
         YJD83lNAz8S4xiiVJOTKCFPgDPPb+huEJLkUpLeFiYvFq7I9xUEE9WIbxNS6s1A3s6E8
         jKZc55buqasK/K1J0cmf7ct7U3d3VMbV/D0iKvTzJkuJegb7KftZAFJI4Io+ZEU5R0qc
         3qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=G0jqPx9rziCQX4VfMuTReGksQVA2TXCq4FcbporBUUE=;
        b=bxDDIZy6N9CIMWfx4Z8L9bMj/HcYsbB2Tyvy1VFNoZo3hDNq73OZpxGY/wBmLtjN9q
         bTKXW8vjf8BePNaYfI57AoLbWtbLfPlbHagbqwua39NH0o9yUFLd5DeS4Kumz1irVPwQ
         ewjqU9cTsw3cLvbFvnJ+z1nx5pq51glWDa5lVK3GkoVGxGmLADW15qjAizOCQYnkgla4
         X2m1pPGHq/IcyLTfZDaUiOI0ufSoBn9pkpTtopgaBUyr4JNJQteRHFuqRfkL2wDogzJM
         iZEV7z+fhz+0YJODK9hFl3UVceGdvlc4g1SlEfXlDVeIN5KgjhBKpzR/NReMKtD8BLxc
         f7Cw==
X-Gm-Message-State: ACgBeo3zrFcH2R2NjE1mgY/9vynZ7NhACYEClcT+Omcnfvhyy4WZ5Qk7
	pDBSRWtFuNn1Q+GkEPSr1slu1QzGbqkafYeKSSSdxQ==
X-Google-Smtp-Source: AA6agR7OdJBDdsv27oJWMCBkG7w1cww7Zf3DnUJ98jysy8HZ/Q85KSrXHjt06FJo0I8HQr0pnWwdZYA6hlRaWORya6g=
X-Received: by 2002:a1f:dac3:0:b0:377:8cb:4544 with SMTP id
 r186-20020a1fdac3000000b0037708cb4544mr12084vkg.7.1660236969573; Thu, 11 Aug
 2022 09:56:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220709032001.819487-1-davidgow@google.com> <20220709032001.819487-2-davidgow@google.com>
 <CAMuHMdUdvGyMFyDSX3cSGDz9x3Q0+z1e0nQB5cB0GFazyPcK3A@mail.gmail.com>
In-Reply-To: <CAMuHMdUdvGyMFyDSX3cSGDz9x3Q0+z1e0nQB5cB0GFazyPcK3A@mail.gmail.com>
From: David Gow <davidgow@google.com>
Date: Fri, 12 Aug 2022 00:55:58 +0800
Message-ID: <CABVgOSk_Y-eEoqH1xbbXfK5TN3P188JFeuZn3ZgV59Bs3Ds4Hg@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] kunit: unify module and builtin suite definitions
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: Linux MMC List <linux-mmc@vger.kernel.org>, Matt Johnston <matt@codeconstruct.com.au>, Andra Paraschiv <andraprs@amazon.com>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>, Greg KH <gregkh@linuxfoundation.org>, Daniel Latypov <dlatypov@google.com>, USB list <linux-usb@vger.kernel.org>, Brendan Higgins <brendanhiggins@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, Luis Chamberlain <mcgrof@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, Jeremy Kerr <jk@codeconstruct.com.au>, Longpeng <longpeng2@huawei.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-modules@vger.kernel.org, KUnit Development <kunit-dev@googlegroups.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 11, 2022 at 9:49 PM Geert Uytterhoeven <geert@linux-m68k.org> w=
rote:
>
> Hi David, Jeremy,
>
> On Sat, Jul 9, 2022 at 5:21 AM David Gow <davidgow@google.com> wrote:
> > From: Jeremy Kerr <jk@codeconstruct.com.au>
> >
> > Currently, KUnit runs built-in tests and tests loaded from modules
> > differently. For built-in tests, the kunit_test_suite{,s}() macro adds =
a
> > list of suites in the .kunit_test_suites linker section. However, for
> > kernel modules, a module_init() function is used to run the test suites=
.
> >
> > This causes problems if tests are included in a module which already
> > defines module_init/exit_module functions, as they'll conflict with the
> > kunit-provided ones.
> >
> > This change removes the kunit-defined module inits, and instead parses
> > the kunit tests from their own section in the module. After module init=
,
> > we call __kunit_test_suites_init() on the contents of that section,
> > which prepares and runs the suite.
> >
> > This essentially unifies the module- and non-module kunit init formats.
> >
> > Tested-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> > Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> > Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> > Signed-off-by: Daniel Latypov <dlatypov@google.com>
> > Signed-off-by: David Gow <davidgow@google.com>
>
> Thanks for your patch, which is now commit 3d6e44623841c8b8 ("kunit:
> unify module and builtin suite definitions") upstream.
>
> Since this commit, modular kunit tests are no longer run at all.
>
> Before:
>
>     # insmod lib/kunit/kunit.ko
>     # insmod lib/test_hash.ko
>     test_hash: loading test module taints kernel.
>         # Subtest: hash
>         1..2
>         ok 1 - test_string_or
>         ok 2 - test_hash_or
>     # hash: pass:2 fail:0 skip:0 total:2
>     # Totals: pass:2 fail:0 skip:0 total:2
>     ok 1 - hash
>
> After:
>
>     # insmod lib/kunit/kunit.ko
>     # insmod lib/test_hash.ko
>     test_hash: loading test module taints kernel.
>
> The actual test code (and test init code, if it exists) is not run.
>
> Reverting commits e5857d396f35e59e ("kunit: flatten kunit_suite***
> to kunit_suite** in .kunit_test_suites") and 3d6e44623841c8b8 ("kunit:
> unify module and builtin suite definitions") fixes the issue.

Thanks Geert,

This is a known issue. There's a patch to fix it here, which just
missed the pull request:
https://patchwork.kernel.org/project/linux-kselftest/patch/20220713005221.1=
926290-1-davidgow@google.com/

We'll try to get it merged as soon as possible.

Cheers,
-- David
