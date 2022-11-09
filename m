Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFE06236CD
	for <lists+openbmc@lfdr.de>; Wed,  9 Nov 2022 23:49:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N70Ws5ydfz3cJp
	for <lists+openbmc@lfdr.de>; Thu, 10 Nov 2022 09:49:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=niPBOLRh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=niPBOLRh;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N70WB0S1rz2ybK;
	Thu, 10 Nov 2022 09:48:37 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id D7E8A1B4;
	Wed,  9 Nov 2022 14:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1668034114;
	bh=qWd1xxL+n/mqW92VAPRuDm6AF/ePNA2zYoQR66oggvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=niPBOLRhGgxqSFKI2tUH4uxea+oMJZJrzv5V4BtJHu/nvdhWmM/wMlxQLgjSlgFU/
	 wha9euKm+pKK7Kqjh5JUbcYz7PbJeaVrkiuWMQIsz6vaGb4IbTaBbQeiVNTVU07eZ1
	 9NFoo9td8elaRawERlelDt/ojeUpwvf8RPL3ZFwE=
Date: Wed, 9 Nov 2022 14:48:26 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Subject: Re: Log spam from aspeed-video driver
Message-ID: <Y2wuOlQRBobRonj5@hatter.bewilderbeest.net>
References: <Y1dX9r9ybGjBrW0k@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Y1dX9r9ybGjBrW0k@hatter.bewilderbeest.net>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Jammy Huang <jammy_huang@aspeedtech.com>, Eddie James <eajames@linux.ibm.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Oct 24, 2022 at 08:28:56PM PDT, Zev Weiss wrote:
>Hi all,
>
>Since the recent update of the OpenBMC kernel to 6.0, I've been seeing 
>a lot of new log noise from aspeed-video driver when the host is 
>powered off after having been on:
>
>    [  335.526279] aspeed-video 1e700000.video: Timed out; first mode detect
>    [  335.544172] aspeed-video 1e700000.video: No signal; don't start frame
>    [  337.165555] aspeed-video 1e700000.video: Timed out; first mode detect
>    [  337.186214] aspeed-video 1e700000.video: No signal; don't start frame
>    [  338.815501] aspeed-video 1e700000.video: Timed out; first mode detect
>    [  338.834008] aspeed-video 1e700000.video: No signal; don't start frame
>
>It just emits that pair of messages continuously, about every 1.6 
>seconds.
>
>Looking through the commit history of the driver, it looks like that 
>stems from commit a3de90afe392 ("media: aspeed: use 
>v4l2_info/v4l2_warn/v4l2_dbg for log"), which converted a bunch of 
>print calls from dev_dbg() to various v4l2_*() calls.  Reverting to 
>the old 5.15 kernel (which didn't include that change), I found by 
>enabling the dev_dbg() prints via sysfs (and cranking up the console 
>loglevel) that the conditions triggering those messages have been 
>happening all along, I just hadn't been seeing them because the debug 
>prints were disabled by default.
>
>I should note that aside from the dmesg spam I don't see any 
>functional problems with the driver; obmc-ikvm works as expected.
>
>Was switching those dev_dbg() calls to v4l2_warn() instead of 
>v4l2_dbg() intentional?  Does this indicate some latent bug that 
>should be fixed, or should they just be converted to v4l2_dbg()?
>

Ping -- Jammy, any input on this?


Thanks,
Zev

