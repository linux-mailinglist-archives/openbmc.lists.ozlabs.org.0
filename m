Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABE24EAB47
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 12:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSQs45bqKz2yP4
	for <lists+openbmc@lfdr.de>; Tue, 29 Mar 2022 21:33:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=voCtLj+B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=voCtLj+B; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSQrf5wmQz2xRp
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2022 21:33:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4B311611F1;
 Tue, 29 Mar 2022 10:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55664C340ED;
 Tue, 29 Mar 2022 10:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1648549997;
 bh=5FgUcZbB4cY37HO0BUEW/2PUtsj7QGFtqc1d2v0/2BM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=voCtLj+BHaw6L6o43Gjn26OkZsTfiSI7kCCitCS4IjDywBTq6asy4eBWSoguNCfem
 MyPuyiJ0QIrOlTiLjURiqcURF5Tw8ulbJhpwXKTWoC+72uysp2F7oYadIdX2B580c4
 dZ8V0bnrTotXMNwbocLb6b3sQicpw69kamBvxKgc=
Date: Tue, 29 Mar 2022 12:33:14 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] peci: PECI should depend on ARCH_ASPEED
Message-ID: <YkLgapMN2JqM+Lte@kroah.com>
References: <f7ea35c723da72a89028da5b976ad417fbd7bf52.1648545587.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7ea35c723da72a89028da5b976ad417fbd7bf52.1648545587.git.geert@linux-m68k.org>
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Iwona Winiarska <iwona.winiarska@intel.com>, openbmc@lists.ozlabs.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 Jason M Bills <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 29, 2022 at 11:21:37AM +0200, Geert Uytterhoeven wrote:
> The Platform Environment Control Interface (PECI) is only available on
> Baseboard Management Controllers (BMC) for Intel processors.  Currently
> the only supported BMCs are ASpeed BMC SoCs.  Hence add a dependency on
> ARCH_ASPEED, to prevent asking the user about the PECI subsystem when
> configuring a kernel without ASpeed SoC support.
> 
> Fixes: 6523d3b2ffa238ac ("peci: Add core infrastructure")
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  drivers/peci/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/peci/Kconfig b/drivers/peci/Kconfig
> index 89872ad833201510..0d3ef8ba0998d649 100644
> --- a/drivers/peci/Kconfig
> +++ b/drivers/peci/Kconfig
> @@ -2,6 +2,7 @@
>  
>  menuconfig PECI
>  	tristate "PECI support"
> +	depends on ARCH_ASPEED || COMPILE_TEST

I hate ARCH_ dependencies as there is nothing specific with that one
platform that means that this driver subsystem will only work on that
one.

I'm all for fixing build dependancies, but it should be fine to build
all drivers for all arches.

So sorry, I don't like this change.

greg k-h
