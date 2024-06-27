Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE6491AB2F
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 17:26:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eH3LbD4L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W92TY5CFqz3cZJ
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 01:26:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eH3LbD4L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W92T12lybz3cTG;
	Fri, 28 Jun 2024 01:25:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5DC5861EF6;
	Thu, 27 Jun 2024 15:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CEF9C2BBFC;
	Thu, 27 Jun 2024 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719501937;
	bh=DcIqrfoXRxHNxqbWkcMoWg8BFR191VB6t9DH5BOodQE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eH3LbD4LMJBU52nravUhcazsfvfmVmy1p/PKyBtPNa2I3v0IEv/MbXFRfhgbgo+vy
	 g8O5SLA7juKfFyeRtiaP2rwgDRT2G+XTFFitFYiYUi/cgnRYySoeWVxTtlf+ht0AlT
	 QuGlRFDxKQV21chZqgny9mdYpNKqS1eFX6nuRDW1/jYGGnNZ5uEQjl5mmPcXY51ad9
	 qKoppAJqBLynl8o7uilVtC86RdoYIP2ZvocuixFxup4WZnMZ9WWFatdLCqGHIMNWjI
	 xbnW9CNIcPCLZMELio4RyhfeCCmL8/2cOIU00Y26YYRSuHzjb17AcX9Xc6SBQWYpP8
	 iVcCEwmTqRodA==
Date: Thu, 27 Jun 2024 17:25:33 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH v2] i2c: aspeed: Update the stop sw state when the bus
 recovery occurs
Message-ID: <pbsrfzbd237k5inof3wy6qabdmolmweozkn5kq7jlvstj2nkvo@nzp2sbrxpn44>
References: <20240608043653.4086647-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240608043653.4086647-1-tommy_huang@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, wsa@kernel.org, brendan.higgins@linux.dev, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tommy,

any update on this patch?

Andi

On Sat, Jun 08, 2024 at 12:36:53PM GMT, Tommy Huang wrote:
> When the i2c bus recovery occurs, driver will send i2c stop command
> in the scl low condition. In this case the sw state will still keep
> original situation. Under multi-master usage, i2c bus recovery will
> be called when i2c transfer timeout occurs. Update the stop command
> calling with aspeed_i2c_do_stop function to update master_state.
> 
> Fixes: f327c686d3ba ("i2c: aspeed: added driver for Aspeed I2C")
> 
> Cc: <stable@vger.kernel.org> # v4.13+
> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index ce8c4846b7fa..be64e419adf0 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -25,6 +25,8 @@
>  #include <linux/reset.h>
>  #include <linux/slab.h>
>  
> +static void aspeed_i2c_do_stop(struct aspeed_i2c_bus *bus);
> +
>  /* I2C Register */
>  #define ASPEED_I2C_FUN_CTRL_REG				0x00
>  #define ASPEED_I2C_AC_TIMING_REG1			0x04
> @@ -187,7 +189,7 @@ static int aspeed_i2c_recover_bus(struct aspeed_i2c_bus *bus)
>  			command);
>  
>  		reinit_completion(&bus->cmd_complete);
> -		writel(ASPEED_I2CD_M_STOP_CMD, bus->base + ASPEED_I2C_CMD_REG);
> +		aspeed_i2c_do_stop(bus);
>  		spin_unlock_irqrestore(&bus->lock, flags);
>  
>  		time_left = wait_for_completion_timeout(
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
