Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E92302374
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 11:04:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPQTN0TQpzDqvr
	for <lists+openbmc@lfdr.de>; Mon, 25 Jan 2021 21:04:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPQSB4rJQzDqkL;
 Mon, 25 Jan 2021 21:03:52 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 10P9tsXQ098016;
 Mon, 25 Jan 2021 17:55:54 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from aspeedtech.com (192.168.100.253) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 25 Jan
 2021 18:01:37 +0800
Date: Mon, 25 Jan 2021 10:01:19 +0000
From: Troy Lee <troy_lee@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 4/4] hwmon: Support Aspeed AST2600 PWM/Fan tachometer
Message-ID: <20210125100119.GA2349720@aspeedtech.com>
References: <20210113070850.1184506-1-troy_lee@aspeedtech.com>
 <20210113070850.1184506-5-troy_lee@aspeedtech.com>
 <20210123161405.GA50622@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20210123161405.GA50622@roeck-us.net>
X-Originating-IP: [192.168.100.253]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 10P9tsXQ098016
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
Cc: "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Ryan Chen <ryan_chen@aspeedtech.com>, "moderated
 list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "leetroy@gmail.com" <leetroy@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 ChiaWei Wang <chiawei_wang@aspeedtech.com>, "moderated list:ARM/ASPEED
 MACHINE SUPPORT" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Guenter,

The 01/24/2021 00:14, Guenter Roeck wrote:
> On Wed, Jan 13, 2021 at 07:08:48AM +0000, Troy Lee wrote:
> > Add Aspeed AST2600 PWM/Fan tacho driver. AST2600 has 16 PWM channel and
> > 16 FAN tacho channel.
> > 
> > Changes since v1:
> > - fixed review comments
> > - fixed double-looped calculation of div_h and div_l
> > - moving configuration to device tree
> > - register hwmon driver with devm_hwmon_device_register_with_info()
> > 
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> 
> checkpatch says:
> 
> total: 0 errors, 9 warnings, 26 checks, 779 lines checked
> 
> This is a bit much. Please run checkpatch --strict and fix the issues
> it reports. Please also fix the issues reported by 0-day as well as
> the issues reported by the bindings robot, and resubmit.
> 
> Thanks,
> Guenter

I'll fix the WARNINGs and CHECKs.

Thanks,
Troy Lee
