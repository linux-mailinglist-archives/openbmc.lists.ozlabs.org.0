Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A697C590D3F
	for <lists+openbmc@lfdr.de>; Fri, 12 Aug 2022 10:14:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3xKp4R51z3c17
	for <lists+openbmc@lfdr.de>; Fri, 12 Aug 2022 18:14:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.54; helo=mail-oo1-f54.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3xKR3Wycz2yjC;
	Fri, 12 Aug 2022 18:14:18 +1000 (AEST)
Received: by mail-oo1-f54.google.com with SMTP id z23-20020a4ad1b7000000b0044931ffdcafso65605oor.4;
        Fri, 12 Aug 2022 01:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=Nfjn6VbuIp0pl/q9REwTChp9DU/5iKx5Kue3uNgaktM=;
        b=llCpkHSTM8csuMSoTjSNtASynkWFqOR4AznRFyryNZYquEc724P23msWfPTzvdTUZg
         X4YLW+dhgRaZ+4xAx0/F2vIZQT46690BPlBqdfaU0IuY9v7685gGov3K+hnisf4Xk3HP
         7yYPwXw7jifSeeRn/ZgKf/yo8YdFsnmOpNZGjDUuRGF7cQClks+8WR3gV9JeFEq056Wz
         DtdhnKlpQOWH/3y1DGsS+93ec713M0kCxniDAOdmMgG55FrvSRNCpUW6vvz8y8tGHLhm
         2tyIKi2Y8oUuu291Ar9I5hjY0/8dnCC93PZQ85SgffsZm/Zmid96eYi0qCFt090gi9rO
         tEoA==
X-Gm-Message-State: ACgBeo3P9g35lz7VGhjmA+njDYEZZaD9jxn2FNvY34jNQEvi9nJuNl66
	X/bpSAkqcZCYBuPkypn5Hw9T1p2VgjnOZg==
X-Google-Smtp-Source: AA6agR6G/y5dEFRgpTClOJ1AvaK1FNZfrPbwnU+Kx250UbFhrC2hvrppFb8HWjpzMeFIxaKPy8bi0w==
X-Received: by 2002:a4a:e60e:0:b0:448:aea3:3557 with SMTP id f14-20020a4ae60e000000b00448aea33557mr817381oot.50.1660292054818;
        Fri, 12 Aug 2022 01:14:14 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id n36-20020a4a9567000000b00444f26822e5sm246042ooi.10.2022.08.12.01.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 01:14:14 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id h9-20020a9d5549000000b0063727299bb4so100021oti.9;
        Fri, 12 Aug 2022 01:14:14 -0700 (PDT)
X-Received: by 2002:a25:da0b:0:b0:67a:7fb6:8ae with SMTP id
 n11-20020a25da0b000000b0067a7fb608aemr2557291ybf.89.1660291712387; Fri, 12
 Aug 2022 01:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220709032001.819487-1-davidgow@google.com> <20220709032001.819487-2-davidgow@google.com>
 <CAMuHMdUdvGyMFyDSX3cSGDz9x3Q0+z1e0nQB5cB0GFazyPcK3A@mail.gmail.com> <CABVgOSk_Y-eEoqH1xbbXfK5TN3P188JFeuZn3ZgV59Bs3Ds4Hg@mail.gmail.com>
In-Reply-To: <CABVgOSk_Y-eEoqH1xbbXfK5TN3P188JFeuZn3ZgV59Bs3Ds4Hg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Aug 2022 10:08:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW-v7Ovcx8+3XALK_cS8OxODVP5nDVT8n44q_9C=C+C2Q@mail.gmail.com>
Message-ID: <CAMuHMdW-v7Ovcx8+3XALK_cS8OxODVP5nDVT8n44q_9C=C+C2Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] kunit: unify module and builtin suite definitions
To: David Gow <davidgow@google.com>
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

Hi David,

On Thu, Aug 11, 2022 at 6:56 PM David Gow <davidgow@google.com> wrote:
> On Thu, Aug 11, 2022 at 9:49 PM Geert Uytterhoeven <geert@linux-m68k.org>=
 wrote:
> > On Sat, Jul 9, 2022 at 5:21 AM David Gow <davidgow@google.com> wrote:
> > > From: Jeremy Kerr <jk@codeconstruct.com.au>
> > >
> > > Currently, KUnit runs built-in tests and tests loaded from modules
> > > differently. For built-in tests, the kunit_test_suite{,s}() macro add=
s a
> > > list of suites in the .kunit_test_suites linker section. However, for
> > > kernel modules, a module_init() function is used to run the test suit=
es.
> > >
> > > This causes problems if tests are included in a module which already
> > > defines module_init/exit_module functions, as they'll conflict with t=
he
> > > kunit-provided ones.
> > >
> > > This change removes the kunit-defined module inits, and instead parse=
s
> > > the kunit tests from their own section in the module. After module in=
it,
> > > we call __kunit_test_suites_init() on the contents of that section,
> > > which prepares and runs the suite.
> > >
> > > This essentially unifies the module- and non-module kunit init format=
s.
> > >
> > > Tested-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> > > Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> > > Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> > > Signed-off-by: Daniel Latypov <dlatypov@google.com>
> > > Signed-off-by: David Gow <davidgow@google.com>
> >
> > Thanks for your patch, which is now commit 3d6e44623841c8b8 ("kunit:
> > unify module and builtin suite definitions") upstream.
> >
> > Since this commit, modular kunit tests are no longer run at all.
> >
> > Before:
> >
> >     # insmod lib/kunit/kunit.ko
> >     # insmod lib/test_hash.ko
> >     test_hash: loading test module taints kernel.
> >         # Subtest: hash
> >         1..2
> >         ok 1 - test_string_or
> >         ok 2 - test_hash_or
> >     # hash: pass:2 fail:0 skip:0 total:2
> >     # Totals: pass:2 fail:0 skip:0 total:2
> >     ok 1 - hash
> >
> > After:
> >
> >     # insmod lib/kunit/kunit.ko
> >     # insmod lib/test_hash.ko
> >     test_hash: loading test module taints kernel.
> >
> > The actual test code (and test init code, if it exists) is not run.
> >
> > Reverting commits e5857d396f35e59e ("kunit: flatten kunit_suite***
> > to kunit_suite** in .kunit_test_suites") and 3d6e44623841c8b8 ("kunit:
> > unify module and builtin suite definitions") fixes the issue.
>
> Thanks Geert,
>
> This is a known issue. There's a patch to fix it here, which just
> missed the pull request:
> https://patchwork.kernel.org/project/linux-kselftest/patch/20220713005221=
.1926290-1-davidgow@google.com/
>
> We'll try to get it merged as soon as possible.

Thanks for the pointer. I can confirm it fixes the issue, so I provided
my Tb tag.

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
