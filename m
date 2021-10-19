Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AFA432F0C
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 09:12:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYQ0l3LMBz3c5C
	for <lists+openbmc@lfdr.de>; Tue, 19 Oct 2021 18:12:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N9MLowMG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=N9MLowMG; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYQ0J6kQTz2yWG
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 18:11:43 +1100 (AEDT)
Received: by mail-lj1-x230.google.com with SMTP id o11so4277924ljg.10
 for <openbmc@lists.ozlabs.org>; Tue, 19 Oct 2021 00:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J85JL+/VSW+nK4uNwNqj4OCNT7753VwCkAIsTngPh24=;
 b=N9MLowMG2TNYj6G4HUfpSrOIJCEgTWw6DRQoepsheqXkZNg30p0Pgr5C07Qj0452kh
 fhapkXOWHltP804R68KRd3JneXBysctfGMrCrwrS3Tw47CHbHrd406b83y/kU2OX70dK
 dp5x51C/GoE00yf4b/E/7gKn8oUJ45khWB2tSj6Jx0Id4vvYBf1X6LsngL8XGIuJS9RL
 nqxDi1JEgwtDii9w6nASRoex5PdqGU6HJKKrVdU11N4eLXIGfQQb2mvEuCERPJdzmDrz
 +dL0Q6gmvt+FMHzxu1w3zwwnrepzMzyDRFfKp+3u2xQdQOPsnarKblXCg6lLqAIOjNhw
 30Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J85JL+/VSW+nK4uNwNqj4OCNT7753VwCkAIsTngPh24=;
 b=LfRnr6g2vSB9BQatQzXXu5gA/nxA6+sC2UIWv6pa43BWFZ8KPt7cf0A8pGQ5b29vY7
 5wweTjvPqxPjmHjPiZ6m+k9dP0WAi2GfoGO0lwRtO9afvIYSaYnEY7h2KEJKk4t+qBnI
 9+Km1otT8IuPTUVNeWqoIj4BxezK9vLXS/yFGk6SQ/QSyIYh7ppebAmUs1B5BXmgloHA
 gzDPHa2ksqxkfuyLBpinPL4es+d1oVfMrxPRggC4KxXnBIIBNnKIZux95Yp5nG3r3Ael
 opf4YkKYFlIzNHFTceSkEFOuI7Cpm9YdtRf0m31jCgax4tRmoO9KOlNbkRgAkSEn6U2C
 vOtA==
X-Gm-Message-State: AOAM530jtTZbVUvPiY6BKQdcRyBl1r2C4Z8h4LhKVC5pdwDzubBffkAM
 BpqsjACLM0nz5BbsrL8nvu20hHOnxdnviywJ1Q==
X-Google-Smtp-Source: ABdhPJzR4ybVprwe9DSid6limi9BrI+hJg86nKlWxNwvaZs7WSG8NppoInnb1ndw6/NlB6h2t6u8JkQyEcqTh6OU5YY=
X-Received: by 2002:a2e:bd86:: with SMTP id o6mr5033663ljq.221.1634627494001; 
 Tue, 19 Oct 2021 00:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211018183930.8448-1-s.shtylyov@omp.ru>
 <20211018183930.8448-4-s.shtylyov@omp.ru>
In-Reply-To: <20211018183930.8448-4-s.shtylyov@omp.ru>
From: Avi Fishman <avifishman70@gmail.com>
Date: Tue, 19 Oct 2021 10:11:23 +0300
Message-ID: <CAKKbWA4=ddbFpqoPw_pKNUs_jZKgttVQkTGQgzj4ThbMc5BQAg@mail.gmail.com>
Subject: Re: [PATCH 03/22] usb: host: ehci-npcm7xx: deny IRQ0
To: Sergey Shtylyov <s.shtylyov@omp.ru>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-usb@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 18, 2021 at 9:39 PM Sergey Shtylyov <s.shtylyov@omp.ru> wrote:
>
> If platform_get_irq() returns IRQ0 (considered invalid according to Linus)
> the driver blithely passes it to usb_add_hcd() that treats IRQ0 as no IRQ
> at all. Deny IRQ0 right away, returning -EINVAL from the probe() method...
>
> Fixes: df44831ee2dd ("USB host: Add USB ehci support for nuvoton npcm7xx platform")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> ---
>  drivers/usb/host/ehci-npcm7xx.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/usb/host/ehci-npcm7xx.c b/drivers/usb/host/ehci-npcm7xx.c
> index 6b5a7a873e01..aff3d906ced5 100644
> --- a/drivers/usb/host/ehci-npcm7xx.c
> +++ b/drivers/usb/host/ehci-npcm7xx.c
> @@ -114,6 +114,10 @@ static int npcm7xx_ehci_hcd_drv_probe(struct platform_device *pdev)
>                 retval = irq;
>                 goto fail;
>         }
> +       if (!irq) {
> +               retval = -EINVAL;
> +               goto fail;
> +       }
>
>         /*
>          * Right now device-tree probed devices don't get dma_mask set.
> --
> 2.26.3
>
Reviewed-by: Avi Fishman <avifishman70@gmail.com>

--
Regards,
Avi
