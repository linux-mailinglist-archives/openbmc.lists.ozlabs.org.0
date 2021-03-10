Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0E633423A
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 16:55:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwcB11mnbz3cWd
	for <lists+openbmc@lfdr.de>; Thu, 11 Mar 2021 02:55:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwc9p1nHmz30L6;
 Thu, 11 Mar 2021 02:55:41 +1100 (AEDT)
IronPort-SDR: /mGZ6p59HnIOyUKJMzXuiJiUKwf/e7NN6zBA0sY98qKNRp9tCH+Y2aMFJ467+KpHg7kKHfKXFQ
 3cJOliEInT1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="187858184"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="187858184"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 07:55:39 -0800
IronPort-SDR: /6eKFr8ry0VtVGJOb9d9xQK0rmfnthDtnNFQFohYpPLs8T52s8cLX5JG5QSF0oavx6e+jiVGji
 c5CtbcZkhVEg==
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; d="scan'208";a="447943096"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.212.177.249])
 ([10.212.177.249])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 07:55:38 -0800
Subject: Re: [PATCH v4 1/4] dt-bindings: i2c: aspeed: add transfer mode support
To: Rob Herring <robh@kernel.org>
References: <20210224191720.7724-1-jae.hyun.yoo@linux.intel.com>
 <20210224191720.7724-2-jae.hyun.yoo@linux.intel.com>
 <20210306203011.GA1152769@robh.at.kernel.org>
 <f6732348-d6c8-f49b-6123-afe542bb1f8c@linux.intel.com>
 <CAL_Jsq+H2wCyTKhGcQvgiuyMtGW0hytQgw=948q0JGLSLOo9KA@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f1811747-3826-215a-d822-85170303a7c9@linux.intel.com>
Date: Wed, 10 Mar 2021 07:55:38 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAL_Jsq+H2wCyTKhGcQvgiuyMtGW0hytQgw=948q0JGLSLOo9KA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 Andrew Jeffery <andrew@aj.id.au>, Tao Ren <taoren@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux I2C <linux-i2c@vger.kernel.org>, Cedric Le Goater <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/9/2021 6:15 PM, Rob Herring wrote:
> On Tue, Mar 9, 2021 at 10:02 AM Jae Hyun Yoo
> <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> Hi Rob,
>>
>> On 3/6/2021 12:30 PM, Rob Herring wrote:
>>> On Wed, Feb 24, 2021 at 11:17:17AM -0800, Jae Hyun Yoo wrote:
>>>> Append bindings to support transfer mode.
>>>>
>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
>>>> ---
>>>> Changes since v3:
>>>> - None
>>>>
>>>> Changes since v2:
>>>> - Moved SRAM resources back to default dtsi and added mode selection
>>>>     property.
>>>>
>>>> Changes since v1:
>>>> - Removed buffer reg settings from default device tree and added the settings
>>>>     into here to show the predefined buffer range per each bus.
>>>>
>>>>    .../devicetree/bindings/i2c/i2c-aspeed.txt    | 37 +++++++++++++++----
>>>>    1 file changed, 30 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>>> index b47f6ccb196a..242343177324 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
>>>> @@ -17,6 +17,20 @@ Optional Properties:
>>>>    - bus-frequency    : frequency of the bus clock in Hz defaults to 100 kHz when not
>>>>                 specified
>>>>    - multi-master     : states that there is another master active on this bus.
>>>> +- aspeed,i2c-xfer-mode      : should be "byte", "buf" or "dma" to select transfer
>>>> +                      mode defaults to "byte" mode when not specified.
>>>> +
>>>> +                      I2C DMA mode on AST2500 has these restrictions:
>>>> +                        - If one of these controllers is enabled
>>>> +                            * UHCI host controller
>>>> +                            * MCTP controller
>>>> +                          I2C has to use buffer mode or byte mode instead
>>>> +                          since these controllers run only in DMA mode and
>>>> +                          I2C is sharing the same DMA H/W with them.
>>>> +                        - If one of these controllers uses DMA mode, I2C
>>>> +                          can't use DMA mode
>>>> +                            * SD/eMMC
>>>> +                            * Port80 snoop
>>>
>>> How does one decide between byte or buf mode?
>>
>> If a given system makes just one byte r/w transactions most of the time
>> then byte mode will be a right setting. Otherwise, buf mode is more
>> efficient because it doesn't generate a bunch of interrupts on every
>> byte handling.
> 
> Then why doesn't the driver do byte transactions when it gets small
> 1-4? byte transactions and buffer transactions when it gets larger
> sized transactions.

Good question and it could be an option of this implementation.
Actually, each mode needs different register handling so we need to add
additional conditional branches to make it dynamic mode change depends
on the data size which can be a downside. Also, checked that small
amount of data transfer efficiency in 'buf' transfer mode is almost same
to 'byte' mode so there would be no big benefit from the dynamic mode
change. Of course, we can remove the 'byte' transfer mode but we should
also provide flexibility of configuration on what this hardware can
support, IMO.

Thanks,
Jae
