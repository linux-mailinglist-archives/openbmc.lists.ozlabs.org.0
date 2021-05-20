Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F1C389D0F
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 07:25:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlyqQ59Vzz305k
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 15:25:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.48; helo=mail-wr1-f48.google.com;
 envelope-from=jirislaby@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Flyq65lNrz2xtv;
 Thu, 20 May 2021 15:24:50 +1000 (AEST)
Received: by mail-wr1-f48.google.com with SMTP id i17so16179590wrq.11;
 Wed, 19 May 2021 22:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=11ZQ56HwZc4BV5BR48kEPzW4yk428PdNM1asWtUZ9+U=;
 b=Fe7gzLbOoYVoad22v9ehsjNlylxtAv09mu7NS1Y76CDhwX0V4sl8SobO9bS0Pn+VLg
 TKCkHcXgA8++4TlWbfeYnYohLRajJygapLjovujaXoHpq4//Laj38C8EUdZXIzM5OxFd
 Sm/D6+2Vd5jE01YjI43Qien9wEt1kTToxfsIxX+YYu4v7sHrMQTb3pFZoesv4t9VsR62
 E/+4IePAK7p/5V9PJEjjlhY1GpMBwiaNlGJGuMnJn01pAZoAVGiiOLx4+0+BQmD2Knmf
 R0hFgPdQ1CNR6IOXRdRfPQAlrhRPGlkgDbRT4r+2E/NeAkEoSBYlKTDrSRPuMNXup+S6
 zWPw==
X-Gm-Message-State: AOAM533LI673sTCCXCKdPLCdObUnTmX5YSUJTtcoUizFpNGBuRRy0cGJ
 zj3mrOJ0CYZiGTfUwUhwoiw=
X-Google-Smtp-Source: ABdhPJxL1ddfj/EY9f/Lv0AnafurtOPdOSn4JIWylC+vH9knX7psIsJVIOw0mB1hSIWDPo5AA2wfEA==
X-Received: by 2002:a5d:554e:: with SMTP id g14mr2240537wrw.131.1621488287419; 
 Wed, 19 May 2021 22:24:47 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::70f? ([2a0b:e7c0:0:107::70f])
 by smtp.gmail.com with ESMTPSA id r5sm1605843wmh.23.2021.05.19.22.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 22:24:46 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] serial: 8250: Add UART_BUG_TXRACE workaround for
 Aspeed VUART
To: Andrew Jeffery <andrew@aj.id.au>, linux-serial@vger.kernel.org
References: <20210520021334.497341-1-andrew@aj.id.au>
 <20210520021334.497341-2-andrew@aj.id.au>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <b8eed269-f30d-af69-dbc2-c9fa70009091@kernel.org>
Date: Thu, 20 May 2021 07:24:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210520021334.497341-2-andrew@aj.id.au>
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
 ChiaWei Wang <chiawei_wang@aspeedtech.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 20. 05. 21, 4:13, Andrew Jeffery wrote:
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

Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

> ---
>   drivers/tty/serial/8250/8250.h              |  1 +
>   drivers/tty/serial/8250/8250_aspeed_vuart.c |  1 +
>   drivers/tty/serial/8250/8250_port.c         | 12 ++++++++++++
>   3 files changed, 14 insertions(+)
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
> index d45dab1ab316..fc5ab2032282 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -1809,6 +1809,18 @@ void serial8250_tx_chars(struct uart_8250_port *up)
>   	count = up->tx_loadsz;
>   	do {
>   		serial_out(up, UART_TX, xmit->buf[xmit->tail]);
> +		if (up->bugs & UART_BUG_TXRACE) {
> +			/*
> +			 * The Aspeed BMC virtual UARTs have a bug where data
> +			 * may get stuck in the BMC's Tx FIFO from bursts of
> +			 * writes on the APB interface.
> +			 *
> +			 * Delay back-to-back writes by a read cycle to avoid
> +			 * stalling the VUART. Read a register that won't have
> +			 * side-effects and discard the result.
> +			 */
> +			serial_in(up, UART_SCR);
> +		}
>   		xmit->tail = (xmit->tail + 1) & (UART_XMIT_SIZE - 1);
>   		port->icount.tx++;
>   		if (uart_circ_empty(xmit))
> 


-- 
js
suse labs
