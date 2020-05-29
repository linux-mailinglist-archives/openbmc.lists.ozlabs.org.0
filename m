Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BDE1E7BB9
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 13:27:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YMkL3pbtzDqd9
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 21:27:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uYcmJnbp; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YMjM3vgbzDqf9
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 21:27:01 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id s88so655538pjb.5
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 04:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=b3c++prNDqXZONjXt+ZmVI77JLgsoyI7xqOU/toLjIM=;
 b=uYcmJnbpSOlf0cFrww3OuYyE2ujSUQ5eefaQrT3i/D/pE/CpPX0o7CWw1WEQk1+Tib
 bN6LOQ6KzQqsWhQErByNSz5qpdxVys85SFy3hegrGUKSCnAKdhYs/qbQRShGeF05R8/S
 ll1wAb5boUCKz0APlHcovCCLcUgQXACAwDp9ifzzQUN27+y7YdoE7Hr1X6UmpOyiRY3y
 3E4j0755f+EFLUAHmP6qePN56+isBKFKD6mZ+AWkYHXcMbs9Ck/UUv+LSt2fXn9QHzv5
 B+faQMXB9+aAZR7lmB1zD/kFhxyY7ieQydgubp+2XfcAt1hpYBxzQIUNPp88t0pG9LOC
 aRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=b3c++prNDqXZONjXt+ZmVI77JLgsoyI7xqOU/toLjIM=;
 b=dPxpXvi6SCyCceBjBCpoUSP0SSLqwAn78o2bFahkDLdqzUST10ERtsd+iYP6cDEoG6
 U8wn45EAFnvv1BNAeaLo1KZQ5dx2skSwNEt24GeX5W1UqICSuhL8KL4yzGN/i95ViqFf
 fuGJ71BUx3b/ZDSxIiKCOwgcRWt6EXsHsLcZaASb1v0ctFMtfpbi8puI7+VrfGTM5CtX
 OQ0WnhwnMruMM6UJGqAE11S0xmBpixHgKrcGgAuJD9Q9uhZLYWuVdv1ni0oBfCZmTq3d
 phSnDpYcAwhbtwKJcFANvr8fLAO/i09gOCjM/YNEzQBR05COFYKpAWZTqxvUDej430Wp
 7Wwg==
X-Gm-Message-State: AOAM530IDicTU26DrKWDKt1M6FXUDeJh7nHjqnch1eRV9ZDmp1t0pNTa
 Xyx2nWq+kHr+0FtPEvlNPge1Ir3x
X-Google-Smtp-Source: ABdhPJw59U3F/9p5zSueXDgDA7iIlJMkOe2XcDD64QEfn3TRhgC2xRMqfUsQOO7QBZ0bqcUV5QGVEA==
X-Received: by 2002:a17:90a:734b:: with SMTP id
 j11mr8688275pjs.114.1590751618576; 
 Fri, 29 May 2020 04:26:58 -0700 (PDT)
Received: from ?IPv6:2405:204:5299:4617:91b8:7294:26a4:8fcf?
 ([2405:204:5299:4617:91b8:7294:26a4:8fcf])
 by smtp.gmail.com with ESMTPSA id e21sm6589948pga.71.2020.05.29.04.26.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 04:26:58 -0700 (PDT)
Subject: Re: Storing host data on the BMC
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>,
 Patrick Williams <patrick@stwcx.xyz>
References: <f4df91bd-d60c-5f4b-ef08-2e3fdd163b4e@linux.vnet.ibm.com>
 <843851ce-b802-05af-2949-c3aa828aead7@gmail.com>
 <ec87d606-9fa9-014a-bfa4-e56f94f6747e@linux.vnet.ibm.com>
 <342b5672-2adc-a6d1-f60a-085847d69584@gmail.com>
 <43685475-b4fb-6d09-a248-01a52ca382fa@gmail.com>
 <20200511120719.GA10214@heinlein>
 <0000b55c-29a9-b0fa-b72f-c4f19d4c7d12@gmail.com>
 <8db810a0-6bc4-5ad5-0f54-f739fe6dde81@gmail.com>
 <20200513211857.GA1166713@heinlein>
 <10275d64-bebd-cb33-0a16-21299b7b1880@linux.vnet.ibm.com>
 <20200514123350.GB1166713@heinlein>
 <7a159b9d-ec82-fed9-a9e1-23ffdf1c62e5@gmail.com>
 <534fbbca-ffe2-450d-b5e3-ef664c2a3729@gmail.com>
 <9de48a92-bb18-7c0f-0a68-68e9808a46d3@linux.vnet.ibm.com>
 <fb32d35b-2a58-3eea-38df-ab9f7bf641f8@gmail.com>
 <c9e6ab3e-e9f3-a58c-69c1-d830da6e5cf0@gmail.com>
 <42df1dd1-1c53-cdf1-a0cf-9cada6b5faff@linux.vnet.ibm.com>
From: Sunitha Harish <sunithaharish04@gmail.com>
Message-ID: <c5ea0cf8-1aba-c201-7fdf-1488e8501e6f@gmail.com>
Date: Fri, 29 May 2020 16:56:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <42df1dd1-1c53-cdf1-a0cf-9cada6b5faff@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 29-05-2020 16:33, Deepak Kodihalli wrote:
> On 29/05/20 4:27 pm, Sunitha Harish wrote:
>>
>> On 22-05-2020 09:29, Sunitha Harish wrote:
>>>
>>> On 21-05-2020 10:46, Deepak Kodihalli wrote:
>>>> On 21/05/20 10:42 am, Sunitha Harish wrote:
>>>>> Hi,
>>>>>
>>>>> Any inputs?
>>>>>
>>>>> Thanks & regards,
>>>>> Sunitha
>>>>
>>>> Hi Sunitha,
>>>>
>>>> I believe you had got a direction based on the discussion below.
>>>>
>>>>>>>> As far as Sunitha's question goes, my point is that not all host
>>>>>>>> firmware generated data is a BIOS attribute. For eg if the host 
>>>>>>>> tells me
>>>>>>>> about the presence of certain FRUs, or their functional states, I
>>>>>>>> wouldn't want to store those in the BIOS attributes backend, 
>>>>>>>> I'd rather
>>>>>>>> associates those with the existing D-Bus interfaces for the FRU
>>>>>>>> inventory. I think the same applies to the Origin property that 
>>>>>>>> has been
>>>>>>>> described - associate with the networking D-Bus backend.
>>>>>>> I think we're in agreement here.  Data which is interesting to 
>>>>>>> represent
>>>>>>> on the BMC, for which we already have a defined-interface, use 
>>>>>>> it.  For
>>>>>>> data which isn't interesting the to BMC, use the generic BIOS 
>>>>>>> attribute
>>>>>>> table.
>>>>
>>>> ^^ You use existing (or come up with new) D-Bus interfaces to 
>>>> represent your data. Those D-Bus interfaces can be implemented by 
>>>> settingsd or networkd or something else.
>>>
>>> If i am getting it correctly , the current changes which were made 
>>> to the phosphor-settings-manager should be good enough to handle all 
>>> the scenarios.
>>>
>>> In my last email i mentioned that ===>>
>>> -------------------------------------------------------------------------------------------------------------------------- 
>>>
>>> When the Ethernet interface set to be DHCP enabled ( by setting the 
>>> Bios attribute DHCPEnabled = true via redfish), the IPAddress, 
>>> SubnetMask and Gateway along with the Origin property will not be 
>>> Bios settings. Here the user setting is the DHCPEnabled property of ?
>>>
>>> However in the case of Static IP configuration(IPAddress, SubnetMask 
>>> and Gateway) they will become bios setting.
>>> --------------------------------------------------------------------------------------------------------------------------- 
>>>
>>> Currently we are using the xyz.openbmc_project.Network.IP and this 
>>> interface is being implemented by settings object - 
>>> https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-ibm/+/30424/
>>> Do you see any issue here?
>>
>> Hi , any feedback ?
>
> Sorry I forgot to respond to this. If your question is whether the 
> Origin property (and the interface it lies in) can be implemented by 
> phosphor-settingsd, then I think the answer is yes. We did say that we 
> can look at phosphor-settingsd as an arbitrary data holder (not 
> limited to user settings).

Thanks Deepak , So I believe now we can go ahead with the current 
implementation in the gerrit links :

https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-ibm/+/30205/
https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-ibm/+/30424/

Lets continue the review there for any further comments, and please 
provide your scores as well.

>
>> Thanks & regards,
>> Sunitha
>>>
>>>> Thanks,
>>>> Deepak
>>>>
>
