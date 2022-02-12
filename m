Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 475934B6222
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 05:35:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyStT6hmTz2yPL
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 15:34:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=A2ndsGN8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=mr.nuke.me@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=A2ndsGN8; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jx06r1Pqkz305B
 for <openbmc@lists.ozlabs.org>; Sun, 13 Feb 2022 05:55:29 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id
 j38-20020a9d1926000000b0059fa6de6c71so8597093ota.10
 for <openbmc@lists.ozlabs.org>; Sat, 12 Feb 2022 10:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6vjKSXgaCBWDz29bfYKoPcOZqwPTT5Qtqn8BPDoq0mo=;
 b=A2ndsGN8J4J6cqGSXlYAr+LAGg+PhBEFYIUEnz01ezqY3HvD2L42iITfa5vX4iaY1B
 53UpmJhMLlGCAwZnnEmYT9QGJkYwNfSg92L2UizHl4oRJ1p5JKfKnsyIq5Lql5ZW67lZ
 YPjPmK3OSHWEn4F0ZWQrwSKWF5Hl49Q36OcsBzre7ldNCEGGsO0X8jYfvMllwJTj6cGU
 t2wUlcwzv4ebSk85M3o+psnVpr471MNaITxNoJuJbWH1+7PC76HmPfb0osAXpmhtjIWD
 osdhWqAioX7cfO8AjwXwFhnbPDcDEd329p9mFJT6POvmGfvGFOlV4iGNcaHfWo3nR1qP
 ivBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6vjKSXgaCBWDz29bfYKoPcOZqwPTT5Qtqn8BPDoq0mo=;
 b=DFJW9pa9bZ2paIBmzaDwqeJN5zpPe7A8Oj6yaZuYVNVG+d61bVXUGV7rr6iZTFGYE6
 W4uc+O9XwcJxRS1PRUdHJHFOKskca3I36swnRjKliWFv3R1wbzRbQ+PV9a4VqhfGCI7C
 bR8SlAXHwsJ1+hk1VqT7zk8q3OXTaI27xaK2fLtIYnCLMOI2cQMdTg/c064GjYq6Cqak
 +PQTHa1Xv6BLhgLGyRBY4GrX1yyvUVN6FxTBZO8ZczMWVRmzVtr824bTgxygq+2kIRQW
 Gf05TX+0kIV5hlOD1lrsgzPPpiMnvpeqwp4RLVL6GzrfpGu873mfpv/7CkWfHBhQ1xku
 bNAQ==
X-Gm-Message-State: AOAM530vf4R29NpGvtSu3oBZTsO8Oo/7pxmaHF0HJS1GdfnSJ8mjGfhj
 zoZKiyI66W6FI8Vl0ExM5l5Y7hbGn8g=
X-Google-Smtp-Source: ABdhPJyKwlu7paxxCESB/0gu2AyPrKAp7PDcIA56nl3ioRBbiF3bDLUQnJNcXADmIdR/QHMP+fBtkQ==
X-Received: by 2002:a05:6830:16cf:: with SMTP id
 l15mr2473736otr.378.1644692126108; 
 Sat, 12 Feb 2022 10:55:26 -0800 (PST)
Received: from ?IPV6:2601:2c1:8501:182d::edf? ([2601:2c1:8501:182d::edf])
 by smtp.gmail.com with ESMTPSA id bf15sm11547412oib.32.2022.02.12.10.55.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 10:55:25 -0800 (PST)
Message-ID: <97430094-7d2a-432b-a121-96812fac87f9@gmail.com>
Date: Sat, 12 Feb 2022 12:55:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] image: Control FIT signature verification at runtime
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, u-boot@lists.denx.de
References: <20220131034147.106415-1-andrew@aj.id.au>
From: "Alex G." <mr.nuke.me@gmail.com>
In-Reply-To: <20220131034147.106415-1-andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 15 Feb 2022 15:34:02 +1100
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
Cc: openbmc@lists.ozlabs.org, sjg@chromium.org, chiawei_wang@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/30/22 21:41, Andrew Jeffery wrote:
> Some platform designs include support for disabling secure-boot via a
> jumper on the board. Sometimes this control can be separate from the
> mechanism enabling the root-of-trust for the platform. Add support for
> this latter scenario by allowing boards to implement
> board_fit_image_require_verfied(), which is then invoked in the usual
> FIT verification paths.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> Hi,
> 
> This patch is extracted from and motivated by a series adding run-time
> control of FIT signature verification to u-boot in OpenBMC:
> 
> https://lore.kernel.org/openbmc/20220131012538.73021-1-andrew@aj.id.au/
> 
> Unfortunately the OpenBMC u-boot tree is quite a way behind on tracking
> upstream and contains a bunch of out-of-tree work as well. As such I'm
> looking to upstream the couple of changes that make sense against
> master.

I don't understand the practical use of a mechanism to disable security 
if secure boot was enabled in the first place. Sure it can be 
technically done, but why is this not a bad idea?

> Please take a look!
> 
> Andrew
> 
>   boot/Kconfig     |  8 ++++++++
>   boot/image-fit.c | 21 +++++++++++++++++----
>   include/image.h  |  9 +++++++++
>   3 files changed, 34 insertions(+), 4 deletions(-)
> 
> diff --git a/boot/Kconfig b/boot/Kconfig
> index c8d5906cd304..ec413151fd5a 100644
> --- a/boot/Kconfig
> +++ b/boot/Kconfig
> @@ -78,6 +78,14 @@ config FIT_SIGNATURE
>   	  format support in this case, enable it using
>   	  CONFIG_LEGACY_IMAGE_FORMAT.
>   
> +if FIT_SIGNATURE
> +config FIT_RUNTIME_SIGNATURE
> +	bool "Control verification of FIT uImages at runtime"
> +	help
> +	  This option allows board support to disable verification of
> +	  signatures at runtime, for example through the state of a GPIO.

The commit message does a much nicer job explaining this option, even 
though it is this kconfig help text that almost all users will ever see.

> +endif # FIT_SIGNATURE
> +
>   config FIT_SIGNATURE_MAX_SIZE
>   	hex "Max size of signed FIT structures"
>   	depends on FIT_SIGNATURE
> diff --git a/boot/image-fit.c b/boot/image-fit.c
> index f01cafe4e277..919dbfa4ee1d 100644
> --- a/boot/image-fit.c
> +++ b/boot/image-fit.c
> @@ -1308,6 +1308,14 @@ static int fit_image_check_hash(const void *fit, int noffset, const void *data,
>   	return 0;
>   }
>   
> +#ifndef __weak
> +#define __weak
> +#endif

What?

> +__weak int board_fit_image_require_verified(void)
> +{
> +	return 1;
> +}
> +

I caution against having any platform security related functionality as 
a weak function. Did I get the right function, or something else with 
the same name was compiled that returns 0 and silently disables security 
in my platform?

I think a weak function in this context is a source of confusion and 
future bugs. You could instead require the symbol to be defined if and 
only if the appropriate kconfig is selected. Symbol not defined -> 
compiler error. Symbol defined twice -> compiler error. Solves the 
issues in the preceding paragraph.

[snip]

> diff --git a/include/image.h b/include/image.h
> index 97e5f2eb24d6..98900c2e839b 100644
> --- a/include/image.h
> +++ b/include/image.h
> @@ -1173,6 +1173,15 @@ int calculate_hash(const void *data, int data_len, const char *algo,
>   # define FIT_IMAGE_ENABLE_VERIFY	CONFIG_IS_ENABLED(FIT_SIGNATURE)
>   #endif
>   
> +/*
> + * Further, allow run-time control of verification, e.g. via a jumper
> + */
> +#if defined(CONFIG_FIT_RUNTIME_SIGNATURE)
> +# define fit_image_require_verified()	board_fit_image_require_verified()
> +#else
> +# define fit_image_require_verified()	FIT_IMAGE_ENABLE_VERIFY
> +#endif
> +

image.h is also used for host code. When only changing target code 
behavior, there should be a very good reason to modify common code. I'm 
not convinced that threshold has been met.

My second concern here is subjective: I don't like functions defined as 
macros, further depending on config selections. It makes many code 
parsers and IDEs poop their pantaloons. It makes u-boot harder to work 
with as a result. I suggest finding a way to turn this into a static inline.

Alex
