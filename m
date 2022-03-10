Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D11BE4D52C7
	for <lists+openbmc@lfdr.de>; Thu, 10 Mar 2022 21:03:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF0PR5P1fz30Cm
	for <lists+openbmc@lfdr.de>; Fri, 11 Mar 2022 07:03:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=icOiBMOV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=roeck-us.net (client-ip=192.185.46.152;
 helo=gateway22.websitewelcome.com; envelope-from=linux@roeck-us.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256
 header.s=default header.b=icOiBMOV; dkim-atps=neutral
X-Greylist: delayed 1499 seconds by postgrey-1.36 at boromir;
 Fri, 11 Mar 2022 07:03:14 AEDT
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com
 [192.185.46.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF0Ny073gz2xTq
 for <openbmc@lists.ozlabs.org>; Fri, 11 Mar 2022 07:03:13 +1100 (AEDT)
Received: from cm14.websitewelcome.com (cm14.websitewelcome.com [100.42.49.7])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id 2DBD251F11
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2022 13:13:44 -0600 (CST)
Received: from 162-215-252-75.unifiedlayer.com ([208.91.199.152])
 by cmsmtp with SMTP
 id SOEKnUxMkHnotSOEKnqyYZ; Thu, 10 Mar 2022 13:13:44 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mb2llu6cUqKPxTlbEIr1Yx2wzBP2FczZ/P1WdCDimwo=; b=icOiBMOVuWpAcU57dA4s8wdshx
 IA9xojyJTcwSPcVILmNhsMjlBz30tPcOCQBz9XVzj61RMgs+SOIhAwC64md/R/MlRqG34uvgh+rEu
 sJHIeyDQeUcCozNULY/wqGo1azEog6vdBGH7U7KZfI3fH5Dbat0Fo0/Ta5vglwEgf/uhEidQR0k5p
 DaqAiM+pmMmFqMY86j44may4ioxUCayWX2NxNh318QRFbtkC5W+JblazESYXiTqRU+O1cCYZARF5Q
 Ey9c+7Jxmd4cJfkBsQF1IC7tGEKCXujsiCvyfTB89CXXLoiNexwlE73avvDMtC5PT3WEIJWD8LTOJ
 PRUwN7dA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:57420 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@roeck-us.net>)
 id 1nSOEJ-001yY6-NT; Thu, 10 Mar 2022 19:13:43 +0000
Date: Thu, 10 Mar 2022 11:13:42 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 0/6] hwmon: (nct6775) Convert to regmap, add i2c support
Message-ID: <20220310191342.GB803893@roeck-us.net>
References: <20220309005047.5107-1-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309005047.5107-1-zev@bewilderbeest.net>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1nSOEJ-001yY6-NT
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost)
 [108.223.40.66]:57420
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
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
 Jean Delvare <jdelvare@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Rob Herring <robh+dt@kernel.org>, Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On Tue, Mar 08, 2022 at 04:50:41PM -0800, Zev Weiss wrote:
> Hello,
> 
> This is v2 of my patches to add i2c support to the nct6775 driver.
> 

Just to let you know, I won't have time to review - much less test - the series 
before the commit window opens. Also, it is way too late for the upcoming release;
the changes are substantial enough to warrant a large soak time in linux-next.
The series will have to wait for v5.19.

Guenter

> Changes since v1 [0]:
>  - Added preparatory patch converting driver to regmap API [Guenter]
>  - Replaced ENOSPC with ENOBUFS and removed WARN_ON() in
>    nct6775_add_attr_group() [Guenter]
>  - Added dedicated symbol namespace [Guenter]
>  - Removed nct6775_write_temp() and nct6775_update_device() symbol
>    exports [Guenter]
>  - Reordered patches to put dt-bindings patch first [Krzysztof]
> 
> The nct6775-platform and nct6775-i2c drivers have both been tested on
> the NCT6779D in an ASRock ROMED8HM3 system and the NCT6798 [1] in an
> ASRock X570-D4U (the latter thanks to Renze, CCed); both seem to work
> as expected on both systems.  I don't have access to any asuswmi
> hardware, so testing of the nct6775-platform driver on that to ensure
> it doesn't break there would be appreciated (Oleksandr, perhaps?).
> 
> [0] https://lore.kernel.org/linux-hwmon/20220226133047.6226-1-zev@bewilderbeest.net/
> [1] Though it's physically labeled (mislabeled?) as an NCT6796, for
>     what that's worth.
> 
> A slightly edited version of the previous cover letter follows:
> 
> 
> This patch series augments the existing nct6775 driver with support
> for the hardware's i2c interface; along the way it converts the driver
> to use the regmap API, and splits the LPC-specific platform driver
> into a separate module from the interface-independent core.
> 
> Thus far the nct6775 driver has only supported the LPC interface,
> which is the main interface by which the Super-I/O chip is typically
> connected to the host (x86) processor.
> 
> However, these chips also provide an i2c interface, which can provide
> a way for a BMC to also monitor sensor readings from them.  On some
> systems (such as the ASRock Rack ROMED8HM3 and X570-D4U) this may be
> the only way for the BMC to monitor host CPU temperatures (e.g. to
> indirectly access a TSI interface); this functionality is thus an
> important component of enabling OpenBMC to support such systems.
> 
> In such an arrangement the Super-I/O chip is simultaneously controlled
> by two independent processors (the host and the BMC) which typically
> do not coordinate their accesses with each other.  In order to avoid
> conflicts between the two, the i2c driver avoids all writes to the
> device, since the BMC's needs with the hardware are merely that it be
> able to retrieve sensor readings.  This allows the host processor to
> remain ultimately in control of the chip and unaware of the BMC's use
> of it at all.
> 
> The sole exception to the "no writes" rule for the i2c driver is for
> the bank-select register -- while I haven't been able to find any
> explicit statement in the Nuvoton datasheets guaranteeing this,
> testing via manual register accesses (as detailed in [2]) has
> indicated that, as one might hope, the i2c interface has its own
> bank-select register independent of the one used by the LPC interface.
> 
> In terms of code structure, the approach taken in this series is to
> first convert the driver's register accesses to the regmap API, and
> then split the LPC-specific parts of it out into a separate module
> (called nct6775-platform), leaving the interface-independent parts in
> a generic driver (called nct6775-core).  The nct6775-i2c driver is
> then added as an additional consumer of the nct6775-core module's
> functionality (essentially just providing its own set of regmap
> read/write callback functions).
> 
> The first patch provides DT bindings for the nct6775, the second
> contains the change to convert all register accesses to use a regmap.
> The third and fourth patches make some relatively small
> infrastructural changes to the driver.  The core/platform driver split
> is in the fifth patch, and the final patch adds the i2c driver itself.
> 
> 
> Thanks,
> Zev
> 
> [2] https://lore.kernel.org/linux-hwmon/YhttzgDtGpcTniyw@hatter.bewilderbeest.net/
> 
> Zev Weiss (6):
>   dt-bindings: hwmon: Add nuvoton,nct6775
>   hwmon: (nct6775) Convert register access to regmap API
>   hwmon: (nct6775) Rearrange attr-group initialization
>   hwmon: (nct6775) Add read-only mode
>   hwmon: (nct6775) Split core and platform driver
>   hwmon: (nct6775) Add i2c driver
> 
>  .../bindings/hwmon/nuvoton,nct6775.yaml       |   48 +
>  MAINTAINERS                                   |   12 +-
>  drivers/hwmon/Kconfig                         |   32 +-
>  drivers/hwmon/Makefile                        |    4 +-
>  drivers/hwmon/{nct6775.c => nct6775-core.c}   | 2310 +++++------------
>  drivers/hwmon/nct6775-i2c.c                   |  179 ++
>  drivers/hwmon/nct6775-platform.c              | 1232 +++++++++
>  drivers/hwmon/nct6775.h                       |  252 ++
>  8 files changed, 2382 insertions(+), 1687 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
>  rename drivers/hwmon/{nct6775.c => nct6775-core.c} (69%)
>  create mode 100644 drivers/hwmon/nct6775-i2c.c
>  create mode 100644 drivers/hwmon/nct6775-platform.c
>  create mode 100644 drivers/hwmon/nct6775.h
> 
> -- 
> 2.35.1
> 
