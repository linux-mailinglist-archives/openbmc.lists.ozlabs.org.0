Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E91B756212D
	for <lists+openbmc@lfdr.de>; Thu, 30 Jun 2022 19:26:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYlc26CzKz3cj3
	for <lists+openbmc@lfdr.de>; Fri,  1 Jul 2022 03:26:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kaod.org (client-ip=188.165.49.222; helo=6.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Received: from 6.mo552.mail-out.ovh.net (6.mo552.mail-out.ovh.net [188.165.49.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYlbl6lgFz3cfF
	for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2022 03:25:53 +1000 (AEST)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
	by mo552.mail-out.ovh.net (Postfix) with ESMTPS id D2D3524CE6;
	Thu, 30 Jun 2022 17:25:49 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 30 Jun
 2022 19:25:49 +0200
Authentication-Results: garm.ovh; auth=pass (GARM-105G006aab370a2-62a8-4a0c-8692-2feaa5defa7a,
                    40551C6C823FDDA91B74F5D58A080B55BE22893A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bf493397-6824-dc5f-b7b5-fe7622974e73@kaod.org>
Date: Thu, 30 Jun 2022 19:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH linux 1/5] spi: aspeed: Fix window offset of CE1
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220628162044.1121337-1-clg@kaod.org>
 <20220628162044.1121337-2-clg@kaod.org>
 <CACPK8XdvBq77NNixLapuB18Xp=Q3k2aRgj47j9nz-dv2BaxTeQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XdvBq77NNixLapuB18Xp=Q3k2aRgj47j9nz-dv2BaxTeQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG9EX1.mxp5.local (172.16.2.81) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3f691368-c14e-4214-aaab-1f38579aeb85
X-Ovh-Tracer-Id: 15896862262726921184
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehuddgudduudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepkeetjedtleekjedvveffudfhteetleeifeegfeffuefghfefkeehffeufeeludejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheptghhihhnqdhtihhnghgpkhhuohesrghsphgvvgguthgvtghhrdgtohhmpdfovfetjfhoshhtpehmohehhedv
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
Cc: Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/29/22 09:20, Joel Stanley wrote:
> On Tue, 28 Jun 2022 at 16:20, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The offset value of the mapping window in the kernel structure is
>> calculated using the value of the previous window offset. This doesn't
>> reflect how the HW is configured and can lead to erroneous setting of
>> the second flash device (CE1).
>>
> 
> Did you want to include a Fixes tag?

I should and one from the correct tree !

Fixes: e3228ed92893 ("spi: spi-mem: Convert Aspeed SMC driver to spi-mem")

> 
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>   drivers/spi/spi-aspeed-smc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
>> index 3e891bf22470..5a995b5653f1 100644
>> --- a/drivers/spi/spi-aspeed-smc.c
>> +++ b/drivers/spi/spi-aspeed-smc.c
>> @@ -398,7 +398,7 @@ static void aspeed_spi_get_windows(struct aspeed_spi *aspi,
>>                  windows[cs].cs = cs;
>>                  windows[cs].size = data->segment_end(aspi, reg_val) -
>>                          data->segment_start(aspi, reg_val);
>> -               windows[cs].offset = cs ? windows[cs - 1].offset + windows[cs - 1].size : 0;
>> +               windows[cs].offset = data->segment_start(aspi, reg_val) - aspi->ahb_base_phy;
> 
> Is subtracting the base address correct for the 2400/2500?

The segment_start() handlers return absolute physical addresses.

Since we want the offset, we could simply  :

   data->segment_start(aspi, reg_val) & (aspi->ahb_window_size - 1);

May be better,

Thanks,

C.

> 
>>                  dev_vdbg(aspi->dev, "CE%d offset=0x%.8x size=0x%x\n", cs,
>>                           windows[cs].offset, windows[cs].size);
>>          }
>> --
>> 2.35.3
>>

