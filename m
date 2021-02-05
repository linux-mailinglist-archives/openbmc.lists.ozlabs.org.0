Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9765B310DF1
	for <lists+openbmc@lfdr.de>; Fri,  5 Feb 2021 17:36:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DXLdl5SxjzDwkt
	for <lists+openbmc@lfdr.de>; Sat,  6 Feb 2021 03:36:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DXLck6tCjzDwkS;
 Sat,  6 Feb 2021 03:35:17 +1100 (AEDT)
X-AuditID: ac10606f-247ff70000001934-f3-601d73c116e9
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 E5.4A.06452.1C37D106; Fri,  5 Feb 2021 11:35:13 -0500 (EST)
Received: from ami-us-wk.us.megatrends.com (172.16.98.207) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.468.0; Fri, 5 Feb 2021 11:35:11 -0500
From: Hongwei Zhang <hongweiz@ami.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH, v1 1/1] gpio: aspeed: Add gpio base address reading
Date: Fri, 5 Feb 2021 11:34:50 -0500
Message-ID: <20210113223808.31626-2-hongweiz@ami.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113223808.31626-1-hongweiz@ami.com> 
References: <20210113223808.31626-1-hongweiz@ami.com> 
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.207]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWyRiBhgu7BYtkEg6un9C12Xeaw+DL3FIvF
 7/N/mS2m/FnOZLHp8TVWi+bV55gtNs//w2hxedccNotTLS9YHDg9rrbvYvd4f6OV3ePix2PM
 Hneu7WHz2Lyk3uP8jIWMHp83yQWwR3HZpKTmZJalFunbJXBlLPpqXPCNreLYvevMDYx7WLsY
 OTkkBEwk9mxfxNbFyMUhJLCLSeLt69usEM5ORomVOy8xg1SxCahJ7N08hwnEFhHQkeje9hOs
 iFngIJPE9Gl72EESwgIuEqt/vWcDsVkEVCRWf38A1sArYCrRMH0XC8Q6eYnVGw6ADeUUMJfY
 1vQcrF5IwEyi9dMjqHpBiZMzn4DVMwtISBx88YIZokZW4tahx0wQcxQlHvz6zjqBUWAWkpZZ
 SFoWMDKtYhRKLMnJTczMSS830kvMzdRLzs/dxAgJ9vwdjB8/mh9iZOJgPMQowcGsJMKb2CaV
 IMSbklhZlVqUH19UmpNafIhRmoNFSZx3lfvReCGB9MSS1OzU1ILUIpgsEwenVAPjofrHXB6Z
 H4tUdX8Grk/3MvG9aJU3KeSb3n4e5R6pjXNzbM91mqbcLHxX8J11H2PUzn0dG1YVusYevNR3
 9faXyMuvpqzl+3G9lGlFDe+mstcJbtuadrntzizZlPqy0zsv91zZpS8RSp720ldEKyJlnCyy
 T/y68/Dm37Zrtr0fVTiX+BV+O/RfiaU4I9FQi7moOBEAYb4BgWQCAAA=
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
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Hongwei Zhang <hongweiz@ami.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


> On Wed, Jan 13, 2021 at 11:38 PM Hongwei Zhang <hongweiz@ami.com> wrote:
> 
> > Add gpio base address reading in the driver; in old code, it just 
> > returns -1 to gpio->chip.base.
> >
> > Fixes: 7ee2d5b4d4340353 ("ARM: dts: nuvoton: Add Fii Kudo system")
> > Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> 
> NAK, sorry.
> 
> We never allow the device tree to specify this.
> 
> First, it is a Linux-only base so it would have to be a "linux,..." property.
> 
> Even if it is a Linux-only property, it is a bad idea.
> 
> Only people using sysfs should have any need to specify global GPIO numbers. Don't use sysfs. Use the 
> GPIO character device instead. See further:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/TODO
> 
> Yours,
> Linus Walleij

Hi Linus,

Thanks for your review and advice.

--Hongwei

