Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FAE389D13
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 07:25:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Flyqv0WT9z308d
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 15:25:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.43; helo=mail-wm1-f43.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Flyqg1hvFz2xb6;
 Thu, 20 May 2021 15:25:18 +1000 (AEST)
Received: by mail-wm1-f43.google.com with SMTP id b7so7788236wmh.5;
 Wed, 19 May 2021 22:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uBDTnysTP/v0yudg9DFa2zD2k+gjVi/C3z5x9N8ueoY=;
 b=eXuQbzHVl3u3Hj+6rjM0fNFOPPrnTaf90tzN8uhPkwy+kyPwZGjAAfk4fQEH2RLSv8
 p5VHvvvY5nFfhSF83ts64e9CfVfZ6/gXUhXXhMK93M+azs1O5jYX4XnQWutfUm7Uqs5q
 R/mp88QEqKxO1o514QGpLPVr6Udh9gRMICEmWrlNBi4hxvf1a7o6EtIaAIzM+F1yXqST
 UOIVpokphCEXQFNttgRBw/Db3pwkIMzGIPrPpY+vSpjvYCawT2yiiGKd7vNcYKfTlpO6
 yOPwL0BHkc77r7BdQ7Yl5v+zU4btT8z5HnUOcKSwbYlw/Ib1hyQ6r/9BEfFyp/lN2Qfn
 ZFGg==
X-Gm-Message-State: AOAM531NwkSim9pzeE3U7dimUEpkVkCMcNNtKWRIOm9Kk3c8o54IShRL
 BPwOd3N0cuyUZqkeAER4enA=
X-Google-Smtp-Source: ABdhPJxJk7MpMpRXJ5tCRNdyCu5OIB3BCLm8IYcRkJ2azAx7L7aZj2oqaTWfUcipbqlMNiLpWPNfpg==
X-Received: by 2002:a1c:9d43:: with SMTP id g64mr1793957wme.181.1621488315285; 
 Wed, 19 May 2021 22:25:15 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id a11sm1663829wrx.38.2021.05.19.22.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 22:25:14 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] serial: 8250: Use BIT(x) for UART_{CAP,BUG}_*
To: Andrew Jeffery <andrew@aj.id.au>, linux-serial@vger.kernel.org
References: <20210520021334.497341-1-andrew@aj.id.au>
 <20210520021334.497341-3-andrew@aj.id.au>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <20eec190-d80e-b32a-8949-e5e2918a110b@kernel.org>
Date: Thu, 20 May 2021 07:25:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210520021334.497341-3-andrew@aj.id.au>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 20. 05. 21, 4:13, Andrew Jeffery wrote:
> BIT(x) improves readability and safety with respect to shifts.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> ---
>   drivers/tty/serial/8250/8250.h | 33 +++++++++++++++++----------------
>   1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
> index 34aa2714f3c9..6473361525d1 100644
> --- a/drivers/tty/serial/8250/8250.h
> +++ b/drivers/tty/serial/8250/8250.h
> @@ -7,6 +7,7 @@
>    *  Copyright (C) 2001 Russell King.
>    */
>   
> +#include <linux/bits.h>
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
> +#define UART_CAP_AFE	BIT(11)	/* MCR-based hw flow control */
> +#define UART_CAP_UUE	BIT(12)	/* UART needs IER bit 6 set (Xscale) */
> +#define UART_CAP_RTOIE	BIT(13)	/* UART needs IER bit 4 set (Xscale, Tegra) */
> +#define UART_CAP_HFIFO	BIT(14)	/* UART has a "hidden" FIFO */
> +#define UART_CAP_RPM	BIT(15)	/* Runtime PM is active while idle */
> +#define UART_CAP_IRDA	BIT(16)	/* UART supports IrDA line discipline */
> +#define UART_CAP_MINI	BIT(17)	/* Mini UART on BCM283X family lacks:
>   					 * STOP PARITY EPAR SPAR WLEN5 WLEN6
>   					 */
>   
> -#define UART_BUG_QUOT	(1 << 0)	/* UART has buggy quot LSB */
> -#define UART_BUG_TXEN	(1 << 1)	/* UART has buggy TX IIR status */
> -#define UART_BUG_NOMSR	(1 << 2)	/* UART has buggy MSR status bits (Au1x00) */
> -#define UART_BUG_THRE	(1 << 3)	/* UART has buggy THRE reassertion */
> -#define UART_BUG_PARITY	(1 << 4)	/* UART mishandles parity if FIFO enabled */
> -#define UART_BUG_TXRACE	(1 << 5)	/* UART Tx fails to set remote DR */
> +#define UART_BUG_QUOT	BIT(0)	/* UART has buggy quot LSB */
> +#define UART_BUG_TXEN	BIT(1)	/* UART has buggy TX IIR status */
> +#define UART_BUG_NOMSR	BIT(2)	/* UART has buggy MSR status bits (Au1x00) */
> +#define UART_BUG_THRE	BIT(3)	/* UART has buggy THRE reassertion */
> +#define UART_BUG_PARITY	BIT(4)	/* UART mishandles parity if FIFO enabled */
> +#define UART_BUG_TXRACE	BIT(5)	/* UART Tx fails to set remote DR */
>   
>   
>   #ifdef CONFIG_SERIAL_8250_SHARE_IRQ
> 


-- 
js
suse labs
