Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD2B4B4669
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 10:41:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxzkD1gzWz3bsp
	for <lists+openbmc@lfdr.de>; Mon, 14 Feb 2022 20:41:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M5YYmuNv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=M5YYmuNv; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxzjl6mdYz2yfh;
 Mon, 14 Feb 2022 20:40:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644831644; x=1676367644;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3/09I1n8tM0mZCHQ3uFQ3S+6UyEYzwV22RF7qUJV4DY=;
 b=M5YYmuNvKN2/Vt/Ff2b6U0JHD6rn+APZia6J97mNH8MIOi3Yq703cXLj
 qo37tkUjjCzrDplYF/kCQbPQ3iVTfpxjdJodNJsMurG02LuspvvzBtdHX
 gLMtcnCgnHrcvHmeZJFctHcGYad2kfmNFpMyAY5f7lizG/p3/VOcwpNBE
 3iJl5jfNvNDr7DpegZ6Cnh6m9QSRlLgAcEJE9IqjBw2vcsWbiFO33dKNB
 RQJdtZA3ntbtsHtUtU6SMN/jBcTPmso+LMVXnbMv+Pex60yBDTQVeQdez
 JkYyuNKeQ5vZnkTky0wHm0jTmjs2CooDnx1Ccl7QL1G4mi1NYK3gm/UQw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="230017158"
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="230017158"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 01:39:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,367,1635231600"; d="scan'208";a="702986357"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 01:39:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nJXoa-004Obi-LW; Mon, 14 Feb 2022 11:38:36 +0200
Date: Mon, 14 Feb 2022 11:38:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2] serial: 8250_aspeed_vuart: add PORT_ASPEED_VUART port
 type
Message-ID: <YgojHCCeeNbSx+9K@smile.fi.intel.com>
References: <20220211004203.14915-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220211004203.14915-1-zev@bewilderbeest.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: linux-aspeed@lists.ozlabs.org, Konstantin Aladyshev <aladyshev22@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Oskar Senft <osk@google.com>,
 linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Feb 10, 2022 at 04:42:03PM -0800, Zev Weiss wrote:
> Commit 54da3e381c2b ("serial: 8250_aspeed_vuart: use UPF_IOREMAP to
> set up register mapping") fixed a bug that had, as a side-effect,
> prevented the 8250_aspeed_vuart driver from enabling the VUART's
> FIFOs.  However, fixing that (and hence enabling the FIFOs) has in
> turn revealed what appears to be a hardware bug in the ASPEED VUART in
> which the host-side THRE bit doesn't get if the BMC-side receive FIFO
> trigger level is set to anything but one byte.  This causes problems
> for polled-mode writes from the host -- for example, Linux kernel
> console writes proceed at a glacial pace (less than 100 bytes per
> second) because the write path waits for a 10ms timeout to expire
> after every character instead of being able to continue on to the next
> character upon seeing THRE asserted.  (GRUB behaves similarly.)
> 
> As a workaround, introduce a new port type for the ASPEED VUART that's
> identical to PORT_16550A as it had previously been using, but with
> UART_FCR_R_TRIG_00 instead to set the receive FIFO trigger level to
> one byte, which (experimentally) seems to avoid the problematic THRE
> behavior.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Tested-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> Fixes: 54da3e381c2b ("serial: 8250_aspeed_vuart: use UPF_IOREMAP to set up register mapping")
> ---
> 
> Changes since v1 [0]:
>  - Added Fixes: tag
>  - Shifted PORT_* constant down into an unused gap
> 
> [0] https://lore.kernel.org/all/20220209203414.23491-1-zev@bewilderbeest.net/
> 
>  drivers/tty/serial/8250/8250_aspeed_vuart.c | 2 +-
>  drivers/tty/serial/8250/8250_port.c         | 8 ++++++++
>  include/uapi/linux/serial_core.h            | 3 +++
>  3 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> index 2350fb3bb5e4..c2cecc6f47db 100644
> --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> @@ -487,7 +487,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>  	port.port.irq = irq_of_parse_and_map(np, 0);
>  	port.port.handle_irq = aspeed_vuart_handle_irq;
>  	port.port.iotype = UPIO_MEM;
> -	port.port.type = PORT_16550A;
> +	port.port.type = PORT_ASPEED_VUART;
>  	port.port.uartclk = clk;
>  	port.port.flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF | UPF_IOREMAP
>  		| UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_NO_THRE_TEST;
> diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> index 3b12bfc1ed67..973870ebff69 100644
> --- a/drivers/tty/serial/8250/8250_port.c
> +++ b/drivers/tty/serial/8250/8250_port.c
> @@ -307,6 +307,14 @@ static const struct serial8250_config uart_config[] = {
>  		.rxtrig_bytes	= {1, 32, 64, 112},
>  		.flags		= UART_CAP_FIFO | UART_CAP_SLEEP,
>  	},
> +	[PORT_ASPEED_VUART] = {
> +		.name		= "ASPEED VUART",
> +		.fifo_size	= 16,
> +		.tx_loadsz	= 16,
> +		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_00,
> +		.rxtrig_bytes	= {1, 4, 8, 14},
> +		.flags		= UART_CAP_FIFO,
> +	},
>  };
>  
>  /* Uart divisor latch read */
> diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_core.h
> index c4042dcfdc0c..8885e69178bd 100644
> --- a/include/uapi/linux/serial_core.h
> +++ b/include/uapi/linux/serial_core.h
> @@ -68,6 +68,9 @@
>  /* NVIDIA Tegra Combined UART */
>  #define PORT_TEGRA_TCU	41
>  
> +/* ASPEED AST2x00 virtual UART */
> +#define PORT_ASPEED_VUART	42
> +
>  /* Intel EG20 */
>  #define PORT_PCH_8LINE	44
>  #define PORT_PCH_2LINE	45
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko


