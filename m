Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E8411FDC1
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 06:00:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bpx73dQBzDq5n
	for <lists+openbmc@lfdr.de>; Mon, 16 Dec 2019 16:00:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YFVp6rF5zDqsh
 for <openbmc@lists.ozlabs.org>; Thu, 12 Dec 2019 11:46:56 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Dec 2019 16:46:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,303,1571727600"; d="scan'208";a="388123285"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga005.jf.intel.com with ESMTP; 11 Dec 2019 16:46:45 -0800
Subject: Re: [PATCH v11 03/14] peci: Add support for PECI bus driver core
To: Andy Shevchenko <andriy.shevchenko@intel.com>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-4-jae.hyun.yoo@linux.intel.com>
 <20191211201817.GC32742@smile.fi.intel.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <3bb146a4-c676-29b9-b2ac-5f1f6ac43bee@linux.intel.com>
Date: Wed, 11 Dec 2019 16:46:45 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191211201817.GC32742@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 16 Dec 2019 15:59:37 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 Randy Dunlap <rdunlap@infradead.org>, Tomer Maimon <tmaimon77@gmail.com>,
 devicetree@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
 Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
 Julia Cartwright <juliac@eso.teric.us>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Jason M Biils <jason.m.bills@linux.intel.com>,
 Eric Sandeen <sandeen@redhat.com>, Yunge Zhu <yunge.zhu@linux.intel.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
 linux-doc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 David Kershner <david.kershner@unisys.com>, Guenter Roeck <linux@roeck-us.net>,
 Wu Hao <hao.wu@intel.com>, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Gavin Schenk <g.schenk@eckelmann.de>,
 Arnd Bergmann <arnd@arndb.de>, Philippe Ombredanne <pombredanne@nexb.com>,
 Johan Hovold <johan@kernel.org>, Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@free-electrons.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sagar Dharia <sdharia@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, Alan Cox <alan@linux.intel.com>,
 Juergen Gross <jgross@suse.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Darrick J . Wong" <darrick.wong@oracle.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Vinod Koul <vkoul@kernel.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Fengguang Wu <fengguang.wu@intel.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andy,

On 12/11/2019 12:18 PM, Andy Shevchenko wrote:
> 
> Nice, we have some drivers under drivers/hwmon. Are they using PECI? How they
> will be integrated to this? Can this be part of drivers/hwmon?

This is designed for SoCs have one-wire PECI hardware which can handle
raw PECI protocol. Some drivers under 'drivers/hwmon' that use
PECI-to-I2C translation hardware are out of scope from this patch.
In case if an SoC supports both PECI-to-I2C translation mode and raw
PECI mode, only raw PECI mode can be integrated to this. NPCM7xx is
the case and peci-npcm driver in this patch set is an example of
the raw PECI driver.

This patch includes peci-cputemp and peci-dimmtemp as raw PECI hwmon
drivers.

>> Changes since v10:
> 
> It's funny I don't remember previous version(s), but anyway I'll comment on
> this later on -- it has at least several style issues / inconveniences.

I CC'ed you in every submissions but you probably forgot that because I
submitted v10 in January this year. Thanks for your review.

>> - Split out peci-dev module from peci-core module.
>> - Added PECI 4.0 command set support.
>> - Refined 32-bit boundary alignment for all PECI ioctl command structs.
>> - Added DMA safe command buffer handling in peci-core.
>> - Refined kconfig dependencies in PECI subsystem.
>> - Fixed minor bugs and style issues.
>> - configfs support isn't added in this patch set. Will add that using a
>>    seperate patch set.
> 
>> +config PECI
>> +	tristate "PECI support"
>> +	select CRC8
> 
>> +	default n
> 
> As for beginning, this one is redundant.
> If you have more, drop them.

I see. I'll drop the default setting.

>> +#include <linux/bitfield.h>
>> +#include <linux/crc8.h>
>> +#include <linux/delay.h>
>> +#include <linux/mm.h>
>> +#include <linux/module.h>
> 
>> +#include <linux/of_device.h>
> 
> What about ACPI? Can you use fwnode API?

Currently, it's targeting BMC (Baseboard Management Controller) SoCs
that are running on ARM kernel. If any needs of ACPI support comes in
the future, the ACPI support will be added.

Thanks a lot for your review!

-Jae

>> +#include <linux/peci.h>
>> +#include <linux/pm_domain.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/sched/task_stack.h>
>> +#include <linux/slab.h>
> 
