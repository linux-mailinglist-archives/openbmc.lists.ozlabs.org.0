Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD988379AFD
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 02:00:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfJ2v61DPz2ysk
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 10:00:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=nLcXdexs;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZVZX69z3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=nLcXdexs; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ZVZX69z3; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfJ2F6SzKz2y8C
 for <openbmc@lists.ozlabs.org>; Tue, 11 May 2021 09:59:48 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7F3B05C0109;
 Mon, 10 May 2021 19:59:45 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 10 May 2021 19:59:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=W0wZt
 8TAJdey7dIC6prrGr/RBI7wk0B7ZO88pIjhqGA=; b=nLcXdexsE6tZ8vCYKcD1N
 IEZlGQaKnf8ujMbHOEf3tewp3HrPHUvbk0nlKfrNei69973WIyWsTsIvLE84f+4N
 YrevW2Vp8MB3WMbug8ALwykMU7TigWYv49P+a9WaT5j3gqEoOkMDr2dCkISGFil5
 7Adkyx3iIxPa4DoIRwdqA5dBlA9l3d3wZBe+91V3FJdGZbBJ50RWEo7EMiKXzfCP
 S3s1l7W+D1FYIRxCuy4dvJ0tqVMH4hpk4QBGFIz/ekNv4MG/eFiYPaKBMWbvN9sg
 HHJDbbPS/rW8Esdl81LBVGxOwOQ9g9KdrbVzS353W1u3CYU9YgCyumeuWSI4sSsr
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=W0wZt8TAJdey7dIC6prrGr/RBI7wk0B7ZO88pIjhq
 GA=; b=ZVZX69z3a3u/sy51QMdeYBvRhSKl5vkycr0YHs+gMs4H20pk1jkxdi9oa
 a8k7UpuD0N0OZVzril4GOBeXE4bFO1gO0BDJqW8wMy24ZOuFKNwC0isUF6xM41y5
 xYa6vOpayXqgcxAS9wXLNLUDp37KFNVDL31AKc0HD/p90ZM7PWGfB6dweYQsu3aL
 R/PCeQI4AJgGDh40Znsdq9l9332srd3ApcI/5UVVQGDJN+EswL9XEG28pnl37K1f
 Yonq5DUUxQ7GW9y1fW3+/fKx80nj6/Uk0vKvjWTEtwzXY/2C4V/22Exb6XLPHpq8
 VHWUZGNka3Sbpyv0QZhnTeeTIsvmw==
X-ME-Sender: <xms:8MiZYAumu5ZLBDgmKElwYf-u-vNjPzO9Rp7oe1NEMY71ciX__cEeaQ>
 <xme:8MiZYNewLakLXQ9O7j5czpFMKh3cce9W3f51XJ_F4ihqDIv2ZqG0VGx74ig0aElQZ
 fD35GxoO55YfPHpNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegledgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeeuieefvdeigedvjefgteelteeijeeludehffdvveejjeegueegkeei
 ffeifeelveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhtlhguphdrohhrghenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgv
 fiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:8MiZYLzN6YQtDtATi89hizvKw7a8S27m1KqYVazAEJt9xIHyTtfUcA>
 <xmx:8MiZYDPtlpxWBk8MeA9cEnGXQwgMXFeySBWNNf5VJuAnCTFbhv1RFg>
 <xmx:8MiZYA-VpmZFvr80m6Mazdq6-6uYYnGdv8O7dLcTyUQvBAkUCHfZ5g>
 <xmx:8ciZYJKHkLfJ-dPqVDx3Ky79tkyTvbXp-W2D7JCPaNW4_fTqMEP17w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D5B04A0007A; Mon, 10 May 2021 19:59:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <61f9d748-b4e1-4b64-aaf5-1930cda0206d@www.fastmail.com>
In-Reply-To: <CAPnigKku-EjOnV9gsmnXzH=XZxSU78iLeccNbsK8k2_4b4UwSg@mail.gmail.com>
References: <20210510064955.1704652-1-andrew@aj.id.au>
 <20210510064955.1704652-11-andrew@aj.id.au>
 <CAPnigKku-EjOnV9gsmnXzH=XZxSU78iLeccNbsK8k2_4b4UwSg@mail.gmail.com>
Date: Tue, 11 May 2021 09:29:24 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "William Kennington" <wak@google.com>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.10_v3_10/18]_ipmi:_kcs=5Fbmc:_Don't_enf?=
 =?UTF-8?Q?orce_single-open_policy_in_the_kernel?=
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
Cc: OpenBMC Development <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 10 May 2021, at 18:26, William Kennington wrote:
> Why would we want to change this? I personally think the original
> mutual exclusion policy makes even more sense with multiple client
> types, so that the upstack programs actually know when they are being
> locked out. Having clients that are able to open the fd but remain
> broken if they don't do higher level synchronization just feels like a=

> good way to have hard to understand behavior.

So there's this from Arnd:

https://lore.kernel.org/lkml/CAK8P3a2e3zNqMJSN-LAAjYmy8Gr=3Dwjn5MMDMinxa=
wOWcMgo7Ww@mail.gmail.com/

> On Wed, Mar 3, 2021 at 2:54 PM Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
> >
> > +       /* the rpmb is single open! */
> > +       if (test_and_set_bit(RPMB_DEV_OPEN, &rdev->status))
> > +               return -EBUSY;
>=20
> open counters on device nodes are fundamentally broken, because
> they do not stop you from using dup() or sharing the file descriptor
> across a fork. Just remove this.

Assuming Arnd's point didn't stand on its own, trying to prevent=20
multiple opens requires two classes of checks in the kernel, where:

1. Multiple file descriptors can be associated with each device node
2. Multiple device nodes can be associated with each device.

Ensuring we don't have multiple-opens via multiple device nodes (2=20
above) can be done generally in kcs_bmc.c by associating the device=20
node (client) context with the device driver instance and erroring out=20=

if an association already exists. But addressing 1. requires each=20
client (chardev) implementation to enforce the 1-fd-per-node=20
requirement as well, which isn't great.

If you squint, the IPMI KCS devices look like a simple UART and so we=20=

can look to the TTY layer for inspiration. TTYs suffer the same issue=20=

of hard to understand behaviour in the face of multiple opens, and=20
define a single mechanism for avoiding both 1 and 2 above by way of=20
userspace lock files:

https://tldp.org/HOWTO/Serial-HOWTO-13.html

The lock should be defined in terms of the underlying device as we can=20=

have multiple behaviours exposed through multiple chardevs for each=20
device. The device can be derived by e.g:

```
# echo $(basename $(realpath /sys$(udevadm info --query=3Dpath /dev/raw-=
kcs4)/device))
1e789114.kcs
```

Given that the kernel currently attempts to prevent multiple open we=20
can assume this is something userspace isn't doing, thus it's safe to=20=

lift the restriction.

If we do have userspace competing for access then it needs to implement=20=

the locking scheme outlined above, which can be done regardless of=20
whether the kernel supports multiple-open or not.

Andrew
