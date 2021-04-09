Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4CB3594FE
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 07:52:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGnMf462tz3bTB
	for <lists+openbmc@lfdr.de>; Fri,  9 Apr 2021 15:52:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=IS+VXAwm;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=IS+VXAwm; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGnMN3tg2z2xb8
 for <openbmc@lists.ozlabs.org>; Fri,  9 Apr 2021 15:51:59 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id d10so3056684pgf.12
 for <openbmc@lists.ozlabs.org>; Thu, 08 Apr 2021 22:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=HJqBnU2N6sHn82h5sIdps1wMTASINqSIBY3BWEFwrhg=;
 b=IS+VXAwmNfW3rWEpcUvIBomWWq1QTQtAqbg42YZQ934J9PphzcP1RmRaPfuESUaQe2
 fOxh4WhcPnzOUNwAuwreeISOKTryELHQoP82KjbEUOcD7dtMV6HJu7X04jmaeJ3Nd0Ej
 m6Mp+biGibFmwVz5G9AvG4RW2knZRnaRfh+kUzhdAENfoexE36+ozu/39MHQaaA90++5
 Ife9m3eF9QKI5WNOhawvQ9I15liIw5N8ZYIOsXSXprFItE4f9B+BRZaOP9TO803LmjpM
 /ij4B7XznFyEMo5mg4fpAiHypazwpzad1ZBIuW354L4oX9zEGL3gdRHZplizoR5DIrxU
 DbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HJqBnU2N6sHn82h5sIdps1wMTASINqSIBY3BWEFwrhg=;
 b=r4zwTQvxYR7mlDhz09eQTid/0hQqymXOUV+9uzDwZxYvQXh9UxXZG7iIG+DRs78ohr
 ZDhGsDw85h9EMCFtxgyxYJb9cb8TfXvaqjDD/EHLa2besRG+Bbn4Mexm+NNHnj3AO4y1
 QlA1YD6R1UVFvDVjkSboD0vBTeiAMXf9qUWRpMhpvJ6RiaGwKS8yASZ4WCmwAgrc8XH1
 orc7emp0HsfpsVzTsj6EazUGtcTMbIYG28QHyR7/l3oB79fqowwNhOFWunVlFTzubw0k
 7iRksJBkbQYVNeIwULr7WuAdNGrmwAVPAHcXmUW35P07h2yOBhfC1zjBvCjU4Zj+x6uB
 0xhw==
X-Gm-Message-State: AOAM532pil7ish68LEAV/AMHi9Pq4o505TUP03SZA34VnumwjeEYFK0e
 jjAi/qmIdnOa40Una59m85aVxAqcUaAZsQ==
X-Google-Smtp-Source: ABdhPJxtOspuxG23cDb9Uq3wdCoOqcKzel3yh7iupzqBZMN1FAwXPwMcl4wsQAlUX3s7Mepo/5OX7Q==
X-Received: by 2002:a65:57cb:: with SMTP id q11mr10208340pgr.183.1617947515897; 
 Thu, 08 Apr 2021 22:51:55 -0700 (PDT)
Received: from [192.168.0.103] ([124.123.105.109])
 by smtp.gmail.com with ESMTPSA id g15sm229118pfv.216.2021.04.08.22.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 22:51:55 -0700 (PDT)
Subject: Re: ClientOriginIPAddress is 0.0.0.0 or ""
To: Ed Tanous <ed@tanous.net>, =?UTF-8?B?SnVuLUxpbiBDaGVuICjpmbPkv4rpnJYp?=
 <Jun-Lin.Chen@quantatw.com>
References: <HK0PR04MB3346AD905ABEB1250F51E202B1969@HK0PR04MB3346.apcprd04.prod.outlook.com>
 <HK0PR04MB3346A7C9EA60289912747398B1699@HK0PR04MB3346.apcprd04.prod.outlook.com>
 <CACWQX81k7NO-+8OyPhAbk9BNfB58xuK13RvHhG4m-G+nDHPniA@mail.gmail.com>
From: Sunitha Harish <sunithaharish04@gmail.com>
Message-ID: <d9176b8e-1944-e654-baea-81064f195d35@gmail.com>
Date: Fri, 9 Apr 2021 11:21:52 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CACWQX81k7NO-+8OyPhAbk9BNfB58xuK13RvHhG4m-G+nDHPniA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 06-04-2021 22:21, Ed Tanous wrote:
> On Tue, Mar 23, 2021 at 3:28 PM Jun-Lin Chen (陳俊霖)
> <Jun-Lin.Chen@quantatw.com> wrote:
>> Hi,
>>
>> If continously send POST sessions Redfish request via Postman. I observe bmcweb debug logs, it will established connection at first request then not fetch user ip after the second request.
>>
>>
>>
>> That's why ClientOriginIPAddress in session after the second created is always 0.0.0.0 (not be assigned).
>>
>>
>>
>> In HTTP 1.1 It uses keep-alive Header default. so BMC does not fetch user IP when its connection is established.
>>
>>
>>
>> Is this behavior we expect?
>>
>>
>>
>> Best regards,
>>
>> Jun-Lin Chen
>
> Sunitha,
> Considering this is code you wrote, would you mind replying to Jun-Lin
> about his experience and what the expected behavior is?  For what it's
> worth, I've seen it report 0.0.0.0 before on my system, I just haven't
> had a chance to chase it down and debug it.
>
> -Ed

Hi Jun-Lin,

The ClientOriginIPAddress is expected to get populated when the session 
is established to the BMC ( the first request). This is a one time 
fetch, and it will be persisted for that session.

Regards,
Sunitha
>>
>>
>> From: Jun-Lin Chen (陳俊霖)
>> Sent: Friday, March 5, 2021 4:05 PM
>> To: sunharis@in.ibm.com
>> Cc: openbmc@lists.ozlabs.org
>> Subject: ClientOriginIPAddress is 0.0.0.0 or ""
>>
>>
>>
>> Hi Sunitha,
>>
>>
>>
>> I found some problem when I create session.
>>
>> The property “ClientOriginIPAddress” is “” after POST https://${bmc}/login -d '{"username": <>,"password": <>}
>>
>> And it is 0.0.0.0 after POST https://${bmc}/redfish/v1/SessionService/Sessions -d '{"username": <>,"password": <>}'
>>
>> Both of them looked like something wrong. And I also look for source code in bmcweb repository.
>>
>> There only defined the default value: “” in generateUserSession() and not found fetch user ip in elsewhere.
>>
>> I think it is why ClientOriginIPAddress is strange.
>>
>>
>>
>> May I ask what step or something I lack in creation session so this property is abnormal?
>>
>>
>>
>>
>>
>> Best regards,
>>
>> Jun-Lin Chen
>>
>>
