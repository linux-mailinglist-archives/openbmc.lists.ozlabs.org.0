Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28B3156A1
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 20:18:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZt3956jkzDsfT
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 06:18:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZt2B0gcxzDqZV;
 Wed, 10 Feb 2021 06:17:36 +1100 (AEDT)
IronPort-SDR: mjbGMUtRu8bAAmv8kbFOSC1DEmaseeiz4sWWlYNXCXfh+EUuFDbCebtAA6rzoQQpl3HtDyS/Ea
 veRKAkN1WUHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="243438293"
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; d="scan'208";a="243438293"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 11:17:31 -0800
IronPort-SDR: MxO/TaNgsO9MJwQeVuSDeZorgw79f/mE+ATgYIh8UIY00h59Mhp7oCFKPPRQQErfUUviuKCn6m
 NrxcRfEOV2Jg==
X-IronPort-AV: E=Sophos;i="5.81,166,1610438400"; d="scan'208";a="375068802"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.209.39.4])
 ([10.209.39.4])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 11:17:30 -0800
Subject: Re: [PATCH v2 1/4] dt-bindings: i2c: aspeed: add buffer and DMA mode
 transfer support
To: Joel Stanley <joel@jms.id.au>
References: <20210112003749.10565-1-jae.hyun.yoo@linux.intel.com>
 <20210112003749.10565-2-jae.hyun.yoo@linux.intel.com>
 <20210114193416.GA3432711@robh.at.kernel.org>
 <4f67358e-58e5-65a5-3680-1cd8e9851faa@linux.intel.com>
 <CACPK8XcZTE=bnCP1-E9PTA09WnXG9Eduwx0dm-QqmQJUDa_OrQ@mail.gmail.com>
 <1814b8d1-954c-0988-0745-e95129079708@linux.intel.com>
 <87ed4085-26e4-98f8-21e3-b1e3c16b0891@linux.intel.com>
 <CACPK8XekihpoXEeyUbWSXsRkVMbX1gKG-gSeYgWq=s3UR2gi1g@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <3cb75f5e-43d8-a06c-5149-e69823728325@linux.intel.com>
Date: Tue, 9 Feb 2021 11:17:29 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XekihpoXEeyUbWSXsRkVMbX1gKG-gSeYgWq=s3UR2gi1g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 devicetree <devicetree@vger.kernel.org>, Cedric Le Goater <clg@kaod.org>,
 Tao Ren <taoren@fb.com>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/9/2021 4:10 AM, Joel Stanley wrote:
> On Wed, 3 Feb 2021 at 23:03, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> Hi Joel
>>
>> On 1/28/2021 11:36 AM, Jae Hyun Yoo wrote:
>>> Hi Joel
>>>
>>> On 1/27/2021 4:06 PM, Joel Stanley wrote:
>>>>>> All this information doesn't need to be in the binding.
>>>>>>
>>>>>> It's also an oddly structured dts file if this is what you are doing...
>>>>>
>>>>> I removed the default buffer mode settings that I added into
>>>>> 'aspeed-g4.dtsi' and 'aspeed-g5.dtsi' in v1 to avoid touching of the
>>>>> default transfer mode setting, but each bus should use its dedicated
>>>>> SRAM buffer range for enabling buffer mode so I added this information
>>>>> at here as overriding examples instead. I thought that binding document
>>>>> is a right place for providing this information but looks like it's not.
>>>>> Any recommended place for it? Is it good enough if I add it just into
>>>>> the commit message?
>>>>
>>>> I agree with Rob, we don't need this described in the device tree
>>>> (binding or dts). We know what the layout is for a given aspeed
>>>> family, so the driver can have this information hard coded.
>>>>
>>>> (Correct me if I've misinterpted here Rob)
>>>>
>>>
>>> Makes sense. Will add these settings into the driver module as hard
>>> coded per each bus.
>>>
>>
>> Realized that the SRAM buffer range setting should be added into device
>> tree because each bus module should get the dedicated IO resource range.
>> So I'm going to add it to dtsi default reg setting for each I2C bus
>> and will remove this description in binding. Also, I'll add a mode
>> setting property instead to keep the current setting as byte mode.
> 
> I don't understand. What do you propose adding?
> 

I'm going to add reg resource for the SRAM buffer per each bus like

reg = <0x40 0x40>, <0x800 0x80>;

into the aspeed-g*.dtsi but adding like this will not be a key for
enabling buffer mode like this v2 does. Also, I'm going to remove the
'aspeed,dma-buf-size' in this patch series and I'll add fixed DMA length
as a configuration per each SoC. Instead, I'm going to add a xfer mode
property e.g. 'aspeed,i2c-xfer-mode' to select 'byte', 'buffer' or 'dma'
modes.

Thanks,
Jae
