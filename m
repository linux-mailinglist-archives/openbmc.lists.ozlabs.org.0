Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1816D488E4C
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 02:51:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXGy10JJ8z2yp6
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 12:51:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQhTkj8c;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQhTkj8c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=philmd@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=hQhTkj8c; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=hQhTkj8c; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKPRm2xQ6z2xrm
 for <openbmc@lists.ozlabs.org>; Thu, 23 Dec 2021 20:05:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640250333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssqhP49WQb9bj5YqgYaOkw1c6XcCWRf7c6Gkq8d+sfo=;
 b=hQhTkj8cYN6eB5swsC85X3WeuwjiGr6xZVoOvxQOaZeLo9QoAYfe7X864eLjUxgEAM7tRn
 dgwQsHsEos5cCCfR0v4GmmdpdqiULVxOdhKzGC2ibwwRW+xvvtZjWS2eZZJ6siBx+9/11y
 d26HSfut61VKH1x885nJ+QnxCKNLvHo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640250333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssqhP49WQb9bj5YqgYaOkw1c6XcCWRf7c6Gkq8d+sfo=;
 b=hQhTkj8cYN6eB5swsC85X3WeuwjiGr6xZVoOvxQOaZeLo9QoAYfe7X864eLjUxgEAM7tRn
 dgwQsHsEos5cCCfR0v4GmmdpdqiULVxOdhKzGC2ibwwRW+xvvtZjWS2eZZJ6siBx+9/11y
 d26HSfut61VKH1x885nJ+QnxCKNLvHo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-ACX8J16WPNGM6AJcAhoo6Q-1; Thu, 23 Dec 2021 04:05:31 -0500
X-MC-Unique: ACX8J16WPNGM6AJcAhoo6Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 c5-20020a1c3505000000b00345c92c27c6so2142489wma.2
 for <openbmc@lists.ozlabs.org>; Thu, 23 Dec 2021 01:05:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ssqhP49WQb9bj5YqgYaOkw1c6XcCWRf7c6Gkq8d+sfo=;
 b=cPGQkFty0av593iDLmwrjbX/asiwrgCiplo8hAS7ljS0p4B3uuW+0I+hHUwwYbRNr2
 0HNz7+LvDUIfD8AcjsYRKhcg9/zvM2tL5nN2h/Zsrf7nu09tGHEOU7Mq76srL2ewVROn
 u6rXgqXuuRi/nIz3+glUrRz0QBMu6HerTXI0ZeZxo9NCNpamIBl4jXUfXAHMsiYbQf7q
 LRqbuTcqJLJviDlTOZZSFiyO3l3JXM05sBM5zf1jpuIGAdgI7TjwIeFZfX4HPfnRrl7f
 48Q39DQGdJMhDkb2FZeXrhgyv42hL14axWiIHClyIIxnDFU1VW85LS8GU+wUWrm8enbk
 tHPQ==
X-Gm-Message-State: AOAM5339tASbJ3uLgXhEPcnERWeZQWXi0+i3Zw/nVmOrb9zS7Y9+xSRB
 s3UPp7K4wQ2+jXwCygplnY+qnBeGdUyvoOCvc9oJ3m4eDL6XPOGc0heAjIytNczxvNCnKJM/qjj
 dbSJaR/+DuLb1S357Ihw=
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr1053693wrh.470.1640250330361; 
 Thu, 23 Dec 2021 01:05:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6lbAK7KKGdz7oi3lfyyWPWcUNyagd3sn00VLIjMTVeltPc06PV8vaSJR00eurKU1ZmeBTIQ==
X-Received: by 2002:adf:d0cb:: with SMTP id z11mr1053675wrh.470.1640250330199; 
 Thu, 23 Dec 2021 01:05:30 -0800 (PST)
Received: from [192.168.43.238] (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id d4sm4189458wrx.102.2021.12.23.01.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 01:05:29 -0800 (PST)
Message-ID: <f7baa65e-48b0-2d8e-1222-66b303757829@redhat.com>
Date: Thu, 23 Dec 2021 07:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH qemu master] hw/misc/aspeed_pwm: fix typo
To: Troy Lee <troy_lee@aspeedtech.com>, openbmc@lists.ozlabs.org
References: <20211222102423.3121181-1-troy_lee@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211222102423.3121181-1-troy_lee@aspeedtech.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 10 Jan 2022 12:50:43 +1100
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/22/21 11:24, Troy Lee wrote:
> Typo found during developing.
> 
> Fixes: 70b3f1a34d3c ("hw/misc: Add basic Aspeed PWM model")
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>  hw/misc/aspeed_pwm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_pwm.c b/hw/misc/aspeed_pwm.c
> index 8ebab5dcef..dbf9634da3 100644
> --- a/hw/misc/aspeed_pwm.c
> +++ b/hw/misc/aspeed_pwm.c
> @@ -96,7 +96,7 @@ static void aspeed_pwm_class_init(ObjectClass *klass, void *data)
>  
>      dc->realize = aspeed_pwm_realize;
>      dc->reset = aspeed_pwm_reset;
> -    dc->desc = "Aspeed PWM Controller",
> +    dc->desc = "Aspeed PWM Controller";
>      dc->vmsd = &vmstate_aspeed_pwm;
>  }
>  

No need for another patch, since it doesn't build.
Simply squash it in your commit 70b3f1a34d3c.

