Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B9452B187
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 06:34:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L30Vt2Dbqz3cCZ
	for <lists+openbmc@lfdr.de>; Wed, 18 May 2022 14:33:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L30VZ6ldZz3bcj
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2022 14:33:40 +1000 (AEST)
Received: from [172.24.65.115] (edu241124.nat.uni-leipzig.de [139.18.241.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 4DAF361EA192A;
 Wed, 18 May 2022 06:33:34 +0200 (CEST)
Message-ID: <564c41fe-08cc-9c19-1506-c7b501458251@molgen.mpg.de>
Date: Wed, 18 May 2022 06:33:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v9 2/3] dt-bindings: edac: nuvoton: add NPCM memory
 controller
Content-Language: en-US
To: Medad Young <medadyoung@gmail.com>
References: <20220510031056.1657-1-ctcchien@nuvoton.com>
 <20220510031056.1657-3-ctcchien@nuvoton.com>
 <8d46eeb8-7926-f842-6105-1975a5adc3fe@molgen.mpg.de>
 <CAHpyw9cvrEKMUpRBWYWp9hDZgA8ALHBkNAQr6ZDqjj4uH-MRTQ@mail.gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <CAHpyw9cvrEKMUpRBWYWp9hDZgA8ALHBkNAQr6ZDqjj4uH-MRTQ@mail.gmail.com>
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
 Benjamin Fair <benjaminfair@google.com>,
 linux-edac <linux-edac@vger.kernel.org>, KFTING <KFTING@nuvoton.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>,
 YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Medad,


Am 16.05.22 um 04:30 schrieb Medad Young:

> Paul Menzel 於 2022年5月10日 週二 下午2:14寫道：

>> Am 10.05.22 um 05:10 schrieb Medad CChien:
>>> Document devicetree bindings for the Nuvoton BMC NPCM memory controller.
>>>
>>> Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> ---
>>>    .../edac/nuvoton,npcm-memory-controller.yaml  | 61 +++++++++++++++++++
>>>    1 file changed, 61 insertions(+)
>>>    create mode 100644 Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
>>> new file mode 100644
>>> index 000000000000..6f37211796a3
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/edac/nuvoton,npcm-memory-controller.yaml
>>> @@ -0,0 +1,61 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/edac/nuvoton,npcm-memory-controller.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Nuvoton NPCM Memory Controller
>>> +
>>> +maintainers:
>>> +  - Medad CChien <ctcchien@nuvoton.com>
>>
>> Just a side note, that in my experience functional like
>> <linux-npcm-memory-controller@nuvoton.com> instead of personal addresses
>> are useful, as you can configure on your side, who to deliver messages
>> to. For example, if you are on sick leave or vacation, you just
>> configure to deliver the message to a colleague of yours (or they get
>> messages in the first place anyway).
>>
>> Maybe you can bring that up at Nuvoton.
> 
> I understand, but we do not have group email  address.
> so maybe I should add more maintainers?

If there are actually more maintainers, responsible and knowledgeable 
for that driver, than yes, these should be added (until you get a 
function address set up).


Kind regards,

Paul
