Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E71634CBAB3
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 10:51:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8R8T6cDyz3c1h
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 20:51:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.54.81;
 helo=smtpout3.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 9513 seconds by postgrey-1.36 at boromir;
 Thu, 03 Mar 2022 20:51:24 AEDT
Received: from smtpout3.mo529.mail-out.ovh.net
 (smtpout3.mo529.mail-out.ovh.net [46.105.54.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8R8D1GyDz3bk2
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 20:51:21 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.158])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id AF03AE59C705;
 Thu,  3 Mar 2022 10:51:18 +0100 (CET)
Received: from kaod.org (37.59.142.96) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 10:51:17 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0011029aecb-97d9-4c7f-840c-3162b73fadb6,
 55B60675CB1CB6CD1457B26C431D000BE513F440) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <04785138-fa0d-568e-b47b-6d0c51cdc426@kaod.org>
Date: Thu, 3 Mar 2022 10:51:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
 <CACPK8Xf6Zp7Zeu3wrRFHsctEKXfoYkJhbV+PSby0CmP72LC7aQ@mail.gmail.com>
 <1cbb3001-f7ba-50bf-7184-3aec6342e405@kaod.org>
 <CACPK8XftWG2LYu6mPgxjUEBUkeF2nDjC_9C_+Yr56B94CyeAug@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CACPK8XftWG2LYu6mPgxjUEBUkeF2nDjC_9C_+Yr56B94CyeAug@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.96]
X-ClientProxiedBy: DAG5EX1.mxp5.local (172.16.2.41) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 67335576-38e4-4ff4-a9cf-4dd42c0d2ca1
X-Ovh-Tracer-Id: 10346457196588927907
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtiedgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepieegvdffkeegfeetuddttddtveduiefhgeduffekiedtkeekteekhfffleevleelnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehrhigrnhgptghhvghnsegrshhpvggvughtvggthhdrtghomh
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Lei Yu <yulei.sh@bytedance.com>,
 John Wang <wangzq.jn@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 3/3/22 10:45, Joel Stanley wrote:
> On Wed, 2 Mar 2022 at 05:45, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> On 3/1/22 13:20, Joel Stanley wrote:
> 
>>> [    0.746796] spi-nor spi0.0: w25q512jv (65536 Kbytes)
>>> [    0.808104] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
>>> [    0.862687] spi-nor spi0.1: w25q512jv (65536 Kbytes)
>>> [    0.923991] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0641]
>>
>>
>> On the FMC controller, could you please increase the clock to :
>>
>>          spi-max-frequency = <100000000>;
>>
>> and check the results ?
> 
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -162,7 +162,7 @@ flash@0 {
>                  status = "okay";
>                  m25p,fast-read;
>                  label = "bmc";
> -               spi-max-frequency = <50000000>;
> +               spi-max-frequency = <100000000>;
>   #include "openbmc-flash-layout-64.dtsi"
>          };
> 
> @@ -170,6 +170,7 @@ flash@1 {
>                  status = "okay";
>                  m25p,fast-read;
>                  label = "alt-bmc";
> +               spi-max-frequency = <100000000>;
>          };
>   };
> 
> 
> 
> # dmesg |grep spi
> [    0.746939] spi-nor spi0.0: w25q512jv (65536 Kbytes)
> [    0.904547] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0741]
> [    0.959048] spi-nor spi0.1: w25q512jv (65536 Kbytes)
> [    1.116603] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0741]
> [    1.130483] spi-nor spi1.0: w25q256 (32768 Kbytes)
> [    1.255015] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:2 [0x203c0741]
> [    1.269188] spi-nor spi2.0: gd25q256 (32768 Kbytes)
> [    1.366623] spi-aspeed-smc 1e631000.spi: CE0 read buswidth:2 [0x203c0741]
> 
> # fdtget /sys/firmware/fdt /ahb/spi@1e620000/flash@0 spi-max-frequency
> 100000000
> # fdtget /sys/firmware/fdt /ahb/spi@1e620000/flash@0 spi-max-frequency
> 100000000
> 
> l# ./mtd-stress.sh mtd5 mtd6
> 22+0 records in
> 22+0 records out
> 23068672 bytes (23 MB, 22 MiB) copied, 2.39988 s, 9.6 MB/s
> 28deb0d7b7ac61a3a748661d17caad9b  /tmp/tmp.F0iA2sCa75
> Erasing blocks: 352/352 (100%)
> Writing data: 22528k/22528k (100%)
> Verifying data: 22528k/22528k (100%)
> 
> real    2m51.548s
> user    0m0.010s
> sys     2m46.316s
> 28deb0d7b7ac61a3a748661d17caad9b  /dev/mtd5
> 
> real    0m2.473s
> user    0m0.158s
> sys     0m2.286s
> 64+0 records in
> 64+0 records out
> 67108864 bytes (67 MB, 64 MiB) copied, 5.34609 s, 12.6 MB/s
> 33e2d1b6b58feaf69ae03bce376cbad3  /tmp/tmp.bCJiVeGiSh
> Erasing blocks: 1024/1024 (100%)
> Writing data: 65536k/65536k (100%)
> Verifying data: 65536k/65536k (100%)
> 
> real    7m50.545s
> user    0m0.200s
> sys     7m35.033s
> 33e2d1b6b58feaf69ae03bce376cbad3  /dev/mtd6
> 
> real    0m7.187s
> user    0m0.485s
> sys     0m6.635s
> 
> 
> Do we expect it to take the same amount of time?

There is a nice boost on the reads. Write are the same but that's expected.

> 
>>
>>> [    0.937639] spi-nor spi1.0: w25q256 (32768 Kbytes)
>>> [    1.062246] spi-aspeed-smc 1e630000.spi: CE0 read buswidth:2 [0x203c0741]
>>> [    1.076507] spi-nor spi2.0: gd25q256 (32768 Kbytes)
>>> [    1.173951] spi-aspeed-smc 1e631000.spi: CE0 read buswidth:2 [0x203c0741]
>>>
>>> ./mtd-stress.sh mtd5 mtd6 mtd7 mtd8
>>
>> A good test would be to read from /dev/mtd0 and reflash the resulting file.
>> Keep an external programmer close at hand just in case :)
> 
> I did this, while crossing my legs, arms, fingers and toes.
> 
> root@apolo:~# ./mtd-stress.sh mtd0
> 64+0 records in
> 64+0 records out
> 67108864 bytes (67 MB, 64 MiB) copied, 5.15611 s, 13.0 MB/s
> 8a439fdfec504f3e8574c4260d0389ee  /tmp/tmp.kbTNY4G8Qd
> Erasing blocks: 1024/1024 (100%)
> Writing data: 65536k/65536k (100%)
> Verifying data: 5590k/65536k (8%)File does not seem to match flash
> data. First mismatch at 0x00573000-0x00575800

ouch. we should keep the 50MHz value then.

> real    7m56.061s
> user    0m0.050s
> sys     7m54.697s
> 343335c0dc778b95afc83a95307921a7  /dev/mtd0
> 
> real    0m7.191s
> user    0m0.482s
> sys     0m6.597s
> 
> Oh no! A failure!
> 
> I ran it again and it succeeded. Both tests were with random data. I
> wrote to it a third time, this time restoring the original file, and
> it succeeded.

and did you reboot ? :)

Cheers,

C.
