Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6171EBE1C5
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 17:54:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46djKx6NdxzDqWS
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 01:54:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="OcStOaTa"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="gkgV0Rof"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46djHC2MrYzDqjn
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 01:52:07 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 049B939C;
 Wed, 25 Sep 2019 11:52:03 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 25 Sep 2019 11:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm3; bh=kNw6n
 5Iiv5ZOR7o/56oc8tZAaFKl0CYDa5THXmULjjg=; b=OcStOaTaSQAW0KD//dHKM
 0iB7FBqhRiUqJd2NOQlkx53skeKhh2NviPDQR5npjlMdyL1ei/l3uT1L1gngb3/T
 fbGwISsWKK4Jv3SrwDWr4OACmtblq2kbU8EQMYyzZEPZVcpElQb3GmqVOA7aU5ge
 qV6a4PAeBHqggU2ITx+HvbuZTjjZnQY8x2wdr3K+DEOrDyh6W30QNQM0wkK5zcSg
 c7yUq/Lm4+xe2r7fMlrXwtwKLVfIQXf6KLhi66KTEdKyrV0f2Hj6A0+Wrhzwa78s
 Mz+K4wGIp6S1CUPuVy8lS/wzvWyP5xgqpH9jJGkYtzLkhXNFVNSNQXMjbEQLpT0j
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=kNw6n5Iiv5ZOR7o/56oc8tZAaFKl0CYDa5THXmULj
 jg=; b=gkgV0RofxkcC06CGO5hevKPc+IieIsIZdcKGl9plj1zBZmRvoXYX9Vh6n
 MC6OCGuZbW0DUZFWdxm2tzu5jkwWuqi1099hC73EHk4nRLyQlpDrfj5v1eeZyqfa
 w5zazQfSndab/covUx1Pa2XnlRDGdwpBjQfohLAnJXzcp57o9VFAZBfYmM9/uEIk
 TI/NaN8SslR76THF59hB59nq09wR+qSwcnmnkAD56teFds37bf/SaLbe7tyVRZBh
 A/vtUoCp6URCMw/al+bGXA8H0aBNyK22vD17Ug4Hz9eaq4xppOo3Al+c/+KEZ+cr
 d8mldCUhzf3Tss/sGzyIqxJewEv1w==
X-ME-Sender: <xms:I42LXbsJzv-8nR9s_KIVjcZAxYe7ltF9xPLJi442tPt2nRdFjWvCFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgsehtqh
 ertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:I42LXQr0lvyDYg1CqLbMjf5ci1U74z2dphx5SeFC1A4m0cY__dNq9g>
 <xmx:I42LXTZbLver-6LI1qn9xfvm5TB8iR1fuVBjWo0Ic9_vqsdNXQQkfg>
 <xmx:I42LXQz1jyXPaq_1j0Pr7zPPxurdyIe8kMkEDGGDZQ6duqrMVd8WHQ>
 <xmx:I42LXR4sFNMUV6DIotzOsqQRpXopgVszBRKfzObsZVBv1WukEeATsQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 8634EE00AF; Wed, 25 Sep 2019 11:52:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <a1767b7c-1769-40ff-b3d7-8e9adc7d234e@www.fastmail.com>
In-Reply-To: <CAN34fowhEKe0fTv+AVN-++5GoySugobjegb=5Lghi7VYXNLmdg@mail.gmail.com>
References: <CAN34fowBHmprS9Wmo+GQkDEtxsz2s514j5+zO-rGvTWeMnzjOg@mail.gmail.com>
 <9f7cc18d-2164-4a39-8f47-1a3ef3220685@www.fastmail.com>
 <CAN34fowhEKe0fTv+AVN-++5GoySugobjegb=5Lghi7VYXNLmdg@mail.gmail.com>
Date: Thu, 26 Sep 2019 01:22:41 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Stephen Beckwith" <embeddedsteve@gmail.com>
Subject: Re: Unable to boot OpenBMC image in QEMU for AST2500
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 25 Sep 2019, at 22:52, Stephen Beckwith wrote:
> 2) re: qemu machine - the qemu machine being used is the one that was=20=

> built as part fo the opembmc project. If this qemu machine won=E2=80=99=
t work,=20
> then why is it built as part of the project?

Because no-one has looked at removing it from the poky build
configurations that openbmc inherits. Regardless, removing it isn't the
right way to deal with the issue.

> Why are there 13 copies of=20
> this machine scattered through out the filesystem, consuming ~ 564MB o=
f=20
> space, if it=E2=80=99s the =E2=80=9Cwrong=E2=80=9D machine?=20

This is a question best asked of the upstream yocto project.

>  - so where do I obtain the =E2=80=9CBMC-specific machine=E2=80=9D ?

By running `qemu-system-arm -M ? | grep bmc`. It will give you output li=
ke:

$ qemu-system-arm -M ? | grep bmc
palmetto-bmc         OpenPOWER Palmetto BMC (ARM926EJ-S)
rainier-bmc          Aspeed AST2600 EVB (Cortex A7)
romulus-bmc          OpenPOWER Romulus BMC (ARM1176)
swift-bmc            OpenPOWER Swift BMC (ARM1176)
tacoma-bmc           Aspeed AST2600 EVB (Cortex A7)
witherspoon-bmc      OpenPOWER Witherspoon BMC (ARM1176)

You need to pick an appropriate one to run your image:

ARM926EJ-S: AST2400
ARM1176: AST2500
Cortex A7: AST2600

The remaining differences between listed machines are what peripherals
are attached to e.g. the I2C buses.

>=20
> 3) if OpenBMC doesn=E2=80=99t properly integrate into the rumqemu scri=
pts,=20
> then: A) why is this script here?

It is provided by the upstream yocto project.

> B) why hasn=E2=80=99t anyone taken the=20
> time/effort to correct the script so that it will integrate properly=20=

> with OpenBMC?=20

Because no-one sees it as something worth spending time on? I've
wanted to get it done since writing the initial QEMU support for the
ASPEED chips, but it lives at the bottom of my todo list. I've asked
other people asking questions like you to do it as well, but it hasn't
been done yet by them either, so I can only assume it lives at the
bottom of their todo lists too. I'd love it if you contributed a patch
to fix it :)

Andrew
