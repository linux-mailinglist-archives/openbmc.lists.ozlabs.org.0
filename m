Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EFB697989
	for <lists+openbmc@lfdr.de>; Wed, 15 Feb 2023 11:08:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGv1H4GLHz3cNb
	for <lists+openbmc@lfdr.de>; Wed, 15 Feb 2023 21:08:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Bt7T6qqk;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Je1/tWD0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Bt7T6qqk;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Je1/tWD0;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGv0b4HNLz3bck
	for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2023 21:08:14 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 112D35C0109;
	Wed, 15 Feb 2023 05:08:10 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 15 Feb 2023 05:08:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1676455690; x=1676542090; bh=kWKcVh77gL
	JCUhZuCa+WynI5AAVboSYj3Oe09BQDl0U=; b=Bt7T6qqkwn8XU9cW/mlPPWH5BI
	ku+K9r4B/Q9RUBdJtYb9WSJ2Zpji5RI/dhywPv9+xz0uqIecENsAhstgvYe3ViAe
	dMtAcMmbzL4iNyN6KgR2bGGzHdtWxIwJ/an7o5Jsq3A6+OhRcOap1aS9Md087vx3
	AUeIlv4+myzNoMxLldlHo7rcgt1UVyDpf0o58VVEgcmC7y0ej3/7VCf5HzEIoB1f
	l7Ozxy9UC+93DV2+E0faHepS1e4gFWAFGRKH9rZFC8lVYK7ely4d1Pkm8T0+XRRQ
	2YVunY9xDqHdt2bg23VRHjQbPxHlZYz3+qUBuZPip17TTzUBvI5LmOk5a5Ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1676455690; x=1676542090; bh=kWKcVh77gLJCUhZuCa+WynI5AAVb
	oSYj3Oe09BQDl0U=; b=Je1/tWD05vqtWnSTtg3NLoPRKUx3oKEPByi19pFs92lp
	/5nyPHpQtzJd88KRqK1E2y+La+SvfE+dzUd5yi05fWeU6RT69jlEtAt4x1/s8/Lc
	AKSTwDBFhmzUGLPT3ZnhZfGzKWrT1tZQaZ+/qDgp2v2W62XsalDiPyEQkbibzh0P
	YWPrjq0Ek5nsvQjcW5jkUwnDhhVka5nrcoIphhGb8cL8wCUjPm54ztxzO/pKT2jj
	fcXD9cKi/dgY3QsWUFjWMIT5WjJsHBqcccinmSepzAYbX/LWNDvKYCB4hWLjnlq2
	EoCRlDyU0hW/DzRPmeC21UhD8+Qx4X2j+Ee2MWg7uA==
X-ME-Sender: <xms:Ca_sYwj6243aaaFewEIkV7j6oDonohgF3wArjnJZw79rONDJPNjjHw>
    <xme:Ca_sY5DBosDA5DvPLiAv00BIKZnS6ADCRW5FJMKQjm0O0xoZ0A-SoyK2Im-wVHHP9
    XfJOqogqq8nCyj_ips>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeihedgtdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepleffheffveevkeegffefffdviefgffeghffhudevteevfefgtedujeefuefg
    gfejnecuffhomhgrihhnpehlihhnuhigrdhorhhgrdhukhenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Ca_sY4EiVIfc_Fc8C7HCeMLhpDtHXpfcEkzZfYSZMd7aSG6d5f5Rrw>
    <xmx:Ca_sYxQDoifIb1cp4TMuxZKd0LN_xZVi9DugV2FnkqBWvlrmY-Tb1Q>
    <xmx:Ca_sY9wLc9mJxw8QhEduakiHsu3PjaIJBy30q4JoEhm63sCBzAWfVw>
    <xmx:Cq_sY9icOGg888G4FeLyVEIj4TX1fqCoM0id8lCphCeTo61Ycjokaw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 475F7B60086; Wed, 15 Feb 2023 05:08:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <6a5e9a2b-46df-4717-8f4c-aac14d06d773@app.fastmail.com>
In-Reply-To: <20230215023706.19453-1-zev@bewilderbeest.net>
References: <20230215023706.19453-1-zev@bewilderbeest.net>
Date: Wed, 15 Feb 2023 11:07:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zev Weiss" <zev@bewilderbeest.net>, linux-arm-kernel@lists.infradead.org,
 kasan-dev@googlegroups.com
Subject: Re: [PATCH] ARM: uaccess: Fix KASAN false-positives
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
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Stafford Horne <shorne@gmail.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Sam Ravnborg <sam@ravnborg.org>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 15, 2023, at 03:37, Zev Weiss wrote:
> From: Andrew Jeffery <andrew@aj.id.au>
>
> __copy_to_user_memcpy() and __clear_user_memset() had been calling
> memcpy() and memset() respectively, leading to false-positive KASAN
> reports when starting userspace:
>
>     [   10.707901] Run /init as init process
>     [   10.731892] process '/bin/busybox' started with executable stack
>     [   10.745234] 
> ==================================================================
>     [   10.745796] BUG: KASAN: user-memory-access in 
> __clear_user_memset+0x258/0x3ac
>     [   10.747260] Write of size 2687 at addr 000de581 by task init/1
>
> Use __memcpy() and __memset() instead to allow userspace access, which
> is of course the intent of these functions.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Looks good to me. I've added it to my randconfig build tree to
see if there are any build time regressions in odd configurations.
If you don't hear back from me until tomorrow, please add this to
Russell's patch system at 

https://www.arm.linux.org.uk/developer/patches/info.php

with my

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
