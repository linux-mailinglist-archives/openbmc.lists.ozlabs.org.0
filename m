Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A32086B4CD
	for <lists+openbmc@lfdr.de>; Wed, 28 Feb 2024 17:26:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlKVZ5Bs8z3f0P
	for <lists+openbmc@lfdr.de>; Thu, 29 Feb 2024 03:26:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx3.molgen.mpg.de; envelope-from=pmenzel@molgen.mpg.de; receiver=lists.ozlabs.org)
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlKVF1mjwz3byT
	for <openbmc@lists.ozlabs.org>; Thu, 29 Feb 2024 03:26:12 +1100 (AEDT)
Received: from [192.168.0.53] (ip5f5aedb1.dynamic.kabel-deutschland.de [95.90.237.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id F2C2D61E5FE04;
	Wed, 28 Feb 2024 17:25:44 +0100 (CET)
Message-ID: <35dcecdd-ee19-40d6-80ab-5eed9718e639@molgen.mpg.de>
Date: Wed, 28 Feb 2024 17:25:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Commit messages (was: [PATCH v4 3/3] hwmon: Driver for Nuvoton
 NCT7363Y)
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com>
 <20240227005606.1107203-4-kcfeng0@nuvoton.com>
 <62f38808-7d5f-4466-a65e-b6a64b2e7c01@molgen.mpg.de>
 <4b06d535-6739-47b5-ad1e-0ff94322620e@roeck-us.net>
 <e2b0b8e3-9b39-4621-9e43-d7de02286a27@molgen.mpg.de>
 <24ee4bf3-aa91-483d-a9be-5c47e5c37ed7@roeck-us.net>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <24ee4bf3-aa91-483d-a9be-5c47e5c37ed7@roeck-us.net>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, Ban Feng <baneric926@gmail.com>, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Guenter,


Thank you for your reply.

Am 28.02.24 um 17:03 schrieb Guenter Roeck:
> On 2/28/24 03:03, Paul Menzel wrote:

>> Am 28.02.24 um 10:03 schrieb Guenter Roeck:
>>> On 2/27/24 23:57, Paul Menzel wrote:
>>
>>>> Am 27.02.24 um 01:56 schrieb baneric926@gmail.com:
>>>>> From: Ban Feng <kcfeng0@nuvoton.com>
>>>>>
>>>>> NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.
>>>>
>>>> Please reference the datasheet.
>>>
>>> Note that something like
>>>
>>> Datasheet: Available from Nuvoton upon request
>>>
>>> is quite common for hardware monitoring chips and acceptable.
>>
>> Yes, it would be nice to document it though. (And finally for vendors 
>> to just make them available for download.)
> 
> Nuvoton is nice enough and commonly makes datasheets available on request.
> The only exception I have seen so far is where they were forced into an NDA
> by a large chip and board vendor, which prevented them from publishing a
> specific datasheet.

Nice, that they are better in this regard than others.

> Others are much worse. Many PMIC vendors don't publish their datasheets at
> all, and sometimes chips don't even officially exist (notorious for chips
> intended for the automotive market). Just look at the whole discussion
> around MAX31335.
> 
> Anyway, there are lots of examples in Documentation/hwmon/. I don't see
> the need to add further documentation, and I specifically don't want to
> make it official that "Datasheet not public" is acceptable as well.
> We really don't have a choice unless we want to exclude a whole class
> of chips from the kernel, but that doesn't make it better.

I know folks figure it out eventually, but I found it helpful to have 
the datesheet name in the commit message to know what to search for, ask 
for, or in case of difference between datasheet revision what to compare 
against.

>>>> Could you please give a high level description of the driver design?
>>>
>>> Can you be more specific ? I didn't have time yet to look into details,
>>> but at first glance this looks like a standard hardware monitoring 
>>> driver.
>>> One could argue that the high level design of such drivers is described
>>> in Documentation/hwmon/hwmon-kernel-api.rst.
>>>
>>> I don't usually ask for a additional design information for hwmon drivers
>>> unless some chip interaction is unusual and needs to be explained,
>>> and then I prefer to have it explained in the code. Given that, I am
>>> quite curious and would like to understand what you are looking for.
>> For a 10+ lines commit, in my opinion the commit message should say 
>> something about the implementation. Even it is just, as you wrote, a 
>> note, that it follows the standard design.
> 
> Again, I have not looked into the submission, but usually we ask for that
> to be documented in Documentation/hwmon/. I find that much better than
> a soon-to-be-forgotten commit message. I don't mind something like
> "The NCT7363Y is a fan controller with up to 16 independent fan input
>   monitors and up to 16 independent PWM outputs. It also supports up
>   to 16 GPIO pins"
> or in other words a description of the chip, not the implementation.
> That a driver hwmon driver uses the hardware monitoring API seems to be
> obvious to me, so I don't see the value of adding it to the commit
> description. I would not mind having something there, but I don't
> see it as mandatory.
> 
> On the  other side, granted, that is just _my_ personal opinion.
> Do we have a common guideline for what exactly should be in commit
> descriptions for driver submissions ? I guess I should look that up.

`Documentation/hwmon/submitting-patches.rst` refers to 
`Documentation/process/submitting-patches.rst`, and there *Describe your 
changes* seems to have been written for documenting bug fixes or 
enhancements and not new additions. It for example contains:

> Once the problem is established, describe what you are actually doing
> about it in technical detail.  It's important to describe the change
> in plain English for the reviewer to verify that the code is behaving
> as you intend it to.

I agree with your description, but I am also convinced if you write 500 
lines of code, that you can write ten lines of commit messages giving a 
broad overview. In this case, saying that it follows the standard driver 
model would be good enough for me.

Also, at least for me, often having to bisect stuff and using `git 
blame` to look at old commits, commit messages are very valuable to me, 
and not “forgotten”. ;-)


Kind regards,

Paul
