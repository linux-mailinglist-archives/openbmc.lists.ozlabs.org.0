Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B137548316
	for <lists+openbmc@lfdr.de>; Mon, 13 Jun 2022 11:23:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LM5hw0fnnz3cFH
	for <lists+openbmc@lfdr.de>; Mon, 13 Jun 2022 19:23:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=79.137.123.220; helo=smtpout2.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 895 seconds by postgrey-1.36 at boromir; Mon, 13 Jun 2022 19:23:14 AEST
Received: from smtpout2.mo529.mail-out.ovh.net (smtpout2.mo529.mail-out.ovh.net [79.137.123.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM5hf3plyz3bdF
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jun 2022 19:23:11 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.33])
	by mo529.mail-out.ovh.net (Postfix) with ESMTPS id C1C1D10B2A5BF;
	Mon, 13 Jun 2022 10:58:00 +0200 (CEST)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 13 Jun
 2022 10:57:59 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-103G0056971c037-d388-4246-bc66-55455572b859,
                    DD436A6F49FCC46F63A45CA4D245122A41FF8289) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <367135b2-e5c0-3ebb-9ad2-2a78b2c6af2f@kaod.org>
Date: Mon, 13 Jun 2022 10:57:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] spi: aspeed: Fix division by zero
Content-Language: en-US
To: Pratyush Yadav <p.yadav@ti.com>
References: <20220611103929.1484062-1-clg@kaod.org>
 <20220613083952.4z45ulaxdy2okbho@ti.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220613083952.4z45ulaxdy2okbho@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e1c48708-fe1b-4eaa-9e99-a4a0e338ddee
X-Ovh-Tracer-Id: 18165269099526065141
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehirghnrdifohhlohhstghhihhnsegrkhgrmhgrihdrtghomhdpoffvtefjohhsthepmhhohedvle
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
Cc: linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>, Joel Stanley <joel@jms.id.au>, Ian Woloschin <ian.woloschin@akamai.com>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/13/22 10:39, Pratyush Yadav wrote:
> On 11/06/22 12:39PM, Cédric Le Goater wrote:
>> When using the normal read operation for data transfers, the dummy bus
>> width is zero. In that case, they are no dummy bytes to transfer and
>> setting the dummy field in the controller register becomes useless.
>>
>> Issue was found on a custom "Bifrost" board with a AST2500 SoC and
>> using a MX25L51245GMI-08G SPI Flash.
>>
>> Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
>> Reported-by: Ian Woloschin <ian.woloschin@akamai.com>
>> Fixes: 54613fc6659b ("spi: aspeed: Add support for direct mapping")
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   drivers/spi/spi-aspeed-smc.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
>> index 496f3e1e9079..3e891bf22470 100644
>> --- a/drivers/spi/spi-aspeed-smc.c
>> +++ b/drivers/spi/spi-aspeed-smc.c
>> @@ -558,6 +558,14 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
>>   	u32 ctl_val;
>>   	int ret = 0;
>>   
>> +	dev_dbg(aspi->dev,
>> +		"CE%d %s dirmap [ 0x%.8llx - 0x%.8llx ] OP %#x mode:%d.%d.%d.%d naddr:%#x ndummies:%#x\n",
>> +		chip->cs, op->data.dir == SPI_MEM_DATA_IN ? "read" : "write",
>> +		desc->info.offset, desc->info.offset + desc->info.length,
>> +		op->cmd.opcode, op->cmd.buswidth, op->addr.buswidth,
>> +		op->dummy.buswidth, op->data.buswidth,
>> +		op->addr.nbytes, op->dummy.nbytes);
>> +
> 
> Unrelated change. Please send as a separate patch.

OK.
  
>>   	chip->clk_freq = desc->mem->spi->max_speed_hz;
>>   
>>   	/* Only for reads */
>> @@ -574,9 +582,11 @@ static int aspeed_spi_dirmap_create(struct spi_mem_dirmap_desc *desc)
>>   	ctl_val = readl(chip->ctl) & ~CTRL_IO_CMD_MASK;
>>   	ctl_val |= aspeed_spi_get_io_mode(op) |
>>   		op->cmd.opcode << CTRL_COMMAND_SHIFT |
>> -		CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth) |
>>   		CTRL_IO_MODE_READ;
>>   
>> +	if (op->dummy.nbytes)
>> +		ctl_val |= CTRL_IO_DUMMY_SET(op->dummy.nbytes / op->dummy.buswidth);
>> +
> 
> LGTM. With the above fixed,
>
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

Thanks,

C.

> 
>>   	/* Tune 4BYTE address mode */
>>   	if (op->addr.nbytes) {
>>   		u32 addr_mode = readl(aspi->regs + CE_CTRL_REG);
>> -- 
>> 2.35.3
>>
> 

