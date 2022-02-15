Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EED504B5EFE
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 01:22:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyMHb3z1xz3c9d
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 11:22:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=rfL+es+E;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ip6pOkms;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=rfL+es+E; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Ip6pOkms; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyMH61gP1z3bPK
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 11:22:25 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 20FC15C0150;
 Mon, 14 Feb 2022 19:22:22 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Mon, 14 Feb 2022 19:22:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=M25in/gavSIeq8fWqD2uTQ9eppqmpI702EHtZa
 gaX7w=; b=rfL+es+E2Aej5JgzrFdfEaeF6/S/6FLuePSv0MWVB5eXRINeUbl15j
 MThChnvK7MCgQSHH4Jz/YVA5fuGsrWPFS5m/vAYD+vG/FNSiMl4o09Xt37tBVJeY
 viKKoy83SiuTZB/+Hr4NjdGiOmDifYwikPZvjq2Jtq6UScAKsASIIS3afjCrbUlD
 UW1I/rKCCd1lQQ6kwglhfAo5IKoW9Q7xte178uKf701FkOFSwkinNudJkXcxIz7l
 FxsltzAMCKcI2LEttIxp5U2MhzehzzZF996q0q3l47AJYj6op+/SOFo4tSKIZh1q
 8CwwCp5rSs+XmBGF0DX4yipBsjDJKHWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=M25in/gavSIeq8fWq
 D2uTQ9eppqmpI702EHtZagaX7w=; b=Ip6pOkmsXfhhCjRF+d1UJMhdn2tk/chL+
 L/VH3UKC5kllBUHlfxObXhk+4CzCZI6Fw7b0EnCITJc57Uru+wq4jC6v/Ie6RTyL
 zB0N3CdXaUMFZZpl+qoSD0phsKoyTutFht4U4ykTf7nHchmfpdA6iZJxysbeItVI
 8XacYh2qgxtBx3e/1HxxbzTNAk94et1oVECyKP5Zp4uxf/3MaKMkW58jpJ9kUwgz
 KeqhvjI/XG5n0sUzg/8LxX7IsoFbjzE5njh2QgupGhD7ZjLfMFJTVkbCKKs1aE/p
 FJQc6aWAhu4IprTghR55lq1suErWOF4LnK9ORehXg7XgYDuDey76Q==
X-ME-Sender: <xms:PPIKYhvgisrg6X3YUft3hXQqe5k0gXiBlN5ttzL7oJC4Tc_zaufd4g>
 <xme:PPIKYqfJU00iiuhr4HqF2oROffV4A5Q8r9Nll0D_6xZFZM8UrxjFyIyMCMbdeSo6r
 w-1BQACipaFVek-Qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeefgddvudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:PPIKYkw-LeOqUVFgHU72YtWEkcBCrgA32dtVbYJsgks7a-HZ0DK5IQ>
 <xmx:PPIKYoM6L_uB7yv3TU7sNgqfkaEY8oomUtWzKp0iO2WbEbjcexltQQ>
 <xmx:PPIKYh9gtShsv5c-z-hQIGaViHkqoRs1HU3Q3qbLgEW_32n7zT6D2w>
 <xmx:PvIKYkkU1OHY2A_ye7GbxQKiRMqwNUZbymXMrAECryU4vOdq6uZvoQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BCD3F1920083; Mon, 14 Feb 2022 19:22:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4748-g31a5b5f50e-fm-cal2020-20220204.001-g31a5b5f5
Mime-Version: 1.0
Message-Id: <670c3952-ec96-43a8-b7a7-0ce41c42ea6b@www.fastmail.com>
In-Reply-To: <YgriLTCF5hvtPCMm@heinlein>
References: <20220131034147.106415-1-andrew@aj.id.au>
 <97430094-7d2a-432b-a121-96812fac87f9@gmail.com>
 <cf36daed-852b-4c72-b2f3-febf7fd3f802@www.fastmail.com>
 <e44df5b3-a338-3cd5-5399-6b5cbf55f5c9@linux.microsoft.com>
 <YgriLTCF5hvtPCMm@heinlein>
Date: Tue, 15 Feb 2022 10:51:42 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>,
 "Dhananjay Phadke" <dphadke@linux.microsoft.com>
Subject: Re: [PATCH] image: Control FIT signature verification at runtime
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
Cc: Christopher J Engel <cjengel@us.ibm.com>, openbmc@lists.ozlabs.org,
 U-Boot-Denx <u-boot@lists.denx.de>, "Alex G." <mr.nuke.me@gmail.com>,
 Simon Glass <sjg@chromium.org>, "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 15 Feb 2022, at 09:43, Patrick Williams wrote:
> On Mon, Feb 14, 2022 at 11:14:53AM -0800, Dhananjay Phadke wrote:
>> On 2/13/2022 5:13 PM, Andrew Jeffery wrote:
>> 
>> We can decouple HW RoT and runtime control on enforcing secure boot
>> (requiring one or keys) on FIT image. Conflating two raises lot of
>> questions.
>
> I won't claim to be a security expert but I don't understand this statement.
> What are the "lots of questions" that are raised?

I was trying to avoid derailing the review with this, but here we are.

I have the same question as Patrick. What are your concerns here?

>> > 
>> > With that in mind:
>> > 
>> > To escape the manufacturer's key-chain for owner-controlled signatures
>> > the concept is the manufacturer-signed SPL (or u-boot payload) will load
>> > keys from an external, write-protected EEPROM. These keys are used to
>> > verify the next element of the boot process, providing user control.
>> > 
>> > To configure owner-controlled keys the EEPROM write-protect must be
>> > disabled. This may, for example, be done via a physical jumper. If left
>> > with write-protection disabled the matching public key for the signature
>> > on the payload can arbitrarily be installed into the EEPROM which makes
>> > secure-boot verification moot. The patch avoids the run-around in this
>> > last behaviour by providing a platform hook to read the state of what is
>> > effectively the EEPROM write-protect pin.
>
> Isn't this jumper proposal just like the TCG Physical Presence requirements?
> This is a software implementation and requires a particular hardware design for
> it to be done right, but it seems to be along the same lines.

Possibly. I'll defer to Chris on that.

Andrew
