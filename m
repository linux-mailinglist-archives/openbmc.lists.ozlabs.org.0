Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88041A2A62
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 00:56:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KHzY6b8NzDrp8
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 08:56:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.193; helo=mail-oi1-f193.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46KHyv39f3zDrfs;
 Fri, 30 Aug 2019 08:56:06 +1000 (AEST)
Received: by mail-oi1-f193.google.com with SMTP id h4so488406oih.8;
 Thu, 29 Aug 2019 15:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AcqAKzCkm/gS75dDEccyBh6Oz2jirMULmsO7hRuPRrg=;
 b=PfZJXR06aieNuIBifUHpoZ62wlnQ6llP8vwHnvVptz2NLsHs/B4tS2CqyjIYaAgPKu
 +tX8Ml96U8hqdRTC0WI0Ho8YVHcAORWThj1w6uw5TiMEJDgTIrK2jxV/M0tL91FHtYvG
 6fd4us7rZipFtvTNva72fMMziXEBdNvrg/hPcFguI7gZ7P9exhtAsslkRPLVghhYMHqw
 lOdocRbw4Ec2Z+M41UP5jlt5h6pBRSVco70yI8xu/GmdYvcElPAXacI1TcdsTR7waxUX
 sNRhopk7doKngwjM5s+n6KXzCAlxlHpoiP/7Vzq37xnYPVam03lQSc1MNfINv1MXCxjo
 796A==
X-Gm-Message-State: APjAAAVvmt0Zf6Df1LaKdicHCzVOxGBuKolFfOchgtGbmb10L/0nJBXt
 e60oA3b8T0F7WSL1Fq60vQ==
X-Google-Smtp-Source: APXvYqwkvLByG+E3adSffoHfKaAwsMfaOUgusko2o61o2oZkDP5FVCtM+58yL1hGvRelXT0PjmhLBg==
X-Received: by 2002:aca:f5c8:: with SMTP id t191mr8247459oih.61.1567119363695; 
 Thu, 29 Aug 2019 15:56:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id i22sm1253218oto.80.2019.08.29.15.56.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 15:56:02 -0700 (PDT)
Date: Thu, 29 Aug 2019 17:56:02 -0500
From: Rob Herring <robh@kernel.org>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Subject: Re: [PATCH v2 4/4] dt-bindings/watchdog: Add access_cs0 option for
 alt-boot
Message-ID: <20190829225602.GA15783@bogus>
References: <20190826104636.19324-1-i.mikhaylov@yadro.com>
 <20190826104636.19324-5-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826104636.19324-5-i.mikhaylov@yadro.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Alexander Amelkin <a.amelkin@yadro.com>, linux-watchdog@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, Guenter Roeck <linux@roeck-us.net>,
 linux-kernel@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Aug 26, 2019 at 01:46:36PM +0300, Ivan Mikhaylov wrote:
> The option for the ast2400/2500 to get access to CS0 at runtime.
> 
> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> ---
>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index c5077a1f5cb3..023a9b578df6 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -34,6 +34,13 @@ Optional properties:
>                  engine is responsible for this.
>  
>   - aspeed,alt-boot:    If property is present then boot from alternate block.
> +                       At alternate side 'access_cs0' sysfs file provides:

What's sysfs?

Don't put Linux stuff in bindings.

> +                       ast2400: a way to get access to the primary SPI flash
> +                                chip at CS0 after booting from the alternate
> +                                chip at CS1.
> +                       ast2500: a way to restore the normal address mapping from
> +                                (CS0->CS1, CS1->CS0) to (CS0->CS0, CS1->CS1).
> +
>   - aspeed,external-signal: If property is present then signal is sent to
>  			external reset counter (only WDT1 and WDT2). If not
>  			specified no external signal is sent.
> -- 
> 2.20.1
> 
