Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9A73887BD
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 08:44:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlNd85vzVz301k
	for <lists+openbmc@lfdr.de>; Wed, 19 May 2021 16:44:12 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlMtx1Lqbz2yX9;
 Wed, 19 May 2021 16:11:04 +1000 (AEST)
Received: by mail-wr1-f50.google.com with SMTP id i17so12608543wrq.11;
 Tue, 18 May 2021 23:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E0IobIzQGFKtYjnVLAhsERrEFaAtOpKnjVXmJUrJllo=;
 b=lty0lDMc6oImwy7cffQQA9ZInT+NFneoKh7PwyoNYR+zFXDuIiSjVK3JEjRLU/3RBL
 1tmzqtE69R9i9NyR3FuWv35GEoRuhXZbv9I1/Qux+CCptMpzIFnoiJ346/NdwyluLiB8
 /B1Qlge57KcGIL+AfDLrSfhcHT+vU6P4VYjObZlZnwZeUAYwh5Ww2C33MNANhBfRpIUk
 cziiFApp7nv5qbTnutYMeJeUKSpG7k8h0hHfizJ+zJU6dScfG0h1mp2xTANySfZ0YMMX
 0k9xwEae/J98QlG6xKmryv4furrm3BhJ6ZGY01jK72ASCaxVTJlqsu7nzJSxTXL6jCby
 ngfg==
X-Gm-Message-State: AOAM532h904wx22ntrqjRLmrEid5a5bHXZ9iNYQwAXdna/8ncxbKGE/n
 SoGBUKz+2qcEeoqrVzfeTxY=
X-Google-Smtp-Source: ABdhPJwIim9jf63DzBY3rwRC398B+hBCfBG7+Rs9X9JQQtLHoS1CD+Yq0iLOe0Ctgxg5qXG/UsNQ8A==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr12461094wrp.300.1621404660316; 
 Tue, 18 May 2021 23:11:00 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id m10sm24644065wrr.2.2021.05.18.23.10.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 23:10:59 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] serial: 8250: Add UART_BUG_TXRACE workaround for
 Aspeed VUART
To: Andrew Jeffery <andrew@aj.id.au>, linux-serial@vger.kernel.org
References: <20210519000704.3661773-1-andrew@aj.id.au>
 <20210519000704.3661773-2-andrew@aj.id.au>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <8c14289a-9e81-f8de-b451-664a72ea5963@kernel.org>
Date: Wed, 19 May 2021 08:10:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210519000704.3661773-2-andrew@aj.id.au>
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
 ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 19. 05. 21, 2:07, Andrew Jeffery wrote:
> Aspeed Virtual UARTs directly bridge e.g. the system console UART on the
> LPC bus to the UART interface on the BMC's internal APB. As such there's
> no RS-232 signalling involved - the UART interfaces on each bus are
> directly connected as the producers and consumers of the one set of
> FIFOs.
> 
> The APB in the AST2600 generally runs at 100MHz while the LPC bus peaks
> at 33MHz. The difference in clock speeds exposes a race in the VUART
> design where a Tx data burst on the APB interface can result in a byte
> lost on the LPC interface. The symptom is LSR[DR] remains clear on the
> LPC interface despite data being present in its Rx FIFO, while LSR[THRE]
> remains clear on the APB interface as the host has not consumed the data
> the BMC has transmitted. In this state, the UART has stalled and no
> further data can be transmitted without manual intervention (e.g.
> resetting the FIFOs, resulting in loss of data).
> 
> The recommended work-around is to insert a read cycle on the APB
> interface between writes to THR.
> 
> Cc: ChiaWei Wang <chiawei_wang@aspeedtech.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/tty/serial/8250/8250.h              |  1 +
>   drivers/tty/serial/8250/8250_aspeed_vuart.c |  1 +
>   drivers/tty/serial/8250/8250_port.c         | 10 ++++++++++
>   3 files changed, 12 insertions(+)
> 
> diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
> index 52bb21205bb6..34aa2714f3c9 100644
> --- a/drivers/tty/serial/8250/8250.h
> +++ b/drivers/tty/serial/8250/8250.h
> @@ -88,6 +88,7 @@ struct serial8250_config {
>   #define UART_BUG_NOMSR	(1 << 2)	/* UART has buggy MSR status bits (Au1x00) */
>   #define UART_BUG_THRE	(1 << 3)	/* UART has buggy THRE reassertion */
>   #define UART_BUG_PARITY	(1 << 4)	/* UART mishandles parity if FIFO enabled */
> +#define UART_BUG_TXRACE	(1 << 5)	/* UART Tx fails to set remote DR */
>   
>   
>   #ifdef CONFIG_SERIAL_8250_SHARE_IRQ
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index a28a394ba32a..4caab8714e2c 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -440,6 +440,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>   	port.port.status = UPSTAT_SYNC_FIFO;
>   	port.port.dev = &pdev->dev;
>   	port.port.has_sysrq = IS_ENABLED(CONFIG_SERIAL_8250_CONSOLE);
> +	port.bugs |= UART_BUG_TXRACE;
>   
>   	rc = sysfs_create_group(&vuart->dev->kobj, &aspeed_vuart_attr_group);
>   	if (rc < 0)
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index d45dab1ab316..9d44b2b2ff18 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -1809,6 +1809,16 @@ void serial8250_tx_chars(struct uart_8250_port *up)
>   	count = up->tx_loadsz;
>   	do {
>   		serial_out(up, UART_TX, xmit->buf[xmit->tail]);
> +		if (up->bugs & UART_BUG_TXRACE) {
> +			/* The Aspeed BMC virtual UARTs have a bug where data

This is not how a multiline comment should start. It should have been:
			/*
			 * The Aspeed BMC virtual...

> +			 * may get stuck in the BMC's Tx FIFO from bursts of
> +			 * writes on the APB interface.
> +			 *
> +			 * Delay back-to-back writes by a read cycle to avoid
> +			 * stalling the VUART.
> +			 */
> +			(void)serial_in(up, UART_SCR);

(void) is useless here. It's only syntactic sugar which wouldn't even 
filter out a warning about unused result (if serial_in was marked w/ 
__must_check/warn_unused_result attribute).

> +		}
>   		xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
>   		port->icount.tx++;
>   		if (uart_circ_empty(xmit))
> 

thanks,
-- 
js
suse labs
