Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BCB9283D8
	for <lists+openbmc@lfdr.de>; Fri,  5 Jul 2024 10:41:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Is00ut/C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WFn6R5PDyz3dSM
	for <lists+openbmc@lfdr.de>; Fri,  5 Jul 2024 18:41:03 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Is00ut/C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WFn5w5x3Nz3bqP
	for <openbmc@lists.ozlabs.org>; Fri,  5 Jul 2024 18:40:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 725EFCE3CF6;
	Fri,  5 Jul 2024 08:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0A2EC4AF07;
	Fri,  5 Jul 2024 08:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720168833;
	bh=OU3txpXlAr+kHFnOZsdCg4voKyQR5vbHID+NPrutMTE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Is00ut/C/U0cgysRENfLJWYQvyyj8uAvLaUOF5+A3Q2iDk8Fsdt88NmoV9BOjrlmE
	 6llJBbjZDr5ZaSfXfu+gzUfChVH+bkO7/hRX526fYXOgDWFW+gn0w1KwLs7xvIA5/0
	 Q1MnI6Y/7t6SJ6ZxkmCC35jUJvbbKde35c/2mF+QzYFZdeFsu/McR7AHtq22Apn9Bh
	 /rPeVCed4Vw4bC9qHgD8iD7eMkUA8oWLze/KcUfKcr2usmnlPB2aZ5LzTOmp6zEvCE
	 dniUviqrS9tku3YGddOvOJnL1Pa+rm6xqRswNhIle1kO0S2Z/4f93PlipLmQjFW6ep
	 OZNot3Bnigj9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 89DC0C43332;
	Fri,  5 Jul 2024 08:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v4 00/10] net: pcs: xpcs: Add memory-mapped device
 support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <172016883356.17061.13176667406325533525.git-patchwork-notify@kernel.org>
Date: Fri, 05 Jul 2024 08:40:33 +0000
References: <20240701182900.13402-1-fancer.lancer@gmail.com>
In-Reply-To: <20240701182900.13402-1-fancer.lancer@gmail.com>
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
Cc: andrew@lunn.ch, tmaimon77@gmail.com, alexandre.torgue@foss.st.com, edumazet@google.com, krzysztof.kozlowski+dt@linaro.org, quic_scheluve@quicinc.com, f.fainelli@gmail.com, openbmc@lists.ozlabs.org, linux@armlinux.org.uk, maxime.chevallier@bootlin.com, joabreu@synopsys.com, quic_abchauha@quicinc.com, kuba@kernel.org, pabeni@redhat.com, ahalaney@redhat.com, Jose.Abreu@synopsys.com, devicetree@vger.kernel.org, conor+dt@kernel.org, jiawenwu@trustnetic.com, mengyuanlou@net-swift.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, olteanv@gmail.com, davem@davemloft.net, hkallweit1@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon,  1 Jul 2024 21:28:31 +0300 you wrote:
> The main goal of this series is to extend the DW XPCS device support in
> the kernel. Particularly the patchset adds a support of the DW XPCS
> device with the MCI/APB3 IO interface registered as a platform device. In
> order to have them utilized by the DW XPCS core the fwnode-based DW XPCS
> descriptor creation procedure has been introduced. Finally the STMMAC
> driver has been altered to support the DW XPCS passed via the 'pcs-handle'
> property.
> 
> [...]

Here is the summary with links:
  - [net-next,v4,01/10] net: pcs: xpcs: Move native device ID macro to linux/pcs/pcs-xpcs.h
    https://git.kernel.org/netdev/net-next/c/f37bee950888
  - [net-next,v4,02/10] net: pcs: xpcs: Split up xpcs_create() body to sub-functions
    https://git.kernel.org/netdev/net-next/c/03b3be07c69a
  - [net-next,v4,03/10] net: pcs: xpcs: Convert xpcs_id to dw_xpcs_desc
    https://git.kernel.org/netdev/net-next/c/71b200b388ef
  - [net-next,v4,04/10] net: pcs: xpcs: Convert xpcs_compat to dw_xpcs_compat
    https://git.kernel.org/netdev/net-next/c/410232ab3c07
  - [net-next,v4,05/10] net: pcs: xpcs: Introduce DW XPCS info structure
    https://git.kernel.org/netdev/net-next/c/bcac735cf653
  - [net-next,v4,06/10] dt-bindings: net: Add Synopsys DW xPCS bindings
    https://git.kernel.org/netdev/net-next/c/664690eb08f7
  - [net-next,v4,07/10] net: pcs: xpcs: Add Synopsys DW xPCS platform device driver
    https://git.kernel.org/netdev/net-next/c/f6bb3e9d98c2
  - [net-next,v4,08/10] net: pcs: xpcs: Add fwnode-based descriptor creation method
    https://git.kernel.org/netdev/net-next/c/9cad7275463a
  - [net-next,v4,09/10] net: stmmac: Create DW XPCS device with particular address
    https://git.kernel.org/netdev/net-next/c/351066bad6ad
  - [net-next,v4,10/10] net: stmmac: Add DW XPCS specified via "pcs-handle" support
    https://git.kernel.org/netdev/net-next/c/357768c7e792

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


