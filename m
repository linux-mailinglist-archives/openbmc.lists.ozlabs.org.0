Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F35C1A55A07
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 23:43:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z84Fx2tThz3fpV
	for <lists+openbmc@lfdr.de>; Fri,  7 Mar 2025 09:43:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1032"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741219258;
	cv=none; b=VLgGrt6/qYdldazrwk3IlM5pSuHlCBYEaLOkVyyeLCEI/HdtbPGZPHGnOzF6zGQLL7Ty4Cr+VqHhD+OpxMyaHKcQTjL+wZ0z32pzICi1nmK5zwJUz1Ado/U20D6t4OvZprgrQDOHEzua8vJy6Ap94WK8kAGGbGMPRakfbixuc/8axq0gT0Z/Jb9MFDS7aDZNFfoJica+P2eIR5ozIAcQLHgYfCCzwTTUnAWyJTqe7boyDTndxG7SGyS+Aa1iFb8DNMlaif4jEYZz7cKxD05kDbcXDegoIqn6xQ9GkvWj6GrmBiwNuq2k8Jass0yGCuSGDgR3fYa61e4j1YrPJ+1fUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741219258; c=relaxed/relaxed;
	bh=GhVW9oe2cjj3Hs7+7j3GMXcu7eiEDWbnxpNS4pNrjzA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aVwNK83XSyZ6+GjKkakiLhwvcXtCfw8M1fk/GnAq7gv78zReKVjYsjZyTQVe0CHaqtK1IUNrpBFDBvGmgPOPymtF+Y1VenMMABWV0hsyJe9HwY7Etsgig5g7/+snoneyndw02kcmV/6QLLHWav+DMnaqWlekitTqVPMmNw3NkmaLo9vHLo2I0jeeCoQiJ9gODH60JIWYOD6pVB7wFQi0b9l2IJdkluxjYVq2rTz9LG0KR/K51F6rtrmhogYPkb69+ShoAgttiEBHW/DDLa1k+a5klHJTiKLwyrQ/E5fBOjoC+4pe0BplU8JYy3d6ZEMw8WMSvtA/wRfGq/XLVq7Bsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zq67lUM5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zq67lUM5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7V1j5Mtwz2ymg;
	Thu,  6 Mar 2025 11:00:57 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so156039a91.2;
        Wed, 05 Mar 2025 16:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741219255; x=1741824055; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GhVW9oe2cjj3Hs7+7j3GMXcu7eiEDWbnxpNS4pNrjzA=;
        b=Zq67lUM50y63O0jy4DHs8O0TQroxSxumJqWWT3GQb9oQTEk365UnPGygNo2xvCbWk1
         ZrKmVVuLTNII8KaCcdw1+mnoAdTGeDfFQr4BgAYsOOQXsuQkbH84NlH2+k2zOkYuHI80
         ZIbshnmOP5M8tfX1NqiOz5o9zgXjSO15+wZU8pChOBA1gxwoMmJt697XrYV/KzXZhz5H
         ZOO4r9YJTIMyJ1ofFWqV4huTwTr9m+syDqLNPS4MBdLMS+uYtrsNq42go7xj6+QtM6MF
         bJljgSR0U9DBfcQnsIqdoiS8MUixvKjnKLSwfOirMSZZqZGNq8SFIqWCCPtmpZBkEJha
         HZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741219255; x=1741824055;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhVW9oe2cjj3Hs7+7j3GMXcu7eiEDWbnxpNS4pNrjzA=;
        b=vT6yZVDiMBjoM49Cw6hdWXJC5N9GfSKdn3qsVjjCpT8HPy/VssHGbqsjG4Ej9qe6L5
         GoGvyTIqmoVmZ6cm/b86VMDky4v3PY7LyFiL/llPoMYl02AmqLYFMXyorllhMYQL1Dgb
         tztF+zMyvHiQl7PT/FgQ7V1Ta9HnJsEbuegiYuO187KMPyoqiupM+SJ3arM4ZSFHJ1Ng
         C/IiC+UsSO4nFHDd6ukHHPcSIDtyxFmho/ZOWCzlXzvvRgH7ygSdqlXiOT4HXYOn7hTu
         LRlFezAGGxtAzn2t/odp1G8izRr4jSMRu3ARupBinqaw9XL6rg8jXhCip0guglTpbPuA
         +PUg==
X-Forwarded-Encrypted: i=1; AJvYcCU1EnD/c+9v82eqRc0whzcqVsEWG+pjhJKvU5wzbeTPxsUhHKwXw8AJYGfXwrhn/XTv2LoKkL2nd++IVoM=@lists.ozlabs.org, AJvYcCWSWZkXfI5hpq3dHkbFEJSI5ShSei5QJCutDcHI/U6i3U8wybg3MHu6cq0PRzOFU9U/aufJ3rVDQw==@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxTP4KWNyP/Zwyy+JRM1qVVp595RAEeOrsJTZEnca3cdYPZVtbJ
	AzYWVdk5so4H+ixtALfmXDObz80FwqnZ40nh2riP30B3r9UVdgsb
X-Gm-Gg: ASbGncvJ+NKjcTJ8EmzgdfCLe64HI59jnp03Bw5IFdoepsuYjNNh/wcmLLFTtDWm/AJ
	3qnHbb/dJoWqTOw87NqdcHGmqtm0PWddqx+awrqlZ6cX43O70yodlfpyHlMJ4Tm5ZyTeKWfZCP8
	qJJ+SDKdKRgtIX8tha7qu76rtM+R4ErkhmfpXHHQaiBEnBssqpTzgNW6OdvpZ1KoG/zB01CxKqQ
	DnOMMd46SieXQVdx2H4EoXu0POIJtA6EsUKz2hTjEGSGnB8eQGGYaALY9AYoEKq8Z5sYmnitbF7
	x5KeMNGALNEtIsG/nsL65tWy/3f4mjEIsaktFW4Adr2EElorCPLlovNRRhMo2wlu7zdQ4ezde5t
	LuarOT3C+ijL15zEyHA==
X-Google-Smtp-Source: AGHT+IG0o6NZDwL/ouuTSHVqdZU+QbHNr6bhBHpEI+HHBxP5E469uK+cbJOr5aaDszmuflfUD3yKfQ==
X-Received: by 2002:a17:90b:2750:b0:2ee:741c:e9f4 with SMTP id 98e67ed59e1d1-2ff4972ad4amr8472496a91.11.1741219252909;
        Wed, 05 Mar 2025 16:00:52 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff6935335asm30567a91.13.2025.03.05.16.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 16:00:52 -0800 (PST)
Message-ID: <5ca55233-b370-4176-9632-8e5df8d4c4ce@roeck-us.net>
Date: Wed, 5 Mar 2025 16:00:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drivers: watchdog: Add support for panic notifier
 callback
To: Andy Shevchenko <andy@kernel.org>,
 George Cherian <george.cherian@marvell.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-3-george.cherian@marvell.com>
 <Z8gohVIQqlA6QquZ@smile.fi.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z8gohVIQqlA6QquZ@smile.fi.intel.com>
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
Cc: imx@lists.linux.dev, mwalle@kernel.org, tmaimon77@gmail.com, hayashi.kunihiko@socionext.com, alexander.usyskin@intel.com, tali.perry1@gmail.com, paul@crapouillou.net, daniel@thingy.jp, patches@opensource.cirrus.com, christophe.leroy@csgroup.eu, festevam@gmail.com, kabel@kernel.org, chrome-platform@lists.linux.dev, maddy@linux.ibm.com, benjaminfair@google.com, lma@chromium.org, mpe@ellerman.id.au, openbmc@lists.ozlabs.org, krzk@kernel.org, evanbenn@chromium.org, linux-mips@vger.kernel.org, linux-watchdog@vger.kernel.org, mazziesaccount@gmail.com, s.hauer@pengutronix.de, naveen@kernel.org, npiggin@gmail.com, xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com, wim@linux-watchdog.org, bleung@chromium.org, linux-arm-kernel@lists.infradead.org, support.opensource@diasemi.com, andreas.werner@men.de, avifishman70@gmail.com, thomas.richard@bootlin.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, mhiramat@kernel.org, kernel@pengutronix.de, venture@google.com, jwerner@chromium.org, romain.perier@gmail.com, shawnguo@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/5/25 02:33, Andy Shevchenko wrote:
> On Wed, Mar 05, 2025 at 10:10:25AM +0000, George Cherian wrote:
>> Watchdog is not turned off in kernel panic situation.
>> In certain systems this might prevent the successful loading
>> of kdump kernel. The kdump kernel might hit a watchdog reset
>> while it is booting.
>>
>> To avoid such scenarios add a panic notifier call back function
>> which can stop the watchdog. This provision can be enabled by
>> passing watchdog.stop_on_panic=1 via kernel command-line parameter.
> 
> ...
> 
> First of all, do we really need a new module parameter for that? Why can't it
> be done automatically if kdump is expected?
> 

Sounds like a good idea to me.

Guenter

