Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D12A97E0
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 03:15:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P2n66zxNzDqxq
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 11:15:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P2m92XdzzDqS4;
 Thu,  5 Sep 2019 11:14:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="MAX0yV+2"; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46P2m83bY3z9s4Y;
 Thu,  5 Sep 2019 11:14:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1567646089; bh=VZEXu/8K0wET31tHvAZUGkrnyI6iOlA5d0sDOsyL6qU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=MAX0yV+2PtlTCMb3yIbqhfIdafdziRZsbExW3+Qn3T+yml9P0YftaSBDKL9bme+OV
 VOGYjqPI4PQBbvZoMsH/W7uLBaDPXEEm4f+9/TQiSakZS3FCGgd9CH7/P89OHdyjFM
 dx0SWZgbF3Pr4bXI7jTaJDll8Ch1lfonfBG8G7XCxoEKuvysLTX6UfHb8j5o/gMvHz
 XDc3e4LxiiVOtApTNh7yjtrvIPB2b8JyQA+2yXcRs+Gpx9rT64Ne+GxkCzmBwLU/re
 mHp8fNxYujlsRbJ1ixkcRXvVAK3c5bBZV2VIH6jecueG/JZ1xipCn0OSaiM3X459QF
 h5XZBivas2cFg==
Message-ID: <a2ff0b6edb87d5495dd8e683e95d3b719e55f970.camel@ozlabs.org>
Subject: Re: [PATCH v2 1/3] drivers/tty/serial/8250: Make Aspeed VUART SIRQ
 polarity configurable
From: Jeremy Kerr <jk@ozlabs.org>
To: Oskar Senft <osk@google.com>, joel@jms.id.au, andrew@aj.id.au
Date: Thu, 05 Sep 2019 09:14:44 +0800
In-Reply-To: <20190731013404.243755-1-osk@google.com>
References: <20190731013404.243755-1-osk@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Oskar,

Looks good to me, some minor comments though:

> +
> +What:		/sys/bus/platform/drivers/aspeed-vuart/*/sirq_polarity
> +Date:		July 2019
> +Contact:	Oskar Senft <osk@google.com>
> +Description:	Configures the polarity of the serial interrupt to the
> +		host via the BMC LPC bus.

Can you mention what the value represents? 1/0 don't really indicate a
specific polarity.

Alternatively, we could use descriptive values (say, "active-low" /
"idle-low").

> @@ -310,6 +379,7 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>  	struct resource *res;
>  	u32 clk, prop;
>  	int rc;
> +	struct of_phandle_args espi_enabled_args;

Minor: can you reverse-christmas-tree this?

> @@ -402,6 +472,18 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
>  
>  	vuart->line = rc;
>  
> +	rc = of_parse_phandle_with_fixed_args(
> +		np, "espi-enabled", 2, 0, &espi_enabled_args);
> +	if (rc < 0) {
> +		dev_warn(&pdev->dev, "espi-enabled property not found\n");

In the binding spec, you've listed this property at optional, but here
we dev_warn() if its not present. Can we default to existing behaviour
if it's not there?

That may just be a matter of changing this to dev_debug.

Cheers,


Jeremy

