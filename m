Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A849729598
	for <lists+openbmc@lfdr.de>; Fri,  9 Jun 2023 11:41:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qcx0V1JB7z3fBD
	for <lists+openbmc@lfdr.de>; Fri,  9 Jun 2023 19:40:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AvozqRxh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AvozqRxh;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qcwzs6m69z3f05
	for <openbmc@lists.ozlabs.org>; Fri,  9 Jun 2023 19:40:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E9BE165637;
	Fri,  9 Jun 2023 09:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54157C4339C;
	Fri,  9 Jun 2023 09:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686303622;
	bh=QsjPUpkRO5qwm0xSfCepOjD6AFakWYdIF5Oxfmz3lLo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AvozqRxhS8wdOWpuR2IwxLOVmHpV8OMtKTIHCUC7neJhPIcj0U3WCnCaV1SPs3fUx
	 ZtZZnEaSHZi9HFWOYU/soFQ6G4oIdQNGLu/G+elYUGPsNLyOzdbuJ77t4V8jdZHXlG
	 gw7fDR3K43wWua4e2M+DdiN5hiUnMse7FAMyAWthEcJcXVrFx2nzQ/tFDxk4y4BC0j
	 bw56vf5WHzup4oz75gN08d2YGHA4uthN6HDJnBVrVATIgLjNu31yd45rSLh5zweRwD
	 7yXv3q6PoIZUI846QY1ZA5zbTcw+9h5aTaUM6Db2LTl9qevFxUkmHKZqcaGPOvzIiy
	 ayHvQP5+3FhJg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3B998C43157;
	Fri,  9 Jun 2023 09:40:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/2] net/ncsi: refactoring for GMA command
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168630362223.15762.16643998871572719262.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 09:40:22 +0000
References: <20230607151742.6699-1-fr0st61te@gmail.com>
In-Reply-To: <20230607151742.6699-1-fr0st61te@gmail.com>
To: Ivan Mikhaylov <fr0st61te@gmail.com>
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
Cc: sam@mendozajonas.com, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, vijaykhemka@fb.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed,  7 Jun 2023 18:17:40 +0300 you wrote:
> Make one GMA function for all manufacturers, change ndo_set_mac_address
> to dev_set_mac_address for notifiying net layer about MAC change which
> ndo_set_mac_address doesn't do.
> 
> Changes from v1:
> 	1. delete ftgmac100.txt changes about mac-address-increment
> 	2. add convert to yaml from ftgmac100.txt
> 	3. add mac-address-increment option for ethernet-controller.yaml
> 
> [...]

Here is the summary with links:
  - [v3,1/2] net/ncsi: make one oem_gma function for all mfr id
    https://git.kernel.org/netdev/net-next/c/74b449b98dcc
  - [v3,2/2] net/ncsi: change from ndo_set_mac_address to dev_set_mac_address
    https://git.kernel.org/netdev/net-next/c/790071347a0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


