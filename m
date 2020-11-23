Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 436A92C1961
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 00:28:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cg3Hn5QY5zDqLX
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 10:28:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=188.165.59.253; helo=7.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4199 seconds by postgrey-1.36 at bilbo;
 Tue, 24 Nov 2020 00:36:52 AEDT
Received: from 7.mo52.mail-out.ovh.net (7.mo52.mail-out.ovh.net
 [188.165.59.253])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cfp9075DKzDqQr
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 00:36:50 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.6])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id E079B213FF5;
 Mon, 23 Nov 2020 11:58:36 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 11:58:34 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0027f0c3ab2-41f9-47ab-8f7c-37adadc44578,
 AF84A700016AED6247F1F5B9AC1D14952D0C96A6) smtp.auth=clg@kaod.org
Subject: Re: qemu for bmc
To: Patrick Venture <venture@google.com>
References: <CAO=noty_ADQwzPXx8AneRRcXNr9B15PBBByP6TNDeDCoy2ug6Q@mail.gmail.com>
 <e605bae4-b17a-b383-62a9-7594b57f7245@kaod.org>
 <CAO=noty4NEETUhb2jXhODV9THigegMdpKcteofBdygzLD0PZdw@mail.gmail.com>
 <CAO=notxg5=bSSZF5ghQRy2O=a152U2i8TkMmKvtxCGxvM3uz8Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <54cda4be-7717-ff78-c97a-f2942bc11543@kaod.org>
Date: Mon, 23 Nov 2020 11:58:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAO=notxg5=bSSZF5ghQRy2O=a152U2i8TkMmKvtxCGxvM3uz8Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: ef6ba7d7-b24e-4c95-8f15-b4309b16f269
X-Ovh-Tracer-Id: 10798506010784992038
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeutdehgefhvdehtdeuleetgedvfeeukedtfeeihfffffeiuddutdduhffgvedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehvvghnthhurhgvsehgohhoghhlvgdrtghomh
X-Mailman-Approved-At: Tue, 24 Nov 2020 10:26:40 +1100
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 John Wang <wangzhiqiang.bj@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 11/20/20 5:44 PM, Patrick Venture wrote:
> On Thu, Nov 19, 2020 at 8:56 AM Patrick Venture <venture@google.com> wrote:
>>
>> On Wed, Nov 18, 2020 at 11:41 PM Cédric Le Goater <clg@kaod.org> wrote:
>>>
>>> Hello,
>>>
>>> On 11/18/20 10:11 PM, Patrick Venture wrote:
>>>> Patrick;
>>>>
>>>> I was looking at a patch series of yours that landed,
>>>> https://github.com/qemu/qemu/blob/master/hw/arm/aspeed.c#L517 <-- in
>>>> this line you're referencing a device that appears to be missing from
>>>> qemu - namely, the pca i2c mux.
>>>>
>>>> My question is to the community at large, and you also, is anyone
>>>> currently implementing this i2c-mux or a similar one?
>>>
>>> I haven't seen any patches for this device on the QEMU mailing
>>> list.
>>>
>>> John Wang from Bytedance has started developing some new I2C
>>> device models for their G220A board. We hope to get that merged
>>> in 6.0.
>>>
>>> If you are interested, we maintain a brief TODO list here
>>>
>>>   https://github.com/openbmc/qemu/wiki
>>
>> Thanks, I'll take a look.
>>
>>>
>>> Feel free to update.
>>>
>>>
>>> In terms of priority, I think that the support to boot from eMMC
>>> on the AST2600 is an important one. Reviewing the FSI patches
>>> also but that's an IBM thing, so it might not interest the
>>> community that much.
>>>
>>> There are quite a few I2C models missing.
>>
>> Yes.
>>
>>>
>>> All Aspeed models could be more precise.
>>>
>>>
>>> Google and Nuvoton have merged their models for the npcm750-evb
>>> and quanta-gsj boards. It would be good to have some interaction
>>> with them, on bus/device modeling but also on full system emulation.
>>
>> Yeah, I believe you've seen my team's patches adding nuvoton support
>> to Qemu.  It's a WIP, but we're making a lot of headway and hope to
>> have more Nuvoton 730/750 qemu devices sent to qemu over the coming
>> days, weeks, etc.
>>
>> One of the big gaps that I'm seeing is that we weren't yet looking at
>> the rest of the board as closely, to see what other devices are
>> missing, such as the i2c-muxes, etc.  This will be a really good
>> community convergence point as there are only so many i2c-muxes,
>> voltage regulators, temperature sensors, that are in common use.
>>
>> I'll go through some of our plans as stated and add them to the todo
>> list.  My team currently isn't focused on aspeed support at present,
>> but we're keeping an eye on it and are definitely excited to see
>> others contributing in that space!
> 
> Cedric,
> 
> I noticed you wrote the smbus_ipmi device in qemu. 

I wrote an experimental iBT device model using a chardev device backend 
to communicate with the external world (the host)

> It looks like this
> is meant to operate on the host-side using the SSIF driver.  

The goal was to connect a Aspeed BMC QEMU machine to a PowerNV QEMU machine 
using an external IPMI BMC. The PowerNV machine uses by default an internal
BMC simulator but it can be switched to an external one and connect to a 
remote BMC using the OpenIPMI's lanserv serial interface.

It operated on top of the iBT device only.

C.


> I'm looking at the Kudo BMC board which uses SSIF on the BMC side, and
> don't see an SSIF driver yet in openbmc/ilnux, but I wanted to
> validate that the host-side of the equation is what you've provided in
> Qemu?  Perhaps a silly question, but I've been caught off guard by
> some bad assumptions recently. :)
> 
> Thanks,
> Patrick
> 
>>
>>>
>>> Cheers,
>>>
>>> C.
>>
>> - Patrick

