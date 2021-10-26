Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBFB43B5AD
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 17:34:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hdwq459xGz2yKx
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 02:34:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=klB/3fbg;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=klB/3fbg; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hdwpd5T0sz2xs3;
 Wed, 27 Oct 2021 02:34:01 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CEAA160F0F;
 Tue, 26 Oct 2021 15:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635262438;
 bh=IAHuCFMgGKV8skddYGPOVQ5suntnxucPb1xY7Epx/V8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=klB/3fbgJkFlElsPyQfDRTdHR+vpFPlgcSCUXyyrQfx7K3+1ICPKyYaQQlu4s32yh
 HY7zAjEcUHYeawGpmd4dPuqcJyqpRZrVbHN6N9InJZ9riH5jBUml7quRdRXAkvP3Dk
 uor6/QKAAuitIE2pvcl7sgTsgesyRswbOfc9W5ApDQ0O6IWDcOMgMSTaz80PpaYWwp
 LXoCQ6vOUeP370CfPEtAYH5TBgYA8XiPIU3nFPBXK105OhwFL6QTOHdhhUE8dySXht
 z98vFlCjTf/HZtH0Ky9om3FyySICkgSD6EDVGrlto2RlC4uEW7QyF0jQgSqmrSwQXw
 x3zW1DdQF3eqA==
Date: Tue, 26 Oct 2021 08:33:56 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Subject: Re: [PATCH v3] Add payload to be 32-bit aligned to fix dropped packets
Message-ID: <20211026083356.0719fc5e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211026144953.GA15611@gmail.com>
References: <20211026144953.GA15611@gmail.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Amithash Prasad <amithash@fb.com>, patrickw3@fb.com,
 Samuel Mendoza-Jonas <sam@mendozajonas.com>, velumanit@hcl.com,
 "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 26 Oct 2021 20:19:53 +0530 Kumar Thangavel wrote:
> Update NC-SI command handler (both standard and OEM) to take into
> account of payload paddings in allocating skb (in case of payload
> size is not 32-bit aligned).
> 
> The checksum field follows payload field, without taking payload
> padding into account can cause checksum being truncated, leading to
> dropped packets.
> 
> Signed-off-by: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
> Acked-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>

You need to CC netdev@ if you want this applied to networking trees.

> diff --git a/net/ncsi/ncsi-cmd.c b/net/ncsi/ncsi-cmd.c
> index ba9ae482141b..179e39105072 100644
> --- a/net/ncsi/ncsi-cmd.c
> +++ b/net/ncsi/ncsi-cmd.c
> @@ -18,6 +18,8 @@
>  #include "internal.h"
>  #include "ncsi-pkt.h"
>  
> +#define MAX(X, Y) (((X) > (Y)) ? (X) : (Y))

Please use one of the existing max() macroes in the kernel.
