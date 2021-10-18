Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAD8431423
	for <lists+openbmc@lfdr.de>; Mon, 18 Oct 2021 12:11:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXt2F64rxz2yw2
	for <lists+openbmc@lfdr.de>; Mon, 18 Oct 2021 21:11:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jammy_huang@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXt1z4wzXz2yN4;
 Mon, 18 Oct 2021 21:11:17 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 19I9meJY075064;
 Mon, 18 Oct 2021 17:48:40 +0800 (GMT-8)
 (envelope-from jammy_huang@aspeedtech.com)
Received: from [192.168.2.115] (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 18 Oct
 2021 18:10:35 +0800
Message-ID: <8f20094e-506a-f03a-4dfc-669d7b0d19d8@aspeedtech.com>
Date: Mon, 18 Oct 2021 18:10:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/6] media: aspeed: Support aspeed mode to reduce
 compressed data
Content-Language: en-US
To: Paul Menzel <pmenzel@molgen.mpg.de>
References: <20211014034819.2283-1-jammy_huang@aspeedtech.com>
 <20211014034819.2283-5-jammy_huang@aspeedtech.com>
 <ddb1e6dc-6b4f-4f67-9122-dae3dab1ae65@molgen.mpg.de>
 <5675befe-48df-9f09-f30f-d407538ad070@aspeedtech.com>
 <5466798e-32c1-81f5-3428-7bbfe31cdea7@molgen.mpg.de>
From: Jammy Huang <jammy_huang@aspeedtech.com>
In-Reply-To: <5466798e-32c1-81f5-3428-7bbfe31cdea7@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 19I9meJY075064
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "andrew@aj.id.au" <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "eajames@linux.ibm.com" <eajames@linux.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Paul,

Thanks for your help.

On 2021/10/18 下午 05:34, Paul Menzel wrote:
> Dear Jammy,
>
>
> Am 18.10.21 um 10:51 schrieb Jammy Huang:
>
>> On 2021/10/14 下午 02:47, Paul Menzel wrote:
>>> Am 14.10.21 um 05:48 schrieb Jammy Huang:
>>>> aspeed support differential jpeg format which only compress the parts
>>> support*s*
>>>
>>>> which are changed. In this way, it reduces both the amount of data to be
>>>> transferred by network and those to be decoded on the client side.
>>> Please mention the datasheet name and revision and section, where this
>>> functionality is described.
>> Sorry but our datasheet is confidential. The basic idea of this
>> feature is that we can just compress the blocks which is different
>> with previous frame rather than full frame. This idea is similar to
>> the I & P frame in multimedia.
> It’s still good to have the name and revision of the datasheet, the code
> was developed against documented. (Public datasheets would be even
> better, also for review.)
You can reference to the datasheet of ast2600 revision 9 at section 36, 
Video Engine.

>
>>> Which chips support it?
>> AST2400/2500/2600 all support it.
>>>> 4 new ctrls are added:
>>>> *Aspeed JPEG Format: to control aspeed's partial jpeg on/off
>>>> *Aspeed Compression Mode: to control aspeed's compression mode
>>>> *Aspeed HQ Mode: to control aspeed's HQ mode on/off
>>>> *Aspeed HQ Quality: to control the quality of aspeed's HQ mode
>>> Please add a space after the bullet points.
>>>
>>> Excuse my ignorance, how can these options be controlled?
>> * Aspeed JPEG Format: to control jpeg format
>>     0: standard jpeg, 1: aspeed jpeg
>> * Aspeed Compression Mode: to control aspeed's compression mode
>>     0: DCT Only, 1: DCT VQ mix 2-color, 2: DCT VQ mix 4-color
>>     This is AST2400 only. It will adapt JPEG or VQ encoding method according
>>     to the context automatically.
>> * Aspeed HQ Mode: to control aspeed's HQ mode on/off
>>     0: disabled, 1: enabled
>> * Aspeed HQ Quality: to control the quality(0~11) of aspeed's HQ mode,
>>     only usefull if Aspeed HQ mode is enabled
> Thank you. So some sysfs file?
This is a v4l2 based driver, so I prefer to use v4l2 control interface 
rather than sysfs.
The user can iterate v4l2 control by V4L2_CTRL_FLAG_NEXT_CTRL to know 
what is
available. For example, the following is the information that 
aspeed_video driver supports

[User Controls                 ]
Aspeed JPEG Format             : type=1, minimum=0, maximum=2, step=1, 
default_value=0
Aspeed Compression Mode        : type=1, minimum=0, maximum=2, step=1, 
default_value=0
Aspeed HQ Mode                 : type=2, minimum=0, maximum=1, step=1, 
default_value=0
Aspeed HQ Quality              : type=1, minimum=0, maximum=11, step=1, 
default_value=0
[JPEG Compression Controls     ]
Chroma Subsampling             : type=3, minimum=0, maximum=2, step=1, 
default_value=0
Compression Quality            : type=1, minimum=0, maximum=11, step=1, 
default_value=0

>
>>>> Aspeed JPEG Format requires an additional buffer, called bcd, to store
>>>> the information that which macro block in the new frame is different
>>> s/that which/which/
>>>
>>>> from the old one.
>>>>
>>>> To have bcd correctly working, we need to swap the buffers for src0/1 to
>>>> make src1 refer to previous frame and src0 to the coming new frame.
>>> How did you test it? What do the clients need to support?
>>>
>>> Did you test, how much bandwidth is saved? Some numbers would be nice.
>> I tested it by aspeed's kvm client which support decoding the aspeed
>> format. Currently, I am porting this feature to novnc to have openbmc
>> support it.
> Nice.
>> The bandwidth saved is variant. It depends on how many blocks is
>> different between new and old frame.If the new frame is identical
>> with the previous one, the compressed frame only needs 12 Bytes.
> Thank you for the explanation.
>
>
> Kind regards,
>
> Paul
