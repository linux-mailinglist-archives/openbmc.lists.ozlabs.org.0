Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACCA2783B
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 10:40:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458jdN0WYGzDqY3
	for <lists+openbmc@lfdr.de>; Thu, 23 May 2019 18:40:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.51.53; helo=5.mo178.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4198 seconds by postgrey-1.36 at bilbo;
 Thu, 23 May 2019 18:39:27 AEST
Received: from 5.mo178.mail-out.ovh.net (5.mo178.mail-out.ovh.net
 [46.105.51.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458jbg3R8pzDqZn
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 18:39:23 +1000 (AEST)
Received: from player797.ha.ovh.net (unknown [10.109.143.225])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id B895568F33
 for <openbmc@lists.ozlabs.org>; Thu, 23 May 2019 08:11:28 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player797.ha.ovh.net (Postfix) with ESMTPSA id AFC7E62DAFD3;
 Thu, 23 May 2019 06:11:22 +0000 (UTC)
Subject: Re: [PATCH qemu] aspeed: add support for a witherspoon-bmc board with
 128MB flash chip
To: Adriana Kobylak <anoo@linux.ibm.com>, Joel Stanley <joel@jms.id.au>
References: <20190516161148.31062-1-clg@kaod.org>
 <005d7fc6-ce77-4209-b37e-5aaefb066ebf@www.fastmail.com>
 <f1bb8a3f-7e98-7b13-2ccc-1b58262e9bde@kaod.org>
 <10007aac-28a5-47d7-be66-a8f9cd4941b1@www.fastmail.com>
 <CACPK8Xe4b9MvdendfEbN3LAxaaSC0V6V56FzvuFPpPruCXqQXw@mail.gmail.com>
 <3fff6467-4167-3b23-07b0-77329df511a8@kaod.org>
 <CACPK8Xc62bCPeZsPVoXiRWgTvKMp1tZofzx9s4Z1UASEnrA1iA@mail.gmail.com>
 <898d0cb80f1ec3c124efb8713a5acdfc@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <31f6163e-2713-33d1-dc2d-c28f78e55d51@kaod.org>
Date: Thu, 23 May 2019 08:11:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <898d0cb80f1ec3c124efb8713a5acdfc@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 4147815259484883862
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddufedguddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 5/22/19 11:58 PM, Adriana Kobylak wrote:
> 
>>> >>> Should we introduce a machine option to set the model name of the
>>> >>> FMC flash chip ? I think I tried that in the past but at the block
>>> >>> level and mainline did not like it. But we could try at the machine
>>> >>> level.
>>> >>>
>>> >>> Anyhow, it's a good way to debug flash issues on real HW.
>>> >>
>>> >> Eh. I'm not fussed by a new machine. I wouldn't do anything for the moment.
>>> >
>>> > We could instead add a swift machine with the 128MB NOR. When we get a
>>> > model for the SD/MMC it would use that too.
>>>
>>> OK. That's a good direction.
>>
>> Adriana, could you take this on?
> 
> Yeah, was thinking about it when Cedric sent out this patch, but since theoretically the witherspoon128-bmc model could be used with a swift image, I put it to the side. But now that you mention it, yeah we can add the SD/MMC to it later so that'd be valuable to have in a qemu model. Will send a patch based on the 128 for a new swift bmc to start with.

Yes. I suppose this machine will have a different layout of I2C devices also,
different HW strapping, etc.

Thanks,

C.

