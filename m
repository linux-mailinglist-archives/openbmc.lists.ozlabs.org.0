Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2D986B416
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 17:04:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V0DzOmeJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlK0m542pz3cST
	for <lists+openbmc@lfdr.de>; Thu, 29 Feb 2024 03:04:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V0DzOmeJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlK0C5fcmz3bWQ
	for <openbmc@lists.ozlabs.org>; Thu, 29 Feb 2024 03:03:38 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7c7b8fb8ba6so210538439f.2
        for <openbmc@lists.ozlabs.org>; Wed, 28 Feb 2024 08:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709136211; x=1709741011; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kueQijI6nTX+4Jik/nQRXp4+7VlPPb3TOAa5X1N6XTY=;
        b=V0DzOmeJfiNea1nGt6crZh1mVamnfd5j2lsHwZNVHhaFVwfo7K1V7Z0o3myRrMbums
         PAZt5bH6lfFanN0XuYQ8CXBLWbfP3hYlzB1OYK/G1T68OdFO+vdkahSKY0w9LLw/DWjG
         e+ROQq5iQ0XkjrD+QxLCZMKBKrK175KbDr+8ZB3qYjM+/y/sVI7obi1X6tEOz2JY93Uc
         uNrcmZ3lO5LDS5k0fRzggYsTGJEOr5kG7Jfhf1eCPDCuqRZlhGBcvNXuFoknGjakd0GO
         FkMd8zbK/Wb3yznvBhDna7vnYTuBp+FadYitxTOY7bU1dc8PBLmBXolKyS39n03nM7J9
         4D+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136211; x=1709741011;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kueQijI6nTX+4Jik/nQRXp4+7VlPPb3TOAa5X1N6XTY=;
        b=u0G2z2WfpzDtyE2ZiJ1h5u1MoN+Yz7iVXBFJFWilZIU40MCF6EBgPohZOG320Ge0rK
         wI1TorpqANMUjmlpzUSC2SDy9yWMq2C1af+hhGmE5VNJq7Ng4vMevnj0Lc6KBmJM7NLt
         yvDGgSXpXkQYiF/0LQ6l2VYvT7bEs5Yp07pEzmzltXIARXZCJBXvBPBAa0w+hXboCZ7/
         MjzbRfLuvNs5ja59U1CQCygX3qnt2eYKIB3rK34EsxRuhzRh/B1Xx/tHHGr5xmyMFwia
         quy22/usgXNZTBh8rBjVUaC+qHbPdSDBlfN/rrc7IfLEgM+QdjBY7oCofqe+LWTCTlHT
         5nPA==
X-Forwarded-Encrypted: i=1; AJvYcCU16tmtPEHcAmDUHIJBlIBacaFHsv51j7/Uwh2TCn2vr1UqopJvDafirUqI6MUaSrysvzF/YHf/ogYEf9A2HwS5eonRYsAcxts=
X-Gm-Message-State: AOJu0YzoaJEig/thFl+JVFJ2o8LvzYuI56ZwJI4qyUIED/LgvRPDBQHP
	pK6kJDvW9+pPgTEyoPAgu89waU9pdiKDsypnLV3vDhO1iFcIogJc
X-Google-Smtp-Source: AGHT+IFKfUK2TIIR4A3poQO85xXFYulel2HSBDdsLvg51kUkDy90ty9hL113+D9iWAzbf4wkmfdVzQ==
X-Received: by 2002:a5e:a811:0:b0:7c7:98e2:497 with SMTP id c17-20020a5ea811000000b007c798e20497mr16020211ioa.17.1709136211343;
        Wed, 28 Feb 2024 08:03:31 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g11-20020a0566380bcb00b004743ceb332csm2313661jad.17.2024.02.28.08.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 08:03:26 -0800 (PST)
Message-ID: <24ee4bf3-aa91-483d-a9be-5c47e5c37ed7@roeck-us.net>
Date: Wed, 28 Feb 2024 08:03:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] hwmon: Driver for Nuvoton NCT7363Y
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com>
 <20240227005606.1107203-4-kcfeng0@nuvoton.com>
 <62f38808-7d5f-4466-a65e-b6a64b2e7c01@molgen.mpg.de>
 <4b06d535-6739-47b5-ad1e-0ff94322620e@roeck-us.net>
 <e2b0b8e3-9b39-4621-9e43-d7de02286a27@molgen.mpg.de>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <e2b0b8e3-9b39-4621-9e43-d7de02286a27@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, Ban Feng <baneric926@gmail.com>, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/28/24 03:03, Paul Menzel wrote:
> Dear Guenter,
> 
> 
> Am 28.02.24 um 10:03 schrieb Guenter Roeck:
>> On 2/27/24 23:57, Paul Menzel wrote:
> 
>>> Am 27.02.24 um 01:56 schrieb baneric926@gmail.com:
>>>> From: Ban Feng <kcfeng0@nuvoton.com>
>>>>
>>>> NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.
>>>
>>> Please reference the datasheet.
>>
>> Note that something like
>>
>> Datasheet: Available from Nuvoton upon request
>>
>> is quite common for hardware monitoring chips and acceptable.
> 
> Yes, it would be nice to document it though. (And finally for vendors to just make them available for download.)
> 

Nuvoton is nice enough and commonly makes datasheets available on request.
The only exception I have seen so far is where they were forced into an NDA
by a large chip and board vendor, which prevented them from publishing a
specific datasheet.

Others are much worse. Many PMIC vendors don't publish their datasheets at
all, and sometimes chips don't even officially exist (notorious for chips
intended for the automotive market). Just look at the whole discussion
around MAX31335.

Anyway, there are lots of examples in Documentation/hwmon/. I don't see
the need to add further documentation, and I specifically don't want to
make it official that "Datasheet not public" is acceptable as well.
We really don't have a choice unless we want to exclude a whole class
of chips from the kernel, but that doesn't make it better.

>>> Could you please give a high level description of the driver design?
>>
>> Can you be more specific ? I didn't have time yet to look into details,
>> but at first glance this looks like a standard hardware monitoring driver.
>> One could argue that the high level design of such drivers is described
>> in Documentation/hwmon/hwmon-kernel-api.rst.
>>
>> I don't usually ask for a additional design information for hwmon drivers
>> unless some chip interaction is unusual and needs to be explained,
>> and then I prefer to have it explained in the code. Given that, I am
>> quite curious and would like to understand what you are looking for.
> For a 10+ lines commit, in my opinion the commit message should say something about the implementation. Even it is just, as you wrote, a note, that it follows the standard design.
> 

Again, I have not looked into the submission, but usually we ask for that
to be documented in Documentation/hwmon/. I find that much better than
a soon-to-be-forgotten commit message. I don't mind something like
"The NCT7363Y is a fan controller with up to 16 independent fan input
  monitors and up to 16 independent PWM outputs. It also supports up
  to 16 GPIO pins"
or in other words a description of the chip, not the implementation.
That a driver hwmon driver uses the hardware monitoring API seems to be
obvious to me, so I don't see the value of adding it to the commit
description. I would not mind having something there, but I don't
see it as mandatory.

On the  other side, granted, that is just _my_ personal opinion.
Do we have a common guideline for what exactly should be in commit
descriptions for driver submissions ? I guess I should look that up.

Thanks,
Guenter

