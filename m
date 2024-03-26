Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A301E88CDE5
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 21:09:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e9CSzPO9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V419D2j47z3vXP
	for <lists+openbmc@lfdr.de>; Wed, 27 Mar 2024 07:09:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e9CSzPO9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V418k4QVgz3dWW
	for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2024 07:08:54 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6543D613F9;
	Tue, 26 Mar 2024 20:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3D9C43390;
	Tue, 26 Mar 2024 20:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711483732;
	bh=UvvEXa7/u+TvEsP4ULFQtxhfQt+x828rllZrGgBiyAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e9CSzPO98RG06lCpIqFTyJDf6WolP5CwzaG/dgyiELf8YlZYhsbYYqt7v0hZy/zDI
	 LYPzl9TGgUHRpxTZoBJP3t+YshBkRKMsoVdcqgEfMyYPFTxAdU5Mm6ri/ipWUDx1XL
	 jKF3FeE+Wx7WtMepEPj5vH9nwC1oldmISpGv0yM84regA6B6cpP0KVwzFhKEsNxfND
	 Px/32TgtGPErlCtjy4687DrZCCJ+Y399niAMh9chreSTezD3NsKNlaqQdCtGSn+Hzw
	 RIQvP22sPhMP7UisuoFYwjtD/B/QTkGs6K7c87vwz0RBBQ2GtMjNA+zIiw3qH9zG8r
	 sC4ATgfPNtvDg==
Date: Tue, 26 Mar 2024 21:08:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 20/64] i2c: fsi: reword according to newest specification
Message-ID: <hvucbpsgihrbe4tgf4ksg4obz3rxitmyrdpl6zdh25pmok3uab@y6itjppsfbmd>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-21-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-21-wsa+renesas@sang-engineering.com>
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
Cc: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.ibm.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram,

On Fri, Mar 22, 2024 at 02:25:13PM +0100, Wolfram Sang wrote:
> Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
> specifications and replace "master/slave" with more appropriate terms.
> They are also more specific because we distinguish now between a remote
> entity ("client") and a local one ("target").
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-fsi.c | 56 ++++++++++++++++++------------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 10332693edf0..5eaf2c85a72c 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * FSI-attached I2C master algorithm
> + * FSI-attached I2C controller algorithm

As this change is all about renaming, I think we need to be a bit
more consistent in using either host or controller, at least
within the same driver.

In this driver you are using sometimes host and sometimes
controller.

Thanks,
Andi
