Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CAA6C67CC
	for <lists+openbmc@lfdr.de>; Thu, 23 Mar 2023 13:14:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj45G5B6mz3f4C
	for <lists+openbmc@lfdr.de>; Thu, 23 Mar 2023 23:14:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LXcwVizv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=ulf.hansson@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LXcwVizv;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj44c7129z3chq
	for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2023 23:13:36 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id z83so24491329ybb.2
        for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2023 05:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679573612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DrtQ8CwDcwRA/DKiIVaGSBD/b1SSGaInqX/K7jpVRKA=;
        b=LXcwVizvFL7SjKCXKuCoQfWAYpHOQFMIsfvaBv9J6ZIhI6mlTEb/OoL/PGa2EYhDKy
         aQNsr29CKBreYNUaDvAFNZYVQ83GbRN6+wEcg1BKTCsqEoS/1dZnpd/FxTAtaw3BK4np
         4DXFFWefgVSPCWNzoguFllSpnuEEIA6kZ9WA7WFS602rAyB2UX8afTfhNXRd7SM6+Vat
         AC8vmciKYPSiQF5/PEGpA4+iRnjwHaRE2jhB9ZmD8pMwnJhXaPqu4/lz8sQaJVhujOXp
         rvoxT99I4g/pi0v5T8Djhfz9aSpX06eQNrsM42xMbbPr4pFvchLC7xsajuWVyc19ilWz
         aQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679573612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DrtQ8CwDcwRA/DKiIVaGSBD/b1SSGaInqX/K7jpVRKA=;
        b=n/jaWnHR+ciZWzm09ZPHpc2AcIYML7z/lWSkNUPZls15togu8Aw9V+kFOobIRoc5lG
         Ojc5w/8c4hECBmKKdbJbsiOLNte58659o5Q14GcgOOCa/BMwOAsJcnUcCCljg9qsEbxT
         s4lstQSClWbYy428KFnTBvuEDX8cwZc8WchFjxiJvFvd0om5uh+iTPBsGpCtuVnqIiZ2
         jKaLNeJaikyM82BPabbw9Brnn1jae0CHj1hSPpXMTePiV2rQNHD6Hi859AjeYuTtBZ44
         lEPJQLe0g7XK4iPRWYO3DlMERRLMeIqbFRDAvslss/JjKyUiwNBzSKvC4rwhlPoINFEt
         LzSQ==
X-Gm-Message-State: AAQBX9cEHY4JVTyPYwKu/Rsa+rwpJ014LYpqxCthcXQ9QQY8kYzWlKBd
	v8oDh5Lgcz3uY5EvmxyEVnuKGrEuahpbYxNjL1I6Jw==
X-Google-Smtp-Source: AKy350Y6PAngVYMC5aIvNHmGoOD2wdu03PXzck6qzjHGv4u4r/rSe3V4PKht12FdYJJ+8QYKiBvoXSmOWogaFoo1tbA=
X-Received: by 2002:a05:6902:722:b0:b68:7a4a:5258 with SMTP id
 l2-20020a056902072200b00b687a4a5258mr2072334ybt.3.1679573611981; Thu, 23 Mar
 2023 05:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230315055023.61779-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20230315055023.61779-1-yang.lee@linux.alibaba.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 23 Mar 2023 13:12:56 +0100
Message-ID: <CAPDyKFrcATB2qxzpkHGKD=VGK21Vr83xmHYcaX708F0Qjek4xA@mail.gmail.com>
Subject: Re: [PATCH -next] mmc: sdhci-of-aspeed: Use devm_platform_get_and_ioremap_resource()
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: oel@jms.id.au, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 15 Mar 2023 at 06:50, Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> According to commit 890cc39a8799 ("drivers: provide
> devm_platform_get_and_ioremap_resource()"), convert
> platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
>  drivers/mmc/host/sdhci-of-aspeed.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-aspeed.c b/drivers/mmc/host/sdhci-of-aspeed.c
> index ba6677bf7372..25b4073f698b 100644
> --- a/drivers/mmc/host/sdhci-of-aspeed.c
> +++ b/drivers/mmc/host/sdhci-of-aspeed.c
> @@ -547,8 +547,7 @@ static int aspeed_sdc_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> -       sdc->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       sdc->regs = devm_ioremap_resource(&pdev->dev, sdc->res);
> +       sdc->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &sdc->res);
>         if (IS_ERR(sdc->regs)) {
>                 ret = PTR_ERR(sdc->regs);
>                 goto err_clk;
> --
> 2.20.1.7.g153144c
>
