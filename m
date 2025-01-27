Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A20AAA1DC2B
	for <lists+openbmc@lfdr.de>; Mon, 27 Jan 2025 19:40:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhcfK4lZMz3bZK
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2025 05:39:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738003190;
	cv=none; b=mms6e7lu5BRf0QOVwuo3mhxUlij9J8NTHdvQThrslBO86orL9tqqcwbHbr5a9ZOY/3LdxqhEvhHwU1hNhZ33ratSMZhmUUQZ56T4Rwh3wo8y58bWrtj9/qSgJ0bIfN3+/kCoI/nkLqVMZhugA2NspcroYHmGZdj6FHO/f4+dhAT+hJnKoAXznRntLL1UGLicRHNFZJVh42iRR834PDp+us0k2fkphMvSu5b8l6nASGM3N8cTYvs2eQGFvhVUE40QbqZhAvlxXSv2YjmM7G2bIfkYfnhR4Oh5Wy2T+ccZA079qMbyjjoDEiij9TYMLNJoeGBbol5dds4Drm3khvICCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738003190; c=relaxed/relaxed;
	bh=7xZfgq6sVuvos6ONTJEQGslC4Uzw06+5cwcQD5EqUfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QAtNnbLmwTRJZxCVDiKxfYaTsg6zrao+z7+P112aMQuBTAj0JbhqTPwKfnPpORumlecedVzmHiAUCVTulSlKk9Ca6R1Mx4hDTgYAMl8KD5aTeOi49421kDsGs/dvhKqvJASVis+9eXD/ICTTI8czEjWyH5IchKJMGe/O+91fG2qdaBAKQ/amD6fMkd/Peiv4IYtxjZipRwNiTsLu8jvSWaEeZorjhRN9KnskYzf5dDct2YlIFrQmfF+mwBrZ3QG16DsicsWN1YEKhQ8vY0IKaDdaAs25jTr3kyrR+7zmUiG6TimvNKFxAycgxx1xPfuPLoM97DvTM09/a6wQKgxyBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fgKbjNAg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fgKbjNAg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhcfF2mFFz301n
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2025 05:39:48 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2163b0c09afso87428715ad.0
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jan 2025 10:39:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738003186; x=1738607986; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7xZfgq6sVuvos6ONTJEQGslC4Uzw06+5cwcQD5EqUfU=;
        b=fgKbjNAgtXdv34Xg4FTaYfmIiwtgxNwhP09I8CLZydvHGRdz7xlDPBisAKTnzrJl2D
         0/xej73/WFbUfdKA0CNBqKn8KT8HdGoWL7trjEKt22Y2xlKlMcK8a+GwBN42W4lDCFq/
         1bkN+hjBAoy+qCDdmeoLfeMnQ5qqtTMf3nJx9wovDkv5jyjSH00NnMwNx2dmMLH/Q/R2
         6nLH2+j5QEjfBp3iESn3Z2MlIjbvAJqUFknLMZvLE66LG6ZPLeyn1BBx4JBGH+XMOXOJ
         SI958y9G8InbQILw0uMxh2b8b/OMlnBkV1K7R/rAybuGDRNkBQYh/5ThTR/F0GOuT4AB
         qf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738003186; x=1738607986;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xZfgq6sVuvos6ONTJEQGslC4Uzw06+5cwcQD5EqUfU=;
        b=CFQKhpkIRVF7XmHcAVE0XCbB1SvCSWD15OnuHIlGdZzeWAQ/CTa+Xr5zl/mWu46YbA
         mstWkiUAyCav+m8uOyk9Sxjfg/Ag6S6u/MIMOgemgKSXr87LCN0gVXTtJqLg59OIIG9z
         4mEojyXdxOxho4HA47ZNsU0Gs1XnKnlTt4DprguxkAFNn9gjqXbZbWldUZZDyS9AcVhX
         wC4bHfG5LpgFmG0uJdt2vk4EUNDrnYBk2CKnH8MMnaeOHpwyiUl271innL2nOtYGrg70
         YeW4NyZ1VSaWXjgpcC8Ie593qOvvdU3ufGuI/UJ1/DcYC2gl3tkeRzC653+/3o3wuO1g
         sxHg==
X-Forwarded-Encrypted: i=1; AJvYcCVHPhb8YuM1TAucb4ZAFcnLeArgeV7vgTp+kaZJjB3iVIX+nXf2yOk7muKkQdgzzFEBwmdh4F2f@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz8Xa2T5FhGFFRRBQeyzzsOa/VY2hIu1LBWwTYqvwpYmsZl009r
	4hE4Ut+wxH0dAjB+GrZyelQScP59KZN3oW1UQQaewE/eo5xhBoIL
X-Gm-Gg: ASbGncv9nW02UhU91uHi+/hC3+Sl8oZ1a/DieGIog1OIaAThIzZA1eCQdLwZBA3qFG3
	Ft9ZeQXMtXeHxXij2jsdqof2PX1442Gxx5ZiQvdPizljijKAtF800HJHU+5Ih2va2zNVCTrZRYn
	KkTp5FdomncNzEg7Kbk8DgvxB3zqJHZaE0t0WWdndCT0f5pmY6q/Igl8JpqovHHynftmS6sggsh
	/1JzRO+Z0pIrRcrJy/PWj50ZCYYhwqRUQbg/iPJbssTQ2lwMgMtIOb4pOt3hBvfWyr68v1qjoyx
	Odm0PnEIfJqoGbmfZTMTE0fjJy0XrAE7ZZaOuNvE+7IfqAio5I0XeQ==
X-Google-Smtp-Source: AGHT+IFdz6LtDnVNY82Sug5rXeXslgqCogK7/oZyq+qUG5W6OGwDNUkMwQbT7tFAwMRigBfXQ9909Q==
X-Received: by 2002:a17:903:22cb:b0:21b:d105:26a5 with SMTP id d9443c01a7336-21c355becd3mr692005635ad.38.1738003186130;
        Mon, 27 Jan 2025 10:39:46 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3d9c605sm66702275ad.41.2025.01.27.10.39.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 10:39:45 -0800 (PST)
Message-ID: <1dc793cd-d11d-441a-a734-465eb4872b2a@roeck-us.net>
Date: Mon, 27 Jan 2025 10:39:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (peci/dimmtemp) Do not provide fake thresholds
 data
To: Paul Fertser <fercerpav@gmail.com>
References: <20250123122003.6010-1-fercerpav@gmail.com>
 <71b63aa1646af4ae30b59f6d70f3daaeb983b6f8.camel@intel.com>
 <7ee2f237-2c41-4857-838b-12152bc226a9@roeck-us.net>
 <Z5fQqxmlr09M8wr8@home.paul.comp>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z5fQqxmlr09M8wr8@home.paul.comp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>, "jdelvare@suse.com" <jdelvare@suse.com>, "Winiarska, Iwona" <iwona.winiarska@intel.com>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "Solanki, Naresh" <naresh.solanki@9elements.com>, "joel@jms.id.au" <joel@jms.id.au>, "pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>, "Rudolph, Patrick" <patrick.rudolph@9elements.com>, "fr0st61te@gmail.com" <fr0st61te@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 1/27/25 10:30, Paul Fertser wrote:
> Hi Guenter,
> 
> On Mon, Jan 27, 2025 at 09:29:39AM -0800, Guenter Roeck wrote:
>> On 1/27/25 08:40, Winiarska, Iwona wrote:
>>> On Thu, 2025-01-23 at 15:20 +0300, Paul Fertser wrote:
>>>> When an Icelake or Sapphire Rapids CPU isn't providing the maximum and
>>>> critical thresholds for particular DIMM the driver should return an
>>>> error to the userspace instead of giving it stale (best case) or wrong
>>>> (the structure contains all zeros after kzalloc() call) data.
>>>>
>>>> The issue can be reproduced by binding the peci driver while the host is
>>>> fully booted and idle, this makes PECI interaction unreliable enough.
>>>>
>>>> Fixes: 73bc1b885dae ("hwmon: peci: Add dimmtemp driver")
>>>> Fixes: 621995b6d795 ("hwmon: (peci/dimmtemp) Add Sapphire Rapids support")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Paul Fertser <fercerpav@gmail.com>
>>>
>>> Hi!
>>>
>>> Thank you for the patch.
>>> Did you have a chance to test it with OpenBMC dbus-sensors?
>>> In general, the change looks okay to me, but since it modifies the behavior
>>> (applications will need to handle this, and returning an error will happen more
>>> often) we need to confirm that it does not cause any regressions for userspace.
>>>
>>
>> I would also like to understand if the error is temporary or permanent.
>> If it is permanent, the attributes should not be created in the first
>> place. It does not make sense to have limit attributes which always report
>> -ENODATA.
> 
> The error is temporary. The underlying reason is that when host CPUs
> go to deep enough idle sleep state (probably C6) they stop responding
> to PECI requests from BMC. Once something starts running the CPU
> leaves C6 and starts responding and all the temperature data
> (including the thresholds) becomes available again.
> 

Thanks.

Next question: Is there evidence that the thresholds change while the CPU
is in a deep sleep state (or, in other words, that they are indeed stale) ?
Because if not it would be (much) better to only report -ENODATA if the
thresholds are uninitialized, and it would be even better than that if the
limits are read during initialization (and not updated at all) if they do
not change dynamically.

Guenter

