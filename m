Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73176210F6
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 01:17:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454nQB6cftzDqQm
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 09:17:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="V+DUoGdn"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="bb5ydZ53"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454nPm3mgFzDqPT
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 09:17:16 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EB0E224890;
 Thu, 16 May 2019 19:17:11 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 16 May 2019 19:17:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=SXtHk5Pgc5mLdjiCOFn2RRq1IDOB4VC
 JydDc+zYlPVY=; b=V+DUoGdnQhgKFHxQoFP+7QWEJDmVGbUtdGm4g8zPZ7vLptI
 U4EiY3g25jQ4UG+P/dwU8rcfdXIWl0DSR/Kqrdef2gG/aiUxHtGqjs/RJqy+vyGj
 K+A292Zx2SwuissfNvIZ2EODBtFYrernLEfKDCTXIylT8IKxX6layPU4xRUY2vGb
 r0OD7KMUycIavDy0pGN5IiQ90P94O7tdmOd/gMBNvIWEG3PaHHzqn4qPxMiqPWp9
 5a6699Tz0SPLTsqkRGY2K6fPdKkUpEC0rDvxK3nGd+VExEg88QLCrKuIpgCViyTK
 SXTqjWfapeoGiQU/437Zrxv8ECkeQATH78uMQEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SXtHk5
 Pgc5mLdjiCOFn2RRq1IDOB4VCJydDc+zYlPVY=; b=bb5ydZ53j1QeJB46SqNNpv
 V0qLIfk1prvx/8xAnQ9lxEW6fnPW+/qFLcMLHjgNux3LH3elJmtOgyg5S6bZQr0B
 D/JXT3lwKmHlXgvVwrYTgbzl/D84OHQfMMAPAez3vmPtO9yX7fozw5iHNNbeSud4
 0f7IAVsI/pS/AFlYhdZrGBimqcTwRFdU7R23sGW948v7A+kMKEZd05ScJoczTkyX
 yXar03JHu8mtH9FEO/+F9YhzFELBBd6Vy8AJsJQJgbUg6ucBQPZBh9F8iVL+fHta
 GvpKUYrwFdLYri4PtNkLqUpQXUFKyRD2vHUqlOEzVcc/vN6fMsu97TH4JrhThSvA
 ==
X-ME-Sender: <xms:d-_dXBGb0ZjbIqVHaGI-LYYjZLPfs0eRxBD5oW7no0pYpehT3-KHPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddtuddgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:d-_dXPgh-UU5SyD9WnLVo05WeRKL8ezkinULQuhzBedYbl8lmS0Gkg>
 <xmx:d-_dXHZ5JZ363slAVhLSLHYHQqgF7QYsyaAQF-aeTmjs81H4oCDU7A>
 <xmx:d-_dXM29RPCJz2JDiwSlX_E-uTjCfjDRa872EGpw52Z6R9zeOOdOLw>
 <xmx:d-_dXL3IGdzwpF665rFsQo_gBl_1FZvVVhNZ8qzeOun6x96vyxib-w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 326957C3E9; Thu, 16 May 2019 19:17:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-549-ge400f56-fmstable-20190516v3
Mime-Version: 1.0
Message-Id: <acff464f-4e77-4b69-8d3a-bd03d1df37f3@www.fastmail.com>
In-Reply-To: <000001d50af1$2e9f3700$8bdda500$@linux.intel.com>
References: <000001d50af1$2e9f3700$8bdda500$@linux.intel.com>
Date: Fri, 17 May 2019 08:47:10 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Yong Li" <yong.b.li@linux.intel.com>,
 "'OpenBMC Maillist'" <openbmc@lists.ozlabs.org>
Subject: Re: Get the AST2500 SCUE0/E4 value using kernel device driver? 
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
Cc: "Li, Yong B" <yong.b.li@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 15 May 2019, at 17:12, Yong Li wrote:
> Hi All,
> 
> 
> Just want to know if there is any existing device driver provides the 
> interface to get the SCUE0/E4 register values on AST2500?
> 
> 
> If no, I would like to know if there is any examples/similar drivers 
> for reference? By the way, the two registers are used for the uptime

I'm not aware of any, but I'm interested in what you're trying to measure.
Are you after something that can't be satisfied by CLOCK_MONOTONIC
and friends for clock_gettime()? Or is that what you're wanting to drive?

Andrew

> 
> 
> Thanks,
> 
> Yong
> 
>
