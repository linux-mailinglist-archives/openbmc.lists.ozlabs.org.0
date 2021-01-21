Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AD12FE1BC
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 06:32:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLrcf28HbzDqyn
	for <lists+openbmc@lfdr.de>; Thu, 21 Jan 2021 16:32:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.45;
 helo=mail.rptsys.com; envelope-from=tpearson@raptorengineering.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD
 header.b=Zlx16XCQ; dkim-atps=neutral
X-Greylist: delayed 394 seconds by postgrey-1.36 at bilbo;
 Thu, 21 Jan 2021 16:31:28 AEDT
Received: from mail.rptsys.com (mail.rptsys.com [23.155.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLrbh746MzDqpB
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2021 16:31:28 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E149F3651E6D2B
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 23:24:48 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id nh18c4Gh9UjQ for <openbmc@lists.ozlabs.org>;
 Wed, 20 Jan 2021 23:24:48 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 239813651E6BEF
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 23:24:48 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 239813651E6BEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1611206688; bh=WcIVJtBkB0bqbatOWBlPKA4N7CCrPXLX9iVabJ7CoGE=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=Zlx16XCQLdxFM40CSVMhERTB9N/TY4sFvP52rqEen2jO946Xt1JUA1tjWmaCa3fuD
 oWRyEFqtbGKjvJoVoKj5t8GKd0bvIEHmdZ23eg/yM8kNEbEWhCSZWB61eIatP3zuBr
 E2GFBCrid0opG91LisYtzYFUnJ+9wqDZpG6l3++A=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id X9CqgdzjHe5w for <openbmc@lists.ozlabs.org>;
 Wed, 20 Jan 2021 23:24:48 -0600 (CST)
Received: from vali.starlink.edu (vali.starlink.edu [192.168.3.21])
 by mail.rptsys.com (Postfix) with ESMTP id EBE9A3651E6B9C
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jan 2021 23:24:47 -0600 (CST)
Date: Wed, 20 Jan 2021 23:24:46 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc <openbmc@lists.ozlabs.org>
Message-ID: <1397407222.12585168.1611206686873.JavaMail.zimbra@raptorengineeringinc.com>
Subject: Kestrel soft BMC
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC83 (Linux)/8.5.0_GA_3042)
Thread-Index: nRyV/VxTvTFqukUBFa3FKsX2ektAJA==
Thread-Topic: Kestrel soft BMC
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I'd like to call attention to a project we just released here at Raptor Engineering: the Kestrel POWER-based soft BMC.  This has been in the works for a while now, and if all goes as planned could be a potential (slow) OpenBMC target later this year.

Kestrel is designed for openness and security; it has been developed and is supported exclusively using open FPGA tooling (Yosys/NextPNR/OpenOCD) running on open-ISA OpenPOWER systems [1] and targeting the Lattice ECP5 series of FPGAs.  It implements all of the basic functions required to IPL a POWER host (FSI, SPI, LPC, I2C, VUART, etc.), and is currently able to IPL a Blackbird system without any involvement of the ASpeed integrated BMC.

The main project README is available at https://gitlab.raptorengineering.com/kestrel-collaboration/kestrel-litex/litex-boards/-/blob/master/README.md and there are also build instructions at https://gitlab.raptorengineering.com/kestrel-collaboration/kestrel-litex/litex/-/wikis/Quick-Start .  Contributors are welcome, though we suspect many on this list may wait to contribute until we have at least basic Linux support up for the Kestrel system.

As a side note, we have hardware coming down the line around midyear that will allow us to expand Kestrel with network functionality and additional features.  This hardware will likely be made available for public purchase around that time as well.

Enjoy!

--
Timothy Pearson
Raptor Engineering, LLC

[1] To be specific, most development occurs on Blackbird desktops with some Talos II servers in the mix.  At no point in the development / build / test process are any proprietary tools or x86 processors involved.
