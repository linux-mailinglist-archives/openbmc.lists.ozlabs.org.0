Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D56DE3887C1
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 08:44:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlNdT5cK9z3004
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 16:44:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.50; helo=mail-wr1-f50.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlMyh33Tfz2xvN;
 Wed, 19 May 2021 16:14:20 +1000 (AEST)
Received: by mail-wr1-f50.google.com with SMTP id n2so12708390wrm.0;
 Tue, 18 May 2021 23:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eM8EQdorm7mWG5o19XHqVGANwvQx7NCTQwR5Sava/sg=;
 b=KAK1LF7EEybRuNls2x7v5pUeNULJmrLcIXsNMJCDpvLeI5kRJWKaKh6n6O77yJo1t1
 1iPw/Ln1eFgVfLVgYdz2WT/Z/cyYnKyqJiN7S/AE4nDO4NW9TYleTXdGgN9AV9AE324a
 VzoVu/+GvA9+UyMgjVXk02wTsiISMAsTwPLhcl4ALPiDw0Ce/PSh3xbYXXMOhdQ4HouB
 TTxoBlUUnewataBu9oGtfWjLdd33k941qnpP+6Yy8c+5K9fHSO/KoNvkwia7xi07uoNx
 LBbx2WvQO12liIc6cBftIdR6ldLpyj/8L3GPi6BsO0O7ZtWGlhbYCuqidYRNpG+PRVuU
 d5sg==
X-Gm-Message-State: AOAM530r4P3oVUMzdA9L9cmHc8wwTkabazRvQksbK5/8eV3gGrDWKZYD
 0coxdzIjnBYXKBNCkmO12n0=
X-Google-Smtp-Source: ABdhPJz6iPXnZ1bVZfGhblaiVWq7jqmsaA0sDVHC70vQOG+pEbSsL5Jmu31ST2PpHeuV1k01nEMjiA==
X-Received: by 2002:adf:f9ce:: with SMTP id w14mr12479031wrr.387.1621404857559; 
 Tue, 18 May 2021 23:14:17 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id i1sm13181697wrp.51.2021.05.18.23.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 23:14:17 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] serial: 8250: Use BIT(x) for UART_{CAP,BUG}_*
To: Andrew Jeffery <andrew@aj.id.au>, linux-serial@vger.kernel.org
References: <20210519000704.3661773-1-andrew@aj.id.au>
 <20210519000704.3661773-3-andrew@aj.id.au>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <56ec152a-560b-1eed-97e2-c12e4fed171a@kernel.org>
Date: Wed, 19 May 2021 08:14:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210519000704.3661773-3-andrew@aj.id.au>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 19 May 2021 16:44:03 +1000
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
Cc: ryan_chen@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 gregkh@linuxfoundation.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, jenmin_yuan@aspeedtech.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 19. 05. 21, 2:07, Andrew Jeffery wrote:
> BIT(x) improves readability and safety with respect to shifts.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/tty/serial/8250/8250.h | 33 +++++++++++++++++----------------
>   1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
> index 34aa2714f3c9..4fbf1088fad8 100644
> --- a/drivers/tty/serial/8250/8250.h
> +++ b/drivers/tty/serial/8250/8250.h
> @@ -7,6 +7,7 @@
>    *  Copyright (C) 2001 Russell King.
>    */
>   
> +#include <linux/bitops.h>
>   #include <linux/serial_8250.h>
>   #include <linux/serial_reg.h>
>   #include <linux/dmaengine.h>
> @@ -70,25 +71,25 @@ struct serial8250_config {
>   	unsigned int	flags;
>   };
>   
> -#define UART_CAP_FIFO	(1 << 8)	/* UART has FIFO */
> -#define UART_CAP_EFR	(1 << 9)	/* UART has EFR */
> -#define UART_CAP_SLEEP	(1 << 10)	/* UART has IER sleep */
> -#define UART_CAP_AFE	(1 << 11)	/* MCR-based hw flow control */
> -#define UART_CAP_UUE	(1 << 12)	/* UART needs IER bit 6 set (Xscale) */
> -#define UART_CAP_RTOIE	(1 << 13)	/* UART needs IER bit 4 set (Xscale, Tegra) */
> -#define UART_CAP_HFIFO	(1 << 14)	/* UART has a "hidden" FIFO */
> -#define UART_CAP_RPM	(1 << 15)	/* Runtime PM is active while idle */
> -#define UART_CAP_IRDA	(1 << 16)	/* UART supports IrDA line discipline */
> -#define UART_CAP_MINI	(1 << 17)	/* Mini UART on BCM283X family lacks:
> +#define UART_CAP_FIFO	BIT(8)	/* UART has FIFO */
> +#define UART_CAP_EFR	BIT(9)	/* UART has EFR */
> +#define UART_CAP_SLEEP	BIT(10)	/* UART has IER sleep */


Perfect, except the include: BIT is not defined in bitops.h, but in 
bits.h (which includes vdso/bits.h). In fact, bitops.h includes bits.h 
too, but it's superfluous to include all those bitops.

thanks,
-- 
-- 
js
suse labs
