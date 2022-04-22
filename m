Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1544E50BAE5
	for <lists+openbmc@lfdr.de>; Fri, 22 Apr 2022 16:58:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlHbL6HjSz3bYw
	for <lists+openbmc@lfdr.de>; Sat, 23 Apr 2022 00:58:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zynYzEfd;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=zynYzEfd; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlHZv1jdqz2yWn
 for <openbmc@lists.ozlabs.org>; Sat, 23 Apr 2022 00:57:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D81261782;
 Fri, 22 Apr 2022 14:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7A8C385A9;
 Fri, 22 Apr 2022 14:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1650639474;
 bh=jdfEAEfL/tHuS0CUSWCzH65IfQhsNXe6NsYvzPJn3m4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zynYzEfdFxTqZdpwtraIU+SDaP99Q45Vdj1QS+aVTi2hBIobLBP/a/r3UncGpLOeo
 WyJ/R8zr9m7h/9tXlqQxonNVA8sa9bBi7St098xXmKgmu2rCFXHh1oxPlQt/Lo5erl
 u6+URGfEHCqD/w+tRhIGFr7b9PaJeNjCVhwl97g4=
Date: Fri, 22 Apr 2022 16:57:52 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v8 3/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
Message-ID: <YmLCcFrrobUJtiLI@kroah.com>
References: <20220422024653.2199489-1-quan@os.amperecomputing.com>
 <20220422024653.2199489-4-quan@os.amperecomputing.com>
 <YmJJIb1DAIq5arCw@kroah.com>
 <82a6452a-965b-7fbe-eba2-919f0a6ed73a@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82a6452a-965b-7fbe-eba2-919f0a6ed73a@os.amperecomputing.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Phong Vo <phong@os.amperecomputing.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Open Source Submission <patches@amperecomputing.com>,
 Lee Jones <lee.jones@linaro.org>, Thu Nguyen <thu@os.amperecomputing.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 22, 2022 at 09:43:39PM +0700, Quan Nguyen wrote:
> On 22/04/2022 13:20, Greg Kroah-Hartman wrote:
> > On Fri, Apr 22, 2022 at 09:46:47AM +0700, Quan Nguyen wrote:
> > > This commit adds Ampere's SMpro error monitor driver for monitoring
> > > and reporting RAS-related errors as reported by SMpro co-processor
> > > found on Ampere's Altra processor family.
> > > 
> > > Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> > > ---
> > > Changes in v8:
> > >    + Update wording for SMPRO_ERRMON on Kconfig file             [Quan]
> > >    + Avoid uninitialized variable use               [kernel test robot]
> > >    + Switch to use sysfs_emit()                                  [Greg]
> > >    + Make sysfs to return single value                           [Greg]
> > >    + Change errors_* sysfs to error_*                            [Quan]
> > >    + Add overflow_[core|mem|pcie|other]_[ce|ue] sysfs to report
> > >    overflow status of each type of HW errors                     [Quan]
> > >    + Add some minor refactor                                     [Quan]
> > > 
> > > Changes in v7:
> > >    + Remove regmap_acquire/release_lock(), read_i2c_block_data() [Quan]
> > >    + Use regmap_noinc_read() instead of errmon_read_block()      [Quan]
> > >    + Validate number of errors before read                       [Quan]
> > >    + Fix wrong return type of *_show() function     [kernel test robot]
> > >    + Adjust patch order to avoid dependence with smpro-mfd  [Lee Jones]
> > >    + Use pointer instead of stack memory                         [Quan]
> > > 
> > > Changes in v6:
> > >    + First introduced in v6 [Quan]
> > > 
> > >   drivers/misc/Kconfig        |  12 +
> > >   drivers/misc/Makefile       |   1 +
> > >   drivers/misc/smpro-errmon.c | 477 ++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 490 insertions(+)
> > >   create mode 100644 drivers/misc/smpro-errmon.c
> > > 
> > > diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> > > index 41d2bb0ae23a..9fbe6797c440 100644
> > > --- a/drivers/misc/Kconfig
> > > +++ b/drivers/misc/Kconfig
> > > @@ -176,6 +176,18 @@ config SGI_XP
> > >   	  this feature will allow for direct communication between SSIs
> > >   	  based on a network adapter and DMA messaging.
> > > +config SMPRO_ERRMON
> > > +	tristate "Ampere Computing SMPro error monitor driver"
> > > +	depends on MFD_SMPRO || COMPILE_TEST
> > > +	help
> > > +	  Say Y here to get support for the SMpro error monitor function
> > > +	  provided by Ampere Computing's Altra and Altra Max SoCs. Upon
> > > +	  loading, the driver creates sysfs files which can be use to gather
> > > +	  multiple HW error data reported via read and write system calls.
> > > +
> > > +	  To compile this driver as a module, say M here. The driver will be
> > > +	  called smpro-errmon.
> > > +
> > >   config CS5535_MFGPT
> > >   	tristate "CS5535/CS5536 Geode Multi-Function General Purpose Timer (MFGPT) support"
> > >   	depends on MFD_CS5535
> > > diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> > > index 70e800e9127f..483308a6e113 100644
> > > --- a/drivers/misc/Makefile
> > > +++ b/drivers/misc/Makefile
> > > @@ -23,6 +23,7 @@ obj-$(CONFIG_ENCLOSURE_SERVICES) += enclosure.o
> > >   obj-$(CONFIG_KGDB_TESTS)	+= kgdbts.o
> > >   obj-$(CONFIG_SGI_XP)		+= sgi-xp/
> > >   obj-$(CONFIG_SGI_GRU)		+= sgi-gru/
> > > +obj-$(CONFIG_SMPRO_ERRMON)	+= smpro-errmon.o
> > >   obj-$(CONFIG_CS5535_MFGPT)	+= cs5535-mfgpt.o
> > >   obj-$(CONFIG_GEHC_ACHC)		+= gehc-achc.o
> > >   obj-$(CONFIG_HP_ILO)		+= hpilo.o
> > > diff --git a/drivers/misc/smpro-errmon.c b/drivers/misc/smpro-errmon.c
> > > new file mode 100644
> > > index 000000000000..df7d8fc4ff3f
> > > --- /dev/null
> > > +++ b/drivers/misc/smpro-errmon.c
> > > @@ -0,0 +1,477 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > 
> > Are you sure you mean "or any later version"?  I have to ask.
> > 
> 
> Thank Greg for the review.
> 
> Will change all to SPDX-License-Identifier: GPL-2.0-or-later in next
> version.

That is not what I am asking (the SPDX tag format).  I mean, do you
really mean "or later" for your license as that is not the license of
the kernel overall?  If so, wonderful, but I have to ask that as your
legal group needs to be aware of it, sorry.

thanks,

greg k-h
