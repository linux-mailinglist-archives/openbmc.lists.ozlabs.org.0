Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D26382838
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 11:23:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkDG85Mfrz304C
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 19:23:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wZE8pBAq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::e2e;
 helo=mail-vs1-xe2e.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wZE8pBAq; dkim-atps=neutral
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com
 [IPv6:2607:f8b0:4864:20::e2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkDFr5CgGz2xZs
 for <openbmc@lists.ozlabs.org>; Mon, 17 May 2021 19:23:27 +1000 (AEST)
Received: by mail-vs1-xe2e.google.com with SMTP id u80so2759391vsc.6
 for <openbmc@lists.ozlabs.org>; Mon, 17 May 2021 02:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kzYVzmT+Y8ce2flyvbSSPdmquvI+WpoScVhmf9xFNfc=;
 b=wZE8pBAqeARtQbwh+YWftfz+pAOAl52rdskfYBROlX2BYGzyiP8jIhVMX2ZLlI/5TN
 2h55vokvcNd9L9wocrsTfFNSZ7mvGTPvyT6ydg0YrjKHLTUBuhbjdOqBt6BcYgzbTu4z
 CJC7/JcgyYbA8qJyYy52Qlnrl5Ks8rBSWSII4TJUN/iauAg9QqBcUXZ3Uc46G84x0Wqi
 7EJaqNos/h447r9ZfuhH/fMb87/SWTIRaTqJufYy20AjL2e6KGye9jf84Rmi4O/7MYAE
 1JPV3hD1j6WJmF5EQD0WwU2Wke0Zt5Bbr1TPruhZr+U9SyoLJj18Xh+kzPIbsZqQnpMc
 7cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kzYVzmT+Y8ce2flyvbSSPdmquvI+WpoScVhmf9xFNfc=;
 b=dhPFhyj2HY1U8dQPhqPVMFIeR38EPqg4C6msldUaqj88uhj3vnYYAWQXjJk8O5ZUhR
 DhDroHmxHsfr/i+oZtJUCmeHl1yrWXPKOmUl13OwUJ9B+cOP/Mh8Q5OsBrXtqJJZ3ox1
 1q4Vsgf+YxScAwvuRM5sUKdZhHUtK6ONI4Gv951zxvSQxJ7QGvVCIZypFHxRF4FjuUVJ
 Kvl9pnhawK2h50jgoyBanX5MMHa0kCeSkpFGeNaXo0MXbyH6T0XbErgY1mKR++yX8VQB
 vragvQG3H48XywwZglkLLClJvsigiOVRvyLtTZdLWhUE2XztKG96JB1F9VnzLk5et6nM
 5pag==
X-Gm-Message-State: AOAM5325UKuMwGKwaCImOFDe/Q5jlsHQGaozZ1w71tKG2CRoskx4jc7d
 QyuVTeO0tY+B48GoBnvyzOmKRgmjS5r+NXXp8rf0Bg==
X-Google-Smtp-Source: ABdhPJyXKhN5EScVDwjR162oOK33ajPAKsDnGAYw4sYWr1DOTQym8W+LchIR8j6ixX6JvWzsFngChaUy9M79BpaoBus=
X-Received: by 2002:a05:6102:7b4:: with SMTP id
 x20mr3923640vsg.48.1621243403858; 
 Mon, 17 May 2021 02:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210513193204.816681-1-davidgow@google.com>
 <20210513193204.816681-6-davidgow@google.com>
In-Reply-To: <20210513193204.816681-6-davidgow@google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 May 2021 11:22:47 +0200
Message-ID: <CAPDyKFoEeRUjHLZ3iSvPT4_0X107G3Xw+ujxJ9zsDk06dTxo7w@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] mmc: sdhci-of-aspeed: Remove some unnecessary
 casts from KUnit tests
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, linux-mmc <linux-mmc@vger.kernel.org>,
 Daniel Latypov <dlatypov@google.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, kunit-dev@googlegroups.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 13 May 2021 at 21:36, David Gow <davidgow@google.com> wrote:
>
> With KUnit's EXPECT macros no longer typechecking arguments as strictly,
> get rid of a number of now unnecessary casts.
>
> Signed-off-by: David Gow <davidgow@google.com>

I guess you will funnel this via another tree than the mmc?

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
> This should be a no-op functionality wise, and while it depends on the
> first couple of patches in this series, it's otherwise independent from
> the others. I think this makes the test more readable, but if you
> particularly dislike it, I'm happy to drop it.
>
>  drivers/mmc/host/sdhci-of-aspeed-test.c | 34 ++++++++++++-------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed-test.c b/drivers/mmc/host/sdhci-of-aspeed-test.c
> index bb67d159b7d8..1ed4f86291f2 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed-test.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed-test.c
> @@ -26,23 +26,23 @@ static void aspeed_sdhci_phase_ddr52(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, 15,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 25));
>
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 180));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 0,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 181));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 182));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 183));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 2,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 2,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 184));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 3,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 3,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 185));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 203));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 204));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 205));
>  }
>
> @@ -67,21 +67,21 @@ static void aspeed_sdhci_phase_hs200(struct kunit *test)
>         KUNIT_EXPECT_EQ(test, 15,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 96));
>
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 180));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 185));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 186));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 1,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 187));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 14,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 269));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 270));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 271));
> -       KUNIT_EXPECT_EQ(test, (int)ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
> +       KUNIT_EXPECT_EQ(test, ASPEED_SDHCI_TAP_PARAM_INVERT_CLK | 15,
>                         aspeed_sdhci_phase_to_tap(NULL, rate, 276));
>  }
>
> --
> 2.31.1.751.gd2f1c929bd-goog
>
