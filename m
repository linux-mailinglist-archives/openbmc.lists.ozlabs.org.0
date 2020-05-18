Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F01E81D77FA
	for <lists+openbmc@lfdr.de>; Mon, 18 May 2020 13:54:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Qcqr0ScSzDqf5
	for <lists+openbmc@lfdr.de>; Mon, 18 May 2020 21:54:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=sunithaharish04@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Cns0sMk4; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Qcpm2LSwzDqBV
 for <openbmc@lists.ozlabs.org>; Mon, 18 May 2020 21:53:19 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id z1so4846883pfn.3
 for <openbmc@lists.ozlabs.org>; Mon, 18 May 2020 04:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=7RMesUi9y0sbsuE4k1fP40FIpTLY3L39E+RhvMXu8hg=;
 b=Cns0sMk4tYKR9xwDjxJ8Ne2R4DGFxMWihWmRxOyJLPDRX2PEHfe3gIuqHbU9vN4AJv
 atIam5uikDQUoDhZ1ZCNaahtmG48m+tWMyEsOUHbHL9t+sdNvirIBw+CA0u4PziMA/tB
 OMlxatVia79xTXITiNk4H+wJvpcOs4UNNCOnx9gbeuSLiETgZSQPo7s3yLUEnApyourN
 /Ns7LOlsOiz7diQqhCfP7EmshNuo4Di+g2uAoOvmNdw7xufOZIytlEBARLY1gtKQKCjz
 icwnaQ4O+YbGAXijwMbR2uutoK5RUSTM4oJQTJrsG3ssXW07DR5JQvvABDm0UDvJlICn
 LT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7RMesUi9y0sbsuE4k1fP40FIpTLY3L39E+RhvMXu8hg=;
 b=rqVT0NGvNR553Dkz4miIic0NpaTHGVxj3lcacR0/V0Z6OPKijcbhuubuHKFsPF329a
 FlfQR8ZF8yAdbRYiidKlOxvdvYZmsVvdcgAPaxSN140xXdAnp2nVG64jmRRHAOswtqiw
 j0lE2+NlCZMqu7tMMLget9w0/QcRRdoEzMkNdH8qm/eQxkHLIEX7CWgn7+SpgOUgd5Mh
 7aBRuvRmRMR7tNeld5Mv8W8Jmm2UJsAPmIXTZDzVR4qFNja6SaNso10onYze7AhbbUZf
 fhKUNhLGsAKtL3DMVjD464o73FisOIsc8qGY46IrrWONOvTcIcRi2MR2yfXXRz4aPZpE
 ycwg==
X-Gm-Message-State: AOAM532DfBCQ0GWKOo/XxuKYaIdEGcRSaMpunr8ckoVnzR7Ct3j8EfGc
 t7nRmxhik9Y0MuDIPCHNCt6V0e7W
X-Google-Smtp-Source: ABdhPJyoxLGA1/By/uibWlPZtcJx8hXAnWUAV5wF5ux9HyoLoolHKVDOEj4a/dF5buh75qAoGskt4w==
X-Received: by 2002:a62:8388:: with SMTP id h130mr6118883pfe.292.1589802794211; 
 Mon, 18 May 2020 04:53:14 -0700 (PDT)
Received: from ?IPv6:2405:204:5785:1f3:e0f7:7109:8397:cb77?
 ([2405:204:5785:1f3:e0f7:7109:8397:cb77])
 by smtp.gmail.com with ESMTPSA id c14sm7906990pgi.54.2020.05.18.04.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 04:53:13 -0700 (PDT)
Subject: Re: Storing host data on the BMC
To: Patrick Williams <patrick@stwcx.xyz>,
 Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
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
From: Sunitha Harish <sunithaharish04@gmail.com>
Message-ID: <7a159b9d-ec82-fed9-a9e1-23ffdf1c62e5@gmail.com>
Date: Mon, 18 May 2020 17:23:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514123350.GB1166713@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: openbmc <openbmc@lists.ozlabs.org>, dkodihal@in.ibm.com,
 suryakanth.sekar@linux.intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Deepak & Patrick.

So the preferred approach would be to define the host settable data in a 
new phosphor-host-inventory-manager, and make this as read-only to the 
other BMC applications.

The Interface: xyz.openbmc_project.Network.EthernetInterface - 
DHCPEnabled property is a Bios attribute. 
https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-ibm/+/30424/
Lets take a scenario - when the Ethernet interface set to be DHCP 
enabled ( by setting the DHCPEnabled = true via redfish), the IPAddress, 
SubnetMask and Gateway along with the Origin property will not be BIOS 
one as all they can't be settable by the redfish in the case of DHCP and 
they will be part of this new manager.

However in the case of Static IP configuration(IPAddress, SubnetMask and 
Gateway) will become bios setting.

Would we be having these attributes in both Bios table and in the new 
settings manager ?

By considering all these , can you please weigh in your thoughts about 
extending the existing settings interface table, by defining the 
attribute as read-only for BMC ? We can block the "write" to these 
attributes at user level. This would make things simpler , and it will 
be in line with the redfish interface definitions as well. Redfish 
already defines the schema where it makes some attributes read-only for 
the users.

Thanks & regards,
Sunitha


On 14-05-2020 18:03, Patrick Williams wrote:
> On Thu, May 14, 2020 at 09:13:47AM +0530, Deepak Kodihalli wrote:
>> On 14/05/20 2:48 am, Patrick Williams wrote:
>>> On Wed, May 13, 2020 at 08:37:32PM +0530, Sunitha Harish wrote:
>   
>> I think the current proposal from Surya enables this already. Do you
>> just mean the design doc should explicitly state this isn't restricted
>> to the "BIOS" firmware.
> Yep.
>
>> As far as Sunitha's question goes, my point is that not all host
>> firmware generated data is a BIOS attribute. For eg if the host tells me
>> about the presence of certain FRUs, or their functional states, I
>> wouldn't want to store those in the BIOS attributes backend, I'd rather
>> associates those with the existing D-Bus interfaces for the FRU
>> inventory. I think the same applies to the Origin property that has been
>> described - associate with the networking D-Bus backend.
> I think we're in agreement here.  Data which is interesting to represent
> on the BMC, for which we already have a defined-interface, use it.  For
> data which isn't interesting the to BMC, use the generic BIOS attribute
> table.
>
>>> If you are wanting the data to be managed, utilizing existing DBus
>>> interfaces we have around networking, doesn't phosphor-settingsd cover
>>> that from an implementation perspective?
>> I don't think the 'Origin' property is a setting.
> Well the name "settingsd" is somewhat arbitrary based on its original
> definition.  I believe the current implementation can make a placeholder
> instance of any dbus interface.
>
> Having said that, one weakness with settingsd is that you can't easily
> restrict property changes to data coming from the host.  Once you make a
> settingsd object, anyone can make dbus calls to change properties on it.
> If we want to be able to restrict that to specific interfaces, we might
> want to look at a phosphor-inventory-manager like implementation which
> has a special "backdoor" method to create / update the instances but
> prevents modification through the normal property change interfaces.
>
