Return-Path: <openbmc+bounces-735-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A273BD3A65
	for <lists+openbmc@lfdr.de>; Mon, 13 Oct 2025 16:47:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clgDN5K8rz30P3;
	Tue, 14 Oct 2025 01:47:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760366836;
	cv=none; b=MeMdyFD/o8dQ7sjsw5/qIYvWd9xHkXXID3jfB4ujvpFcYH1Y+inqT8HUxDOpIbXlIYCwA5ymho87YMlD9jqMHSJHPv2TbEZoBOlHNly65RoD2/pz0sRLKu8/NPv+rForJsN15eOfrx75LdZmX8ZwoRFuhiaP0h4/9DB21I+TVMZL6qD1QH4hQY7MTgUC+VR2d6Amk4z7tpzqT5pRrXkdysYiBeToybWBXpE51V+QDjhPH1ULF2NQ+wcoLrOvvEKmy5zXM9AummNPjfp71JZoyeX6r1b5hHGNAsEUPJGKuv0bgO6b71m6LNbZVIf1nAjDWwkkLUDgs4Y/HyRGdGGJcA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760366836; c=relaxed/relaxed;
	bh=iM5/e4UJAfJvXPy0LZcn9NuDbnYMTsJJoi6JFRNlh9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BGVB7l+5wepk0wcApayDGDeNZrVEXa2otFTw8OKr8d003nBW1hn805FxVv4eMDpaUEjzI2nQ3P2axds/wu2iye96spa1OjRhXAkneRUYDjMU+cHL0y1Sm8HKM5por3olSskrGsJl8eCEIut9mh/QxZfbs0/ejT/mYp54oZbNAfvGZh02BVQFJc42+ENokfe7AQRWja5wJlBpjQmfXr2ES1WFfkSbe8ELcAJejctQhaBn1+YRllj7S44+3isfibgBDJ9IJRIKJm46ToU5xFYvHVpFYHU8fEgNm4kAhVWm7S1gekT0Zeq11w6yxuBRSDtPpdicOe6Nmp7F5ae2DADprg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iSiDMvmR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iSiDMvmR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clgDL75HHz302l
	for <openbmc@lists.ozlabs.org>; Tue, 14 Oct 2025 01:47:13 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-79af647cef2so1359651b3a.3
        for <openbmc@lists.ozlabs.org>; Mon, 13 Oct 2025 07:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760366832; x=1760971632; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=iM5/e4UJAfJvXPy0LZcn9NuDbnYMTsJJoi6JFRNlh9k=;
        b=iSiDMvmRYyvjsreNYM33KfPKR1Z1YwIW87CvvYtHeD7WfXrI63lYJRXOGCD84KjyTe
         rPwQhQF+0Vt9UKlUJgJW/lO/rmOW3aam/kmaB9dvO6lWvAcAIVE6OIh8HOb5u0u2HMeX
         bFVpk62Ox4ZBk6yY+2Fy2zzcZjcYHnQhxGBqz4hjQhzrdy3+KLgnup19A5Tb2jgfRAnL
         5CQUyWLPnGc5r9SexRxR++2A59bDRdcep1QOivmzdetr2q2Lqy1ducHnZs7oBdAxGU7V
         vD9oJvdY/Wcr99E2BCQEAGJi6ZSOJeQjg1zWyyNWpX4YUtunTd7UzwjgSz6YAZa/JVJg
         cv3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760366832; x=1760971632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iM5/e4UJAfJvXPy0LZcn9NuDbnYMTsJJoi6JFRNlh9k=;
        b=cOdqN6zei5vTwQfMKjNLUBZgQAd2tNhNjbHm6s1mwTKST2+jhg8kMq2DelY0Jt62fI
         9mZ9QsR8+mKup3GJL49ms56qDK+Ea3v4ph+kD9Ho+cobUt2SKWQsOpc3N4ghx5JyyYh4
         JiQCaKXe7nLlA38m/Rh5oh5o3hb1hK1h1PfjxI+LYic7UPJyfHgtR6TADSyIudlTZlJH
         oJxN0dhq45raOhp+EPTpcmFOHbKZzUidTsxcGmmbn+bjI9iaVa0eUiUsRMfMiUjLipKv
         nC5DUiWM4/zeambFv41R1NyEO9cTKcxBqXsbbhu8Bb4SlDeZHvfD5qoLEBn6PniAiqfL
         av3g==
X-Forwarded-Encrypted: i=1; AJvYcCXhpeIMsqh+OuaoU2rbyl7SRCOAf2SnCw0UPjykdu3kNuEy0v4quvek8hz6YjssGUiG57Gs2Hom@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBUIGqpdK1SY8MEyGkHMuWZ6E8m+Mro0q8bbt3j9sU1qHO7Zxq
	r95GSmsKmzfPC0jG7wKmethSRGlzu5+laARySPdiHOnzJ1TAdG4MylmV
X-Gm-Gg: ASbGncuFHfZVhOnGh3v5VoDk/6tdETfSD6wPSQqSd3XzvY+1nQRvgBKbIPlGE658FcZ
	4WnumKrmJSah2TEliM99yqCCpVMD7zeq4h9n9vU3jlY0oM0jIuQzEM/T6NwbIqJni6ED6+LdIGo
	LWyDISrcHfbgSJB3/uobTVeP25o2uhcnUB6ZeXM9ranRELjBiw2YDWwX7aVmGx/t5LiM75F71yH
	aILBldD6i9313VNpaPHxXJtM/67V6LjhWM0qw2ScIZ3Z/iSC2HB9eh8noaaB5IZufLYhmekuuJs
	lRHft6sBv+ZAwkDSTtxm/Zy0VKnRGCkVviT8NoZY62dJCag5EfvpQWGwk/fnmUfLGpMTzPc/q5a
	e2jHPCmL8LsBUa0FmrCVsxVU9AunBfwSIsAtq9GRfglbl2fA/FjI7PiEC8JLUkOW3/H7YVnzpSQ
	qSIOBDrOcW0+YsSmwpaQT8xMoa
X-Google-Smtp-Source: AGHT+IHPU/97MoKvW8vBm9Jrran+thU7TIazvVrMY0e9wgshgLyIvIk5asZAEFCjkaqXX2avBELD4Q==
X-Received: by 2002:a05:6a20:7fa3:b0:331:e662:c97e with SMTP id adf61e73a8af0-331e662cccbmr6834583637.37.1760366831737;
        Mon, 13 Oct 2025 07:47:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09ace5sm11950521b3a.53.2025.10.13.07.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 07:47:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f1f5362b-16ef-4699-bec5-986de2116d83@roeck-us.net>
Date: Mon, 13 Oct 2025 07:47:09 -0700
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: (peci/dimmtemp) add Intel Emerald Rapids
 platform support
To: Ivan Mikhaylov <fr0st61te@gmail.com>, Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20251006215321.5036-1-fr0st61te@gmail.com>
 <20251006215321.5036-3-fr0st61te@gmail.com>
 <0ede72a9-4555-4e4d-959d-3a505b6598ee@molgen.mpg.de>
 <9badd4e53ddb6166d0aa196da978bd70f61642de.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <9badd4e53ddb6166d0aa196da978bd70f61642de.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 10/13/25 04:44, Ivan Mikhaylov wrote:
> On Tue, 2025-10-07 at 10:26 +0200, Paul Menzel wrote:
>> Dear Ivan,
>>
>>
>> Thank you for your patch.
>>
>> Am 06.10.25 um 23:53 schrieb Ivan Mikhaylov:
>>> Extend the functionality of hwmon (peci/dimmtemp) for Emerald
>>> Rapids
>>> platform.
>>>
>>> The patch has been tested on a 5S system with 16 DIMMs installed.
>>
>> What is 5S? 5 sockets? (Probably not.)
> 
> Paul, thank your for review and sorry for late reply.
> 5S - Intel 5 Series/5th Gen
> 
>>
>>> Verified read of DIMM temperature thresholds & temperature.
>>
>> Also paste the output?
>>
...
> Guenter, I saw that you already applied other two patches, need I
> resubmit series with updated info of commit for this one or just this
> one?

No. While that information is valuable as comment, I don't see value
of having it in the commit log.

Guenter


