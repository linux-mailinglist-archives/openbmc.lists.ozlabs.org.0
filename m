Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE2FDF7CD
	for <lists+openbmc@lfdr.de>; Mon, 21 Oct 2019 23:58:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xrB216ZLzDqL4
	for <lists+openbmc@lfdr.de>; Tue, 22 Oct 2019 08:58:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xr974lkYzDqKs;
 Tue, 22 Oct 2019 08:57:46 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Oct 2019 14:57:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,325,1566889200"; d="scan'208";a="209472729"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143])
 ([10.7.153.143])
 by orsmga002.jf.intel.com with ESMTP; 21 Oct 2019 14:57:43 -0700
Subject: Re: [PATCH i2c-next 1/2] dt-bindings: i2c: aspeed: add hardware
 timeout support
To: Peter Rosin <peda@axentia.se>, Brendan Higgins
 <brendanhiggins@google.com>, Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, Cedric Le Goater <clg@kaod.org>
References: <20191021202414.17484-1-jae.hyun.yoo@linux.intel.com>
 <20191021202414.17484-2-jae.hyun.yoo@linux.intel.com>
 <0a629f7b-b829-c332-27d8-dc825205ff72@axentia.se>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <7abf933b-cb18-10af-9c1b-163ec65ffae5@linux.intel.com>
Date: Mon, 21 Oct 2019 14:57:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0a629f7b-b829-c332-27d8-dc825205ff72@axentia.se>
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Peter,

On 10/21/2019 2:05 PM, Peter Rosin wrote:
> On 2019-10-21 22:24, Jae Hyun Yoo wrote:
>> Append a binding to support hardware timeout feature.
>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   Documentation/devicetree/bindings/i2c/i2c-aspeed.txt | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>> index b47f6ccb196a..133bfedf4cdd 100644
>> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>> @@ -17,6 +17,8 @@ Optional Properties:
>>   - bus-frequency	: frequency of the bus clock in Hz defaults to 100 kHz when not
>>   		  specified
>>   - multi-master	: states that there is another master active on this bus.
>> +- aspeed,hw-timeout-ms	: Hardware timeout in milliseconds. If it's not
>> +			  specified, the H/W timeout feature will be disabled.
>>   
>>   Example:
>>   
>>
> 
> Some SMBus clients support a smbus-timeout-disable binding for disabling
> timeouts like this, for cases where the I2C adapter in question on occasion
> is unable to keep the pace. Adding that property thus avoids undesired
> timeouts when the client is SMBus conformant without it. Your new binding
> is the reverse situation, where you want to add a timeout where one is
> otherwise missing.
> 
> Anyway, since I2C does not have a specified lowest possible frequency, this
> feels like something that is more in the SMBus arena. Should the property
> perhaps be a generic property named smbus-timeout-ms, or something like
> that?

Well, I tried upstreaming of the generic timeout property a year ago but
I agreed that the generic bus timeout property can be set by an ioctl
command so it didn't need to be added into device tree at that time. Not
sure if any need has come recently but I haven't heard that. This driver
still uses the generic timeout property which is provided by i2c core
for handling command timeouts, and it's out of scope from this patch
series.

> If the above is not wanted or appropriate, then I would personally prefer
> aspeed,bus-timeout-ms over aspeed,hw-timeout-ms. To me, hw-timeout-ms sounds
> like a (more serious) timeout between the CPU and the I2C peripheral unit
> or something like that. But I don't care deeply...

Changes I submitted in this patch set is for a different purpose which
is very Aspeed H/W specific, and actually it's a more serious timeout
setting indeed. If this H/W is used in multi-master environment, it
could meet a H/W hang that freezes itself in slave mode and it can't
escape from the state. To resolve the specific case, this H/W provides
self-recovery feature which monitors abnormal state of SDA, SCL and its
H/W state machine using the timeout setting to determine the escape
condition.

Generally, this H/W timeout value is smaller than the generic bus
timeout value (I'm using 300ms for the H/W timeout while I'm using 1
second for the generic bus timeout) so I think it should be
distinguished from the generic bus timeout.

Thanks,

Jae
