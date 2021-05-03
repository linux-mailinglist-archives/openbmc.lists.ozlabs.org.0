Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3533716A8
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 16:34:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYlpp496Dz3021
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 00:34:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=rr3SrQu+;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=gZEL5xaK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=rr3SrQu+; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=gZEL5xaK; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYlpV1TQHz2xYg
 for <openbmc@lists.ozlabs.org>; Tue,  4 May 2021 00:33:53 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 24A961800;
 Mon,  3 May 2021 10:33:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 03 May 2021 10:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm2; bh=nsy
 oOrEOPyeQLYQoxNPzCdCorB7Ai7w0cr6K7aMxR3A=; b=rr3SrQu+b9pLTYhTQaH
 Uc4ri7amMoP9MsjQLRe7NQ7csCbU0NgOpUWE1O9XpuxwTUWPog9we8Le9Ea/1FSJ
 nu9kSY3zLaX//e86Uee/9+bAzTOCsxLbDTtCdmG1CBF8qRKnM9/28tUh6BCHKjnU
 YQbRaNUnlXYfw0LIepcTmPvPG8iWYbNDIxRavISmjGn0ujKHENkFrTEcwfu1RpwQ
 cS4D6Xp+IDrOck9S6yqHXKfw+gRcjGdk4IiVqsY5YHJu7ixWuxuuUFAIgPr4GzIJ
 8SRtOeHEAjewL9tywGdLCx7NsKGnVNThb0JcNk07sKP2RQ2fCUtrHyJYrAMEbAyF
 oKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=nsyoOr
 EOPyeQLYQoxNPzCdCorB7Ai7w0cr6K7aMxR3A=; b=gZEL5xaKiZrdmPDtAL6fgO
 0+oO1f3sgH2gnOewmHm51dNOcfk7SS8uL5vOwGMFz0DuR/bd6o/Y5FtY/LDPhu3a
 I9xScw8GqksZ8b2rIcw1Ujqj3xCoyDEQ2dKJi2yKQ98VYv/WCskx2R+Do/FvqKLO
 iyjj15n5EsBT/mSipiuXF4cBQXADiV0HwrVTrT+OwuDswSgClE6+otoGdEmxpq8N
 UAZm2FiOazmvbgSmcq82TTdlZcB7FUfN0hMu5Ib8cMzBfjT9XnBe5UHKTCbTGf/c
 coSgTLpTfRDN8jxnjCn2SjzBm6FO0gG67MuhxsGE226bWueU4trweQ2xDr+reIaA
 ==
X-ME-Sender: <xms:zQmQYIxOGXsquCK0Z3Sp9h5184qslpbYgiTYwYuzLpjgm7QAD9Zgwg>
 <xme:zQmQYMRVXj9l979uhfsF4ApwUzPr01kFaZip1VpwW0cniPaUqQRlUSVZcsoVC-TKw
 TE2u8V8nDk5-H9s8bM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecukfhppedujeefrdduieejrdefuddrudeljeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsges
 fhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:zQmQYKX0SLyBoRZ7Pr2d2-cRExXl8v_EJuGPO-8ZEh52J9ZKg2CofA>
 <xmx:zQmQYGjU25lDWNtxTyoYq1J40K-2vVkjZsSnO8gXZfuB2jfXJL7i2w>
 <xmx:zQmQYKCkkj8JgAtFMYom5e8AmINIYJB5UQEsqQPavxTD7Q3k2H7VBQ>
 <xmx:zQmQYB_9hVMytLpIKoF5pKr2UT7ckYvwDQ3gL2bpi1lDa0HbSOOWGQ>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon,  3 May 2021 10:33:49 -0400 (EDT)
Date: Mon, 3 May 2021 10:33:47 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Thang Nguyen <thang@os.amperecomputing.com>
Subject: Re: Request to create ampere-platform-mgmt and ampere-ipmi-oem repos
Message-ID: <20210503143347.gncdsonvtqzpfmdo@thinkpad.fuzziesquirrel.com>
References: <38d1440f-b3be-9147-5002-42536117e1e0@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <38d1440f-b3be-9147-5002-42536117e1e0@os.amperecomputing.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Apr 16, 2021 at 09:05:36AM +0700, Thang Nguyen wrote:
>Hi Brad,
>
>Can you help create 2 new repositories for Ampere specific codes:
>
>- ampere-platform-mgmt: contains codes for Ampere specific 
>applications to monitor and control Ampere's Host like RAS error 
>handling, Temp event, ...
>
>- ampere-ipmi-oem: contains codes for Ampere specific IPMI command support.

ampere-ipmi-oem is ready for your use.

thx - brad
