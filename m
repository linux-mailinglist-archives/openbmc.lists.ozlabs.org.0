Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B89AD879FFC
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 00:58:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BSgZw4P2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TvVwW4F7gz3bn8
	for <lists+openbmc@lfdr.de>; Wed, 13 Mar 2024 10:58:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BSgZw4P2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvVvw5Mywz30Kd
	for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2024 10:58:19 +1100 (AEDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5a1d1a28da2so1408925eaf.1
        for <openbmc@lists.ozlabs.org>; Tue, 12 Mar 2024 16:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710287896; x=1710892696; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=D5DpqtpdfFAZzATRb5uTD8cUR8uacTJP27bayC6m7nM=;
        b=BSgZw4P2l+LSXtTTNnFXqaGN5yEs2shWe2+kKcyeqsnJhPUCJ87jlV4OyoLr2jwuaX
         4AiTDfBZNSzfILLEbj4rfGOw9DZp68wmjvyz5Wp+XKHwmoswe5Xe6B1585SfelkjRaXm
         dRp/H1ap4v+quHUVniQOj1BwyB9X8UfS8Y7Cb3bp9WFz9GJTbO2pOvrsq0UI6VxKQZcZ
         5fP4st8KUd3QMgwHzrNg2o2AZcu7hw8H5m307Z7sm+ULQPGYrN47FbcqAxLrGp/VLXPM
         Awb7LmjNv9z7QQJHtX9D3kx1aSvWnlObCgotoo2RxaOYac4KiC75VELasL87PYM7xCFk
         LjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710287896; x=1710892696;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5DpqtpdfFAZzATRb5uTD8cUR8uacTJP27bayC6m7nM=;
        b=Z1DVPo9sClTn6xi6kBVU5FbXqeQvnA4xdLo7a/gdvudl1BqikrHhaDlK5ToFtTFXwA
         wSrSGMzHrLgWMPPDW3GqaBUn+VOdw9Zt8TEdNQ1TC12toVkrYDLAIYt0CJUl9kSLZXp2
         28B7xL8zmmJIG4QKqhYjlUeOcpInTimznltX/RgvPEl/WPZoaO+yZkHP1mqnJ5X3J2Ma
         BPu6/MGa8ES02JkBSnKEj9rJPwCKmj6PzB+nM2A9iU10QUt2TyQgWyUbJ2r/UdNeZxir
         kSKqkvKRyOnBXFFZ+bYWBM6403qQEyYCH4QcQJT0P3bIkJahps+0B2CU94MaL2l7FvoV
         sDCA==
X-Forwarded-Encrypted: i=1; AJvYcCV1gxiuyYTPG2FXvJb5v6Yco32cDZ1mSqdrvIpW4URDz+gyVu71TWhiIpubBNsTyC70+DLMPeBuT4DzgAl9Osij8VEBs6k5rMQ=
X-Gm-Message-State: AOJu0YzIjBPA3RSlvKJK8/jMf3CL5yC4LN4awE959tfgpv9xlSyCt8NK
	skIvH0T1vuapQNPoWvLuL0nfvUR8VPN3SswveqPasBqoMmw2QJpe
X-Google-Smtp-Source: AGHT+IHsQwzlczYnyrpZsrGroO9kt+77qGT/uSc+9d9A4+NnU8JEdqQaZ+X0170u6VFsjZw/HfuBQQ==
X-Received: by 2002:a05:6358:495:b0:17b:e053:84e2 with SMTP id x21-20020a056358049500b0017be05384e2mr9148948rwi.12.1710287895812;
        Tue, 12 Mar 2024 16:58:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bq5-20020a056a02044500b005dc89957e06sm5791801pgb.71.2024.03.12.16.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 16:58:14 -0700 (PDT)
Message-ID: <37e11daa-c24e-45b2-a22d-769693fd2038@roeck-us.net>
Date: Tue, 12 Mar 2024 16:58:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] hwmon: Driver for Nuvoton NCT7363Y
Content-Language: en-US
To: Zev Weiss <zev@bewilderbeest.net>, Ban Feng <baneric926@gmail.com>
References: <20240227005606.1107203-1-kcfeng0@nuvoton.com>
 <20240227005606.1107203-4-kcfeng0@nuvoton.com>
 <a90ed00c-f836-4fb6-8191-9974937e3eb7@hatter.bewilderbeest.net>
 <CALz278Zgfgob573vgWz4PgC7vb=i8xt3kC1hSjo_cQi00B0XAg@mail.gmail.com>
 <cd63bec7-01c6-466e-b772-3a3d3d90a7d5@hatter.bewilderbeest.net>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <cd63bec7-01c6-466e-b772-3a3d3d90a7d5@hatter.bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, jdelvare@suse.com, corbet@lwn.net, openbmc@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, DELPHINE_CHIU@wiwynn.com, naresh.solanki@9elements.com, billy_tsai@aspeedtech.com, kcfeng0@nuvoton.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, kwliu@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/12/24 16:18, Zev Weiss wrote:
> On Wed, Mar 06, 2024 at 11:35:31PM PST, Ban Feng wrote:
>> Hi Zev,
>>
>> On Sat, Mar 2, 2024 at 4:19 PM Zev Weiss <zev@bewilderbeest.net> wrote:
>>>
>>> On Mon, Feb 26, 2024 at 04:56:06PM PST, baneric926@gmail.com wrote:
>>> >From: Ban Feng <kcfeng0@nuvoton.com>
>>> >
>>> >NCT7363Y is an I2C based hardware monitoring chip from Nuvoton.
>>> >
>>> >Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
>>> >---
> 
> <snip>
> 
>>> >+
>>> >+static const struct of_device_id nct7363_of_match[] = {
>>> >+      { .compatible = "nuvoton,nct7363" },
>>>
>>> As far as I can see from the code in this driver, it looks like this
>>> driver should also be compatible with the nct7362; shall we add the ID
>>> table entry for it now?  (Though I only have a datasheet for the
>>> nct7362, not the nct7363, so I don't know exactly how they differ.)
>>
>> As far as I know, the difference between these two ICs is 0x2A~0x2C
>> Fading LED for 7362, and 0x2A Watchdog Timer for 7363.
>> In my v1 patch, I indeed add the nct7362 to the ID table, however,
>> this makes it more complicated and our datasheet isn't public yet.
>> I think maybe supporting more chips will be done in the future, but not now.
>>
> 
> If the only differences are in features the driver doesn't utilize, I'm not clear on how it adds any complexity.  As far as I'm aware, neither datasheet is public (NCT7363 nor NCT7362), so if we're going to have a public driver for one, why not also do so for the other?  It's a single additional line -- and furthermore, having made that change and tested it out, I can report that the driver seems to work just fine on NCT7362 hardware as well.
> 

"if we're going to have a public driver for one, why not also do so for the other"

If you are trying to say that there should be two separate drivers, sorry, that
would be absolutely unacceptable.

Guenter

