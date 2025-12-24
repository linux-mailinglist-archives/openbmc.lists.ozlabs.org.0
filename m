Return-Path: <openbmc+bounces-1076-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02650CE5B3F
	for <lists+openbmc@lfdr.de>; Mon, 29 Dec 2025 02:46:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dffFZ4h89z2xrL;
	Mon, 29 Dec 2025 12:46:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766593978;
	cv=none; b=hMI4icYwmT48v74n3/hw8QRPcTo6tnDOL0PhskT45OuzCxIB3eCFLYhF83iJ2Wnk3h7DNWyahJshcd/ERJ4qHlPU7Tr1ofTVyQ8EENSbeuV7R319EQLS9aA/pELxxb4rjGgW2hNn5BvdeGjT3KfOofrJGOmYpHu/GwArc1SLyM3LheWnO1VJ8SpOKQ2pVDwD19fQKc91xyYOZuQWsYwLO7FgC2cuycYliw6Dx5YprTTwpmn8lvsQOxqEIDeGvGpUqj8aZCND6PaDGF8/t+Vjdn7KURE5kXOq9pLsanRL4QoLTBzsvsGjFsNsPfDdPz0NAc8pGAwiKQrWyTmzXVcFvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766593978; c=relaxed/relaxed;
	bh=eb1GWSMtwiCjjrRom1gCzEi9SBcGoDJFeRiB5e+S/SU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cjM7R4EY9Q6Bom5NbadszOyaFijjJvknLm0ju+liPeGF1XghjABijA5+b9R7X8g9WArOgaxbTpxR/rdkwbMDUo7dC8hDZInV5mmYcLYcqOUUFnA7BEF5uIswCcox1btlO0RYM0V+izMSxjXD+vMbMb9vjZ+/gaF2Tbfi+1xSemtWKho0ayIrUwMRNbN9VzpSYGUoWIhjSIZPEZCpRJCEBiFiPf2UpGahKOez64IqtyeKoGVlCJ6j5RT9qxEHLZhtmiYRQWwrkeJDWHhgyffMwz0EnFui3b8C4WpJko74P9/sekitO77nJpNMsBz31zDKEcc/YzEvUx2jbcpIgLKoSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=drhZpYRG; dkim-atps=neutral; spf=pass (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=prvs=4464f8a09=nicolas.ferre@microchip.com; receiver=lists.ozlabs.org) smtp.mailfrom=microchip.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=drhZpYRG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=prvs=4464f8a09=nicolas.ferre@microchip.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 123 seconds by postgrey-1.37 at boromir; Thu, 25 Dec 2025 03:32:56 AEDT
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dby943DJbz2yLg;
	Thu, 25 Dec 2025 03:32:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1766593976; x=1798129976;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=xnT+EvR0s5oIZp/3XXt4XA68h5snb9BsA7e9vL/N/vM=;
  b=drhZpYRG0jYy4s+kgDoXF7JwGzgGt/VORI1y8MdOXX3YtmcmwUjrUnuE
   2AvRPev5Po+xvTJMxEzstgqGof7FilCj/Ld0NF79Ns1KSS29UZQIJQ3M6
   nl6gx2eNik2VcW+jbsqv89OC8dVsOkD+E3Ktj7obBMv9TlqhAZdf76bya
   Bnf9vxZGIjakWLrdeN3uhjHazL/5iE+uOmoh8z1B5bC7kfYuPvjhx3O+A
   mGDiPEsyiz0Fqcm6QZTIrUhjdluAdVJM3HsnZ+DUnyuOEowuljh4mYwU/
   5BNE8ONaRRH5IjVWfRdR3jfJT8i2BdukijY9E5TWN9zWYhbvgKJojoLKr
   g==;
X-CSE-ConnectionGUID: 1mpAtqqvTWKDWP3ouM+OuA==
X-CSE-MsgGUID: bJulCPQ/SGmZ0iD/Mn03NA==
X-IronPort-AV: E=Sophos;i="6.21,174,1763449200"; 
   d="scan'208";a="51495333"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Dec 2025 09:29:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 24 Dec 2025 09:29:25 -0700
Received: from [10.171.248.28] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 24 Dec 2025 09:29:20 -0700
Message-ID: <9faff0a3-0f3d-4e51-ab5b-0cf0204ee4fd@microchip.com>
Date: Wed, 24 Dec 2025 17:29:19 +0100
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mmc: atmel-mci: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Aubin Constans
	<aubin.constans@microchip.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, Robert Richter <rric@kernel.org>, Paul Cercueil
	<paul@crapouillou.net>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Adrian
 Hunter" <adrian.hunter@intel.com>, Joel Stanley <joel@jms.id.au>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers
	<nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, <linux-mmc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mips@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <llvm@lists.linux.dev>
References: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <20251224124431.208434-5-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 24/12/2025 at 13:44, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Krzysztof, best regards,
   Nicolas

> ---
>   drivers/mmc/host/atmel-mci.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index fdf6926ea468..3b4928f5b9b2 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -629,14 +629,13 @@ static int atmci_of_init(struct atmel_mci *host)
>   {
>          struct device *dev = host->dev;
>          struct device_node *np = dev->of_node;
> -       struct device_node *cnp;
>          u32 slot_id;
>          int err;
> 
>          if (!np)
>                  return dev_err_probe(dev, -EINVAL, "device node not found\n");
> 
> -       for_each_child_of_node(np, cnp) {
> +       for_each_child_of_node_scoped(np, cnp) {
>                  if (of_property_read_u32(cnp, "reg", &slot_id)) {
>                          dev_warn(dev, "reg property is missing for %pOF\n", cnp);
>                          continue;
> @@ -645,7 +644,6 @@ static int atmci_of_init(struct atmel_mci *host)
>                  if (slot_id >= ATMCI_MAX_NR_SLOTS) {
>                          dev_warn(dev, "can't have more than %d slots\n",
>                                   ATMCI_MAX_NR_SLOTS);
> -                       of_node_put(cnp);
>                          break;
>                  }
> 
> @@ -658,10 +656,8 @@ static int atmci_of_init(struct atmel_mci *host)
>                                                "cd", GPIOD_IN, "cd-gpios");
>                  err = PTR_ERR_OR_ZERO(host->pdata[slot_id].detect_pin);
>                  if (err) {
> -                       if (err != -ENOENT) {
> -                               of_node_put(cnp);
> +                       if (err != -ENOENT)
>                                  return err;
> -                       }
>                          host->pdata[slot_id].detect_pin = NULL;
>                  }
> 
> @@ -673,10 +669,8 @@ static int atmci_of_init(struct atmel_mci *host)
>                                                "wp", GPIOD_IN, "wp-gpios");
>                  err = PTR_ERR_OR_ZERO(host->pdata[slot_id].wp_pin);
>                  if (err) {
> -                       if (err != -ENOENT) {
> -                               of_node_put(cnp);
> +                       if (err != -ENOENT)
>                                  return err;
> -                       }
>                          host->pdata[slot_id].wp_pin = NULL;
>                  }
>          }
> --
> 2.51.0
> 


