Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 836961CD1B9
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 08:15:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49L9f62p7QzDqTs
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 16:15:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AIF457dc; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49L9dJ0dMGzDqP2
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 16:14:43 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id g11so270343plp.1
 for <openbmc@lists.ozlabs.org>; Sun, 10 May 2020 23:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=9pCEUg6fHAu6oO+EDHx2UubxXrOWCT30wwg/g5FtxR8=;
 b=AIF457dcQi+gCyGew+LNUEhh2AvuBRIa91BnGFgjs+Yz/Yhy/qVhYpiTV/kJCTqxQ9
 IV7Wu97ql3BF68/0ETfgvdS7LPkSzQtf64tMZA3Bo+xMOaOK2BxTMACy0Lv/L773XFkZ
 /CtEhkX7xERs9zmDYgTjEF4EmgR/UctEN5vceZy44D2eMo7D4/QLH4otUxM+9yJoZkFI
 Pf3+9H7F3/TTbfxK9GYC2cTuqd6ZwTTUeJUnLwyemWfzfeAM1zn8tpVA96deCN6t4MaA
 Gn7bxMVR+365P3ogvHXcYPjLUHyjLeDUmF9Rs+kTPg6CFm/eeFLD0klUqVUw8DCYNjLd
 nPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9pCEUg6fHAu6oO+EDHx2UubxXrOWCT30wwg/g5FtxR8=;
 b=NpfVYTR/0u6DgZt0yAYBjD/Wj63jJiEdyjlM9KrRvRdJM5rwnl1ySwpyeQIF+Xs/Ju
 0hTCk2526QSmbIxO7hnNH8hRaKrRDdxjVk22otmQDoHB/xipmbP3sQhR9jQhsvsDa11M
 TPcByAMQKTkRSu96oYlPukb+Ev4bCw436My957NEPs+fsD58Xb5kTrWHZfGUYBnXOrYK
 JFrPEXYzVEVHWObSYUwGy7lEsLIVCYaeKfqfoFsADdZxkmWKi4sPfCLNjv6HmIhVhrhJ
 vL6peETXMxAKa2v9neG8JAvD3UK8uhQWHqnRnuxBeyxpvCdqMlpxlkTnwyn59A8PLhf6
 OK9w==
X-Gm-Message-State: AGi0PuZLK8mvnzD/W9XUi45mmR03O7kHOh5eZ9zd+qEDOKRUc3HqXx/q
 tin0nBFs7yb94SvNAarYDvi8JN+F
X-Google-Smtp-Source: APiQypKJ7yikAviKupONrof+41AFDRWlNp33xnjZc9lqHPF8ghMoy0M4nVGPI3w8B75/tmoGVRqBkA==
X-Received: by 2002:a17:90a:4d07:: with SMTP id
 c7mr12121755pjg.70.1589177679584; 
 Sun, 10 May 2020 23:14:39 -0700 (PDT)
Received: from ?IPv6:2409:4071:2106:da58:9822:2e57:128a:590e?
 ([2409:4071:2106:da58:9822:2e57:128a:590e])
 by smtp.gmail.com with ESMTPSA id p19sm8922159pjv.30.2020.05.10.23.14.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 May 2020 23:14:38 -0700 (PDT)
Subject: Re: Storing host data on the BMC
From: Sunitha Harish <sunithaharish04@gmail.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>, patrick@stwcx.xyz,
 dkodihal@in.ibm.com, suryakanth.sekar@linux.intel.com,
 openbmc <openbmc@lists.ozlabs.org>
References: <CADeuMvXQfS01sdwpiM+POkaqdVesj64XGDqPWAPreo_TPbuV8A@mail.gmail.com>
 <f4df91bd-d60c-5f4b-ef08-2e3fdd163b4e@linux.vnet.ibm.com>
 <843851ce-b802-05af-2949-c3aa828aead7@gmail.com>
 <ec87d606-9fa9-014a-bfa4-e56f94f6747e@linux.vnet.ibm.com>
 <342b5672-2adc-a6d1-f60a-085847d69584@gmail.com>
Message-ID: <43685475-b4fb-6d09-a248-01a52ca382fa@gmail.com>
Date: Mon, 11 May 2020 11:44:35 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <342b5672-2adc-a6d1-f60a-085847d69584@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

Gentle reminder for the feedback.

Thanks & regards,
Sunitha

On 06-05-2020 12:53, Sunitha Harish wrote:
> Hi Deepak,
>
> Please suggest which other approach you think is better here for 
> Origin attribute?
>
> When the interface is set as DHCPEnabled=true ; similar to the Origin 
> attribute , the IP address, SubnetMask and Gateway will be set by the 
> host. So we would need to consider this usecase also as a candidate 
> for the new approach.
>
> Thanks & regards,
> Sunitha
>
>
> On 05-05-2020 12:29, Deepak Kodihalli wrote:
>> On 05/05/20 12:12 pm, Sunitha Harish wrote:
>>> Hi Deepak,
>>>
>>> As mentioned , the Origin is the property which will be set by the 
>>> host once the IP address is applied to its interface. Its a 
>>> read-only property for the out-of-band user. But its a closely 
>>> coupled - related attribute on the host setting/BIOS object.
>>
>> Hi Sunitha,
>>
>> What I'm trying to say is - we shouldn't make this coupling. The BIOS 
>> settings table is a group of attributes that can alter the default 
>> behavior of the host firmware. The Origin property you describe 
>> doesn't fit that description.
>>
>> The host "sets" several things for the BMC, for eg the host firmware 
>> can tell us functional/presence states of FRUs which the host has 
>> access to. Everything that the host "sets" this way isn't a BIOS 
>> attribute. Once you decouple this, I believe we can think about 
>> options other than the two you have suggested - since both of them 
>> involve making the Origin property seem like a BIOS attribute, which 
>> it clearly is not.
>>
>> Thanks,
>> Deepak
