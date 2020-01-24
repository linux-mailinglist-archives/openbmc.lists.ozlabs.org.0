Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 028CD147549
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 01:12:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483fhm3gtrzDqbv
	for <lists+openbmc@lfdr.de>; Fri, 24 Jan 2020 11:12:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=akn7Mw2c; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Pnloxcf6; 
 dkim-atps=neutral
X-Greylist: delayed 552 seconds by postgrey-1.36 at bilbo;
 Fri, 24 Jan 2020 11:11:09 AEDT
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483fgd3Z3TzDqZR
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jan 2020 11:11:09 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6CE7A5320;
 Thu, 23 Jan 2020 19:01:52 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 23 Jan 2020 19:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=d+Z+lRDYQ/W7oZGZYumKD/oOi9irKSG
 dCEoUinh8nf4=; b=akn7Mw2cYLTiNi7myRpKCK5NSXpmWiZLpHogjGFIsXSAZe+
 +4FMSVFBbnrJjua/GuzvAz/j2AATo1DTwX/lqtn8B2X7mhofEZae9nLLlS4tD5qY
 rKKE/481DLkrGj2VbTKENBWCVa62W/uPgC85XtClyjI8U7w34iCxifwRsa9iXC5R
 53WWA9KapVNo+xjKOvXn7qfRMaLJllyoI5645Y7AtzwKMjh+kEGLkw2VOfwkkRys
 krl3BaT262tF66rntd3tUlB1rXAJWggK02nzFoNGtpQZRAUEWuoXeDkIBMFasuZG
 1oM6fBnoh/Q3VXZ0KWJeviHaWAmfZZrHyK+EK1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=d+Z+lR
 DYQ/W7oZGZYumKD/oOi9irKSGdCEoUinh8nf4=; b=Pnloxcf61F/oWAq/EcjBsI
 d+OYokWefGcd/06Mku4YDBN9lkw+afK8wtCALzcGIZN3QWZ4mHWOCS4sydr8cs6S
 oapXoSDWW0YkYoNv9lz20Rz/fjJkdqjV3xGnM0+pBoauN/VFXRcF+IddhJubozjj
 LxuXYaGbMopJeJU9oy8PTGAGrCfMDTqqtPHSkVHzQ5ZmvBiy1oEMtyn+65ZoREMu
 ICJUlDaY1xm7NDdNPdWqYQIU8QoYZJZCoLkrx+xc6paB9c53wnx+kCEs5BFR95HW
 FMTRLSqxDokjZB/8U+1bC+gBvXScqJaFODxooAiL1Wd0pMDxOWgM54Zik8EOS0xg
 ==
X-ME-Sender: <xms:7zMqXk_FlYCU5KicE-kJMrxK-9FxmSihK9HomFxVaHUx-Unj3z7fDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvdefgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:7zMqXn1fSD2EQ_b_lEI7ZFAnibLg-os68L9a5wX-IsFBROhBvaXvFQ>
 <xmx:7zMqXpY6sN8zAO06Q9OhPm55LVgrcHxIINw7cDD74IVo0ClkAhH9KA>
 <xmx:7zMqXjukhZ88lvksiO6kTNAnaLKgpQ3uM0woayjYr-3sT-eLVs_HXw>
 <xmx:8DMqXkk_zP_bR8ts8WK4mvZlAsia1fN9rel87NvpbIzqJlK0YitjZw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 25625E00A2; Thu, 23 Jan 2020 19:01:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-777-gdb93371-fmstable-20200123v1
Mime-Version: 1.0
Message-Id: <1c13de6c-3bee-4afc-8a03-691222b07ebe@www.fastmail.com>
In-Reply-To: <20200123085112.8371-1-pengms1@lenovo.com>
References: <20200123085112.8371-1-pengms1@lenovo.com>
Date: Fri, 24 Jan 2020 10:31:30 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Andrew Peng" <pengms1@lenovo.com>,
 "Benjamin Fair" <benjaminfair@google.com>, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, mark.rutland@arm.com,
 "Rob Herring" <robh+dt@kernel.org>
Subject: Re: [PATCH v2] ARM: dts: aspeed: update Hr855xg2 device tree
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
Cc: openbmc@lists.ozlabs.org, Harry Sung1 <hsung1@lenovo.com>,
 Derek Lin <dlin23@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 23 Jan 2020, at 19:21, Andrew Peng wrote:
> Update i2c aliases.
> Change flash_memory mapping address and size.
> Add in a gpio-keys section.
> Add in a peci0 section.
> Update i2c0,i2c0 and i2c11 section.
> Enable vhub, vuart, spi1 and spi2.
> Remove gpio from gpio section since it controlled by user space.

These seem like largely independent items. I'd prefer that you have
one commit for each item in the list, that way it's easier to review
and understand the relationships between the bits of affected code.
Basically, don't give people reasons to say no to your patches :) The
smaller and more coherent the change, the easier it is to give it a
Reviewed-by or Acked-by tag.

Also commit messages should say _why_ you're making the changes
not _what_ changes you're making. The diff tells us _what_, but nothing
besides comments and the commit message can tell us why. It's much
more convincing if you explain why your patch must be applied.

Andrew
