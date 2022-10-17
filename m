Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3063600E87
	for <lists+openbmc@lfdr.de>; Mon, 17 Oct 2022 14:04:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MrbJH20Syz3dqn
	for <lists+openbmc@lfdr.de>; Mon, 17 Oct 2022 23:04:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=46.105.37.156; helo=8.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 8272 seconds by postgrey-1.36 at boromir; Mon, 17 Oct 2022 23:03:52 AEDT
Received: from 8.mo552.mail-out.ovh.net (8.mo552.mail-out.ovh.net [46.105.37.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MrbHr2nYjz2ygC
	for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2022 23:03:48 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.48])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 8A3012723A;
	Mon, 17 Oct 2022 09:39:31 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12; Mon, 17 Oct
 2022 11:39:30 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-95G001e4a9f766-4f6d-4d46-83cb-9024a96d311a,
                    03067325AA2E056BEC2EB751A0783F460AB0E9BE) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <5141de99-33cc-7266-d56a-9f8112d1e588@kaod.org>
Date: Mon, 17 Oct 2022 11:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] spi: aspeed: Fix window offset of CE1
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20221016155722.3520802-1-clg@kaod.org>
 <CACPK8XfrF2h0zYNPcFwHmGfyohCOYQziqoUAJ6j60bEonFHu0A@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XfrF2h0zYNPcFwHmGfyohCOYQziqoUAJ6j60bEonFHu0A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: ab2a3e5c-c840-4939-a121-c42b9414ee40
X-Ovh-Tracer-Id: 2509067946161834799
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekledgudekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkphepuddvjedrtddrtddruddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehjohgvlhesjhhmshdrihgurdgruhdplhhinhhugidqshhpihesvhhgvghrrdhkvghrnhgvlhdrohhrghdpsghrohhonhhivgeskhgvrhhnvghlrdhorhhgpdhlihhnuhigqdgrshhpvggvugeslhhishhtshdrohiilhgrsghsrdhorhhgpdhophgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrghdprghnughrvgifsegrjhdrihgurdgruhdplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhlihhnuhigqdhkvghrnhgvlhesvh
 hgvghrrdhkvghrnhgvlhdrohhrghdptghhihhnqdhtihhnghgpkhhuohesrghsphgvvgguthgvtghhrdgtohhmpdfovfetjfhoshhtpehmohehhedvpdhmohguvgepshhmthhpohhuth
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/17/22 00:43, Joel Stanley wrote:
> On Sun, 16 Oct 2022 at 15:57, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The offset value of the mapping window in the kernel structure is
>> calculated using the value of the previous window offset. This doesn't
>> reflect how the HW is configured and can lead to erroneous setting of
>> the second flash device (CE1).
> 
> So .offset is expected to be the absolute address of the window, and
> this was okay for the 2400/2500 but was broken on the 2600?

the aspeed_spi_get_windows() routine collects in an array the window/decoding
range setting for each CS, and the offset for CS1 and above is computed from
the offset/size of the previous CS. But this makes an assumption on the fact
ranges are contiguous, which is not necessarily how the HW is configured.

C.

> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
> 
>>
>> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>> Fixes: e3228ed92893 ("spi: spi-mem: Convert Aspeed SMC driver to spi-mem")
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   drivers/spi/spi-aspeed-smc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
>> index 33cefcf18392..b90571396a60 100644
>> --- a/drivers/spi/spi-aspeed-smc.c
>> +++ b/drivers/spi/spi-aspeed-smc.c
>> @@ -398,7 +398,7 @@ static void aspeed_spi_get_windows(struct aspeed_spi *aspi,
>>                  windows[cs].cs = cs;
>>                  windows[cs].size = data->segment_end(aspi, reg_val) -
>>                          data->segment_start(aspi, reg_val);
>> -               windows[cs].offset = cs ? windows[cs - 1].offset + windows[cs - 1].size : 0;
>> +               windows[cs].offset = data->segment_start(aspi, reg_val) - aspi->ahb_base_phy;
>>                  dev_vdbg(aspi->dev, "CE%d offset=0x%.8x size=0x%x\n", cs,
>>                           windows[cs].offset, windows[cs].size);
>>          }
>> --
>> 2.37.3
>>

