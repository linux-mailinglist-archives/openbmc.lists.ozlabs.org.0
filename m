Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C0ABD663
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 04:33:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dMYm2fHKzDqg8
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 12:33:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="abP3O6Ap"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="MXgtemJR"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dMXz2YyfzDqf2
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 12:32:50 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D195C21F82;
 Tue, 24 Sep 2019 22:32:46 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 24 Sep 2019 22:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=ws8URWEMavzr/kDeyN2oZMikWmRq6j2
 xLzsChN/5npY=; b=abP3O6ApgOv2Wp7z77OCADObuAD9vRs+ACte0HHMgNjchn0
 f975kZ/isTzvc1++MbLLr7WHlIJCbIyrd5svwOZeGPoANBZPS2ibSFiJAuJy4Lup
 nQPv/SizgN67Pf7+MGXYdfWWjX7Zzx68sYTD8Qdd1aw/jweG3wZrWYPgU1xS0rh6
 3ZXb2ZHmMCOTTckksVLbGdPeJB3pSVEq+CY97DfYRnJSSAAYRK/+Z8cLlsI1i1Fh
 5l/7Rz55sPtsg6FklJZkgGkPwy8lNtKEdBR8LxiAMgLfgxCWmxDK84q2uvi5Bi1u
 OTh19/uZ92w6g1TyAtZThqPttn5aK4z4cb88sVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ws8URW
 EMavzr/kDeyN2oZMikWmRq6j2xLzsChN/5npY=; b=MXgtemJR5KQbSE4G5HMTv2
 2IrD32sK5E8HwCvJj1HDrFRgBQcn7Av/olVVXZQlk5EAbq7FLSilVqzbao03QFi7
 GIZlrDMLdosQdvQEZCOMgS+VNTreGzW5RN8XvUh/HG989Nrf5K3rwqH204snDrJz
 R/IHCU3acH9XtQAlq/UADftKl/rJ93qbjvv4r51ut4lGe5S629TGlBD71+s0tOQx
 K1N64V0p5BCv5LAe1ZjyEefIHyeCK7rWxrL/5q3k6Z0LY9q3DhBrz2gCvR9orjG0
 +RrWbSOEQCUi2yxqsGRHPhuM/FkvXXt5pJuRvtIevvmNGeWjtWpY5JA+lDjtu9SA
 ==
X-ME-Sender: <xms:zdGKXcqPKwECkfHRu3mOAQZvnSU9CKnu-SNEzgkCrtBF5fW89x4fmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedugdeiudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:zdGKXa4PWDBkvnS9MM5vHF4UHun2Rp85YZND71pTpWiigRy5NluJWw>
 <xmx:zdGKXfBjZ5M4NHWgUdUsRftS2iHUIr0hJFZM7XpiwuDm302OmQwiJA>
 <xmx:zdGKXY1x6DzHyzfvKCqVH0_U-yfnagQt2ZoE-i2saPI0qdO5LqU9Xg>
 <xmx:ztGKXVpXMbER8Zp3a1mqb1Vra9kbnDl96bcAdfqsJdpM3gWWcObxWQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CE2DFE00AF; Tue, 24 Sep 2019 22:32:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-305-g4111847-fmstable-20190924v1
Mime-Version: 1.0
Message-Id: <45f8eaa8-16d6-4d93-860e-d4a4f276fb2f@www.fastmail.com>
In-Reply-To: <OF8E85BC76.E8ACCE72-ON0025847F.0080A7C2-0025847F.0080A7CA@notes.na.collabserv.com>
References: <20190924194759.26854-2-bradleyb@fuzziesquirrel.com>
 <20190924194759.26854-1-bradleyb@fuzziesquirrel.com>
 <OF8E85BC76.E8ACCE72-ON0025847F.0080A7C2-0025847F.0080A7CA@notes.na.collabserv.com>
Date: Wed, 25 Sep 2019 12:03:18 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Milton Miller II" <miltonm@us.ibm.com>,
 "Brad Bishop" <bradleyb@fuzziesquirrel.com>
Subject: =?UTF-8?Q?Re:__[PATCH_v3_linux_dev-5.3_01/10]_dt-bindings:_aspeed-lpc:_A?=
 =?UTF-8?Q?dd_G6_compatible_strings?=
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

On Wed, 25 Sep 2019, at 08:55, Milton Miller II wrote:
> 
> On 09/24/2019 at 02:48PM in some timezone,  Brad Bishop wrote:
> >Assume everyhing is the same as the AST2500 since the AST2600
> >datasheet
> >indicates the same register set behind the LPC controller address
> >space.
> 
> Can we drop everything upto and including since?

I've confirmed with ASPEED that the LPC controller in the 2600 is the
same as the 2500. So we could reword this to remove all doubt.

Andrew
