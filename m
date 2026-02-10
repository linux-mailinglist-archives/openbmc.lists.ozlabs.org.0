Return-Path: <openbmc+bounces-1350-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP5AMapWi2lIUAAAu9opvQ
	(envelope-from <openbmc+bounces-1350-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 17:02:50 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4754211CE4C
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 17:02:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9RD25lsDz2xN5;
	Wed, 11 Feb 2026 03:02:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1236"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770739362;
	cv=none; b=CCRAoo8wC/Hk6yWLqvt08EuZC88dj3ScfrQlzASQl4RIeg9EDwIrlq8xHc6ft3+H3uUlb9Nmpf8p8qo+1feBj/RsXiM8zTFnh1oeDmORww1brrreaDot8LbQPk1/nfmgZ4n6JHf0BaVDmqYDgd3EYKMWuOgEfdhAqp6A7Mp/7aNsNlFb2X5GKMqqY1Des0A1sQ3oDt7Sx3qkFLzDTvewtjK9OiIJIHLzKvfeEnRhRPfOkf+nHdKefF3MZSgF4zeuLlt7y1NJoZWJZdvOa8m/BegpGrKThyE7Ik9+/kGJtL6YpxpiBS8o1YUEXkFVNgcFJYRiXuCcCivvypy5zt/1yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770739362; c=relaxed/relaxed;
	bh=3cNNl5pPhcYluAPwoEK8QbImmnq0y2snMiJMPCDs958=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TI41/03hOfdu3rFtlkFH8U1sv1/xiGxmktG5nyIx/QknnFb3RGP98Zbf0eX7Z/PM/tTlxztZidFPdjibNcD3enRTYO92PUVQs6mChitInFj9jKqnfiZKOgUKcGxrgzTCGfMhuFIBE2s6DYml4jFfedQq0WabUnDof7YJjCRtJepGZ/3S6DjGC4VhQ88GxFzmXFhHG/M2f2QDrl3Yj1D9CclFNYirmeZZOepNBW9jyHShE54tpaimIdzYiOWFLjTQQBPL8TafHqfvPBVIpOTGmgdwDbJOO9UQbAKotv8s5DHYnde+aUfAHXxJsVAKCB0bTWnBmQgyqUfnwVkNh6EIlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AN1t1sY6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1236; helo=mail-dl1-x1236.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AN1t1sY6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1236; helo=mail-dl1-x1236.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x1236.google.com (mail-dl1-x1236.google.com [IPv6:2607:f8b0:4864:20::1236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9RD10jbdz2xKx
	for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 03:02:40 +1100 (AEDT)
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-12336c0a8b6so242931c88.1
        for <openbmc@lists.ozlabs.org>; Tue, 10 Feb 2026 08:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770739357; x=1771344157; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3cNNl5pPhcYluAPwoEK8QbImmnq0y2snMiJMPCDs958=;
        b=AN1t1sY6y3DqHsRf63pre2OcpJK8WpQ0yAo9XElQwnAUnEZFmPwINcKbsKlVlVZESs
         bKU2+0AROHKTv+4Cl7mD9AwcvzYo7CgtkR2ZyL/QKo0aH/nW4W2d1k4GKYktdYxYLxpn
         hU3vSY5Z8p8GPqmWpMHvGbT5DfkvakpgifHWurV3Oa2jHXU0o5JrkE1i90FDANIwT0T7
         Rt9gAexmt1lYN4qCtmCtgL8XHm2bcSKKf9ejOWSI4OYLiDVVU/qU/WA7OnYCqk1k0JWg
         7tq0m3SQ4LC+8MKBfPUa8N6/P1zZRMibtXKhcp6N1O/19xHYshHpp2A9u6Wc0iPRY05F
         AE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770739357; x=1771344157;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3cNNl5pPhcYluAPwoEK8QbImmnq0y2snMiJMPCDs958=;
        b=IQNkxSbkzDJ0aPeqIl5Qq+hfrUi5Qxm0C2QzloF5YSvssup9hicQ6CpuYTvxgZfRIW
         6pLLRCJ+h32ucaGtoKDiTiIef3/jRI9l2UXhxYdqYULtJvsqZYA0TT2M32tMxHxSwflM
         nyklRhAmnng51zfWWYGdmzeEvmhedKOGa+gbMHYO3sWqczh05W/MzfxjVLvnhYhWZ10A
         Yj+OVDQZHctm+L2xZSPsEkKM8KsDwi58A2sbgRTTTs1ZacMX5aHf404zl8r1HkF45ioS
         PydvF/hl1W0+EyUmRjzAQchFLvaBdBucmd7lW21TfBT/JdGNUG0saYgSQgGelXnl6YI/
         IchQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjjRPg8hNv/rmCRJOWfFukgyCmtXx8FexmYSUljrrwmpL+tccBZaEJMyqDdUM/K7N4TWCeRyFq@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxn+lQCtxRAxgcvtihA+Pc8x69XwtISG7OTa68hYuelmkcLJMZp
	MjnIRBIyJZ+oVYZaO2bevH780CXl2r7pAyxrUnXf+7oNTWPkf6p699/K
X-Gm-Gg: AZuq6aIdm/qHzOI9Okl8IbFsDKXaA15e1h81qbNkcWzjNyIJ/aHLpZi4+2WqGiiwJuv
	wJSnPHOJSh6VcFYE5zKzbwxBVBE5YkOTZ7brOv4jeCwcTUMs7PknGsQr3EvKRqJpoZmKvrYsQfo
	1JVP/J9d/SjbVusCdSxSVF+RZmPV712yjnd3Eqk7Q6/l+IuSrTFFLW/NxlyxKs9gZzl0kxPtIZt
	yXyvaLwjf9o3NMAvbb/zBit+UN+eOZaht0a9s2KaKgiyHAL1ESZAZls1CVmsOlK0Zokd2b2F5Q/
	rBSQ0mgb5SHqujVrHGiJy5NQQQTqGAtCB0nleK3zLjzTbljKuGOkjDjbeo8tmbq/XBLUEdRCMLB
	/vRVV60pmaYJrrWw2foTjsg23P0t6orGye+tVHpNqmV3+L0kk7GhX61DPMluAXiDZhrBmOlLWPY
	zgcSVTYb+x8ddcUZR/TX0bI9C3uqf5E3odj8TZ+oe1e9yKzGZktoPpdm6ESpCqk+X531n83ufW6
	a4r4rL1JSo=
X-Received: by 2002:a05:7022:301:b0:122:345:a948 with SMTP id a92af1059eb24-1270419f523mr7904093c88.46.1770739357072;
        Tue, 10 Feb 2026 08:02:37 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270433abdfsm11577096c88.12.2026.02.10.08.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 08:02:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e946baf7-4c3e-42a6-9cd2-a4b917ce09bf@roeck-us.net>
Date: Tue, 10 Feb 2026 08:02:34 -0800
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
Subject: Re: [PATCH v1 2/2] watchdog: npcm: Add reset status support
To: Tomer Maimon <tmaimon77@gmail.com>, andrew@codeconstruct.com.au,
 avifishman70@gmail.com, tali.perry1@gmail.com, wim@linux-watchdog.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: venture@google.com, yuenn@google.com, benjaminfair@google.com,
 joel@jms.id.au, openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210133843.1078463-1-tmaimon77@gmail.com>
 <20260210133843.1078463-3-tmaimon77@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260210133843.1078463-3-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.20 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tmaimon77@gmail.com,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:wim@linux-watchdog.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:joel@jms.id.au,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taliperry1@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[roeck-us.net];
	FREEMAIL_TO(0.00)[gmail.com,codeconstruct.com.au,linux-watchdog.org,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[linux@roeck-us.net,openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1350-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,dt];
	RSPAMD_EMAILBL_FAIL(0.00)[tmaimon77.gmail.com:query timed out];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4754211CE4C
X-Rspamd-Action: no action

On 2/10/26 05:38, Tomer Maimon wrote:
> Add reset status detection for NPCM watchdog driver on both NPCM7XX and
> NPCM8XX platforms. Implement GCR register integration via syscon for
> reset status detection and configurable reset type mapping via device
> tree properties.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>   drivers/watchdog/npcm_wdt.c | 110 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 110 insertions(+)
> 
> diff --git a/drivers/watchdog/npcm_wdt.c b/drivers/watchdog/npcm_wdt.c
> index e62ea054bc61..ebece5d6240a 100644
> --- a/drivers/watchdog/npcm_wdt.c
> +++ b/drivers/watchdog/npcm_wdt.c
> @@ -12,9 +12,25 @@
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
>   #include <linux/watchdog.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +
> +#define NPCM7XX_RESSR_OFFSET	0x6C
> +#define NPCM7XX_INTCR2_OFFSET	0x60
>   
>   #define NPCM_WTCR	0x1C
>   
> +#define NPCM7XX_PORST	BIT(31)
> +#define NPCM7XX_CORST	BIT(30)
> +#define NPCM7XX_WD0RST	BIT(29)
> +#define NPCM7XX_WD1RST	BIT(24)
> +#define NPCM7XX_WD2RST	BIT(23)
> +#define NPCM7XX_SWR1RST	BIT(28)
> +#define NPCM7XX_SWR2RST	BIT(27)
> +#define NPCM7XX_SWR3RST	BIT(26)
> +#define NPCM7XX_SWR4RST	BIT(25)
> +#define NPCM8XX_RST	(GENMASK(31, 23) | GENMASK(15, 12))
> +
>   #define NPCM_WTCLK	(BIT(10) | BIT(11))	/* Clock divider */
>   #define NPCM_WTE	BIT(7)			/* Enable */
>   #define NPCM_WTIE	BIT(6)			/* Enable irq */
> @@ -45,6 +61,9 @@ struct npcm_wdt {
>   	struct watchdog_device  wdd;
>   	void __iomem		*reg;
>   	struct clk		*clk;
> +	u32			card_reset;
> +	u32			ext1_reset;
> +	u32			ext2_reset;
>   };
>   
>   static inline struct npcm_wdt *to_npcm_wdt(struct watchdog_device *wdd)
> @@ -185,6 +204,95 @@ static const struct watchdog_ops npcm_wdt_ops = {
>   	.restart = npcm_wdt_restart,
>   };
>   
> +static u32 npcm_wdt_reset_type(const char *reset_type)
> +{
> +	if (!strcmp(reset_type, "porst"))
> +		return NPCM7XX_PORST;
> +	else if (!strcmp(reset_type, "corst"))
> +		return NPCM7XX_CORST;
> +	else if (!strcmp(reset_type, "wd0"))
> +		return NPCM7XX_WD0RST;
> +	else if (!strcmp(reset_type, "wd1"))
> +		return NPCM7XX_WD1RST;
> +	else if (!strcmp(reset_type, "wd2"))
> +		return NPCM7XX_WD2RST;
> +	else if (!strcmp(reset_type, "sw1"))
> +		return NPCM7XX_SWR1RST;
> +	else if (!strcmp(reset_type, "sw2"))
> +		return NPCM7XX_SWR2RST;
> +	else if (!strcmp(reset_type, "sw3"))
> +		return NPCM7XX_SWR3RST;
> +	else if (!strcmp(reset_type, "sw4"))
> +		return NPCM7XX_SWR4RST;
> +
> +	return 0;
> +}
> +
> +static void npcm_get_reset_status(struct npcm_wdt *wdt, struct device *dev)
> +{
> +	const char *card_reset_type;
> +	const char *ext1_reset_type;
> +	const char *ext2_reset_type;
> +	struct regmap *gcr_regmap;
> +	u32 rstval, ressrval;
> +	int ret;
> +
> +	gcr_regmap = syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
> +	if (IS_ERR(gcr_regmap)) {
> +		dev_warn(dev, "Failed to find gcr syscon, WD reset status not supported\n");

A warning is quite strong here, given that this is new code and the
syscon reference may not exist in existing devicetree files. notice
should be good enough.

> +		return;
> +	}
> +
> +	ret = of_property_read_string(dev->of_node,
> +				      "nuvoton,card-reset-type",
> +				      &card_reset_type);
> +	if (ret)
> +		wdt->card_reset = NPCM7XX_PORST;
> +	else
> +		wdt->card_reset = npcm_wdt_reset_type(card_reset_type);
> +
> +	ret = of_property_read_string(dev->of_node,
> +				      "nuvoton,ext1-reset-type",
> +				      &ext1_reset_type);
> +	if (ret)
> +		wdt->ext1_reset = 0;

wdt is zero-allocated, so setting those variables to 0 is not necessary.

> +	else
> +		wdt->ext1_reset = npcm_wdt_reset_type(ext1_reset_type);
> +
> +	ret = of_property_read_string(dev->of_node,
> +				      "nuvoton,ext2-reset-type",
> +				      &ext2_reset_type);
> +	if (ret)
> +		wdt->ext2_reset = 0;
> +	else
> +		wdt->ext2_reset = npcm_wdt_reset_type(ext2_reset_type);
> +
> +	regmap_read(gcr_regmap, NPCM7XX_INTCR2_OFFSET, &rstval);

This warrants an explanation/comment: Why is it not necessary to check
the return value of the regmap operations ?

> +	/* prefer the most specific SoC first */
> +	if (of_device_is_compatible(dev->of_node, "nuvoton,npcm845-wdt")) {
> +		regmap_write(gcr_regmap, NPCM7XX_INTCR2_OFFSET,
> +			     rstval & ~NPCM8XX_RST);
> +	} else if (of_device_is_compatible(dev->of_node, "nuvoton,npcm750-wdt")) {
> +		if ((rstval & NPCM7XX_PORST) == 0) {
> +			rstval = NPCM7XX_PORST;
> +			regmap_write(gcr_regmap, NPCM7XX_INTCR2_OFFSET,
> +				     rstval | NPCM7XX_PORST);

That "| NPCM7XX_PORST" is pretty pointless here since rstval was
just set to that value.

> +		} else {
> +			rstval = 0;
> +		}

Another comment needed: This negates NPCM7XX_PORST and otherwise clear
rstval. The reason is not immediately (or, rather, at all) obvious.

> +		regmap_read(gcr_regmap, NPCM7XX_RESSR_OFFSET, &ressrval);
> +		rstval |= ressrval;
> +		regmap_write(gcr_regmap, NPCM7XX_RESSR_OFFSET, ressrval);
> +	}

If the device is not compatible to either chip, retval is just passed
on and nothing is written to the chip. That warrants another comment.

[ Yes, I see that the driver does not currently support another chip.

> +
> +	if (rstval & wdt->card_reset)
> +		wdt->wdd.bootstatus |= WDIOF_CARDRESET;
> +	if (rstval & wdt->ext1_reset)
> +		wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> +	if (rstval & wdt->ext2_reset)
> +		wdt->wdd.bootstatus |= WDIOF_EXTERN2;
> +}
> +
>   static int npcm_wdt_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -208,6 +316,8 @@ static int npcm_wdt_probe(struct platform_device *pdev)
>   	if (irq < 0)
>   		return irq;
>   
> +	npcm_get_reset_status(wdt, dev);
> +
>   	wdt->wdd.info = &npcm_wdt_info;
>   	wdt->wdd.ops = &npcm_wdt_ops;
>   	wdt->wdd.min_timeout = 1;


