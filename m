Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EE21CA1F3
	for <lists+openbmc@lfdr.de>; Fri,  8 May 2020 06:17:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JH9h6CS8zDqsH
	for <lists+openbmc@lfdr.de>; Fri,  8 May 2020 14:17:44 +1000 (AEST)
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
 header.s=fm2 header.b=LHJqHVEa; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=FeyfrtDY; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JH9027TczDqm9
 for <openbmc@lists.ozlabs.org>; Fri,  8 May 2020 14:17:08 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id AB6BBA98;
 Fri,  8 May 2020 00:17:05 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 08 May 2020 00:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=KVUW1bkuLxLnt+sBiBV8tfqS4rfpvva
 2CT1TJXUqvaQ=; b=LHJqHVEaSxU2MldZeetyv7FjZrNTGNz8XfEmt48GnHFGWJx
 TUXXwSiqFnhHV8+NvMYjIyxrOXm2NactYiI3mqXQ7vTZl3vCokc5V+A0fVuQlw1l
 OttM1Oo6sLK7hjHYwy8gyXj2nKPQO/MvaxCxJ4Ogo0a7txM0A1N1H9hLXHBBOdw3
 gHKKOiSN8H1HyPEGTuqLf8P5UDf0RoIEHpxWZrNwvIFCewTMNq/gw2UvSQiEIY5j
 muWuI7lL/jJR4O471GgEffr4FkkPptlAgRc2eQtni+HVvVrzkR2olTPQomYEWKXu
 oZy0dMdG3yJ49PT6/qLrqzCw212wZrfX7tLDVAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=KVUW1b
 kuLxLnt+sBiBV8tfqS4rfpvva2CT1TJXUqvaQ=; b=FeyfrtDYIWY5bYVuSBZWOT
 +/MNfNLSLcJfU7Mowz4cNxf+Gic5854JjDoUPYyFKV+gAuaSMcxrlRJD6jlRM4GD
 6+BDW0kng5z0TXC9NHvnt9s2dNz0N/lkrxI9wfelkwMy6h7DVw7rDkq9JhGV1gzC
 d3Y/Dvozao3oYO0YvZfJbn4d3t/NK7oNzvoYObY0368385HsuUvNDIRQ161504eG
 F1sdMYVggEmqb+Rw/ediJ8X2bhw02cXDxosyD5qS3xtAvWclHyWeekOJW1HpD7Ax
 0zvxvTh0PvpPXaVb4NkUnlxHKzFuyNUFQZq+j1iPST1D4VKrezrIr43zTSZz2Wkw
 ==
X-ME-Sender: <xms:Qd20Xm6l4QMGcvU7LDusW65K9i-cCpKwg5ASLhaqDy95E22KGumIkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugdejlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculddvfedmnecujfgurhepofgfgg
 fkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgurhgvficulfgvfhhf
 vghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhepke
 dtgefhveffieeivdeihfeugeegteelheffueevffevkeejfeehfeevtddthfegnecuffho
 mhgrihhnpehophgvnhgsmhgtqdhprhhojhgvtghtrdighiiinecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uh
X-ME-Proxy: <xmx:Qd20XpN1ejiYiU-_hAQXNg3er6873i236q8SPcMc3zn-XXDZf0OmSw>
 <xmx:Qd20XteKGzk1S98HHb4ONeDDk3cYcNerdyYO3uzsvT9Bz2yQSm1Xaw>
 <xmx:Qd20Xs2musPUADiW-K72C_sopEEcOMUgrI0P3GBAiJIUHYuCzrdCoA>
 <xmx:Qd20Xoj3LEhC0TBxXomhSQ8P4uxuRHwr6LKEE0PsnGP6KfYSMr-9FA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id EAEEEE00B0; Fri,  8 May 2020 00:17:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <cc83fa1c-1133-4357-ac04-31068c2ce859@www.fastmail.com>
In-Reply-To: <703ee8c0b9265cdae7fa7fc2583be04e@linux.vnet.ibm.com>
References: <703ee8c0b9265cdae7fa7fc2583be04e@linux.vnet.ibm.com>
Date: Fri, 08 May 2020 13:46:44 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Adriana Kobylak" <anoo@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: Update tools (fwupd, swupdate, ...)
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 8 May 2020, at 03:33, Adriana Kobylak wrote:
> Doing some exploration on firmware update tools for openbmc.
> 
> Vikram mentioned that Intel would be looking at implementing fwupd 
> (https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/27576/).

I don't have anything of substance to add, but +100 for adding fwupd
support!

Andrew
