Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F3A7AEF2B
	for <lists+openbmc@lfdr.de>; Tue, 26 Sep 2023 17:05:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e6Jv1KGi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rw3293zbjz3cPR
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 01:05:05 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e6Jv1KGi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=ulf.hansson@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rw31Y0GMnz3cGC
	for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2023 01:04:31 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-59c0d329a8bso110062297b3.1
        for <openbmc@lists.ozlabs.org>; Tue, 26 Sep 2023 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695740668; x=1696345468; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XkQznAxnykGoHMZeYaAftpnWpVTscvRnJk62iXg78HM=;
        b=e6Jv1KGiWG20LFROOSgy509dBFWDd7fR/ECAPkBzyHiZW3B21CPbWgL8hiI2LlWOX7
         Gj1QdkS40Qq5RGe5OTocO0gRCWL5K5liFPLdWhiXXqjpaSItfiYPFFpLMEhtgyz/qsK9
         G5g4YFMM7/lTwXzICcnEf6rwJ+d7iQNF2pEbZoG6ueKK+vqchEEuqHNJPpi2Qv2MlE+T
         13EdRM97+ynLaZvaOnBikKoCGHXHpRNf9oqsw12/SIcv8tKtfRX14C7MZydazAfkgNjn
         pn3GCIGMVEepTHtgQrel9KUiesiHxC/HRijq53aj6Ey0tIJUbAfghaSqIdyl8Hz9hmB8
         8f5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740668; x=1696345468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XkQznAxnykGoHMZeYaAftpnWpVTscvRnJk62iXg78HM=;
        b=G8gDZpDeD5sTgK3GyxY+zfIAEI0y/ShL7ueMl6+ms2ksmxh0TwV62VeObes0F+geVv
         VxOsiCa0dF0evP7bkOYUYoUGa2NuusoZeXhJCcE/zCXUSHmBfmws+dyvm644oe6JOwkK
         AJS/8F6L3JHIhrY1dqhQeGlMbeAhpsiC5ex0UFotGht/CMDAPNXz4Wc07gEQUSqTIvxD
         kvxuDmjp2fH/LSGs7h1r3OTcm6UjlaVXyhBj62CkMdXKRXbSpBT+hSux1LNXlCbHDQS5
         kGoQKICyfASYH4NBcuEM42LwNgSphWry8eCgU22n5eqNRT2Vpm65tusiEXYyqB4YNw9C
         Du4Q==
X-Gm-Message-State: AOJu0YyGbAi2NgKByaHZcj3dM5rMpbJQa92EGeh1HY0QMEKSVuR6jTXA
	4udbCAvxM5OtZBCmxKIYawYka8daU9oaPzTDCOrj3g==
X-Google-Smtp-Source: AGHT+IGROsfk06tbY4aJKZhfnAsRPVgtpSRAqvTPi3Sls9eZA1D2bKhA+BHNmXVH+vsas51sqXcQAJy04/XqDr1WP1M=
X-Received: by 2002:a25:b11c:0:b0:d81:a0c5:f275 with SMTP id
 g28-20020a25b11c000000b00d81a0c5f275mr9271834ybj.15.1695740668497; Tue, 26
 Sep 2023 08:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230925030647.40283-1-andrew@codeconstruct.com.au>
In-Reply-To: <20230925030647.40283-1-andrew@codeconstruct.com.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 26 Sep 2023 17:03:52 +0200
Message-ID: <CAPDyKFrFxYxSTa=z2VnCk4m_d-wEgd17wBokzyNCCRLtSUnFKw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: aspeed: Update Andrew's email address
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 25 Sept 2023 at 05:07, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> I've changed employers, have company email that deals with patch-based
> workflows without too much of a headache, and am trying to steer some
> content out of my personal mail.
>
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>

I guess it doesn't really matter what tree this gets funneled through,
so I decided to pick this up via my mmc tree.

So, applied for next, thanks!

Kind regards
Uffe


> ---
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b19995690904..1965cee433b0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1963,7 +1963,7 @@ F:        drivers/irqchip/irq-aspeed-i2c-ic.c
>
>  ARM/ASPEED MACHINE SUPPORT
>  M:     Joel Stanley <joel@jms.id.au>
> -R:     Andrew Jeffery <andrew@aj.id.au>
> +R:     Andrew Jeffery <andrew@codeconstruct.com.au>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:     linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>  S:     Supported
> @@ -3058,7 +3058,7 @@ F:        Documentation/devicetree/bindings/peci/peci-aspeed.yaml
>  F:     drivers/peci/controller/peci-aspeed.c
>
>  ASPEED PINCTRL DRIVERS
> -M:     Andrew Jeffery <andrew@aj.id.au>
> +M:     Andrew Jeffery <andrew@codeconstruct.com.au>
>  L:     linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>  L:     openbmc@lists.ozlabs.org (moderated for non-subscribers)
>  L:     linux-gpio@vger.kernel.org
> @@ -3075,7 +3075,7 @@ F:        drivers/irqchip/irq-aspeed-scu-ic.c
>  F:     include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
>
>  ASPEED SD/MMC DRIVER
> -M:     Andrew Jeffery <andrew@aj.id.au>
> +M:     Andrew Jeffery <andrew@codeconstruct.com.au>
>  L:     linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>  L:     openbmc@lists.ozlabs.org (moderated for non-subscribers)
>  L:     linux-mmc@vger.kernel.org
> --
> 2.39.2
>
