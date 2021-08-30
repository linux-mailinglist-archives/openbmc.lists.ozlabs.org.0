Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C85893FB90D
	for <lists+openbmc@lfdr.de>; Mon, 30 Aug 2021 17:35:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyvXK4gdjz2yNN
	for <lists+openbmc@lfdr.de>; Tue, 31 Aug 2021 01:35:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SUWFm6ZP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32a;
 helo=mail-ot1-x32a.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SUWFm6ZP; dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GyvWx68p3z2xfP
 for <openbmc@lists.ozlabs.org>; Tue, 31 Aug 2021 01:34:53 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id
 v33-20020a0568300921b0290517cd06302dso18861638ott.13
 for <openbmc@lists.ozlabs.org>; Mon, 30 Aug 2021 08:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1XlNxUDlSYdSIfCn5vMG2bfoCAnG2qcrn/mF4ovrEYQ=;
 b=SUWFm6ZPc5XlI7RcVOKZlTehfk0U6pG5JhNeR9Pc6VCE5/yuMYtOqEgBCeaJU8VRg9
 4Nb8AmrutoObPOt8y/s6zVKl3VYNFG2dTF8/kKJgSP0iZCoY8YAJ1HegAnfJnxvbb9jp
 DSX5aat2EHE4WbhMDxgMp5d9ySqHzp8DPP33uP+/F16mU/5NLlWnFpYMd3lYdp8wGcFD
 JiYoS029NUT8k7kkjJ/WfDVwl+wQDnuDnywGGKe0qq782FrZWwFmXPT9o4YeWi65HkfA
 tJTVDr3leHoet8wTfOs+1ySrzYHG9vu/bhLaFfMBMa3a7JJxA1J1mh8H9f7oU5ykPvVw
 OC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1XlNxUDlSYdSIfCn5vMG2bfoCAnG2qcrn/mF4ovrEYQ=;
 b=WqH9O2YL8vAsbe2yCrBM0+8IXQU9jWUDtppT3TGMfXwoTRHgrVjnZV4i0B0BDazrrI
 BoffhmtLqgkJ9oro0di9D7owBK+ExQFzTgQJ3+UDaAAdrx9QxZUAjjqYvG/g0f/3XyeF
 VX+wn9ofcTc6zw7ftQUhdP/dpj0gddElDpoN7jRC/l7mS/SfidSCjMXr9zPL55W663In
 via0J6EA1GZglgvSEi7MG8Z146xrK+AasLfdvFYpdo8nEOwnOhJ/6GkBTTp/O3kA+iDn
 MgumZAvtNfLI969zH4TL518RIOrU+K4910+7ITPDGWt6ncIo10CI8amvKnGyM6BSYxUr
 NbYg==
X-Gm-Message-State: AOAM533U7F/mNyE5ORti+df+pRzR51HHgR+Iua6mnFZGYfv+Es1GGrJj
 SAYR90Ho4yrNVnPLUvvrPnI=
X-Google-Smtp-Source: ABdhPJx0IwUikcGqVNJ2MaaAq/Qw2INo8sdw/hlIihJVjjdoR6iHCpWFXPbqX1ep8psW5eVEjXAtgA==
X-Received: by 2002:a9d:829:: with SMTP id 38mr19885511oty.342.1630337690526; 
 Mon, 30 Aug 2021 08:34:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q17sm3283015otc.28.2021.08.30.08.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 08:34:49 -0700 (PDT)
To: Eddie James <eajames@linux.ibm.com>, Brandon Wyman <bjwyman@gmail.com>
References: <20210827230433.3596370-1-bjwyman@gmail.com>
 <20210828155250.GA820265@roeck-us.net>
 <e9de99d88fb9e2e34552806fa47efa488332325c.camel@linux.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) Do not swap max_power_out
Message-ID: <e5916b33-8898-a483-bc69-49a08913672c@roeck-us.net>
Date: Mon, 30 Aug 2021 08:34:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <e9de99d88fb9e2e34552806fa47efa488332325c.camel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
 Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 8/30/21 6:50 AM, Eddie James wrote:
> On Sat, 2021-08-28 at 08:52 -0700, Guenter Roeck wrote:
>> On Fri, Aug 27, 2021 at 11:04:33PM +0000, Brandon Wyman wrote:
>>> The bytes for max_power_out from the ibm-cffps devices do not need
>>> to be
>>> swapped.
>>>
>>> Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
>>
>> Eddie, can you confirm this ?
> 
> This can't be true for all the power supplies supported by this driver,
> no. I think we need to check the version first. Brandon, I tested this
> on witherspoon (which is psu version 1) and get 3148 watts. If it's not
> swapped, that would be 19468 watts...
> 

Hmm. Eddie, can you also have a look at commit 9fed8fa99334 ("hwmon:
(pmbus/ibm-cffps) Fix write bits for LED control") ?
We need to make sure that it doesn't mess up some versions of this PS.

Thanks,
Guenter
