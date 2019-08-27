Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7789DA5B
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 02:08:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HTk75ldRzDqlg
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 10:08:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RX9x+6Dt"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HTjY4VrWzDqjV;
 Tue, 27 Aug 2019 10:08:16 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id g2so12878262pfq.0;
 Mon, 26 Aug 2019 17:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=op+KI7TlBsB6S6sFewOJ0t706uisxtkweddZPva/XUs=;
 b=RX9x+6DtGafaHO1iuCX95LpTQasZh6Epfv1c1WbVTDYTdGMgc1MTuuAunpoIXNNQhd
 dyvTNYlk5n1nkTqY721ASC09AaF3Jd2PeyOINmfcUce/x/U0YrVO2OGxhy1eJkkIdVcy
 TrypAKXyYIZgYBYIgWvMufNafmydykIbS4ktkSRekVFf1BscbukfP/gaj1ctYHrHIdI/
 W2Mu0iyEX6/umnjyUCn9Ad/wL0b0RAXM5UjjCAMWeg1lV/NxmqX4SSqS6TOZJnhVTtps
 aBxZY57njSC06peMlK8cO24ROLSbspHwy4OMMx2ogZIgS5YEKWUSUpoc/lhDEs5fUsfy
 oF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=op+KI7TlBsB6S6sFewOJ0t706uisxtkweddZPva/XUs=;
 b=Koq+hZYmXTJ3VblHj7AiB4NYxXtWcL39vxQvLy6tWD1tMHGcAeQNxYKT2vFiwJyoKt
 reOduHO1bZ2mID9HFVanWBTHejkyDsDfPu8hEdhMH9xVft9CvCchqfPHBkrYAZTJu1MG
 fw98ifw4wyphTbMJqubwNffM2T8GBwQHc37Ek29HFJ6mujaj+wY/fetSeOueKXg2U2e6
 x2AC7SwV6BTc0+nJC1ExYQP6gpfQDLcm7vQsUhnR3JVO6wB7c2+FbZ1UYz7hjsON0DBQ
 8WEEd8au/uATskZYRdyuv/BLDdnXDbtP8XsvZnk3SPVgduFQGAekcXelKWFAo9L0M0Kh
 8eiA==
X-Gm-Message-State: APjAAAUgC4LPgbUsSAPnBzxb/O5PfCblIDjlwAt0NJG5cNFvl8owkwsN
 ACcGXa4/AfyVsqVsS4eFJj8=
X-Google-Smtp-Source: APXvYqyCOpJkfY8Cd0SdDE6aYRxO1Pg9WhbY61Aef8FokG+LaTjhPfxqLF8Bp0gzFOPMpKEYS54c7Q==
X-Received: by 2002:a62:7789:: with SMTP id s131mr23022125pfc.50.1566864493131; 
 Mon, 26 Aug 2019 17:08:13 -0700 (PDT)
Received: from server.roeck-us.net
 (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
 by smtp.gmail.com with ESMTPSA id b126sm17923109pfb.110.2019.08.26.17.08.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Aug 2019 17:08:12 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] dt-bindings/watchdog: Add access_cs0 option for
 alt-boot
To: Andrew Jeffery <andrew@aj.id.au>, Ivan Mikhaylov <i.mikhaylov@yadro.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>
References: <20190826104636.19324-1-i.mikhaylov@yadro.com>
 <20190826104636.19324-5-i.mikhaylov@yadro.com>
 <f33aa4b8-6d06-4226-8859-ce21a4b8728b@www.fastmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <d040fee1-d12d-9ac9-a72a-e76137a4579f@roeck-us.net>
Date: Mon, 26 Aug 2019 17:08:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f33aa4b8-6d06-4226-8859-ce21a4b8728b@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Alexander Amelkin <a.amelkin@yadro.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/26/19 4:57 PM, Andrew Jeffery wrote:
> 
> 
> On Mon, 26 Aug 2019, at 20:17, Ivan Mikhaylov wrote:
>> The option for the ast2400/2500 to get access to CS0 at runtime.
>>
>> Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
>> ---
>>   Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> index c5077a1f5cb3..023a9b578df6 100644
>> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
>> @@ -34,6 +34,13 @@ Optional properties:
>>                   engine is responsible for this.
>>   
>>    - aspeed,alt-boot:    If property is present then boot from alternate
>> block.
>> +                       At alternate side 'access_cs0' sysfs file
>> provides:
> 
> Why are we talking about sysfs in the devicetree binding? This patch
> doesn't seem right to me.
> 

Correct; this is the wrong document. The attribute also will need
to be better explained. "At alternate side" does not explain (at
least not at all clearly enough) that the attribute only exists
if the system has booted from the alternate flash / block.

> Also if we're not supporting the aspeed,alt-boot property we should
> probably document it as deprecated rather than making it disappear,
> unless you're going to fix the systems that are using it.
> 
Sorry, you lost me here. Where is it made to disappear ?

Guenter
