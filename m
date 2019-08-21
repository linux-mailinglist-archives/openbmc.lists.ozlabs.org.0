Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C53DA96E09
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 02:06:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cnyk3m29zDqS0
	for <lists+openbmc@lfdr.de>; Wed, 21 Aug 2019 10:06:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BV2Zjqaz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="E2vJWveI"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cnxv14pFzDrJj
 for <openbmc@lists.ozlabs.org>; Wed, 21 Aug 2019 10:06:10 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 65DA221CFD;
 Tue, 20 Aug 2019 20:06:06 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 20 Aug 2019 20:06:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=5mqUd
 3UTUyLjiNJX8VHRJxVIoB4Vr2/0jJ2natoQq8c=; b=BV2Zjqaze2+9h9pwjj8+p
 zOfM0+PV89jaZfwpqrUZ2C27y6TJkuW4DZpJRfcxpC+1148uF1KevKYiF9UPa4Nw
 gST1AVZrfa9CHEfUNXFPsRr1FAlrtX0cbQC26Q5/N/7o7PPLUAAsPPwhcI2fEzSu
 OMWGlUZugoN9j/AUUuoWaIA31nd2p19bqrHrmRTaAOTKKHAdEpnrucyQW/4AsMbr
 jYZshL/JoPNUZjYhdqRQNNwXmtcWBIX51kVK6qX/hP40tfmc0DcgRvUbQQu4co7r
 Zui6qEe/rxpF3ZqJQLt6fGooMQrQgT+83b94u52M7UEF5vghQLrWOySTM7lYTKx+
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=5mqUd3UTUyLjiNJX8VHRJxVIoB4Vr2/0jJ2natoQq
 8c=; b=E2vJWveIi7CPxKOEdHXqJc8N6C6yFaxALyXCJXMhFwti/LY1AlvMLyLii
 rV/Qa8l/S2jBSP+BGOO4CHAglHVH7LmxVFy0/k7tfY8lcJqnvvNhVkv2VZmMMTsz
 hOfTxGVTJUres+dDTazZ48+tLQmyVTM47cThW1WmvRO4fKQ/1rh+VWiE0I1UImkC
 pL5FYtFa5ZEJywN2Vh3zCwGHpcCyjlVn+Nc/BIWURgZ9DGxWZ7zjAxnETdWcwUqe
 GW1DaKjG8ObcE84LT2sYypTHtGSeX3Vw0opMJdO4r9gG5JAoUlq7/OAIdu/Ou1uN
 bcNKhkc6RY5uDczwQ7lh1GxQulW9Q==
X-ME-Sender: <xms:7opcXU24O7w7t5roz3toZrHEv7CKdcp2bi9FBLR-8Kgbz6qYRg4JOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudegvddgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucffoh
 hmrghinheplhifnhdrnhgvthenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgif
 segrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:7opcXZyb4E4rR9DjF8jbHyvxZ-Q2ORyiuJe17isB01atgIEc_itXdw>
 <xmx:7opcXQ7sCr98OgZo8LwpzUzzS8eGB0qYzc-YZoew1Bndlo2qjEab8g>
 <xmx:7opcXehhPyVGirY4CTIFf7hofBkkpQNC199jeoRCgTuGdrNn6MXtTg>
 <xmx:7opcXYMVOrYv_5Bb7Ru5L-av_zIXb4aOZrtPOu1ea6nDdy9NeTbqug>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EC517E00A3; Tue, 20 Aug 2019 20:06:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-878-g972612b-fmstable-20190820v1
Mime-Version: 1.0
Message-Id: <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
In-Reply-To: <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
References: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
 <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
Date: Wed, 21 Aug 2019 09:36:41 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <taoren@fb.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: kernel BUG at fs/jffs2/gc.c:395!
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On Wed, 21 Aug 2019, at 08:42, Tao Ren wrote:
> On 8/20/19 4:09 PM, Tao Ren wrote:
> > Hi,
> >=20
> > I hit following jffs2 bug while running Linux 5.0.3 on CMM (ASPEED25=
00) BMC platform. Has anyone seen the issue before? Any suggestions?=20
> >=20
> > [   46.024017] ------------[ cut here ]------------
> > [   46.079178] kernel BUG at /data/users/taoren/openbmc/build-cmm/tm=
p/work-shared/cmm/kernel-source/fs/jffs2/gc.c:395!
> > [   46.204076] Internal error: Oops - BUG: 0 [#1] ARM
> > [   46.261378] Modules linked in: ext4 mbcache jbd2 crypto_hash
> > [   46.329093] CPU: 0 PID: 1181 Comm: jffs2_gcd_mtd3 Not tainted 5.0=
.3-cmm #1
> > [   46.411343] Hardware name: Generic DT based system
> > [   46.468685] PC is at jffs2_garbage_collect_pass+0x6f4/0x734
> > [   46.535322] LR is at jffs2_garbage_collect_pass+0x6f4/0x734
> > [   46.601977] pc : [<802c292c>]    lr : [<802c292c>]    psr: 600000=
13
> > [   46.676959] sp : af3cded0  ip : b56a75c0  fp : af3cdf24
> > [   46.739463] r10: b4061140  r9 : b57a3900  r8 : b555d4ac
> > [   46.801968] r7 : b555d4ac  r6 : b403502c  r5 : 00000000  r4 : b40=
35000
> > [   46.880073] r3 : b56a75c0  r2 : 00000000  r1 : 00000000  r0 : b40=
3502c
> > [   46.958177] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  =
Segment none
> > [   47.043561] Control: 00c5387d  Table: b5774008  DAC: 00000051
> > [   47.112319] Process jffs2_gcd_mtd3 (pid: 1181, stack limit =3D 0x=
54372ffe)
> > [   47.192490] Stack: (0xaf3cded0 to 0xaf3ce000)
> > [   47.244601] dec0:                                     00000000 80=
a07028 800ad6c9 0000ff2c
> > [   47.342468] dee0: af3cdefc af3cdef0 80125cd4 8012313c af3cdf24 80=
0ad6c9 8012614c b4035000=20
> > [   47.440331] df00: ffffe000 af3cc000 af3cc000 b4035000 802c509c b4=
19dd18 af3cdf74 af3cdf28
> > [   47.538196] df20: 802c5174 802c2244 ffffe000 00000001 00000000 ff=
ffe000 b57b0940 00000000
> > [   47.636058] df40: ffffe000 b4035000 802c509c b419dd18 af3cdf74 80=
0ad6c9 b5753980 b5753980
> > [   47.733923] df60: b57b0940 00000000 af3cdfac af3cdf78 80134d58 80=
2c50a8 b5753998 b5753998
> > [   47.831787] df80: af3cdfac b57b0940 80134c0c 00000000 00000000 00=
000000 00000000 00000000
> > [   47.929648] dfa0: 00000000 af3cdfb0 801010e8 80134c18 00000000 00=
000000 00000000 00000000
> > [   48.027512] dfc0: 00000000 00000000 00000000 00000000 00000000 00=
000000 00000000 00000000
> > [   48.125376] dfe0: 00000000 00000000 00000000 00000000 00000013 00=
000000 00000000 00000000
> > [   48.223230] Backtrace: =20
> > [   48.252489] [<802c2238>] (jffs2_garbage_collect_pass) from [<802c=
5174>] (jffs2_garbage_collect_thread+0xd8/0x1ac)
> > [   48.375294]  r10:b419dd18 r9:802c509c r8:b4035000 r7:af3cc000 r6:=
af3cc000 r5:ffffe000
> > [   48.468985]  r4:b4035000
> > [   48.499281] [<802c509c>] (jffs2_garbage_collect_thread) from [<80=
134d58>] (kthread+0x14c/0x164)
> > [   48.603358]  r6:00000000 r5:b57b0940 r4:b5753980
> > [   48.658590] [<80134c0c>] (kthread) from [<801010e8>] (ret_from_fo=
rk+0x14/0x2c)
> > [   48.745001] Exception stack(0xaf3cdfb0 to 0xaf3cdff8)
> > [   48.805428] dfa0:                                     00000000 00=
000000 00000000 00000000
> > [   48.903296] dfc0: 00000000 00000000 00000000 00000000 00000000 00=
000000 00000000 00000000
> > [   49.001157] dfe0: 00000000 00000000 00000000 00000000 00000013 00=
000000
> > [   49.080305]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:=
00000000 r5:80134c0c
> > [   49.174000]  r4:b57b0940
> > [   49.204275] Code: e59f0044 ebfa25cb e1a00006 eb0e888d (e7f001f2)
> > [   49.277188] ---[ end trace 6baa7af0a90d15ab ]---
> > [   49.332395] Kernel panic - not syncing: Fatal exception
>=20
> BTW, below are all the messages printed by jffs2 before system crash:
>=20
> [   21.078433] jffs2: version 2.2. (SUMMARY)  =C2=A9 2001-2006 Red Hat=
, Inc.
> [   39.776207] jffs2: notice: (1180) jffs2_build_xattr_subsystem:=20
> complete building xattr subsystem, 0 of xdatum (0 unchecked, 0 orphan)=
=20
> and 0 of xref (0 dead, 0 orphan) found.
> [   40.016574] jffs2: warning: (1181) jffs2_do_read_inode_internal: no=
=20
> data nodes found for ino #140
> [   40.122964] jffs2: notice: (1181) jffs2_do_read_inode_internal: but=
=20
> it has children so we fake some modes for it
> [   43.579361] jffs2: warning: (1181) jffs2_get_inode_nodes: Eep. No=20=

> valid nodes for ino #141.
> [   43.679404] jffs2: warning: (1181) jffs2_do_read_inode_internal: no=
=20
> data nodes found for ino #141
> [   43.785661] jffs2: Returned error for crccheck of ino #141. Expect=20=

> badness...
> [   44.021825] jffs2: warning: (1181) jffs2_do_read_inode_internal: no=
=20
> data nodes found for ino #154
> [   44.128191] jffs2: notice: (1181) jffs2_do_read_inode_internal: but=
=20
> it has children so we fake some modes for it
> [   44.314862] jffs2: warning: (1181) jffs2_do_read_inode_internal: no=
=20
> data nodes found for ino #155
> [   44.421152] jffs2: notice: (1181) jffs2_do_read_inode_internal: but=
=20
> it has children so we fake some modes for it
> [   44.607378] jffs2: warning: (1181) jffs2_do_read_inode_internal: no=
=20
> data nodes found for ino #163
> [   44.713692] jffs2: notice: (1181) jffs2_do_read_inode_internal: but=
=20
> it has children so we fake some modes for it
> [   44.899991] jffs2: warning: (1181) jffs2_get_inode_nodes: Eep. No=20=

> valid nodes for ino #164.
> [   45.000107] jffs2: warning: (1181) jffs2_do_read_inode_internal: no=
=20
> data nodes found for ino #164
> [   45.106370] jffs2: Returned error for crccheck of ino #164. Expect=20=

> badness...
> [   45.934282] jffs2: Inode #106 already in state 0 in=20
> jffs2_garbage_collect_pass()!

Looks like a lack of robustness to filesystem corruption to me. LWN
published an article on the topic just yesterday!

https://lwn.net/Articles/796687/

Andrew
