Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA540332C72
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 17:44:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw1JQ6Ndbz3cT3
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 03:44:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.93; helo=mga11.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw1JD4vlwz3cGg;
 Wed, 10 Mar 2021 03:44:11 +1100 (AEDT)
IronPort-SDR: xZX/zArzqBZ/mHQ6G+BX5d0V1Pjh4sphzqqDPg88gwGPsZga/KIoBNTRDX09I4guvQsmdYv627
 Ozw5cLbW1eaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="184913647"
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; d="scan'208";a="184913647"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 08:44:07 -0800
IronPort-SDR: tLqRxPfsQ4ayHmwBHR9QmVWRZcMJ+Gv44Fw9E8vQNISMoxrr47qKaTsANVlJd2yN/QFcziNzKt
 dASRy4EaMOKg==
X-IronPort-AV: E=Sophos;i="5.81,236,1610438400"; d="scan'208";a="409806959"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.251.3.100])
 ([10.251.3.100])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 08:44:06 -0800
Subject: Re: [PATCH 3/3] aspeed-video: add COMP_READY to VE_SPURIOUS_IRQS
To: Joel Stanley <joel@jms.id.au>, Zev Weiss <zev@bewilderbeest.net>,
 Ryan Chen <ryan_chen@aspeedtech.com>
References: <20201215024542.18888-1-zev@bewilderbeest.net>
 <20201215024542.18888-4-zev@bewilderbeest.net>
 <CACPK8XdAfYaAPeyDL4nsG+04xgr-u3+CQKNNdpHAQb4vG7=54g@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <e2f23365-53c6-3526-4544-7d36300c2bea@linux.intel.com>
Date: Tue, 9 Mar 2021 08:43:58 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdAfYaAPeyDL4nsG+04xgr-u3+CQKNNdpHAQb4vG7=54g@mail.gmail.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Eddie James <eajames@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/21/2020 8:49 PM, Joel Stanley wrote:
> On Tue, 15 Dec 2020 at 02:46, Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> This joins CAPTURE_COMPLETE and FRAME_COMPLETE in the set of interrupts
>> that have been seen asserted by the hardware even when disabled, leading
>> to the interrupt eventually getting disabled as described in commit
>> 65d270acb2d662c3346793663ac3a759eb4491b8.
>>
>> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> 
> I have less experience with this part of the chip, so I defer to Jae
> or Ryan for an ack.

I didn't see unexpected VE_INTERRUPT_COMP_READY events in my system but
it seems a fix good to have.

Acked-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

>> ---
>>   drivers/media/platform/aspeed-video.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index 218aae3be809..48c52bf91a1b 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -564,7 +564,8 @@ static void aspeed_video_irq_res_change(struct aspeed_video *video, ulong delay)
>>    * register.
>>    */
>>   #define VE_SPURIOUS_IRQS \
>> -       (VE_INTERRUPT_CAPTURE_COMPLETE | VE_INTERRUPT_FRAME_COMPLETE)
>> +       (VE_INTERRUPT_CAPTURE_COMPLETE | VE_INTERRUPT_FRAME_COMPLETE \
>> +        | VE_INTERRUPT_COMP_READY)
>>
>>   static irqreturn_t aspeed_video_irq(int irq, void *arg)
>>   {
>> --
>> 2.29.2
>>
