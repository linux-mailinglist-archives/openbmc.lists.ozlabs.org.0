Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6A3A6525A
	for <lists+openbmc@lfdr.de>; Mon, 17 Mar 2025 15:09:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGcKr6RlJz3by8
	for <lists+openbmc@lfdr.de>; Tue, 18 Mar 2025 01:09:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742220573;
	cv=none; b=hiqvpFrdz/TKqerM67svRgXNgpMCVFT+XuDV4Ba3IvMNMoU9PqUzDvuA/GeVV9lQMT58SQjtW7A+wuFCpys3pDbWra8vFZEHFfKb1djFFKajzlmz8J1a+2JbDwXVukzzXk8Bj/OzINToFqYiGNEetvcLj6o6d4vnb+VrQEjL0f9PT90Ojjb55y+ONashzCG/t5wrsX9bTynFR5Mi6+8rJvzcQT4WWktHqZqqqRfhuj4EMrXBsYfyAN86GuSxchy5cz+d4zAE/p2l9VGyBqtRDYutmt+Uoz+25+J7PWsRSyAECyiclBf8l8xOYbb+A6niqRYfXmZt231mbdW93e7nUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742220573; c=relaxed/relaxed;
	bh=721xA3JxIplEUTUZNHGk1IO2BTumd29vEso1nVItf6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hj9mGuTSfK64UYIWRvxgL8TkrVs0/hobYwAOLM804fvNS5JT29sXZvOT6q7OFknv9zuEZUDdsWDUqoSOqyHLuhvEYX/KgNrZUs/094ppavbI6DwAeYoQG+WMqRAKb+jFzBKtsmJIX20w2b2YpMEM87GO4ZqxgOpKW9K/OX62EJzzZqANljX/3HuCLqa+kVcO9l5LCZD3q+xLfQHcJ5qc4JiGBTSz6TGNmB4/no+qS3ODSYRstRerfOzvts8jpUhOXTqPk94szcuctP6FVbwrZ4O33lZlxjfwJcy9CLY9uA25kQNLTwNDBLb7kwP/UD1ID+os9NA8jLW9IATWD7V3JQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WfzizWPt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WfzizWPt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGcKl4RS1z2yqP
	for <openbmc@lists.ozlabs.org>; Tue, 18 Mar 2025 01:09:30 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2243803b776so36744295ad.0
        for <openbmc@lists.ozlabs.org>; Mon, 17 Mar 2025 07:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742220567; x=1742825367; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=721xA3JxIplEUTUZNHGk1IO2BTumd29vEso1nVItf6s=;
        b=WfzizWPtKssUO4KoIZCGPgnkHlBpUz8aaZ08NsEQXeIgpLMLx8qUvVcW7vmnOmz3EB
         FWYuvWIDe9urlki6NUkSKyhCYSHZR1njJ0zBjusQ8ODxbnpnj9tMPPhDVyOLI5I2Q8kN
         tTkITPyqwd5nHz5IwJfyRU7goQXPkMFb8jme+34TxGSGSYrvNEWiqfkAa59d7meWiAZi
         azlmgR4die5SEXhlPZ/xD4seVO3cTBBUA6mZ9+UeIG7b8yLxISBoxE+n20bkabzU3m/x
         1/nVr+FTsUIZjoCJtlad4IDop4jAD1owuYAgOizajLfRS7sZWjloNyu5hwPA2+fFRwWw
         CaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742220567; x=1742825367;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=721xA3JxIplEUTUZNHGk1IO2BTumd29vEso1nVItf6s=;
        b=etV3+bg8i1t7uJDjmKXCeby3B16sblAUnCjxBz4YcgnkuDtH1cwfG9ylip2esm927x
         OZT8/wht2ohfrPeunxt0LOPqNdqW4IOk4BVK9QdAT2MOgMhQkjkD0srB6+UFnPx3dd2k
         lhlTEoViofBXzhyWh7sCGkYeG6xObxpFlkOA/0Q0Gu72IpAVKTsK6lkuqD1NTWB5RFJb
         j9t/JABvc63pTNcxqfsfFFQRxjbx4qXBMz2AwXggq6Znzwaz7VNCtDED9u4HAwZWNgWK
         Ud9HPwbHhAhyFsD23kv8/TBkEWft+Crs05RUEvDFO4GTDSM7jBaJNg/LThL5uj+NkRKF
         DyNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkMoOzaDoQBRQwJaXQZ7sU4J9FKLe26Vpv2ydV6dHhrRdNkSIvuAcHQLwDZIT6BdKVLQYlg3Iv@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzqZNBqjD0rLlwQS8P/YlSZv3sy95+/atSDoMr3bQicxQuD8R1u
	DKJVp6FaOIYmZvwmuNhaQMphPPPRYLaxG/M6zYKHPxM6aKIihLSN
X-Gm-Gg: ASbGncvGMb6zQX7PnKg7Lcwx0xjswktiTVjZyzcWsLNR0QmJOyvxqKu39XCSU25p4El
	MpbnzX7lVQp8w47qNhq8qQEjJJhRbRZJk2oRDNCiknk8sdCsWBfLc4+GllnhPep05fpWoSr/W1T
	iI7XzQaHypidXT5lwUx374X6DZ8nuhw52S5MWaagGW4eKpHHHjKsCP1qCIKJqJN5ry0KVoc7IZG
	g7EhWlHWlY9zkBvMG1yK9hEkoeyj4YAroNNk5Cd5PoamkkEEuIw0JRLRld72Xn88RMXIA6Hv6Ul
	3o980/FLpLlNfcRE8gPIn3yIWl3NZyEtreICFPB0UifPxssIaXWAuSSfYZQ+yslKmTmOsQkL4i3
	npEheN0VgyBunYoOHqw==
X-Google-Smtp-Source: AGHT+IHRVGXHtJYrtQYEgDvX3SMewBMrFTi7MQLb0PuZ8wSd0MF25+YpvJHTnji9WI74SxJSM6eR2w==
X-Received: by 2002:a17:902:ce0b:b0:224:b60:3ce0 with SMTP id d9443c01a7336-225e0a1d612mr163762245ad.5.1742220567415;
        Mon, 17 Mar 2025 07:09:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c688856fsm75695835ad.14.2025.03.17.07.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 07:09:26 -0700 (PDT)
Message-ID: <9a9de8bd-d864-4e29-89b2-91db8aea8ce5@roeck-us.net>
Date: Mon, 17 Mar 2025 07:09:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v28 2/3] reset: npcm: register npcm8xx clock auxiliary bus
 device
To: Tomer Maimon <tmaimon77@gmail.com>
References: <20240912191038.981105-1-tmaimon77@gmail.com>
 <20240912191038.981105-3-tmaimon77@gmail.com>
 <536f5393-478c-4a50-b25f-180e221ef7a3@roeck-us.net>
 <CAP6Zq1ioebnqgJB1B8AqD9UtMZRy5CDT8+_dXF_aBZEjjj_B-A@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAP6Zq1ioebnqgJB1B8AqD9UtMZRy5CDT8+_dXF_aBZEjjj_B-A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tomer,

On 3/17/25 03:39, Tomer Maimon wrote:
> Hi Guenter,
> 
> Yes, of course, it works in real hardware.
> The modification was made since the reset and clock share the same
> register memory region.
> 
> To enable the clock change needs to be done in the device tree as
> follows (we are planning to send these change patches soon):
> 
> diff -Naur a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> 2025-02-26 16:20:39.000000000 +0200
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
> 2025-03-17 12:29:17.876551537 +0200
> @@ -47,19 +47,16 @@
>                  interrupt-parent = <&gic>;
>                  ranges;
> 
> -               rstc: reset-controller@f0801000 {
> +               clk: rstc: reset-controller@f0801000 {
>                          compatible = "nuvoton,npcm845-reset";
> -                       reg = <0x0 0xf0801000 0x0 0x78>;
> -                       #reset-cells = <2>;
> +                       reg = <0x0 0xf0801000 0x0 0xC4>;
>                          nuvoton,sysgcr = <&gcr>;
> -               };
> -
> -               clk: clock-controller@f0801000 {
> -                       compatible = "nuvoton,npcm845-clk";
> +                       #reset-cells = <2>;
> +                       clocks = <&refclk>;
>                          #clock-cells = <1>;
> -                       reg = <0x0 0xf0801000 0x0 0x1000>;
>                  };
> 
> +
>                  apb {
>                          #address-cells = <1>;
>                          #size-cells = <1>;
> diff -Naur a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> --- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> 2025-02-26 16:20:39.000000000 +0200
> +++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
> 2025-03-17 12:24:52.293171764 +0200
> @@ -19,6 +19,13 @@
>          memory@0 {
>                  reg = <0x0 0x0 0x0 0x40000000>;
>          };
> +
> +       refclk: refclk-25mhz {
> +               compatible = "fixed-clock";
> +               clock-output-names = "ref";
> +               clock-frequency = <25000000>;
> +               #clock-cells = <0>;
> +       };
>   };
> 
>   &serial0 {
> 
> Is it better to modify the reset driver with your suggestion or change
> the device tree?
> 

My assumption was that the devicetree file is correct, and that it would match
the devicetree file in the actual devices. I since noticed that the file is
widely incomplete when comparing it with the various downstream versions,
so that was obviously wrong. Also, my change seemed odd, but then I did
not know how such situations are supposed to be handled.

Also, it looks like the devicetree file needs to be changed anyway unless something
else is wrong, because booting Linux still stalls later. Presumably that is because
the reference clock is missing in the upstream devicetree file (the serial port clock
frequency is reported as 0). Given this, fixing the devicetree files seems to be the
way to go.

Thanks,
Guenter

