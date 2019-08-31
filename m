Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFABA44E5
	for <lists+openbmc@lfdr.de>; Sat, 31 Aug 2019 17:04:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LKPb3gL6zDqKr
	for <lists+openbmc@lfdr.de>; Sun,  1 Sep 2019 01:04:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="B3bTo9nm"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LKLW0yXCzDr2p;
 Sun,  1 Sep 2019 01:01:38 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id a67so3157508pfa.6;
 Sat, 31 Aug 2019 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pgmHg3ukoYkhaRQ72n0KiU687Zs7MhjBlJ4ipL0qwQE=;
 b=B3bTo9nmMR/i7oh0IaQJj8OJoTDX+qoEGfM41Dt+zLDGc70vkBAsDR6WZJxYKyTByR
 ToqEQBhAvFzUGcgZYhC06n26Dv3l5QCPzWBTSZ7jb38S47K+8Ow0peFxgaasP+Fz2JKG
 /Xs4NfxIEhsZCMMcDQz0BBRKp9aJ2nq9R/odVV+jl+tDkopQs2p9N2JXnhi8626PsZiT
 JKloU3LculAz8V+r9ktvuT31bx+7GtcIuN1aDVs+g4sAIn/cqmDwxzDeyW21Z4GON4hz
 T7AIB3kalcAWUpCo78XZiuS0ACwNaYRjDOQmCLAGMe2ZUpdUd5gOEL9xIQ+CNCPoyOtK
 ELEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=pgmHg3ukoYkhaRQ72n0KiU687Zs7MhjBlJ4ipL0qwQE=;
 b=bhHjFYRJa3lGkpARtTHolM7kveL9OTV8gNqq/RvptPoEjFlmXnb9iHuVCUu8reG2/z
 r3cIzD44UHba5vkJDVZRQGDP/ZKj9/34JSzmQG1DKiLVi13IIXEm/0PCuDjIh3FhvG/t
 xX3QaeX8Ex8gyxxl90AnhNtnwv78Z7wFWoXcNoWCamfrPSjCeD6wOKL5yLoe5LDiwy+c
 sZlV0PGVvqUzv0fpmbXcVXb3RBbpRUS4oVZb8hYysiTppGbjffVc+jLn1kYdzvQva/AS
 btdDxhwoYzKSsqMr0sQoK9alRp0chmErgiAKS8I90o6YRHz6SGPXIJWwdNfiIVOFr6ll
 /UVg==
X-Gm-Message-State: APjAAAUS/u8/bHpTEeO/k44DXLxSSsY2H8TRk4WepXbyZm8Txg2TSw/1
 HK714f4TLJ1UtLa6BhtDPfc=
X-Google-Smtp-Source: APXvYqzxO5TxxgJX3+CZnA8sNzId2Ur3EJ1lJTqlYglz6V20PPBYoElyIToU51GXQcMExZzVIgyYcg==
X-Received: by 2002:aa7:96dc:: with SMTP id h28mr24787013pfq.86.1567263697149; 
 Sat, 31 Aug 2019 08:01:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id t70sm9610914pjb.2.2019.08.31.08.01.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 31 Aug 2019 08:01:36 -0700 (PDT)
Date: Sat, 31 Aug 2019 08:01:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH v4 4/4] aspeed/watchdog: Add access_cs0 option for alt-boot
Message-ID: <20190831150135.GA7230@roeck-us.net>
References: <20190828102402.13155-1-i.mikhaylov@yadro.com>
 <20190828102402.13155-5-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828102402.13155-5-i.mikhaylov@yadro.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Alexander Amelkin <a.amelkin@yadro.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Aug 28, 2019 at 01:24:02PM +0300, Ivan Mikhaylov wrote:
> The option for the ast2400/2500 to get access to CS0 at runtime.
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../ABI/testing/sysfs-class-watchdog          | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-watchdog b/Documentation/ABI/testing/sysfs-class-watchdog
> index 6317ade5ad19..675f9b537661 100644
> --- a/Documentation/ABI/testing/sysfs-class-watchdog
> +++ b/Documentation/ABI/testing/sysfs-class-watchdog
> @@ -72,3 +72,37 @@ Description:
>  		It is a read/write file. When read, the currently assigned
>  		pretimeout governor is returned.  When written, it sets
>  		the pretimeout governor.
> +
> +What:		/sys/class/watchdog/watchdog1/access_cs0
> +Date:		August 2019
> +Contact:	Ivan Mikhaylov <i.mikhaylov@yadro.com>,
> +		Alexander Amelkin <a.amelkin@yadro.com>
> +Description:
> +		It is a read/write file. This attribute exists only if the
> +		system has booted from the alternate flash chip due to
> +		expiration of a watchdog timer of AST2400/AST2500 when
> +		alternate boot function was enabled with 'aspeed,alt-boot'
> +		devicetree option for that watchdog or with an appropriate
> +		h/w strapping (for WDT2 only).
> +
> +		At alternate flash the 'access_cs0' sysfs node provides:
> +			ast2400: a way to get access to the primary SPI flash
> +				chip at CS0 after booting from the alternate
> +				chip at CS1.
> +			ast2500: a way to restore the normal address mapping
> +				from (CS0->CS1, CS1->CS0) to (CS0->CS0,
> +				CS1->CS1).
> +
> +		Clearing the boot code selection and timeout counter also
> +		resets to the initial state the chip select line mapping. When
> +		the SoC is in normal mapping state (i.e. booted from CS0),
> +		clearing those bits does nothing for both versions of the SoC.
> +		For alternate boot mode (booted from CS1 due to wdt2
> +		expiration) the behavior differs as described above.
> +
> +		This option can be used with wdt2 (watchdog1) only.
> +
> +		When read, the current status of the boot code selection is
> +		shown. When written with any non-zero value, it clears
> +		the boot code selection and the timeout counter, which results
> +		in chipselect reset for AST2400/AST2500.
