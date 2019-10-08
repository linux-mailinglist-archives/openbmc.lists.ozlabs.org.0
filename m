Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41135D038B
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 00:46:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nssD2zl2zDqRG
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 09:46:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nsrY6vpfzDqLX;
 Wed,  9 Oct 2019 09:45:48 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 15:45:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,272,1566889200"; d="scan'208";a="187447543"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148])
 ([10.7.153.148])
 by orsmga008.jf.intel.com with ESMTP; 08 Oct 2019 15:45:33 -0700
Subject: Re: [PATCH 3/5] i2c: aspeed: fix master pending state handling
To: Tao Ren <taoren@fb.com>, Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>
References: <20191007231313.4700-1-jae.hyun.yoo@linux.intel.com>
 <20191007231313.4700-4-jae.hyun.yoo@linux.intel.com>
 <422eea61-7cb9-e471-83fb-3f554ff5e079@fb.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <6f280195-eef7-1fe7-ac42-ad6879ca9838@linux.intel.com>
Date: Tue, 8 Oct 2019 15:45:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <422eea61-7cb9-e471-83fb-3f554ff5e079@fb.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tao,

On 10/8/2019 3:00 PM, Tao Ren wrote:
> On 10/7/19 4:13 PM, Jae Hyun Yoo wrote:
>> In case of master pending state, it should not trigger the master
>> command because this H/W is sharing the same data buffer for slave
>> and master operations, so this commit fixes the issue with making
>> the master command triggering happen when the state goes to active
>> state.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   drivers/i2c/busses/i2c-aspeed.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index fa66951b05d0..40f6cf98d32e 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -336,18 +336,19 @@ static void aspeed_i2c_do_start(struct aspeed_i2c_bus *bus)
>>   	struct i2c_msg *msg = &bus->msgs[bus->msgs_index];
>>   	u8 slave_addr = i2c_8bit_addr_from_msg(msg);
>>   
>> -	bus->master_state = ASPEED_I2C_MASTER_START;
>> -
>>   #if IS_ENABLED(CONFIG_I2C_SLAVE)
>>   	/*
>>   	 * If it's requested in the middle of a slave session, set the master
>>   	 * state to 'pending' then H/W will continue handling this master
>>   	 * command when the bus comes back to the idle state.
>>   	 */
>> -	if (bus->slave_state != ASPEED_I2C_SLAVE_INACTIVE)
>> +	if (bus->slave_state != ASPEED_I2C_SLAVE_INACTIVE) {
>>   		bus->master_state = ASPEED_I2C_MASTER_PENDING;
>> +		return;
>> +	}
>>   #endif /* CONFIG_I2C_SLAVE */
>>   
>> +	bus->master_state = ASPEED_I2C_MASTER_START;
>>   	bus->buf_index = 0;
>>   
>>   	if (msg->flags & I2C_M_RD) {
>> @@ -432,7 +433,7 @@ static u32 aspeed_i2c_master_irq(struct aspeed_i2c_bus *bus, u32 irq_status)
>>   		if (bus->slave_state != ASPEED_I2C_SLAVE_INACTIVE)
>>   			goto out_no_complete;
>>   
>> -		bus->master_state = ASPEED_I2C_MASTER_START;
>> +		aspeed_i2c_do_start(bus);
>>   	}
> 
> Shall we move the restart-master logic from master_irq to bus_irq? The reason being:
> master transaction cannot be restarted when aspeed-i2c is running in slave state and
> receives STOP interrupt, because aspeed_i2c_master_irq won't be called in this case.

Even in that case, master can be restarted properly because slave_irq
will be called first because master is in MASTER_PENDING state, so the
slave_irq handles the STOP interrupt as well, and then master_irq will
be called with SLAVE_INACTIVE state so the aspeed_i2c_do_start can be
called eventually.

Also, this is right point to call the aspeed_i2c_do_start
because master state will be changed to MASTER_START by the
aspeed_i2c_do_start and we have to do remaining handling for the
MASTER_START in the master_irq by falling through after the call.

Thanks,

Jae
