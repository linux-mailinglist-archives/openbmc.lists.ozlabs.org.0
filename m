Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFD85E6B57
	for <lists+openbmc@lfdr.de>; Thu, 22 Sep 2022 20:58:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYPgP3fyQz3c6K
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 04:58:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=axhceb0o;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=axhceb0o;
	dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYPfz581Yz3bpn;
	Fri, 23 Sep 2022 04:57:45 +1000 (AEST)
Received: by mail-qk1-x72e.google.com with SMTP id o7so6841909qkj.10;
        Thu, 22 Sep 2022 11:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=h9c+xPWJyC5OnFGo12v4TpTLnof1p8+esOXYmciFsQA=;
        b=axhceb0omg3rX8tkuuP0AQ9Uwq2axBINJntz4zOv/BEVfSxg/ddN5kY3Gx/C6vrdw3
         N8hqgRa5R76RpCqg4mTHnN1dbWkPdjFId8w5nvxn7A758diY5owUDU4phu9NrtF3TRjT
         AgIvXm92Oiy4/Fv7p63YBmwatogCuf/3r0pDbYlAiDeNGHkjx2XnylVlLFmbm8jiq93t
         pxusF/6VqWeyojGb6Qk9yeub6PRZsXQCBF3bcJAWHvEG9OeH3noFYuWi5tp+0MGcV7ua
         SAmWYz21zlNRLFScWZssJ1x6kr7EW2DUHxCjTYisq41CBg3nS44wrqYhQJhVGi09hKPg
         P20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date;
        bh=h9c+xPWJyC5OnFGo12v4TpTLnof1p8+esOXYmciFsQA=;
        b=WEmvj2QMJn+SI7nKkSzanzikNysshIBadpRYGI707nQdrjQyB27FgwwHL3RSkHqtE8
         /6mz24Aoh1iLqd/o0y/9c2LR3+eax9WtnMA9h0T8SsU5gpupmjvvGW38R58jx8pklJk9
         3ucAtotdsGYRHUnZ1j3KMSFtGLkoRI06L36YOl0cR6ul+/QBzf3m94et4/n/sobx5fba
         6fkwcDAC3/mUVdOI0fZW0DwAyaO+CV6FvgF/TjJ9REhkbcI0jtMP4p9UwcWfyAO9lBwr
         a0QN1SfGcM8tHlF0E5FB0nJWme8yJrsop+ICqbyu6RZdLGZfGB6qDK0a5pkVqEQlgHe9
         CizA==
X-Gm-Message-State: ACrzQf2Zsge7nU12eZola9dNsWahcY7p4Izf1FVI+W/DJ5R+wYBQlMKd
	6NaYyhIwItBOLvlD4Bml6A==
X-Google-Smtp-Source: AMsMyM7lRX/UtjmtPjX7vd4fBl38n/2HwjotYxOaQHYiv6AR68EPDuLkUGmGjF8Iz8qfIhSJckxh4Q==
X-Received: by 2002:a05:620a:1d02:b0:6ce:5820:2fdc with SMTP id dl2-20020a05620a1d0200b006ce58202fdcmr3246580qkb.638.1663873061853;
        Thu, 22 Sep 2022 11:57:41 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id g17-20020ac87751000000b003434e47515csm3889217qtu.7.2022.09.22.11.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 11:57:41 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:5d3f:d09:85d2:d6e])
	by serve.minyard.net (Postfix) with ESMTPSA id AEF841800BD;
	Thu, 22 Sep 2022 18:57:40 +0000 (UTC)
Date: Thu, 22 Sep 2022 13:57:39 -0500
From: Corey Minyard <minyard@acm.org>
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH] ipmi: kcs: aspeed: Update port address comments
Message-ID: <YyywI8265vECnEHv@minyard.net>
References: <20220920020333.601-1-chiawei_wang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920020333.601-1-chiawei_wang@aspeedtech.com>
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
Reply-To: minyard@acm.org
Cc: linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, joel@jms.id.au, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 20, 2022 at 10:03:33AM +0800, Chia-Wei Wang wrote:
> Remove AST_usrGuide_KCS.pdf as it is no longer maintained.

Even if it's no longer maintained, is it useful?  It seems better to
leave in useful documentation unless it has been replaced with something
else.

-corey

> 
> Add more descriptions as the driver now supports the I/O
> address configurations for both the KCS Data and Cmd/Status
> interface registers.
> 
> Signed-off-by: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> ---
>  drivers/char/ipmi/kcs_bmc_aspeed.c | 29 ++++++++++++++++++-----------
>  1 file changed, 18 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
> index cdc88cde1e9a..19c32bf50e0e 100644
> --- a/drivers/char/ipmi/kcs_bmc_aspeed.c
> +++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
> @@ -207,17 +207,24 @@ static void aspeed_kcs_updateb(struct kcs_bmc_device *kcs_bmc, u32 reg, u8 mask,
>  }
>  
>  /*
> - * AST_usrGuide_KCS.pdf
> - * 2. Background:
> - *   we note D for Data, and C for Cmd/Status, default rules are
> - *     A. KCS1 / KCS2 ( D / C:X / X+4 )
> - *        D / C : CA0h / CA4h
> - *        D / C : CA8h / CACh
> - *     B. KCS3 ( D / C:XX2h / XX3h )
> - *        D / C : CA2h / CA3h
> - *        D / C : CB2h / CB3h
> - *     C. KCS4
> - *        D / C : CA4h / CA5h
> + * We note D for Data, and C for Cmd/Status, default rules are
> + *
> + * 1. Only the D address is given:
> + *   A. KCS1/KCS2 (D/C: X/X+4)
> + *      D/C: CA0h/CA4h
> + *      D/C: CA8h/CACh
> + *   B. KCS3 (D/C: XX2/XX3h)
> + *      D/C: CA2h/CA3h
> + *   C. KCS4 (D/C: X/X+1)
> + *      D/C: CA4h/CA5h
> + *
> + * 2. Both the D/C addresses are given:
> + *   A. KCS1/KCS2/KCS4 (D/C: X/Y)
> + *      D/C: CA0h/CA1h
> + *      D/C: CA8h/CA9h
> + *      D/C: CA4h/CA5h
> + *   B. KCS3 (D/C: XX2/XX3h)
> + *      D/C: CA2h/CA3h
>   */
>  static int aspeed_kcs_set_address(struct kcs_bmc_device *kcs_bmc, u32 addrs[2], int nr_addrs)
>  {
> -- 
> 2.25.1
> 
