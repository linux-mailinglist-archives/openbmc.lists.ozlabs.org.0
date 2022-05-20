Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFF752E657
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 09:37:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4JTN5VzZz3blb
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 17:37:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=VaRhJnEi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=VaRhJnEi; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4JSz5NKVz3bk3
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 17:36:51 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id B050C4FC;
 Fri, 20 May 2022 00:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1653032209;
 bh=ztKLWJLoE+N49EDh1ddRGtGJBZv3GGZQlu/G7EbWjcE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VaRhJnEiiUBNZR0COGhjf7+2edkXaPcT4aSJ8k4SpjKEPy0q57tZEbBAEK30+sotx
 lqSmqb4gO+JqUhGBMWjRBSTqBEWhVQPPtTWepcpW312i1pykA65GzlerzbL60xJgAj
 /fzMg4IlZu9StYYGJg9YLrNg67krtyAaYd24li78=
Date: Fri, 20 May 2022 00:36:48 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v3 2/3] arm/mach-aspeed:
 Add support for CONFIG_DRAM_UART_TO_UART1
Message-ID: <YodFEO1E04cwN0Ep@hatter.bewilderbeest.net>
References: <20220519150719.22338-1-patrick.rudolph@9elements.com>
 <20220519150719.22338-3-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519150719.22338-3-patrick.rudolph@9elements.com>
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
Cc: christian.walter@9elements.com, openbmc@lists.ozlabs.org, takken@us.ibm.com,
 joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 19, 2022 at 08:07:18AM PDT, Patrick Rudolph wrote:
> Update the Kconfig and allow a board to use CONFIG_DRAM_UART_TO_UART1.
> The platform code already uses this Kconfig symbol, but it always
> evaluated to false.
> This is required on IBM/Genesis3 as it uses RDX1/TDX1 as debug uart.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/mach-aspeed/ast2500/Kconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/mach-aspeed/ast2500/Kconfig b/arch/arm/mach-aspeed/ast2500/Kconfig
> index 4f992f442d..e7ff00cdba 100644
> --- a/arch/arm/mach-aspeed/ast2500/Kconfig
> +++ b/arch/arm/mach-aspeed/ast2500/Kconfig
> @@ -17,6 +17,12 @@ config TARGET_EVB_AST2500
>  	  20 pin JTAG, pinouts for 14 I2Cs, 3 SPIs and eSPI, 8 PWMs.
>  endchoice
>  
> +config DRAM_UART_TO_UART1
> +	bool
> +	prompt "Route debug UART to UART1"
> +	help
> +	  Route debug UART to TXD1/RXD1 pins.
> +

Given that the debug UART is now disabled by default and only available 
via a combination of CONFIG_ASPEED_ALLOW_DANGEROUS_BACKDOORS=y and 
CONFIG_ASPEED_ENABLE_DEBUG_UART=y, I'd suggest moving this to 
arch/arm/mach-aspeed/Kconfig in the ASPEED_ALLOW_DANGEROUS_BACKDOORS 
'if' block, perhaps in a nested 'if' block conditional on 
ASPEED_ENABLE_DEBUG_UART.

Also, I realize that name comes from previously existing code in 
platform.S, but it's not exactly the clearest, most descriptive name in 
the world (it's the debug UART, what's it go to do with DRAM?).  If 
we're going to promote it to a Kconfig option I think it'd be nice to 
improve the naming somewhat, perhaps just s/DRAM/DEBUG/.

>  source "board/aspeed/evb_ast2500/Kconfig"
>  
>  endif
> -- 
> 2.35.3
> 
