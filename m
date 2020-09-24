Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B16C27685B
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 07:22:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxk2b6kGxzDqYq
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 15:22:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q7TBwqph; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxk1p2SjgzDqNv
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 15:22:06 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id f1so1021469plo.13
 for <openbmc@lists.ozlabs.org>; Wed, 23 Sep 2020 22:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Rs21U6MOLOA1rt3ug9vYXZ8mpVda9dv7Oe7SKOK/3EU=;
 b=q7TBwqphv7A1qNQu5Y/NBg8VtoOjIZEo0nJT9138iIy6C7eHv7RzJInKbReGnl3n9P
 ct3n9muTrjQUbcDAB3SJ88glOexKyaJMtdcggZeqNUin7XOee7aLCAdAIzr7ylKpjUvR
 QxM3gsBA5UF6zaqyxLglY1hXKT/FlVkyw3u2485xS0kXQBSRiI5q0sI404K1NJl2Oyl9
 vWcLebBAlwh+jY4av/WsauzUb+UvG4kI3jXo8qkdzJHKc5VQAinNKkKrMtqYsWo5OOIv
 AzIbBrjFRnA3e7c1wIxupL0jq9zC1aUxkiPRqstbMjAnnHLEO/+FBwpWW8QHF4Axj1zg
 diqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Rs21U6MOLOA1rt3ug9vYXZ8mpVda9dv7Oe7SKOK/3EU=;
 b=Fdjo/vddhAlpnAbooJ7j/F0JYk0rxuH4JncQGAkh6PnOwh4LMQaYZqIX+yqYUgWJ7N
 adWNUJ19BlxKz9r7EjZx3uDX/jNzX96lUIojKq3guyWKoVt5C5bPiC8EWeqZih93a71h
 2xo5KusWYlTM7+ije4TgtxZMlrp7h2D7U3++Ruhq6E7IwO+rQqvIKIz3yjEYBcxAxtsw
 fn/HTdsPjqiBbzsgPGCvEiV/4yIPDKZGZ31+TJC9oqkajTIUY7tg0uRkgK437DzKUfO4
 hB5LmTzw+xZms46i9Gyqfci28nPrTx++faD8GJNscsBLFaiYxrMS0FCmzq69pQaP0OJo
 hBXg==
X-Gm-Message-State: AOAM531Jizdg+3+Bi/Fnt3qoQD/PzbaIv7UYevcLiuD1G2OJI8D95wpV
 RvtGCVaAQMegViCgnzSYgXZ6CQ91lKoCiA==
X-Google-Smtp-Source: ABdhPJw0NP51GHGJwU4xvLiQOYOjR7O/nlOM9tO4t0Sf3o7OkFsKnFvJNqeJ8EMV1TqzJjjcoCuutw==
X-Received: by 2002:a17:902:ab83:b029:d2:5727:ec8 with SMTP id
 f3-20020a170902ab83b02900d257270ec8mr2935714plr.39.1600924922304; 
 Wed, 23 Sep 2020 22:22:02 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.106.201])
 by smtp.gmail.com with ESMTPSA id u67sm1412705pgu.12.2020.09.23.22.22.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2020 22:22:02 -0700 (PDT)
Subject: Re: bmcweb : https client support
To: "Puli, Apparao" <apparao.puli@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>
References: <5c93d1fa-102b-61a1-1dd8-4a371d7c2a2a@gmail.com>
 <84607e86-b9f9-cf02-9971-71df98878b85@gmail.com>
 <41d3b0a0-f9c4-84e5-ed0a-be83b78383d5@linux.intel.com>
From: Sunitha Harish <sunithaharish04@gmail.com>
Message-ID: <bd59d7c2-50e3-9785-3334-35336257d677@gmail.com>
Date: Thu, 24 Sep 2020 10:51:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <41d3b0a0-f9c4-84e5-ed0a-be83b78383d5@linux.intel.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Apparao,

Thanks for the reply.
I have already pushed some rework on this commit - seeing no reply from 
you. I will continue the debug on the async_resolve and keep pushing the 
work which i am able to get done on this commit.

Please see if you can provide your feedback on the rework and comments.

Thanks & regards,
Sunitha

On 24-09-2020 10:18, Puli, Apparao wrote:
> Hi Sunitha,
>
>    Firstly I am sorry for late response.
>
> Its in my back log list. At the moment, I switched to other priority 
> activities and i am afraid i can get to this in next couple weeks. I 
> am planning to resume this mid of next month and address the concerns 
> which ED raised(Majorly Keep alive implementation, Resolving address 
> using async call). Happy to see if you would like to contribute 
> (Mainly on keep alive connection and async resolve).
>
> Thanks,
>
> -Appu
>
> On 9/15/2020 11:49 AM, Sunitha Harish wrote:
>> Hi Apparao,
>>
>> Any information on this? We are looking for this change with high 
>> priority.
>>
>> Thanks & regards,
>> Sunitha
>>
>>
>> On 11-09-2020 17:03, Sunitha Harish wrote:
>>> Hi Apparao,
>>>
>>> This is about the https client support at bmcweb. Commit: 
>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/31735/. IBM 
>>> is interested in this commit. We have a use-case requiring the 
>>> redfish client to be able to subscribe for event notifications over 
>>> secure channel.
>>>
>>> Can you please share your plan to get this commit to the master? Do 
>>> you have plans to implement the client certificate support as well ?
>>>
>>> Thanks & regards,
>>> Sunitha
>>>
>>>
>>>
