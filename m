Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBAA619C6
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 06:15:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hsZH3hgxzDqWJ
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 14:15:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="jSaKgyTA"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hsYg2Q8VzDqTh
 for <openbmc@lists.ozlabs.org>; Mon,  8 Jul 2019 14:15:17 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id j19so16707643qtr.12
 for <openbmc@lists.ozlabs.org>; Sun, 07 Jul 2019 21:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=CSJxwIcQv7gpz3+kQ5xoZqfpV9hFwz8Q1/EfuRP/MHI=;
 b=jSaKgyTATevgYT4sdH3nOGChjUXwuutrc/qpO4QgCwPkagFohGxGoeuXt1DsU+wiAj
 d8EAhYJtU7thJt97KPFgxKBEL/hI1nm2YkpIIHkSWnqRWq8v8y9QJPiAcvw9WyaX/dkb
 10nDJO/VkWHYxvfMex4vXinKrphQeS6550Pu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=CSJxwIcQv7gpz3+kQ5xoZqfpV9hFwz8Q1/EfuRP/MHI=;
 b=HfDTYU0ZAlC8o5mcTlQp16CXJS6nrxT8wGA86HUEu7PygVMTcksF+eGevZXT3hbCbu
 TA9oWGQ5Kx7PAYWhIwQ5pO8vQG4ZJbpKFwitYkNjyCClHSjnWKrTd5FHVUF8oEac13Wo
 yKWYSmzoIxwHG3Luui8Kx1NehuiaqgMrpxcgqF7DXSma6LIcSW55zUO+tI69mHxw6oXm
 Zp0J1DkBWq24oKWRRx/awOGitC3QK0E6nrtPNX69OYdQcGIZfnUSXYTiDokjH0sszxv9
 TplNb/ohrV0BVZusw0DjYnhtiSl9srz4ONuS22AVHskb9cLaSrAkJm+PRRzQhqqNB37W
 6SmA==
X-Gm-Message-State: APjAAAUEDPIU0KsOhhzpVxwxTkSLwzyPO0lHsbDD+jSrXDPzovRN8VSr
 e7OSIn7FzU48d6efPKuojBBAunJtMJ+zDIV15lo=
X-Google-Smtp-Source: APXvYqxmaB4e85LbWTJBw6dBD4bHneaMDBoweSUoMopNeDYbisCV0yFUcccawcDOw6te7oMrwbTJo+DRpmOdvRl4imo=
X-Received: by 2002:ac8:264a:: with SMTP id v10mr12145646qtv.255.1562559313068; 
 Sun, 07 Jul 2019 21:15:13 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 8 Jul 2019 04:15:00 +0000
Message-ID: <CACPK8Xd7yntyZCP0fXr3B5puJP3D45oeaKLaEWUrL5pr+EY_QQ@mail.gmail.com>
Subject: aspeed-video WARN_ON in dma_free_attrs with 5.2
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Eddie James <eajames@linux.ibm.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

I am running with Jae's fixes from dev-5.1 applied to 5.2.. I see this
on boot, early on as userspace is coming up. The host is not running.

 WARNING: CPU: 0 PID: 140 at kernel/dma/mapping.c:281 dma_free_attrs+0xd0/0xe0

The driver is calling dma_free_attrs from aspeed_video_release. The
comment in dma_free_attrs says:

        /*
         * On non-coherent platforms which implement DMA-coherent buffers via
         * non-cacheable remaps, ops->free() may call vunmap(). Thus getting
         * this far in IRQ context is a) at risk of a BUG_ON() or trying to
         * sleep on some machines, and b) an indication that the driver is
         * probably misusing the coherent API anyway.
         */
        WARN_ON(irqs_disabled());

Which suggests aspeed-video might be at fault.

I can reproduce it in qemu. It does not reproduce with vanilla 5.2,
which does not contain Jae's various fixes.

Cheers,

Joel

---

[   18.348693] ------------[ cut here ]------------
[   18.353384] WARNING: CPU: 0 PID: 140 at kernel/dma/mapping.c:281
dma_free_attrs+0xd0/0xe0
[   18.361575] CPU: 0 PID: 140 Comm: v4l_id Not tainted
5.2.0-00110-ga3c857653fe9 #2
[   18.369054] Hardware name: Generic DT based system
[   18.373839] Backtrace:
[   18.376328] [<80107e10>] (dump_backtrace) from [<80108044>]
(show_stack+0x20/0x24)
[   18.383902]  r7:0012c000 r6:00000009 r5:00000000 r4:00000000
[   18.389583] [<80108024>] (show_stack) from [<8069dbe4>]
(dump_stack+0x20/0x28)
[   18.396833] [<8069dbc4>] (dump_stack) from [<80118930>]
(__warn.part.3+0xb4/0xdc)
[   18.404330] [<8011887c>] (__warn.part.3) from [<80118ad0>]
(warn_slowpath_null+0x50/0x5c)
[   18.412498]  r6:80158c28 r5:00000119 r4:807e2d78
[   18.417136] [<80118a80>] (warn_slowpath_null) from [<80158c28>]
(dma_free_attrs+0xd0/0xe0)
[   18.425395]  r6:96100000 r5:9e125210 r4:80701904
[   18.430031] [<80158b58>] (dma_free_attrs) from [<804f6500>]
(aspeed_video_release+0xf8/0x138)
[   18.438555]  r8:00000000 r7:20000013 r6:946a6cc0 r5:9456d4a0 r4:9456d000
[   18.445267] [<804f6408>] (aspeed_video_release) from [<804d4050>]
(v4l2_release+0xd4/0xe8)
[   18.453530]  r8:95da1770 r7:946f2310 r6:945852a8 r5:946a6cc0 r4:9456d318
[   18.460245] [<804d3f7c>] (v4l2_release) from [<80245448>] (__fput+0x98/0x1d0)
[   18.467374]  r5:000a001d r4:946a6cc0
[   18.470962] [<802453b0>] (__fput) from [<802455e8>] (____fput+0x18/0x1c)
[   18.477668]  r10:80a03008 r9:95003fb0 r8:80101204 r7:00000000
r6:80a65ab4 r5:947f5040
[   18.485484]  r4:947f537c
[   18.488028] [<802455d0>] (____fput) from [<80134af4>]
(task_work_run+0x7c/0xa0)
[   18.495350] [<80134a78>] (task_work_run) from [<801069d8>]
(do_work_pending+0x484/0x598)
[   18.503439]  r7:00000000 r6:05200001 r5:80101204 r4:ffffe000
[   18.509106] [<80106554>] (do_work_pending) from [<8010106c>]
(slow_work_pending+0xc/0x20)
[   18.517277] Exception stack(0x95003fb0 to 0x95003ff8)
[   18.522333] 3fa0:                                     00000000
00000000 00000001 00000000
[   18.530507] 3fc0: 00000000 76f75330 05200001 00000006 00000000
00000000 43690fa4 00000000
[   18.538676] 3fe0: 00023fd8 7ee50c18 00010edc 43801f70 60000010 00000003
[   18.545293]  r10:00000006 r9:95002000 r8:80101204 r7:00000006
r6:05200001 r5:76f75330
[   18.553109]  r4:00000000
[   18.555643] ---[ end trace fd1729fd68c24eef ]---
[   18.560573] ------------[ cut here ]------------
