Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AE72D30CA
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 18:18:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr6N46hgbzDqjR
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 04:18:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=jae.hyun.yoo@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr6Lp2XYlzDqV4;
 Wed,  9 Dec 2020 04:17:36 +1100 (AEDT)
IronPort-SDR: +HKLfEtkn9ziBPZ4XApt3PRppMjz0SuwxfyUmG1bkA86MPK5G7kp3wsskhVZWtnL4KfO2gD4kQ
 d4QRTlEeWtjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="171359293"
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; d="scan'208";a="171359293"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 09:17:32 -0800
IronPort-SDR: gpgvb6bzNUlGoc0Pt7NVf9emRLMcRamAU/z/Mh02EylXDTd73zCovT3TGCYamyfE35Z8J9vfK1
 vEPMB52STqSQ==
X-IronPort-AV: E=Sophos;i="5.78,403,1599548400"; d="scan'208";a="363731737"
Received: from yoojae-mobl.amr.corp.intel.com (HELO [10.251.25.42])
 ([10.251.25.42])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2020 09:17:31 -0800
Subject: Re: [PATCH 2/2] media: aspeed: fix clock handling logic
To: Joel Stanley <joel@jms.id.au>
References: <20201207164240.15436-1-jae.hyun.yoo@linux.intel.com>
 <20201207164240.15436-3-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xd3dz1WLGNGqMiAZxhMEeGHbkPtvO2rYQ36Kbj=Uvy-jA@mail.gmail.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <d3faea9e-e7d6-eba0-a6b2-c30bc9b6e147@linux.intel.com>
Date: Tue, 8 Dec 2020 09:16:29 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd3dz1WLGNGqMiAZxhMEeGHbkPtvO2rYQ36Kbj=Uvy-jA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 Andrew Jeffery <andrew@aj.id.au>, Michael Turquette <mturquette@baylibre.com>,
 Eddie James <eajames@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Stephen Boyd <sboyd@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-clk@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

On 12/7/2020 6:39 PM, Joel Stanley wrote:
> On Mon, 7 Dec 2020 at 16:33, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>>
>> Video engine uses eclk and vclk for its clock sources and its reset
>> control is coupled with eclk so the current clock enabling sequence works
>> like below.
>>
>>   Enable eclk
>>   De-assert Video Engine reset
>>   10ms delay
>>   Enable vclk
> 
> This is the case after " clk: ast2600: fix reset settings for eclk and
> vclk" is applied, correct? Without that patch applied the reset
> sequence is correct by accident for the 2600, but it will be wrong for
> the 2500?

Correct. Video Engine reset was coupled with eclk for AST2500 and vclk
for AST2600 so above sequence was observed only in AST2500. As you said,
AST2600 didn't make the issue by accident but the clk/reset pair should
be fixed by this patch series.

>> It introduces improper reset on the Video Engine hardware and eventually
>> the hardware generates unexpected DMA memory transfers that can corrupt
>> memory region in random and sporadic patterns. This issue is observed
>> very rarely on some specific AST2500 SoCs but it causes a critical
>> kernel panic with making a various shape of signature so it's extremely
>> hard to debug.
> 
> I wasn't sure what you meant by "various shape of signature". Can you
> elaborate, and/or share with us some examples of the signature?

The memory corruption usually happens in the first boot but not always,
and the corruption range is random within the whole DRAM memory area.

I'm sharing some kernel panic signatures below.

Signature #1:
[   56.270652] 8<--- cut here ---
[   56.273788] Unable to handle kernel paging request at virtual address 
201d14ec
[   56.281158] pgd = 8fb7e7c3
[   56.283917] [201d14ec] *pgd=00000000
[   56.287616] Internal error: Oops: 5 [#1] ARM
[   56.291913] CPU: 0 PID: 200 Comm: rsync Not tainted 
5.4.43-c109de3-dirty-d4b4255 #1
[   56.299564] Hardware name: Generic DT based system
[   56.304377] PC is at time_out_leases+0x2c/0x11c
[   56.308924] LR is at __break_lease+0xa4/0x528
[   56.313284] pc : [<802ba658>]    lr : [<802bbdd8>]    psr: 30000013
[   56.319548] sp : 975dbd40  ip : 975dbd78  fp : 975dbd74
[   56.324766] r10: 201d14ec  r9 : 00000000  r8 : 9e17eca8
[   56.329983] r7 : 80808090  r6 : 9e74e670  r5 : 9e74e670  r4 : 9e6e9480
[   56.336500] r3 : 00000000  r2 : 80b2bf4c  r1 : 975dbd88  r0 : 9e74e670
[   56.343018] Flags: nzCV  IRQs on  FIQs on  Mode SVC_32  ISA ARM 
Segment none
[   56.350144] Control: 00c5387d  Table: 975ac008  DAC: 00000051
[   56.355897] Process rsync (pid: 200, stack limit = 0x1de80c24)
[   56.361730] Stack: (0x975dbd40 to 0x975dc000)
[   56.366099] bd40: 975dbd74 975dbd88 802ba7bc 9e6e9480 9e74e670 
80b2af10 00000000 9e17eca8
[   56.374279] bd60: 00000000 9e17eca0 975dbdd4 975dbd78 802bbdd8 
802ba638 00000000 d0d0d0d0
[   56.382454] bd80: 00024800 80808080 975dbd88 975dbd88 000000ff 
8026b310 00000024 9e74e670
[   56.390632] bda0: 00000000 80b03208 00000004 00000000 9e17eca0 
9e74e670 00000000 9e17eca8
[   56.398808] bdc0: 00024800 9e17eca0 975dbdfc 975dbdd8 80259b04 
802bbd40 00000000 975dbea0
[   56.406988] bde0: 00000000 00000002 00000004 00024800 975dbe0c 
975dbe00 8025b1d0 80259a34
[   56.415168] be00: 975dbe9c 975dbe10 8026e0e8 8025b1a0 00000000 
975dbee8 7ed22900 975da000
[   56.423350] be20: 975da000 8027d6d0 9e74ee40 975dbe98 975dbe94 
00000043 00000000 00000000
[   56.431522] be40: 9e17eca0 00000000 000043ff 00000000 975dbe74 
00000002 9e74e670 9e6f8a90
[   56.439697] be60: 98f67908 98f67770 975dbe8c 80b03208 80277d9c 
00000003 975dbea0 975dbf58
[   56.447877] be80: 00000003 801011e4 975da000 00000000 975dbf4c 
975dbea0 8026f06c 8026de58
[   56.456050] bea0: 9e6f8a90 98f67908 e9b52671 00000051 98ad7021 
00000ff0 00000000 7ed22a5c
[   56.464231] bec0: 9e74e670 00000103 00000002 000006a6 00000000 
00000000 00000000 975dbee0
[   56.472410] bee0: 975115c0 80b03208 00000003 975767b4 00000000 
00000400 000a4800 975767a0
[   56.480587] bf00: 975dbf3c 975dbf10 8027f538 8027edc0 98ad7000 
00000000 ffffff9c 98ad7000
[   56.488767] bf20: ffffff9c 801011e4 975da000 80b03208 00000003 
ffffff9c 98ad7000 fffff000
[   56.496952] bf40: 975dbf94 975dbf50 8025b87c 8026eff4 8025ba20 
80260428 00024800 00000000
[   56.505128] bf60: 00000004 00000100 00000003 80b03208 7ed22a5c 
00000062 070b5ad0 00000142
[   56.513300] bf80: 801011e4 975da000 975dbfa4 975dbf98 8025b97c 
8025b714 00000000 975dbfa8
[   56.521474] bfa0: 80101000 8025b96c 7ed22a5c 00000062 ffffff9c 
7ed22a5c 000a4800 00000000
[   56.529656] bfc0: 7ed22a5c 00000062 070b5ad0 00000142 76e46ca0 
0048d9ac 00000062 0049e250
[   56.537836] bfe0: 0048daf4 7ed22950 76eda7f0 76f05138 20000010 
ffffff9c 00000000 00000000
[   56.545996] Backtrace:
[   56.548475] [<802ba62c>] (time_out_leases) from [<802bbdd8>] 
(__break_lease+0xa4/0x528)
[   56.556481]  r10:9e17eca0 r9:00000000 r8:9e17eca8 r7:00000000 
r6:80b2af10 r5:9e74e670
[   56.564302]  r4:9e6e9480
[   56.566854] [<802bbd34>] (__break_lease) from [<80259b04>] 
(do_dentry_open+0xdc/0x3d8)
[   56.574775]  r10:9e17eca0 r9:00024800 r8:9e17eca8 r7:00000000 
r6:9e74e670 r5:9e17eca0
[   56.582597]  r4:00000000
[   56.585145] [<80259a28>] (do_dentry_open) from [<8025b1d0>] 
(vfs_open+0x3c/0x40)
[   56.592539]  r9:00024800 r8:00000004 r7:00000002 r6:00000000 
r5:975dbea0 r4:00000000
[   56.600298] [<8025b194>] (vfs_open) from [<8026e0e8>] 
(path_openat+0x29c/0x119c)
[   56.607705] [<8026de4c>] (path_openat) from [<8026f06c>] 
(do_filp_open+0x84/0x130)
[   56.615272]  r10:00000000 r9:975da000 r8:801011e4 r7:00000003 
r6:975dbf58 r5:975dbea0
[   56.623087]  r4:00000003
[   56.625638] [<8026efe8>] (do_filp_open) from [<8025b87c>] 
(do_sys_open+0x174/0x22c)
[   56.633297]  r7:fffff000 r6:98ad7000 r5:ffffff9c r4:00000003
[   56.638959] [<8025b708>] (do_sys_open) from [<8025b97c>] 
(sys_openat+0x1c/0x20)
[   56.646263]  r9:975da000 r8:801011e4 r7:00000142 r6:070b5ad0 
r5:00000062 r4:7ed22a5c
[   56.654005] [<8025b960>] (sys_openat) from [<80101000>] 
(ret_fast_syscall+0x0/0x54)
[   56.661659] Exception stack(0x975dbfa8 to 0x975dbff0)
[   56.666720] bfa0:                   7ed22a5c 00000062 ffffff9c 
7ed22a5c 000a4800 00000000
[   56.674900] bfc0: 7ed22a5c 00000062 070b5ad0 00000142 76e46ca0 
0048d9ac 00000062 0049e250
[   56.683068] bfe0: 0048daf4 7ed22950 76eda7f0 76f05138
[   56.688129] Code: e1a06000 e50b1030 e5b7a010 e157000a (e41a5004)
[   56.694475] ---[ end trace 9da7162eec2a475b ]---
[   56.719911] Kernel panic - not syncing: Fatal exception
[   56.746391] ---[ end Kernel panic - not syncing: Fatal exception ]---

Signature #2:
[   26.916233] 8<--- cut here ---
[   26.919325] Unable to handle kernel paging request at virtual address 
808080dd
[   26.926556] pgd = fe0a3732
[   26.929269] [808080dd] *pgd=8080841e(bad)
[   26.933294] Internal error: Oops: 80d [#1] ARM
[   26.937750] CPU: 0 PID: 148 Comm: systemd-udevd Not tainted 
5.4.43-c109de3-dirty-a68e66e #1
[   26.946088] Hardware name: Generic DT based system
[   26.950907] PC is at free_block.constprop.0+0x140/0x23c
[   26.956138] LR is at 0x9ebfa104
[   26.959281] pc : [<8025226c>]    lr : [<9ebfa104>]    psr: 60000093
[   26.965537] sp : 98b17ca0  ip : 808080df  fp : 98b17ce4
[   26.970755] r10: 80b8f588  r9 : 808080df  r8 : 00000001
[   26.975973] r7 : 9ebfa104  r6 : 9d000b00  r5 : 9d001440  r4 : 9ebfa100
[   26.982489] r3 : 00000122  r2 : 00404040  r1 : 9eeffdc4  r0 : fffffffe
[   26.989010] Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM 
Segment none
[   26.996229] Control: 00c5387d  Table: 98b20008  DAC: 00000051
[   27.001980] Process systemd-udevd (pid: 148, stack limit = 0x2ead0cd0)
[   27.008500] Stack: (0x98b17ca0 to 0x98b18000)
[   27.012870] 7ca0: 98b17cbc 98b17cec 00000071 9eeffdc4 0000001b 
9ebc52c4 80258e14 9ebc52b0
[   27.021050] 7cc0: 9d000b00 98b96c00 0000001b 00000000 9ebc52c0 
00000071 98b17d1c 98b17ce8
[   27.029232] 7ce0: 80253d94 80252138 806370a0 98b17cec 98b17cec 
80b03208 a0000013 98b96c00
[   27.037412] 7d00: 8062e6f8 98b96d00 98b17db0 98e40540 98b17d44 
98b17d20 802543d8 80253cb0
[   27.045595] 7d20: 98b17d74 8068dc8c 98b17d4c 00000000 9e690800 
98b95c00 98b17d64 98b17d48
[   27.053773] 7d40: 8062e6f8 8025435c 98b95c00 9e690800 98b17f54 
00000000 98b17d7c 98b17d68
[   27.061945] 7d60: 8062e9a4 8062e5a8 9e690800 9e690800 98b17d94 
98b17d80 806376e4 8062e968
[   27.070119] 7d80: 98b95c00 9e690800 98b17df4 98b17d98 8068f648 
806376d0 00000000 00000000
[   27.078290] 7da0: 00000000 98b0d370 00000000 00000000 00000000 
00000000 00000000 00000000
[   27.086465] 7dc0: 00000000 80b03208 98b17e04 8068f50c 98b17f54 
7ee9e9e8 7ee9ea04 7eea0a84
[   27.094646] 7de0: 98b17e14 00000000 98b17e0c 98b17df8 80622808 
8068f518 98b17f54 98b17f54
[   27.102819] 7e00: 98b17ebc 98b17e10 806231b0 806227ec 00000000 
00000010 00000000 00000001
[   27.110989] 7e20: 98b16000 00000000 98b17e6c 98b17e38 8041c238 
8025dc74 98b17ed4 98b17e40
[   27.119163] 7e40: 98b17ed4 80b03208 98b17f54 00000000 98b17ed0 
98b17ecc 00000051 98b16000
[   27.127336] 7e60: 98b17ebc 98b17e70 80623d7c 8041c200 98b17ecc 
98b17f5c 7ee9ea04 00000080
[   27.135509] 7e80: 7ee9e9d8 00000001 7eea0a84 00000018 00000000 
80b03208 00000000 98b17f54
[   27.143691] 7ea0: 00000000 98e40540 7ee9e9e8 98b16000 98b17f3c 
98b17ec0 80623e7c 80623138
[   27.151869] 7ec0: 00000000 00000000 98b17f3c 00000000 7ee9ea04 
7ee9ea84 00002000 9e423060
[   27.160043] 7ee0: 00000000 00000000 98b17f94 80165b78 3b9aca00 
98b17f28 76f13890 00000193
[   27.168218] 7f00: 98b17f24 8027fb50 98b17f24 98b17f18 8027fb50 
80b03208 98b17f3c 98e40540
[   27.176397] 7f20: 7ee9e9e8 00000000 00000129 801011e4 98b17fa4 
98b17f40 806265fc 80623e14
[   27.184573] 7f40: 00000000 80413224 0000001a 00000000 fffffff7 
98b17e14 0000000c 00000004
[   27.192752] 7f60: 00000071 00001f8f 98b17ed4 00000001 8016db78 
7eea0a84 00000018 00000000
[   27.200935] 7f80: 00000000 80b03208 98b17fa4 76f0d4d0 7ee9eaa0 
7ee9e9e0 00000000 98b17fa8
[   27.209114] 7fa0: 80101000 806265ac 76f0d4d0 7ee9eaa0 00000003 
7ee9e9e8 00000000 00000000
[   27.217291] 7fc0: 76f0d4d0 7ee9eaa0 7ee9e9e0 00000129 00de15f0 
00000011 7ee9ea84 00000000
[   27.225468] 7fe0: 004bbecc 7ee9e988 0044bdcc 76e4eef4 60000010 
00000003 00000000 00000000
[   27.233629] Backtrace:
[   27.236112] [<8025212c>] (free_block.constprop.0) from [<80253d94>] 
(___cache_free+0xf0/0x1a4)
[   27.244728]  r10:00000071 r9:9ebc52c0 r8:00000000 r7:0000001b 
r6:98b96c00 r5:9d000b00
[   27.252552]  r4:9ebc52b0
[   27.255099] [<80253ca4>] (___cache_free) from [<802543d8>] 
(kfree+0x88/0x11c)
[   27.262244]  r9:98e40540 r8:98b17db0 r7:98b96d00 r6:8062e6f8 
r5:98b96c00 r4:a0000013
[   27.270010] [<80254350>] (kfree) from [<8062e6f8>] 
(skb_release_data+0x15c/0x178)
[   27.277489]  r6:98b95c00 r5:9e690800 r4:00000000
[   27.282122] [<8062e59c>] (skb_release_data) from [<8062e9a4>] 
(consume_skb+0x48/0x9c)
[   27.289954]  r7:00000000 r6:98b17f54 r5:9e690800 r4:98b95c00
[   27.295625] [<8062e95c>] (consume_skb) from [<806376e4>] 
(skb_free_datagram+0x20/0x4c)
[   27.303539]  r5:9e690800 r4:9e690800
[   27.307130] [<806376c4>] (skb_free_datagram) from [<8068f648>] 
(netlink_recvmsg+0x13c/0x34c)
[   27.315561]  r5:9e690800 r4:98b95c00
[   27.319165] [<8068f50c>] (netlink_recvmsg) from [<80622808>] 
(sock_recvmsg+0x28/0x2c)
[   27.326998]  r10:00000000 r9:98b17e14 r8:7eea0a84 r7:7ee9ea04 
r6:7ee9e9e8 r5:98b17f54
[   27.334813]  r4:8068f50c
[   27.337367] [<806227e0>] (sock_recvmsg) from [<806231b0>] 
(____sys_recvmsg+0x84/0x178)
[   27.345276]  r5:98b17f54 r4:98b17f54
[   27.348861] [<8062312c>] (____sys_recvmsg) from [<80623e7c>] 
(___sys_recvmsg+0x74/0xa8)
[   27.356863]  r9:98b16000 r8:7ee9e9e8 r7:98e40540 r6:00000000 
r5:98b17f54 r4:00000000
[   27.364608] [<80623e08>] (___sys_recvmsg) from [<806265fc>] 
(sys_recvmsg+0x5c/0xa0)
[   27.372262]  r8:801011e4 r7:00000129 r6:00000000 r5:7ee9e9e8 r4:98e40540
[   27.378969] [<806265a0>] (sys_recvmsg) from [<80101000>] 
(ret_fast_syscall+0x0/0x54)
[   27.386705] Exception stack(0x98b17fa8 to 0x98b17ff0)
[   27.391765] 7fa0:                   76f0d4d0 7ee9eaa0 00000003 
7ee9e9e8 00000000 00000000
[   27.399939] 7fc0: 76f0d4d0 7ee9eaa0 7ee9e9e0 00000129 00de15f0 
00000011 7ee9ea84 00000000
[   27.408116] 7fe0: 004bbecc 7ee9e988 0044bdcc 76e4eef4
[   27.413166]  r6:7ee9e9e0 r5:7ee9eaa0 r4:76f0d4d0
[   27.417792] Code: 01a0c009 e2400001 e5840018 05849010 (e7cc2000)
[   27.423888] ---[ end trace aae28516b6486a83 ]---
[   27.448887] Kernel panic - not syncing: Fatal exception
[   27.474504] ---[ end Kernel panic - not syncing: Fatal exception ]---

Signature #3:
[   44.164322] 8<--- cut here ---
[   44.167529] Unable to handle kernel paging request at virtual address 
0700007c
[   44.174794] pgd = a9241b59
[   44.177604] [0700007c] *pgd=00000000
[   44.181246] Internal error: Oops: 5 [#1] ARM
[   44.185546] CPU: 0 PID: 181 Comm: systemd-resolve Not tainted 
5.4.43-c109de3-dirty-18e1537 #1
[   44.194062] Hardware name: Generic DT based system
[   44.198875] PC is at __d_lookup_rcu+0x74/0x1bc
[   44.203338] LR is at lookup_fast+0x5c/0x2dc
[   44.207523] pc : [<80279370>]    lr : [<8026abdc>]    psr: 20000013
[   44.213779] sp : 98bf9d00  ip : 98bf9d48  fp : 98bf9d44
[   44.218996] r10: 98bf5a90  r9 : 98bf9d98  r8 : 3989f237
[   44.224213] r7 : 0000000f  r6 : 00000003  r5 : 98ec2198  r4 : 07000080
[   44.230731] r3 : 07000080  r2 : 07000080  r1 : 98bf9ea8  r0 : 98ec2198
[   44.237251] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM 
Segment none
[   44.244382] Control: 00c5387d  Table: 97790008  DAC: 00000051
[   44.250128] Process systemd-resolve (pid: 181, stack limit = 0x0551cb5d)
[   44.256828] Stack: (0x98bf9d00 to 0x98bfa000)
[   44.261200] 9d00: 00000004 98bf9ea8 00ffffff 98bf9d50 98b1c010 
00000002 98bf9d44 98bf9ea0
[   44.269376] 9d20: 00000000 98bf9d9c 98bf9d94 98ec2198 98bf9d98 
98bf5a90 98bf9d84 98bf9d48
[   44.277549] 9d40: 8026abdc 80279308 2f2f2f2f 98bf8000 98bf9d84 
80b03208 8026b310 98bf9ea0
[   44.285723] 9d60: 00000000 00000000 00000040 801011e4 98bf8000 
98b0de60 98bf9dd4 98bf9d88
[   44.293903] 9d80: 8026b950 8026ab8c 98bf9dcc 8027fb70 98bf9dac 
98bf9da0 8027fb70 8027ebf8
[   44.302075] 9da0: 98bf9dd4 80b03208 8026a5c8 00000000 98bf9ea0 
98bf9e64 00000040 801011e4
[   44.310250] 9dc0: 98bf8000 98b0de60 98bf9e0c 98bf9dd8 8026c920 
8026b910 9776a400 80b28c48
[   44.318431] 9de0: 98bf9e0c 98bf9df0 8026007c 80b03208 00000005 
98bf9ea0 98bf9f58 ffffe000
[   44.326611] 9e00: 98bf9e9c 98bf9e10 8026ea48 8026c8ac 975af63c 
98bf9ee8 7eb389e0 98bf8000
[   44.334787] 9e20: 000000c5 801011e4 98bf8000 00000000 98bf9e54 
00000040 80413284 80412eb4
[   44.342966] 9e40: 98bf9ee8 8025fdec 98bf9ee4 98bf9e58 80264048 
80413224 00000100 8025fdc8
[   44.351139] 9e60: 00000000 000003e4 000041ed 80b03208 00000010 
00000005 98bf9ea0 98bf9f58
[   44.359318] 9e80: 00000000 801011e4 98bf8000 00000000 98bf9f4c 
98bf9ea0 8026f06c 8026de58
[   44.367491] 9ea0: 98bf5a90 98ec2198 3989f237 0000000f 98b1c010 
00000ff0 00000000 00654fc9
[   44.375664] 9ec0: 98ec97b8 00000040 00000002 0000068a 00000000 
00000000 00000000 98bf9ee0
[   44.383837] 9ee0: 98ab4000 80b03208 00000005 98aedc00 00000000 
00000400 002a8000 98b55c20
[   44.392010] 9f00: 98bf9f3c 98bf9f10 8027f538 8027edc0 98b1c000 
00000000 00000004 98b1c000
[   44.400181] 9f20: 00000004 801011e4 98bf8000 80b03208 00000005 
00000004 98b1c000 fffff000
[   44.408357] 9f40: 98bf9f94 98bf9f50 8025b87c 8026eff4 8025ba20 
80260428 00208000 00000000
[   44.416536] 9f60: 00000000 00000000 00000000 80b03208 76f4d400 
002a8000 00000000 00000142
[   44.424710] 9f80: 801011e4 98bf8000 98bf9fa4 98bf9f98 8025b97c 
8025b714 00000000 98bf9fa8
[   44.432891] 9fa0: 80101000 8025b96c 76f4d400 002a8000 00000004 
00654fc9 002a8000 00000000
[   44.441064] 9fc0: 76f4d400 002a8000 00000000 00000142 00000004 
00654f20 00000001 7eb38a74
[   44.449243] 9fe0: 76f20980 7eb38900 76e0a4ec 76bf50fc 60000010 
00000004 00000000 00000000
[   44.457404] Backtrace:
[   44.459881] [<802792fc>] (__d_lookup_rcu) from [<8026abdc>] 
(lookup_fast+0x5c/0x2dc)
[   44.467629]  r10:98bf5a90 r9:98bf9d98 r8:98ec2198 r7:98bf9d94 
r6:98bf9d9c r5:00000000
[   44.475451]  r4:98bf9ea0
[   44.478001] [<8026ab80>] (lookup_fast) from [<8026b950>] 
(walk_component+0x4c/0x338)
[   44.485749]  r10:98b0de60 r9:98bf8000 r8:801011e4 r7:00000040 
r6:00000000 r5:00000000
[   44.493563]  r4:98bf9ea0
[   44.496112] [<8026b904>] (walk_component) from [<8026c920>] 
(path_lookupat+0x80/0x218)
[   44.504026]  r10:98b0de60 r9:98bf8000 r8:801011e4 r7:00000040 
r6:98bf9e64 r5:98bf9ea0
[   44.511842]  r4:00000000
[   44.514390] [<8026c8a0>] (path_lookupat) from [<8026ea48>] 
(path_openat+0xbfc/0x119c)
[   44.522215]  r7:ffffe000 r6:98bf9f58 r5:98bf9ea0 r4:00000005
[   44.527883] [<8026de4c>] (path_openat) from [<8026f06c>] 
(do_filp_open+0x84/0x130)
[   44.535452]  r10:00000000 r9:98bf8000 r8:801011e4 r7:00000000 
r6:98bf9f58 r5:98bf9ea0
[   44.543275]  r4:00000005
[   44.545827] [<8026efe8>] (do_filp_open) from [<8025b87c>] 
(do_sys_open+0x174/0x22c)
[   44.553483]  r7:fffff000 r6:98b1c000 r5:00000004 r4:00000005
[   44.559147] [<8025b708>] (do_sys_open) from [<8025b97c>] 
(sys_openat+0x1c/0x20)
[   44.566452]  r9:98bf8000 r8:801011e4 r7:00000142 r6:00000000 
r5:002a8000 r4:76f4d400
[   44.574195] [<8025b960>] (sys_openat) from [<80101000>] 
(ret_fast_syscall+0x0/0x54)
[   44.581846] Exception stack(0x98bf9fa8 to 0x98bf9ff0)
[   44.586906] 9fa0:                   76f4d400 002a8000 00000004 
00654fc9 002a8000 00000000
[   44.595083] 9fc0: 76f4d400 002a8000 00000000 00000142 00000004 
00654f20 00000001 7eb38a74
[   44.603255] 9fe0: 76f20980 7eb38900 76e0a4ec 76bf50fc
[   44.608316] Code: ea000002 e5944000 e3540000 0a00003b (e5142004)
[   44.615159] ---[ end trace c58e5386f8075167 ]---
[   44.642092] Kernel panic - not syncing: Fatal exception
[   44.669403] ---[ end Kernel panic - not syncing: Fatal exception ]---

Signature #4:
[   23.321520] 8<--- cut here ---
[   23.324610] Unable to handle kernel paging request at virtual address 
2ffdc750
[   23.331834] pgd = 5f600a24
[   23.334547] [2ffdc750] *pgd=00000000
[   23.338137] Internal error: Oops: 5 [#1] ARM
[   23.342420] CPU: 0 PID: 152 Comm: systemd-udevd Not tainted 
5.4.43-c109de3-dirty-18e1537 #1
[   23.350759] Hardware name: Generic DT based system
[   23.355571] PC is at of_find_property+0x48/0x7c
[   23.360113] LR is at of_find_property+0x54/0x7c
[   23.364635] pc : [<806019d4>]    lr : [<806019e0>]    psr: 20000093
[   23.370893] sp : 98a09d20  ip : 98a09d20  fp : 98a09d3c
[   23.376110] r10: 00000001  r9 : 96ce5b60  r8 : 80b09680
[   23.381328] r7 : 60000013  r6 : 00000000  r5 : 8097d3a0  r4 : 2ffdc750
[   23.387845] r3 : 000000c1  r2 : 00000064  r1 : 8097d3a1  r0 : 00000001
[   23.394364] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM 
Segment none
[   23.401583] Control: 00c5387d  Table: 98a0c008  DAC: 00000051
[   23.407335] Process systemd-udevd (pid: 152, stack limit = 0x991dcdd9)
[   23.413855] Stack: (0x98a09d20 to 0x98a0a000)
[   23.418225] 9d20: 80b09680 80b09680 80b09680 9e7e7000 98a09d4c 
98a09d40 80601b60 80601998
[   23.426405] 9d40: 98a09d74 98a09d50 80604e28 80601b54 80b09680 
80b09680 9e7e7000 9e6f8000
[   23.434585] 9d60: 80b09680 96ce5b60 98a09db4 98a09d78 8050f46c 
80604ddc 00000894 80253574
[   23.442758] 9d80: 98ac2760 802d97a4 98a09dd4 9d087f40 80b09680 
80b03208 9e6f8000 9d087f40
[   23.450939] 9da0: 80b09680 9e7e7000 98a09ddc 98a09db8 8050d5a4 
8050f3f0 96c19a00 80b41dec
[   23.459124] 9dc0: 808596d0 9e6f8000 80b09680 96ce5b60 98a09df4 
98a09de0 8050d068 8050d508
[   23.467300] 9de0: 96c19a00 00001000 98a09e1c 98a09df8 802da700 
8050d04c 96c19a00 9e7d6480
[   23.475476] 9e00: 00000000 98a09f68 98a09f68 96c19a18 98a09e2c 
98a09e20 802d8dd8 802da680
[   23.483654] 9e20: 98a09e74 98a09e30 80286c5c 802d8db0 98a09e54 
00000000 9e7d6480 96c19a30
[   23.491830] 9e40: 00aec920 00001000 98a09ee4 9e7d6480 96ce5b60 
00aec920 98a09f68 00000001
[   23.500011] 9e60: 00000000 00000000 98a09eb4 98a09e78 802d9ac8 
80286b00 00000000 00000000
[   23.508190] 9e80: 00000000 00000000 00001000 9e7d6480 98a09f68 
00001000 802d9a8c 00000001
[   23.516366] 9ea0: 00000000 00000000 98a09f34 98a09eb8 8025d1a4 
802d9a98 00000cd5 00000000
[   23.524548] 9ec0: 9e7d6480 80b03208 9e7d6480 00000000 7e8ae510 
9e7d6480 98a09f94 98a09ee8
[   23.532725] 9ee0: 802643d0 80263ee8 000007ff 000081a4 00000001 
00001000 00000000 00000000
[   23.540900] 9f00: 00000000 00000000 00000cd5 80b03208 00001000 
9e7d6480 00aec920 98a09f68
[   23.549083] 9f20: 00000001 00000000 98a09f64 98a09f38 8025d3cc 
8025d164 00000012 8027fb90
[   23.557262] 9f40: 9e7d6480 9e7d6480 00000000 00000000 801011e4 
98a08000 98a09f94 98a09f68
[   23.565435] 9f60: 8025d7d8 8025d338 00000000 00000000 76fda4d0 
80b03208 76fda4d0 00001001
[   23.573616] 9f80: 00aec920 00000003 98a09fa4 98a09f98 8025d878 
8025d774 00000000 98a09fa8
[   23.581796] 9fa0: 80101000 8025d86c 76fda4d0 00001001 00000006 
00aec920 00001000 00000000
[   23.589969] 9fc0: 76fda4d0 00001001 00aec920 00000003 00001001 
00aec920 00ae7d58 00000000
[   23.598141] 9fe0: 00aedab0 7e8ae578 76e46bfc 76e931dc 60000010 
00000006 00000000 00000000
[   23.606302] Backtrace:
[   23.608774] [<8060198c>] (of_find_property) from [<80601b60>] 
(of_get_property+0x18/0x48)
[   23.616958]  r7:9e7e7000 r6:80b09680 r5:80b09680 r4:80b09680
[   23.622630] [<80601b48>] (of_get_property) from [<80604e28>] 
(of_device_uevent+0x58/0x174)
[   23.630904] [<80604dd0>] (of_device_uevent) from [<8050f46c>] 
(dev_uevent+0x88/0x2ec)
[   23.638737]  r9:96ce5b60 r8:80b09680 r7:9e6f8000 r6:9e7e7000 
r5:80b09680 r4:80b09680
[   23.646500] [<8050f3e4>] (dev_uevent) from [<8050d5a4>] 
(uevent_show+0xa8/0x124)
[   23.653891]  r6:9e7e7000 r5:80b09680 r4:9d087f40
[   23.658522] [<8050d4fc>] (uevent_show) from [<8050d068>] 
(dev_attr_show+0x28/0x58)
[   23.666091]  r9:96ce5b60 r8:80b09680 r7:9e6f8000 r6:808596d0 
r5:80b41dec r4:96c19a00
[   23.673842] [<8050d040>] (dev_attr_show) from [<802da700>] 
(sysfs_kf_seq_show+0x8c/0x104)
[   23.682011]  r5:00001000 r4:96c19a00
[   23.685608] [<802da674>] (sysfs_kf_seq_show) from [<802d8dd8>] 
(kernfs_seq_show+0x34/0x38)
[   23.693876]  r9:96c19a18 r8:98a09f68 r7:98a09f68 r6:00000000 
r5:9e7d6480 r4:96c19a00
[   23.701638] [<802d8da4>] (kernfs_seq_show) from [<80286c5c>] 
(seq_read+0x168/0x5bc)
[   23.709309] [<80286af4>] (seq_read) from [<802d9ac8>] 
(kernfs_fop_read+0x3c/0x1cc)
[   23.716884]  r10:00000000 r9:00000000 r8:00000001 r7:98a09f68 
r6:00aec920 r5:96ce5b60
[   23.724699]  r4:9e7d6480
[   23.727254] [<802d9a8c>] (kernfs_fop_read) from [<8025d1a4>] 
(__vfs_read+0x4c/0x1d4)
[   23.734997]  r10:00000000 r9:00000000 r8:00000001 r7:802d9a8c 
r6:00001000 r5:98a09f68
[   23.742812]  r4:9e7d6480
[   23.745357] [<8025d158>] (__vfs_read) from [<8025d3cc>] 
(vfs_read+0xa0/0x120)
[   23.752496]  r9:00000000 r8:00000001 r7:98a09f68 r6:00aec920 
r5:9e7d6480 r4:00001000
[   23.760236] [<8025d32c>] (vfs_read) from [<8025d7d8>] 
(ksys_read+0x70/0xf8)
[   23.767204]  r9:98a08000 r8:801011e4 r7:00000000 r6:00000000 
r5:9e7d6480 r4:9e7d6480
[   23.774952] [<8025d768>] (ksys_read) from [<8025d878>] 
(sys_read+0x18/0x1c)
[   23.781914]  r7:00000003 r6:00aec920 r5:00001001 r4:76fda4d0
[   23.787582] [<8025d860>] (sys_read) from [<80101000>] 
(ret_fast_syscall+0x0/0x54)
[   23.795060] Exception stack(0x98a09fa8 to 0x98a09ff0)
[   23.800122] 9fa0:                   76fda4d0 00001001 00000006 
00aec920 00001000 00000000
[   23.808306] 9fc0: 76fda4d0 00001001 00aec920 00000003 00001001 
00aec920 00ae7d58 00000000
[   23.816479] 9fe0: 00aedab0 7e8ae578 76e46bfc 76e931dc
[   23.821536] Code: ea00000a e594400c e3540000 0a000007 (e5940000)
[   23.827642] ---[ end trace 014292db9093a159 ]---
[   23.854292] Kernel panic - not syncing: Fatal exception
[   23.881442] ---[ end Kernel panic - not syncing: Fatal exception ]---

>> Moreover, the issue is observed even when the video
>> engine is not actively used because udevd turns on the video engine
>> hardware for a short time to make a query in every boot.
>>
>> To fix this issue, this commit changes the clock handling logic to make
>> the reset de-assertion triggered after enabling both eclk and vclk. Also,
>> it adds clk_unprepare call for a case when probe fails.
>>
>> Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> The code change looks correct and should be applied to stable.
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Thanks for your review!

Best,
Jae

>> ---
>>   drivers/media/platform/aspeed-video.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/aspeed-video.c b/drivers/media/platform/aspeed-video.c
>> index c46a79eace98..db072ff2df70 100644
>> --- a/drivers/media/platform/aspeed-video.c
>> +++ b/drivers/media/platform/aspeed-video.c
>> @@ -514,8 +514,8 @@ static void aspeed_video_off(struct aspeed_video *video)
>>          aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
>>
>>          /* Turn off the relevant clocks */
>> -       clk_disable(video->vclk);
>>          clk_disable(video->eclk);
>> +       clk_disable(video->vclk);
>>
>>          clear_bit(VIDEO_CLOCKS_ON, &video->flags);
>>   }
>> @@ -526,8 +526,8 @@ static void aspeed_video_on(struct aspeed_video *video)
>>                  return;
>>
>>          /* Turn on the relevant clocks */
>> -       clk_enable(video->eclk);
>>          clk_enable(video->vclk);
>> +       clk_enable(video->eclk);
>>
>>          set_bit(VIDEO_CLOCKS_ON, &video->flags);
>>   }
>> @@ -1719,8 +1719,11 @@ static int aspeed_video_probe(struct platform_device *pdev)
>>                  return rc;
>>
>>          rc = aspeed_video_setup_video(video);
>> -       if (rc)
>> +       if (rc) {
>> +               clk_unprepare(video->vclk);
>> +               clk_unprepare(video->eclk);
>>                  return rc;
>> +       }
>>
>>          return 0;
>>   }
>> --
>> 2.17.1
>>
