Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F99C8155
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 04:09:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XplVy5nlhz3blk
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 14:09:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731553767;
	cv=none; b=JGiuz9kjRpT8273LN90qQm2x8U8A5DRGFd3UDW1xtb0tz7bv8gtS6copk4ksCVdXNNQGd7MNC9AaEbx+ZAtGJ29dpJepUJaRFbEmMQLdcfE21eaE0XJuGkdNUXuBi0Tqjf8hHuxeRk6JfU35dSFEb6ZiURJpLOn9BXqi2EkdlVrRclw/0ieiLDfu0Xw1oALFmr64csRpS4Wt97u4uKyQDb4MmervhcM6juHC+I/yZxs4iRbTBvbku/Rf77zhOdY5PSn0v8lSgJ0YQC3BbwEFXP+ucmf3G0xaMhx5L6MXeJNZy2IJNJxv7YkbtrvSFQQSvFYzR4uHx9+oGPAO5wzMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731553767; c=relaxed/relaxed;
	bh=Jp6q/hzaronqL1OOIiSDXonIRum5UBHnh9k/VcRsoPg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SeJjKSi8RopttGpr3Utj76R8xSAWdnycJ+jNRcK7DK0PxnEICe6PH92hZZ23H/8JwiI0k7e0usjNgoSJZkBRBFzk66V7ozX4nncs3acmSCck47Lm0v8oUFTTbBUkQ33R8Zy1WAQbJdYvI2IU+W3h8CDkPMA/G0dTJCKb2iggTngeiBDA65yL8sYYEckQ76G50ovTmLvyKhQ5bij7RlcK0Q9Jv/iG16I19j080HlUQvkwodf0n2J/syH7RMe4t1RtNoHwOTkOhLRoMppk30DPcoFcISHBXVCI1cu7oLzI3K0jFsXgrydCkbr23PpPLOEvTQ9iBOdvrNOf/U3agspKlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QQG4UBxZ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QQG4UBxZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XplVt0qddz2yMv
	for <openbmc@lists.ozlabs.org>; Thu, 14 Nov 2024 14:09:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D0A265C5808;
	Thu, 14 Nov 2024 03:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68434C4CEC3;
	Thu, 14 Nov 2024 03:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731553761;
	bh=aNA+MUiXR33lNnb7g+eD9z36PEo+w4KP8BYPgK0Kh2w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=QQG4UBxZzz99WLCh1CqhlhsxLgYpBVK2nXRK8PkrOJ1mtquva9FvsnXw1+Pvo1u01
	 kSoXoKQiAyD+nsX0Os/T+IldoBGTutZN8QeYsOQWACKR6kiENdOaRl3yjSfmZmlm9s
	 KNF+MSBp2oCkJb7cdVy0+vI5buypTfdDmifDPRCy6Y9M4YNvY85ZFan3GIn3blCBYD
	 JAOlzbq1vawb+i3Qh6SodcO1n6xxgKj/n+Sl2mHyiQiISKC3JZRFeoWFG+/Ag4w1yb
	 qwmxitYYnkKiAe0EJaElkWrY0I1Jciy5ki/Zjhmxi2d3//xSeBERMYfmaHdbEsU8P5
	 9MR0sqfovkxlQ==
Date: Wed, 13 Nov 2024 19:09:20 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jian Zhang <zhangjian.3032@bytedance.com>
Subject: Re: [PATCH net-next] mctp i2c: notify user space on TX failure
Message-ID: <20241113190920.0ceaddf2@kernel.org>
In-Reply-To: <20241108094206.2808293-1-zhangjian.3032@bytedance.com>
References: <20241108094206.2808293-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, open list <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Jeremy Kerr <jk@codeconstruct.com.au>, Matt Johnston <matt@codeconstruct.com.au>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri,  8 Nov 2024 17:42:06 +0800 Jian Zhang wrote:
> diff --git a/drivers/net/mctp/mctp-i2c.c b/drivers/net/mctp/mctp-i2c.c
> index 4dc057c121f5..e9a835606dfc 100644
> --- a/drivers/net/mctp/mctp-i2c.c
> +++ b/drivers/net/mctp/mctp-i2c.c
> @@ -485,6 +485,7 @@ static void mctp_i2c_xmit(struct mctp_i2c_dev *midev, struct sk_buff *skb)
>  	struct mctp_i2c_hdr *hdr;
>  	struct i2c_msg msg = {0};
>  	u8 *pecp;
> +	struct sock *sk;
>  	int rc;
>  

nit: order the variable declaration lines longest to shortest

> @@ -551,6 +552,14 @@ static void mctp_i2c_xmit(struct mctp_i2c_dev *midev, struct sk_buff *skb)
>  		dev_warn_ratelimited(&midev->adapter->dev,
>  				     "__i2c_transfer failed %d\n", rc);
>  		stats->tx_errors++;
> +
> +		sk = skb->sk;
> +		if (sk) {
> +			sk->sk_err = -rc;
> +			if (!sock_flag(sk, SOCK_DEAD))
> +				sk_error_report(sk);
> +		}

notifying socket in the xmit handler of a netdev is a bit strange,
could you do it somewhere higher in the MCTP stack?
-- 
pw-bot: cr
