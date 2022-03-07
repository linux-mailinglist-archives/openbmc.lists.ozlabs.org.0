Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E774CFF95
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 14:07:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBzJL2rdmz3bVW
	for <lists+openbmc@lfdr.de>; Tue,  8 Mar 2022 00:07:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.125.2;
 helo=smtpout1.mo529.mail-out.ovh.net; envelope-from=clg@kaod.org;
 receiver=<UNKNOWN>)
Received: from smtpout1.mo529.mail-out.ovh.net
 (smtpout1.mo529.mail-out.ovh.net [178.32.125.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBzJ23Dxcz2xrj
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2022 00:06:55 +1100 (AEDT)
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.132])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 70A61E709D2F;
 Mon,  7 Mar 2022 14:06:52 +0100 (CET)
Received: from kaod.org (37.59.142.104) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 7 Mar
 2022 14:06:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005770ace9c-1c0c-49a9-be00-3d02bfcb209a,
 2E53EE1553C3E30B03D111E4FD0BE5C715152E82) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 129.41.46.1
Message-ID: <39cb3c3b-f07d-de60-7208-106be9485034@kaod.org>
Date: Mon, 7 Mar 2022 14:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
Content-Language: en-US
To: Lei Yu <yulei.sh@bytedance.com>, Joel Stanley <joel@jms.id.au>
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
 <CACPK8Xf6Zp7Zeu3wrRFHsctEKXfoYkJhbV+PSby0CmP72LC7aQ@mail.gmail.com>
 <CAGm54UGabB9Ji9HBm_d=FnLB5DxMKgvtdnP=2Mc-TJdPo5Ld8Q@mail.gmail.com>
 <CAGm54UGnjxhX4wsbZGJZJUWaiWXO1VONkxww=XnpyyyWeuF_hw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAGm54UGnjxhX4wsbZGJZJUWaiWXO1VONkxww=XnpyyyWeuF_hw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c7460112-4e16-4bbb-8c1b-e6c42ff86db2
X-Ovh-Tracer-Id: 246572080605924259
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddugedggeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhihrghnpggthhgvnhesrghsphgvvgguthgvtghhrdgtohhm
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, John Wang <wangzq.jn@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

  On 3/7/22 10:41, Lei Yu wrote:
> We hit some issues with the new driver, and here is some detailed info.
> 
> * Our system (not yet upstreamed) uses `mx66l51235f` as the FMC SPI
> flash, and we created a QEMU model.
>
> * When the dts is like "default":
>   &fmc {
>          pinctrl-names = "default";
>          status = "okay";
>          flash@0 {
>                  status = "okay";
>                  m25p,fast-read;
>                  label = "bmc";
>                  spi-max-frequency = <50000000>;
>   #include "openbmc-flash-layout-64.dtsi"
>          };
>   };
> 1. Run the image in ast2600-evb QEMU, it boots fine;
> 2. We have a model (g220b) in QEMU that uses mx66l51235f as the fmc
> SPI (`amc->fmc_model = "mx66l51235f";`), it boots with below error:
>   [    1.848286] vmap allocation for size 268439552 failed: use
> vmalloc=<size> to increase size
>   [    1.848774] spi-aspeed-smc 1e620000.spi: ioremap failed for
> resource [mem 0x20000000-0x2fffffff]
>   [    1.849898] spi-aspeed-smc: probe of 1e620000.spi failed with error -12
> 3. If I manually add vmalloc to the kernel command line (setenv
> bootargs 'console=ttyS4,115200n8 root=/dev/ram rw vmalloc=400M'), the
> above QEMU model boots fine.
> 4. On the real system, it behaves the same as QEMU, that I need to add
> `vmalloc=400M` to make it boot OK.

I don't see why. Is that the same kernel version and config ?

May be check the allocations in

   /proc/vmallocinfo


> * When the dts set `spi-tx-bus-width/spi-rx-bus-width = <4>`, and uses
> pinctrl_fwqspid_default from @Joel Stanley's pinctrl patch:
>   &fmc {
>          pinctrl-names = "default";
>          pinctrl-0 = <&pinctrl_fwqspid_default>;
>          status = "okay";
>          flash@0 {
>                  status = "okay";
>                  m25p,fast-read;
>                  label = "bmc";
>                  spi-max-frequency = <50000000>;
>                  spi-tx-bus-width = <4>;
>                  spi-rx-bus-width = <4>;
>   #include "openbmc-flash-layout-64.dtsi"
>          };
>   };
> 1. It fails to boot in ast2600-evb QEMU:
>   [    0.586654] spi-nor: probe of spi0.0 failed with error -5
>   [    0.587654] spi-nor spi0.1: unrecognized JEDEC id bytes: 00 00 00 00 00 00
> 2. It fails to boot in the g220b model with the same vmalloc failure issue.
> 2. With `vmalloc=400M`, the g220b model boots fine in QEMU.
> 3. On the real system, it still fails to boot with `vmalloc=400M` due
> to the below error:
>   [    0.970091] spi-nor spi0.0: unrecognized JEDEC id bytes: ff ff ff ff ff ff
>   [    0.977902] spi-nor: probe of spi0.0 failed with error -2


I could not make Quad work reliably on HW. This is the next step after the
new driver is merged.

Thanks for tests !

C.

