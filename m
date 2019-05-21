Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 690EF245AA
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 03:36:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457JJN5MxczDqL0
	for <lists+openbmc@lfdr.de>; Tue, 21 May 2019 11:36:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="krkQQ74z"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="jDBoBOYG"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457JHv5jgvzDqH5
 for <openbmc@lists.ozlabs.org>; Tue, 21 May 2019 11:35:55 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 3114D248FB;
 Mon, 20 May 2019 21:35:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 20 May 2019 21:35:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:date:in-reply-to
 :references:content-type:mime-version:content-transfer-encoding;
 s=fm3; bh=LUvCFzr34sc8NLWlZULNtWvNJuxxv5+nvCZf/sUAgXM=; b=krkQQ
 74zCwYShO4Krj1+K0So8ZJSBK6aKFp5wc0v7NAozrqm/3kAAy3yPUxZILIcbc6ol
 oEB92YJsP3XfC4Ysqhut/WuxRKWoTNzFTnZLrttp/qkh3mf4FfeT/Mb7exjyjyex
 1NcAngfB6SFPjOBxchESUurIXW0c81Bl33V8iUsiyH4rKkjsgCKHCi5CXuYs1Tb0
 +EZL5BRa/XrezDHZaTgNPtboyZaZ0T7ZBMGFp3qhIE/90BwQv8LbmeQt2I2jkj2r
 ggkXYSaGoCiOF/Qsqo06Uwhc4j/drOTV/2BNcH7XLsKcrckiCpxv4xqRBJrAJ/tQ
 jGhsseHlt71TIceYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=LUvCFzr34sc8NLWlZULNtWvNJuxxv5+nvCZf/sUAg
 XM=; b=jDBoBOYGpBK/cFSz/72qx7W7mQya0FxYfFJl8HRzq3B+ASl/HwCUNcBY7
 2QM+viahiFSEbS89TyPAEepQ6KwedwX3rZFugQM9ealMmRY6XHsiBVrBLc1+ag1C
 UrWc07Or1YXeMrtUn2qGAb+AlN0hzxWzvobqDFhi2Ze0ssZNBKBMbwKCXqDd10gu
 eoRKn7MkfoRlCXs0HncEWdG5Zs2dNqLY0EVp6Ga73LR/48JtI4cur5JfxLfgOVoF
 HVO5/fKQwADZtCcdcZ3Jsk/mkHq9N/coYF44urcp42uz905BOeZJxi/CX0PFdi2i
 1QLxpdGU0E4lk11gML1Tr5OERYSlw==
X-ME-Sender: <xms:91XjXI6dcMym3pXONbnNBjiszfcRclz-gPKo1ZtZml_TizmScGzMFg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddtledggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepkffuhffvffgjfhgtfggggfesthekredttderjeenucfhrhhomhepufgrmhhu
 vghlucfovghnughoiigrqdflohhnrghsuceoshgrmhesmhgvnhguohiirghjohhnrghsrd
 gtohhmqeenucfkphepuddvvddrleelrdekvddruddtnecurfgrrhgrmhepmhgrihhlfhhr
 ohhmpehsrghmsehmvghnughoiigrjhhonhgrshdrtghomhenucevlhhushhtvghrufhiii
 gvpedt
X-ME-Proxy: <xmx:91XjXHg0HrkXJhF2fqqPdQzY8UprZm3FlxBs5NFkkE4KoryVcL7Gdg>
 <xmx:91XjXNDsFruN21XouWMdhpM0_CqjmMj74tQoQNyUYvEEeGkqJEWk1w>
 <xmx:91XjXAzIIqhqAedQlOJfYMmS_VIrQupPafNgcg8MM7R6dCqDquX7wQ>
 <xmx:-FXjXGwi5fhx-euAkZbkpeK80yqKb1ZS2V0ZZq0eHWxX1qKgk3U4og>
Received: from v4 (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 639E48005A;
 Mon, 20 May 2019 21:35:50 -0400 (EDT)
Message-ID: <5c05ba755f33e8e5fde108f1e3f94509e8a49a01.camel@mendozajonas.com>
Subject: Re: Boot Options - GUI Update
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: Jandra A <jandraara@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 21 May 2019 11:35:45 +1000
In-Reply-To: <CAMTupoSEPYC0bDO3w+yPawcR6-s-EZ59ET-UUWERKrvfyjJkng@mail.gmail.com>
References: <CAMTupoSEPYC0bDO3w+yPawcR6-s-EZ59ET-UUWERKrvfyjJkng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2019-05-20 at 15:51 -0500, Jandra A wrote:

Commenting on some of these from the Petitboot perspective and from existing
BMC's that implement this. I'm assuming based on the terminology that this
is the "boot mode" functionality that implements what are usually called
IPMI boot device overrides - if not nevermind! :)

> QUESTIONS: 
> Does Boot Mode apply to Linux based systems? (SME)

Boot Mode does apply to Linux based systems. I wonder if this was just a confusion of terminology.

> Do we have a way of informing users that a reboot is complete? (SME)
> On the ‘Network’ option in Boot Source, where is the remote source over a network defined? / How is a user informed of it or change it? (SME / user)

If this is referring to forcing booting from the network, then this is
determined by your network environment, not the BMC. (Although you could be
tricky and perform PXE requests to find out what it is).

> What does ‘Default’ refer to in Boot Source? (SME)

I'm assuming this is "no boot mode override", but an OpenBMC person probably
wants to confirm that.

> Still need to understand the value of ‘next boot’ and how it would be used (user)

"Next boot" would be a boot mode override applied only at the next time the
system boots right? Either from a reboot or power on.

> Is 'single user mode' the same as Regular, Safe, or Setup? (SME)

I suspect this is related to the confusion in question 1 - single user mode has
nothing to do with IPMI overrides / "boot mode".

> Should we support boot to PXE? (SME / user)

We already do :)

Cheers,
Sam


