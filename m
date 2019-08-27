Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E59799E417
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 11:25:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hk4g3V8bzDqtr
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 19:25:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="QNwHTQH6"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hk3y3gczzDqtG;
 Tue, 27 Aug 2019 19:25:02 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id CA33742ECC;
 Tue, 27 Aug 2019 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1566897896; x=1568712297; bh=m1oceRiF1Qn5bpG3Kcq7B21nL
 l0SDA1suLrzuRV2RYc=; b=QNwHTQH6Jdn9Kgs9RTfRZNE6geyuX8ZoE5YgCjSFv
 zPxnaVeQA02q/7LwHDTCh233tUyfe3F1UCUOohyoG+1zO3G0Z3U6q3faEywoX/Jd
 fivRSfSAod/yPoImQLJgOT0ef+bWyenioM7KckGVab4ZiQKOAFFSwfJjgeIE+YVk
 uk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B_j679UsMczu; Tue, 27 Aug 2019 12:24:56 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2DC3E42ECA;
 Tue, 27 Aug 2019 12:24:55 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 27 Aug 2019 12:24:54 +0300
Message-ID: <818746d20661b51914a7802dcbe0081352900b05.camel@yadro.com>
Subject: Re: [PATCH v2 3/4] watchdog/aspeed: add support for dual boot
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
 <wim@linux-watchdog.org>
Date: Tue, 27 Aug 2019 12:24:45 +0300
In-Reply-To: <0df27d36-b45f-2059-6ead-a09ceb4b7605@roeck-us.net>
References: <20190826104636.19324-1-i.mikhaylov@yadro.com>
 <20190826104636.19324-4-i.mikhaylov@yadro.com>
 <0df27d36-b45f-2059-6ead-a09ceb4b7605@roeck-us.net>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.69]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Alexander
 Amelkin <a.amelkin@yadro.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2019-08-26 at 17:14 -0700, Guenter Roeck wrote:
> > +/*
> > + * At alternate side the 'access_cs0' sysfs node provides:
> > + *   ast2400: a way to get access to the primary SPI flash chip at CS0
> > + *            after booting from the alternate chip at CS1.
> > + *   ast2500: a way to restore the normal address mapping from
> > + *            (CS0->CS1, CS1->CS0) to (CS0->CS0, CS1->CS1).
> > + *
> > + * Clearing the boot code selection and timeout counter also resets to the
> > + * initial state the chip select line mapping. When the SoC is in normal
> > + * mapping state (i.e. booted from CS0), clearing those bits does nothing
> > for
> > + * both versions of the SoC. For alternate boot mode (booted from CS1 due
> > to
> > + * wdt2 expiration) the behavior differs as described above.
> > + *
> The above needs to be in the sysfs attribute documentation as well.

My apologies but I didn't find any suitable, only watchdog parameters with
dtbindings file, where should I put it? Documentation/watchdog/aspeed-wdt-
sysfs.rst?

> > + * This option can be used with wdt2 (watchdog1) only.
> 
> This implies a specific watchdog numbering which is not guaranteed.
> Someone might implement a system with some external watchdog.
> 
> > + */
> > +static DEVICE_ATTR_RW(access_cs0);
> > +
> > +static struct attribute *bswitch_attrs[] = {
> > +	&dev_attr_access_cs0.attr,
> > +	NULL
> > +};
> > +ATTRIBUTE_GROUPS(bswitch);
> > +
> >   static const struct watchdog_ops aspeed_wdt_ops = {
> >   	.start		= aspeed_wdt_start,
> >   	.stop		= aspeed_wdt_stop,
> > @@ -306,9 +359,16 @@ static int aspeed_wdt_probe(struct platform_device
> > *pdev)
> >   	}
> >   
> >   	status = readl(wdt->base + WDT_TIMEOUT_STATUS);
> > -	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY)
> > +	if (status & WDT_TIMEOUT_STATUS_BOOT_SECONDARY) {
> >   		wdt->wdd.bootstatus = WDIOF_CARDRESET;
> >   
> > +		if (of_device_is_compatible(np, "aspeed,ast2400-wdt") ||
> > +			of_device_is_compatible(np, "aspeed,ast2500-wdt"))
> > +			wdt->wdd.groups = bswitch_groups;

> Kind of odd that the attribute only exists if the system booted from the
> second flash, but if that is what you want I won't object. Just make sure
> that this is explained properly.
Perhaps dts configuration option would be better solution for it then? "force-
cs0-switch" as example? Also, if it would be an option, dtbindings/wdt file for
documentation will be the right place for it. Usage of this at side 0 will not
get any good/bad results, it just makes user confused, so I decided to put it
only at side 1. It works only for ast2400/2500 board unfortunately, for 2600
there is big difference in switching mechanism. Any other thoughts how to make
it better?

Thanks.

