Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F989421AEE
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 02:02:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNd772b94z2ypn
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 11:02:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SsItuKSy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=SsItuKSy; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNd621KDJz2xrp
 for <openbmc@lists.ozlabs.org>; Tue,  5 Oct 2021 11:01:13 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id m7so1409381qke.8
 for <openbmc@lists.ozlabs.org>; Mon, 04 Oct 2021 17:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x78zZyWp/ruHj6HNDXOa1ppyYEbzDh0K20fO3tOUWRg=;
 b=SsItuKSyCvigpj02ewQ04e5QA4MZyFihYRbXm8WYKIEc+BdvLVHcgd+XB8aWucycBj
 d0w6ALB/JpbPTg36dqve2dmv668e9XDqLfVmKFbh5FU4Qbp0mCFcA5KJjcFHXZP7nYp7
 Ve8YzYAGXdQYbsHLc0Vk92qVZMDEMo8g5/Plo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x78zZyWp/ruHj6HNDXOa1ppyYEbzDh0K20fO3tOUWRg=;
 b=5GJjwAHTQSKJCD1biZgsDMmgavCv4lFW7a8Ei4TZYzPhaSkBDtYwxSvXGP2nypNChN
 B2czZ5XLUwHWx1zggD0wttXgOTjE8ET023ppLjjJMOk09D+pYLBMUj4+9bf/VcwOXo9G
 oqc/jodiKYf3nbQBLeia2KIjVolleGMlYYFOJmySEXo0B+eH/1VKYOGDyaU3XFihRsfl
 FSQl/J3tBXPFIz76B86UwDaSq1jw/uZs+8I/AnXbUbymjYmaP6hsQowOtX9NnkCkykUu
 wd+zL6N76xDhgKVph4snFTcWPBPLB0p+JECBq3o6Y5dRmk12mUOdZ+ktlVQGpxTLnoj9
 NWOA==
X-Gm-Message-State: AOAM530g/E2bIJAEujMGbLW7T4LqsIDH407VdhWJe3xSALMhWrfwe6uG
 W1RmnwuLGtVqDsrH4bt4Fy44pF26jBv2zp9J4p0=
X-Google-Smtp-Source: ABdhPJywbM3uJ+FjRkU5nr4VhA9NHWhLut2wTqtV7yPwyqFbAzF72AsCjhbWGI9RcCd3ipwgaOHCFfUO14/OrBLU5co=
X-Received: by 2002:a37:aa8f:: with SMTP id
 t137mr11986511qke.381.1633392069331; 
 Mon, 04 Oct 2021 17:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <YVtJTrgm3b3W4PY9@heinlein>
In-Reply-To: <YVtJTrgm3b3W4PY9@heinlein>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 5 Oct 2021 00:00:56 +0000
Message-ID: <CACPK8XdsJFZYR6qiFxPPjOJdgye4agkuW9fw1RY0cdyYX7z9hw@mail.gmail.com>
Subject: Re: aspeed-adc driver kpanic
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
 OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 4 Oct 2021 at 18:35, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> Hi Billy,
>
> When I run the latest linux-5.14 on QEMU with the Witherspoon config, I end up
> with a kernel panic[1].  I think there is an ordering problem in the aspeed_adc
> driver.
>
> See [2,3].  The code registers with devm a pointer to the prescaler object which
> is not yet created.  I think it is possible that the struct value contains
> uninitialized data as well.  Can you please take a look at this?

I merged v6 of Billy's patches, but he sent a v7 version that
contained a fix this issue:

--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -492,8 +492,8 @@ static int aspeed_adc_probe(struct platform_device *pdev)

        data = iio_priv(indio_dev);
        data->dev = &pdev->dev;
-       data->model_data = of_device_get_match_data(&pdev->dev);
        platform_set_drvdata(pdev, indio_dev);
+       data->model_data = of_device_get_match_data(&pdev->dev);

        data->base = devm_platform_ioremap_resource(pdev, 0);
        if (IS_ERR(data->base))
@@ -512,7 +512,7 @@ static int aspeed_adc_probe(struct platform_device *pdev)

        ret = devm_add_action_or_reset(data->dev,
                                       aspeed_adc_unregister_fixed_divider,
-                                      data->clk_prescaler);
+                                      data->fixed_div_clk);
        if (ret)
                return ret;
        snprintf(clk_parent_name, ARRAY_SIZE(clk_parent_name), clk_name);


>
> 1. https://gist.github.com/williamspatrick/4a0f0d1e0ca6f54816461a8df09e6cb8
> 2. https://github.com/openbmc/linux/blob/dev-5.14/drivers/iio/adc/aspeed_adc.c#L513
> 3. https://github.com/openbmc/linux/blob/dev-5.14/drivers/iio/adc/aspeed_adc.c#L527
>
> --
> Patrick Williams
