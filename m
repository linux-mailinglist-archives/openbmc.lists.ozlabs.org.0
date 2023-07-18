Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F398C757562
	for <lists+openbmc@lfdr.de>; Tue, 18 Jul 2023 09:30:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J2e5bb3c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4rGT6YBsz30KG
	for <lists+openbmc@lfdr.de>; Tue, 18 Jul 2023 17:30:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J2e5bb3c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4rFr4BLbz2ytJ
	for <openbmc@lists.ozlabs.org>; Tue, 18 Jul 2023 17:30:24 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5117C61499;
	Tue, 18 Jul 2023 07:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A99B9C433C9;
	Tue, 18 Jul 2023 07:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689665421;
	bh=xzOmKto7mgO+DlV+di9AkQ9xlJrPz55vXFRIK3ZVaiM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=J2e5bb3cg+8AsHGFbDMkr0AmGb9YH7g04aIn57I8NwEzphndujN4F8LsJc/A54C2T
	 jhZNr+S8d8C30nunJerrQ/yWvBMFjllrEeIMV4oYvR0j3Apkc/p6iEupVea/VKiEsW
	 AyXYO5pJ3nHNSrNxXyD9QTPdJhO9g3cLacq1c9+j8g+C5MY9F7LB9CYkr57BDkFljI
	 iGJGOWT0UjCDddE8a13pNxwbpku/AgfqS1vEJeNXygDlZ5GWUKWCGjau0y2mR+5ctK
	 1P3hD2C229T09P4t6kXh9xB2C6MaG6m6B2y0HaoA5whGFnTnS6MhKUQGXwCdBhsdp4
	 wFnbXkvMN9DQQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B526E22AE5;
	Tue, 18 Jul 2023 07:30:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: ftgmac100: support getting MAC address from NVMEM
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168966542156.17873.5200310716380528956.git-patchwork-notify@kernel.org>
Date: Tue, 18 Jul 2023 07:30:21 +0000
References: <20230713095743.30517-1-fercerpav@gmail.com>
In-Reply-To: <20230713095743.30517-1-fercerpav@gmail.com>
To: Paul Fertser <fercerpav@gmail.com>
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
Cc: andrew@lunn.ch, leon@kernel.org, geoff@infradead.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, edumazet@google.com, rentao.bupt@gmail.com, kuba@kernel.org, pabeni@redhat.com, windhl@126.com, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Thu, 13 Jul 2023 12:57:43 +0300 you wrote:
> Make use of of_get_ethdev_address() to support reading MAC address not
> only from the usual DT nodes but also from an NVMEM provider (e.g. using
> a dedicated area in an FRU EEPROM).
> 
> Signed-off-by: Paul Fertser <fercerpav@gmail.com>
> ---
>  drivers/net/ethernet/faraday/ftgmac100.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

Here is the summary with links:
  - net: ftgmac100: support getting MAC address from NVMEM
    https://git.kernel.org/netdev/net-next/c/2cee73cef253

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


