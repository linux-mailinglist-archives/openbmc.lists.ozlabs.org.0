Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8374ED551
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 10:18:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTblf5v3rz2yY7
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 19:18:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.255.19; helo=2.mo548.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 4209 seconds by postgrey-1.36 at boromir;
 Thu, 31 Mar 2022 19:17:45 AEDT
Received: from 2.mo548.mail-out.ovh.net (2.mo548.mail-out.ovh.net
 [178.33.255.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTblF15Pwz2yHp
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2022 19:17:42 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.35])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id A9BA6221DF;
 Thu, 31 Mar 2022 05:50:58 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 31 Mar
 2022 07:50:58 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004ac05887a-fbe1-4528-bd48-2c8837da01f5,
 FC9088D273F6636B0CAAD4892A2C3D02B7ACC8E0) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f62f43ad-8eda-c4fc-ad56-04227ef38c9f@kaod.org>
Date: Thu, 31 Mar 2022 07:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RESEND][PATCH linux dev-5.15 v2 1/1] mtd: spi-nor: aspeed: set
 the decoding size to at least 2MB for AST2600
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, Potin Lai <potin.lai@quantatw.com>
References: <20220331002914.30495-1-potin.lai@quantatw.com>
 <CACPK8XfzFNqyoa4Fe0sY3usfAd75KAVg2pO8fnW+BzyvSSp9dg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XfzFNqyoa4Fe0sY3usfAd75KAVg2pO8fnW+BzyvSSp9dg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 04d84c22-b60b-43b0-8270-223bc835b4df
X-Ovh-Tracer-Id: 4702320962624392099
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrudeifedgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekvdfgudevkeefkeeltdejteekvdegffegudetgeettdffjeefheekfeelffdtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehprghtrhhitghksehsthiftgigrdighiii
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/31/22 03:07, Joel Stanley wrote:
> On Thu, 31 Mar 2022 at 00:29, Potin Lai <potin.lai@quantatw.com> wrote:
>>
>> In AST2600, the unit of SPI CEx decoding range register is 1MB, and end
>> address offset is set to the acctual offset - 1MB. If the flash only has
>> 1MB, the end address will has same value as start address, which will
>> causing unexpected errors.
>>
>> This patch set the decoding size to at least 2MB to avoid decoding errors.
>>
>> Tested:
>> root@bletchley:~# dmesg | grep "aspeed-smc 1e631000.spi: CE0 window"
>> [   59.328134] aspeed-smc 1e631000.spi: CE0 window resized to 2MB (AST2600 Decoding)
>> [   59.343001] aspeed-smc 1e631000.spi: CE0 window [ 0x50000000 - 0x50200000 ] 2MB
>> root@bletchley:~# devmem 0x1e631030
>> 0x00100000
>>
>> Signed-off-by: Potin Lai <potin.lai@quantatw.com>
>>
>> ---
>> [v1]: https://lore.kernel.org/all/20220304170757.16924-1-potin.lai@quantatw.com/
> 
> Cédric, can I get an ack from you before I put this in the openbmc tree?


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

>>
>> Changes v1 --> v2:
>> - add fmc controller into decoding range resize checking
>> ---
>>   drivers/mtd/spi-nor/controllers/aspeed-smc.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/controllers/aspeed-smc.c b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
>> index 416ea247f843..74fa46439246 100644
>> --- a/drivers/mtd/spi-nor/controllers/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/controllers/aspeed-smc.c
>> @@ -781,6 +781,18 @@ static u32 aspeed_smc_chip_set_segment(struct aspeed_smc_chip *chip)
>>                           chip->cs, size >> 20);
>>          }
>>
>> +       /*
>> +        * The decoding size of AST2600 SPI controller should set at
>> +        * least 2MB.
>> +        */
>> +       if ((controller->info == &spi_2600_info ||
>> +            controller->info == &fmc_2600_info) && size < SZ_2M) {
>> +               size = SZ_2M;
>> +               dev_info(chip->nor.dev,
>> +                        "CE%d window resized to %dMB (AST2600 Decoding)",
>> +                        chip->cs, size >> 20);
>> +       }
>> +
>>          ahb_base_phy = controller->ahb_base_phy;
>>
>>          /*
>> --
>> 2.17.1
>>

