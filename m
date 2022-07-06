Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1635693D9
	for <lists+openbmc@lfdr.de>; Wed,  6 Jul 2022 23:06:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdXCS3CGrz3c34
	for <lists+openbmc@lfdr.de>; Thu,  7 Jul 2022 07:06:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sZqocmz/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sZqocmz/;
	dkim-atps=neutral
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdXC33Smgz3c0g
	for <openbmc@lists.ozlabs.org>; Thu,  7 Jul 2022 07:06:06 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id j22so2883474ejs.2
        for <openbmc@lists.ozlabs.org>; Wed, 06 Jul 2022 14:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3covsTOEQGoLyVnwY5XV95mNRZOh4Tyvakfc5xsujkQ=;
        b=sZqocmz/4Y6K3wsDgmovwFwithWhO/dCbYzuKxivdgc0XQYQdnRdM+AleiWifaYGgT
         hJLwE8XQPN5iuUIPEwm6EfX9vdptcvXJqMqu3iXvNGGQ4jwu+aDh/QV/JNT42IU+BPlQ
         q/IGOXSQOqrfYmN0cOxx06bi8zpmRiUslSCEX6xpoyoXq4jDy49hk3Di8m28bq+56IDc
         dIDtPF2RymL4nU++R7LvJ7LQEj7KWzPzmZgw9bPK8GPKu531YDYJryJO712s/mORW1FT
         Qzg6cTUTJOBSXiu5R27vO112u/mnJpxE9UiYlxl+eMqz9jZMkgbblmttxIEWtB3poDPM
         BtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3covsTOEQGoLyVnwY5XV95mNRZOh4Tyvakfc5xsujkQ=;
        b=3zaQzph/tZEp6hTwBET34VNC56NgO8uqQ7Nm/4oLYQd4YG2u9RmCeLdNa2iZ1PThym
         UxyZB6KLTveVNasuPWQ7ql3WLo9DL/9eY13qlcl8BPzGdYw5VmSZBKypEegvZ2YF2Wu3
         JGaIiUjtRy2KYZtMMl9i8CO1rFFgklvC83jPnvZkatl/PxjI4K72rVHNm7+32QVp0qs/
         wF4j53uND8r1xXK1F7ATxo7xIeU7TVn/Yhn8hUt3uqTeAbcdotS6E6CxDiWYEDQpDxKe
         T5n0XaZbhplmKmRULP1Rr1nzuXSVJiwJRVjile6eAC0/waQrOUNxhdbJoyRz98nL2EN8
         AoJw==
X-Gm-Message-State: AJIora80f+TJG/iiKdoWUA6nioeo5zwETiVuAZTVLOvzOynizHml0dWH
	Lape2xd6ZpUk9rFFqD3VQvhztonGhAPvpAxalmTOzw==
X-Google-Smtp-Source: AGRyM1uWI/PvLqWhv5jXHuhpc/hX5L1uVg66QNyDvRE3wDI2b9gqE97i1K3GG/FkfgwtLBSS6hsAfp1U0XizVDZkO+g=
X-Received: by 2002:a17:907:e8e:b0:72a:ad07:8357 with SMTP id
 ho14-20020a1709070e8e00b0072aad078357mr23742385ejc.338.1657141557573; Wed, 06
 Jul 2022 14:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220625050838.1618469-1-davidgow@google.com> <20220625050838.1618469-2-davidgow@google.com>
In-Reply-To: <20220625050838.1618469-2-davidgow@google.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 6 Jul 2022 17:05:46 -0400
Message-ID: <CAFd5g44w0h-EFfw-1wY=bBu_BbO1xi3Ys6gPoDogthCxrF14Qg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] kunit: unify module and builtin suite definitions
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
Cc: Matt Johnston <matt@codeconstruct.com.au>, Andra Paraschiv <andraprs@amazon.com>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, Greg KH <gregkh@linuxfoundation.org>, Daniel Latypov <dlatypov@google.com>, linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, Luis Chamberlain <mcgrof@kernel.org>, linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Jeremy Kerr <jk@codeconstruct.com.au>, Longpeng <longpeng2@huawei.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, openbmc@lists.ozlabs.org, linux-modules@vger.kernel.org, kunit-dev@googlegroups.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sat, Jun 25, 2022 at 1:10 AM David Gow <davidgow@google.com> wrote:
>
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
> Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
> Signed-off-by: Daniel Latypov <dlatypov@google.com>
> Signed-off-by: David Gow <davidgow@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
