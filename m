Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B9C2EB78F
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 02:22:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9Wn4744XzDqfY
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 12:22:16 +1100 (AEDT)
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
 header.s=fm1 header.b=MzXCfpoi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=piMuLF6f; 
 dkim-atps=neutral
X-Greylist: delayed 503 seconds by postgrey-1.36 at bilbo;
 Wed, 06 Jan 2021 12:21:18 AEDT
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9Wly5LHNzDqZS
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 12:21:18 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 50F71139C
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2021 20:12:49 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 05 Jan 2021 20:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=CXESqvaosX0aMHTWTiAkiDRMcIlTy1k
 ce5lVwUK4m34=; b=MzXCfpoiRBCyAV08wxbdX4/wS/3LaXgYfRlizZjmknnOWtc
 hqTjYQhTR9SqMGHf++/MJ8TCPjs10Dq6zuwlAqn48PuYSV8BxZdzRbI62B3NiXvm
 GlhUiCY5n0WrvGc01xC/Sfp7SYcwCkCaIL2Ljkdkw7nmyRYZOcMaLGWKwsnTi2U2
 XeagHnlG3ZEOQFPEE2wTNoPsP81SS19vLMr652muEXpdP/Sikzysf+xQBNVdQimA
 IGZyYopOhbHVHmwmkK9p/EQ0gsBglNF8fsKgIrkwekgNkDtpkNHs1mrhgvKYeVLB
 GhkHHNY12Tcd/LliKp1VIfL2gkaR2PQ7k1mvlpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=CXESqv
 aosX0aMHTWTiAkiDRMcIlTy1kce5lVwUK4m34=; b=piMuLF6fYWvwRxtdRyn7Qu
 /soulb+Rob/kRiQWhLXrIDreX7ei7sMELrZkOug3w9D7F9vcmUXHMoiKtiv1KFgF
 Evt6JU8GLfqiPgs5pD06m6REPost3my7VIFxoVVSriqG1djEVIui5UQTfprZ4q98
 3OcPqU2xkF6liR44RCUpN8vEX/ClbbKC465EOfArslhQ/DiwKazlVCxsyJUGE1i+
 Exfh8jYBhiZhXnDrfykU0oqf3/SBLdHOjXDaiuSMK8RZMFab8+TIXyCiyOZfs5b5
 QaWAVYC3NS2vspj8OarIksUxa3or+3dQAapuHdXJvRj9iW6h3VJWEjBzsIQKEBfA
 ==
X-ME-Sender: <xms:kA71X1w4sTL-7lPSQ2azEd5DvOPqiCPaF9zXo3GuHiOiXdBw9EiXPA>
 <xme:kA71X1TD3dKON4M2WjYjIUMdcpx3PLCVxVdCCsOEeLykDyYxQGbxYv6BKBrnt9Y0O
 ytGx9qmaSiCBCQO-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefkedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeehhfefkefgkeduveehffehie
 ehudejfeejveejfedugfefuedtuedvhefhveeuffenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:kA71X_X6uebuEsQruF2NI4qVvUbCR2mV-FQOwEttXOR0ZLd4zbNHJg>
 <xmx:kA71X3hkZ2lW0CpS9Nk2MWKBtlvaxsssN1bSIvHav0ItsvvT9BRTMg>
 <xmx:kA71X3BbLbBPIyhECg3Y-WgVRFB3YhgFKr-KaQ0TpXVDSHJdfpKUoA>
 <xmx:kA71X6PSdXBMqcIVyW6JTycIHBJu0Y68IoP15l0sxpw56hQB1SQlzg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A057FE00E3; Tue,  5 Jan 2021 20:12:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <0ff1c69a-a6c8-462e-86d4-a08d981b80d2@beta.fastmail.com>
In-Reply-To: <6ab96a24-70b6-c6a0-39f4-ab1d439aca9c@amperemail.onmicrosoft.com>
References: <6ab96a24-70b6-c6a0-39f4-ab1d439aca9c@amperemail.onmicrosoft.com>
Date: Wed, 06 Jan 2021 11:42:26 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: Re: GPIO pin is reset to default value after release.
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



On Wed, 6 Jan 2021, at 02:57, Thu Nguyen wrote:
> Hi,
> 
> 
> Current I'm using two difference GPIO libs gpiod and gpioplus to setting 
> GPIO pins.
> 
> I can set the GPIO pin to expected value in a service. And GPIO keep 
> unchanging when the service is running.
> 
> But when the service is exited, the GPIO handler is released then GPIO 
> is reset to default value.
> 
> 
> Do we have any gpio lib which don't reset the GPIO when the handler is 
> released?

No. This is a property of the GPIO chardev interface provided by the kernel. libgpiod makes the kernel interface a bit nicer to consume in user space, but isn't where this behaviour is contracted (i.e. any use of the chardev interface might result in this behaviour, libgpiod or otherwise).

At the moment the way to get the behaviour you desire is to keep the line handle open.

The deprecated approach is to use the sysfs interface instead, but that's strongly discouraged.

That said, your problem is something I have on my to-do list to address with upstream. I'll Cc the openbmc list whenever I get to it.

Cheers,

Andrew
