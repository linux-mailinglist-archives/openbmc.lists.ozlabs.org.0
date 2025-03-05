Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3579DA55A02
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 23:43:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z84Fk3R40z3d3W
	for <lists+openbmc@lfdr.de>; Fri,  7 Mar 2025 09:43:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741215844;
	cv=none; b=QUDwQmtdWsXI5//AAbCut3Z/WLj8jTyAF6Orh8agjPRCZYbEq26wpKp6BqvSH1Qx1I3mBj/K96/IxK6xW6SSC7VKW0I7XB1BSayvGeSgmtZvr1PwNmQQqKdJnp+wbQlLne0R4ZQpgAqfykoEckjdglKaMUrWJCDjqXZsnSvQ/rQDb0nirT1yQ0O9PqaTmO/oCjs+x46lBJ2hAXbDrF+5put7X5UthRg9+Nj8jPcG2y6ht84MY+qnvINxvLvFnYzZ4aWJXoyx/PNjadoY5wtNpoHo+Z7yr8PuvXGmwNq1Kusb5HbLpuL8N3ZL/leV7Lna20oKBlDQ/XZZYEn/bGT2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741215844; c=relaxed/relaxed;
	bh=Z790mvGquNClk9am635QsUgs00BtBeIllezzp9bIdnk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBl7DgRb+T1xz6OjbJtueWoA7uFTNA/JmWYakBwHqUDEJpzBnTewJaZ9mk5F1Znutw7voPBMYKsOAN9HxHoBUqzKJG2gnrpS9qkyZWr3ADnfIEjmfQWqayYRs/0tnIdoAjsUdX8sjKwrGcl5KzIAJeRXXQ2YoBNGYTgBBGm655xl+LEDW3iJ+m4Nz2xnfUxZ1XgZpy2HRyp/EF2j+JDOjsDHvgjo8kGRdPtO9G/GWvJMVaHLhdP4Ac8LSseHbRiuHS5c8zI1IJuZIBTMY5WZEpDUE3QxIYLFnENZlKWNuWIpWFKmRM4953EvkBVAn22rSm1fQLhrlHz52nznbG0JQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b3dzNx0b; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b3dzNx0b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7Sm26H0fz2xKN;
	Thu,  6 Mar 2025 10:04:02 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2234e5347e2so3445ad.1;
        Wed, 05 Mar 2025 15:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741215841; x=1741820641; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Z790mvGquNClk9am635QsUgs00BtBeIllezzp9bIdnk=;
        b=b3dzNx0bJgFeHjTDI8IKFXMYDn8mY1Ed5VxMg4U6864lIe4BQzWKI5bOGWxD4p/yab
         sXTEYhn8hliLutZe+bJSYK0xjmY/BvtTo+V8R5c0POr8T/+6kklam30nKEMgCKDqysrl
         ReXXuzObe0ooSRstuiCEkTvwgn1PeZUUu/DNDHI+11KtnEDPA0pimxTWs3uMhxV5ziW3
         BMrmCrjDIEUSnM0uCXV+V1VfAt/f+xqFpFruMrxoRA7BKhFV+MZr4ERBu2xSJmUX60z6
         StrHjLmxFsehxyyXA6H4RmbIa7mFA9JWN/qoktwpfIVPzAkHVUHFq1vDpZcTGoJ3EEym
         nOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741215841; x=1741820641;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z790mvGquNClk9am635QsUgs00BtBeIllezzp9bIdnk=;
        b=kkASa/kksF2RY7H09BQx6DiCNkvQmHcfjMRBIjHmLCAMcFrDHLK4GMaLcveH0aGvJN
         1vv2d0vpwWc0dyrpb3wNy0JVk91ZX9NbL4a1jv4NZPJOJICzTHU/qOxi0i7p6NF8o2Py
         vDZ0eqOfQMSb0alMhcASczEkFIxdUKVZqxDvywW38vqX/1szJfeoFBk/90Q7Q38l54si
         u9Jj8hXiQUMUWmz5mqVLKMaMKpC6FyRYceKHH3Mi9coaaNaL3t/yRohe7qZiChRbursB
         hRDGMWjG89PLdHhQBaydr+l1CAlOt4LKK6HSYv8x2/mhFeY6PGZfGqsHH+JFAf6Rwiu0
         d26Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUt91FTtAMuzRYKGhzbS/lLGkb7tM13FE2x8p95uMPRMmw+9u9m4qgDiijHim6xJpiaDzj9HQ61MKJUlA=@lists.ozlabs.org, AJvYcCXwMXr7Ejcfdrkd48eC9N/X9ikKRKvNzWAgafSvS1Qb72OrkZPiI676oZu1AyC5bLb+zHBgjCOQCg==@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywhegys9DBX1Gvw4menZIh2hNHlDrxVloFQz0i+/kofFUNjxkSh
	bDEEM4AQDIu0iuI/b3RZQyhFm5LNlKwKjc1iP7m0yC6hH1ugm4pA
X-Gm-Gg: ASbGnctKAizU7duUugPaYnfSycpjKWPe5eJHCSdqjHTXF9gSGmDOpO4uBLkihzq/67w
	EeWDhIpsfGeH8nCXLSOL5ciI1qBAx3sj558jaIPCbidKVYWuCla3A5wp5P3nFBnIWuQ3l6W1L6T
	OrzXnvjinUuSIKs+fsyU0WfB7GW7IXk7HuGSuRHcRtU2Mc4fPoI5UheOglvIq/TAEEnb5KBxixP
	O8ciaJJ8SBN8sdzMJR6jV4LEX7BwEOgHb8t2BvZBMur0obSK41ocJeV6sVoVEVqxg0h3k/3K2xV
	9e585M0y9jMuhskTKru3ObQy8YwJLErVQYGLp1sOSycYjdrOCwtKNLqZm/gdqGP5k4NumYTD26W
	Ky6bOokFUfGKoHicclA==
X-Google-Smtp-Source: AGHT+IGJ8wMSqYZlSJ4sp1Cb8aQxAnqhxcIrS7MZKZh23f2DOaW2c7kOg1mKVHzfXB47vtWWZXhcIQ==
X-Received: by 2002:a05:6a00:1397:b0:732:5164:3cc with SMTP id d2e1a72fcca58-73682c8bebamr6106502b3a.19.1741215840704;
        Wed, 05 Mar 2025 15:04:00 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7364b4eff66sm7432847b3a.83.2025.03.05.15.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 15:04:00 -0800 (PST)
Message-ID: <35c97316-1e40-45ed-93b0-7e4f7dbce56d@roeck-us.net>
Date: Wed, 5 Mar 2025 15:03:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
To: George Cherian <george.cherian@marvell.com>, wim@linux-watchdog.org,
 jwerner@chromium.org, evanbenn@chromium.org, kabel@kernel.org,
 krzk@kernel.org, mazziesaccount@gmail.com, thomas.richard@bootlin.com,
 lma@chromium.org, bleung@chromium.org, support.opensource@diasemi.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, andy@kernel.org, paul@crapouillou.net,
 alexander.usyskin@intel.com, andreas.werner@men.de, daniel@thingy.jp,
 romain.perier@gmail.com, avifishman70@gmail.com, tmaimon77@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 mwalle@kernel.org, xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com,
 hayashi.kunihiko@socionext.com, mhiramat@kernel.org
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Fri, 07 Mar 2025 09:43:18 +1100
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
Cc: chrome-platform@lists.linux.dev, linux-watchdog@vger.kernel.org, imx@lists.linux.dev, patches@opensource.cirrus.com, openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/5/25 02:10, George Cherian wrote:
> A new option flag is added to watchdog_info. This helps the watchdog
> core to check whether stop functions would sleep or not.
> The option flags of individual drivers are also updated accordingly.
> 
> Signed-off-by: George Cherian <george.cherian@marvell.com>
> ---
>   drivers/watchdog/advantech_ec_wdt.c | 3 ++-
>   drivers/watchdog/arm_smc_wdt.c      | 3 ++-
>   drivers/watchdog/armada_37xx_wdt.c  | 2 +-


... and many more. Sorry, I didn't expect that this would touch
that many drivers. My bad.

Let's do the opposite instead: Introduce WDIOF_STOP_NOSLEEP,
and let drivers opt in instead of opting out.

I still have to look into the other feedback. I think someone
suggested to introduce a callback instead, which would stop the
watchdog at runtime if needed (especially during kdump).
That may be a better solution than having a module parameter.

Either case, please separate driver patches from the patches
introducing the new flag. Since the flag is opt-in, that should
be ok - drivers supporting it can be modified over time.

Thanks,
Guenter

