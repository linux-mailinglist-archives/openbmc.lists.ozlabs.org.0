Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F09E5F1961
	for <lists+openbmc@lfdr.de>; Sat,  1 Oct 2022 05:22:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MfXT43DXBz3c6q
	for <lists+openbmc@lfdr.de>; Sat,  1 Oct 2022 13:22:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=xO/x6CKG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=zhangjian.3032@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=xO/x6CKG;
	dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MfXSd719Fz3bd3
	for <openbmc@lists.ozlabs.org>; Sat,  1 Oct 2022 13:21:35 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id o7so2239344lfk.7
        for <openbmc@lists.ozlabs.org>; Fri, 30 Sep 2022 20:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=nTdfkg4iX7XFntr/+UxVB0T8EVRa67NwC9rknBYxi5Q=;
        b=xO/x6CKGSg3nrd259WzDlfFTfBopd6HkfZNfurL2Bv4SEMQkjYLNN12PTx0UXgenya
         ilpg8IpaUxi2eCY6mN5kw4fOBl7kGCG8fcjiUbMA+LwgaiXsiaj2RWz2uBFe/zO6n606
         Qkw8psDFCSMYCkwd9dnIlbqcJGiJQTlqiWDEscojl6FpZM7m2v8H3JWg0PtBMYPOiHuN
         GbRwzsRfB7o7U9TcVWgrW/A6Ov2HMWJLjXj0uzVwWms9xDSlWT7woaY2QI8k2l5r9hrn
         JanxhSeryy5k1Mj/YTA9MLnGnL/Uk7P0Q138Qhhc6mhoquvc4UWnmn1qO40gPKthCHVg
         C4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nTdfkg4iX7XFntr/+UxVB0T8EVRa67NwC9rknBYxi5Q=;
        b=yG5GR1Un0XFA+K0/a2YjqEU6JIdh+zhTAAtQP/cYH7bJoy39o+edfitQN5MspK5f+Z
         gKpdBoLZEmFU2Zh3IHGKoFEwuAU1uh5Llyc8sXwRzgMOasX8/0Al6FW5ZlAM4tdw7lz6
         sVFi90/Uxw9JranhaSYaAs6P4L38EQzV9/vj4ERSGAaoiwMM/z56cTdmsd7CSnrs7bxE
         yRvz/+DmObM5okIL62yuQQCUnDgy3qdOdMY47Dc4OPtUBdikpvPUQz/ZcP1uxDsSkmjA
         UfEPUtDUEsnGCS6/5gg2PcA7ZaCX8anlOzONQiP598S+qsbsap4T8aC1nVv4epFvXq5k
         BFtw==
X-Gm-Message-State: ACrzQf0462lc8UBwQjPf/Fu5sCHtTaBoPeUxtyNw+yltGhCJ+TJ0Wtol
	mcIV+tCgB7wr5xJYz3+O1BmUucvPhG/OTSTk7Dw1hQ==
X-Google-Smtp-Source: AMsMyM7aqfQdoivtSbc9MLDxRJAD5mZZgvOOLEEyevNyGBZNKu3HkgWb51FBODf3bMvOH0bIjmMp/e4+5+j2gmVBK1M=
X-Received: by 2002:a05:6512:2a8f:b0:49a:db9f:d498 with SMTP id
 dt15-20020a0565122a8f00b0049adb9fd498mr4433619lfb.435.1664594487374; Fri, 30
 Sep 2022 20:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <Yzda9uALobTbT7B/@hatter.bewilderbeest.net>
In-Reply-To: <Yzda9uALobTbT7B/@hatter.bewilderbeest.net>
From: Zhang Jian <zhangjian.3032@bytedance.com>
Date: Sat, 1 Oct 2022 11:21:16 +0800
Message-ID: <CA+J-oUuhA_akVPbTp=ARqJOaaFp6j43QakSiyjMiNz8NGpVZYQ@mail.gmail.com>
Subject: Re: [Phishing Risk] [External] AST2500 u-boot breakage with CONFIG_RAM=y
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, Dylan Hung <dylan_hung@aspeedtech.com>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Zev,

I had some similar questions about this .

On Sat, Oct 1, 2022 at 5:09 AM Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Hello u-boot/Aspeed folks,
>
> I recently set about getting e3c246d4i switched over to
> u-boot-aspeed-sdk from the old u-boot branch, but after building and
> installing it I ran into some odd misbehavior.
>
> It's not entirely consistent -- sometimes the kernel hand-off goes
> alright but then the kernel's boot sequence hangs a few seconds in,
Load the kernel is slow, will cause my 22's watchdog timeout.
> sometimes it hangs before I get any kernel console output at all, and
I disabled the watchdog, and always hang in the kernel.
[    2.382046] ftgmac100 1e660000.ethernet: Read MAC address 2e:38:9e:24:b0:7c p
[    2.389968] ftgmac100 1e660000.ethernet: Using NCSI interface
[    2.397721] ftgmac100 1e660000.ethernet eth0: irq 20, mapped at (ptrval)
[    2.405224] ftgmac100 1e680000.ethernet: Read MAC address d2:8a:d4:b8:26:da
> sometimes I end up with the following error message from u-boot as it
> loads the kernel FIT image:
>
>    fdt_find_or_add_subnode: chosen: FDT_ERR_BADSTRUCTURE
>    ERROR: /chosen node create failed
>     - must RESET the board to recover.
>
>    FDT creation failed! hanging...### ERROR ### Please RESET the board ###
>
> Additionally, if I try to boot a FIT image loaded via TFTP I
> consistently get checksum-mismatch errors on the kernel subimage portion
> (though the exact same FIT image loaded from flash passes that check).
>
> I wasn't able to reproduce any misbehavior in qemu, unfortunately.
>
> I had previously tested the 2019.04 u-boot branch on this platform and
> not hit any problems like this, so I started bisecting between the
> version that had worked before and the current version, which landed me
> on Joel's recent patch adding CONFIG_RAM=y to the evb-ast2500 defconfig
> (commit 0545d7325ff0cb1a77dc6f8007f74f415840fd90).  I confirmed that
> setting CONFIG_RAM=n gets things working normally again.
>
Me too.

> Looking into the code that CONFIG_RAM=y enables, I added some debug
> prints to arch/arm/mach-aspeed/ast2500/board_common.c and verified that
> the dram_init() routine was setting gd->ram_size to the same value in
> both cases.  However, I noticed there's also one instruction in
> platform.S that's included when CONFIG_RAM is enabled [1].  My
> recollection of ARM assembly is fairly rusty, but I believe that's just
> an early return short-circuiting the rest of the initialization code in
> that routine, perhaps with the intent that that work will get taken care
> of by C code in the Aspeed RAM driver instead?  In any case, I
> experimented with leaving CONFIG_RAM=y but removing just that
> instruction, and it seems to resolve the problems I was seeing -- so if
> my interpretation does match the actual intent, it seems like there's
> some discrepancy between the initialization done in the C code and the
> assembly code, though I'm not sure what it might be.  For what it's
> worth, it did seem like the CONFIG_RAM=n build ran noticeably faster.
>
> Does anyone have any thoughts as to what might be going on, or tips on
> how to go about debugging further?
>
> Thanks,
> Zev
>
> [1] https://github.com/openbmc/u-boot/blob/8e834983d0a6b9265cee1674564b016565630883/arch/arm/mach-aspeed/ast2500/platform.S#L663-L665
>
