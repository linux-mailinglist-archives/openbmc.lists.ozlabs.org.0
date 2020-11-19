Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BEA2BA204
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 06:45:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cclr021M7zDqxB
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 16:45:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcBT66mQgzDqfV
 for <openbmc@lists.ozlabs.org>; Thu, 19 Nov 2020 18:41:37 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.5])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id B04BA6D386B6;
 Thu, 19 Nov 2020 08:41:26 +0100 (CET)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Thu, 19 Nov
 2020 08:41:25 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0064baacd70-7623-478f-986e-1c641961a797,
 E384B0115CE10CD8AABDB3449FE8426D60218A12) smtp.auth=clg@kaod.org
Subject: Re: qemu for bmc
To: Patrick Venture <venture@google.com>, Patrick Williams
 <patrick@stwcx.xyz>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, John Wang
 <wangzhiqiang.bj@bytedance.com>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>
References: <CAO=noty_ADQwzPXx8AneRRcXNr9B15PBBByP6TNDeDCoy2ug6Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e605bae4-b17a-b383-62a9-7594b57f7245@kaod.org>
Date: Thu, 19 Nov 2020 08:41:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAO=noty_ADQwzPXx8AneRRcXNr9B15PBBByP6TNDeDCoy2ug6Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 9f10386f-d09e-416f-8886-adcea543640e
X-Ovh-Tracer-Id: 2424625450738944806
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudefiedguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefggeehhfdtkefhteeghfeghefgudfhteevteeltefgffevhfeggeffhfevleelfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehvvghnthhurhgvsehgohhoghhlvgdrtghomh
X-Mailman-Approved-At: Fri, 20 Nov 2020 16:41:21 +1100
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

Hello,

On 11/18/20 10:11 PM, Patrick Venture wrote:
> Patrick;
> 
> I was looking at a patch series of yours that landed,
> https://github.com/qemu/qemu/blob/master/hw/arm/aspeed.c#L517 <-- in
> this line you're referencing a device that appears to be missing from
> qemu - namely, the pca i2c mux.
> 
> My question is to the community at large, and you also, is anyone
> currently implementing this i2c-mux or a similar one?

I haven't seen any patches for this device on the QEMU mailing 
list.

John Wang from Bytedance has started developing some new I2C 
device models for their G220A board. We hope to get that merged 
in 6.0.

If you are interested, we maintain a brief TODO list here

  https://github.com/openbmc/qemu/wiki

Feel free to update. 


In terms of priority, I think that the support to boot from eMMC 
on the AST2600 is an important one. Reviewing the FSI patches 
also but that's an IBM thing, so it might not interest the 
community that much.

There are quite a few I2C models missing. 

All Aspeed models could be more precise. 


Google and Nuvoton have merged their models for the npcm750-evb 
and quanta-gsj boards. It would be good to have some interaction
with them, on bus/device modeling but also on full system emulation.

Cheers,

C.
