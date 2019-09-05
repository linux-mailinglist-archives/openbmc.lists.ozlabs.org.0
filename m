Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A05FA9780
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 02:11:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P1Ly2jklzDqwJ
	for <lists+openbmc@lfdr.de>; Thu,  5 Sep 2019 10:11:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="k5JmObUM"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="QvXswrMx"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P1L46Pg0zDqw0
 for <openbmc@lists.ozlabs.org>; Thu,  5 Sep 2019 10:10:36 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 092A82222E;
 Wed,  4 Sep 2019 20:10:34 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 04 Sep 2019 20:10:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=8fUacJJxkQP0yp0AqKIGC5ta4bLT8LQ
 H3lMAmSXN45g=; b=k5JmObUMq2HO7bSGy83DX7VnuPmyd69d0X/bv0FvT33MwpU
 0oBbJlB1UlEr7JAwjAr0dElYfQ8zly+7ZMRYk9nJEJ2RfZI7rC8qMuqlAVuYEgwh
 8eUdry98a3PlOHiY62yjIJYZ5tfn2wv08zQm9d25amAVset6qRGmD6yOGZSQnTQ+
 YM3SxzTYbGltlgd0IGQoeD1JEyezdudg0UX/4y19ThwXBZnj8u9gYbKLJ69mfkKQ
 q6GIt/f2gcX//PGoFtzj+4mas74krkglTZNl94nVjgXTUfVXuPRAFwIHUANtspZY
 3BdSIZE9nyf9usCbFhjGQYc8wUZAKYF9W0sQ6dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=8fUacJ
 JxkQP0yp0AqKIGC5ta4bLT8LQH3lMAmSXN45g=; b=QvXswrMx09pp6BLhD4d71f
 MlA3ObfrvLUu2Pa/0eWoEqNf1Z+cfNsZ5F1fsp72dIBIhe69V0m4FN/XLYt/vM1o
 TjEyHwIx2nQvWtDINvX9xtX7pPY3vJ82JwvXenGrVgnLLCVtrF0ZgsF0+EClJLdR
 vpzDuUzRmFH6Njn7DXFtbXdzdX36Jzk+IFsrtLk5rfSynwYXgCHl2k8H/YaEg16t
 RRYFoYBDIeqLxWD1rqCU9vLD5sZNUVNi5RvaO1zcSe+6l5Ptfj3coZdz867em3bE
 vcxO67R04iBnFey3t2eg1cWOQwRjktCAU4I+WGzNVrhgmSV1XkdBUzWEe8DV06/g
 ==
X-ME-Sender: <xms:eFJwXd1Qwsm6YXUb4j37g_-LYk3cneo282kv8mhLMlflbuDoaBJlSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudejiedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuffhomh
 grihhnpehgihhthhhusgdrtghomhdpohiilhgrsghsrdhorhhgnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivg
 eptd
X-ME-Proxy: <xmx:eFJwXYI_0wZIjilUGLOsb-PJUv4Sjd5sfLEfqeFVczU7kKhBp3KuQA>
 <xmx:eFJwXfC7IXHSBo-sZKleyULoTUSkz2eETcYaOzmr7N91-ACFIfV7Ng>
 <xmx:eFJwXUMDX_x82vOJhHzlfkbOqnMoJwW9JW8kFOiKA-iLDOP-hQ2KfQ>
 <xmx:elJwXZkOblEKwOkCmtRdVmpmxd_3jlXScshoThaB383zlIIg3r_gbA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0127CE00A3; Wed,  4 Sep 2019 20:10:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-186-gf4cb3c3-fmstable-20190904v1
Mime-Version: 1.0
Message-Id: <d602a97b-4555-43cc-b801-c87f3c2899b6@www.fastmail.com>
In-Reply-To: <d2ceccb7-2b1c-d944-76f2-ea284f4197f5@linux.intel.com>
References: <20190904200758.5420-1-jae.hyun.yoo@linux.intel.com>
 <CACPK8Xfzn3A7nCFqCbSm=6qsB-5dgJOcz1rgSGhRH=xojb4m_w@mail.gmail.com>
 <ca423521-05a5-1fcd-27f1-bb5f68fa3c23@linux.intel.com>
 <e37f18a6-18f0-4768-96c7-fb4ad05fe03f@www.fastmail.com>
 <d2ceccb7-2b1c-d944-76f2-ea284f4197f5@linux.intel.com>
Date: Thu, 05 Sep 2019 09:40:57 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH dev-5.2 0/2] i2c: aspeed: Add H/W timeout support
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, Tao Ren <taoren@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 5 Sep 2019, at 09:10, Jae Hyun Yoo wrote:
> Hi Andrew,
> 
> On 9/4/2019 4:12 PM, Andrew Jeffery wrote:
> > On Thu, 5 Sep 2019, at 08:31, Jae Hyun Yoo wrote:
> >> Hi Joel,
> >>
> >> On 9/4/2019 3:54 PM, Joel Stanley wrote:
> >>> Hi Jae,
> >>>
> >>> On Wed, 4 Sep 2019 at 20:08, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
> >>>>
> >>>> In case of multi-master environment, if a peer master incorrectly handles
> >>>> a bus in the middle of a transaction, I2C hardware hangs in slave state
> >>>> and it can't escape from the slave state, so this commit adds slave
> >>>> inactive timeout support to recover the bus in the case.
> >>>>
> >>>> By applying this change, SDA data-low and SCL clock-low timeout feature
> >>>> also could be enabled which was disabled previously.
> >>>
> >>> Please consider sending your RFC patches to the upstream list. You
> >>> have a big backlog of patches now.
> >>
> >> Thanks for the reminding. I can't send the RFC patches yet because QEMU
> >> H/W model isn't ready yet. I'm still waiting for the fix from Cedric.
> > 
> > QEMU shouldn't be preventing you from sending patches upstream, rather
> > it prevents us from enabling the buffer mode support in the OpenBMC
> > kernel tree. You should be sending all patches upstream as early as possible.
> 
> I met a QEMU issue when I was upstreaming a patch set last year:
> https://lists.ozlabs.org/pipermail/linux-aspeed/2018-September/000750.html
> 
> If OpenBMC community accepts the QEMU issue, I can submit the RFC
> patches to upstream. Will submit the patch set soon to linux tree.

Ah, didn't realise it was Guenter that ran into it. We have some changes[1] in
Cedric's aspeed-4.2 qemu tree - do you mind testing it out? If those patches
resolve the issue Maybe we could point Guenter at that tree, though really we
should get the fixes upstream so this isn't an issue.

[1] https://github.com/legoater/qemu/compare/59dda66ab756e52e6a9c1ef89660d30b3769f63c...aspeed-4.2

Cheers,

Andrew
