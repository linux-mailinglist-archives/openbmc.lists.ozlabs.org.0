Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6405F148D
	for <lists+openbmc@lfdr.de>; Fri, 30 Sep 2022 23:09:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MfNCN57jWz3cFY
	for <lists+openbmc@lfdr.de>; Sat,  1 Oct 2022 07:09:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=nKnZm5E0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=nKnZm5E0;
	dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MfNC008G4z3blV
	for <openbmc@lists.ozlabs.org>; Sat,  1 Oct 2022 07:09:15 +1000 (AEST)
Received: from hatter.bewilderbeest.net (97-113-250-99.tukw.qwest.net [97.113.250.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id D6F1E1B0;
	Fri, 30 Sep 2022 14:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1664572152;
	bh=sprnCtHdPep3SLJmw2CEMVHcVo72flcKIH2uRNz9NqU=;
	h=Date:From:To:Cc:Subject:From;
	b=nKnZm5E01DgqWfCJHl+o1LuXcdWi4fCi1z3Psw9CkvBkB8rXn4Tvh6qqCJLQICNXI
	 C3/HxCXqYSHIjs/nG3nXvT9Wd1B5CKsPvPf316gD/sVnuQKQaU4E4Sx4JMMHyZW28u
	 yEwLq9AZe3eXTJcz/Rtd6cu3JZv2HhkId4jWT628=
Date: Fri, 30 Sep 2022 14:09:10 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org
Subject: AST2500 u-boot breakage with CONFIG_RAM=y
Message-ID: <Yzda9uALobTbT7B/@hatter.bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Dylan Hung <dylan_hung@aspeedtech.com>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello u-boot/Aspeed folks,

I recently set about getting e3c246d4i switched over to 
u-boot-aspeed-sdk from the old u-boot branch, but after building and 
installing it I ran into some odd misbehavior.

It's not entirely consistent -- sometimes the kernel hand-off goes 
alright but then the kernel's boot sequence hangs a few seconds in, 
sometimes it hangs before I get any kernel console output at all, and 
sometimes I end up with the following error message from u-boot as it 
loads the kernel FIT image:

   fdt_find_or_add_subnode: chosen: FDT_ERR_BADSTRUCTURE
   ERROR: /chosen node create failed
    - must RESET the board to recover.
   
   FDT creation failed! hanging...### ERROR ### Please RESET the board ###

Additionally, if I try to boot a FIT image loaded via TFTP I 
consistently get checksum-mismatch errors on the kernel subimage portion 
(though the exact same FIT image loaded from flash passes that check).  

I wasn't able to reproduce any misbehavior in qemu, unfortunately.

I had previously tested the 2019.04 u-boot branch on this platform and 
not hit any problems like this, so I started bisecting between the 
version that had worked before and the current version, which landed me 
on Joel's recent patch adding CONFIG_RAM=y to the evb-ast2500 defconfig 
(commit 0545d7325ff0cb1a77dc6f8007f74f415840fd90).  I confirmed that 
setting CONFIG_RAM=n gets things working normally again.

Looking into the code that CONFIG_RAM=y enables, I added some debug 
prints to arch/arm/mach-aspeed/ast2500/board_common.c and verified that 
the dram_init() routine was setting gd->ram_size to the same value in 
both cases.  However, I noticed there's also one instruction in 
platform.S that's included when CONFIG_RAM is enabled [1].  My 
recollection of ARM assembly is fairly rusty, but I believe that's just 
an early return short-circuiting the rest of the initialization code in 
that routine, perhaps with the intent that that work will get taken care 
of by C code in the Aspeed RAM driver instead?  In any case, I 
experimented with leaving CONFIG_RAM=y but removing just that 
instruction, and it seems to resolve the problems I was seeing -- so if 
my interpretation does match the actual intent, it seems like there's 
some discrepancy between the initialization done in the C code and the 
assembly code, though I'm not sure what it might be.  For what it's 
worth, it did seem like the CONFIG_RAM=n build ran noticeably faster.

Does anyone have any thoughts as to what might be going on, or tips on 
how to go about debugging further?

Thanks,
Zev

[1] https://github.com/openbmc/u-boot/blob/8e834983d0a6b9265cee1674564b016565630883/arch/arm/mach-aspeed/ast2500/platform.S#L663-L665

