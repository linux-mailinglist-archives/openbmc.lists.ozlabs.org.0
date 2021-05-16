Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2638B382202
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 01:16:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fjynq13C5z2yZR
	for <lists+openbmc@lfdr.de>; Mon, 17 May 2021 09:16:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=PpXW1IAx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=UQA2iQRx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=PpXW1IAx; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=UQA2iQRx; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FjynT3Wtdz2xvL
 for <openbmc@lists.ozlabs.org>; Mon, 17 May 2021 09:16:28 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5EEE18E8;
 Sun, 16 May 2021 19:16:24 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 16 May 2021 19:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=NFIPV
 4RTOS/ELQ/HEnbhWCiXV3avQpLcT0yi9VWrbIw=; b=PpXW1IAxGybF6EPkOB11R
 Zm4xrYJmuwTyPCF9w45y/qlm8CVEGhMJdVIFsH/ZYTfJWb+BZ6QwJhj/jYRkowQn
 bWnp37Oeh/YwZWxzW9PBDb5LbsF8WxsJp48BZLL+2mNo0MhIT6UuMY19dUQzKwXE
 BIi5swTrW7xzsMcs7CRBciy/VDW1iWTwXRvSF/LDhx40PUQsYtOVPp3bxj6h0c33
 no03V9+818oROPWMDg4NYkixSHeGn4FJJW4TzZ3wCuGKT6KsOD8i1eLP3q3aIfxk
 0O3L6eJtKlNXRMfWZCu22JFMyAqzxwSx4r3QxrAj2b2T++rsAFnjyto1U3aQ9aaV
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=NFIPV4RTOS/ELQ/HEnbhWCiXV3avQpLcT0yi9VWrb
 Iw=; b=UQA2iQRx0KoBBTnZ183xfYWE/2OLuIx+Um2HIRwCPd2FtOfgsAb3//HKF
 BS/zRhdk1ked1gyE7yiL/KYiRXaCL9ATUYJQhuI2znDXfD23Z6K5f7rurBqJz4h2
 YP85x5GAiaiMkjM2FkZue7WFKZNUrr2sL/L8jEPp4CVyaRJHBnfeh+geLafVrJZ5
 v7gJ6RGAL5SrM47B7qU7jcbVxRNGKAdCZJ80jRqqmO/2FxxM1B2czna7Js3oej8f
 Y/9VccMsH7md5uh9buzIubBMfiwYW/kpuqR0T7dgry9SXKpM+PAdAtKmaIe0cjaX
 DFg/xzNIE08LwH6jXRK9OeKMF4hMw==
X-ME-Sender: <xms:x6ehYKGPBpYbAp2XWKW-4IQ_9fpHbBpseAxvR9ap9u4ne_oCq1Hn0Q>
 <xme:x6ehYLXpNxT7PUrT30_yRX8QUCZIQHVhEo0i-DGcD_XOwQszXf_PmCK4cmJmN466b
 sxByB9uxsXVyosdTQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeigedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpedvgeekheegfedvhfethefhudetteegueeggfeiieegueehkedugedt
 kefglefgheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:x6ehYEJ4AzhrtCOcxo8jDliPHXCtRJ92vlRBaVb2CEp25GY7GBoElg>
 <xmx:x6ehYEHsQFWrHjSDy0laIWf1gqTA4U7I2O0hZ-7n6_giGTPPM3_iwQ>
 <xmx:x6ehYAXCFgf-83oWW2qwWn9adqx-Tk6F8p46NOTXrEZAjlOnuE5PKA>
 <xmx:yKehYDC-Sfc44mzw7ub0CYNGUdoiy42GRFXZSSM6yMUgqxClCaOv2Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 675BAA00079; Sun, 16 May 2021 19:16:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <464e2eba-c3bb-421f-b336-e50941ff5cd9@www.fastmail.com>
In-Reply-To: <9f59a396-7a97-71b1-8cba-210545b0b023@linux.ibm.com>
References: <35156c27-e195-c238-1bb9-d20a30db3c63@linux.ibm.com>
 <8febdc9d-08bb-4094-9cad-7e6035c5bd71@linux.ibm.com>
 <99f4fa9d-9fc2-4092-be1f-d3246379206a@www.fastmail.com>
 <9f59a396-7a97-71b1-8cba-210545b0b023@linux.ibm.com>
Date: Mon, 17 May 2021 08:45:55 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: Security Working Group - Wednesday May 12 - results
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Sat, 15 May 2021, at 04:32, Joseph Reynolds wrote:

> In general, it is hard to know who to contact.=C2=A0=20

I think it deserves some effort, no? Talking in abstractions doesn't=20
help as we're not discussing the abstract but specific patches, some of=20=

which you've left a comment against.

Equivalently, saying "In general, it is hard to build secure systems"=20=

and then not putting in any further effort as a consequence isn't=20
acceptable - we need to do the work; narrow the statement from the=20
abstract to the specific do our best to mitigate risks. That same=20
strategy of narrowing the abstract to the specific applies here.

Given you've already commented on one of the patches I don't think it's=20=

a big leap to look at who the author is and include them on related=20
discussions in other mediums.

So anyway, I think this open source process works best if we recognise=20=

that resolving issues requires bringing people together, and not=20
treating the work as some kind of abstract process. I feel like=20
broadcasting (1-to-many) the minutes here without including the people=20=

impacted by the discussion creates a separation. Let's put the effort=20=

in to bring the right people into discussions from the outset.

> Note=20
> that I am following up on this item privately through other channels.=C2=
=A0

Okay, hopefully I'm included on those discussions too.
=20
> Finally, during the meeting, I encouraged attendees to make comments i=
n=20
> the relevant gerrit review process.

Great! I hope we can capture the concrete concerns in the patch=20
comments and work to resolve them.

Andrew
