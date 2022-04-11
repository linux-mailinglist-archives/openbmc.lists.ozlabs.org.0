Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CE64FB5AF
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 10:12:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcM6X1Mr4z3bbv
	for <lists+openbmc@lfdr.de>; Mon, 11 Apr 2022 18:12:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcM6H1Z6tz2xF0
 for <openbmc@lists.ozlabs.org>; Mon, 11 Apr 2022 18:12:38 +1000 (AEST)
Received: from [192.168.0.2] (ip5f5ae91f.dynamic.kabel-deutschland.de
 [95.90.233.31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7A71061EA1923;
 Mon, 11 Apr 2022 10:12:32 +0200 (CEST)
Message-ID: <ccf4d29e-9efb-23ea-b706-f00cde7ead4b@molgen.mpg.de>
Date: Mon, 11 Apr 2022 10:12:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 1/3] ARM: dts: nuvoton: Add memory controller node
Content-Language: en-US
To: Medad Young <medadyoung@gmail.com>
References: <20220322030152.19018-1-ctcchien@nuvoton.com>
 <20220322030152.19018-2-ctcchien@nuvoton.com>
 <c73bf178-f5bd-01c6-209d-051706112877@molgen.mpg.de>
 <CAHpyw9ckLUNe8biEFSjHBndG_WD-7O-QsHO8Rr0eoXbROH0dUQ@mail.gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <CAHpyw9ckLUNe8biEFSjHBndG_WD-7O-QsHO8Rr0eoXbROH0dUQ@mail.gmail.com>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>, linux-edac@vger.kernel.org,
 KFTING@nuvoton.com, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 JJLIU0@nuvoton.com, ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>,
 YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Medad,


Thank you for your reply.

Am 11.04.22 um 09:56 schrieb Medad Young:

[…]

> Paul Menzel 於 2022年4月9日 週六 下午1:57寫道：

>> Thank you for the patch.
>>
>> Am 22.03.22 um 04:01 schrieb Medad CChien:
>>> ECC must be configured in the BootBlock header.
>>
>> bootblock
>>
>> I search for *bootblock* in Linux and the git commit messages, and does
>> not seem to be a common term. Is that term used in the datasheet?
> 
> Yes, bootblock is a bootloader of our SOC

Nice. Never heard of it before. Maybe add the project URL as reference 
for the ignorant like me.

>>> Then, you can read error counts via
>>> the EDAC kernel framework.
>>
>> Please reflow for 75 characters per line. (Also, there is no need to
>> break lines after a sentence, unless 75 characters are reached or a new
>> paragraph starts.)
>>
>> Tested on what board?
> 
> I tested this on Nuvoton's BMC board

It would be nice to have that with the model number documented in the 
commit message.

>>> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
>>
>> Out of curiosity, is the first C in CChien the letter of your middle
>> name, or the last name really spelled with two capital letters in the
>> beginning?
> 
> this is a special last name in chinese.
> my last name does really spell with two capital letters in the beginning.

Interesting. Thank you for teaching me new things.


Kind regards,

Paul
