Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A893C69A1
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 07:03:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP7nY5xRRz2yY0
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 15:03:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nS2M2lPZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP7mw00lLz2yMX;
 Tue, 13 Jul 2021 15:02:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Y9SCFUFvDiiwNKATD/MeNeTY42rYD5q8ZmhhYCeG3N4=; b=nS2M2lPZSduOe3g5f4fbr8Y9Jz
 Wgt3kMyZg2plfxTU8lGiFrHllqm4+ayu+ZsaAoSJ1jaOE1fL18lpVXBOmPbe8XWmcUoErZzTy43/q
 1ZhwoXphWOilbDlGZXkEbYSgfnGsYG9dv9Bk7qpKul/zK4Cr9mhakYmQuxI2eh0s+1G0M8IQkSrCg
 VahLxPcl5b3Tc/gJm0nNI0biEiQXOhTqenY6pR9gyaiSeXiKWI0jqFPLdkWi5rpinPv+UEUqIZEB8
 4XZAoZaH2uJvxlzNMHzP79nT0U7K/Oipe5lu2GeOru970nnmzR1uTDxcLzYjPWXm96OJgfLfvagBA
 okQLXZNg==;
Received: from [2601:1c0:6280:3f0::aefb]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3AYd-0097z2-JX; Tue, 13 Jul 2021 05:02:11 +0000
Subject: Re: [PATCH 07/14] peci: Add peci-aspeed controller driver
To: Iwona Winiarska <iwona.winiarska@intel.com>,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-8-iwona.winiarska@intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b894ba5e-e1ae-e5dd-87be-dc33912dd5c0@infradead.org>
Date: Mon, 12 Jul 2021 22:02:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712220447.957418-8-iwona.winiarska@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 x86@kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yazen Ghannam <yazen.ghannam@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 7/12/21 3:04 PM, Iwona Winiarska wrote:
> diff --git a/drivers/peci/controller/Kconfig b/drivers/peci/controller/Kconfig
> new file mode 100644
> index 000000000000..8ddbe494677f
> --- /dev/null
> +++ b/drivers/peci/controller/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config PECI_ASPEED
> +	tristate "ASPEED PECI support"
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	depends on OF
> +	depends on HAS_IOMEM
> +	help
> +	  Enable this driver if you want to support ASPEED PECI controller.
> +
> +	  This driver can be also build as a module. If so, the module

	              can also be built as a module.

> +	  will be called peci-aspeed.


-- 
~Randy

