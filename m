Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0000021B68B
	for <lists+openbmc@lfdr.de>; Fri, 10 Jul 2020 15:34:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B3DYV2F53zDrN4
	for <lists+openbmc@lfdr.de>; Fri, 10 Jul 2020 23:34:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=P44U5o6u; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=n3DaPSVf; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B3DXF0vm2zDrN4
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jul 2020 23:33:48 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5D94EB29;
 Fri, 10 Jul 2020 09:33:45 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 10 Jul 2020 09:33:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=zwgpk4KNCOAYl9XDL55I0jvfgeVuA+c
 tYwYBFX65jO8=; b=P44U5o6uHVfIgx58XT+bDnYVzD4ckEXyLWHyUbE8aZzW9kO
 mgD53kjapQWFT12drWNiRYEiqlAExVtmhMgn3T2Eh7eIZj0bFIoVLmdhZmgXcIyP
 oWPegdtdOwyjEEseug5WfAxin0EX/lNhQEEfjpDfcoIX9DRFOsBe2CVVR7+8dT+O
 VB/yEoPc9lg1syODEF5eC6HuuWJAiTGDtdwfh44SCjQOWizf+lSL5RPRlm9TuBpT
 J5i527bzmCUAhQs3jhvfWFhpo16SBt1tl2/+WGgQTV8SluoaFx0q1cwhaw/3dFPT
 pjhNatLPIeFgafGDzAR3+kEtv82IidYgOP+YQEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zwgpk4
 KNCOAYl9XDL55I0jvfgeVuA+ctYwYBFX65jO8=; b=n3DaPSVfPjzXr5CJl8v5Mg
 Z/jCJJwncYUlsbyuC5XtbbKB7GmZ3fYmU38+jsiQ1wARfMB2XOST2KSunEO5uRVA
 dYV+gw0Z/tftr9QA5ay/d4OpIjBcwlvU2QnMZ3+iRgJ5Q33qaNhrFmBkar7wkAN9
 0Otp3cg3GYKWD2rPIZBtY6pDhGkh1k6/BUDDeA/CiVm71o50YKwL3KWRq85VHOW1
 yLL8PcxUD4b/c+06ivY5ay6HckhlceYjSFEWdOb2NRtx83oXnCn5vWLxCVdlZEK9
 m2ypsGsCRNVTTjqXYRiH+5/RrS4p3obCEqzr+CQdpDEBzO5T65SBydNSRQcF+I9w
 ==
X-ME-Sender: <xms:OG4IX4Hj_wUnukh_AIdVynKzufLSFkHLvsN5-8BIuKiiHsUED2lpeg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrvddugdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:OG4IXxXgO1WY2bJGkBPdtOSBM_DMG4QD5DDgFV2brd9W0L-spIwxjw>
 <xmx:OG4IXyKfjdZqNhzXPNEdGnt4aylnTBtKDCrhXnwZOkLnJDuZ9Q6lbQ>
 <xmx:OG4IX6G5gAvJyVvm5Yr_HfZQlOVZw7M6PBRv0BJ0bv3RfFqeFkqItw>
 <xmx:OW4IX5AgsgrXkyYVsy0F8vhrl6vhG_xLu8jxnDtpzrxyWxvVtEqWtw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4C0A3E00C9; Fri, 10 Jul 2020 09:33:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-613-g8a73ad6-fm-20200709.001-g8a73ad6e
Mime-Version: 1.0
Message-Id: <6b5b5ea6-9fae-4e03-892f-e576845db165@beta.fastmail.com>
In-Reply-To: <20200710131345.GI3922@heinlein>
References: <20200709194113.12119-1-eajames@linux.ibm.com>
 <20200710131345.GI3922@heinlein>
Date: Fri, 10 Jul 2020 23:03:24 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>,
 "Eddie James" <eajames@linux.ibm.com>
Subject: Re: [PATCH linux dev-5.7 v2 0/2] clk: Aspeed: Fix eMMC clock speeds
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



On Fri, 10 Jul 2020, at 22:43, Patrick Williams wrote:
> Hi Eddie,
> 
> On Thu, Jul 09, 2020 at 02:41:11PM -0500, Eddie James wrote:
> > There were two problems affecting clock speeds to the eMMC chip. Firstly, the
> > AST2600 clock was not muxed correctly to be derived from the MPLL. Secondly,
> > the SDHCI clock control divider was not calculated correctly. This series
> > addresses these problems.
> 
> Do either of these affect the AST2500?  It looks like maybe the sdhci
> one would affect both?

Yes, the SDHCI patch is a fix for the 2400, 2500 and 2600.
