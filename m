Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E5C9C2EEB
	for <lists+openbmc@lfdr.de>; Sat,  9 Nov 2024 18:50:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xm3Ht3tv6z3cPS
	for <lists+openbmc@lfdr.de>; Sun, 10 Nov 2024 04:50:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731174630;
	cv=none; b=MgSrWO+xcga53KdMJwQPtYMIucruonv1MJkVPE8hxIN4TN+i49uZ2RxxdMgblyIicdtc7+2v0NNZnVJ9vO+dsGvuoEpVwaCoRAJAfNBmWvFjoyD1nqW+EhUNDyIOu69ShRWK3cJc6GOJR13hKWW4CBX0Avs7OP9hn2ZJhjtRknWeJcQK0T5BWsfi/4WgKdfUBnT6gbz9Tw1kxLWvE9rOKWzkVDyjP9Uyuq8aqRr31he0re0JBAAMVSbXaDaXmmGtZpwSAuCxnnofRyJ5uJymjQtxhJeVn0+cG7/+MXWAszdEclmwjeK+y8qhITCKpOUY2k3hKuaNQVkJrMcGqUHEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731174630; c=relaxed/relaxed;
	bh=ZNnkT1bdx5xWuug7JjWQrUyz2QUL2Izj/kcF1NKnaBg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YhORSz4WJV8fBrKn+Mehm1NGAHgoki56iiqUy8XgcoTW2T8zJ+aDlKbfoVvWM6BNst/xdyJF/shqg2dbGH5Dg9ZQzB0Ww/NjhDBwe1bSj8p9+ZgT3a9+2JEpk1ucxPQG4/MlUcE9lBXSf5LVE7gQvxSj1wdJQcSycJjZuaJfqX9a+Ztye42Lg+GbqwGiCk/Z3YXPYOsoWX7rzN6UsyrCoeSyi2I6nlOJxGlIxbEO/ECHoqLmuNBA0F7oK3dgkVPmKsmcL4HHOYv95/fvNmyytrffi0TVbbSyf2/SKpW6OY3ftIaKpIRAyrE1RGAv9iu77acw5S+Vsu3DCqV3kMDZvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q28NrxUY; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=q28NrxUY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xm3Hn40Nkz2yDT
	for <openbmc@lists.ozlabs.org>; Sun, 10 Nov 2024 04:50:29 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 299B55C4A51;
	Sat,  9 Nov 2024 17:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC30C4CECE;
	Sat,  9 Nov 2024 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731174624;
	bh=3vbzvhbG/2XPTt2pMfteL7+7Nx196bGVEUphuDirl2w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=q28NrxUYm5Ku5hahgmapTIr3ROrvzQOY8fBWeDOe6RMGRl66fpzNn21Y7fKaxSim1
	 V8M+uuG7ZXuqCzEaDdkt+GZPnb+rRQTlDNzofYycvM/djw3ZjL9AR1fQQAc+sL2tHj
	 zOTREJur5ZL0kjGKt+bY+teP5jqqxMdR28Qwh8ZU6Z7+PlM6Lp1i8m5xR0B2BcgqNN
	 Dt7qHvK2Txxxkhwltnr+MdG96ebCdaJuOGsVNyA30lwfSbSN4zBjnytjILge/DNOCg
	 ZojWPYLDkuXwzE9CxMz7upuUz15xyEnZbeQdyw6OwMfMoxzH0J16IqTYw0VFD33ZoG
	 UHgAKC8PYDVOg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DC73809A80;
	Sat,  9 Nov 2024 17:50:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: mctp: Expose transport binding identifier via
 IFLA attribute
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <173117463401.2982634.225795456177475066.git-patchwork-notify@kernel.org>
Date: Sat, 09 Nov 2024 17:50:34 +0000
References: <20241105071915.821871-1-khangng@os.amperecomputing.com>
In-Reply-To: <20241105071915.821871-1-khangng@os.amperecomputing.com>
To: Khang Nguyen <khangng@os.amperecomputing.com>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: patches@amperecomputing.com, thu@os.amperecomputing.com, pvo@amperecomputing.com, khpham@amperecomputing.com, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, ampere-linux-kernel@lists.amperecomputing.com, phong@os.amperecomputing.com, andrew+netdev@lunn.ch, edumazet@google.com, hieul@amperecomputing.com, quan@os.amperecomputing.com, horms@kernel.org, kuba@kernel.org, jk@codeconstruct.com.au, matt@codeconstruct.com.au, pabeni@redhat.com, davem@davemloft.net, chanh@os.amperecomputing.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  5 Nov 2024 14:19:15 +0700 you wrote:
> MCTP control protocol implementations are transport binding dependent.
> Endpoint discovery is mandatory based on transport binding.
> Message timing requirements are specified in each respective transport
> binding specification.
> 
> However, we currently have no means to get this information from MCTP
> links.
> 
> [...]

Here is the summary with links:
  - [net-next] net: mctp: Expose transport binding identifier via IFLA attribute
    https://git.kernel.org/netdev/net-next/c/580db513b4a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


