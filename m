Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B93754CF6A5
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 10:42:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBtmC4Wcwz30Fn
	for <lists+openbmc@lfdr.de>; Mon,  7 Mar 2022 20:42:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=ykjkIuiG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::c31;
 helo=mail-oo1-xc31.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ykjkIuiG; dkim-atps=neutral
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBtln5HXWz30Fn
 for <openbmc@lists.ozlabs.org>; Mon,  7 Mar 2022 20:42:12 +1100 (AEDT)
Received: by mail-oo1-xc31.google.com with SMTP id
 u30-20020a4a6c5e000000b00320d8dc2438so3677882oof.12
 for <openbmc@lists.ozlabs.org>; Mon, 07 Mar 2022 01:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0OTxG8o37507+hmHonW+XnH8Ljb1vXS0syc3pGcK1e8=;
 b=ykjkIuiGPCHf9QtL14iK8HyyHtVyXUn2aRfaN/WhKG+iY5NhK5m1EMjslVQgPkg5sB
 hxK5JXmkOE6ElVuICDKq5C7f9JiQd0Axpz5/fwAGEXJtI1NblUAehxtD5Z2F2aCi2Zr/
 usDL/G8OCHwXJjVLq5Bnf6ZmLRh8a9+wgHEkiapQPpeHk8A2XZNTFCVZwMXztw59fU6+
 pxvyzXYc50HY1obpHuT+Wtsxq0xaQImdy2uZfOwTHj+LmIDk9twBHyqKzqGH9XcIrZ3B
 sSUXf4WuXFbgslH/yT4FfvB6WHU1qDMS9uFwcsPAI77s3UWivjViTasETy3s+iTgENFN
 guow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0OTxG8o37507+hmHonW+XnH8Ljb1vXS0syc3pGcK1e8=;
 b=EAMO5CSugQQsI0QDyg/7kpr0eyZ4Opk1xg+HN4P/48s/biKUCCsGJ741hjCrjrKBC5
 MeUs0S1ZZRyuXrjS5VyQnYaC0084blk+s39UQg/BtmgNZYDZjVN2UcTvpbcgAMpgLU5o
 FHJdYU4EfOixqE7ApeFI3VPpy5eiW1mP5EvqxHOTjinD2AQw1lPUqWr9n/RcPKWTMOhS
 JKN8YlWxCWsYG6EPiD6O++g4xBnGc5GdU/OiKH/6Gz2OFfZI3VmfZtiLHtpp78sbztQn
 AqpG3BieAC94jN4DNAYUhLhB8LgH6ZFpCBjX0k6ZlJSd3V7URGGgKdcd6SMCHalZ6G7X
 XCNQ==
X-Gm-Message-State: AOAM531ceYTbGnl4lA8tBBAZ0wTy8savn7rl3N7rUCn68Gz0gphjt9W/
 EAFcrk/Q5BBl38L4GYnfL69Om1cPWfXxtZh99GHujtc91SEO6Q==
X-Google-Smtp-Source: ABdhPJz1Ll/kx58yEov2/7Wx8rCFprZT8+J8oek03501dGJs7+xLkZu3waljLVM9UxGVNdqZNL0/YQcJd7mSsNjz1UQ=
X-Received: by 2002:a05:6870:a102:b0:d9:bcaf:7181 with SMTP id
 m2-20020a056870a10200b000d9bcaf7181mr11026446oae.8.1646646130526; Mon, 07 Mar
 2022 01:42:10 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
 <CACPK8Xf6Zp7Zeu3wrRFHsctEKXfoYkJhbV+PSby0CmP72LC7aQ@mail.gmail.com>
 <CAGm54UGabB9Ji9HBm_d=FnLB5DxMKgvtdnP=2Mc-TJdPo5Ld8Q@mail.gmail.com>
In-Reply-To: <CAGm54UGabB9Ji9HBm_d=FnLB5DxMKgvtdnP=2Mc-TJdPo5Ld8Q@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Mon, 7 Mar 2022 17:41:59 +0800
Message-ID: <CAGm54UGnjxhX4wsbZGJZJUWaiWXO1VONkxww=XnpyyyWeuF_hw@mail.gmail.com>
Subject: Re: Call for testing: spi-mem driver for Aspeed SMC controllers
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, John Wang <wangzq.jn@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We hit some issues with the new driver, and here is some detailed info.

* Our system (not yet upstreamed) uses `mx66l51235f` as the FMC SPI
flash, and we created a QEMU model.

* When the dts is like "default":
 &fmc {
        pinctrl-names = "default";
        status = "okay";
        flash@0 {
                status = "okay";
                m25p,fast-read;
                label = "bmc";
                spi-max-frequency = <50000000>;
 #include "openbmc-flash-layout-64.dtsi"
        };
 };
1. Run the image in ast2600-evb QEMU, it boots fine;
2. We have a model (g220b) in QEMU that uses mx66l51235f as the fmc
SPI (`amc->fmc_model = "mx66l51235f";`), it boots with below error:
 [    1.848286] vmap allocation for size 268439552 failed: use
vmalloc=<size> to increase size
 [    1.848774] spi-aspeed-smc 1e620000.spi: ioremap failed for
resource [mem 0x20000000-0x2fffffff]
 [    1.849898] spi-aspeed-smc: probe of 1e620000.spi failed with error -12
3. If I manually add vmalloc to the kernel command line (setenv
bootargs 'console=ttyS4,115200n8 root=/dev/ram rw vmalloc=400M'), the
above QEMU model boots fine.
4. On the real system, it behaves the same as QEMU, that I need to add
`vmalloc=400M` to make it boot OK.


* When the dts set `spi-tx-bus-width/spi-rx-bus-width = <4>`, and uses
pinctrl_fwqspid_default from @Joel Stanley's pinctrl patch:
 &fmc {
        pinctrl-names = "default";
        pinctrl-0 = <&pinctrl_fwqspid_default>;
        status = "okay";
        flash@0 {
                status = "okay";
                m25p,fast-read;
                label = "bmc";
                spi-max-frequency = <50000000>;
                spi-tx-bus-width = <4>;
                spi-rx-bus-width = <4>;
 #include "openbmc-flash-layout-64.dtsi"
        };
 };
1. It fails to boot in ast2600-evb QEMU:
 [    0.586654] spi-nor: probe of spi0.0 failed with error -5
 [    0.587654] spi-nor spi0.1: unrecognized JEDEC id bytes: 00 00 00 00 00 00
2. It fails to boot in the g220b model with the same vmalloc failure issue.
2. With `vmalloc=400M`, the g220b model boots fine in QEMU.
3. On the real system, it still fails to boot with `vmalloc=400M` due
to the below error:
 [    0.970091] spi-nor spi0.0: unrecognized JEDEC id bytes: ff ff ff ff ff ff
 [    0.977902] spi-nor: probe of spi0.0 failed with error -2


-- 
BRs,
Lei YU
