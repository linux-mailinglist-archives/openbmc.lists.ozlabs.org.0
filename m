Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C90A96E540
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2024 23:43:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0CXr3m9Pz3cGM
	for <lists+openbmc@lfdr.de>; Fri,  6 Sep 2024 07:43:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725572617;
	cv=none; b=WzOKHMaZGdAqRTLnBnBxhkBgagzlzxwDL/GN7GMurqhIW4u5xqmtrn7pEDx6HG4b4nPGW6RAOI2qY/ggxBBb1odF/yh3PECE6vv48NpER3nKbdpkzzGYuBhte7TpNvGeCrPgvRvI3cRABzbrwPWxp2JgwLt0sRhr+DaqtGiN1ReMfo+AMSnW5C8+cpXenArQJfs1JQvi7EpOdQWiyfnENQRLy5yjas2aWkatOIIMvfnqq2Ns5n9OuPrgEyHCmjh4XYxBENAnikkBweCNYozEXR8o/jFvIr4rS0ajtpIzqO9u9nQxE44sTJhWl07Jxxk4IQcl3o8ZxTBApElDGJYxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725572617; c=relaxed/relaxed;
	bh=8c3obiWn1Z8L8MGp0Y/RuurivVR2mczSYynI/Yosktc=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=Forg3AC7xuGbDsVyngFxEQ27P4C5rSp7XNgq6kWS8H8JjgSdB0GaBMmNAqCbhxoFmQXMrMQqJQlgTLOm+C6Gnw2AQT+MLtcA7sY6Fp3PW9w7UAC9qa9QttmEuVv/ZXecthStBkd9PoaiLktlaovms3tu9ENdAHR0oRFjfb+7HnMykcGLUMip5rRNs58Qxm0a9fU/IGZ8+kgyw7rrKMdmney6r+f/R8gXlzagBNjibyMgVMfU+FXauiTMVcBy0ts8tqAI5JlAf/tF+TegG+++hHRHm848GrBHzoKMbf2s2IPHZF99av8mJdh0CXWkUYo4q4xbCqGQ4A+SmDNIJO9vQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RK8Rgy8L; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RK8Rgy8L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0CXn24dfz2yxP
	for <openbmc@lists.ozlabs.org>; Fri,  6 Sep 2024 07:43:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BAF9BA405BB;
	Thu,  5 Sep 2024 21:43:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B879C4CEC3;
	Thu,  5 Sep 2024 21:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725572614;
	bh=7lGyC41JD4CgqMu6iaebpgliZkHn/0RJMVcb4xV6/LU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RK8Rgy8L4M8VPqnHXtCNjNZzJYUQMHhFNgadI4HCB2qnjCfakIt1VHLnK7OeAwyAy
	 0MUR0y8nNf4Q7OuTt5W77DjJc47m+LqhHiIkRIghJ0TpCpZY2L4VhW/P60cOujiwHD
	 dctaJPuu4FPy5Boxka8YvsYEDVIq6vpokjLbWQCoqenxyRfmJI3Vd4LS967SSQBHnQ
	 Gr1XZQQE99eCsEeYirkfLepcqxIxtuBymzOOVO8NIhmeEoQx71JYiIBb0dU+X4aeto
	 4lAgK0yrbx9C7iQo3oFPN7aXkHS4cSnL2UA6tiFWWEVfw/Y+MX+tOFhrcmHiVFdgti
	 YDR6ixRvRkghw==
Date: Thu, 5 Sep 2024 23:43:30 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tyrone Ting <warp5tw@gmail.com>
Subject: Re: [PATCH v2 6/7] i2c: npcm: use i2c frequency table
Message-ID: <3wz36hrpicogoakqhmveppcrt6s52zmlcgjpio3wwpil3rdwdi@ft7tloqqf2zt>
References: <20240830034640.7049-1-kfting@nuvoton.com>
 <20240830034640.7049-7-kfting@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830034640.7049-7-kfting@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, tomer.maimon@nuvoton.com, benjaminfair@google.com, wsa+renesas@sang-engineering.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kfting@nuvoton.com, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, wsa@kernel.org, tali.perry@nuvoton.com, linux-i2c@vger.kernel.org, Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com, rand.sec96@gmail.com, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, Aug 30, 2024 at 11:46:39AM GMT, Tyrone Ting wrote:
> Modify i2c frequency from table parameters
> for NPCM i2c modules.
> 
> Supported frequencies are:
> 
> 1. 100KHz
> 2. 400KHz
> 3. 1MHz

I agree with Andy, please add a good explanation for this change.

> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 230 +++++++++++++++++++------------
>  1 file changed, 144 insertions(+), 86 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
> index 67d156ed29b9..cac4ea0b69b8 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -263,6 +263,121 @@ static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] = {
>  #define I2C_FREQ_MIN_HZ			10000
>  #define I2C_FREQ_MAX_HZ			I2C_MAX_FAST_MODE_PLUS_FREQ
>  
> +struct SMB_TIMING_T {

Please run checkpatch.pl before sending the patches.

Thanks,
Andi
