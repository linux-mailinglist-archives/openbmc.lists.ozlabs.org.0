Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 383053C414A
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 04:43:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNSkY0gZ7z3049
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 12:43:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=F5+bjJa6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=F5+bjJa6; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLThl465Sz306j
 for <openbmc@lists.ozlabs.org>; Fri,  9 Jul 2021 07:20:07 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5C47461878;
 Thu,  8 Jul 2021 21:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625779204;
 bh=U/xdc67l36+ujSI+gBxJCgNM0lytoG1nwCUyZhP9Gfg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=F5+bjJa6yGRSyRZUF6S3FnK3NEIBYYcB2OxxCVgTgk+MvShNDFG9AcwgBRmDgcR9Q
 ixhjKE8CA+YIGrcohL8434Pwdej++/K5Lnk4d2Ru0A4CcpFlsrjc9CJtbBcdo2dTYL
 pKHzxOm9bifnDis+61TSOKbEK+aurbu2XmlmrXwy+zpZh1ax5mGvM/1olMZ8owu5oQ
 1W/oOHE3/gZYUcenY1XKK4U6pk/T6pbZq6Ql36NnaFKcg9dp3W52z8zn2rjHFdjZJd
 PPOzSxKm9Nz6GMCFIbvEdGg3pyLl1Lgni/sy1+vRDsYMYWkvEM6zCHRMp/5QKe25zB
 Dm5G9PDMBiYUw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
 [127.0.0.1])
 by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4F3F4609DA;
 Thu,  8 Jul 2021 21:20:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/3] net/ncsi: Add NCSI Intel OEM command to keep PHY
 link up
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162577920431.534.17888318132713618711.git-patchwork-notify@kernel.org>
Date: Thu, 08 Jul 2021 21:20:04 +0000
References: <20210708122754.555846-1-i.mikhaylov@yadro.com>
In-Reply-To: <20210708122754.555846-1-i.mikhaylov@yadro.com>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
X-Mailman-Approved-At: Mon, 12 Jul 2021 12:42:33 +1000
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org, sam@mendozajonas.com,
 davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net.git (refs/heads/master):

On Thu, 8 Jul 2021 15:27:51 +0300 you wrote:
> Add NCSI Intel OEM command to keep PHY link up and prevents any channel
> resets during the host load on i210. Also includes dummy response handler for
> Intel manufacturer id.
> 
> Changes from v1:
>  1. sparse fixes about casts
>  2. put it after ncsi_dev_state_probe_cis instead of
>     ncsi_dev_state_probe_channel because sometimes channel is not ready
>     after it
>  3. inl -> intel
> 
> [...]

Here is the summary with links:
  - [v2,1/3] net/ncsi: fix restricted cast warning of sparse
    https://git.kernel.org/netdev/net/c/27fa107d3b8d
  - [v2,2/3] net/ncsi: add NCSI Intel OEM command to keep PHY up
    https://git.kernel.org/netdev/net/c/abd2fddc94a6
  - [v2,3/3] net/ncsi: add dummy response handler for Intel boards
    https://git.kernel.org/netdev/net/c/163f5de509a8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


