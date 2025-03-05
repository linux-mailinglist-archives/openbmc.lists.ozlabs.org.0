Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 165D8A55A03
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 23:43:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z84Fq68v2z3fKh
	for <lists+openbmc@lfdr.de>; Fri,  7 Mar 2025 09:43:27 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741219130;
	cv=none; b=Ez1K7atFmjiOylEVc/yR+UceFmxkamCoYF4BUqRTxov0FGOAFtp61HtBF8er2k/6m/HhksaydY1M8H7i7L+URHw3PJ8EbMWKzNlwOjGCuhhlLWCl5kcTNGOnA48Pc7Cq2uuuZHXMTzaNW+vxYqK+q5J3eRVAYquMKQxQzEelWFvoQ9AWV4pN4vqFGD4MCXULn6VLTg4VGim1jHEN4h2pmsfST2ZRPjhwEvnZtC/TfboAmRAZVJBZPwxLBu5bK4eYuuP1WKu1xQsG5+vD1kucEttA3mxWAFy0iG/iLM7jexjvs9QKjR6vy8/g3JD3GhSRIsK+nCYmVSu5cpuI+Xk/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741219130; c=relaxed/relaxed;
	bh=2C3t9OHZV16KbvS+eOTMIJqI95FVIw2G7lcCbFYFJZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hx94ayW+nmbTLsVeL2QL9jXA03aIQmAxXUGOkJn8hDPFEJrxO1ljegP/9YYQR4fEk5DqeW3Ba+UdfIRFiJYpFc1QlJ5+Tl1PAvzPcU0uMfoDhNnR281Q3dCWktbLi4NlyVhnI5repV7sJ0E2Lo7g6uvsYifyrP8f6zSzfGU8d7wNhZUYb243RdunPmAyzdMF1dHeh8lFsZxZL21xJnZ4n9KOVP0I4NPkNMsMfql3Ss6oK3q5Sv1roJtkFsW98/JOdkz10KUt8E0gYdchoMhU8QMydmpuvcRFDkm8zQHjuzcZxdD7WeDJjl9LD0hjriN0hokT1GxOQdU+hMbtEXTDrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T1Kv/lj8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T1Kv/lj8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7TzD6LPpz2yVb;
	Thu,  6 Mar 2025 10:58:47 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-223a7065ff8so842585ad.0;
        Wed, 05 Mar 2025 15:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741219126; x=1741823926; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2C3t9OHZV16KbvS+eOTMIJqI95FVIw2G7lcCbFYFJZs=;
        b=T1Kv/lj8Y8vzOytnbOVCXfB/tADDs4pr4iTiO6k77fL3oWRfD08BZd6nAenffgNtxg
         tp3euy/aAXkyPug4m3SkxSlBkyrY0iZpudXzsBxnHnQrr3RhDzzUlqE2rqfKDTUEq1HS
         +r1krweCNC7+DwcIctySEIJBL+31JbRiVh4SMREvuVsu2qf5JUvn9isB6UdCYFykgbNn
         57vxKyo0mKfVadm6RlfOzKZ7o3yytBp7vh33DEoJHYWhY7Ej2+uLA4+J35YXxg/zWf8+
         pOD4veyGXJIjqZTBEkCVxyoti7fqss5Ai00qQbAHW8lbMpSEOp9QvuOWNlI7ZwTQXXQU
         TvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741219126; x=1741823926;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2C3t9OHZV16KbvS+eOTMIJqI95FVIw2G7lcCbFYFJZs=;
        b=b6X3EHveSv6sVAWAq02uas/9x52uKK24jl1m+DKCKPPrHeH6uxqEu8iFLTD2+/ixWS
         +Z2NtI30TP/UXYHY0jx1ANRhDprFdnde0nj5nWIRuIlUQsD98KSangusZ/jdWDylO/JI
         lytlDvRvKyREqcsF2B9q8HkPNkZS9unuj8m3otGpQ/m+eLhG47RRB6Zj2qgs8uOhuLoa
         ul6zSHvWUTvuSeFIshs9WtRaNCVPRZb4qFu7C8yrDzQh4WCLmAzKMdOyduTRJpbBsHF4
         AS6n+eX14lTSX1LU0RyLVurncAv2zJXwyelVUIEjUXdRoQPRYf8IUDp1eczVMajrmi2v
         cIzg==
X-Forwarded-Encrypted: i=1; AJvYcCVorTUXrpc4i011CKM27lvac+yzpMFO/6wjLIdXWVhno9N8UkxxwMJrFoJjgYLTzeB4SeDWiZZjo75+0jo=@lists.ozlabs.org, AJvYcCW5IZlL6qC+3Sp6YEDfLH99qWzZkJpfAS/6vpW6ux+Yz5rZHEUpTw55REuykzhmjRsGbJAYaZbqjw==@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw25SzoYlqjw2hGzbkq+2k4/NuGWq9DXWCXo93COZnrTK1Yj3Ra
	NIrqtXDWXIvM1cR8E1Cv7BvJ+vt9CtTPDUGuxw9J2mCjuvLn3yIx
X-Gm-Gg: ASbGncuzBGLWg3adyqmrJzHLrIUqlbAIxciiDZKll1QEvmA7qhcZ/a2ntFFP8FX4/L1
	akFs9s2VlSixEBW23ZP/ORStcUYyjSoyWF8PJnl59UjcfMvqhgeTfW/EbIH687rUt7P2r3twhde
	31jqLWHtxXX3Mj9wILHnGmqgvafQfG0uqq8bHcMOC+U/Ejj1cq9nvo0Fdv9foYSIFs52UvxgHzn
	an09YvE3OBvrrmdBQCqXViJm1fKBbNRrXxHduokBbJafPFSY56Rr0/m+kTfckCw5vblG8zehORh
	nrqGRiVXTojdM9vG7jCKxhMYYlhcCmzC9IAaTR0g3ImL9vtiT/+WoLiFnTpklYL7/HduKr/l7BI
	L6neZjjATwYVZ6CRwBw==
X-Google-Smtp-Source: AGHT+IFfm7H7nJs7aTJzjddZ42tdexmQKPWdcSPX9vN1nE9dL8KTlJ94ovJcHC3Iz8/npiXYs/Z0Pg==
X-Received: by 2002:a05:6a00:2d8a:b0:736:546c:eb69 with SMTP id d2e1a72fcca58-73682b85400mr7181751b3a.9.1741219125493;
        Wed, 05 Mar 2025 15:58:45 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736984f8666sm20220b3a.113.2025.03.05.15.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 15:58:44 -0800 (PST)
Message-ID: <28a711e5-b2cb-4d5f-bb78-259a01cd4bcc@roeck-us.net>
Date: Wed, 5 Mar 2025 15:58:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 George Cherian <gcherian@marvell.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
 <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
 <PH8PR18MB538122CE6706872B8A836A94C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
 <7ac2b8db-22c7-4168-b1b7-4f9f0ab10531@pengutronix.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <7ac2b8db-22c7-4168-b1b7-4f9f0ab10531@pengutronix.de>
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>, "mwalle@kernel.org" <mwalle@kernel.org>, "tmaimon77@gmail.com" <tmaimon77@gmail.com>, "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>, "alexander.usyskin@intel.com" <alexander.usyskin@intel.com>, "tali.perry1@gmail.com" <tali.perry1@gmail.com>, "paul@crapouillou.net" <paul@crapouillou.net>, "daniel@thingy.jp" <daniel@thingy.jp>, "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>, "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>, "festevam@gmail.com" <festevam@gmail.com>, =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>, "maddy@linux.ibm.com" <maddy@linux.ibm.com>, "benjaminfair@google.com" <benjaminfair@google.com>, "lma@chromium.org" <lma@chromium.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "krzk@kernel.org" <krzk@kernel.org>, "evanbenn@chromium.org" <evanbenn@chromium.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "naveen@kernel.org" <naveen@kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "xingyu.wu@starfivetech.com" <xingyu.wu@starfivetech.com>, "ziv.xu@starfivetech.com" <ziv.xu@starfivetech.com>, "wim@linux-watchdog.org" <wim@linux-watchdog.org>, "bleung@chromium.org" <bleung@chromium.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "andy@kernel.org" <andy@kernel.org>, "support.opensource@diasemi.com" <support.opensource@diasemi.com>, "andreas.werner@men.de" <andreas.werner@men.de>, "avifishman70@gmail.com" <avifishman70@gmail.com>, "thomas.richard@bootlin.com" <thomas.richard@bootlin.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mhiramat@kernel.org" <mhiramat@kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "venture@google.com" <venture@google.com>, "jwerner@chromium.org" <jwerner@chromium.org>, "romain.perier@gmail.com" <romain.perier@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/5/25 03:01, Ahmad Fatoum wrote:
> Hi George,
> Hi Guenter,
> 
> On 05.03.25 11:34, George Cherian wrote:
>>> why is armada_37xx_wdt also here?
>>> The stop function in that driver may not sleep.
>> Marek,
>>
>> Thanks for reviewing.
>> Since the stop function has a regmap_write(), I thought it might sleep.
>> Now that you pointed it out, I assume that it is an MMIO based regmap being used for armada.
>> I will update the same in the next version
> 
> Failure to add WDIOF_STOP_MAYSLEEP when it's needed can lead to
> kernel hanging. Failure to add an alternative WDIOF_STOP_ATOMIC
> would lead to the kernel option being a no-op.
> 
> I think a no-op stop_on_panic (or reset_on_panic) is a saner default.
> 

Agreed. Also, I like WDIOF_STOP_ATOMIC more than the WDIOF_STOP_NOSLEEP
I had suggested in my other response.

Thanks,
Guenter

