Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 683444CB7CD
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 08:28:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8MzD36TTz3cd8
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 18:28:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=79.137.123.220;
 helo=smtpout2.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
X-Greylist: delayed 1481 seconds by postgrey-1.36 at boromir;
 Thu, 03 Mar 2022 18:27:49 AEDT
Received: from smtpout2.mo529.mail-out.ovh.net
 (smtpout2.mo529.mail-out.ovh.net [79.137.123.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8MyY0QT4z3c2H
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 18:27:47 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.7])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6ADE3E5895DE;
 Thu,  3 Mar 2022 08:03:00 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Mar
 2022 08:02:59 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002a2c11355-575a-41df-874f-e11e2fc1209f,
 A0610A17E77809494FE20D2F959CCE2A9331EACD) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <89483502-67e7-6a68-6883-fa25af677269@kaod.org>
Date: Thu, 3 Mar 2022 08:02:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
Content-Language: en-US
To: Tao Ren <rentao.bupt@gmail.com>
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <ddac71ef-5b7d-31fe-3ee6-fe837b326697@kaod.org>
 <Yh8JIGpm4ZE1OXzl@taoren-fedora-PC23YAB4>
 <1806afc0-f716-4713-6ce6-0c46326c7655@kaod.org>
 <YiBaPFWQcX4tCBlM@taoren-fedora-PC23YAB4>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <YiBaPFWQcX4tCBlM@taoren-fedora-PC23YAB4>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: bc4df25e-1d84-4f93-8db1-6fc2581e4c0e
X-Ovh-Tracer-Id: 7504122879490427811
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -83
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddthedguddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddujedmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfefgjedvleelvedufeehteelveevjeeuueehieeguedtveffhfeujefhgefgffetnecuffhomhgrihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdighiiipdhkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehrhigrnhgptghhvghnsegrshhpvggvughtvggthhdrtghomh
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
 Lei Yu <yulei.sh@bytedance.com>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Tao,

On 3/3/22 07:03, Tao Ren wrote:
> Hi Cedric,
> 
> The "No good frequency" warning is gone after updating spi-max-frequency
> to 50MHz in aspeed-g4.dtsi (thanks). I don't see any functional failures,

Super !

May be send the "spi-max-frequency" patch ? I can include it in a v3 if a
resend is needed.

> but flashcp ran slower compared to the mtd/spi-nor driver(~200 sec vs.
> ~145 sec when flashcp 32MB data to flash1).

Interesting, the HW settings should be the same. Was the dynamic debug
activated ?
> Below are the new results on ast2400:
> 
> root@wedge100-bmc:~# dmesg | grep -i spi
> [   11.501808] spi-nor spi0.0: mx25l25635e (32768 Kbytes)
> [   11.726388] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
> [   11.807925] 5 fixed-partitions partitions found on MTD device spi0.0
> [   11.884113] Creating 5 MTD partitions on "spi0.0":
> [   13.036819] spi-nor spi0.1: mx25l25635e (32768 Kbytes)
> [   13.260858] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0641]
> [   13.342318] 1 fixed-partitions partitions found on MTD device spi0.1
> [   13.418426] Creating 1 MTD partitions on "spi0.1":
> [   28.239488] SPI driver bmp280 has no spi_device_id for bosch,bmp085
> root@wedge100-bmc:~# cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00060000 00010000 "u-boot"
> mtd1: 00020000 00010000 "env"
> mtd2: 01b80000 00010000 "fit"
> mtd3: 00400000 00010000 "data0"
> mtd4: 02000000 00010000 "flash0"
> mtd5: 02000000 00010000 "flash1"
> root@wedge100-bmc:~# dd if=/dev/urandom of=/tmp/dummy.bin bs=32MB count=1
> 1+0 records in
> 1+0 records out
> root@wedge100-bmc:~# ls -l /tmp/dummy.bin
> -rw-r--r--    1 root     root      32000000 Mar  2 14:45 /tmp/dummy.bin
> root@wedge100-bmc:~# time flashcp /tmp/dummy.bin /dev/mtd5
> 
> real    3m21.837s
> user    0m0.557s
> sys     3m4.629s
> root@wedge100-bmc:~# time md5sum /dev/mtd5
> 6903a022e1e8f624ed3beb31aa94c528  /dev/mtd5
> 
> real    0m6.869s
> user    0m2.492s
> sys     0m3.738s
> root@wedge100-bmc:~# md5sum /tmp/dummy.bin
> 7205977a323b482f637123e43ab31a18  /tmp/dummy.bin
> 
> And below are the logs after appending "dyndbg" boot args:
> 
> root@wedge100-bmc:~# dmesg | grep -i spi
> [    0.000000] Kernel command line: console=ttyS2,9600n8 root=/dev/ram rw dyndbg="file drivers/spi/* +p;"
> [   11.594461] spi-aspeed-smc 1e620000.spi: registered master spi0
> [   11.594628] spi-aspeed-smc 1e620000.spi: CE0 default window [ 0x20000000 - 0x21ffffff ] 32MB
> [   11.594709] spi-aspeed-smc 1e620000.spi: CE0 setup done
> [   11.594763] spi spi0.0: setup mode 0, 8 bits/w, 50000000 Hz max --> 0
> [   11.595737] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x9f mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x6
> [   11.595950] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x10
> [   11.596103] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x8
> [   11.596226] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x70
> [   11.596513] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x24
> [   11.596732] spi-nor spi0.0: mx25l25635e (32768 Kbytes)

I am quite sure this is a MX25L25635F. I add this little patch to my kernel
  to check :

     @@ -22,8 +22,10 @@ mx25l25635_post_bfpt_fixups(struct spi_n
      	 * seems that the F version advertises support for Fast Read 4-4-4 in
      	 * its BFPT table.
      	 */
     -	if (bfpt->dwords[BFPT_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4)
     +	if (bfpt->dwords[BFPT_DWORD(5)] & BFPT_DWORD5_FAST_READ_4_4_4) {
     +		dev_warn(nor->dev, "This is a MX25L25635F\n");
      		nor->flags |= SNOR_F_4B_OPCODES;
     +	}
      
      	return 0;
      }
     
It would be nice to change the spi-nor layer to report the name correctly
one day. I will see what can be done.

> [   11.658369] spi-aspeed-smc 1e620000.spi: CE1 new window [ 0x22000000 - 0x23ffffff ] 32MB
> [   11.658457] spi-aspeed-smc 1e620000.spi: calculate timing compensation - AHB freq: 180 MHz
> [   11.664951] spi-aspeed-smc 1e620000.spi: Trying HCLK/5 [203c0d41] ...
> [   11.692905] spi-aspeed-smc 1e620000.spi:   * [00080000] 0 HCLK delay, 4ns DI delay : PASS
> [   11.720911] spi-aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 0ns DI delay : PASS
> [   11.749067] spi-aspeed-smc 1e620000.spi:   * [00090000] 1 HCLK delay, 4ns DI delay : PASS
> [   11.749155] spi-aspeed-smc 1e620000.spi:  * -> good is pass 1 [0x00000000]
> [   11.749209] spi-aspeed-smc 1e620000.spi: Trying HCLK/4 [203c0641] ...
> [   11.773556] spi-aspeed-smc 1e620000.spi:   * [00008000] 0 HCLK delay, 4ns DI delay : PASS
> [   11.797835] spi-aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 0ns DI delay : PASS
> [   11.822419] spi-aspeed-smc 1e620000.spi:   * [00009000] 1 HCLK delay, 4ns DI delay : PASS
> [   11.822505] spi-aspeed-smc 1e620000.spi:  * -> good is pass 1 [0x00000000]
> [   11.822558] spi-aspeed-smc 1e620000.spi: Found good read timings at HCLK/4
> [   11.822607] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
> [   11.904076] 5 fixed-partitions partitions found on MTD device spi0.0
> [   11.980270] Creating 5 MTD partitions on "spi0.0":
> [   13.151908] spi-aspeed-smc 1e620000.spi: registered child spi0.0
> [   13.152074] spi-aspeed-smc 1e620000.spi: CE1 default window [ 0x22000000 - 0x23ffffff ] 32MB
> [   13.152151] spi-aspeed-smc 1e620000.spi: CE1 setup done
> [   13.152201] spi spi0.1: setup mode 0, 8 bits/w, 50000000 Hz max --> 0
> [   13.153185] spi-aspeed-smc 1e620000.spi: CE1 read OP 0x9f mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x6
> [   13.153399] spi-aspeed-smc 1e620000.spi: CE1 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x10
> [   13.153552] spi-aspeed-smc 1e620000.spi: CE1 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x8
> [   13.153674] spi-aspeed-smc 1e620000.spi: CE1 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x70
> [   13.153961] spi-aspeed-smc 1e620000.spi: CE1 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x24
> [   13.154180] spi-nor spi0.1: mx25l25635e (32768 Kbytes)
> [   13.215872] spi-aspeed-smc 1e620000.spi: CE2 new window [ 0x24000000 - 0x25ffffff ] 32MB
> [   13.215962] spi-aspeed-smc 1e620000.spi: calculate timing compensation - AHB freq: 180 MHz
> [   13.222431] spi-aspeed-smc 1e620000.spi: Trying HCLK/5 [203c0d41] ...
> [   13.250258] spi-aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 4ns DI delay : PASS
> [   13.278256] spi-aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 0ns DI delay : PASS
> [   13.306252] spi-aspeed-smc 1e620000.spi:   * [00000000] 1 HCLK delay, 4ns DI delay : PASS
> [   13.306337] spi-aspeed-smc 1e620000.spi:  * -> good is pass 1 [0x00000000]
> [   13.306392] spi-aspeed-smc 1e620000.spi: Trying HCLK/4 [203c0641] ...
> [   13.330735] spi-aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 4ns DI delay : PASS
> [   13.355007] spi-aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 0ns DI delay : PASS
> [   13.379274] spi-aspeed-smc 1e620000.spi:   * [00000000] 1 HCLK delay, 4ns DI delay : PASS
> [   13.379362] spi-aspeed-smc 1e620000.spi:  * -> good is pass 1 [0x00000000]
> [   13.379416] spi-aspeed-smc 1e620000.spi: Found good read timings at HCLK/4
> [   13.379465] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0641]
> [   13.460934] 1 fixed-partitions partitions found on MTD device spi0.1
> [   13.537042] Creating 1 MTD partitions on "spi0.1":
> [   14.145255] spi-aspeed-smc 1e620000.spi: registered child spi0.1
> [   28.287508] SPI driver bmp280 has no spi_device_id for bosch,bmp085
> [  116.047752] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x6 mode:1.0.0.0 naddr:0x0 ndummies:0x0 len:0x0
> [  116.047894] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x12 mode:1.1.0.1 naddr:0x4 ndummies:0x0 len:0x44
> [  116.048011] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1
> [  116.048109] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1
> [  116.048260] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x6 mode:1.0.0.0 naddr:0x0 ndummies:0x0 len:0x0
> [  116.048363] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x12 mode:1.1.0.1 naddr:0x4 ndummies:0x0 len:0xc
> [  116.048461] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1
> [  116.049421] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x6 mode:1.0.0.0 naddr:0x0 ndummies:0x0 len:0x0
> [  116.049559] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x12 mode:1.1.0.1 naddr:0x4 ndummies:0x0 len:0x44
> [  116.049676] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1
> [  116.049773] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1
> [  116.049872] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x6 mode:1.0.0.0 naddr:0x0 ndummies:0x0 len:0x0
> [  116.049969] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x12 mode:1.1.0.1 naddr:0x4 ndummies:0x0 len:0x39
> [  116.050070] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1
> [  116.050159] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1
> [  116.050307] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x6 mode:1.0.0.0 naddr:0x0 ndummies:0x0 len:0x0
> [  116.050416] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x12 mode:1.1.0.1 naddr:0x4 ndummies:0x0 len:0xc
> [  116.050513] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1

0x12 is "page program". I think that's where the slow down comes from.

you can switch off the logging after boot with :

   mount -t debugfs debugfs /sys/kernel/debug/
   echo -n "file drivers/spi/* -p" > /sys/kernel/debug/dynamic_debug/control

Thanks a lot for the tests !

C.

  
> 
> Cheers,
> 
> Tao
> 
> On Wed, Mar 02, 2022 at 07:23:15AM +0100, Cédric Le Goater wrote:
>> Hello Tao,
>>
>> On 3/2/22 07:05, Tao Ren wrote:
>>> Hi Cedric,
>>>
>>> I tested v2 on wedge100 (ast2400) and cmm (ast2500). I don't see any
>>> functional failures except below warning on ast2400.
>>
>> Thanks for the tests
>>
>>> Is it something we should worry about?
>>>
>>>> spi-aspeed-smc 1e620000.spi: No good frequency, using dumb slow
>>
>>
>> This means that the training failed for all HCLK settings. We never had
>> an AST2400 board with a second device on the FMC controller but we noticed
>> that any freq setting above 50MHz was unstable.
>>
>> Also, aspeed-g4.dtsi does not have any "spi-max-frequency" for flash@1.
>> This needs an update.
>>
>>> The v2 patch series (10 patches) were applied to linux stable 5.15.25,
>>> and below are the outputs on wedge100 (ast2400):
>>>
>>> root@wedge100-bmc:~# dmesg | grep -i spi
>>> [   11.479736] spi-nor spi0.0: mx25l25635e (32768 Kbytes)
>>> [   11.704313] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
>>> [   11.785842] 5 fixed-partitions partitions found on MTD device spi0.0
>>> [   11.862033] Creating 5 MTD partitions on "spi0.0":
>>> [   13.039009] spi-nor spi0.1: mx25l25635e (32768 Kbytes)
>>> [   13.107056] spi-aspeed-smc 1e620000.spi: No good frequency, using dumb slow
>>> [   13.190551] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0041]
>>> [   13.271959] 1 fixed-partitions partitions found on MTD device spi0.1
>>> [   13.348097] Creating 1 MTD partitions on "spi0.1":
>>
>> Curious. The device seems alive and very slow.
>>
>> Could you please add "dyndbg="file drivers/spi/* +p;" to the bootargs
>> and reboot ?
>>
>>
>>> [   28.169886] SPI driver bmp280 has no spi_device_id for bosch,bmp085
>>> root@wedge100-bmc:/tmp# cat /proc/mtd
>>> dev:    size   erasesize  name
>>> mtd0: 00060000 00010000 "u-boot"
>>> mtd1: 00020000 00010000 "env"
>>> mtd2: 01b80000 00010000 "fit"
>>> mtd3: 00400000 00010000 "data0"
>>> mtd4: 02000000 00010000 "flash0"
>>> mtd5: 02000000 00010000 "flash1"
>>> root@wedge100-bmc:/tmp# ls -l flash-wedge100
>>> -rw-r--r--    1 root     root      22867574 Mar  1 20:49 flash-wedge100
>>> root@wedge100-bmc:/tmp# time flashcp flash-wedge100 /dev/mtd4
>>>
>>> real    2m22.860s
>>> user    0m0.478s
>>> sys     2m10.647s
>>> root@wedge100-bmc:/tmp# ls -l flash-wedge100.v2021.13.1
>>> -rw-r--r--    1 root     root      19743390 Mar  1 10:10 flash-wedge100.v2021.13.1
>>> root@wedge100-bmc:/tmp# time flashcp flash-wedge100.v2021.13.1 /dev/mtd5
>>>
>>> real    2m23.144s
>>> user    0m0.409s
>>> sys     2m10.526s
>>
>> Since spi0.1 seems to be really slow, could you run
>>
>>    time mdsum /dev/mtd5
>>
>> and compare with flash-wedge100.v2021.13.1 ? But please update
>> "spi-max-frequency" in the DT first.
>>
>> Thanks,
>>
>> C.
>>
>>>
>>> And here are the outpus on cmm (ast2500):
>>>
>>> root@cmm001-oob:~# dmesg | grep -i spi
>>> [   15.172879] spi-nor spi0.0: mx25l25635e (32768 Kbytes)
>>> [   15.361516] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
>>> [   15.442978] 5 fixed-partitions partitions found on MTD device spi0.0
>>> [   15.519145] Creating 5 MTD partitions on "spi0.0":
>>> [   15.883123] spi-nor spi0.1: mx25l25635e (32768 Kbytes)
>>> [   16.071286] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0641]
>>> [   16.152711] 1 fixed-partitions partitions found on MTD device spi0.1
>>> [   16.228830] Creating 1 MTD partitions on "spi0.1":
>>> [   63.831721] SPI driver bmp280 has no spi_device_id for bosch,bmp085
>>> root@cmm001-oob:/tmp# cat /proc/mtd
>>> dev:    size   erasesize  name
>>> mtd0: 00060000 00001000 "u-boot"
>>> mtd1: 00020000 00001000 "env"
>>> mtd2: 01b80000 00001000 "fit"
>>> mtd3: 00400000 00001000 "data0"
>>> mtd4: 02000000 00001000 "flash0"
>>> mtd5: 02000000 00001000 "flash1"
>>> root@cmm001-oob:/tmp# ls -l /tmp/flash-cmm
>>> -rw-r--r--    1 root     root      23772278 Mar  1 21:04 /tmp/flash-cmm
>>> root@cmm001-oob:/tmp# time flashcp /tmp/flash-cmm /dev/mtd4
>>> real    3m37.154s
>>> user    0m0.260s
>>> sys     3m31.700s
>>> root@cmm001-oob:/tmp# ls -l /tmp/flash-cmm.v2021.48.0
>>> -rw-r--r--    1 root     root      23723958 Mar  1 21:07 /tmp/flash-cmm.v2021.48.0
>>> root@cmm001-oob:/tmp# time flashcp flash-cmm.v2021.48.0 /dev/mtd5
>>>
>>> real    3m33.843s
>>> user    0m0.458s
>>> sys     3m28.216s
>>>
>>>
>>> Cheers,
>>>
>>> Tao
>>>
>>> On Sun, Feb 27, 2022 at 07:53:37PM +0100, Cédric Le Goater wrote:
>>>> On 2/25/22 06:29, Joel Stanley wrote:
>>>>> Cedric has authored a new drive for the SPI NOR devices on the ASPEED
>>>>> SoCs. It supports 2400, 2500 and 2600. It is written using the spi-mem
>>>>> subsystem, which should mean it can go upstream.
>>>>>
>>>>> This is great news, as our current driver is half upstream, half in
>>>>> the openbmc tree, due to some issues getting it merged as part of the
>>>>> spi-nor subsystem.
>>>>>
>>>>> It would be great to have testing. I've created a commit that patches
>>>>> in support to whatever kernel tree you're using. Hopefully this makes
>>>>> it easier to test atop your internal branches:
>>>>>
>>>>> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/51551
>>>>>
>>>>> Cherry pick this commit into your tree, and see how it goes, and report back.
>>>>>
>>>>> I plan to switch the openbmc tree to this driver when we next rebase
>>>>> the kernel. We could also backport it to dev-5.15 as an option.
>>>>>
>>>>> You can direct testing results to this thread, or reply directly to
>>>>> the upstream thread:
>>>>>
>>>>> https://lore.kernel.org/all/20220214094231.3753686-1-clg@kaod.org/
>>>>
>>>> or grab the v2 from :
>>>>
>>>>     https://github.com/legoater/linux/tree/openbmc-5.15
>>>>
>>>> I have addressed the comments on driver bind/unbind.
>>>>
>>>> Thanks,
>>>>
>>>> C.
>>>>
>>>>>
>>>>> Cheers,
>>>>>
>>>>> Joel
>>>>>
>>>>> ---------- Forwarded message ---------
>>>>> From: Cédric Le Goater <clg@kaod.org>
>>>>> Date: Mon, 14 Feb 2022 at 09:42
>>>>> Subject: [PATCH 00/10] spi: spi-mem: Add driver for Aspeed SMC controllers
>>>>> To: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>
>>>>> Cc: Mark Brown <broonie@kernel.org>, Tudor Ambarus
>>>>> <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
>>>>> Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
>>>>> <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
>>>>> <linux-aspeed@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew
>>>>> Jeffery <andrew@aj.id.au>, Chin-Ting Kuo
>>>>> <chin-ting_kuo@aspeedtech.com>, <devicetree@vger.kernel.org>, Rob
>>>>> Herring <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
>>>>> <linux-kernel@vger.kernel.org>, Cédric Le Goater <clg@kaod.org>
>>>>>
>>>>>
>>>>> Hi,
>>>>>
>>>>> This series adds a new SPI driver using the spi-mem interface for the
>>>>> Aspeed static memory controllers of the AST2600, AST2500 and AST2400
>>>>> SoCs.
>>>>>
>>>>>     * AST2600 Firmware SPI Memory Controller (FMC)
>>>>>     * AST2600 SPI Flash Controller (SPI1 and SPI2)
>>>>>     * AST2500 Firmware SPI Memory Controller (FMC)
>>>>>     * AST2500 SPI Flash Controller (SPI1 and SPI2)
>>>>>     * AST2400 New Static Memory Controller (also referred as FMC)
>>>>>     * AST2400 SPI Flash Controller (SPI)
>>>>>
>>>>> It is based on the current OpenBMC kernel driver [1], using directly
>>>>> the MTD SPI-NOR interface and on a patchset [2] previously proposed
>>>>> adding support for the AST2600 only. This driver takes a slightly
>>>>> different approach to cover all 6 controllers.
>>>>>
>>>>> It does not make use of the controller register disabling Address and
>>>>> Data byte lanes because is not available on the AST2400 SoC. We could
>>>>> introduce a specific handler for new features available on recent SoCs
>>>>> if needed. As there is not much difference on performance, the driver
>>>>> chooses the common denominator: "User mode" which has been heavily
>>>>> tested in [1]. "User mode" is also used as a fall back method when
>>>>> flash device mapping window is too small.
>>>>>
>>>>> Problems to address with spi-mem were the configuration of the mapping
>>>>> windows and the calibration of the read timings. The driver handles
>>>>> them in the direct mapping handler when some knowledge on the size of
>>>>> the flash device is know. It is not perfect but not incorrect either.
>>>>> The algorithm is one from [1] because it doesn't require the DMA
>>>>> registers which are not available on all controllers.
>>>>>
>>>>> Direct mapping for writes is not supported (yet). I have seen some
>>>>> corruption with writes and I preferred to use the safer and proven
>>>>> method of the initial driver [1]. We can improve that later.
>>>>>
>>>>> The driver supports Quad SPI RX transfers on the AST2600 SoC but it
>>>>> didn't have the expected results. Therefore it is not activated yet.
>>>>> This needs more tests.
>>>>>
>>>>> The series does not remove the current Aspeed SMC driver but prepares
>>>>> ground for its removal by changing its CONFIG option. This last step
>>>>> can be addressed as a followup when the new driver using the spi-mem
>>>>> interface has been sufficiently exposed.
>>>>>
>>>>> Tested on:
>>>>>
>>>>>     * OpenPOWER Palmetto (AST2400)
>>>>>     * Evaluation board (AST2500)
>>>>>     * OpenPOWER Witherspoon (AST2500)
>>>>>     * Evaluation board (AST2600 A0)
>>>>>     * Rainier board (AST2600)
>>>>>
>>>>> [1] https://github.com/openbmc/linux/blob/dev-5.15/drivers/mtd/spi-nor/controllers/aspeed-smc.c
>>>>> [2] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=212394
>>>>>
>>>>> Thanks,
>>>>>
>>>>> C.
>>>>>
>>>>> Cédric Le Goater (10):
>>>>>      mtd: spi-nor: aspeed: Rename Kconfig option
>>>>>      dt-bindings: spi: Add Aspeed SMC controllers device tree binding
>>>>>      spi: spi-mem: Add driver for Aspeed SMC controllers
>>>>>      spi: aspeed: Add support for direct mapping
>>>>>      spi: aspeed: Adjust direct mapping to device size
>>>>>      spi: aspeed: Workaround AST2500 limitations
>>>>>      spi: aspeed: Add support for the AST2400 SPI controller
>>>>>      spi: aspeed: Calibrate read timings
>>>>>      ARM: dts: aspeed: Enable Dual SPI RX transfers
>>>>>      spi: aspeed: Activate new spi-mem driver
>>>>>
>>>>>     drivers/spi/spi-aspeed-smc.c                  | 1241 +++++++++++++++++
>>>>>     .../bindings/spi/aspeed,ast2600-fmc.yaml      |   92 ++
>>>>>     arch/arm/boot/dts/aspeed-g4.dtsi              |    6 +
>>>>>     arch/arm/boot/dts/aspeed-g5.dtsi              |    7 +
>>>>>     arch/arm/boot/dts/aspeed-g6.dtsi              |    8 +
>>>>>     drivers/mtd/spi-nor/controllers/Kconfig       |    4 +-
>>>>>     drivers/mtd/spi-nor/controllers/Makefile      |    2 +-
>>>>>     drivers/spi/Kconfig                           |   11 +
>>>>>     drivers/spi/Makefile                          |    1 +
>>>>>     9 files changed, 1369 insertions(+), 3 deletions(-)
>>>>>     create mode 100644 drivers/spi/spi-aspeed-smc.c
>>>>>     create mode 100644
>>>>> Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
>>>>>
>>>>> --
>>>>> 2.34.1
>>>>
>>

