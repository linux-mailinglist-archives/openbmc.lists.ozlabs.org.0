Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8DE25E52
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 08:53:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4583Hc4bmLzDqNT
	for <lists+openbmc@lfdr.de>; Wed, 22 May 2019 16:53:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.33.251.173; helo=1.mo69.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 1.mo69.mail-out.ovh.net (1.mo69.mail-out.ovh.net
 [178.33.251.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4583H765TxzDqJK
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 16:52:47 +1000 (AEST)
Received: from player698.ha.ovh.net (unknown [10.108.54.156])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 03A445907C
 for <openbmc@lists.ozlabs.org>; Wed, 22 May 2019 08:14:12 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 0B9F360243BE;
 Wed, 22 May 2019 06:14:08 +0000 (UTC)
Subject: Re: [PATCH qemu] aspeed: add support for a witherspoon-bmc board with
 128MB flash chip
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20190516161148.31062-1-clg@kaod.org>
 <005d7fc6-ce77-4209-b37e-5aaefb066ebf@www.fastmail.com>
 <f1bb8a3f-7e98-7b13-2ccc-1b58262e9bde@kaod.org>
 <10007aac-28a5-47d7-be66-a8f9cd4941b1@www.fastmail.com>
 <CACPK8Xe4b9MvdendfEbN3LAxaaSC0V6V56FzvuFPpPruCXqQXw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3fff6467-4167-3b23-07b0-77329df511a8@kaod.org>
Date: Wed, 22 May 2019 08:14:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe4b9MvdendfEbN3LAxaaSC0V6V56FzvuFPpPruCXqQXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16768027315277302664
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudduuddguddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/22/19 7:37 AM, Joel Stanley wrote:
> On Mon, 20 May 2019 at 00:56, Andrew Jeffery <andrew@aj.id.au> wrote:
>>
>>
>>
>> On Fri, 17 May 2019, at 15:56, Cédric Le Goater wrote:
>>> On 5/17/19 1:00 AM, Andrew Jeffery wrote:
>>>>
>>>>
>>>> On Fri, 17 May 2019, at 01:42, Cédric Le Goater wrote:
>>>>> Some Witherspoon boards are shipped with a mt25ql01g flash chip
>>>>> holding the BMC firmware.
>>>>>
>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>>
>>>> "witherspoon128-bmc" is not very creative, but I can't blame you for that :D
>>>
>>> he.
>>>
>>> Should we introduce a machine option to set the model name of the
>>> FMC flash chip ? I think I tried that in the past but at the block
>>> level and mainline did not like it. But we could try at the machine
>>> level.
>>>
>>> Anyhow, it's a good way to debug flash issues on real HW.
>>
>> Eh. I'm not fussed by a new machine. I wouldn't do anything for the moment.
> 
> We could instead add a swift machine with the 128MB NOR. When we get a
> model for the SD/MMC it would use that too.

OK. That's a good direction. 

C.
