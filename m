Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DAA1DCB13
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 12:31:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SQrz27mhzDqmJ
	for <lists+openbmc@lfdr.de>; Thu, 21 May 2020 20:31:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rcAbrHCm; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SQr46sYGzDqfH
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 20:30:44 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id y18so3115307pfl.9
 for <openbmc@lists.ozlabs.org>; Thu, 21 May 2020 03:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=uH8Ujp7iw0I2mLh8PrbjQaBJVBPg+z8X8iasxqgZvdw=;
 b=rcAbrHCmlZdFGszWzBmzZsnAoUBQ2T/WoDMu1xrTef723hhlyhXRJHa8ZKX3ibbQ1u
 1j2uSPvbHcMbyybB6c9P4zrmJ8QNuAVnYmx8Y2flS7x4dBKU8WXLhNQJMXkafr0Ux8Zb
 MlXtKT8aozDRa21QuO7AagfyHjpgvDvxVc5ESMDNnDAOpQFQapbeJ+ExWMs+S+DCiBEM
 9XlUI6KOpUxdJnzyvnz5lqILvN6Viz+9yRv4JM1xPJnVAxSu65P7U6gWawQFSTTk5cGQ
 sAD/uwCD6POwGfz86MWf2wgXRQZuXM80bsDrhSG26nxc2cSMu5ExDDr0GdHJQb2TPbYG
 TIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=uH8Ujp7iw0I2mLh8PrbjQaBJVBPg+z8X8iasxqgZvdw=;
 b=m8Vm6BWdIsOBVBpMLUlMUsCA1XKr8b7ACdvFjjpi9QH6ONhQldayOkU9PZr5Ov7SsX
 g0dj8M5zFCLDUQtDoCrKhY5RpNx7ANAWqc4pYtW05PX3eAZDRBS8Q3aP78PCAk5qUh2k
 vA6R5M4PifK9Hp90Wwnwjl6oleZpC0PTXMkDNt8Do393ILX3KVKwt+5FJcttFBCoRlVb
 ACUI0Id1TgQax9HdopDUJKUGLUt1UksJL7+BAj+YZXDcrfVl+7v7jI7cQz8XlvexUcmP
 bQGgbgc/AUtdacoonDlT4H2+sXU+217ZWEwhehP81y+o0cvtF5U6qcfyLdcMZa36fXo3
 iVkg==
X-Gm-Message-State: AOAM5309nsEI7MNtYvd/Bjtg149hfnlMjMThu0ErLtARZEt/V5BcZ8dF
 /r+4QqVd6XWAcLJglHItLwDaw9a0
X-Google-Smtp-Source: ABdhPJxYGaQtgCHENsC3PLnnWGiNDCugJUhvItTDsYcTwZW8gusOH8guitvBFiDf8iA3Fu5h4PcIdQ==
X-Received: by 2002:a62:ab04:: with SMTP id p4mr8970706pff.254.1590057040171; 
 Thu, 21 May 2020 03:30:40 -0700 (PDT)
Received: from [192.168.1.100] ([106.206.78.207])
 by smtp.gmail.com with ESMTPSA id d2sm4170883pfa.164.2020.05.21.03.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 May 2020 03:30:39 -0700 (PDT)
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
From: Sunitha Harish <sunithaharish04@gmail.com>
Message-ID: <ee4ac345-def8-5c33-c7e7-c8189dc8b733@gmail.com>
Date: Thu, 21 May 2020 16:00:13 +0530
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
the user will be setting the DHCPEnabled property.
However in the case of Static IP configuration(IPAddress, SubnetMask and 
Gateway) they will become bios setting.
---------------------------------------------------------------------------------------------------------------------------
Currently we are using the xyz.openbmc_project.Network.IP and this 
interface is being implemented by settings object - 
https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-ibm/+/30424/

Do you see any issues here?


> Thanks,
> Deepak
>
