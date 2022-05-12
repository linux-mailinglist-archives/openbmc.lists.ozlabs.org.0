Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC775247EC
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 10:35:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzQ7r6HVfz3bb0
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 18:35:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=EImf0ftY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=EImf0ftY; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzQ7R3kPPz3bb0
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 18:34:43 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id EBFFB87E;
 Thu, 12 May 2022 01:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1652344481;
 bh=SJKIaEPn7eIdekh6AeGHKKv0XoOClHLZeVlLDOHSgtc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EImf0ftYMFAEVvhKBh+/9WFkz3RAWIcsdNJ7vXSS5gs5WuqPgupvM11PM+IfEiH+s
 6TJ8/0Wt1kGbjm1f04kczln4+vM/6j8xMBvTg91Bfav0C7YvailcKcNougC3p9+O6R
 I7nCaah3S6Wvu+kPLi7FUMzLNsj2ASU1V3XSLCPQ=
Date: Thu, 12 May 2022 01:34:37 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2] ARM: dts: aspeed: add
 Delta AHE-50DC BMC
Message-ID: <YnzGnWjkYdMUUNyM@hatter.bewilderbeest.net>
References: <20220511220542.4394-1-zev@bewilderbeest.net>
 <CACPK8XdYMzsEQXHYwdx7si9SBUhD9xeB+0D2eGgoR-LKosq4Tg@mail.gmail.com>
 <CACPK8Xe5EAxA8JxZBtqrkDKO3Vd4nCmuZ7sOityYXDF4wZ=CHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xe5EAxA8JxZBtqrkDKO3Vd4nCmuZ7sOityYXDF4wZ=CHg@mail.gmail.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 11, 2022 at 09:54:40PM PDT, Joel Stanley wrote:
> On Thu, 12 May 2022 at 04:40, Joel Stanley <joel@jms.id.au> wrote:
> >
> > On Wed, 11 May 2022 at 22:05, Zev Weiss <zev@bewilderbeest.net> wrote:
> > >
> > > The Delta AHE-50DC Open19 power shelf uses a pair of AST1250 BMCs that
> > > are mostly compatible with the existing ast2400-evb device tree, with
> > > a couple small tweaks for the serial console UART and ethernet MACs.
> > >
> > > Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> > > ---
> > >
> > > Changes since v1 [0]:
> > >  - Disabled spi1, which this system doesn't use [Joel]
> >
> > Thanks, applied.
> 
> I have a script I use for testing:
> ```
> #!/bin/bash
> 
> set -e
> 
> OBJ=ast2400-obj
> CONFIG=evb-ast2400_defconfig
> : ${DTB:=ast2400-evb}
> IMG="$OBJ/test.img"
> 
> make -j8 O="$OBJ" -s clean
> make -j8 O="$OBJ" -j8 -s $CONFIG
> CROSS_COMPILE=arm-linux-gnueabi- ARCH=arm make -j8 O="$OBJ"  -j8
> DEVICE_TREE="$DTB" -s
> size "$OBJ/u-boot"
> 
> cp "$OBJ/u-boot.bin" "$OBJ/test.img"
> truncate -s 32M "$OBJ/test.img"
> 
> echo "$CONFIG build complete"
> echo "qemu-system-arm -M palmetto-bmc -nographic -drive
> file=$IMG,if=mtd,format=raw"
> ```
> 
> DTB=ast2400-ahe-50dc ./build-ast2400.sh
> 
> When I boot it in qemu, there's no output:
> qemu-system-arm -M palmetto-bmc -nographic -drive
> file=ast2400-obj/test.img,if=mtd,format=raw
> 
> Have I missed something?
> 
> ah, when I boot with -d guest_errors,unimp I see an infinite number of:
> 
>  aspeed_soc.io: unimplemented device read  (size 1, offset 0x18e014)
> 
> That's UART3, which is your stdout for this board. I guess we can't
> boot test in qemu without some changes.

Ah -- I'd never actually tried booting this one with qemu, but yeah, 
that makes sense.

After a little experimentation, with the below hacks to qemu it produces 
the expected output -- I expect there's some better way to override the 
default uart setting, but a qom-set (even with -S) was too late to take 
effect (and apparently too early with --preconfig), and after spending a 
few fruitless minutes trying to figure out a way to do it via a 
command-line argument I gave up and hard-coded it, just for the sake of 
an expedient proof of concept.


Zev


diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index babf405777df..4bad40400007 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1106,6 +1106,7 @@ static void aspeed_machine_palmetto_class_init(ObjectClass *oc, void *data)
     amc->spi_model = "mx25l25635f";
     amc->num_cs    = 1;
     amc->i2c_init  = palmetto_bmc_i2c_init;
+    amc->uart_default = ASPEED_DEV_UART3;
     mc->default_ram_size       = 256 * MiB;
     mc->default_cpus = mc->min_cpus = mc->max_cpus =
         aspeed_soc_num_cpus(amc->soc_name);
diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
index 198b6b7effed..6c1f18f7b42c 100644
--- a/hw/arm/aspeed_soc.c
+++ b/hw/arm/aspeed_soc.c
@@ -48,6 +48,7 @@ static const hwaddr aspeed_soc_ast2400_memmap[] = {
     [ASPEED_DEV_ETH1]   = 0x1E660000,
     [ASPEED_DEV_ETH2]   = 0x1E680000,
     [ASPEED_DEV_UART1]  = 0x1E783000,
+    [ASPEED_DEV_UART3]  = 0x1E78e000,
     [ASPEED_DEV_UART5]  = 0x1E784000,
     [ASPEED_DEV_VUART]  = 0x1E787000,
     [ASPEED_DEV_SDRAM]  = 0x40000000,

