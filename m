Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B7E69EC3F
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 02:15:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLyrP1xYwz303P
	for <lists+openbmc@lfdr.de>; Wed, 22 Feb 2023 12:15:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=ksjWfUD7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=dphadke@linux.microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=ksjWfUD7;
	dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLyqj2LfGz300C;
	Wed, 22 Feb 2023 12:14:41 +1100 (AEDT)
Received: from [192.168.87.25] (unknown [50.35.78.176])
	by linux.microsoft.com (Postfix) with ESMTPSA id 33E7320B9C3D;
	Tue, 21 Feb 2023 17:14:07 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 33E7320B9C3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1677028447;
	bh=YTkfcoTrsyGUhPbAsJNW1hFtxJhcxATFUQJzQJ+E840=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ksjWfUD7hL4lluKkN4pyotZAcfERPzfs3CXBvbcHi0Lo+wPjs33I5/pVstNjH2kls
	 q0vfgIXT9nM0kXJiEpsfRXOeOPz9TtJ1UY3OuEK7kN2aV/k9BZrA2waNzRTCKhOztW
	 1fe+pTK6b/qVT5wvs7gFyCbTFooPdzbctJdO2q/g=
Message-ID: <d0f8d17a-bdcb-7554-b96c-99226d013fe6@linux.microsoft.com>
Date: Tue, 21 Feb 2023 17:14:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/2] dt-bindings: i2c: Add support for ASPEED i2Cv2
Content-Language: en-US
To: Ryan Chen <ryan_chen@aspeedtech.com>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230220061745.1973981-1-ryan_chen@aspeedtech.com>
 <20230220061745.1973981-2-ryan_chen@aspeedtech.com>
 <2141e513acc750bf26775f5b435f4dccd41244aa.camel@codeconstruct.com.au>
 <TYZPR06MB5274714E58C319B4FE3B6E1BF2A49@TYZPR06MB5274.apcprd06.prod.outlook.com>
 <dfc2c2c442af55f64e147c920585cb7e6a74939f.camel@codeconstruct.com.au>
 <TYZPR06MB527469EBE6A18B897D2C1F6CF2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
From: Dhananjay Phadke <dphadke@linux.microsoft.com>
In-Reply-To: <TYZPR06MB527469EBE6A18B897D2C1F6CF2A59@TYZPR06MB5274.apcprd06.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 2/20/2023 7:32 PM, Ryan Chen wrote:
>>>>> +  timeout:
>>>>> +    type: boolean
>>>>> +    description: Enable i2c bus timeout for master/slave (35ms)
>>>>> +
>>>>> +  byte-mode:
>>>>> +    type: boolean
>>>>> +    description: Force i2c driver use byte mode transmit
>>>>> +
>>>>> +  buff-mode:
>>>>> +    type: boolean
>>>>> +    description: Force i2c driver use buffer mode transmit
>>>>
>>>> These three aren't really a property of the hardware, more of the
>>>> intended driver configuration. Do they really belong in the DT?
>>>>
>>> Sorry, I am confused.
>>> This is hardware controller mode setting for each i2c transfer.
>>> So I add it in property for change different i2c transfer mode.
>>> Is my mis-understand the property setting?
>>
>> It depends what this is configuration is for.
>>
>> Would you set the transfer mode based on the design of the board? Is there
>> something about the physical i2c bus wiring (or some other hardware design
>> choice) that would mean you use one setting over another?
>>
> No, it not depend on board design. It is only for register control for controller transfer behave.
> The controller support 3 different trigger mode for transfer.
> Byte mode: it means step by step to issue transfer.
> Example i2c read, each step will issue interrupt then driver need trigger for next step.
> Sr (start read) | D | D | D | P
> Buffer mode: it means, the data can prepare into buffer register, then Trigger transfer. So Sr D D D P, only have only 1 interrupt handling.
> The DMA mode most like with buffer mode, The differ is data prepare in DRAM, than trigger transfer.
> 
> 

Unless these settings like xfer mode are per i2c bus, it could be just a
module parameter? Not sure anything other than default mode would be
used if DMA mode works for all master/slave transactions.

Regards,
Dhananjay


