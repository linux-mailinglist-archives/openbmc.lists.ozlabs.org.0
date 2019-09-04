Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3A0A7BC0
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 08:33:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NYtW482SzDqq8
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 16:33:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::941; helo=mail-ua1-x941.google.com;
 envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ehRWcBqW"; 
 dkim-atps=neutral
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NYsl751SzDqk9
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 16:32:59 +1000 (AEST)
Received: by mail-ua1-x941.google.com with SMTP id s15so3081606uaq.6
 for <openbmc@lists.ozlabs.org>; Tue, 03 Sep 2019 23:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pX/GIsxIbo847f+9FXL/2KTOJZD24+9rFmb5WYj6XnM=;
 b=ehRWcBqW/GnnrlLMZcxZ1viX7IZQO1jEB4mYsM9rvT1aBiuak1bsc24ghhQdY1flE3
 vPA2jiJUTn1TxryfeBlRjQ3Zwbs1C3Dunqzz4HZkyEiMl97AvEVyCVEaWjU6YE7yaZKk
 QFgRRsxbYODVVkXzkzv884LEQiuC6CBl0EzykoH6XDI3YiF6P/FItLJb/RwWZ3WBjEm+
 xgLWF+y9fqqIfJu3KwOf92/Px/4TcUs8f/18B1U+7F+oX/+glyXDhD/ZyW6QeKN+5uAF
 8okc6Lt6HMfjAbzd6/HPu9e0mzp/NiTRYkXmdgRsh9M2sq8qaAnaSsbXJHXkYvE0oeO/
 u+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pX/GIsxIbo847f+9FXL/2KTOJZD24+9rFmb5WYj6XnM=;
 b=MbtxwoEc1tUTyGxhgW37Mz0GX0I+tXMrcL3P6virtGFe29JVwluLG/CDKtcwDR0J7A
 lir8ebNPABOIER/DwFiBnsb97Kjchbup52fKN52yO++90XlAd8+6WLMosjBdoHoJJrQi
 UkL5s9zDv4sACO/7N5Gu+FfHFx2uVGu2x9PFSdxZAoMfrbi0MOmkDAa6nAxYM7XnK0UW
 6k56UH3X4/t94jktK35MH5R4s3Dix78ayu5fKYZryy6n9WCb6iUl308uu9icn71n52ex
 eK5e1ftpqKmgPRTL74xkQp1aHeK7ZaQuo8vD7zkItyzcdcN5mwiEMNGgdr+wdoYxMY0r
 +d2g==
X-Gm-Message-State: APjAAAUJe/niUX/3z+aZFEwxzAwHOgbZ5xpF6lx9nIruAw81o3wyZJrb
 wvlv6R4E9XK613N0xYk1+PeRWoEv/QH3xrKsGhbzPw==
X-Google-Smtp-Source: APXvYqxLkO4gsK7ntkEBpo/NFXtCvWaI2cOa5+E0oSaexWzXKH/CEQPs/hLtZQ5zTm1z1/mU8QRSrIfhVXyy42mFJDY=
X-Received: by 2002:ab0:6601:: with SMTP id r1mr5047079uam.100.1567578775596; 
 Tue, 03 Sep 2019 23:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190904022120.4174-1-andrew@aj.id.au>
In-Reply-To: <20190904022120.4174-1-andrew@aj.id.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Sep 2019 08:32:18 +0200
Message-ID: <CAPDyKFqj84wm4hHTv4xWMOXpBBi5mkBB8BXJgNFb7-c_YtzpCg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sdhci-of-aspeed: Depend on CONFIG_OF_ADDRESS
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: kbuild test robot <lkp@intel.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 4 Sep 2019 at 04:20, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Resolves the following build error reported by the 0-day bot:
>
>     ERROR: "of_platform_device_create" [drivers/mmc/host/sdhci-of-aspeed.ko] undefined!
>
> SPARC does not set CONFIG_OF_ADDRESS so the symbol is missing. Depend on
> CONFIG_OF_ADDRESS to ensure the driver is only built for supported
> configurations.
>
> Fixes: 2d28dbe042f4 ("mmc: sdhci-of-aspeed: Add support for the ASPEED SD controller")
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v2 was a series of 4 patches, three of which were applied leaving this build
> fix to be reworked. The v2 series can be found here:
>
> https://patchwork.ozlabs.org/cover/1156457/
>
>  drivers/mmc/host/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 0f8a230de2f3..3a52f5703286 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -157,7 +157,7 @@ config MMC_SDHCI_OF_ARASAN
>  config MMC_SDHCI_OF_ASPEED
>         tristate "SDHCI OF support for the ASPEED SDHCI controller"
>         depends on MMC_SDHCI_PLTFM
> -       depends on OF
> +       depends on OF && OF_ADDRESS
>         help
>           This selects the ASPEED Secure Digital Host Controller Interface.
>
> --
> 2.20.1
>
