Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3941B4C9D9F
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 06:53:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7jwB1kmFz3bqM
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 16:53:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.254.192;
 helo=3.mo552.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 482 seconds by postgrey-1.36 at boromir;
 Wed, 02 Mar 2022 16:53:13 AEDT
Received: from 3.mo552.mail-out.ovh.net (3.mo552.mail-out.ovh.net
 [178.33.254.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7jvs2PZCz30Jk
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 16:53:11 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.25])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 18B4C22A84;
 Wed,  2 Mar 2022 05:45:02 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 2 Mar
 2022 06:45:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002c090aa36-9827-4bd3-b039-21c1e93fa86b,
 C4D0281E1202E56F33479CDE0F97DA486BBB5F89) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <1cbb3001-f7ba-50bf-7184-3aec6342e405@kaod.org>
Date: Wed, 2 Mar 2022 06:45:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, John Wang <wangzq.jn@gmail.com>
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
 <CACPK8Xf6Zp7Zeu3wrRFHsctEKXfoYkJhbV+PSby0CmP72LC7aQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8Xf6Zp7Zeu3wrRFHsctEKXfoYkJhbV+PSby0CmP72LC7aQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 6a490c53-114f-41a7-9afe-667e3df9da32
X-Ovh-Tracer-Id: 314689025998359459
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -86
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtfedgjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrhhlucfvnfffucdludegmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeeiieegjeffueehudduvefhjeffffeufeetveelheeukeffiefgfeejtdeggeetgfenucffohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiihiienucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhihrghnpggthhgvnhesrghsphgvvgguthgvtghhrdgtohhm
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
 Lei Yu <yulei.sh@bytedance.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/1/22 13:20, Joel Stanley wrote:
> On Tue, 1 Mar 2022 at 09:57, John Wang <wangzq.jn@gmail.com> wrote:
>>
>> Joel Stanley <joel@jms.id.au> 于2022年2月25日周五 13:30写道：
>>>
>>> Cedric has authored a new drive for the SPI NOR devices on the ASPEED
>>> SoCs. It supports 2400, 2500 and 2600. It is written using the spi-mem
>>> subsystem, which should mean it can go upstream.
>>>
>>> This is great news, as our current driver is half upstream, half in
>>> the openbmc tree, due to some issues getting it merged as part of the
>>> spi-nor subsystem.
>>>
>>> It would be great to have testing. I've created a commit that patches
>>> in support to whatever kernel tree you're using. Hopefully this makes
>>> it easier to test atop your internal branches:
>>>
>>> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/51551
>>
>> tested on a fp5280g2 (ast2500), it looks okay.
>>
>> root@fp5280g2:~# dmesg |grep spi
>> [    1.594677] spi-nor spi0.0: mx66l51235f (65536 Kbytes)
>> [    1.728194] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
>> [    1.992733] spi-nor spi1.0: mx66l51235f (65536 Kbytes)
>> [    2.211741] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:2 [0x203c0741]
>> [    3.175017] SPI driver bmp280 has no spi_device_id for bosch,bmp085
> 
> 
> I've also done some testing, this time on an AST2600A3 EVB.
> 
> I tried to enable quad spi by adjust the device tree:
> 
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -157,10 +157,13 @@ &rtc {
>   };
> 
>   &fmc {
> +     pinctrl-names = "default";
> +     pinctrl-0 = <&pinctrl_fwqspid_default>;
>          status = "okay";
>          flash@0 {
>                  status = "okay";
>                  m25p,fast-read;
> +               spi-rx-bus-width = <4>;
>                  label = "bmc";
>                  spi-max-frequency = <50000000>;
> 
> 
> But the pinctrl setting failed with this error:
> 
> [    0.742963] aspeed-g6-pinctrl 1e6e2000.syscon:pinctrl: invalid
> function FWQSPID in map table
> 
> So I removed the quad spi settings and re-tested:
> 
> [    0.746796] spi-nor spi0.0: w25q512jv (65536 Kbytes)
> [    0.808104] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
> [    0.862687] spi-nor spi0.1: w25q512jv (65536 Kbytes)
> [    0.923991] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0641]


On the FMC controller, could you please increase the clock to :

	spi-max-frequency = <100000000>;

and check the results ?

> [    0.937639] spi-nor spi1.0: w25q256 (32768 Kbytes)
> [    1.062246] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:2 [0x203c0741]
> [    1.076507] spi-nor spi2.0: gd25q256 (32768 Kbytes)
> [    1.173951] spi-aspeed-smc 1e631000.spi: CE0 read buswidth:2 [0x203c0741]
> 
> ./mtd-stress.sh mtd5 mtd6 mtd7 mtd8

A good test would be to read from /dev/mtd0 and reflash the resulting file.
Keep an external programmer close at hand just in case :)

Thanks for these tests Joel,

C.


> 22+0 records in
> 22+0 records out
> 23068672 bytes (23 MB, 22 MiB) copied, 2.40148 s, 9.6 MB/s
> 14d980eb27e1b5d6554f22a71fc93de6  /tmp/tmp.CWpblJtRYl
> Erasing blocks: 352/352 (100%)
> Writing data: 22528k/22528k (100%)
> Verifying data: 22528k/22528k (100%)
> 
> real    2m47.896s
> user    0m0.080s
> sys    2m46.984s
> 14d980eb27e1b5d6554f22a71fc93de6  /dev/mtd5
> 
> real    0m3.344s
> user    0m0.166s
> sys    0m3.101s
> 
> 
> 64+0 records in
> 64+0 records out
> 67108864 bytes (67 MB, 64 MiB) copied, 5.38035 s, 12.5 MB/s
> 5b2a21e51a39f6c4e01c92b3c1b8825c  /tmp/tmp.BnJmqVrHHa
> Erasing blocks: 1024/1024 (100%)
> Writing data: 65536k/65536k (100%)
> Verifying data: 65536k/65536k (100%)
> 
> real    7m40.625s
> user    0m0.230s
> sys    7m39.931s
> 5b2a21e51a39f6c4e01c92b3c1b8825c  /dev/mtd6
> 
> real    0m9.723s
> user    0m0.484s
> sys    0m9.110s
> 
> 
> 32+0 records in
> 32+0 records out
> 33554432 bytes (34 MB, 32 MiB) copied, 2.4457 s, 13.7 MB/s
> a3a343b1d4233e364d332a9b466a0a40  /tmp/tmp.4NsXyq09Km
> Erasing blocks: 512/512 (100%)
> Writing data: 32768k/32768k (100%)
> Verifying data: 32768k/32768k (100%)
> 
> real    2m17.560s
> user    0m0.100s
> sys    2m17.346s
> a3a343b1d4233e364d332a9b466a0a40  /dev/mtd7
> 
> real    0m3.598s
> user    0m0.247s
> sys    0m3.313s
> 
> 
> 32+0 records in
> 32+0 records out
> 33554432 bytes (34 MB, 32 MiB) copied, 3.49483 s, 9.6 MB/s
> fc65634b925e4655dd9db70972c1ed46  /tmp/tmp.MaXhJaz10l
> Erasing blocks: 512/512 (100%)
> Writing data: 32768k/32768k (100%)
> Verifying data: 32768k/32768k (100%)
> 
> real    1m46.311s
> user    0m0.130s
> sys    1m46.064s
> fc65634b925e4655dd9db70972c1ed46  /dev/mtd8
> 
> real    0m3.513s
> user    0m0.246s
> sys    0m3.219s


