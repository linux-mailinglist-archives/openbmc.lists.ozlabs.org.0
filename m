Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 720EB59CD2D
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 02:23:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBVM21kLCz3c4S
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 10:23:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MQcWGSiB;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MQcWGSiB;
	dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBVLM1ZqJz3c1n;
	Tue, 23 Aug 2022 10:22:50 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id n4so15087267wrp.10;
        Mon, 22 Aug 2022 17:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=nNby+4AsStJg1pa9lu4cTHlV8sbD7whkWK8yDLBtezw=;
        b=MQcWGSiBMMTtQE2GPz2XbhcXsSuLBkLtY+yT50NkCKsbSZn7bJ2MMcqFcP0eqIHT8A
         3aCLwQcySmRjqbgzHNCMkB19+0BxDjgJ89DJfia/lb+pcHVr0ydhunwKbFTE3/ZvCruf
         2GOA8UPY1ttlodvuSAPPxNsRYZGhUfZNbmgp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=nNby+4AsStJg1pa9lu4cTHlV8sbD7whkWK8yDLBtezw=;
        b=prrZ2fQljXsThHPvFHUw2EJfG9C/MmsnVZ6LIyDT7cTvG7+JzPD5x5sXMvbzvFCU7Y
         i5m8qvrsdmFsg7u6QXNXZSOYbRUMLRKB7e67Vn+5Lh+SUN/LRdGAo6jVmwHvlMQ2cLkE
         xIQxsRHWi4Btv1xVVab2M1l2lDja/bjqy9IEXhDh62qkPxsPGwOdYAyTpeBPmoCSmYTy
         lPY0vAvpUdWz1zm8dFJiZQddqz7aJfRf294dVBV3cBTjKAeQjZnhwcAi1rV8m8ITVHJ6
         0R/95vOeUW1CmQEnaU2xHpYncRrhkTXgMZmQ87hxl4D65NMRqxJjt7Qsl1r9Vvx/PIl9
         e+BA==
X-Gm-Message-State: ACgBeo30ij4PXrG3EKqPpBHgUDfbuUR2gVdXOY7vHDff5HyKY5cKgsdC
	h+LPiWg3eAUDQqrYk/mJ47vvE4CdRJlxXwoCS3U=
X-Google-Smtp-Source: AA6agR5xlNZvlnHVYSrzV0GM7K98tfBm2jwoluUDZ8ZQtsT2RwqT7Kar1wZ3pTaTjBB32XKoNfTsAFG66ZsHy8xWhWI=
X-Received: by 2002:a5d:47ab:0:b0:223:60ee:6c12 with SMTP id
 11-20020a5d47ab000000b0022360ee6c12mr11764837wrb.315.1661214167010; Mon, 22
 Aug 2022 17:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1661094034.git.i.kononenko@yadro.com>
In-Reply-To: <cover.1661094034.git.i.kononenko@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 23 Aug 2022 00:22:34 +0000
Message-ID: <CACPK8XfHAY_+7i_mJYSO9C2K2+mfKsFHf-8AcgK4VjOnEUEVQg@mail.gmail.com>
Subject: Re: [PATCH 0/3] aspeed:lpc: Fix lpc-snoop probe exception
To: Igor Kononenko <i.kononenko@yadro.com>
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
Cc: Corey Minyard <minyard@acm.org>, linux-aspeed@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Sun, 21 Aug 2022 at 16:07, Igor Kononenko <i.kononenko@yadro.com> wrote:
>
> The bmc might be rebooted while the host is still reachable and the host
> might send requests through configured lpc-kcs channels in same time.
> That leads to raise lpc-snoop/lpc-kcs interrupts that haven't adjusted IRQ
> handlers yet on next early kernel boot, because on the aspeed-chip reboot
> might keep lpc-registers on a unclean state that is configured on the last
> boot.

Thanks for the bug report and the patches Igor.

When you resend then please add a Fixes: line to help ensure the
patches get backported.

Cheers,

Joel


>
> The described way might raise the next exception:
> ```
> [    1.360110] irq 35: nobody cared (try booting with the "irqpoll" option)
> [    1.360145] CPU: 0 PID: 1 Comm: swapper Not tainted 5.4.43-c109de3-24cc5b6 #1
> [    1.360158] Hardware name: Generic DT based system
> [    1.360168] Backtrace:
> [    1.360228] [<80107f5c>] (dump_backtrace) from [<80108184>] (show_stack+0x20/0x24)
> [    1.360250]  r7:00000023 r6:00000000 r5:00000000 r4:9d12d560
> [    1.360283] [<80108164>] (show_stack) from [<8084ae54>] (dump_stack+0x20/0x28)
> [    1.360316] [<8084ae34>] (dump_stack) from [<80156790>] (__report_bad_irq+0x40/0xc0)
> [    1.360344] [<80156750>] (__report_bad_irq) from [<801566c0>] (note_interrupt+0x238/0x290)
> [    1.360366]  r9:9d0ae000 r8:9d00c600 r7:00000023 r6:00000000 r5:00000000 r4:9d12d560
> [    1.360408] [<80156488>] (note_interrupt) from [<80153594>] (handle_irq_event+0xb4/0xc4)
> [    1.360429]  r10:00000000 r9:9d0ae000 r8:9d00c600 r7:00000001 r6:00000000 r5:00000000
> [    1.360440]  r4:9d12d560 r3:00000000
> [    1.360466] [<801534e0>] (handle_irq_event) from [<8015788c>] (handle_level_irq+0xac/0x180)
> [    1.360480]  r5:80c7d35c r4:9d12d560
> [    1.360503] [<801577e0>] (handle_level_irq) from [<80152a5c>] (__handle_domain_irq+0x6c/0xc8)
> [    1.360519]  r5:80c7d35c r4:9d12d560
> [    1.360545] [<801529f0>] (__handle_domain_irq) from [<801021cc>] (avic_handle_irq+0x68/0x70)
> [    1.360568]  r9:9d0ae000 r8:9d12d608 r7:9d0afc84 r6:ffffffff r5:9d0afc50 r4:9d002380
> [    1.360587] [<80102164>] (avic_handle_irq) from [<80101a6c>] (__irq_svc+0x6c/0x90)
> [    1.360603] Exception stack(0x9d0afc50 to 0x9d0afc98)
> [    1.360620] fc40:                                     00000000 00000100 00000000 00000000
> [    1.360640] fc60: 9d12d560 98bbd0c0 00000000 00000023 9d12d608 60000053 00000000 9d0afcd4
> [    1.360657] fc80: 9d0afc80 9d0afca0 801570ec 80154cdc 40000053 ffffffff
> [    1.360670]  r5:40000053 r4:80154cdc
> [    1.360693] [<801549e0>] (__setup_irq) from [<801555e4>] (request_threaded_irq+0xdc/0x15c)
> [    1.360715]  r9:98bbb340 r8:00000023 r7:9d12d570 r6:9d12d560 r5:00000000 r4:98bbd0c0
> [    1.360741] [<80155508>] (request_threaded_irq) from [<801589d8>] (devm_request_threaded_irq+0x70/0xc4)
> [    1.360762]  r10:80a7353c r9:00000000 r8:98bbb340 r7:9d130e10 r6:00000023 r5:804f4a70
> [    1.360774]  r4:98bbd020 r3:00000080
> [    1.360800] [<80158968>] (devm_request_threaded_irq) from [<804f4ebc>] (aspeed_lpc_snoop_probe+0x100/0x2ac)
> [    1.360821]  r10:00000000 r9:9d130e10 r8:98bbd040 r7:00000000 r6:9d130e00 r5:98bbb340
> [    1.360830]  r4:00000000
> [    1.360851] [<804f4dbc>] (aspeed_lpc_snoop_probe) from [<8056a5c4>] (platform_drv_probe+0x44/0x80)
> [    1.360873]  r9:80c5ef90 r8:00000000 r7:80cc2938 r6:00000000 r5:80c5ef90 r4:9d130e10
> [    1.360910] [<8056a580>] (platform_drv_probe) from [<80568420>] (really_probe+0x26c/0x498)
> [    1.360924]  r5:80cc282c r4:9d130e10
> [    1.360949] [<805681b4>] (really_probe) from [<80568c28>] (driver_probe_device+0x138/0x184)
> [    1.360970]  r10:80b0050c r9:80adadb0 r8:00000007 r7:80c5ef90 r6:9d130e10 r5:00000000
> [    1.360981]  r4:80c5ef90
> [    1.361004] [<80568af0>] (driver_probe_device) from [<80568fe4>] (device_driver_attach+0xb8/0xc0)
> [    1.361020]  r7:80c5ef90 r6:9d130e54 r5:00000000 r4:9d130e10
> [    1.361046] [<80568f2c>] (device_driver_attach) from [<80569070>] (__driver_attach+0x84/0x16c)
> [    1.361063]  r7:80c61128 r6:9d130e10 r5:00000001 r4:80c5ef90
> [    1.361088] [<80568fec>] (__driver_attach) from [<80566068>] (bus_for_each_dev+0x84/0xcc)
> [    1.361106]  r7:80c61128 r6:80568fec r5:80c5ef90 r4:00000000
> [    1.361130] [<80565fe4>] (bus_for_each_dev) from [<80569180>] (driver_attach+0x28/0x30)
> [    1.361147]  r6:00000000 r5:9d1a3d40 r4:80c5ef90
> [    1.361169] [<80569158>] (driver_attach) from [<80566a08>] (bus_add_driver+0x114/0x200)
> [    1.361195] [<805668f4>] (bus_add_driver) from [<80569814>] (driver_register+0x98/0x128)
> [    1.361214]  r7:00000000 r6:80ca0ca0 r5:00000000 r4:80c5ef90
> [    1.361241] [<8056977c>] (driver_register) from [<8056b528>] (__platform_driver_register+0x40/0x54)
> [    1.361256]  r5:000000b8 r4:80b2575c
> [    1.361294] [<8056b4e8>] (__platform_driver_register) from [<80b2577c>] (aspeed_lpc_snoop_driver_init+0x20/0x28)
> [    1.361331] [<80b2575c>] (aspeed_lpc_snoop_driver_init) from [<80b01318>] (do_one_initcall+0x84/0x184)
> [    1.361356] [<80b01294>] (do_one_initcall) from [<80b01540>] (kernel_init_freeable+0x128/0x1ec)
> [    1.361375]  r7:80b3f858 r6:80ca0ca0 r5:000000b8 r4:80b61914
> [    1.361412] [<80b01418>] (kernel_init_freeable) from [<80864060>] (kernel_init+0x18/0x11c)
> [    1.361435]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:80864048
> [    1.361444]  r4:00000000
> [    1.361470] [<80864048>] (kernel_init) from [<801010e8>] (ret_from_fork+0x14/0x2c)
> [    1.361483] Exception stack(0x9d0affb0 to 0x9d0afff8)
> [    1.361500] ffa0:                                     00000000 00000000 00000000 00000000
> [    1.361518] ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    1.361535] ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    1.361547]  r5:80864048 r4:00000000
> [    1.361555] handlers:
> [    1.361592] [<(ptrval)>] aspeed_lpc_snoop_irq
> [    1.361609] Disabling IRQ #35
>
> ```
>
> Main caught of that state is the lpc-snoop driver found on the same
> 1e789080 address and have same IRQ#35 as for lpc-kcs, and lpc-snoop
> registering earlier than lpc-kcs. So, on the lpc-snoop initialization
> the lpc-snoop IRQ will be registried for IRQ#35, but it will
> passthrough it for the LPC KCS handlers that is not registried yet.
>
> Summary we got the `nobody cared` warning about more 100.000 unhandled
> IRQ#35
>
> Steps to reproduce:
> * Turn-on BMC
> * Turn-on HOST
> * Run `watch 'ipmitool sensor'` on the host that is configured to pass
>   requests via kcs-channel(3,4)
> * Reboot BMC.
> * On the next BMC boot kernel(BMC) dmesg have exception mentioned above.
>
> The following patchset aims to fixup described issue.
>
> Igor Kononenko (3):
>   ipmi:kcs_bmc: Add cleanup regmap(interrupt-regs) on a shutdown.
>   drivers/misc: (aspeed-lpc-snoop): Add regmap cleanup on a shutdown.
>   drivers/misc: (aspeed-lpc-snoop): Fix platform_get_irq() error
>     checking
>
>  drivers/char/ipmi/kcs_bmc_aspeed.c    |  8 +++++
>  drivers/soc/aspeed/aspeed-lpc-snoop.c | 46 ++++++++++++++++++++++++++-
>  2 files changed, 53 insertions(+), 1 deletion(-)
>
> --
> 2.25.1
>
