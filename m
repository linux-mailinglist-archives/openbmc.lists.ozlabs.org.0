Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7ECA4CE6
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:48:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBK7457xzDqN1
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:48:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WLYmJXxA"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46D9mN31RqzDqy9;
 Thu, 22 Aug 2019 00:59:16 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id c2so1460694plz.13;
 Wed, 21 Aug 2019 07:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=MGu3Yx6P1oW2dkVZJ8rQOp/8pAXcm/B2IMgoDlOEKl4=;
 b=WLYmJXxArkZ+xpZrPWfZ85MRzNzUcKTIsk882+RxQxxR3Az/71RvVWigMyyc3o9qDg
 mtvIRNq6XqeN1cOcZdrxEKMDHffD2FSe6/WbeP3fCJsQQUwFHkNqyr1s3s/9l6wOl4hi
 i61XL/Ai4/XENarTcYSqmmmeNxx7hyK+c8wCDaxPxncIttf7Mf8ZvxfKx2BB2nHOHoC4
 c0aMh+x4BaABVYpPLLtW5xg8u7M3ZX6mQoBFs4WrPYllZko4hPmPVVPlY8U86SnB4jfI
 OfGoENjS2m5V/qu3I2HjQjjnojwvAqezsZODeJIns7mWjTQGdm1PNzNZCvBa11J0X1NP
 9Ryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=MGu3Yx6P1oW2dkVZJ8rQOp/8pAXcm/B2IMgoDlOEKl4=;
 b=ilhisAh4BQgDAEa8wJitFG7bimupAj/uwLqVLa83XjJNswHnydYDM51pOMpgf5jXpG
 Zkfr3CntZSEUGNm2CA/BjSzOAJ+f6w9WIXkSFUP3zfNmvzMvJBvEuAfZh3KA6y9LFzs1
 KTFGLcfYoAo8i/2pD1XLhksOLBijUe4mQtANqeRVO0mvnFdbP+HQ+lA12CGqWafQCQWr
 d9iPgyfphvnZGaECI/vk4DA3fpfkpn4iYBRGpYb/S/N3RjL1nXXrm/qTqGEB67EVRdQp
 4zt5ZiDEoW6tDy0d4k3SfuvV8sIA+3TNbYmPb9Pz7kaht3SQxXNWiPsYbUHbcyWu3+Kx
 YafQ==
X-Gm-Message-State: APjAAAU/ETJ2hgIzVzcvya/+uA0bQgjPFH5sNdPnrH/klJrn9l6MCTVa
 7HKGiyyzpcUA5nnRpVyiHYI=
X-Google-Smtp-Source: APXvYqxUP8xkNyQZWYrRIamXP/wMkzF1WMKVh7TUKjSQXGKEymiVCjMrEbQg8CoUx7Bzq7phU6wEqA==
X-Received: by 2002:a17:902:44f:: with SMTP id
 73mr34838894ple.192.1566399552898; 
 Wed, 21 Aug 2019 07:59:12 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id m145sm27713891pfd.68.2019.08.21.07.59.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 21 Aug 2019 07:59:12 -0700 (PDT)
Date: Wed, 21 Aug 2019 07:59:11 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matthias Maennich <maennich@google.com>
Subject: Re: [PATCH v3 11/11] RFC: watchdog: export core symbols in
 WATCHDOG_CORE namespace
Message-ID: <20190821145911.GA6521@roeck-us.net>
References: <20190813121733.52480-1-maennich@google.com>
 <20190821114955.12788-1-maennich@google.com>
 <20190821114955.12788-12-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821114955.12788-12-maennich@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, lucas.de.marchi@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arch@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, mingo@redhat.com,
 geert@linux-m68k.org, NXP Linux Team <linux-imx@nxp.com>,
 Tomas Winkler <tomas.winkler@intel.com>, Jean Delvare <jdelvare@suse.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, tglx@linutronix.de,
 michal.lkml@markovi.net, Scott Branden <sbranden@broadcom.com>,
 Andrew Jeffery <andrew@aj.id.au>, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, yamada.masahiro@socionext.com,
 Thierry Reding <thierry.reding@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kukjin Kim <kgene@kernel.org>, kernel-team@android.com, sspatil@google.com,
 linux-watchdog@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, pombredanne@nexb.com,
 linux-m68k@lists.linux-m68k.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, maco@android.com,
 linux-arm-kernel@lists.infradead.org, Barry Song <baohua@kernel.org>,
 Johannes Thumshirn <morbidrsa@gmail.com>, oneukum@suse.com,
 Patrice Chotard <patrice.chotard@st.com>, Stefan Wahren <wahrenst@gmx.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, kstewart@linuxfoundation.org,
 usb-storage@lists.one-eyed-alien.net, linux-tegra@vger.kernel.org,
 patches@opensource.cirrus.com, joel@joelfernandes.org, sam@ravnborg.org,
 linux-rtc@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, Eric Anholt <eric@anholt.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 bcm-kernel-feedback-list@broadcom.com, stern@rowland.harvard.edu,
 arnd@arndb.de, Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Orson Zhai <orsonzhai@gmail.com>, linux-hwmon@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Andreas Werner <andreas.werner@men.de>, Avi Fishman <avifishman70@gmail.com>,
 maco@google.com, jeyu@kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Baruch Siach <baruch@tkos.co.il>, Mans Rullgard <mans@mansr.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Jerry Hoemann <jerry.hoemann@hpe.com>, Tali Perry <tali.perry1@gmail.com>,
 hpa@zytor.com, linux-scsi@vger.kernel.org, openbmc@lists.ozlabs.org,
 x86@kernel.org, Andy Gross <agross@kernel.org>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 linux-mediatek@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Baolin Wang <baolin.wang@linaro.org>,
 Patrick Venture <venture@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-modules@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 21, 2019 at 12:49:26PM +0100, Matthias Maennich wrote:
> Modules using these symbols are required to explicitly import the
> namespace. This patch was generated with the following steps and serves
> as a reference to use the symbol namespace feature:
> 
>  1) Use EXPORT_SYMBOL_NS* macros instead of EXPORT_SYMBOL* for symbols
>     in watchdog_core.c
>  2) make  (see warnings during modpost about missing imports)
>  3) make nsdeps
> 
> I used 'allmodconfig' for the above steps to ensure all occurrences are
> patched.
> 
> Defining DEFAULT_SYMBOL_NAMESPACE in the Makefile is not trivial in this
> case as not only watchdog_core is defined in drivers/watchdog/Makefile.
> Hence this patch uses the variant of using the EXPORT_SYMBOL_NS* macros
> to export into a different namespace.
> 
I don't have the context, and thus I am missing the point of this patch
set. Whatever it is supposed to accomplish, it seems extreme to me
to require extra code in each driver for it.

Anyway, WATCHDOG_CORE would be the default namespace (if it is what
I think it is) for watchdog drivers, even though not all watchdog drivers
use it. As such, I am missing an explanation why defining it in Makefile
is not trivial. "... as not only watchdog_core is defined in
drivers/watchdog/Makefile" does not mean anything to me and is not a real
explanation. Also, it is not immediately obvious to me why "select
WATCHDOG_CORE" in Kconfig would not automatically imply that WATCHDOG_CORE
is used by a given driver, and why it is impossible to use that
information to avoid the per-driver changes.

I am also missing an explanation why WATCHDOG_CORE is going to be a
separate namespace to start with. Maybe that discussion has happened,
but I don't recall being advised or asked or told about it. Are we also
going to have a new HWMON_CORE namespace ? And the same for each other
subsystem in the kernel ?

Since this is being added to the watchdog API, it will have to be
documented accordingly. Watchdog driver writers, both inside and outside
the watchdog subsystem, will need to know that they now have to add an
additional boilerplate declaration into their drivers.

Last but not least, combining patches affecting multiple subsystems in a
single patch will make it difficult to apply and will likely result in
conflicts. Personally I would prefer a split into one patch per affected
subsystem. Also, please keep in mind that new pending watchdog drivers
won't have the new boilerplate.

Thanks,
Guenter
