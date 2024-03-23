Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A9B8877C8
	for <lists+openbmc@lfdr.de>; Sat, 23 Mar 2024 10:21:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AmGkF125;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1txc0Tmhz3dSv
	for <lists+openbmc@lfdr.de>; Sat, 23 Mar 2024 20:21:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AmGkF125;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1tw90gByz3bsw;
	Sat, 23 Mar 2024 20:20:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 352B7CE0959;
	Sat, 23 Mar 2024 09:20:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51C0C433F1;
	Sat, 23 Mar 2024 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711185636;
	bh=aGTQuZy7vZpxuhlc2uWM1FWO2cNVLUpXYHPr+30NYM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmGkF125xegySFWAiHvPntmZ+07s8hZQPC/0IVIftdkxYeMJTqDHDoBaq087Sl4Ry
	 qKx2QcAVw6S410SG7j4biAqt4/h5dTjc1vKUs5R8LJBjxtJSQyMNE1PxZTAhzLwpa+
	 ZvDOHlqhfPGo+3K1JP9tq5K11rxRL31gNRIYe4fcfJjyAcpNQmozM0AzDwGqt7aAAm
	 vL1bo7yWAyyXHWJXICav98Il7syCI5t9aEO0HLvfyTQ7cJVQX5WfpHiaD8JmvRG1Zm
	 VmI4taBLphr2uo/nVmCk1uj3x3TE6/IYqaCXMkAcTk/3yvQe9KoaZIneVeSaGY4Thk
	 hCCXd6I1k2Bcg==
Date: Sat, 23 Mar 2024 10:20:32 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 00/64] i2c: reword i2c_algorithm according to newest
 specification
Message-ID: <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
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
Cc: imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, openbmc@lists.ozlabs.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, virtualization@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, asahi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:24:53PM +0100, Wolfram Sang wrote:
> Okay, we need to begin somewhere...
> 
> Start changing the wording of the I2C main header wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. This first step renames the members of struct
> i2c_algorithm. Once all in-tree users are converted, the anonymous union
> will go away again. All this work will also pave the way for finally
> seperating the monolithic header into more fine-grained headers like
> "i2c/clients.h" etc. So, this is not a simple renaming-excercise but
> also a chance to update the I2C core to recent Linux standards.

yes, very good! It's clearly stated in all three documentations
that Target replaces Slave and Controller replaces Master (i3c is
at the 1.1.1 version).

> My motivation is to improve the I2C core API, in general. My motivation
> is not to clean each and every driver. I think this is impossible
> because register names based on official documentation will need to stay
> as they are. But the Linux-internal names should be updated IMO.

Also because some drivers have been written based on previous
specifications where master/slave was used.

> That being said, I worked on 62 drivers in this series beyond plain
> renames inside 'struct i2c_algorithm' because the fruits were so
> low-hanging. Before this series, 112 files in the 'busses/' directory
> contained 'master' and/or 'slave'. After the series, only 57. Why not?
> 
> Next step is updating the drivers outside the 'i2c'-folder regarding
> 'struct i2c_algorithm' so we can remove the anonymous union ASAP. To be
> able to work on this with minimal dependencies, I'd like to apply this
> series between -rc1 and -rc2.
> 
> I hope this will work for you guys. The changes are really minimal. If
> you are not comfortable with changes to your driver or need more time to
> review, please NACK the patch and I will drop the patch and/or address
> the issues separeately.
> 
> @Andi: are you okay with this approach? It means you'd need to merge
> -rc2 into your for-next branch. Or rebase if all fails.

I think it's a good plan, I'll try to support you with it.

> Speaking of Andi, thanks a lot to him taking care of the controller
> drivers these days. His work really gives me the freedom to work on I2C
> core issues again.

Thank you, Wolfram!

Andi
