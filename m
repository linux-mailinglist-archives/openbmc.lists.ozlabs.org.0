Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5547D60AD49
	for <lists+openbmc@lfdr.de>; Mon, 24 Oct 2022 16:21:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mwy1R1dYvz3045
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 01:21:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YUEP9XyI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d; helo=mail-qk1-x72d.google.com; envelope-from=tcminyard@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YUEP9XyI;
	dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwy0q3CfZz2xKV
	for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2022 01:20:57 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id f8so6142200qkg.3
        for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2022 07:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snHhLpRnzMiuF/FkUzYYR4DW/a0NGNwApchz9Ej8VRU=;
        b=YUEP9XyILJspEjolrjqp2Z9GjGMOMTrP45EmxEXsZljfkkiRMJwaEfnshgsJfs8X7M
         KNgjsXqTJhQmhXRI0AaougoHAd1ZM5MiWxlHgU+f83ikUw0WIaE3xD0cU+/ICFuviutI
         UJybqMEFZMf18o+q3wwUtI9WhD34rpMrCVBhcSmx57RZ817mZdAPNb+TaZE1IZTtVnfc
         J13VQwN6Gk7ZemBPqfi8E/tAo+RfA+q8XHsf4hBGrvHN/lBiR+F+CGw1SWxmvIaiCsec
         /9nmLcA7UkmseebRG5d3ZSiAUd+x0xYiFAU0DNreRXfO+w3UcrZtidnRR9zNPUXAXshz
         KjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=snHhLpRnzMiuF/FkUzYYR4DW/a0NGNwApchz9Ej8VRU=;
        b=tggLyS5RTEQ+tcwm/HHcTWXJpd6/02oGWLUczNMXZVbmnPguWEAwaGNNPzWlhFTXOe
         Mj0ctJs0Ti1K66fB5ih6CeMyIeRgTpMiEBPY/hv14cwHhSFdWkRSuUJUUG/GJHC2CUkq
         66OJvewQ7pM752mKvZFX12PJecd8wynn6LnYzbnhoxv+UT3sMztJEBcQDy2aH05xSx7K
         9i2EFxw49K0ZFvTDTJ6Ijhzsa40lCgsIC2l3Lc4b4AUH7eArgDpkrclfPV/TdM3dHMS0
         JHunbsOf5oABvN4KPtK4aFO7uitrrVKFLIToFvRYkzibuUS6qOhe8fFpQwPtGf6pGX+E
         QTGw==
X-Gm-Message-State: ACrzQf1cvGZABP8OWM39oAr3HOXlqQoZegZ0miDBPAoJtV0O28JjtHZs
	wCeEKWl9gaRIT7Y6yFMfFA==
X-Google-Smtp-Source: AMsMyM4x20N5g0CnTk189WOms1Rpbivdne8Eg7opnisvbRX7j+9LVguQi1ENkMDNfK6SBGQThtJoxA==
X-Received: by 2002:a05:620a:12ac:b0:6ec:55bf:1d79 with SMTP id x12-20020a05620a12ac00b006ec55bf1d79mr22630933qki.598.1666621252246;
        Mon, 24 Oct 2022 07:20:52 -0700 (PDT)
Received: from serve.minyard.net ([47.184.185.126])
        by smtp.gmail.com with ESMTPSA id k11-20020a05620a414b00b006ce9e880c6fsm4141qko.111.2022.10.24.07.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 07:20:51 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:8f12:af97:5f5:1273])
	by serve.minyard.net (Postfix) with ESMTPSA id 9F91E180044;
	Mon, 24 Oct 2022 14:20:49 +0000 (UTC)
Date: Mon, 24 Oct 2022 09:20:48 -0500
From: Corey Minyard <minyard@acm.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH] ipmi: ssif_bmc: Use EPOLLIN instead of POLLIN
Message-ID: <Y1afQOKvgUzOLPph@minyard.net>
References: <20221024075956.3312552-1-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024075956.3312552-1-quan@os.amperecomputing.com>
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
Cc: kernel test robot <lkp@intel.com>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Joel Stanley <joel@jms.id.au>, Open Source Submission <patches@amperecomputing.com>, openipmi-developer@lists.sourceforge.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 24, 2022 at 02:59:56PM +0700, Quan Nguyen wrote:
> This fixes the following sparse warning:
> sparse warnings: (new ones prefixed by >>)
> >> drivers/char/ipmi/ssif_bmc.c:254:22: sparse: sparse: invalid assignment: |=
> >> drivers/char/ipmi/ssif_bmc.c:254:22: sparse:    left side has type restricted __poll_t
> >> drivers/char/ipmi/ssif_bmc.c:254:22: sparse:    right side has type int

Thanks, you beat me to tracing this down.  It's in my for-next queue.

-corey

> 
> Fixes: dd2bc5cc9e25 ("ipmi: ssif_bmc: Add SSIF BMC driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/all/202210181103.ontD9tRT-lkp@intel.com/
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
>  drivers/char/ipmi/ssif_bmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ssif_bmc.c b/drivers/char/ipmi/ssif_bmc.c
> index a7bb4b99000e..2d8069386398 100644
> --- a/drivers/char/ipmi/ssif_bmc.c
> +++ b/drivers/char/ipmi/ssif_bmc.c
> @@ -251,7 +251,7 @@ static __poll_t ssif_bmc_poll(struct file *file, poll_table *wait)
>  	spin_lock_irq(&ssif_bmc->lock);
>  	/* The request is available, userspace application can get the request */
>  	if (ssif_bmc->request_available)
> -		mask |= POLLIN;
> +		mask |= EPOLLIN;
>  
>  	spin_unlock_irq(&ssif_bmc->lock);
>  
> -- 
> 2.35.1
> 
