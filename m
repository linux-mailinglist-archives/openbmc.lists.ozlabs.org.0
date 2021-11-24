Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE2545B999
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 13:00:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzfht1YZmz2yp2
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 23:00:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OLu7kpz2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OLu7kpz2; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzfhW3bK5z2xBb;
 Wed, 24 Nov 2021 23:00:11 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8FEF661055;
 Wed, 24 Nov 2021 12:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637755208;
 bh=2x66CPb3TS7OZYOxCm6SQGm4K5jRiimJ/ekKSbLyE6g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=OLu7kpz2GVhqEgPkxDgR/HxcwzrhrbI1Tun3umc0T8aGA7Z/B6OusebPJFYBqyLCg
 B6+kTtTvpRvhyGAS0d1Vfbo/Uleu+xuzRRZhTv6UlyzMm3UsVI3UhPHvrTOgtBfHQS
 /3I4iQWPEgGbDFzMiY33Vo9aLaQudKD6jdPjuS5tUgsPmck4pmaMWqxUTQ9HHl3M4g
 YBUD2JKlnM5eWAZvAD35BIMsv0a9bZgV+8bHARF9y+FhlDZT+8LaJUgY4t3TDOZPCO
 h8r2PSoln5kwH/1FXTEyf1RnAj3oevAkyfZo2agDJN66fKjBt3F32rMP6ndbiKWmTa
 f9K8nAyYuVE+g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8697C609B9;
 Wed, 24 Nov 2021 12:00:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8] net/ncsi : Add payload to be 32-bit aligned to fix
 dropped packets
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <163775520854.1662.10651574507891086617.git-patchwork-notify@kernel.org>
Date: Wed, 24 Nov 2021 12:00:08 +0000
References: <20211122163818.GA11306@gmail.com>
In-Reply-To: <20211122163818.GA11306@gmail.com>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, amithash@fb.com, patrickw3@fb.com, kuba@kernel.org,
 sam@mendozajonas.com, velumanit@hcl.com, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net.git (master)
by David S. Miller <davem@davemloft.net>:

On Mon, 22 Nov 2021 22:08:18 +0530 you wrote:
> Update NC-SI command handler (both standard and OEM) to take into
> account of payload paddings in allocating skb (in case of payload
> size is not 32-bit aligned).
> 
> The checksum field follows payload field, without taking payload
> padding into account can cause checksum being truncated, leading to
> dropped packets.
> 
> [...]

Here is the summary with links:
  - [v8] net/ncsi : Add payload to be 32-bit aligned to fix dropped packets
    https://git.kernel.org/netdev/net/c/ac132852147a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


