Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6FC104E3
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 06:33:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44v59r4d0GzDqT2
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2019 14:33:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="LLrM1b5H"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="yLYsEPwC"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44v58w4qN3zDqRS
 for <openbmc@lists.ozlabs.org>; Wed,  1 May 2019 14:32:31 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 19E4B238BF;
 Wed,  1 May 2019 00:32:29 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 01 May 2019 00:32:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=+ME+xHC3PNTC+Sp0av7ohbPmnxU4aGL
 VsdruN7YOXVc=; b=LLrM1b5HegrzXhBz8JPveGDnw3HuOp1xHfmds8dGWAqnVEG
 hqG+5rbaHczPdPPdJ5yA8IE8EhKzmSPpG0Sto0Wr1AXvHsoJPUXP4h/SlUpMwmb/
 H+nZ9l36a5fq/M/5w6wbeR71SGI9McSuLoYxGAcxtbXU+lJNT1kjOn7HhRGgFWV1
 LaqClFA3Rd1RR+Bi9VkpFVFkuMxa8A19SdlpzYKThmbq2cDd8WX6d5JZE3n6UMgx
 sGTYEmYJPn3j/7B/DJES8RQTEcUUQOpARcF43sc2IrsJV311i3/oRF+MlkfKkeEz
 /bC12fOOSvd1zDBsJ70mY3EvpBHLavOUlhOL2BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+ME+xH
 C3PNTC+Sp0av7ohbPmnxU4aGLVsdruN7YOXVc=; b=yLYsEPwCNF58V/MeQexkNO
 KG97jIUhkaFTQYkEvwkPerglIHuJTlqXk1PUlYF/WzSbxkUB04E8avVMNtRdfyfd
 MvzsLg2ggqorSG0Ph29eiPPy401YR+UGnIi2+jktpppgsLJV1KFAFa4rJu6ZXS3A
 MbjxRZgPBnMKFDjTraApEjliOm2Qtq1m6Y29PFmwJ4wJT5ngkK4E3Mu4N21G11YV
 OgZDO4jWDE3/GY2Dty6XaBSxtC/ieUjMZUhhWVPtaGDhLoP+OuCEATFg76+F//4t
 694pMyAyp1x3EHbAnRgGJPgDuNHdOC3zWX6k+amctfkZNAPqrGC+oyH+1tBmeWoQ
 ==
X-ME-Sender: <xms:XCHJXDWE9CuR3dfCHnL7Z2I7HTaRDnM8IO3iuakH9ShA1iDLRxdoMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieeigdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:XCHJXB4sfhHSynQ7olUscklnXKl-pyAwOFHJrxBWHHCNTnNWpxsNrw>
 <xmx:XCHJXMETPJTjlkt2AE5CpSgtXtBgcXemsWRDxMnc8FMWnQO1mdh4nA>
 <xmx:XCHJXM9H96IfNmruIakXX6rILSyTJgqfVccFDg1ET3QoyAi26tDMHw>
 <xmx:XSHJXFDUNkHDxqfIkjjV43Xq0PtC3GZW4g7j-i8PRBsZTg4MFrsNqg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 50A857C130; Wed,  1 May 2019 00:32:28 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-449-gfb3fc5a-fmstable-20190430v1
Mime-Version: 1.0
Message-Id: <52d67ef7-a7a4-4a5f-8af0-3a5cda3e4130@www.fastmail.com>
In-Reply-To: <7F0BA69AEB211847B189840D81AA97F0EAAFEE47@USMAILMBX02>
References: <mailman.5.1556589602.3525.openbmc@lists.ozlabs.org>
 <7F0BA69AEB211847B189840D81AA97F0EAAFEE47@USMAILMBX02>
Date: Wed, 01 May 2019 00:32:18 -0400
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Sumeet Kochar" <skochar@lenovo.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [External]  openbmc Digest, Vol 44, Issue 120
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

Hi Sumeet,

On Wed, 1 May 2019, at 10:56, Sumeet Kochar wrote:
> I want to seek input from the community on QEMU support from BMC chip 
> vendors for their new BMC chips.

I agree it would be great to have the chip vendors on board. I think some have
seen the utility of qemu, but ultimately it's up to them to either act on it for
their own purposes or for their customers to start pressuring for this as part
of their purchase arrangement.

We can start advocating for it as a community, but given the community isn't
the one purchasing the chips we don't have a lot of sway. As such from a
community perspective it's largely still a scratch-your-own-itch problem.

As such if you want to see improved qemu support please don't hesitate to
start contributing! Just like the kernel, we want the patches upstream, so
send them there first and we can backport as required.

Cheers,

Andrew
