Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D24BE1DDE7E
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 06:00:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49St7W1BjKzDqwy
	for <lists+openbmc@lfdr.de>; Fri, 22 May 2020 14:00:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=FYnG3J5n; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49St6j5nhRzDqwy
 for <openbmc@lists.ozlabs.org>; Fri, 22 May 2020 13:59:57 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id n11so4362869pgl.9
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 20:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=C3P3W9teSoP3QsYb+JAbwVhTAhoVxbJJry4kjsyopJY=;
 b=FYnG3J5noIlqsOOM2Iis3Hd++qSbTjsAvo3TjaEM8S6btc7pokvneBOj2lOGv5NPR6
 px6D5XZHuMHk9YUgHJz7dFKH5tPBBECKXtI85CcoLxTkgFtVe7Mb8q1E/35oJyx/V8j6
 GpBfvpnNfk9TlXx03/XqT0tpHMKqVWfX3582J161QGdhCaGsvmlL+kl5op9ixUITpIzB
 P5QUWqTCDxbZxfIiCs63iUYnDhg/IkYbtUWSObjJcjJ3pAQhCDOMttj090U/1LqkuC6M
 vEfpihGNKuiblT2e+BHU/yQj9bCZAY9OeY7TQUQL8KTCBSiiWKQU6mJmzJD5eYDR2gyF
 9KkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=C3P3W9teSoP3QsYb+JAbwVhTAhoVxbJJry4kjsyopJY=;
 b=P/V9NldyeIWYF1/0JHxgDRZJV4ZPimqB6D2qZikIJTTb786lcVQKNVKxQ/DGSLfewd
 omfBVRDT+JXES43bO99n4u5uUwBgyTR9ZJYw56jeSANsUW7Mgy2fQrZgg9aGk4Z7X2ey
 r2qUAToIlqUtLypzseVtiq1dCH0ewjElV+LDkKMdPm/d31HXw6FaI4JPWEZy75lBw5n1
 GgWMB6zw5HPMYrtpOhrBBGwu3DMPcF9L1U0LXxwctsdwG9VEHXpKpvnHdEXfKWBs8+rl
 fXHKi9la9fr7CHpvm2yyzfnsHP6l0HhiQnbDmxuYGPmCf6CyacDmZx85URrtc6AMB/Qw
 SOmg==
X-Gm-Message-State: AOAM530sag+j1GxJhiS6mdfEaY/Bd62yGNiV/hvutrUdi+UffBqoAc5F
 csgiw84Vx/tahqv45g1e5s+hwg2F
X-Google-Smtp-Source: ABdhPJxzWcugLSWXNrtw4O4OjZ9/8rgyHzDjde+kIe5MCFdfiBXMjKwQ2W7BZvs0Cx/vvMClC+bUtw==
X-Received: by 2002:a17:90b:882:: with SMTP id
 bj2mr1975493pjb.186.1590119993186; 
 Thu, 21 May 2020 20:59:53 -0700 (PDT)
Received: from ?IPv6:2409:4071:e12:ff20:8947:ea38:969d:ee83?
 ([2409:4071:e12:ff20:8947:ea38:969d:ee83])
 by smtp.gmail.com with ESMTPSA id e18sm5741280pfh.75.2020.05.21.20.59.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 20:59:52 -0700 (PDT)
From: Sunitha Harish <sunithaharish04@gmail.com>
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
Message-ID: <fb32d35b-2a58-3eea-38df-ab9f7bf641f8@gmail.com>
Date: Fri, 22 May 2020 09:29:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <9de48a92-bb18-7c0f-0a68-68e9808a46d3@linux.vnet.ibm.com>
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


On 21-05-2020 10:46, Deepak Kodihalli wrote:
> On 21/05/20 10:42 am, Sunitha Harish wrote:
>> Hi,
>>
>> Any inputs?
>>
>> Thanks & regards,
>> Sunitha
>
> Hi Sunitha,
>
> I believe you had got a direction based on the discussion below.
>
>>>>> As far as Sunitha's question goes, my point is that not all host
>>>>> firmware generated data is a BIOS attribute. For eg if the host 
>>>>> tells me
>>>>> about the presence of certain FRUs, or their functional states, I
>>>>> wouldn't want to store those in the BIOS attributes backend, I'd 
>>>>> rather
>>>>> associates those with the existing D-Bus interfaces for the FRU
>>>>> inventory. I think the same applies to the Origin property that 
>>>>> has been
>>>>> described - associate with the networking D-Bus backend.
>>>> I think we're in agreement here.  Data which is interesting to 
>>>> represent
>>>> on the BMC, for which we already have a defined-interface, use it.  
>>>> For
>>>> data which isn't interesting the to BMC, use the generic BIOS 
>>>> attribute
>>>> table.
>
> ^^ You use existing (or come up with new) D-Bus interfaces to 
> represent your data. Those D-Bus interfaces can be implemented by 
> settingsd or networkd or something else.

If i am getting it correctly , the current changes which were made to 
the phosphor-settings-manager should be good enough to handle all the 
scenarios.

In my last email i mentioned that ===>>
--------------------------------------------------------------------------------------------------------------------------
When the Ethernet interface set to be DHCP enabled ( by setting the Bios 
attribute DHCPEnabled = true via redfish), the IPAddress, SubnetMask and 
Gateway along with the Origin property will not be Bios settings. Here 
the user setting is the DHCPEnabled property of ?

However in the case of Static IP configuration(IPAddress, SubnetMask and 
Gateway) they will become bios setting.
---------------------------------------------------------------------------------------------------------------------------
Currently we are using the xyz.openbmc_project.Network.IP and this 
interface is being implemented by settings object - 
https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-ibm/+/30424/
Do you see any issue here?

> Thanks,
> Deepak
>
