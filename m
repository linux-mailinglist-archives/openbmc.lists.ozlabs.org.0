Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 345D94C7D15
	for <lists+openbmc@lfdr.de>; Mon, 28 Feb 2022 23:13:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6vlf1zLDz3bfg
	for <lists+openbmc@lfdr.de>; Tue,  1 Mar 2022 09:13:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hNCRoJVR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2b;
 helo=mail-oo1-xc2b.google.com; envelope-from=mr.nuke.me@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hNCRoJVR; dkim-atps=neutral
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6vl9622wz30QD
 for <openbmc@lists.ozlabs.org>; Tue,  1 Mar 2022 09:12:51 +1100 (AEDT)
Received: by mail-oo1-xc2b.google.com with SMTP id
 j7-20020a4ad6c7000000b0031c690e4123so20463081oot.11
 for <openbmc@lists.ozlabs.org>; Mon, 28 Feb 2022 14:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1LMGaRmkXY2aHXIztknttT3kvsQalp+aOsFBrxWr/BI=;
 b=hNCRoJVRSL++hxnroZa3RcI9FEZue1pjjjHonqD3oG5xvvk8CeTg4SjedVqgmdL99z
 XZefB0j7vqfDZWGDgniA/8KL+tDc7Gox0+5+8VqtwQ1AZx8UnDrPlxtV9lliT/mCCZiS
 zG2PxwHiqs03hFQV3x5A+n6bJcvHX4tiKNUrqyRxk7DEiDhSoENjsbfPWvtEAzyZNGi/
 H1ILevQZKbNGtrrQTQC2nFFnG6Nt6nb7+Cn9TQzQxh85ERnoeT5vBvHs7urhbH/iY1l0
 +DTJm5qPg9GJ4VKhacvCxlm8mS9x16OPGPHbAoYwrsXSTY61ybIH/7WdjUkzF2qprCUt
 dLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1LMGaRmkXY2aHXIztknttT3kvsQalp+aOsFBrxWr/BI=;
 b=LBvkxigxqbKYo1l2FZIjVUQlPCjQZzl0fMwK7gO8xu1fwVEK2Hm+M8xJMdRwwjHgcl
 1U10/4UXrEpXNS815HUo6vQe/7whCXhrTUyvaayh2gjdt23EUysNnPjU0y5GuTlREjtW
 DAZ8dO4j+doUL3v2Z+IQKvIfrx0YRmMlkFNngFRoEMVGV5Rdwzv6ZKYApDcSVv+1MdlQ
 B9Rx/Faf6BMWDvNT1Ad7bxOvG5GqsXRyUyfZz6hsqJmX1Tb0pKz0nnKdj4PZ3qGEiLSf
 WFfhUsHcMmHPUTB3p0L74glJbK/wWzqRxHEronMecjrAo/jlFxtnnI4yE/14DQEoPUXH
 aUJw==
X-Gm-Message-State: AOAM532g8FPNh/sdpMNfr9C5TGSKvcPIQ9j6sceHXGqLjxJ4EilFIwhP
 4G8cSGVXkqpUFckO9UYjpV0=
X-Google-Smtp-Source: ABdhPJxFaNFupZUw8cG4b3lJVM0rdk6BB3Ze+JUFaDmKPeuiCk1Qrc5exc7wxckusMCmVxM1lsrmTw==
X-Received: by 2002:a4a:8893:0:b0:31b:fd08:2735 with SMTP id
 j19-20020a4a8893000000b0031bfd082735mr10116232ooa.96.1646086369157; 
 Mon, 28 Feb 2022 14:12:49 -0800 (PST)
Received: from [192.168.1.169] (c-98-195-139-126.hsd1.tx.comcast.net.
 [98.195.139.126]) by smtp.gmail.com with ESMTPSA id
 i2-20020a056870c1c200b000d7355852b3sm1276014oad.19.2022.02.28.14.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 14:12:48 -0800 (PST)
Message-ID: <e3e8d6a8-43ee-d0f5-d5dc-babcad5147ef@gmail.com>
Date: Mon, 28 Feb 2022 16:12:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] image: Control FIT signature verification at runtime
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>,
 Dhananjay Phadke <dphadke@linux.microsoft.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <20220131034147.106415-1-andrew@aj.id.au>
 <97430094-7d2a-432b-a121-96812fac87f9@gmail.com>
 <cf36daed-852b-4c72-b2f3-febf7fd3f802@www.fastmail.com>
 <e44df5b3-a338-3cd5-5399-6b5cbf55f5c9@linux.microsoft.com>
 <YgriLTCF5hvtPCMm@heinlein>
 <06616971-2f88-740d-e805-d229aa86d985@linux.microsoft.com>
 <e4b7fc2b-511a-46f0-8a6f-001c16ebe712@www.fastmail.com>
 <483b87d6-a9aa-4f64-9bb5-04874312a97b@www.fastmail.com>
From: "Alex G." <mr.nuke.me@gmail.com>
In-Reply-To: <483b87d6-a9aa-4f64-9bb5-04874312a97b@www.fastmail.com>
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
Cc: U-Boot-Denx <u-boot@lists.denx.de>, openbmc@lists.ozlabs.org, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, Simon Glass <sjg@chromium.org>,
 Christopher J Engel <cjengel@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/27/22 19:29, Andrew Jeffery wrote:
> 
> 
> On Tue, 15 Feb 2022, at 13:55, Andrew Jeffery wrote:
>> On Tue, 15 Feb 2022, at 13:42, Dhananjay Phadke wrote:
>>> On 2/14/2022 3:13 PM, Patrick Williams wrote:
>>>> On Mon, Feb 14, 2022 at 11:14:53AM -0800, Dhananjay Phadke wrote:
>>>>> There's a key-requirement policy already implemented [1].
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/u-boot/cover.1597643014.git.thiruan@linux.microsoft.com/
>>>>>
>>>>> Board code can patch "required-policy" = none at runtime based
>>>>> appropriate logic.
>>>>>
>>>
>>> [...]
>>>
>>>>
>>>> Isn't this jumper proposal just like the TCG Physical Presence requirements?
>>>> This is a software implementation and requires a particular hardware design for
>>>> it to be done right, but it seems to be along the same lines.
>>>
>>> I'm supporting idea of having control on FIT verification, just pointed
>>> that it maybe done by board code by just patching U-Boot control FDT,
>>> either the "required-policy" property at /signature or "required"
>>> property in individual key nodes.
>>
>> This might separate the logic out in a way that's acceptable to Alex.
>>
>> Let me poke at it.
> 
> I've thought about this some more and adding support for
> `required-mode = "none";` or similar seems like a massive footgun given
> that (as I understand it) the FIT image as a whole isn't verified. Only
> supporting "all" or "any" seems okay because some verification must
> succeed in the context of the keys available in the current stage.
> 
> After some internal discussion this effort has been set aside so I'm not
> going to pursue it further for the moment. I don't think it's easy to
> proceed anyway without feedback from Alex.

Don't let my thoughts stop you. I don't think there is a perfect way to 
address this situation, and we don't have to. Code can be changed later.

As a general preference, I would like to see a single decision point on 
whether to verify/skip. It can be changing `required-mode = "none", or 
any other similar solution. Keep in mind that the FIT is the image 
you're trying to authenticate. It is completely different from 
"required-mode", which is part of u-boot's or SPL's embedded dtb.

Alex
