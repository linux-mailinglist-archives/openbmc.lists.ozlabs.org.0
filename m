Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1130E1D18ED
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 17:17:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MdZB71fSzDqWS
	for <lists+openbmc@lfdr.de>; Thu, 14 May 2020 01:17:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i1WEAEtF; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MdMY3FRCzDqNR
 for <openbmc@lists.ozlabs.org>; Thu, 14 May 2020 01:07:52 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id e6so11104852pjt.4
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 08:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=W1IT0gh7vi5WJ2GKf2UQzz9IPJvrM9R4+ia7z+tKNDQ=;
 b=i1WEAEtFB33L+aIT4TfjrItCUK8c0YGmJdYYBzsuA6+kPQy7mUC56EPHkjobyXIiRe
 F3k7wXUuGVtzJr+6tY9tOCpiSgXK6MAz/XJO0cSL5lW1xNtsjMhwyOVffPKzJGsDVIAI
 nZetjHcA8+DkRRN/05EiNF1CXB9s7UNNnBqKmOvRI9SmUIpef1lnG0r+9ksk4VmX4ONk
 tBZC/kLY6RgefV3AXWihlLU2iUjZYB/WCvId6NGGmqCvtkHVUl45mON8KEaY76mETn1T
 Uv7R9dUMol5J/xrfRuAFf6FJUwWLT3bqLkAcR1ezBi3vUh1GzBvyJL5hlnsDC/6Glqla
 ysPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=W1IT0gh7vi5WJ2GKf2UQzz9IPJvrM9R4+ia7z+tKNDQ=;
 b=tdeIxuj0+LuWqryaO8S0Jbeeh7Nk4J26yiJpMHw2pHDUNk0oCrDnV/Dz49tOV+aPfA
 D6qSbSVvUUa7RvU4c1QBwiTnJvriCD0bCio8EtTsefJLFz47VhNycnFC6UNjeF0JIvVY
 6gw/topE3qmz79cc7LJB5wELElxUwtXPSRAAqoSJEscu4J0p9+BWnGgWVDaKu+IpmF24
 9sLshxKVHyEbCqE+1M7FjPRNCB6Bem04e0fI16WzZfAVlF51FZQoOBVgKknLBGvXYWM9
 UK/46RbFqq/SnvBSyBtg1R06MoY5F7w80ujyZjAnsHCUmOQKS6G1y9uPuv2NWyerowTu
 PKlA==
X-Gm-Message-State: AGi0PuaaxYhKfqPY44eWPd/Ra9ne/ZoE/Ri0NMu6xSE+zwJTPVvpLqX3
 y2hfiaSUYhERiw1qOzoQX28bWAs0eg0=
X-Google-Smtp-Source: APiQypK8OIYYiN6gykZ2+yUOAzzqrFi8mu3EqYubvKFk8hxGMlzvqzcapdG4DZVL9YUImjcWqqXJjg==
X-Received: by 2002:a17:90a:2843:: with SMTP id
 p3mr33433462pjf.204.1589382462261; 
 Wed, 13 May 2020 08:07:42 -0700 (PDT)
Received: from ?IPv6:2405:204:560d:598d:c50d:71a9:ad3:2adc?
 ([2405:204:560d:598d:c50d:71a9:ad3:2adc])
 by smtp.gmail.com with ESMTPSA id v189sm4388928pfv.176.2020.05.13.08.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 08:07:41 -0700 (PDT)
Subject: Re: Storing host data on the BMC
From: Sunitha Harish <sunithaharish04@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
References: <CADeuMvXQfS01sdwpiM+POkaqdVesj64XGDqPWAPreo_TPbuV8A@mail.gmail.com>
 <f4df91bd-d60c-5f4b-ef08-2e3fdd163b4e@linux.vnet.ibm.com>
 <843851ce-b802-05af-2949-c3aa828aead7@gmail.com>
 <ec87d606-9fa9-014a-bfa4-e56f94f6747e@linux.vnet.ibm.com>
 <342b5672-2adc-a6d1-f60a-085847d69584@gmail.com>
 <43685475-b4fb-6d09-a248-01a52ca382fa@gmail.com>
 <20200511120719.GA10214@heinlein>
 <0000b55c-29a9-b0fa-b72f-c4f19d4c7d12@gmail.com>
Message-ID: <8db810a0-6bc4-5ad5-0f54-f739fe6dde81@gmail.com>
Date: Wed, 13 May 2020 20:37:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <0000b55c-29a9-b0fa-b72f-c4f19d4c7d12@gmail.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, dkodihal@in.ibm.com,
 suryakanth.sekar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Patrick/Surya,

Seems to me that the design which Intel proposed does not cover the 
scenario which i was mentioning about.

My scenario is :
1. Redfish client sets the host interface parameters for the IPv4 
address. These user settable values are stored in the DBus.
2. When the system is powered on , the pldm reads these DBus values , 
and sets the BIOS attributes.
3. The hypervisor reads this BIOS attributes for the interfaces and sets 
them.
4. Now the hypervisor sends an indication to the pldm that the IP 
address is active at its interface and its Origin is Static ( ie : user 
configured) OR it is DHCP ( ie: not user configured, if its DHCP enabled)
5. The pldm should store this Origin value "somewhere".

Redfish client would need this value to interpret where the IP address 
has been Originated from. So we need a DBus property to save it. But , 
this is actually an attribute which is set by the hypervisor/host - a 
pldm sensor. Its not suitable to be fit into the BIOS table. My 
question&proposal is about how/where to store this value?

Thanks & regards,
Sunitha


On 11-05-2020 21:35, Sunitha Harish wrote:
> Hi Patrick,
>
> Thanks for sharing the pointers. I was aware that there was work going 
> on in this area. So was looking for your and Surya's inputs on this.
>
> I will go through these designs from my use-case perspective.
>
> Thanks & regards,
> Sunitha
>
>
> On 11-05-2020 17:37, Patrick Williams wrote:
>> Hello Sunitha,
>>
>> Intel has already made significant progress on this problem domain and
>> we seem to be fairly converged on the design direction [1,2]. Have you
>> read through their design proposal?  Are there any oversights in their
>> design that would affect your needs?
>>
>> Their design has been on-going for months now.  I don't think it is
>> appropriate to start from scratch on the design discussions unless there
>> is something fundamentally broken about their direction.
>>
>> 1. https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/29320
>> 2. 
>> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-dbus-interfaces/+/18242
>>
>> I thought there was even some implementation started in bmcweb for this
>> feature.
>>
>> On Mon, May 11, 2020 at 11:44:35AM +0530, Sunitha Harish wrote:
>>> Hi,
>>>
>>> Gentle reminder for the feedback.
>>>
>>> Thanks & regards,
>>> Sunitha
>>>
>>> On 06-05-2020 12:53, Sunitha Harish wrote:
>>>> Hi Deepak,
>>>>
>>>> Please suggest which other approach you think is better here for
>>>> Origin attribute?
>>>>
>>>> When the interface is set as DHCPEnabled=true ; similar to the Origin
>>>> attribute , the IP address, SubnetMask and Gateway will be set by the
>>>> host. So we would need to consider this usecase also as a candidate
>>>> for the new approach.
>>>>
>>>> Thanks & regards,
>>>> Sunitha
>>>>
>>>>
>>>> On 05-05-2020 12:29, Deepak Kodihalli wrote:
>>>>> On 05/05/20 12:12 pm, Sunitha Harish wrote:
>>>>>> Hi Deepak,
>>>>>>
>>>>>> As mentioned , the Origin is the property which will be set by the
>>>>>> host once the IP address is applied to its interface. Its a
>>>>>> read-only property for the out-of-band user. But its a closely
>>>>>> coupled - related attribute on the host setting/BIOS object.
>>>>> Hi Sunitha,
>>>>>
>>>>> What I'm trying to say is - we shouldn't make this coupling. The BIOS
>>>>> settings table is a group of attributes that can alter the default
>>>>> behavior of the host firmware. The Origin property you describe
>>>>> doesn't fit that description.
>>>>>
>>>>> The host "sets" several things for the BMC, for eg the host firmware
>>>>> can tell us functional/presence states of FRUs which the host has
>>>>> access to. Everything that the host "sets" this way isn't a BIOS
>>>>> attribute. Once you decouple this, I believe we can think about
>>>>> options other than the two you have suggested - since both of them
>>>>> involve making the Origin property seem like a BIOS attribute, which
>>>>> it clearly is not.
>>>>>
>>>>> Thanks,
>>>>> Deepak
