Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AD83FE5C0
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 02:21:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0M6f2y5kz2yNY
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 10:21:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kJzShFmf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kJzShFmf; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0M6F3Vdwz2xfP
 for <openbmc@lists.ozlabs.org>; Thu,  2 Sep 2021 10:21:09 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D84561057;
 Thu,  2 Sep 2021 00:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630542065;
 bh=QeIMK5Iju8hsbcpXPKcj6rYZSS0aBR89XHTDJL6Eck8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=kJzShFmfNDD1CPp+5At+aPHSB0lglqhhM7OZMfq9lDwbJcNpHRnn+C7UWShGQN3bo
 sm8Kgc2ArBQ9cTC6TXHzoOjvMR4D/Nm9l/Q/RqBM3vUvk4rH7hX9KYRfgN/KVnMiSP
 hvJN5Bnfi0Z3jpw+TVO/cqSiksEc2sUZL95OD3yd87UyvfLHm572Z+78kS7SBCBfto
 sO9AEYQH5fpeeAQudSHQGp+pXS3QsvxuBhrr2VT1biOg0Sg7hlHXh6LTfn+8Ug5ioG
 PNVrCF3ffGlNeWa6FfYARoJppQhcNO3Nw20IDO7A+k6x+QBUR6fxnJBMn7PUGI/pYS
 SyilI1ty0NSnQ==
Date: Wed, 1 Sep 2021 17:21:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH 1/1] net/ncsi: add get MAC address command to get Intel
 i210 MAC address
Message-ID: <20210901172104.5ccd51b7@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20210830171806.119857-2-i.mikhaylov@yadro.com>
References: <20210830171806.119857-1-i.mikhaylov@yadro.com>
 <20210830171806.119857-2-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Brad Ho <Brad_Ho@phoenix.com>, Paul Fertser <fercerpav@gmail.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 30 Aug 2021 20:18:06 +0300 Ivan Mikhaylov wrote:
> This patch adds OEM Intel GMA command and response handler for it.
> 
> Signed-off-by: Brad Ho <Brad_Ho@phoenix.com>
> Signed-off-by: Paul Fertser <fercerpav@gmail.com>
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>

Applied, thanks, but there is a disconcerting lack of length checking.
How are truncated responses rejected?
