Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 054F81D4087
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 00:11:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NQk20nxTzDqwy
	for <lists+openbmc@lfdr.de>; Fri, 15 May 2020 08:11:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=cVTJ8XtE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=BmOB1pBQ; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NQj90SH3zDqw0
 for <openbmc@lists.ozlabs.org>; Fri, 15 May 2020 08:10:51 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0D55A5C0120;
 Thu, 14 May 2020 18:10:48 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 14 May 2020 18:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=E/M8xr2v5wHOj02alFITDo4bBri+9HB
 PYEwR9tiAF5E=; b=cVTJ8XtEX7gly1vrIS+J6NzZZmRe1epZGzYV4VEGzr/ogoy
 Dyv41JFFLbruyyp3pQVo6dVA6W2XFP/azyCO4YyK9+WXHlUWrF0cyCjCJBaDFvO5
 jN5jbtIJ8GLYwZSUOWkVw8AmBfO67SVLWCmG6x1bdXRoWdGhBZH6PkrFhZA3cxZp
 MLRvSju0zQfA6iLs+r39BP+l+qw3zYHSGMW05+zKkcJn+UHCPYoPezgPMGS+pYAv
 AtHlNDCMdd/odQrLUGWpEgKjY5T526LOs/2ZFWKyk1y+vRNM0uMD52lB+OrS0yjY
 5ZLji51Ml5kJvqHUwEjqEeM249LM2pWrUVRlb7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=E/M8xr
 2v5wHOj02alFITDo4bBri+9HBPYEwR9tiAF5E=; b=BmOB1pBQXyFehAY7Abcvr2
 V1sNo4fa/Q0tsZNvlEMHXEkbYSFBgunrtbp75xAUHsOUyaIfSAMpY3f9LOUEJwUg
 1lxfRPYqe3HTVUIX4JHKGpHeJ7vdeLYWLSqpPZl1jeRhadhoEyv9YNdliTbJ3/Oe
 Av44JjYDqf3w6mVtmHlgtO5lgBlE9Isz3K7HqyCJ8kbTVo80UfcXHXM7qWP0XMP2
 UYg6hvEsxO5blTGop0lI0Ev0/7/K+qrUJ3Krl4KNbOggNW8tfrt+MEQ0kDaQARIT
 wYp1HDVbitp7tx6RKNkNbgTyryieYbhOrcyVleGfm0rhP9Kr9cYAfBMIxOTEidRw
 ==
X-ME-Sender: <xms:5sG9XsIsPYRqN5ntEfWn15ZMfZ-dE_d_wbMGYjxkUhFVEjfrIFWvlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrleejucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgurhgvficu
 lfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvg
 hrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteetvddthfei
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:5sG9XsJ2EAttXBoBXQa57qV7I0BJ7GUcmWNo7kr21SkmwcBmtrXvYQ>
 <xmx:5sG9Xss07S4t6mvWEdZDZRg6CN2jPGkZPEIf2wXRmaIymCvYaoJXBw>
 <xmx:5sG9XpZIdRIgR1hEDUGVXErALWlPbRJG69_9HiMa89oFMQ8-sstqdQ>
 <xmx:6MG9Xt3_r74fCZ_M3x3J9QdcdhoD6D2MfbA0jDMTgQMNtQ5AY9rYzA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7BA99E0128; Thu, 14 May 2020 18:10:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <6922803d-99c9-4d23-85d8-32eeecad0c34@www.fastmail.com>
In-Reply-To: <20200514135401.GD1166713@heinlein>
References: <20200514132703.448317-1-andrew@aj.id.au>
 <20200514132703.448317-5-andrew@aj.id.au> <20200514135401.GD1166713@heinlein>
Date: Fri, 15 May 2020 07:40:26 +0930
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



On Thu, 14 May 2020, at 23:24, Patrick Williams wrote:
> On Thu, May 14, 2020 at 10:57:03PM +0930, Andrew Jeffery wrote:
> > Setting CONFIG_FORTIFY_SOURCE=y and CONFIG_KPROBES=y on arm gives a panic when
> > trying to insert a new probe:
> > 
> > $ echo r:myretprobe do_sys_open '$retval' >> /sys/kernel/debug/tracing/kprobe_events
> > [   51.688589] detected buffer overflow in memcpy
> > [   51.689430] ------------[ cut here ]------------
> > [   51.689627] kernel BUG at lib/string.c:1096!
> > [   51.689800] Internal error: Oops - BUG: 0 [#1] SMP ARM
> > [   51.690107] Modules linked in:
> > [   51.690442] CPU: 0 PID: 107 Comm: sh Not tainted 5.4.39-00272-ga1ee7c973659 #6
> > [   51.690674] Hardware name: Generic DT based system
> > [   51.691184] PC is at fortify_panic+0x18/0x20
> > [   51.691371] LR is at __irq_work_queue_local+0x40/0x7c
> > [   51.691575] pc : [<8083eaa4>]    lr : [<8020e0ec>]    psr: 60000013
> > [   51.691812] sp : bd237cb0  ip : bd237bc0  fp : bd237cbc
> > [   51.692129] r10: 00000007  r9 : 00000000  r8 : 00000060
> > [   51.692395] r7 : 8011f2f0  r6 : b5092480  r5 : 7f000000  r4 : b4c53b4c
> > [   51.692723] r3 : 80c04c48  r2 : 00000000  r1 : bd7c5448  r0 : 00000022
> > [   51.693088] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> > [   51.693449] Control: 10c5387d  Table: b50f406a  DAC: 00000051
> > [   51.693769] Process sh (pid: 107, stack limit = 0x4e9b7225)
> > [   51.694126] Stack: (0xbd237cb0 to 0xbd238000)
> > 
> > YOLO it and disable fortified source.
> > 
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  arch/arm/configs/aspeed_g5_defconfig | 1 -
> >  1 file changed, 1 deletion(-)
> 
> Doesn't this mean we're just hiding a bug with KPROBE code

Possibly.

> and
> potentially hiding more bugs with other drivers?

Yes.

You should view this series as "things I did to get kprobes 'working'" and not
"patches we should apply to the kernel tree". This one in particular was a
low-key troll patch to flush out any information on why
CONFIG_FORTIFY_SOURCE=y breaks kprobes in particular. I mean, it even
features "YOLO" in the commit mesage, so don't take it too seriously :)

Andrew
