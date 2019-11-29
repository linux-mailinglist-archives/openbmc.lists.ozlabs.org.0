Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C4C10D446
	for <lists+openbmc@lfdr.de>; Fri, 29 Nov 2019 11:37:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47PWD64F9LzDr5J
	for <lists+openbmc@lfdr.de>; Fri, 29 Nov 2019 21:37:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ipv4:195.201.40.130) smtp.mailfrom=nod.at (client-ip=195.201.40.130;
 helo=lithops.sigma-star.at; envelope-from=richard@nod.at; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nod.at
X-Greylist: delayed 468 seconds by postgrey-1.36 at bilbo;
 Fri, 29 Nov 2019 21:36:43 AEDT
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47PWCH3r7zzDqKl
 for <openbmc@lists.ozlabs.org>; Fri, 29 Nov 2019 21:36:43 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8BE0E605AD4C;
 Fri, 29 Nov 2019 11:28:48 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id MzjCSbs_Kowu; Fri, 29 Nov 2019 11:28:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A1ADE62EBCA9;
 Fri, 29 Nov 2019 11:28:46 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PpKVc_9Wkzol; Fri, 29 Nov 2019 11:28:46 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 77A026083139;
 Fri, 29 Nov 2019 11:28:46 +0100 (CET)
Date: Fri, 29 Nov 2019 11:28:46 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Joel Stanley <joel@jms.id.au>
Message-ID: <1768300347.101090.1575023326346.JavaMail.zimbra@nod.at>
In-Reply-To: <20191129001930.651128-1-joel@jms.id.au>
References: <20191129001930.651128-1-joel@jms.id.au>
Subject: Re: [PATCH] Revert "jffs2: Fix possible null-pointer dereferences
 in jffs2_add_frag_to_fragtree()"
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: Revert "jffs2: Fix possible null-pointer dereferences in
 jffs2_add_frag_to_fragtree()"
Thread-Index: YU57vPD+ANar5XiWuA9wwI2ZV1KT3A==
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Hou Tao <houtao1@huawei.com>,
 David Woodhouse <dwmw2@infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

----- Urspr=C3=BCngliche Mail -----
> Von: "Joel Stanley" <joel@jms.id.au>
> An: "David Woodhouse" <dwmw2@infradead.org>, "richard" <richard@nod.at>, =
"Jia-Ju Bai" <baijiaju1990@gmail.com>, "Al
> Viro" <viro@zeniv.linux.org.uk>, "OpenBMC Maillist" <openbmc@lists.ozlabs=
.org>, "linux-mtd"
> <linux-mtd@lists.infradead.org>, "linux-kernel" <linux-kernel@vger.kernel=
.org>
> CC: "stable" <stable@vger.kernel.org>, "Hou Tao" <houtao1@huawei.com>
> Gesendet: Freitag, 29. November 2019 01:19:30
> Betreff: [PATCH] Revert "jffs2: Fix possible null-pointer dereferences in=
 jffs2_add_frag_to_fragtree()"

> This reverts commit f2538f999345405f7d2e1194c0c8efa4e11f7b3a. The patch
> stopped JFFS2 from being able to mount an existing filesystem with the
> following errors:
>=20
> jffs2: error: (77) jffs2_build_inode_fragtree: Add node to tree failed -2=
2
> jffs2: error: (77) jffs2_do_read_inode_internal: Failed to build final fr=
agtree
> for inode #5377: error -22
>=20
> Fixes: f2538f999345 ("jffs2: Fix possible null-pointer dereferences...")
> Cc: stable@vger.kernel.org
> Suggested-by: Hou Tao <houtao1@huawei.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> 5.4 cannot mount (some?) jffs2 filesystems without this fix. Hou pointed
> this out[1] a while back but the fix didn't make it in. It's still
> broken in -next.

queued into -next.

Thanks,
//richard
