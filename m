Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8595048EB2D
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 15:01:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jb2zC36KQz30NS
	for <lists+openbmc@lfdr.de>; Sat, 15 Jan 2022 01:01:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.57;
 helo=out30-57.freemail.mail.aliyun.com;
 envelope-from=guoheyi@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jb2yq2rJ9z2yMC;
 Sat, 15 Jan 2022 01:01:17 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R261e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04426; MF=guoheyi@linux.alibaba.com;
 NM=1; PH=DS; RN=10; SR=0; TI=SMTPD_---0V1pIrib_1642168867; 
Received: from 30.39.196.58(mailfrom:guoheyi@linux.alibaba.com
 fp:SMTPD_---0V1pIrib_1642168867) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 14 Jan 2022 22:01:08 +0800
Message-ID: <e62fba0b-ebb9-934a-d7cf-6da33ecc4335@linux.alibaba.com>
Date: Fri, 14 Jan 2022 22:01:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] drivers/i2c-aspeed: avoid invalid memory reference after
 timeout
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
References: <20220109132613.122912-1-guoheyi@linux.alibaba.com>
 <ad5e5438-4a3f-2447-4af3-7caa91e7252a@linux.alibaba.com>
 <CACPK8XcYp9iAD3fjBQCax41C-1UpA+1AQW3epyEooYzNLt7R5g@mail.gmail.com>
From: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <CACPK8XcYp9iAD3fjBQCax41C-1UpA+1AQW3epyEooYzNLt7R5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,


在 2022/1/11 下午6:51, Joel Stanley 写道:
> On Tue, 11 Jan 2022 at 07:52, Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>> Hi all,
>>
>> Any comments?
>>
>> Thanks,
>>
>> Heyi
>>
>> 在 2022/1/9 下午9:26, Heyi Guo 写道:
>>> The memory will be freed by the caller if transfer timeout occurs,
>>> then it would trigger kernel panic if the peer device responds with
>>> something after timeout and triggers the interrupt handler of aspeed
>>> i2c driver.
>>>
>>> Set the msgs pointer to NULL to avoid invalid memory reference after
>>> timeout to fix this potential kernel panic.
> Thanks for the patch. How did you discover this issue? Do you have a
> test I can run to reproduce the crash?

We are using one i2c channel to communicate with another MCU by 
implementing user space SSIF protocol, and the MCU may not respond in 
time if it is busy. If it responds after timeout occurs, it will trigger 
below kernel panic:

[11844.248998] 8<--- cut here ---
[11844.252419] Unhandled fault: page domain fault (0x81b) at 0x7edb2ff5
[11844.259509] pgd = aa62a338
[11844.262524] [7edb2ff5] *pgd=b5bee835, *pte=b020275f, *ppte=b0202c7f
[11844.269525] Internal error: : 81b [#1] SMP ARM
[11844.274479] Modules linked in: [last unloaded: i2c_dev_sysfs]
[11844.280895] CPU: 0 PID: 256 Comm: ssif-host Tainted: G           
O      5.4.39-e0b210f #1
[11844.290016] Hardware name: Generic DT based system
[11844.295367] PC is at aspeed_i2c_master_irq+0xc8/0x498
[11844.301001] LR is at 0x16
[11844.303917] pc : [<80636b4c>]    lr : [<00000016>]    psr: 000f0193
[11844.310905] sp : b5c53ce8  ip : 7edb2fe0  fp : b5c53d04
[11844.316730] r10: b5c52000  r9 : 00000000  r8 : 0000002e
[11844.322554] r7 : 00000001  r6 : 00000004  r5 : 00000004  r4 : b4b91440
[11844.329825] r3 : 00000000  r2 : b642448c  r1 : 00000015  r0 : 00000000
[11844.337107] Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  
Segment none
[11844.345163] Control: 10c5387d  Table: b5a9006a  DAC: 00000051
[11844.351572] Process ssif-host (pid: 256, stack limit = 0xbe5df348)
[11844.358466] Stack: (0xb5c53ce8 to 0xb5c54000)
[11844.363325] 3ce0:                   b4b91440 00000004 b4b916bc 
00000001 b5c53d2c b5c53d08
[11844.372451] 3d00: 80636f80 80636a90 b4b8d140 80c052e4 b91e8068 
00000001 0000002e 00000000
[11844.381577] 3d20: b5c53d6c b5c53d30 8017b13c 80636f28 80839580 
b53a8600 b91e8000 b5c53d70
[11844.390702] 3d40: 80c8fcb4 b91e8000 80c052e4 b91e8068 00000001 
b900c800 b5c53e28 b648863c
[11844.399828] 3d60: b5c53d8c b5c53d70 8017b348 8017b0f4 00000000 
80c04c48 b91e8000 80c052e4
[11844.408954] 3d80: b5c53dac b5c53d90 8017b3fc 8017b318 b91e8000 
80c052e4 00000000 00000001
[11844.418079] 3da0: b5c53dc4 b5c53db0 801800f4 8017b3b0 0000002e 
80b771c0 b5c53dd4 b5c53dc8
[11844.427205] 3dc0: 8017a1bc 80180040 b5c53dfc b5c53dd8 8017a8d0 
8017a198 bf80200c 000003ff
[11844.436330] 3de0: 80c052e4 bf802000 00000000 b5c53e28 b5c53e24 
b5c53e00 801022f8 8017a87c
[11844.445456] 3e00: 80634000 200f0013 ffffffff b5c53e5c b6488640 
b5c52000 b5c53eac b5c53e28
[11844.454583] 3e20: 80101aac 801022b8 b6488640 38c3f000 00000059 
80b7ca58 7edb2974 00000000
[11844.463709] 3e40: b6424480 00000002 b6488640 b6424480 b648863c 
b5c53eac 0000005d b5c53e78
[11844.472835] 3e60: 00000001 80634000 200f0013 ffffffff 00000051 
7f000000 00000018 b53a8600
[11844.481960] 3e80: 00000018 7edb2974 00000000 b53a8600 00000051 
b4c5ce40 b5c52000 00000036
[11844.491086] 3ea0: b5c53ee4 b5c53eb0 80634850 80633fc0 b5fd3015 
802a7770 7edb2990 00000002
[11844.500212] 3ec0: b4b94778 80c04c48 7edb2974 b4b94778 b4c5ce40 
00000007 b5c53f6c b5c53ee8
[11844.509338] 3ee0: 802c6c48 80634528 00000020 b4b94778 b4c5ce48 
00000142 b5c53f34 b5c53f08
[11844.518463] 3f00: 802a604c 802a5e2c 00000000 00000000 00000000 
00000000 00000000 b5fd3000
[11844.527589] 3f20: b4c5ce40 b5fd3000 b5c53f4c b5c53f38 802c27e0 
802a6010 00000007 80c04c48
[11844.536715] 3f40: b5c53f94 b4c5ce40 00000007 00000707 7edb2974 
b4c5ce40 b5c52000 00000036
[11844.545841] 3f60: b5c53f94 b5c53f70 802c71dc 802c6870 00000007 
00000016 0000000c 00000036
[11844.554967] 3f80: 80101204 b5c52000 b5c53fa4 b5c53f98 802c7220 
802c71a4 00000000 b5c53fa8
[11844.564092] 3fa0: 80101000 802c7214 00000007 00000016 00000007 
00000707 7edb2974 7edb2990
[11844.573218] 3fc0: 00000007 00000016 0000000c 00000036 7edb2be1 
7edb2fe0 00000030 76f436b4
[11844.582344] 3fe0: 0004d110 7edb2964 00033f48 45f2ffac 200f0010 
00000007 00000000 00000000
[11844.591464] Backtrace:
[11844.594189] [<80636a84>] (aspeed_i2c_master_irq) from [<80636f80>] 
(aspeed_i2c_bus_irq+0x64/0x180)
[11844.604187]  r7:00000001 r6:b4b916bc r5:00000004 r4:b4b91440
[11844.610506] [<80636f1c>] (aspeed_i2c_bus_irq) from [<8017b13c>] 
(__handle_irq_event_percpu+0x54/0x224)
[11844.620893]  r9:00000000 r8:0000002e r7:00000001 r6:b91e8068 
r5:80c052e4 r4:b4b8d140
[11844.629537] [<8017b0e8>] (__handle_irq_event_percpu) from 
[<8017b348>] (handle_irq_event_percpu+0x3c/0x98)
[11844.640311]  r10:b648863c r9:b5c53e28 r8:b900c800 r7:00000001 
r6:b91e8068 r5:80c052e4
[11844.649044]  r4:b91e8000
[11844.651861] [<8017b30c>] (handle_irq_event_percpu) from [<8017b3fc>] 
(handle_irq_event+0x58/0x7c)
[11844.661759]  r5:80c052e4 r4:b91e8000
[11844.665747] [<8017b3a4>] (handle_irq_event) from [<801800f4>] 
(handle_fasteoi_irq+0xc0/0x180)
[11844.675259]  r7:00000001 r6:00000000 r5:80c052e4 r4:b91e8000
[11844.681574] [<80180034>] (handle_fasteoi_irq) from [<8017a1bc>] 
(generic_handle_irq+0x30/0x44)
[11844.691181]  r5:80b771c0 r4:0000002e
[11844.695169] [<8017a18c>] (generic_handle_irq) from [<8017a8d0>] 
(__handle_domain_irq+0x60/0xc4)
[11844.704878] [<8017a870>] (__handle_domain_irq) from [<801022f8>] 
(gic_handle_irq+0x4c/0x94)
[11844.714198]  r9:b5c53e28 r8:00000000 r7:bf802000 r6:80c052e4 
r5:000003ff r4:bf80200c
[11844.722838] [<801022ac>] (gic_handle_irq) from [<80101aac>] 
(__irq_svc+0x6c/0x90)
[11844.731185] Exception stack(0xb5c53e28 to 0xb5c53e70)
[11844.736819] 3e20:                   b6488640 38c3f000 00000059 
80b7ca58 7edb2974 00000000
[11844.745945] 3e40: b6424480 00000002 b6488640 b6424480 b648863c 
b5c53eac 0000005d b5c53e78
[11844.755068] 3e60: 00000001 80634000 200f0013 ffffffff
[11844.760704]  r9:b5c52000 r8:b6488640 r7:b5c53e5c r6:ffffffff 
r5:200f0013 r4:80634000
[11844.769347] [<80633fb4>] (i2cdev_ioctl_rdwr) from [<80634850>] 
(i2cdev_ioctl+0x334/0x3bc)
[11844.778473]  r10:00000036 r9:b5c52000 r8:b4c5ce40 r7:00000051 
r6:b53a8600 r5:00000000
[11844.787206]  r4:7edb2974
[11844.790024] [<8063451c>] (i2cdev_ioctl) from [<802c6c48>] 
(do_vfs_ioctl+0x3e4/0x934)
[11844.798664]  r7:00000007 r6:b4c5ce40 r5:b4b94778 r4:7edb2974
[11844.804979] [<802c6864>] (do_vfs_ioctl) from [<802c71dc>] 
(ksys_ioctl+0x44/0x70)
[11844.813232]  r10:00000036 r9:b5c52000 r8:b4c5ce40 r7:7edb2974 
r6:00000707 r5:00000007
[11844.821966]  r4:b4c5ce40
[11844.824781] [<802c7198>] (ksys_ioctl) from [<802c7220>] 
(sys_ioctl+0x18/0x1c)
[11844.832745]  r9:b5c52000 r8:80101204 r7:00000036 r6:0000000c 
r5:00000016 r4:00000007
[11844.841385] [<802c7208>] (sys_ioctl) from [<80101000>] 
(ret_fast_syscall+0x0/0x54)
[11844.849827] Exception stack(0xb5c53fa8 to 0xb5c53ff0)
[11844.855453] 3fa0:                   00000007 00000016 00000007 
00000707 7edb2974 7edb2990
[11844.864578] 3fc0: 00000007 00000016 0000000c 00000036 7edb2be1 
7edb2fe0 00000030 76f436b4
[11844.873701] 3fe0: 0004d110 7edb2964 00033f48 45f2ffac
[11844.879337] Code: e1a03423 e281e001 e6ef3073 e584e2a4 (e7cc3001)
[11844.886143] ---[ end trace 9422f39bd8d33cb5 ]---

After applying this patch, we'll get below warning instead:

"bus in unknown state. irq_status: 0x%x\n"

The issue can be reproduced more easily by setting the timeout to some 
smaller value.

>
> Can you provide a Fixes tag?

I think the bug was introduced by the first commit of this file :(

f327c686d3ba44eda79a2d9e02a6a242e0b75787


>
> Do other i2c master drivers do this? I took a quick look at the meson
> driver and it doesn't appear to clear it's pointer to msgs.

It is hard to say. It seems other drivers have some recover scheme like 
aborting the transfer, or loop each messages in process context and 
don't do much in IRQ handler, which may disable interrupts or not retain 
the buffer pointer before returning timeout.

Thanks,

Heyi


>
>>> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
>>>
>>> -------
>>>
>>> Cc: Brendan Higgins <brendanhiggins@google.com>
>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> Cc: Joel Stanley <joel@jms.id.au>
>>> Cc: Andrew Jeffery <andrew@aj.id.au>
>>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>>> Cc: linux-i2c@vger.kernel.org
>>> Cc: openbmc@lists.ozlabs.org
>>> Cc: linux-arm-kernel@lists.infradead.org
>>> Cc: linux-aspeed@lists.ozlabs.org
>>> ---
>>>    drivers/i2c/busses/i2c-aspeed.c | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>>> index 67e8b97c0c950..3ab0396168680 100644
>>> --- a/drivers/i2c/busses/i2c-aspeed.c
>>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>>> @@ -708,6 +708,11 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>>>                spin_lock_irqsave(&bus->lock, flags);
>>>                if (bus->master_state == ASPEED_I2C_MASTER_PENDING)
>>>                        bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
>>> +             /*
>>> +              * All the buffers may be freed after returning to caller, so
>>> +              * set msgs to NULL to avoid memory reference after freeing.
>>> +              */
>>> +             bus->msgs = NULL;
>>>                spin_unlock_irqrestore(&bus->lock, flags);
>>>
>>>                return -ETIMEDOUT;
