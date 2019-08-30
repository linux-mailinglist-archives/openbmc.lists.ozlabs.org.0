Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 939B3A4CFA
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 03:00:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBb03swyzDqKP
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 11:00:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::e42; helo=mail-vs1-xe42.google.com;
 envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="qp8yU+LP"; 
 dkim-atps=neutral
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KX4x4jPdzF0YY
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 18:02:08 +1000 (AEST)
Received: by mail-vs1-xe42.google.com with SMTP id j25so4179157vsq.12
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 01:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zSReTBR+21k+gQlfPIxdDjT6LtoW1ARQm0j/COjHJ9U=;
 b=qp8yU+LPUcX/mAFN/tdWTbxE8ZDUp2Z8cCy/SKuHHj80GZtnQ3tQP7JQDmbyIBAWoy
 ZePqJezkftPXgjaRJ7H2pFtF5ZnZOQZy4N5kyyN4o2HhEhsa410M5iWSyc0l/Ynzaktm
 YOSy3tWjasqTapLStwH3UrO5al31vEt96KXMWgXhv2YXTynO/2BcGjuL+2uj+TX6vHDJ
 UVwmxzPe4wEYqJUHp6HIsvv7G9ymY37avF2pBFZHYsAo8M6r54t/hRz3V8vqsvpuFx4x
 JuYF9njW9ZhqiqYVZqFshkjVEd+qOApUqzk1gOe47O82ybxuy80NG/F0a3bmeO2YRwQJ
 8eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zSReTBR+21k+gQlfPIxdDjT6LtoW1ARQm0j/COjHJ9U=;
 b=HQsR+eqm601AjA9v0FCR2syNsnon07YD/gDN14gcKZ76lhg9NP5XvbhoAlfqDBFjHg
 QR+0BplTUsI31RHyoYrLksy4o8xnBShnFPLu33BXFu+nfvE3Bsd9/Wc8AAJTjomjtmN5
 KGj1aLkmVQGAPNN6nIUmWPAdC80SU9y+zvpbwEpstwV0InTWERDkYe8jXaLUXxjLP++u
 YuCsy/Mzk0p9q5rPlR2MfJWigkXoFQaJOVIJBUFgKhlDAkRZwkPHllZNMxm3FIEv7urn
 QWGsUOzPFFlchl1Gfy9p0XDuSDWFGeGSHxxzaq/jkUA7dvIOSnRVe1rzw1e1EdEyZNIr
 hxZQ==
X-Gm-Message-State: APjAAAWBMs3Won7JhRWUE+kZ18GSwpgjs9rBONd2ZdqDhP88KybvTv+9
 LLiIdPTmgtNWjgB52ROTg4IhoiRgYGsA7npGYhkq5Q==
X-Google-Smtp-Source: APXvYqyOx0hFYInMfmpsUnvpCKFGXIHa/+Ahs3V3CNXSh7WcogIeV6A1MSfhHPGxYA3SEvRTgK+RozQPc8r1yR8QgSo=
X-Received: by 2002:a67:983:: with SMTP id 125mr2338906vsj.191.1567152124259; 
 Fri, 30 Aug 2019 01:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190830074644.10936-1-andrew@aj.id.au>
 <20190830074644.10936-2-andrew@aj.id.au>
In-Reply-To: <20190830074644.10936-2-andrew@aj.id.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 30 Aug 2019 10:01:27 +0200
Message-ID: <CAPDyKFrKXfB1F2dh63KrkCiKGbmbBWaAM16vJqtQncnF4YctQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mmc: sdhci-of-aspeed: Uphold clocks-on post-condition
 of set_clock()
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:51 +1000
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
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Ryan Chen <ryanchen.aspeed@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 30 Aug 2019 at 09:46, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The early-exit didn't seem to matter on the AST2500, but on the AST2600
> the SD clock genuinely may not be running on entry to
> aspeed_sdhci_set_clock(). Remove the early exit to ensure we always run
> sdhci_enable_clk().
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index d5acb5afc50f..a9175ca85696 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -55,9 +55,6 @@ static void aspeed_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)
>         int div;
>         u16 clk;
>
> -       if (clock == host->clock)
> -               return;
> -
>         sdhci_writew(host, 0, SDHCI_CLOCK_CONTROL);
>
>         if (clock == 0)
> --
> 2.20.1
>

Further down in aspeed_sdhci_set_clock() you should probably also
remove the assignment of host->clock = clock, as that is already
managed by sdhci_set_ios().

Kind regards
Uffe
