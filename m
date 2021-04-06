Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060E5354F52
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 11:00:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FF1h16sPKz304Z
	for <lists+openbmc@lfdr.de>; Tue,  6 Apr 2021 19:00:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.43.201; helo=4.mo52.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 4.mo52.mail-out.ovh.net (4.mo52.mail-out.ovh.net
 [178.33.43.201])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FF1gj0qfZz301B
 for <openbmc@lists.ozlabs.org>; Tue,  6 Apr 2021 19:00:00 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.19])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 8FB1F258290;
 Tue,  6 Apr 2021 10:51:17 +0200 (CEST)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 6 Apr 2021
 10:51:16 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R0061314f310-4b31-481e-8c02-5904d8edfb3f,
 48F3A4D201026AA1446B174829F4A17F6C46C190) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Subject: Re: [ast2500] aspeed-smc fail with MX25L25635F
To: Shakeeb B K <shakeebbk@gmail.com>
References: <CABYu0WivHn9L4hbY0E3k+G_c6RH7bu6NuxwmeSNG90c_A_4Qig@mail.gmail.com>
 <CABYu0WhxPKePtGMGPojguaTJu21hMq4S=j6_5qRz5kPZC4yfFQ@mail.gmail.com>
 <b17f2faf-4c50-4b68-bbad-6d91a7661c61@kaod.org>
 <CABYu0Wi=Y2B0WsKqYd9Fin=Weow28ex6YzBPnKuoQq4cB26n6Q@mail.gmail.com>
 <da335562-6472-d165-8b91-0fcf6c6873f4@kaod.org>
 <CABYu0Wj5nCs1hkGGd4860otC53fdzRECq4_+TbesgaW6zOZC2Q@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5747c839-afc1-68e3-b792-d40d29e9fcdb@kaod.org>
Date: Tue, 6 Apr 2021 10:51:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CABYu0Wj5nCs1hkGGd4860otC53fdzRECq4_+TbesgaW6zOZC2Q@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: d0f26307-55a2-4802-a58b-87cb40a914bb
X-Ovh-Tracer-Id: 2379026504144227293
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudejgedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepveefleffffeffeduvedukeejieekffdvledtffejieeiteevteejffdvjeetkedvnecuffhomhgrihhnpehmrggtrhhonhhigidrtghomhdpohhuthhlohhokhdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepshhhrghkvggvsggskhesghhmrghilhdrtghomh
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/5/21 8:08 AM, Shakeeb B K wrote:
> Hi Cédric,
> 
> On Fri, Apr 2, 2021 at 12:45 PM Cédric Le Goater <clg@kaod.org <mailto:clg@kaod.org>> wrote:
> 
>     Hello,
> 
>     On 4/1/21 5:22 PM, Shakeeb B K wrote:
>     > Hi Cédric,
>     >
>     > The part we are using is *MX25L25635F* https://www.macronix.com/Lists/Datasheet/Attachments/7414/MX25L25635F,%203V,%20256Mb,%20v1.5.pdf <https://www.macronix.com/Lists/Datasheet/Attachments/7414/MX25L25635F,%203V,%20256Mb,%20v1.5.pdf> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.macronix.com%2FLists%2FDatasheet%2FAttachments%2F7414%2FMX25L25635F%2C%25203V%2C%2520256Mb%2C%2520v1.5.pdf&data=04%7C01%7Cspasha%40nvidia.com%7C4cf89d8779c84d638c6f08d8ef7d0919%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637522667609971209%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=hYy5Cpi06y4T0DpFb4%2FDeo2nEy5Cn3rf3l%2BEO%2FaPP%2FU%3D&reserved=0
>     <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.macronix.com%2FLists%2FDatasheet%2FAttachments%2F7414%2FMX25L25635F%2C%25203V%2C%2520256Mb%2C%2520v1.5.pdf&data=04%7C01%7Cspasha%40nvidia.com%7C4cf89d8779c84d638c6f08d8ef7d0919%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C637522667609971209%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=hYy5Cpi06y4T0DpFb4%2FDeo2nEy5Cn3rf3l%2BEO%2FaPP%2FU%3D&reserved=0>>
>     >
>     > Attaching the failed boot log - full_boot.log
> 
>     This was failing in 5.8 already. 
> 
> 
>     > The patch that fixes the problem - workaround.patch
> 
>     OK. You are disabling Dual I/O.
> 
>     > A patch to override read opcode - 001-Debug.patch
>     > Failing log with post fixup read opcode update - fail_post_fixup.log
> 
>     Could you check the SPI wiring on the schematics of your AST2500 dgx board ? 
> 
>     If it is single wired, then I suggest a work around like the one attached.
> 
> 
> We have MOSI, MISO datalines connected and the workaround is working for us.
> But I just wanted to check if anybody got dual mode working with MX25L25635F,

IBM has at least two systems using dual data reads on the MX25L25635F 
with the ast2400 and the ast2500 SoC. 

> and what would be the right fix for it in spi-nor.

a DT property would be the best solution.

C.
