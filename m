Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3077525886F
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 08:46:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgczy2Ws4zDqLT
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 16:46:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541;
 helo=mail-ed1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=E8TDsRew; dkim-atps=neutral
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgcqj4HBmzDqL0
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 16:39:28 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id l21so328733eds.7
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 23:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=29JCuj72a4LniIjJUsEk4e+49YkP86hMAgbTLkYNNaE=;
 b=E8TDsRewKopV0d2W20vf4gQC+FrMgorXYUrS7wlvlUDmIU0lCxVyMYQkIy4GRPzasD
 PDXkrwMhq1xcdJkT7K8ITIT0jUAyaNWLEiWfvgLfU/gzyXjlTpKcV+kVTBZURyM/NHt0
 gzSQX5YBugpwMLgJLChBlj6uwBmv4HDlHPUKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=29JCuj72a4LniIjJUsEk4e+49YkP86hMAgbTLkYNNaE=;
 b=VWIx13tv91Ft2zRW2rGEZDy4YqthShfT/OxAGLBeluYfrA4ekjtCZUJTzTdLgAgPuU
 twUHK47fL8yRisaO3hPiST4mAV5No2ljanS7M39OYO/P9BJajm/tH2BI9UypiJf/6aJL
 /E+2Kewr8g8o8ImN9IfXXI5bJWPvRPsoZa3OVKIMR0aWG3EaZ9ZIlOa5xBUwNEua9KCW
 tIUjAzUWSLonFRqdJiNJR0tJhzB9LsZB/FZi4kuXYWnGaPT2m+JbT+wa12ktusJ0Db4D
 aQAotiQkxL/xVVgmAIaTeczy3EM/cLzYSIwS6s/UmGEjwLtlK1p78MLpbcbjs9mrxZzE
 yvdg==
X-Gm-Message-State: AOAM533kREsBh/04b6jxNErXtpDmYCa57EZTIAv4v27rEdKlfgSv9jiV
 1OoKCbPEBpYRr0PXGh00sJoxZB+PVk4anTvX3XY=
X-Google-Smtp-Source: ABdhPJx1IRFW+5xmeC9fgXWATkqSAEQVUsMq7s+6sX3iEJ/9mCdTDCCFAAvm9G2Y3seGCHYqLPI2T0SDDTQLboO2rv0=
X-Received: by 2002:a05:6402:ca7:: with SMTP id
 cn7mr440588edb.143.1598942365155; 
 Mon, 31 Aug 2020 23:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200824221051.47972-1-eajames@linux.ibm.com>
 <20200824221051.47972-4-eajames@linux.ibm.com>
In-Reply-To: <20200824221051.47972-4-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 1 Sep 2020 06:39:12 +0000
Message-ID: <CACPK8Xc5OCdWAMxF9tzvbP-rzd7HFdRU5gQD0GNFaYsiiXnj5A@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 3/4] fsi: Aspeed master: Set clock frequency
 from devicetree
To: Eddie James <eajames@linux.ibm.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 24 Aug 2020 at 22:11, Eddie James <eajames@linux.ibm.com> wrote:
>
> Set the FSI clock frequency based on the value encoded in the
> devicetree, if present.

Should we default it to 166 if it's not present?

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/fsi/fsi-master-aspeed.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
> index c006ec008a1a..aedcc9be48ca 100644
> --- a/drivers/fsi/fsi-master-aspeed.c
> +++ b/drivers/fsi/fsi-master-aspeed.c
> @@ -515,6 +515,7 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
>         struct fsi_master_aspeed *aspeed;
>         struct resource *res;
>         int rc, links, reg;
> +       u32 clk_freq;
>         __be32 raw;
>
>         rc = tacoma_cabled_fsi_fixup(&pdev->dev);
> @@ -539,6 +540,11 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
>                 dev_err(aspeed->dev, "couldn't get clock\n");
>                 return PTR_ERR(aspeed->clk);
>         }
> +
> +       if (!of_property_read_u32(pdev->dev.of_node, "clock-frequency",
> +                                 &clk_freq))
> +               clk_set_rate(aspeed->clk, clk_freq);
> +
>         rc = clk_prepare_enable(aspeed->clk);
>         if (rc) {
>                 dev_err(aspeed->dev, "couldn't enable clock\n");
> --
> 2.26.2
>
