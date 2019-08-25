Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 500CFA4CF1
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 02:56:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MBTw18bxzDqTZ
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 10:56:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (mailfrom) smtp.mailfrom=nod.at
 (client-ip=195.201.40.130; helo=lithops.sigma-star.at;
 envelope-from=richard@nod.at; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nod.at
X-Greylist: delayed 434 seconds by postgrey-1.36 at bilbo;
 Mon, 26 Aug 2019 08:36:50 AEST
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GqkV355MzDqf2
 for <openbmc@lists.ozlabs.org>; Mon, 26 Aug 2019 08:36:50 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id B8AC5608311C;
 Mon, 26 Aug 2019 00:29:29 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id hOULfU3-LlB7; Mon, 26 Aug 2019 00:29:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id DE8B96083139;
 Mon, 26 Aug 2019 00:29:28 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id E11y-rZCtny6; Mon, 26 Aug 2019 00:29:28 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id B6833608311C;
 Mon, 26 Aug 2019 00:29:28 +0200 (CEST)
Date: Mon, 26 Aug 2019 00:29:28 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Tao Ren <taoren@fb.com>
Message-ID: <216516045.73889.1566772168645.JavaMail.zimbra@nod.at>
In-Reply-To: <4dee9f54-1cf4-94ca-4ddc-2b1f8892d9b1@fb.com>
References: <e8bde724-46fd-4264-ea3f-a84a792bcad8@fb.com>
 <236e95be-a2cd-3b44-36c5-121678f7c009@fb.com>
 <afe2b8f2-d1be-4cd2-971a-b13c1e38da67@www.fastmail.com>
 <CAFLxGvypuPp_Q_31DpKmfqte4uxHfYiQ6KvT1f2LGo_y7EvKfw@mail.gmail.com>
 <4dee9f54-1cf4-94ca-4ddc-2b1f8892d9b1@fb.com>
Subject: Re: kernel BUG at fs/jffs2/gc.c:395!
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: kernel BUG at fs/jffs2/gc.c:395!
Thread-Index: AQHVV6xCTU2NhpXAkkGUQ2XhN58pgKcEqeqAgAAPW4CAB4xhAIAALiMA4gvjD7k=
X-Mailman-Approved-At: Mon, 02 Sep 2019 10:34:52 +1000
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-mtd <linux-mtd@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

----- Urspr=C3=BCngliche Mail -----
> Von: "Tao Ren" <taoren@fb.com>
> An: "Richard Weinberger" <richard.weinberger@gmail.com>, "Andrew Jeffery"=
 <andrew@aj.id.au>
> CC: "linux-mtd" <linux-mtd@lists.infradead.org>, "OpenBMC Maillist" <open=
bmc@lists.ozlabs.org>
> Gesendet: Montag, 26. August 2019 00:08:08
> Betreff: Re: kernel BUG at fs/jffs2/gc.c:395!

> On 8/25/19 12:22 PM, Richard Weinberger wrote:
>> On Wed, Aug 21, 2019 at 2:06 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>>> Looks like a lack of robustness to filesystem corruption to me. LWN
>>=20
>> What exactly makes you think so?
>> The inode cache entry is in state INO_STATE_UNCHECKED while GC run,
>> which is not allowed.
>>=20
>> Tao, is the error persistent or did it happen only once?
>=20
> Hi Richard,
>=20
> It rarely happens (~1 out of 1000 machines in my environment), but once i=
t
> happens, it's persistent: the machine will fall into reboot loop due to t=
he
> crash.

Can you provide me an image of the filesystem such that I can have a look?
An image where the issue is persistent...

Thanks,
//richard
