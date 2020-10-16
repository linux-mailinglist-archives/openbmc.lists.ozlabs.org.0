Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AED29215A
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 05:08:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CF1sc4p15zDqSF
	for <lists+openbmc@lfdr.de>; Mon, 19 Oct 2020 14:08:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=kuba@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ZNLk6WVQ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCgyq55d5zDqvK;
 Sat, 17 Oct 2020 09:37:55 +1100 (AEDT)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4C0520874;
 Fri, 16 Oct 2020 22:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602887872;
 bh=b2EGIKg3KP0GtQPo2F73WLvD38qjR51SW+fFm5/DFnE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZNLk6WVQnGcj+itxB3EwnJslgGvxlZ/vwTgLbHm1WDAVYIBMCFpZUhCLSsBQ7QS90
 pSp4yEakwcMP5kgixMbHJjXr3y0BPBAGsb3PFwuq2XSGF8ompPKqcoL86G8EUn91ot
 iJ4ddVLd9CU3T9vit7ODUaIOcJ22p1BHp1JO4lAQ=
Date: Fri, 16 Oct 2020 15:37:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Dylan Hung <dylan_hung@aspeedtech.com>
Subject: Re: [PATCH 1/1] net: ftgmac100: Fix Aspeed ast2600 TX hang issue
Message-ID: <20201016153750.1c46de21@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201014060632.16085-2-dylan_hung@aspeedtech.com>
References: <20201014060632.16085-1-dylan_hung@aspeedtech.com>
 <20201014060632.16085-2-dylan_hung@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 19 Oct 2020 14:06:21 +1100
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
Cc: BMC-SW@aspeedtech.com, ratbert@faraday-tech.com,
 linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, davem@davemloft.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 14 Oct 2020 14:06:32 +0800 Dylan Hung wrote:
> The new HW arbitration feature on Aspeed ast2600 will cause MAC TX to
> hang when handling scatter-gather DMA.  Disable the problematic feature
> by setting MAC register 0x58 bit28 and bit27.
> 
> Signed-off-by: Dylan Hung <dylan_hung@aspeedtech.com>

Applied, thank you.
