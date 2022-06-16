Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1198054E59B
	for <lists+openbmc@lfdr.de>; Thu, 16 Jun 2022 17:03:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP5646ZWNz3brF
	for <lists+openbmc@lfdr.de>; Fri, 17 Jun 2022 01:03:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KRUEUBUy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KRUEUBUy;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP55c0m8bz3bfC;
	Fri, 17 Jun 2022 01:03:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=eXP8JImYusYVmz1XFgz6F/idOIpZUqokxeO9uXWtnWI=; b=KRUEUBUyuLXtfTp3+c4njGOSw9
	vEDot6VYfqIJ01TjLkccAS9FePTHekgVapd/ZzYWPmXEXA+RSFIUCXgcE4i50W6m4fCnG86csGQyX
	2fPfw/RqUdF4HEmx4JlxDoLwTB0EWagiVnntZpQaqWknDkJxM4E1QP0tjaadRQit0B1awN3dL+OZu
	ZsZePFuAxZdy2RY5zt1kIpOlK2HQCMVQRqiaBTPCUQZRHL01dW8Ib9Xq+0BcfW1mwxgzWyFa88QqN
	FSAPYfcU9mx5op4/SWDy3jKI0BU4lwAqlSxpSWdiQOCvm8mzCemKd14GlH1PVzlSGikdp93WSV3Ok
	ZbnXZCJA==;
Received: from [2601:1c0:6280:3f0::aa0b]
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1r0x-008RS8-4P; Thu, 16 Jun 2022 15:02:32 +0000
Message-ID: <fb8e7e35-7f26-15bc-9fbb-2949fc80a18b@infradead.org>
Date: Thu, 16 Jun 2022 08:02:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 1/3] ipmi: ssif_bmc: Add SSIF BMC driver
Content-Language: en-US
To: Quan Nguyen <quan@os.amperecomputing.com>, Corey Minyard
 <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Wolfram Sang <wsa@kernel.org>, openipmi-developer@lists.sourceforge.net,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
References: <20220615090259.1121405-1-quan@os.amperecomputing.com>
 <20220615090259.1121405-2-quan@os.amperecomputing.com>
 <8b7841a9-9313-b1d5-8a80-a65cfa8e7b4d@infradead.org>
 <74f94464-a095-f539-746a-853b8f1d52ca@os.amperecomputing.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <74f94464-a095-f539-746a-853b8f1d52ca@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Open Source Submission <patches@amperecomputing.com>, "Thang Q . Nguyen" <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 6/16/22 00:25, Quan Nguyen wrote:
> On 15/06/2022 23:06, Randy Dunlap wrote:
>>
>>
>> On 6/15/22 02:02, Quan Nguyen wrote:
>>> diff --git a/drivers/char/ipmi/Kconfig b/drivers/char/ipmi/Kconfig
>>> index b061e6b513ed..18a89093d64e 100644
>>> --- a/drivers/char/ipmi/Kconfig
>>> +++ b/drivers/char/ipmi/Kconfig
>>> @@ -169,6 +169,17 @@ config ASPEED_BT_IPMI_BMC
>>>         found on Aspeed SOCs (AST2400 and AST2500). The driver
>>>         implements the BMC side of the BT interface.
>>>   +config SSIF_IPMI_BMC
>>> +    tristate "SSIF IPMI BMC driver"
>>> +    select I2C
>>
>> No. That should be:
>>     depends on I2C
>>
>> We don't select an entire subsystem just to satisfy one driver.
>>
>>> +    select I2C_SLAVE
>>> +    help
>>> +      This enables the IPMI SMBus system interface (SSIF) at the
>>> +      management (BMC) side.
>>> +
>>> +      The driver implements the BMC side of the SMBus system
>>> +      interface (SSIF).
>>> +
>>
>> Thanks.
> 
> Thanks Randy,
> it should be change to "depends on I2C && I2C_SLAVE"

Either way is OK for I2C_SLAVE AFAIK.

thanks.

-- 
~Randy
