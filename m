Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE6B289DAC
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 04:52:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7TxV54QvzDqvN
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 13:52:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=AND8gAdV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=pM23OV7j; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7TwT6WYdzDqrq
 for <openbmc@lists.ozlabs.org>; Sat, 10 Oct 2020 13:51:20 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 688335FD;
 Fri,  9 Oct 2020 22:51:16 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 09 Oct 2020 22:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=Lw/aYPsLw8Dk15zboh30fEZ9+Lf42vt
 2IN5Vt7wTKL8=; b=AND8gAdVys1FfW5/TObHznNK+/dQj3yLX4bGDO3gJ9K8vHs
 K9RxzNcY1mTS278/9CB6zUeT7xs6bTBG4Q1ZPX18g8NwEkimswND2jKVe/AArXVc
 EMtwDF45xiWdDiHNHl0se7EKObs3zDZxij/Ob6pNfE/z/MQhG2GD3WMhtrnmfDFH
 YqCWlZArNp+qE+UCFpB3kkFjUTWVBQKfS8UukLzeeKf+fdG/BL57qAofNATeUyNZ
 MXQFwu30wlhcU2YSFv0I8XOfLY0E5hTFVfFMcRkufOqTVHxTAPpu4GPbwhn5aOKE
 TXY3NoJ36PGZtDp/a6rdTYyKAJyaKU1HWCNdu9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Lw/aYP
 sLw8Dk15zboh30fEZ9+Lf42vt2IN5Vt7wTKL8=; b=pM23OV7j5Gr2QkuvHcJUY0
 qLmD+r9UgwHAt6uB9F/phxWdXfyYoOAS33NE59mKlaaILHMk3toTKaYnk0ywHrhV
 6glGzcMof0Aj3LudaGUd3gbWT1p5eskbNzXLm++mfHwmAoW7Vw+wZO5mDOPj1yO6
 1n4B+cYxMOryb84E69DYPkqQdK9QTFOaNnXa/o7VNlhwP9qI6b681pZMPOV7dGyq
 Kn4v+/VyrXu67OcWvUJWhDjz5jyeNo5wTAC0o5PkfSwQmQzqS0cYZWF263PqOjGt
 ULPABZb5kz2ZhfKoXbpA190DKlXBYSdf84ziINFntqJGq59T+SlXIynW3Hor0fgg
 ==
X-ME-Sender: <xms:oyGBX8Y7633Dv8g1rk-oNM7bRVQd55UCu6J707f5jQokVo8yHbzRWQ>
 <xme:oyGBX3ZzWgsMpUUYR__AUL5klDHKkebqnYDKmO6V8gRfjdqs2p2Fm1g9-TnDUe3-n
 lU6xIHi64l_DYdDrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrhedvgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:oyGBX2-FZ9UfkwZuJ9Iv98yQsr08-G9Ra959IYMihd6QPP-gfRjw0A>
 <xmx:oyGBX2r2LGiFNsY7liKewCV83kjyT5O9ksB9M91zMgoDtMSI5psq7A>
 <xmx:oyGBX3rrgxLI71wDt4O7zdWfCQvKeMXXrk3hdmfIXSKnusO-BC2EHQ>
 <xmx:pCGBXxFfMQ4JovP3c-2CZZLoeoX12oy-3uefLKeFcDRqU8jM6e8KvQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F3E0FE00D8; Fri,  9 Oct 2020 22:51:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-407-g461656c-fm-20201004.001-g461656c6
Mime-Version: 1.0
Message-Id: <7da3c975-e8c0-474a-9ab2-97740c832d24@beta.fastmail.com>
In-Reply-To: <CACPK8Xd_kbuUVLomHhvkB4KXXuboiNY_HYMpSrJYdjjedjBu_Q@mail.gmail.com>
References: <20201002063414.275161-1-andrew@aj.id.au>
 <CACPK8Xd_kbuUVLomHhvkB4KXXuboiNY_HYMpSrJYdjjedjBu_Q@mail.gmail.com>
Date: Sat, 10 Oct 2020 13:20:53 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 0/3] Enable pstore for Rainier
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 7 Oct 2020, at 17:51, Joel Stanley wrote:
> On Fri, 2 Oct 2020 at 06:35, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Hello,
> >
> > This series adds pstore support to the Rainier platform for recovery of oopses
> > and panics.
> >
> > Patch 3/3 is a minor cleanup. Only patch 1/3 is a requirement as 2/3 is handled
> > by the config snippet in the bitbake metadata.
> 
> I merged 2 and 3. lmk what you want to do with the configuration.
> 
> I suggest we enable it for Tacoma too.

Yeah I'll respond and enable it on Tacoma as well

> 
> >
> > Please review!
> >
> > Andrew
> >
> > Andrew Jeffery (3):
> >   ARM: dts: rainier: Add reserved memory for ramoops
> >   ARM: config: Enable PSTORE in aspeed_g5_defconfig
> >   ARM: dts: rainier: Don't shout addresses
> >
> >  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 12 ++++++++++--
> >  arch/arm/configs/aspeed_g5_defconfig         |  4 ++++
> >  2 files changed, 14 insertions(+), 2 deletions(-)
> >
> > --
> > 2.25.1
> >
>
