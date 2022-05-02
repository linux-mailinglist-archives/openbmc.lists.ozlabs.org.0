Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C76C5169A6
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 05:51:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ks8KJ0J5hz3bZR
	for <lists+openbmc@lfdr.de>; Mon,  2 May 2022 13:51:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YSM4LRLQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YSM4LRLQ; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ks8Jr40B5z2yK2
 for <openbmc@lists.ozlabs.org>; Mon,  2 May 2022 13:51:07 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id s131so14226726oie.1
 for <openbmc@lists.ozlabs.org>; Sun, 01 May 2022 20:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/NF8pyfH57GKRD5Dzqj4pHx2MqZaclUASnEJQVXNbBc=;
 b=YSM4LRLQzqX0XqiTK7UAmvNyq3rJBHDyB4Zkm/j8u3WnIsCpTMxEmApJ63J25B6qEd
 VHKEqWu0yU1+ImQyTcS7FsDM0E2uiQdopJjTX5IGMkb70gnAko1n2GB3NKHChqMU5ULo
 G6qtYs5hliYJuSj3GAj5P3c/lfoa9bCsN9SpSNhMMNR1YzvSHJSxTnbu9mlO2FtURo63
 jre+V/4/vlbQhwLRQ0bSk88UgiomO/EKtcs8FFCyf/QJW7QrnpQXe2ZSYZDiBKLcgpOv
 X6cfYlcm8ZoakYngXSCwg+K5BW1hEAnMon7soXohdLyV71Khb+HuHQ7p9YB5u3Vyf1yR
 P7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/NF8pyfH57GKRD5Dzqj4pHx2MqZaclUASnEJQVXNbBc=;
 b=m351fh9XR4nePNCHsmLtLCTOGXxSgCz48cU/osP9NGR4rtnGhFeAHxT8m6CXuXRRoK
 NHPwD0WCKzOO2uTkIwcOSYB2hDWGCpMoit9lLHHzdDNfkac51v7hK9rLM8JGUfqQTeEt
 lrL20gm4O+qmx4ywpk7RrdjE7G6EEcrGGkl7WZSAH4OSeuLTG4DqxC8Gw8riFkxzV57J
 yk99eYnGYHrERv3nCKpqSW9NftQddSO21yN9IkKq9Wz7Ak4VkSQKXF1cmN3wGXK3wLdx
 zLVYu98Qr/X5FfGu/tMornvAxF5wv/x3Z4qKagvsrmGcEbXJ9RfK6YDnvyKaGwEC1Rdh
 EW2w==
X-Gm-Message-State: AOAM533E8gbi8t1nJU08T/9rNkERlnViRAuDr5UXi9j5RD0eFNcpsbL0
 4gIhVhidinJsaY6EXMMQ3Xk=
X-Google-Smtp-Source: ABdhPJw58pfDSTpUlB4DbUfaytxkAMXnofPffQKcZ1/THtvS/lQD+nwWCXdXbHjr94di5vRJ53A5jA==
X-Received: by 2002:aca:2807:0:b0:326:14c8:a19b with SMTP id
 7-20020aca2807000000b0032614c8a19bmr157541oix.158.1651463462930; 
 Sun, 01 May 2022 20:51:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 2-20020a9d0c02000000b0060603221246sm2465068otr.22.2022.05.01.20.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 May 2022 20:51:02 -0700 (PDT)
Message-ID: <9632fee7-126c-2205-3a7b-4374dd9c2123@roeck-us.net>
Date: Sun, 1 May 2022 20:50:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 0/7] hwmon: (nct6775) Convert to regmap, add i2c support
Content-Language: en-US
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 Zev Weiss <zev@bewilderbeest.net>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org
References: <20220427010154.29749-1-zev@bewilderbeest.net>
 <bc46d60e-7c89-ad05-780c-9e9fd19f788e@roeck-us.net>
 <2508913.OsOuS879W0@natalenko.name>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <2508913.OsOuS879W0@natalenko.name>
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Renze Nicolai <renze@rnplus.nl>, Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/1/22 08:18, Oleksandr Natalenko wrote:
> Hello.
> 
> On středa 27. dubna 2022 15:37:07 CEST Guenter Roeck wrote:
>> On 4/26/22 18:01, Zev Weiss wrote:
>>> This is v4 of my effort to add i2c support to the nct6775 hwmon
>>> driver.
>>>
>>
>> Thanks a lot for your effort.
>>
>> I applied patches 2..6 to hwmon-next. The first and the last
>> patch of the series will have to wait for DT maintainer approval.
> 
> Zev, sorry I'm late. I've just tested what went into hwmon-next (patches 2..6), and it didn't affect `sensors` output for me, so I guess this confirms what you asked me to do ("I don't have access to any asuswmi hardware, so testing of the nct6775-platform driver on that to ensure it doesn't break there would be appreciated (Oleksandr, perhaps?).").
> 
> Guenter, if it's not too late, please consider this as Tested-by: from me on this part of the submission.
> 

You'll have to provide a formal Tested-by: tag.

Guenter
