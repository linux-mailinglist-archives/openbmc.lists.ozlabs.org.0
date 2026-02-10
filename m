Return-Path: <openbmc+bounces-1351-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MPDKD9NYi2ljUAAAu9opvQ
	(envelope-from <openbmc+bounces-1351-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 17:12:03 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4136311CF4F
	for <lists+openbmc@lfdr.de>; Tue, 10 Feb 2026 17:12:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9RQk6w43z2xN5;
	Wed, 11 Feb 2026 03:11:58 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770739918;
	cv=none; b=JOaimu6BzUcXNG4KS2JAQOs6pqzoYHiQfmqHCBIOW0KowpYnkYxJ2PnfwtcW3e86BI4PoZh5zO64oBQXuVVdFuNREv1gOOoMgtet6mk+Wk9IKfV0MxfAJKw7RqW0FIcTc2O07gN2DvHtkzBmD+EwgCkgxrExRoAZORCICQXqrK3Du03PWSJ9iai7a6fCyeQCIjEdqZ5CsFZp9fddRg0t2VyNBm6MLRa7mBj8UTBHKAZ9fEItBRA/OxAQfVQWx5h0BN+TTiRAJpP14BIBtmT3PnHpA3T0RiUKLbzse7EHJ2E71ynDgX/uduVLHrbWOx1k4ifSHX40fJt+mF454I35sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770739918; c=relaxed/relaxed;
	bh=Z43x0Gy0xlGkGR/Qx4ifm0o+JOhDbJh1Tv3iDNAYfZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+Vhefqdzuz7cSsXwa9pHGl4fKXUOh9EKiuaJgTunATIfGFyG4LndFjprb9Ev+fU+9MFrPGFTWqz1M6WmBLsCUfOs/xCPurJMH7ygXVzubN+/rE7rBCkZaZnBK2GcNHWXCBXDPlCXZ2wr3kRP8WtqHuLM8gB++26zfujMpbAPZcw4DjsM6fyCko307sJ9ctCcfqpXplaf7CduR+E1xGMD2Mba4qsX3wcIn3I8OXuYUrDOsRb3BPcxCzc3bxtuJaOlIQ8t2Lz6ew8+ecGaNxdiM5LiqQ+J6lpxcp5RQFg/t6z+1WT6rUcogNY3RcFYto57oFB8f2no+7onp4w5+WUeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XfeT/V11; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XfeT/V11;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9RQj73r9z2xKx
	for <openbmc@lists.ozlabs.org>; Wed, 11 Feb 2026 03:11:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B27F43955;
	Tue, 10 Feb 2026 16:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CCD9C116C6;
	Tue, 10 Feb 2026 16:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770739915;
	bh=hv8MdTxOARYgBArz8CFu0FgtRleZmIW+avTLP5qtEBc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XfeT/V11i6qk9/PeHPt1BcMS6C6fmDNbJliWA+IJPLT8kmyFU9tld3TljsafPmc4O
	 nmcqSxi5plExE42VRcTCvrhJe68QSj54VSY3BVbWYU/jMf0sQ5M9cZl7QLTu4LsNwJ
	 S6K7LxUwH9a3etcF363PJ9B3WX64+38C20rNLdgKJqdkcqY6hNCEW8XP+e1uUGlwdV
	 DDrzapJQZQ4Fil7Z33/iLf1naVel8CSAwn+bCHw78tmnmxnf7p/ST3ypF61x6TViDh
	 1swmsLHkr9OoWnKOje5dqc12Iib4WjR/rOEN9Hrr4s0GpC5BGpzqHxHt0sXH1+6rFf
	 eTOf9Qbh4Whgw==
Message-ID: <b746dd7d-550c-4877-9210-754ae278e1a2@kernel.org>
Date: Tue, 10 Feb 2026 17:11:49 +0100
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
Subject: Re: [PATCH v1 1/2] dt-bindings: watchdog: Add NPCM reset status
 support
To: Tomer Maimon <tmaimon77@gmail.com>, andrew@codeconstruct.com.au,
 avifishman70@gmail.com, tali.perry1@gmail.com, wim@linux-watchdog.org,
 linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: venture@google.com, yuenn@google.com, benjaminfair@google.com,
 joel@jms.id.au, openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260210133843.1078463-1-tmaimon77@gmail.com>
 <20260210133843.1078463-2-tmaimon77@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260210133843.1078463-2-tmaimon77@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tmaimon77@gmail.com,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tali.perry1@gmail.com,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:joel@jms.id.au,m:openbmc@lists.ozlabs.org,m:linux-watchdog@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:taliperry1@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,codeconstruct.com.au,linux-watchdog.org,roeck-us.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER(0.00)[krzk@kernel.org,openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1351-lists,openbmc=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4136311CF4F
X-Rspamd-Action: no action

On 10/02/2026 14:38, Tomer Maimon wrote:
> Add reset status detection for NPCM7XX and NPCM8XX platforms via syscon
> integration. Document syscon property and three configurable reset type
> properties (nuvoton,card-reset-type, nuvoton,ext1-reset-type,
> nuvoton,ext2-reset-type)that map reset signal detection to specific
> reset bit positions.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../watchdog/nuvoton,npcm750-wdt.yaml         | 51 ++++++++++++++++++-
>  1 file changed, 49 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> index 7aa30f5b5c49..054cc0115af2 100644
> --- a/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/nuvoton,npcm750-wdt.yaml
> @@ -12,7 +12,7 @@ maintainers:
>  description:
>    Nuvoton NPCM timer module provides five 24-bit timer counters, and a watchdog.
>    The watchdog supports a pre-timeout interrupt that fires 10ms before the
> -  expiry.
> +  expiry and reset status detection via syscon integration.
>  
>  allOf:
>    - $ref: watchdog.yaml#
> @@ -40,12 +40,55 @@ properties:
>    clock-frequency:
>      description: Frequency in Hz of the clock that drives the NPCM timer.
>  
> +  syscon:

First iteration. See "How to Get Your DT Schema Bindings Accepted in
Less Than 10 Iterations"

or just read the docs please.

> +    description: phandle to the Global Control Register (GCR) syscon node.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  nuvoton,card-reset-type:
> +    description: Reset type for external card reset signal detection.
> +    enum:
> +      - porst
> +      - corst
> +      - wd0
> +      - wd1
> +      - wd2
> +      - sw1
> +      - sw2
> +      - sw3
> +      - sw4

You want it to be static configuration, so cannot be changed runtime? Why?

> +
> +  nuvoton,ext1-reset-type:
> +    description: Reset type for external reset signal 1 detection.
> +    enum:
> +      - porst
> +      - corst
> +      - wd0
> +      - wd1
> +      - wd2
> +      - sw1
> +      - sw2
> +      - sw3
> +      - sw4
> +
> +  nuvoton,ext2-reset-type:
> +    description: Reset type for external reset signal 2 detection.
> +    enum:
> +      - porst
> +      - corst
> +      - wd0
> +      - wd1
> +      - wd2
> +      - sw1
> +      - sw2
> +      - sw3
> +      - sw4
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>  
> -unevaluatedProperties: false
> +additionalProperties: false

Why? Nothing explains this in the commit msg.


>  
>  examples:
>    - |
> @@ -57,4 +100,8 @@ examples:
>          interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
>          reg = <0xf000801c 0x4>;
>          clocks = <&clk NPCM7XX_CLK_TIMER>;
> +        syscon = <&gcr>;
> +        nuvoton,card-reset-type = "porst";
> +        nuvoton,ext1-reset-type = "wd0";
> +        nuvoton,ext2-reset-type = "wd2";
>      };


Best regards,
Krzysztof

