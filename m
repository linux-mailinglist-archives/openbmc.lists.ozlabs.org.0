Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5398C813534
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 16:49:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=pPhCwWxj;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=c4yS8tbE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrcHR0RK0z3cY6
	for <lists+openbmc@lfdr.de>; Fri, 15 Dec 2023 02:49:55 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=pPhCwWxj;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=c4yS8tbE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrcGm3rFXz3bmy
	for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2023 02:49:19 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id ECBA65C01EA;
	Thu, 14 Dec 2023 10:49:15 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 14 Dec 2023 10:49:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1702568955; x=1702655355; bh=rsrWTQjBQT
	0relicSVB/5hAbF9a2jab8bg2oUsSBSH0=; b=pPhCwWxjGRTA+Ledc/1HB99oEb
	8m6nFpU2rW2Noyj3dojFZQxVbpA0DrdpUEPTOEN8DgIrK77y2pQd82YC7pS75xeI
	BX33FP7DLfdxJFGdi5aaD++Ftl1olEcQhZAGMuu7egNySEysrblxu23QpVh47xAn
	xZqh5KMEW6x8kyc4Hf04dSjyaoG8kXzD/fEosNq75ptGk4q01XptqM2eB3eGKoJ0
	jdfee8R4NA/q8h4u9QDnN31s1OW3adPEuUqbThF6CruJ5gGIwfIlei/XPrMs+Zq3
	smRwEyUp+s6lF4mK2jVN/QxzzHYGuLVFwk/onuoPFg5ORxs4EDhP+CvleFOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1702568955; x=1702655355; bh=rsrWTQjBQT0relicSVB/5hAbF9a2
	jab8bg2oUsSBSH0=; b=c4yS8tbEPEwCWwCRUDPNftjnOF78gNL7VN7cHmHXmukZ
	dAcl18nRyV0cJ/yBC8C4x0rD0X0d5iAhmCpKGdTQ4aLeONb9kRnMyndnJ4NG/kTP
	+oP6HoV24kH6wrMPxW2dRi3WMha525Wh2qbbvEYTBYn4r7FjhazNPA7T1TBs2lM9
	Wq4uumy9RAaXqRuFX7hBqslN+eEADuRms/AexDhIxZRUjbdBBh7wqRKRsAgLGRqH
	h28Fh2ZQtVtJ1vj0ZPtItgmnAE5ekXQGiaJ+sww5BaxXopDDN1GD4NqVAk0lYlh9
	KplQnGkgCmU64EXomkFjvE5RPKy68daJEOUlPAYK5A==
X-ME-Sender: <xms:-yN7Za9jQoCeaHiVVCPVOx-5XJBAPjG6qr1e7FOYeaZnVNjTKTJznA>
    <xme:-yN7ZavHHTFLcbp9OUI3VYychZyyzhWxbQCMR4X8ODbG10YP5q6LJPUXy3qtzk-5R
    1ckNyvh_irQOWgX17A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelledgkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepjedvvddvudeludehjeeitdehheeivdejgfelleffiefgvefhhfeuudfhgeef
    feehnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:-yN7ZQD-Ff4o3JfCIel-uzk49qql3Rs1LZ902Bos7sUNcjldKYCJrg>
    <xmx:-yN7ZSeSdF6MY2y9Q-1DWPtZ36dJ1eWSTtojvSZOLGJesJFiC_-wyQ>
    <xmx:-yN7ZfMIKb28qEiuWYvuXiHbVbNfkISfRyxEnPltMd1KmKuA9YeOEA>
    <xmx:-yN7ZdsA6kJMPxgatqIM5Qzl-GYWtph8qh1i0kDuPF3queGrAj1ESQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 15800B6008D; Thu, 14 Dec 2023 10:49:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1283-g327e3ec917-fm-20231207.002-g327e3ec9
MIME-Version: 1.0
Message-Id: <88040035-d971-4012-bb9f-9f2ae91fdc6e@app.fastmail.com>
In-Reply-To:  <CAP6Zq1inLOMHORqO8=RbP6NfwJ63kLaH0G3+TKBhfn0p2CE53w@mail.gmail.com>
References: <20231213190528.3751583-1-tmaimon77@gmail.com>
 <20231213190528.3751583-4-tmaimon77@gmail.com>
 <cf3ce945-2f1c-4dae-86b8-349dae3d962b@app.fastmail.com>
 <CAP6Zq1inLOMHORqO8=RbP6NfwJ63kLaH0G3+TKBhfn0p2CE53w@mail.gmail.com>
Date: Thu, 14 Dec 2023 15:48:55 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tomer Maimon" <tmaimon77@gmail.com>
Subject: Re: [PATCH v3 3/3] soc: nuvoton: add NPCM BPC driver
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
Cc: pmenzel@molgen.mpg.de, Conor Dooley <conor+dt@kernel.org>, benjaminfair@google.com, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, tali.perry1@gmail.com, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 14, 2023, at 14:09, Tomer Maimon wrote:
> On Thu, 14 Dec 2023 at 14:44, Arnd Bergmann <arnd@arndb.de> wrote:
>> >
>> > +config NPCM_BPC
>> > +     tristate "NPCM BIOS Post Code support"
>> > +     depends on (ARCH_NPCM || COMPILE_TEST)
>> > +     help
>> > +       Provides NPCM driver to control the BIOS Post Code
>> > +       interface which allows the BMC to monitor and save
>> > +       the data written by the host to an arbitrary I/O port,
>> > +       the BPC is connected to the host thourgh LPC or eSPI bus.
>> > +
>>
>> This one in particular looks like this might be implemented
>> by more than one BMC type, it's a fairly generic functionality.
>>
>> Have you talked to the other maintainers of SoCs used in
>> OpenBMC about coming up with a common interface?
> Yes, Both Nuvoton and Aspeed use the same user-facing code to manage
> the host snooping.
> https://github.com/openbmc/phosphor-host-postd

Ok, that's good. I found the driver in drivers/soc/aspeed/aspeed-lpc-snoop.c
now and see that the implementation looks very similar. 

I think we should do two things here:

 - split out the common code into a shared module that exports the
   symbols to be used by either one

 - find a better place for both drivers outside of drivers/soc.
   I would suggest drivers/misc/bmc/ but am open to other suggestions.

      Arnd
