Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A112C426E
	for <lists+openbmc@lfdr.de>; Wed, 25 Nov 2020 15:49:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch3hM2GqwzDqM7
	for <lists+openbmc@lfdr.de>; Thu, 26 Nov 2020 01:49:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=roeck-us.net (client-ip=67.222.39.168;
 helo=gproxy6-pub.mail.unifiedlayer.com; envelope-from=linux@roeck-us.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256
 header.s=default header.b=G8dZ4rBW; dkim-atps=neutral
Received: from gproxy6-pub.mail.unifiedlayer.com
 (gproxy6-pub.mail.unifiedlayer.com [67.222.39.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch3Y26FLVzDqx0
 for <openbmc@lists.ozlabs.org>; Thu, 26 Nov 2020 01:43:31 +1100 (AEDT)
Received: from cmgw14.unifiedlayer.com (unknown [10.9.0.14])
 by gproxy6.mail.unifiedlayer.com (Postfix) with ESMTP id 9D8AE1E06EE
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2020 07:43:23 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152]) by cmsmtp with ESMTP
 id hw0xkrVSfwNNlhw0xk4TtB; Wed, 25 Nov 2020 07:43:23 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=G6cy7es5 c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=pGLkceISAAAA:8
 a=_jlGtV7tAAAA:8 a=jtbBNqsHAAAA:8 a=wDQFPEhNYyAw1ElLWhAA:9
 a=CjuIK1q_8ugA:10:nop_charset_2 a=nlm17XC03S6CtCLSeiRr:22
 a=RWaeYqt-Cn-VcsFsiLGo:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UJRSog9lmDY1zKtsy7ZZF4ejMAXYqU0EhOMjDDdQg2E=; b=G8dZ4rBWC3O5ELN1IUrzQ36j8C
 XbwEyKYh42djUFKXaMVETcs2WWkLlcK/SaDdmFyL7PTLZRl04ITbppWZ1CZLpE8fHyYCTZ3+11E4f
 937Wkpo1YUcJ70noNb97hP/NZQ/f3rmHcXS6FpgliyJZvsMaEhx0UajUu120oUroluy6h001OMQiG
 HGz+edXstiTq410SZaUGoWF37HE0B9cNzbES0xrOIkrnBonnDQTicj10UAj8TJht0PrkhduAGpK/1
 IkuUx3DnTXzhvQhRnhFgygL3b6sblbUAHJ+FonmHT5U65XVq/0IPY8stylW47agfAmePALIzEWYsC
 KQRfK6GA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:34496 helo=localhost)
 by bh-25.webhostbox.net with esmtpa (Exim 4.93)
 (envelope-from <linux@roeck-us.net>)
 id 1khw0w-002VVB-Gg; Wed, 25 Nov 2020 14:43:22 +0000
Date: Wed, 25 Nov 2020 06:43:22 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: rentao.bupt@gmail.com
Subject: Re: [PATCH v5 2/2] docs: hwmon: Document max127 driver
Message-ID: <20201125144322.GA98562@roeck-us.net>
References: <20201123185658.7632-1-rentao.bupt@gmail.com>
 <20201123185658.7632-3-rentao.bupt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123185658.7632-3-rentao.bupt@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1khw0w-002VVB-Gg
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost)
 [108.223.40.66]:34496
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 56
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 linux-doc@vger.kernel.org, taoren@fb.com, openbmc@lists.ozlabs.org,
 Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 mikechoi@fb.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 23, 2020 at 10:56:58AM -0800, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add documentation for the max127 hardware monitoring driver.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Applied.

Thanks,
Guenter

> ---
>  Changes in v5:
>    - None.
>  Changes in v4:
>    - None.
>  Changes in v3:
>    - no code change. xdp maintainers were removed from to/cc list.
>  Changes in v2:
>    - add more description for min/max sysfs nodes.
>    - convert values from volt to millivolt in the document.
> 
>  Documentation/hwmon/index.rst  |  1 +
>  Documentation/hwmon/max127.rst | 45 ++++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 Documentation/hwmon/max127.rst
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 408760d13813..0a07b6000c20 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -111,6 +111,7 @@ Hardware Monitoring Kernel Drivers
>     ltc4245
>     ltc4260
>     ltc4261
> +   max127
>     max16064
>     max16065
>     max1619
> diff --git a/Documentation/hwmon/max127.rst b/Documentation/hwmon/max127.rst
> new file mode 100644
> index 000000000000..dc192dd9c37c
> --- /dev/null
> +++ b/Documentation/hwmon/max127.rst
> @@ -0,0 +1,45 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver max127
> +====================
> +
> +Author:
> +
> +  * Tao Ren <rentao.bupt@gmail.com>
> +
> +Supported chips:
> +
> +  * Maxim MAX127
> +
> +    Prefix: 'max127'
> +
> +    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX127-MAX128.pdf
> +
> +Description
> +-----------
> +
> +The MAX127 is a multirange, 12-bit data acquisition system (DAS) providing
> +8 analog input channels that are independently software programmable for
> +a variety of ranges. The available ranges are {0,5V}, {0,10V}, {-5,5V}
> +and {-10,10V}.
> +
> +The MAX127 features a 2-wire, I2C-compatible serial interface that allows
> +communication among multiple devices using SDA and SCL lines.
> +
> +Sysfs interface
> +---------------
> +
> +  ============== ==============================================================
> +  in[0-7]_input  The input voltage (in mV) of the corresponding channel.
> +		 RO
> +
> +  in[0-7]_min    The lower input limit (in mV) for the corresponding channel.
> +		 ADC range and LSB will be updated when the limit is changed.
> +		 For the MAX127, it will be adjusted to -10000, -5000, or 0.
> +		 RW
> +
> +  in[0-7]_max    The higher input limit (in mV) for the corresponding channel.
> +		 ADC range and LSB will be updated when the limit is changed.
> +		 For the MAX127, it will be adjusted to 0, 5000, or 10000.
> +		 RW
> +  ============== ==============================================================
