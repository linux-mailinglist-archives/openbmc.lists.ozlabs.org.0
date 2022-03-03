Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3B94CB6A5
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 07:04:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8L656cGyz3brR
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 17:04:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eDZws9z6;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eDZws9z6; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8L5d5qDpz30KP
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2022 17:03:49 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 p3-20020a17090a680300b001bbfb9d760eso6816585pjj.2
 for <openbmc@lists.ozlabs.org>; Wed, 02 Mar 2022 22:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=s4VAWjdZeYRYmlE1FBRxrUfTEliVx/0FRsVVEZYYQDc=;
 b=eDZws9z6M7YEZy61eFmZRDUMphe/tu9PgBs9+u0zrZi5iW36TFBf5nmyhrkWNGOKNq
 s+lXnJaXyiq0XFsQifADKa92QJA4nikVdO6zcIL9QqUSfKheX6n0LCG2kFM2mhL4jupx
 qr0XeTxRq53/wc3RsaU7R7KmDHyhIcq+/UqCBz2NrQBiOupD939+O4//4543Ntd2IOaF
 Ay2H0d8eDa3xc4VLnQJORxzsTheiJtCusFktnLdSwMUeq4qP+H5XYmoASIBb6tKPNRCg
 PIRqXBdxFdqabFR6/6sYn6WQwzHLApsm7Su1fM4wKtvGX3I8x6Hj+vErXAQsj8NlbYnm
 le2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=s4VAWjdZeYRYmlE1FBRxrUfTEliVx/0FRsVVEZYYQDc=;
 b=TEWAhHLeHnFYBCAz2bPWBqezPm+Hy9B9GH+5ir8ATay2sZp07lrr6zsQ04BjhIEecQ
 YPyIK0Daeu8jPDiolhutu+fOB4sDNFwr02asPkO+uL1zz4RJKphhJ0UTIkz9XD61vQGw
 S9nWgQDqX3r5QUySjyNVGtJb7ib7Cw70gXvQSea8CX8KWW/GhWPoxjowbixpniO4oFQ0
 e78O2ZuntjQ2HtS6re0/6uMY7gSOSTlGx71EQoXH4TNEtuQ0FzYRyy5Tdqfvrw9JK6tu
 weDnq+47BiBG7Ystz2aURiQA8V/a5oQb/VWm8w30ycKTLHa3UEA8A2eX5QCdk/cTHAiH
 d/UA==
X-Gm-Message-State: AOAM532EzKs1hfy4A8oleR4Vr5eAjZiRtQi3VJR5VpWKhrUeAcmawox5
 D1Fo23oB2KFzaZ/nlxbFXgD/GgU7uY/sPg==
X-Google-Smtp-Source: ABdhPJwCw7xf7Vi71djt8KMy+gJA/KYOhxXRztJASItdwL03o75m0tsHCxe8KP8lYv4Z11i9Ftb/XQ==
X-Received: by 2002:a17:902:d2d1:b0:14f:e2ce:cca6 with SMTP id
 n17-20020a170902d2d100b0014fe2cecca6mr34060495plc.83.1646287427502; 
 Wed, 02 Mar 2022 22:03:47 -0800 (PST)
Received: from taoren-fedora-PC23YAB4 ([98.47.137.113])
 by smtp.gmail.com with ESMTPSA id
 k5-20020aa788c5000000b004df7bf0a290sm1112235pff.1.2022.03.02.22.03.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 22:03:46 -0800 (PST)
Date: Wed, 2 Mar 2022 22:03:40 -0800
From: Tao Ren <rentao.bupt@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
Message-ID: <YiBaPFWQcX4tCBlM@taoren-fedora-PC23YAB4>
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <ddac71ef-5b7d-31fe-3ee6-fe837b326697@kaod.org>
 <Yh8JIGpm4ZE1OXzl@taoren-fedora-PC23YAB4>
 <1806afc0-f716-4713-6ce6-0c46326c7655@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1806afc0-f716-4713-6ce6-0c46326c7655@kaod.org>
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

Hi Cedric,

The "No good frequency" warning is gone after updating spi-max-frequency
to 50MHz in aspeed-g4.dtsi (thanks). I don't see any functional failures,
but flashcp ran slower compared to the mtd/spi-nor driver(~200 sec vs.
~145 sec when flashcp 32MB data to flash1).

Below are the new results on ast2400:

root@wedge100-bmc:~# dmesg | grep -i spi
[   11.501808] spi-nor spi0.0: mx25l25635e (32768 Kbytes)
[   11.726388] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
[   11.807925] 5 fixed-partitions partitions found on MTD device spi0.0
[   11.884113] Creating 5 MTD partitions on "spi0.0":
[   13.036819] spi-nor spi0.1: mx25l25635e (32768 Kbytes)
[   13.260858] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0641]
[   13.342318] 1 fixed-partitions partitions found on MTD device spi0.1
[   13.418426] Creating 1 MTD partitions on "spi0.1":
[   28.239488] SPI driver bmp280 has no spi_device_id for bosch,bmp085
root@wedge100-bmc:~# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00060000 00010000 "u-boot"
mtd1: 00020000 00010000 "env"
mtd2: 01b80000 00010000 "fit"
mtd3: 00400000 00010000 "data0"
mtd4: 02000000 00010000 "flash0"
mtd5: 02000000 00010000 "flash1"
root@wedge100-bmc:~# dd if=/dev/urandom of=/tmp/dummy.bin bs=32MB count=1
1+0 records in
1+0 records out
root@wedge100-bmc:~# ls -l /tmp/dummy.bin
-rw-r--r--    1 root     root      32000000 Mar  2 14:45 /tmp/dummy.bin
root@wedge100-bmc:~# time flashcp /tmp/dummy.bin /dev/mtd5

real    3m21.837s
user    0m0.557s
sys     3m4.629s
root@wedge100-bmc:~# time md5sum /dev/mtd5
6903a022e1e8f624ed3beb31aa94c528  /dev/mtd5

real    0m6.869s
user    0m2.492s
sys     0m3.738s
root@wedge100-bmc:~# md5sum /tmp/dummy.bin
7205977a323b482f637123e43ab31a18  /tmp/dummy.bin

And below are the logs after appending "dyndbg" boot args:

root@wedge100-bmc:~# dmesg | grep -i spi
[    0.000000] Kernel command line: console=ttyS2,9600n8 root=/dev/ram rw dyndbg="file drivers/spi/* +p;"
[   11.594461] spi-aspeed-smc 1e620000.spi: registered master spi0
[   11.594628] spi-aspeed-smc 1e620000.spi: CE0 default window [ 0x20000000 - 0x21ffffff ] 32MB
[   11.594709] spi-aspeed-smc 1e620000.spi: CE0 setup done
[   11.594763] spi spi0.0: setup mode 0, 8 bits/w, 50000000 Hz max --> 0
[   11.595737] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x9f mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x6
[   11.595950] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x10
[   11.596103] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x8
[   11.596226] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x70
[   11.596513] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x24
[   11.596732] spi-nor spi0.0: mx25l25635e (32768 Kbytes)
[   11.658369] spi-aspeed-smc 1e620000.spi: CE1 new window [ 0x22000000 - 0x23ffffff ] 32MB
[   11.658457] spi-aspeed-smc 1e620000.spi: calculate timing compensation - AHB freq: 180 MHz
[   11.664951] spi-aspeed-smc 1e620000.spi: Trying HCLK/5 [203c0d41] ...
[   11.692905] spi-aspeed-smc 1e620000.spi:   * [00080000] 0 HCLK delay, 4ns DI delay : PASS
[   11.720911] spi-aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 0ns DI delay : PASS
[   11.749067] spi-aspeed-smc 1e620000.spi:   * [00090000] 1 HCLK delay, 4ns DI delay : PASS
[   11.749155] spi-aspeed-smc 1e620000.spi:  * -> good is pass 1 [0x00000000]
[   11.749209] spi-aspeed-smc 1e620000.spi: Trying HCLK/4 [203c0641] ...
[   11.773556] spi-aspeed-smc 1e620000.spi:   * [00008000] 0 HCLK delay, 4ns DI delay : PASS
[   11.797835] spi-aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 0ns DI delay : PASS
[   11.822419] spi-aspeed-smc 1e620000.spi:   * [00009000] 1 HCLK delay, 4ns DI delay : PASS
[   11.822505] spi-aspeed-smc 1e620000.spi:  * -> good is pass 1 [0x00000000]
[   11.822558] spi-aspeed-smc 1e620000.spi: Found good read timings at HCLK/4
[   11.822607] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
[   11.904076] 5 fixed-partitions partitions found on MTD device spi0.0
[   11.980270] Creating 5 MTD partitions on "spi0.0":
[   13.151908] spi-aspeed-smc 1e620000.spi: registered child spi0.0
[   13.152074] spi-aspeed-smc 1e620000.spi: CE1 default window [ 0x22000000 - 0x23ffffff ] 32MB
[   13.152151] spi-aspeed-smc 1e620000.spi: CE1 setup done
[   13.152201] spi spi0.1: setup mode 0, 8 bits/w, 50000000 Hz max --> 0
[   13.153185] spi-aspeed-smc 1e620000.spi: CE1 read OP 0x9f mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x6
[   13.153399] spi-aspeed-smc 1e620000.spi: CE1 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x10
[   13.153552] spi-aspeed-smc 1e620000.spi: CE1 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x8
[   13.153674] spi-aspeed-smc 1e620000.spi: CE1 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x70
[   13.153961] spi-aspeed-smc 1e620000.spi: CE1 read OP 0x5a mode:1.1.1.1 naddr:0x3 ndummies:0x1 len:0x24
[   13.154180] spi-nor spi0.1: mx25l25635e (32768 Kbytes)
[   13.215872] spi-aspeed-smc 1e620000.spi: CE2 new window [ 0x24000000 - 0x25ffffff ] 32MB
[   13.215962] spi-aspeed-smc 1e620000.spi: calculate timing compensation - AHB freq: 180 MHz
[   13.222431] spi-aspeed-smc 1e620000.spi: Trying HCLK/5 [203c0d41] ...
[   13.250258] spi-aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 4ns DI delay : PASS
[   13.278256] spi-aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 0ns DI delay : PASS
[   13.306252] spi-aspeed-smc 1e620000.spi:   * [00000000] 1 HCLK delay, 4ns DI delay : PASS
[   13.306337] spi-aspeed-smc 1e620000.spi:  * -> good is pass 1 [0x00000000]
[   13.306392] spi-aspeed-smc 1e620000.spi: Trying HCLK/4 [203c0641] ...
[   13.330735] spi-aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 4ns DI delay : PASS
[   13.355007] spi-aspeed-smc 1e620000.spi:   * [00000000] 0 HCLK delay, 0ns DI delay : PASS
[   13.379274] spi-aspeed-smc 1e620000.spi:   * [00000000] 1 HCLK delay, 4ns DI delay : PASS
[   13.379362] spi-aspeed-smc 1e620000.spi:  * -> good is pass 1 [0x00000000]
[   13.379416] spi-aspeed-smc 1e620000.spi: Found good read timings at HCLK/4
[   13.379465] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0641]
[   13.460934] 1 fixed-partitions partitions found on MTD device spi0.1
[   13.537042] Creating 1 MTD partitions on "spi0.1":
[   14.145255] spi-aspeed-smc 1e620000.spi: registered child spi0.1
[   28.287508] SPI driver bmp280 has no spi_device_id for bosch,bmp085
[  116.047752] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x6 mode:1.0.0.0 naddr:0x0 ndummies:0x0 len:0x0
[  116.047894] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x12 mode:1.1.0.1 naddr:0x4 ndummies:0x0 len:0x44
[  116.048011] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1
[  116.048109] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1
[  116.048260] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x6 mode:1.0.0.0 naddr:0x0 ndummies:0x0 len:0x0
[  116.048363] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x12 mode:1.1.0.1 naddr:0x4 ndummies:0x0 len:0xc
[  116.048461] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1
[  116.049421] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x6 mode:1.0.0.0 naddr:0x0 ndummies:0x0 len:0x0
[  116.049559] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x12 mode:1.1.0.1 naddr:0x4 ndummies:0x0 len:0x44
[  116.049676] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1
[  116.049773] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1
[  116.049872] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x6 mode:1.0.0.0 naddr:0x0 ndummies:0x0 len:0x0
[  116.049969] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x12 mode:1.1.0.1 naddr:0x4 ndummies:0x0 len:0x39
[  116.050070] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1
[  116.050159] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1
[  116.050307] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x6 mode:1.0.0.0 naddr:0x0 ndummies:0x0 len:0x0
[  116.050416] spi-aspeed-smc 1e620000.spi: CE0 write OP 0x12 mode:1.1.0.1 naddr:0x4 ndummies:0x0 len:0xc
[  116.050513] spi-aspeed-smc 1e620000.spi: CE0 read OP 0x5 mode:1.0.0.1 naddr:0x0 ndummies:0x0 len:0x1


Cheers,

Tao

On Wed, Mar 02, 2022 at 07:23:15AM +0100, Cédric Le Goater wrote:
> Hello Tao,
> 
> On 3/2/22 07:05, Tao Ren wrote:
> > Hi Cedric,
> > 
> > I tested v2 on wedge100 (ast2400) and cmm (ast2500). I don't see any
> > functional failures except below warning on ast2400.
> 
> Thanks for the tests
> 
> > Is it something we should worry about?
> > 
> > > spi-aspeed-smc 1e620000.spi: No good frequency, using dumb slow
> 
> 
> This means that the training failed for all HCLK settings. We never had
> an AST2400 board with a second device on the FMC controller but we noticed
> that any freq setting above 50MHz was unstable.
> 
> Also, aspeed-g4.dtsi does not have any "spi-max-frequency" for flash@1.
> This needs an update.
> 
> > The v2 patch series (10 patches) were applied to linux stable 5.15.25,
> > and below are the outputs on wedge100 (ast2400):
> > 
> > root@wedge100-bmc:~# dmesg | grep -i spi
> > [   11.479736] spi-nor spi0.0: mx25l25635e (32768 Kbytes)
> > [   11.704313] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
> > [   11.785842] 5 fixed-partitions partitions found on MTD device spi0.0
> > [   11.862033] Creating 5 MTD partitions on "spi0.0":
> > [   13.039009] spi-nor spi0.1: mx25l25635e (32768 Kbytes)
> > [   13.107056] spi-aspeed-smc 1e620000.spi: No good frequency, using dumb slow
> > [   13.190551] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0041]
> > [   13.271959] 1 fixed-partitions partitions found on MTD device spi0.1
> > [   13.348097] Creating 1 MTD partitions on "spi0.1":
> 
> Curious. The device seems alive and very slow.
> 
> Could you please add "dyndbg="file drivers/spi/* +p;" to the bootargs
> and reboot ?
> 
> 
> > [   28.169886] SPI driver bmp280 has no spi_device_id for bosch,bmp085
> > root@wedge100-bmc:/tmp# cat /proc/mtd
> > dev:    size   erasesize  name
> > mtd0: 00060000 00010000 "u-boot"
> > mtd1: 00020000 00010000 "env"
> > mtd2: 01b80000 00010000 "fit"
> > mtd3: 00400000 00010000 "data0"
> > mtd4: 02000000 00010000 "flash0"
> > mtd5: 02000000 00010000 "flash1"
> > root@wedge100-bmc:/tmp# ls -l flash-wedge100
> > -rw-r--r--    1 root     root      22867574 Mar  1 20:49 flash-wedge100
> > root@wedge100-bmc:/tmp# time flashcp flash-wedge100 /dev/mtd4
> > 
> > real    2m22.860s
> > user    0m0.478s
> > sys     2m10.647s
> > root@wedge100-bmc:/tmp# ls -l flash-wedge100.v2021.13.1
> > -rw-r--r--    1 root     root      19743390 Mar  1 10:10 flash-wedge100.v2021.13.1
> > root@wedge100-bmc:/tmp# time flashcp flash-wedge100.v2021.13.1 /dev/mtd5
> > 
> > real    2m23.144s
> > user    0m0.409s
> > sys     2m10.526s
> 
> Since spi0.1 seems to be really slow, could you run
> 
>   time mdsum /dev/mtd5
> 
> and compare with flash-wedge100.v2021.13.1 ? But please update
> "spi-max-frequency" in the DT first.
> 
> Thanks,
> 
> C.
> 
> > 
> > And here are the outpus on cmm (ast2500):
> > 
> > root@cmm001-oob:~# dmesg | grep -i spi
> > [   15.172879] spi-nor spi0.0: mx25l25635e (32768 Kbytes)
> > [   15.361516] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:2 [0x203c0641]
> > [   15.442978] 5 fixed-partitions partitions found on MTD device spi0.0
> > [   15.519145] Creating 5 MTD partitions on "spi0.0":
> > [   15.883123] spi-nor spi0.1: mx25l25635e (32768 Kbytes)
> > [   16.071286] spi-aspeed-smc 1e620000.spi: CE1 read buswidth:2 [0x203c0641]
> > [   16.152711] 1 fixed-partitions partitions found on MTD device spi0.1
> > [   16.228830] Creating 1 MTD partitions on "spi0.1":
> > [   63.831721] SPI driver bmp280 has no spi_device_id for bosch,bmp085
> > root@cmm001-oob:/tmp# cat /proc/mtd
> > dev:    size   erasesize  name
> > mtd0: 00060000 00001000 "u-boot"
> > mtd1: 00020000 00001000 "env"
> > mtd2: 01b80000 00001000 "fit"
> > mtd3: 00400000 00001000 "data0"
> > mtd4: 02000000 00001000 "flash0"
> > mtd5: 02000000 00001000 "flash1"
> > root@cmm001-oob:/tmp# ls -l /tmp/flash-cmm
> > -rw-r--r--    1 root     root      23772278 Mar  1 21:04 /tmp/flash-cmm
> > root@cmm001-oob:/tmp# time flashcp /tmp/flash-cmm /dev/mtd4
> > real    3m37.154s
> > user    0m0.260s
> > sys     3m31.700s
> > root@cmm001-oob:/tmp# ls -l /tmp/flash-cmm.v2021.48.0
> > -rw-r--r--    1 root     root      23723958 Mar  1 21:07 /tmp/flash-cmm.v2021.48.0
> > root@cmm001-oob:/tmp# time flashcp flash-cmm.v2021.48.0 /dev/mtd5
> > 
> > real    3m33.843s
> > user    0m0.458s
> > sys     3m28.216s
> > 
> > 
> > Cheers,
> > 
> > Tao
> > 
> > On Sun, Feb 27, 2022 at 07:53:37PM +0100, Cédric Le Goater wrote:
> > > On 2/25/22 06:29, Joel Stanley wrote:
> > > > Cedric has authored a new drive for the SPI NOR devices on the ASPEED
> > > > SoCs. It supports 2400, 2500 and 2600. It is written using the spi-mem
> > > > subsystem, which should mean it can go upstream.
> > > > 
> > > > This is great news, as our current driver is half upstream, half in
> > > > the openbmc tree, due to some issues getting it merged as part of the
> > > > spi-nor subsystem.
> > > > 
> > > > It would be great to have testing. I've created a commit that patches
> > > > in support to whatever kernel tree you're using. Hopefully this makes
> > > > it easier to test atop your internal branches:
> > > > 
> > > > https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/51551
> > > > 
> > > > Cherry pick this commit into your tree, and see how it goes, and report back.
> > > > 
> > > > I plan to switch the openbmc tree to this driver when we next rebase
> > > > the kernel. We could also backport it to dev-5.15 as an option.
> > > > 
> > > > You can direct testing results to this thread, or reply directly to
> > > > the upstream thread:
> > > > 
> > > > https://lore.kernel.org/all/20220214094231.3753686-1-clg@kaod.org/
> > > 
> > > or grab the v2 from :
> > > 
> > >    https://github.com/legoater/linux/tree/openbmc-5.15
> > > 
> > > I have addressed the comments on driver bind/unbind.
> > > 
> > > Thanks,
> > > 
> > > C.
> > > 
> > > > 
> > > > Cheers,
> > > > 
> > > > Joel
> > > > 
> > > > ---------- Forwarded message ---------
> > > > From: Cédric Le Goater <clg@kaod.org>
> > > > Date: Mon, 14 Feb 2022 at 09:42
> > > > Subject: [PATCH 00/10] spi: spi-mem: Add driver for Aspeed SMC controllers
> > > > To: <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>
> > > > Cc: Mark Brown <broonie@kernel.org>, Tudor Ambarus
> > > > <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, Miquel
> > > > Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
> > > > <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
> > > > <linux-aspeed@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, Andrew
> > > > Jeffery <andrew@aj.id.au>, Chin-Ting Kuo
> > > > <chin-ting_kuo@aspeedtech.com>, <devicetree@vger.kernel.org>, Rob
> > > > Herring <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
> > > > <linux-kernel@vger.kernel.org>, Cédric Le Goater <clg@kaod.org>
> > > > 
> > > > 
> > > > Hi,
> > > > 
> > > > This series adds a new SPI driver using the spi-mem interface for the
> > > > Aspeed static memory controllers of the AST2600, AST2500 and AST2400
> > > > SoCs.
> > > > 
> > > >    * AST2600 Firmware SPI Memory Controller (FMC)
> > > >    * AST2600 SPI Flash Controller (SPI1 and SPI2)
> > > >    * AST2500 Firmware SPI Memory Controller (FMC)
> > > >    * AST2500 SPI Flash Controller (SPI1 and SPI2)
> > > >    * AST2400 New Static Memory Controller (also referred as FMC)
> > > >    * AST2400 SPI Flash Controller (SPI)
> > > > 
> > > > It is based on the current OpenBMC kernel driver [1], using directly
> > > > the MTD SPI-NOR interface and on a patchset [2] previously proposed
> > > > adding support for the AST2600 only. This driver takes a slightly
> > > > different approach to cover all 6 controllers.
> > > > 
> > > > It does not make use of the controller register disabling Address and
> > > > Data byte lanes because is not available on the AST2400 SoC. We could
> > > > introduce a specific handler for new features available on recent SoCs
> > > > if needed. As there is not much difference on performance, the driver
> > > > chooses the common denominator: "User mode" which has been heavily
> > > > tested in [1]. "User mode" is also used as a fall back method when
> > > > flash device mapping window is too small.
> > > > 
> > > > Problems to address with spi-mem were the configuration of the mapping
> > > > windows and the calibration of the read timings. The driver handles
> > > > them in the direct mapping handler when some knowledge on the size of
> > > > the flash device is know. It is not perfect but not incorrect either.
> > > > The algorithm is one from [1] because it doesn't require the DMA
> > > > registers which are not available on all controllers.
> > > > 
> > > > Direct mapping for writes is not supported (yet). I have seen some
> > > > corruption with writes and I preferred to use the safer and proven
> > > > method of the initial driver [1]. We can improve that later.
> > > > 
> > > > The driver supports Quad SPI RX transfers on the AST2600 SoC but it
> > > > didn't have the expected results. Therefore it is not activated yet.
> > > > This needs more tests.
> > > > 
> > > > The series does not remove the current Aspeed SMC driver but prepares
> > > > ground for its removal by changing its CONFIG option. This last step
> > > > can be addressed as a followup when the new driver using the spi-mem
> > > > interface has been sufficiently exposed.
> > > > 
> > > > Tested on:
> > > > 
> > > >    * OpenPOWER Palmetto (AST2400)
> > > >    * Evaluation board (AST2500)
> > > >    * OpenPOWER Witherspoon (AST2500)
> > > >    * Evaluation board (AST2600 A0)
> > > >    * Rainier board (AST2600)
> > > > 
> > > > [1] https://github.com/openbmc/linux/blob/dev-5.15/drivers/mtd/spi-nor/controllers/aspeed-smc.c
> > > > [2] https://patchwork.ozlabs.org/project/linux-aspeed/list/?series=212394
> > > > 
> > > > Thanks,
> > > > 
> > > > C.
> > > > 
> > > > Cédric Le Goater (10):
> > > >     mtd: spi-nor: aspeed: Rename Kconfig option
> > > >     dt-bindings: spi: Add Aspeed SMC controllers device tree binding
> > > >     spi: spi-mem: Add driver for Aspeed SMC controllers
> > > >     spi: aspeed: Add support for direct mapping
> > > >     spi: aspeed: Adjust direct mapping to device size
> > > >     spi: aspeed: Workaround AST2500 limitations
> > > >     spi: aspeed: Add support for the AST2400 SPI controller
> > > >     spi: aspeed: Calibrate read timings
> > > >     ARM: dts: aspeed: Enable Dual SPI RX transfers
> > > >     spi: aspeed: Activate new spi-mem driver
> > > > 
> > > >    drivers/spi/spi-aspeed-smc.c                  | 1241 +++++++++++++++++
> > > >    .../bindings/spi/aspeed,ast2600-fmc.yaml      |   92 ++
> > > >    arch/arm/boot/dts/aspeed-g4.dtsi              |    6 +
> > > >    arch/arm/boot/dts/aspeed-g5.dtsi              |    7 +
> > > >    arch/arm/boot/dts/aspeed-g6.dtsi              |    8 +
> > > >    drivers/mtd/spi-nor/controllers/Kconfig       |    4 +-
> > > >    drivers/mtd/spi-nor/controllers/Makefile      |    2 +-
> > > >    drivers/spi/Kconfig                           |   11 +
> > > >    drivers/spi/Makefile                          |    1 +
> > > >    9 files changed, 1369 insertions(+), 3 deletions(-)
> > > >    create mode 100644 drivers/spi/spi-aspeed-smc.c
> > > >    create mode 100644
> > > > Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml
> > > > 
> > > > --
> > > > 2.34.1
> > > 
> 
