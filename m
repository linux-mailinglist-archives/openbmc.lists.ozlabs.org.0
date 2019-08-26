Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EA09C769
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 04:51:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GxNJ4DpRzDqd0
	for <lists+openbmc@lfdr.de>; Mon, 26 Aug 2019 12:51:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="bCUZLT+Q"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="PGYKpzkJ"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GxMT3x30zDqbl;
 Mon, 26 Aug 2019 12:50:45 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4F8B1351;
 Sun, 25 Aug 2019 22:50:41 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 25 Aug 2019 22:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=moWMgQCDhujoC+j8abBt3m/E1h8l0To
 9/QbmDbkmg28=; b=bCUZLT+QiXSx1IUJAEAhJiDLQyuKTwf82FLSxfZBLL6euKT
 yoybApEWnKwUuJTqkjiDiZaVdiMFDY3PHYBcM/7zs8rs9nPzhli/xRGEEu0is+NF
 +LpGJWhV58jkhnoeaaK6wCsS+xzbL5BbiCqoZ8G3YoBN0Le7EQgph8MFSpoADQsA
 u9dNimN/NDEmUb0g41bRG9L8dviCYKuUQFKRB1pNtIftiaLx4z8Q7ScpinhH+Ikh
 sG7Y0sJEZLAmzN18K+vRdYbI7ErVrUSDnBW2GyU2wnrg9h3CAH2Fp/uA2GnP9KyJ
 HQH8Q2u2dIEKxyxgDqRpzrmtYHyFyOEpiNiY9wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=moWMgQ
 CDhujoC+j8abBt3m/E1h8l0To9/QbmDbkmg28=; b=PGYKpzkJybgsc8jWwoUmeM
 UP9mTgnYzIN2ymIcXLSBHuLK7exH/KVE1IMQ1j7Y5hxzvB3QpdFodRs2gIQBf2HS
 vozoNo1tC26w2V63FprL0KchXIWbNdiLcH5PKmRhcZMIAqkluASo8zIizXFuWWBB
 r7zKWIn4dQW6j03TXkki1P40ZM8+aXpI48wjNEZgDwx2STvvea8AiGgBzlpugzXg
 8mS9DeRMpZ3+1FSL/75m94yFQZXNCIKfwOFs6YwaA/kCniYnP1MCSP0OSpPGdK3k
 viwavo2GxbVl2tb1r60ZQLZnT79Bi4mYM2BjFBwCTPuWQBekXkp0aCOMeU5eaI4g
 ==
X-ME-Sender: <xms:_0hjXd9nX2hgbfW83F3K9dqn2U5N0iSudTwmTGy2C_Iz72HKBBmt6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehfedgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:_0hjXbzz0p305wGifpsc2Moo9elQsbzp6jm8ZGSSnnV-S2YHopRPKA>
 <xmx:_0hjXa4K9-ZZ_iQmOFq7g0oCppGBfjGPAQQXXRgZgN3B4QjlkTnkrQ>
 <xmx:_0hjXS_bmJXkvndFwAVfXYhRCnJRXpBWhuEqfD44px1TqAIUdWji0g>
 <xmx:AEljXXWHeKXXyIHP4hWDUqKq2iQtbUDpWNklEOFPVKUf9m10ovbtzg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 88EFAE00AC; Sun, 25 Aug 2019 22:50:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-916-g49fca03-fmstable-20190821v7
Mime-Version: 1.0
Message-Id: <758d249b-81c1-4e26-b3d5-ce79d86231b9@www.fastmail.com>
In-Reply-To: <588f6cbd-b6ca-4f43-8034-80956ee56bb8@www.fastmail.com>
References: <20190823212957.26043-1-jae.hyun.yoo@linux.intel.com>
 <588f6cbd-b6ca-4f43-8034-80956ee56bb8@www.fastmail.com>
Date: Mon, 26 Aug 2019 12:20:59 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jae Hyun Yoo" <jae.hyun.yoo@linux.intel.com>,
 "Eddie James" <eajames@linux.ibm.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Joel Stanley" <joel@jms.id.au>,
 "Benjamin Herrenschmidt" <benh@kernel.crashing.org>
Subject: =?UTF-8?Q?Re:_[PATCH]_media:_aspeed:_fix_an_incorrect_return_code_on_buf?=
 =?UTF-8?Q?fer_allocation_failure?=
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
Cc: openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
 linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 26 Aug 2019, at 11:02, Andrew Jeffery wrote:
> 
> 
> On Sat, 24 Aug 2019, at 07:00, Jae Hyun Yoo wrote:
> > It returns '0' even when a failure happens on jpeg buffer allocation
> > so this commit fixes the issue.
> > 
> > Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Keep my Reviewed-by, but can you please do a v2 that adds a Fixes: tag
and also Cc stable with the patch?

Cheers,

Andrew
