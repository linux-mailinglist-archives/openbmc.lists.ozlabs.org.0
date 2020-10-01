Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D364B27F6D4
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 02:43:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1vWN54ChzDqTn
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 10:43:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=mLcvBBsy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ZDfBzDoE; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1vVS6CtgzDqSy;
 Thu,  1 Oct 2020 10:42:56 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 29CFF5800FB;
 Wed, 30 Sep 2020 20:42:53 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 30 Sep 2020 20:42:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=EAxp7TOknCizBkBbVqypDZ9urDOLrts
 qdGCCWqFKxMA=; b=mLcvBBsyfUNEdQKt6/kQngIHD8LwfD4zYZpm5VL8L3L1Iiq
 JPVt33Nk+QPj7ZM43nl/DKHDid5vSZYhraWFsS+BJpdf4z2dV98GZwOjW37JM2aC
 OUr9IlZgaztLyz5AtUPNuv6qJB1Rc8g3KqGsAWmLFLBBEF8iilbDAwzx/k7lPE+I
 Eg76fa49VEV40lNjoVeYtGKXnm8MJDl0U2Zikew1rizsXewQzC7K1ZOOjgnQe95n
 hsYCtk2pzMI3iRGCRvQsKDMaqoepWrqVeYcReTof+ilFV1Yg/Qy6m30v7TlqIXaG
 FuB+IQqW13nLwzKVb9oHj51GgSvcnpNysgHC+VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=EAxp7T
 OknCizBkBbVqypDZ9urDOLrtsqdGCCWqFKxMA=; b=ZDfBzDoEbEUuoiPnm7hBs9
 KGPnwcGR/M8s0FcLCv/WKDOJIIdNBXFFMSe2V1dC/xyq10q+D1cRQWWlwJB/2wSg
 kWuMcBHPcieG0uPma+lw/nOiG+kSOePHcyeZFpENYN3M3jY9oYWpY/LUaTamCuA2
 5pYbhif8SoAriqFxYa3nDtm31MbpK50+unXd+b6a2PMi49ljUz/HnCXDrmMxBs3x
 1GyIOz2t1RQRLcNiLrPxU58o8zB+c3gXAML7SSb9mouYfCb6MB3D8zQq0jhSPO2P
 8CPc4NUQ/shZzsvPMAbaitSEfqwTycN/FH/CWn8etY8jaapvjbA32WClAk2/Ey8g
 ==
X-ME-Sender: <xms:CyZ1X-x6oNm9na-EyRNLO6h_WwH0PTrSQGgZ5NQcaN7A-Ho0RdBFxg>
 <xme:CyZ1X6R6Shkq3t7CorpIsonnhN0Vew45nroSVwFmoi5rq8pnN5-fapJkXCSCDzctM
 BFNG_f79yT1XIMNfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeefgdeflecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:CyZ1XwXode2iKrrxnWGE0M3n_DxBzfn2RWwpYaSUvDCgIL8zMOp4GA>
 <xmx:CyZ1X0i0J4nE8C7FJwaCMeC0gLUsIiQF3DKqpX-x8RXyEs6o75pmkw>
 <xmx:CyZ1XwA3hPBavTpqqG-hVGona3FdbYAgEGsnOAEK8UjXOGTTR6wbBA>
 <xmx:DSZ1X06JZpbiquTh9jjC-u9w3A8tu9AyzufgNL6xCUi2rPR2Z_Dbig>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E221BE0181; Wed, 30 Sep 2020 20:42:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-382-ge235179-fm-20200928.002-ge2351794
Mime-Version: 1.0
Message-Id: <3755eb41-e939-41b4-93ff-7bfcbdbc9f5b@www.fastmail.com>
In-Reply-To: <CACRpkdbn9294JnddMsmGooCe7KCxMiGbuAZ+OAuLwPkZUYD10A@mail.gmail.com>
References: <20200911034631.8473-1-chiawei_wang@aspeedtech.com>
 <20200911034631.8473-5-chiawei_wang@aspeedtech.com>
 <CACRpkdbn9294JnddMsmGooCe7KCxMiGbuAZ+OAuLwPkZUYD10A@mail.gmail.com>
Date: Thu, 01 Oct 2020 10:12:30 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Linus Walleij" <linus.walleij@linaro.org>,
 "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
Subject: Re: [PATCH 4/4] pinctrl: aspeed-g5: Fix LPC register offsets
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Cyril Bur <cyrilbur@gmail.com>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 29 Sep 2020, at 22:12, Linus Walleij wrote:
> On Fri, Sep 11, 2020 at 5:47 AM Chia-Wei, Wang
> <chiawei_wang@aspeedtech.com> wrote:
> 
> > The LPC register offsets are fixed to adapt to the LPC DTS change,
> > where the LPC partitioning is removed.
> >
> > Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> 
> I can apply this one patch if I get a review from one of the
> Aspeed pinctrl maintainer.
> 
> Andrew?

There needs to be a v2 of the series that fixes the binding documentation, 
which will drive some discussion about backwards compatibility. So lets not 
apply this patch just yet.

Thanks for touching base!

Andrew
