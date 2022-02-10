Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 493C84B080A
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 09:20:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvV7C6xpWz3bYh
	for <lists+openbmc@lfdr.de>; Thu, 10 Feb 2022 19:20:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=VASQNFNA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=VASQNFNA; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvV6p1lN0z30Pf;
 Thu, 10 Feb 2022 19:20:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D250615D3;
 Thu, 10 Feb 2022 08:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C442C004E1;
 Thu, 10 Feb 2022 08:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1644481215;
 bh=8gIcfyW0sMk2anZv0r3OTynsNPwDNEkdR7Q4n+X25TA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VASQNFNAN2Xg9L8/Klk8/VrzOEmUx0wMjG2l+z74A2KESayDfgZ2ciFz8nJCH/93f
 X+oZwtCEpF4rRrnbOPqj1w7nO4kUY0Qz+OZQ09xQyGr/TaO/rP50YMMvRLlaSeYYqD
 qDoabWhqURNMnseklYF4Uf4lG6rSLHORINqWwFQw=
Date: Thu, 10 Feb 2022 09:20:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH] serial: 8250_aspeed_vuart: add PORT_ASPEED_VUART port type
Message-ID: <YgTKvIqTIOomFSsF@kroah.com>
References: <20220209203414.23491-1-zev@bewilderbeest.net>
 <YgTBennInxX3fE3X@kroah.com>
 <YgTDm5qKUJyzciR2@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgTDm5qKUJyzciR2@hatter.bewilderbeest.net>
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
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Oskar Senft <osk@google.com>,
 linux-serial@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 09, 2022 at 11:49:47PM -0800, Zev Weiss wrote:
> On Wed, Feb 09, 2022 at 11:40:42PM PST, Greg Kroah-Hartman wrote:
> > On Wed, Feb 09, 2022 at 12:34:14PM -0800, Zev Weiss wrote:
> > > Commit 54da3e381c2b ("serial: 8250_aspeed_vuart: use UPF_IOREMAP to
> > > set up register mapping") fixed a bug that had, as a side-effect,
> > > prevented the 8250_aspeed_vuart driver from enabling the VUART's
> > > FIFOs.  However, fixing that (and hence enabling the FIFOs) has in
> > > turn revealed what appears to be a hardware bug in the ASPEED VUART in
> > > which the host-side THRE bit doesn't get if the BMC-side receive FIFO
> > > trigger level is set to anything but one byte.  This causes problems
> > > for polled-mode writes from the host -- for example, Linux kernel
> > > console writes proceed at a glacial pace (less than 100 bytes per
> > > second) because the write path waits for a 10ms timeout to expire
> > > after every character instead of being able to continue on to the next
> > > character upon seeing THRE asserted.  (GRUB behaves similarly.)
> > > 
> > > As a workaround, introduce a new port type for the ASPEED VUART that's
> > > identical to PORT_16550A as it had previously been using, but with
> > > UART_FCR_R_TRIG_00 instead to set the receive FIFO trigger level to
> > > one byte, which (experimentally) seems to avoid the problematic THRE
> > > behavior.
> > > 
> > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > > Tested-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> > 
> > Do we need a "Fixes:" tag here as well?
> 
> I was wondering the same -- I left it out because it didn't seem like it was
> strictly a bug in the earlier commit that's really being fixed per se, but
> perhaps that's an overly pedantic distinction.  I can certainly add it if
> you'd prefer.

This obviously fixes an issue, if you don't have a specific commit that
caused it, a cc: stable@vger.kernel.org should be added so we know to
backport this to all stable kernels.

> 
> > 
> > > ---
> > >  drivers/tty/serial/8250/8250_aspeed_vuart.c | 2 +-
> > >  drivers/tty/serial/8250/8250_port.c         | 8 ++++++++
> > >  include/uapi/linux/serial_core.h            | 3 +++
> > >  3 files changed, 12 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > > index 2350fb3bb5e4..c2cecc6f47db 100644
> > > --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > > +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > > @@ -487,7 +487,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
> > >  	port.port.irq = irq_of_parse_and_map(np, 0);
> > >  	port.port.handle_irq = aspeed_vuart_handle_irq;
> > >  	port.port.iotype = UPIO_MEM;
> > > -	port.port.type = PORT_16550A;
> > > +	port.port.type = PORT_ASPEED_VUART;
> > >  	port.port.uartclk = clk;
> > >  	port.port.flags = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF | UPF_IOREMAP
> > >  		| UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_NO_THRE_TEST;
> > > diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
> > > index 3b12bfc1ed67..973870ebff69 100644
> > > --- a/drivers/tty/serial/8250/8250_port.c
> > > +++ b/drivers/tty/serial/8250/8250_port.c
> > > @@ -307,6 +307,14 @@ static const struct serial8250_config uart_config[] = {
> > >  		.rxtrig_bytes	= {1, 32, 64, 112},
> > >  		.flags		= UART_CAP_FIFO | UART_CAP_SLEEP,
> > >  	},
> > > +	[PORT_ASPEED_VUART] = {
> > > +		.name		= "ASPEED VUART",
> > > +		.fifo_size	= 16,
> > > +		.tx_loadsz	= 16,
> > > +		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_00,
> > > +		.rxtrig_bytes	= {1, 4, 8, 14},
> > > +		.flags		= UART_CAP_FIFO,
> > > +	},
> > >  };
> > > 
> > >  /* Uart divisor latch read */
> > > diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_core.h
> > > index c4042dcfdc0c..cd11748833e6 100644
> > > --- a/include/uapi/linux/serial_core.h
> > > +++ b/include/uapi/linux/serial_core.h
> > > @@ -274,4 +274,7 @@
> > >  /* Freescale LINFlexD UART */
> > >  #define PORT_LINFLEXUART	122
> > > 
> > > +/* ASPEED AST2x00 virtual UART */
> > > +#define PORT_ASPEED_VUART	123
> > 
> > Why does this value have to be in a uapi header file?  What userspace
> > tool is going to need this?
> > 
> 
> I only put it there because that was where all the other port type constants
> were defined, and wondered the same thing about the lot of them.  Is there a
> userspace tool that makes use of any of these?

Not really, please don't add it if you do not require it.

thanks,

greg k-h
