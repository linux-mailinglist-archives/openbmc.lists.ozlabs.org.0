Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 451A32DEB33
	for <lists+openbmc@lfdr.de>; Fri, 18 Dec 2020 22:41:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyMkC2wHqzDqBG
	for <lists+openbmc@lfdr.de>; Sat, 19 Dec 2020 08:41:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=bewilderbeest.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=Y2xXOPH7; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyMj30b4mzDqBG;
 Sat, 19 Dec 2020 08:40:05 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (unknown
 [IPv6:2600:6c44:7f:ba20:1c66:ab2d:5a3:5a9e])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 83B2D806F6;
 Fri, 18 Dec 2020 13:39:58 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 thorn.bewilderbeest.net 83B2D806F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1608327599;
 bh=7KDDxCCO+v3IMSIe1/eQbnfr4znZ5/RhUgO2QP29+Lw=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=Y2xXOPH70HPeqCRf7VyS9Yz2NbZb37qE04ft2L2T9T+jNtqOY4WS5kii82B1RkIK8
 JkaT0oZyTquQbjgA1fr2LhtFMeb/Sj9oxubkEsbGBA380Sw8m/mDiQB/0FPmysnMBm
 PK4GEhHllhwlueZPV5bEoyf5L2u8seUeI/0vB+qo=
Date: Fri, 18 Dec 2020 15:39:52 -0600
From: Zev Weiss <zev@bewilderbeest.net>
To: Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: aspeed: disable additional device addresses on
 ast2[56]xx
Message-ID: <20201218213952.refmqjlxdclsquzg@hatter.bewilderbeest.net>
References: <20200915184525.29665-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200915184525.29665-1-zev@bewilderbeest.net>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Sep 15, 2020 at 01:45:25PM CDT, Zev Weiss wrote:
>The ast25xx and ast26xx have, respectively, two and three configurable
>slave device addresses to the ast24xx's one.  We only support using
>one at a time, but the others may come up in an indeterminate state
>depending on hardware/bootloader behavior, so we need to make sure we
>disable them so as to avoid ending up with phantom devices on the bus.
>
>Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
>---
> drivers/i2c/busses/i2c-aspeed.c | 50 +++++++++++++++++++++++++++------
> 1 file changed, 41 insertions(+), 9 deletions(-)
>
> <snip>

Ping...any thoughts on this patch?


Thanks,
Zev

