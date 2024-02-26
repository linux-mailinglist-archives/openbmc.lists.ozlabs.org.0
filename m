Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 740FA86761B
	for <lists+openbmc@lfdr.de>; Mon, 26 Feb 2024 14:11:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iM4EEFJF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk1Fy1lqyz3cRc
	for <lists+openbmc@lfdr.de>; Tue, 27 Feb 2024 00:11:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iM4EEFJF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk1FP6XVYz3cGD
	for <openbmc@lists.ozlabs.org>; Tue, 27 Feb 2024 00:10:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFC2461159;
	Mon, 26 Feb 2024 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80DA3C43394;
	Mon, 26 Feb 2024 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708953030;
	bh=2ZRKSz20uf5qtYVZ+ImiTNm8ZkqunWH4zizwS91rpTk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=iM4EEFJFBV8tLm5uGeIlPbUxkriGewZWbytfqsS5w2OMj2oj3gBp5vBXXfFsmFw4y
	 Ku6j1BLjTv/6dwHPPy1aeefoEwKmG7CLATltXDpFqlTzeNnkEjk0+K92b7cUuUrri/
	 sviGVz3mgFieH/Ubpjr14nueN/mjQHJ9sz4YjOa7dvuYR/vp58skgRiTnCDpODGxmg
	 ySMkAzJ+IEfOsLz1xsLuc0h/k6PpGMCZnS67yuD4TsrL/PrIcEPvTWUAb14vkpRxXI
	 D9hrhJIK/NrZp7G1Q3Vg7btNajKM7mvfHTYqImxN3UIkmj399xul6y1N4KbTql4qpS
	 ZEQZvs1sp4PrA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 617DFD88FB4;
	Mon, 26 Feb 2024 13:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2 0/4] net: pcs: xpcs: Cleanups before adding MMIO
 dev support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <170895303039.847.5849181262053799577.git-patchwork-notify@kernel.org>
Date: Mon, 26 Feb 2024 13:10:30 +0000
References: <20240222175843.26919-1-fancer.lancer@gmail.com>
In-Reply-To: <20240222175843.26919-1-fancer.lancer@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
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
Cc: Jose.Abreu@synopsys.com, andrew@lunn.ch, pabeni@redhat.com, mengyuanlou@net-swift.com, alexandre.torgue@foss.st.com, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, tmaimon77@gmail.com, linux@armlinux.org.uk, jiawenwu@trustnetic.com, maxime.chevallier@bootlin.com, edumazet@google.com, joabreu@synopsys.com, kuba@kernel.org, olteanv@gmail.com, davem@davemloft.net, linux-kernel@vger.kernel.org, hkallweit1@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Thu, 22 Feb 2024 20:58:19 +0300 you wrote:
> As stated in the subject this series is a short prequel before submitting
> the main patches adding the memory-mapped DW XPCS support to the DW XPCS
> and DW *MAC (STMMAC) drivers. Originally it was a part of the bigger
> patchset (see the changelog v2 link below) but was detached to a
> preparation set to shrink down the main series thus simplifying it'
> review.
> 
> [...]

Here is the summary with links:
  - [net-next,v2,1/4] net: pcs: xpcs: Drop sentinel entry from 2500basex ifaces list
    https://git.kernel.org/netdev/net-next/c/0ffc3292c02b
  - [net-next,v2,2/4] net: pcs: xpcs: Drop redundant workqueue.h include directive
    https://git.kernel.org/netdev/net-next/c/e26802ebd295
  - [net-next,v2,3/4] net: pcs: xpcs: Return EINVAL in the internal methods
    https://git.kernel.org/netdev/net-next/c/f5151005d379
  - [net-next,v2,4/4] net: pcs: xpcs: Explicitly return error on caps validation
    https://git.kernel.org/netdev/net-next/c/361dd531a11b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


