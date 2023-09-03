Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6462E790C68
	for <lists+openbmc@lfdr.de>; Sun,  3 Sep 2023 16:24:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tEz2weD7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RdvCX1b7tz3bV2
	for <lists+openbmc@lfdr.de>; Mon,  4 Sep 2023 00:24:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tEz2weD7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 480 seconds by postgrey-1.37 at boromir; Mon, 04 Sep 2023 00:23:33 AEST
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RdvBs5lzRz2yTN;
	Mon,  4 Sep 2023 00:23:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B60E3B80C97;
	Sun,  3 Sep 2023 14:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E50C433C7;
	Sun,  3 Sep 2023 14:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693750523;
	bh=3nZq1Ove0wV3ykT1sVJXUlFB1AvqBRnX4RP6rs0xc4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tEz2weD72worS/M8SYQYbBJCDkfZrREEpt67vzuoa13bU7fT0e74NZaa/++wvhaO+
	 Ij9OdWJPgVsSJaHfMmcwSqGlx7+/z4UMGup3LEhGb6SUBBuyWpaJu3x7GjugjT1KPt
	 /CnMLe4xA1zVYzUcaCSykh/KqlLFlkjGxh2BhvQ8eOhKd5kyiIdg0igEIgNMySZuoP
	 2nlBnnwlTykMnnsohP7OFZ3u6/Gz7VjVoVvdZVe5Cz2iomBlUKtNU22lzTs8lCLyj2
	 iRnnqhszacXctgM5qS0iYrfBvq0olRxUwFLw6HjKHHqgipI2kxPiMp2zglORz1reVk
	 5RQdfdTkfTymQ==
Date: Sun, 3 Sep 2023 16:15:19 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH] drivers:i2c:add controller reset when the timeout
 occurred
Message-ID: <20230903141519.ha6aakgkrq6ohy5s@zenone.zhora.eu>
References: <20230814111534.2771900-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814111534.2771900-1-tommy_huang@aspeedtech.com>
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
Cc: BMC-SW@aspeedtech.com, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-aspeed@lists.ozlabs.org, andrew@aj.id.au, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, brendan.higgins@linux.dev, joel@jms.id.au, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tommy,

Please fix the title of the patch from:

   drivers:i2c:add controller reset when the timeout occurred

to something like:

   i2c: aspeed: Reset the controller when timeout occurs

Note:

 - leave a space after the ':'
 - start with a capital letter after the last ':'

On Mon, Aug 14, 2023 at 07:15:34PM +0800, Tommy Huang wrote:
> 1.Call i2c controller reset when the i2c transfer timeout occurred.
> The rest of interrupts and device should be reset avoid unperdicted
> controller behavior occurred.

Please remove the '1.' and please rewrite this sentence in order
to be grammatically correct, something like:

"Call the i2c controller reset when an i2c transfer timeout
occurs. The remaining interrupts and the device should be reset
to avoid unpredictable controller behavior."

> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>

Is this a fix? If so please add:

Fixes: 2e57b7cebb98 ("i2c: aspeed: Add multi-master use case support")
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.1+

Jae Hyun is the author of the line you are changing therefore he
needs to be Cc'ed

[...]

>  		/*
>  		 * If timed out and bus is still busy in a multi master
> -		 * environment, attempt recovery at here.
> +		 * environment, attempt recovery at here. Even the bus is
> +		 * idle, we still need reset i2c controller avoid rest of
> +		 * interrupts.

Please fix the grammar here, as well

   In a multi-master setup, if a timeout occurs, attempt
   recovery.  But if the bus is idle, we still need to reset the
   i2c controller to clear the remaining interrupts.

We take this chance to improve the previous comment, as well.

>  		 */
>  		if (bus->multi_master &&
>  		    (readl(bus->base + ASPEED_I2C_CMD_REG) &
>  		     ASPEED_I2CD_BUS_BUSY_STS))
>  			aspeed_i2c_recover_bus(bus);
> +		else
> +			aspeed_i2c_reset(bus);

I'd like also someone from Jae Hyun, Brendan, Benjamin or Joel to
take a look here, as well. Thanks!

Andi
