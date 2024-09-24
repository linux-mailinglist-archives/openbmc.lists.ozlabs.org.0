Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A320C983C6E
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2024 07:39:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTFd6GSwz30Vp
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2024 15:39:33 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727156370;
	cv=none; b=nMtzSsLxTdG4r3mzOnTFSR+eYvhP+DACrKbDNeN0QMFLBERiiw/3/3S+mFyDXXuegb9udr48H9s74slrKZRVZqah+Y1QIhHD0LcXsh63ygOmid9ax5+xSzE1yRUDvdNya50MaDgSYnmaG5EFRye/7B20+aDYMK0hm1iAImQHjMc0aNjMNXdrzXziULWhH1VO6Pip0NG0UwtnQy+7/542MT3bvH0ac3n/niQC6YvznbdlRs9mCoK8FUQMGBmaQQsRPzg17GbYYq6UHcXs9R0Wh83lgBy7dGv7Ma5q06s7qFybqFC9iq94ZrHSsBr+XR5x3mBBOg19i1w0Iy4sAhPXvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727156370; c=relaxed/relaxed;
	bh=7qBFDR+1NB8qSnRI7FLCbTljhTD0DeN+GeIzr5GI2VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AWDfkz/48s5QgVkSHjc0BQk4mejxhrf69JloK2nMTjj+lTmXzzVHtxw5mFFO7X8q2Db+rmUN+u9oeYzdqgNPC6tMrqJu9pzrwaJS0fpw035uIaISRLKykJxOTkrB4Orpwo1SuK/xLfh8poq7ZQdtu02Bh19sybziYR93L2tBEayKWkFNW2i0OfUq01jUknWRETtbBe+old6k9ZJt+1gmBFZ8Z4eLFcL3ohdn8BssuSXj51N0AN45KZ+aDsBSVz5Bc5QL640L0tty6kuwu+5Y0LfBypG+RUOVx//URzZr3k1nzqCaua1hxAhbF9fEq2gkr0FF8NZ45s6jH+7cqqmU/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IZIWLVSq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IZIWLVSq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTFY43Pyz2xMQ
	for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2024 15:39:29 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-7db238d07b3so4221998a12.2
        for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2024 22:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727156364; x=1727761164; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7qBFDR+1NB8qSnRI7FLCbTljhTD0DeN+GeIzr5GI2VE=;
        b=IZIWLVSq61EBhiUkaa6Po8a/fKc2HA4mXHTQTnllXYKafCKvITqyezAvCBdxkm1Ocz
         foxRW/HAUWDl6Rax3SBqX1CymE1CaaYk2pIo1ck1HWj7LRk9D52beH0T+3cPrb1nJN6S
         2y8XgYWzLXBDZBWf7xEhdF9TaWhI5Vgzn6SBML7eRbJUU4h2dv2nz45kjAZ2W1r/HBo2
         XbigXbzGwUMg/hLQgUD2vM2QtKEbdjSOCESysjMU9TDpm7hsZr8Vbby16LQUZE/jQXhn
         5/k7BrgVgX9KATw5Aw5Jl5jOsxeeMfd1b28XcKmwcu4yForNhCWsZqiewmN5xsSgAYqN
         F02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727156364; x=1727761164;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qBFDR+1NB8qSnRI7FLCbTljhTD0DeN+GeIzr5GI2VE=;
        b=bb+Oreoa5OBLrTMNgopORD4UXQa9lcBzLSEh+l4OhwJDb8muk7C6l1PJ4LZ87yt4qb
         P3jSpW5XMBankvTmyKYDdktm72MRqT/jVp2zWdBicwkGrgrUI1p3bqEBqSm2wIgPJN8W
         yCdC6Sar/oB6HrJWza4i2H3Co6trC1qBf9buFxnxwansLo6eS1BsH1YEaBwi/YCRr1kX
         F9mcODOsS9/ErcsabeYdS0MfRgt5psXxifGwCvn4975cg4iIaAgeDBFkXEwYvlYqo5WG
         VLhUvCoA4XxniFekS2hw3L8ehur/FKNdyqOjvyiHzlxaV4wzq/p/owS8ubs48lRGabAw
         XO7w==
X-Forwarded-Encrypted: i=1; AJvYcCU8RJQjXkXFPNeCQ6X/9TyxmvqcjbQOpWGizpHyrBRTv+Nha1xFEnpnszhT/j43S0HcgrgIYNM3@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7FBsNfWJk6D41kPXm9/H6KJrHaUNlwopvwnt/A8fy8ftqk1Iq
	+lF1pJdXDiiAtRRoofgwIMWk5hmohSy1MVxS8gW8OkvG5vj4++Cm
X-Google-Smtp-Source: AGHT+IEmSkS54OhSLgjWXY7AiCKgAKzGqFAOf0nqG61wL/jWo5txwSti1TvxgRPBUWbQVSTSUnTb8Q==
X-Received: by 2002:a17:90a:e601:b0:2cf:def1:d1eb with SMTP id 98e67ed59e1d1-2dd80c02ae6mr17238479a91.8.1727156364059;
        Mon, 23 Sep 2024 22:39:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e05900709bsm578599a91.37.2024.09.23.22.39.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 22:39:22 -0700 (PDT)
Message-ID: <56b7aec6-bf8c-4547-bec2-e0df25489f77@roeck-us.net>
Date: Mon, 23 Sep 2024 22:39:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: trivial-devices: add onnn,adt7462
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>,
 Conor Dooley <conor@kernel.org>, Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20240923093800.892949-1-chanh@os.amperecomputing.com>
 <20240923-private-grower-af6a7c1fca09@spud>
 <c536f43a-56f8-4cbf-99a0-fe3b54a42886@amperemail.onmicrosoft.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <c536f43a-56f8-4cbf-99a0-fe3b54a42886@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Marek Vasut <marex@denx.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Phong Vo <phong@os.amperecomputing.com>, Peter Yin <peteryin.openbmc@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Noah Wang <noahwang.wang@outlook.com>, devicetree@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 9/23/24 21:17, Chanh Nguyen wrote:
> On 24/09/2024 04:23, Conor Dooley wrote:
>> On Mon, Sep 23, 2024 at 09:38:00AM +0000, Chanh Nguyen wrote:
>>> The adt7462 supports monitoring and controlling up to
>>> four PWM Fan drive outputs and eight TACH inputs measures.
>>> The adt7462 supports reading a single on chip temperature
>>> sensor and three remote temperature sensors. There are up
>>> to 13 voltage monitoring inputs.
>>>
>>> Add device tree bindings for the adt7462 device.
>>>
>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>> ---
>>> Change in v2:
>>>     - Add onnn,adt7462 to the list of trivial devices       [Guenter]
>>
>> Is this really a trivial device? If it monitors and controls fans, how
>> come those do not need to be represented in the devicetree? How is it
>> possible to tell the difference between monitoring 1 and 4 fans without
>> the extra detail?
>>
> 
> Hi Conor, Thank you for your comments!
> 
> The chip is old. The driver was added back in 2008.
> 
> Really, this is such an old chip that it would make more sense to just leave its driver alone unless there is a problem with it; this is viewpoint from Guenter.
> 
> I'm using the driver and the device tree with only the "compatible" and "reg" properties; now it's being good for me without any extra detail.
> 
> Guenter, Rob, Krzysztof, and I discussed making the decision to add this device to the list of trivial devices. You can get more information at thread https://lore.kernel.org/lkml/20240918220553.GA2216504-robh@kernel.org/T/ (Because the commit title changed between v1 and v2, it's so hard for everyone to find it. Sorry! I missed mentioning the link to pacth v1).
> 
> Guenter, who supported the driver development before, he suggested me add this device to the list of trivial devices.
> 

Historically it was ok to add an entry into trivial devices and extending
it later if/when needed. That was still widely done at least until very
recently. Maybe that changed recently. If so, sorry for bringing up the idea.
I did not envision that this might be a problem.

Can you live with no devicetree entry at all for the chip ? That is of
course less than perfect, but it seems better than trying to design a
devicetree description for the chip only to never implement it.

Thanks,
Guenter

