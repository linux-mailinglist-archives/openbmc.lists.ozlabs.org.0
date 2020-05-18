Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A0B1D6E5E
	for <lists+openbmc@lfdr.de>; Mon, 18 May 2020 02:59:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QLHx5xCJzDqXM
	for <lists+openbmc@lfdr.de>; Mon, 18 May 2020 10:59:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=npbZIEIi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=VPIT065S; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QLHB4nsgzDqNX
 for <openbmc@lists.ozlabs.org>; Mon, 18 May 2020 10:58:29 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8C5C45C003D;
 Sun, 17 May 2020 20:58:27 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 17 May 2020 20:58:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=AcpLNW5Tmwxu7AO1exfekkeV459n26T
 sTh0BMU7XHb8=; b=npbZIEIibqx/8Z5eqpBCmYkXPm4w9+/kzPE2WpF2U/gyy9O
 0W6twdDbSi9eoW9vk2E5IdQgpFG3VuKcZXwbBIH7MnP7rlCQiyM5DaYVzEZoxGm1
 jlLYTorlC7ZIeGgYW+PjfiXBtqjleGohRq989PbEtwNQD4Xf+mMRmg5abUq5SG+t
 meyfDwWXWPIbLkcKU/Ovi4Ryt12nilUm6bHhHoFfABpGW+T4/t1EZP06U1hC+a8k
 BihBqDn4BuexnNR9SnEyYfG4yN95/bITEqX3wrEItK7YYvB1qUWrBA5gCqVW3Zvq
 nxmyAT4eLX1irqIZxM+yjhaTCaleJgKOlc74B/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=AcpLNW
 5Tmwxu7AO1exfekkeV459n26TsTh0BMU7XHb8=; b=VPIT065SToVXl8IeeV66NH
 QtkXG6GuDbS+aP+6uJd95rO1m11INKk2ZtNdrjN0qzZubip4A7y1MXOE5WBSQQR+
 BXFIGzIwognudtUXxOWwcJX/cn4SHEYqbHfcmB7Go/V7c4FI4oLbx90RgM7cgDJg
 9OljyIpoRYosr7QvUskEErLfMje1KSdCFlS+9WYE9duYNpE5ujcqpPb7jnY/OqOg
 92DT5ts/u1Gx7dY+4Vu53vGoafL90F+qalt0dDS42kXChRL/rPECHEO6CF7uETrp
 jM4qBjtMhj2TtJRPL6uy8VXNj3lUK7eShxC/M51MxmZjj/hmQeqtmhGf3bFp+JZg
 ==
X-ME-Sender: <xms:s93BXrQm5UrL3k1fxGNrtqNtWkV1z4eEoXEmK-T-R3vSKTfrq2cAqw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddtgedgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepiedtffefuddvgefgleduledtudduudeufffghfetiedtteegvdelveeu
 leevfedtnecuffhomhgrihhnpehrvgguhhgrthdrtghomhdpkhgvrhhnvghlrdhorhhgne
 cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughr
 vgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:s93BXsxOPdJWhCJ3JjYLpotQDNnhpD108x2rX1SxpmDiotKAR0BgJw>
 <xmx:s93BXg0tVhyLNMS0XGWyWhWck4NHMBamVMeysnnsQMdw5gmF4zT_4A>
 <xmx:s93BXrBICpCkr-eZ09HZJ-3uHMiDDMJtf606yHKDGhxcKDu7OfKPYQ>
 <xmx:s93BXvsz6Opvrkik5N4VzqaOLEBKAdml9vsPwYtr3oCJt-sR1IOh7A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EB6B5E00B3; Sun, 17 May 2020 20:58:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <c4a65a6a-5b8b-49ac-9c2b-96f116460515@www.fastmail.com>
In-Reply-To: <6922803d-99c9-4d23-85d8-32eeecad0c34@www.fastmail.com>
References: <20200514132703.448317-1-andrew@aj.id.au>
 <20200514132703.448317-5-andrew@aj.id.au> <20200514135401.GD1166713@heinlein>
 <6922803d-99c9-4d23-85d8-32eeecad0c34@www.fastmail.com>
Date: Mon, 18 May 2020 10:28:06 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>
Subject: =?UTF-8?Q?Re:_[RFC_PATCH_linux_dev-5.4_4/4]_ARM:_configs:_aspeed-g5:_Set?=
 =?UTF-8?Q?_CONFIG=5FFORTIFY=5FSOURCE=3Dn_to_appease_kprobes?=
Content-Type: text/plain
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 15 May 2020, at 07:40, Andrew Jeffery wrote:
> 
> 
> On Thu, 14 May 2020, at 23:24, Patrick Williams wrote:
> > On Thu, May 14, 2020 at 10:57:03PM +0930, Andrew Jeffery wrote:
> > > Setting CONFIG_FORTIFY_SOURCE=y and CONFIG_KPROBES=y on arm gives a panic when
> > > trying to insert a new probe:
> > > 
> > > $ echo r:myretprobe do_sys_open '$retval' >> /sys/kernel/debug/tracing/kprobe_events
> > > [   51.688589] detected buffer overflow in memcpy
> > > [   51.689430] ------------[ cut here ]------------
> > > [   51.689627] kernel BUG at lib/string.c:1096!
> > > [   51.689800] Internal error: Oops - BUG: 0 [#1] SMP ARM
> > > [   51.690107] Modules linked in:
> > > [   51.690442] CPU: 0 PID: 107 Comm: sh Not tainted 5.4.39-00272-ga1ee7c973659 #6
> > > [   51.690674] Hardware name: Generic DT based system
> > > [   51.691184] PC is at fortify_panic+0x18/0x20
> > > [   51.691371] LR is at __irq_work_queue_local+0x40/0x7c
> > > [   51.691575] pc : [<8083eaa4>]    lr : [<8020e0ec>]    psr: 60000013
> > > [   51.691812] sp : bd237cb0  ip : bd237bc0  fp : bd237cbc
> > > [   51.692129] r10: 00000007  r9 : 00000000  r8 : 00000060
> > > [   51.692395] r7 : 8011f2f0  r6 : b5092480  r5 : 7f000000  r4 : b4c53b4c
> > > [   51.692723] r3 : 80c04c48  r2 : 00000000  r1 : bd7c5448  r0 : 00000022
> > > [   51.693088] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> > > [   51.693449] Control: 10c5387d  Table: b50f406a  DAC: 00000051
> > > [   51.693769] Process sh (pid: 107, stack limit = 0x4e9b7225)
> > > [   51.694126] Stack: (0xbd237cb0 to 0xbd238000)
> > > 
> > > YOLO it and disable fortified source.
> > > 
> > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > > ---
> > >  arch/arm/configs/aspeed_g5_defconfig | 1 -
> > >  1 file changed, 1 deletion(-)
> > 
> > Doesn't this mean we're just hiding a bug with KPROBE code
> 
> Possibly.
> 
> > and
> > potentially hiding more bugs with other drivers?
> 
> Yes.
> 
> You should view this series as "things I did to get kprobes 'working'" and not
> "patches we should apply to the kernel tree". This one in particular was a
> low-key troll patch to flush out any information on why
> CONFIG_FORTIFY_SOURCE=y breaks kprobes in particular.

In [1] Kees Cook suggests it's a false-positive and provides a potential fix. This
was submitted at [2]. [3] then fixes the fix. Turns out the issue needs fixing
again due to compiler advances, so I sent [4] but it looks like we might instead
resolve it by [5].

[1] https://bugzilla.redhat.com/show_bug.cgi?id=1639397
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e46daee53bb5
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0ac569bf6a798
[4] https://lore.kernel.org/linux-arm-kernel/20200517153959.293224-1-andrew@aj.id.au/
[5] https://lore.kernel.org/linux-arm-kernel/202005171447.00CFE0C@keescook/

Andrew
