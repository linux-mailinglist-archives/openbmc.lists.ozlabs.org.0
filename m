Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E31B94B5E0D
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 00:09:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyKfv0zs6z3bVt
	for <lists+openbmc@lfdr.de>; Tue, 15 Feb 2022 10:09:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=mZ0DzXOa;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ChaYTPoI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=mZ0DzXOa; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ChaYTPoI; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyKfS1FfGz30Dg
 for <openbmc@lists.ozlabs.org>; Tue, 15 Feb 2022 10:09:03 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 35B835C02BF;
 Mon, 14 Feb 2022 18:09:02 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Mon, 14 Feb 2022 18:09:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=Jmnvm22RIqGYuNlr8/etLWJGtsffOGXNbGIjcv
 X+NGY=; b=mZ0DzXOaUGaJfdHr0FpJPnCC+9+GIRRn41WgVCbm7KLEu9jk51OjQ/
 zSI9fpvgrdmRjnovlbrBHLw577DleE1r2ip845f7/BSyHHXFTjs3czJ0xKULxhn+
 1+s+t53e2FxgrZ5jqqmPGnmZlJMke3A1oObh7dLldDfVREykTS9aRtg9ltNflqOU
 KgithS441QNnuhh1PxtelNE6l8cJKN62tKQyqzb2ze6772kKa17cBzQ91KQ3MpAT
 3zdwTLplypLdEul+JJXV/zBhNH2qIK0wvphYiIiGTbVfTNVk8fPkhSEMdRdsewZX
 IAV8JaAnFM/HCPNM2pNVzK+2XH/aUM1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Jmnvm22RIqGYuNlr8
 /etLWJGtsffOGXNbGIjcvX+NGY=; b=ChaYTPoISwBs7ybRhooUEA1NQ8A3kkcth
 VR6c9SwmGGTyTeUlbSMo8rpzmMH9dv5PoEyqaNuzj1tWyGFZU+UPeNe7ojnIPd8Z
 u5QX9N4K2NlzvWaY+uWJTkkwMpaz8+vqyEXgZd5bgBxmpEZyDf23MHUzkfzkwdbI
 RZTVfoUQI12Y9eDiKRTh/obYf9VzK2M+oilVs8butmwTqVvrJXl4KBgG+0KS32IO
 jl/3/4y7dg2RAi+X/cJXpjJl+vFtWtp0iKy05IVIBrdq7LAEX5zW4UFWtRx3mOgX
 3iBgpmWi4eKLxfyZR/D14wisW8fRVxnPSD8P5Swl1FyJUax2Xeuow==
X-ME-Sender: <xms:DeEKYtuxtV5-tv7W5iFqVroubzfNw8xGL1X7AWV3o0hrwGRcTNGtPA>
 <xme:DeEKYmeYAbkcu0xQ16duy_It3KGt5GvLAZ0k1V6GZ48gr7zkpJfKTJjRnavnzOYuu
 cFf9Bf9OY2-oirqHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjeefgddtjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeduffdtvdevkeffgfetffffueevgeejleeghfffjedthedthfelgfekfefh
 feekieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:DeEKYgzG7vzNKC02YxGf4RhgKChpyPkKIH9vU2sc3PhrTD5UlLMEBg>
 <xmx:DeEKYkOHjHdQaXsYwglLrtYQVyZdklz4_t-L7HljfpqxFIJLBSHicA>
 <xmx:DeEKYt-NYzBeiavNZCz4BtdTFL4V88HtJGv7VXgHQoHjcuGJsSB6Iw>
 <xmx:DuEKYgnFC0jCDwHOZsyP7N5cPx7T11E7cfd3EEkQ71tuJ2wURKZ5hQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0CAFF1920081; Mon, 14 Feb 2022 18:09:00 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4748-g31a5b5f50e-fm-cal2020-20220204.001-g31a5b5f5
Mime-Version: 1.0
Message-Id: <1f8ec3ae-d15b-4869-8216-b6e4aacc34ef@www.fastmail.com>
In-Reply-To: <e44df5b3-a338-3cd5-5399-6b5cbf55f5c9@linux.microsoft.com>
References: <20220131034147.106415-1-andrew@aj.id.au>
 <97430094-7d2a-432b-a121-96812fac87f9@gmail.com>
 <cf36daed-852b-4c72-b2f3-febf7fd3f802@www.fastmail.com>
 <e44df5b3-a338-3cd5-5399-6b5cbf55f5c9@linux.microsoft.com>
Date: Tue, 15 Feb 2022 09:38:40 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Dhananjay Phadke" <dphadke@linux.microsoft.com>,
 "Alex G." <mr.nuke.me@gmail.com>, U-Boot-Denx <u-boot@lists.denx.de>,
 "Christopher J Engel" <cjengel@us.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, Simon Glass <sjg@chromium.org>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 15 Feb 2022, at 05:44, Dhananjay Phadke wrote:
> On 2/13/2022 5:13 PM, Andrew Jeffery wrote:
>> Right, I think this question is an indication that I could write a more
>> informative commit message, so if we converge on something acceptable
>> I'll update it. Let me provide some more context:
>> 
>> As mentioned above this is motivated by use with BMCs, specifically on
>> the ASPEED AST2600, in some specific platform contexts.
>> 
>> Platforms can be designed with two styles of firmware management in
>> mind:
>> 
>> 1. The typical approach - No owner control: Manufacturer supplied
>> firmware with secure-boot always enabled
>> 
>> 2. The atypical approach - Full owner control: Owner-controlled firmware
>> with secure-boot optionally enabled
>> 
>> For quite a few contributing to OpenBMC, the manufacturer and the owner
>> are the same, and so the typical approach is a good match. It probably
>> is the use case Dhananjay was considering[1]. It also caters to the
>> traditionally closed-source firmware ecosystem where manufacturer
>> control is retained.
>> 
>> [1]https://lore.kernel.org/openbmc/016ae207-2ecb-1817-d10e-12819c8c40ef@linux.microsoft.com/
>> 
>> The second approach requires open-source firmware stacks combined with
>> platforms designed to enable owner control. There are some ecosystems
>> that allow this (e.g. OpenPOWER). On the host side for those systems
>> it's possible to secure-boot them using firmware and kernels signed
>> entirely and only by user-controlled keys. We're looking to enable this
>> for the BMC side too, as much as we can.
>> 
>> For completeness (i.e. stating this to make the argument self-contained,
>> not implying that you're unaware of it), for secure-boot to be
>> meaningful at a given point in the boot process we need all previous
>> elements of the boot process to have been verified. That is, it's not
>> enough to verify u-boot if the u-boot SPL is not verified.
>> 
>> Where such systems use the AST2600, limitations of the AST2600
>> secure-boot design come into play:
>> 
>> 3. All secure-boot configuration is held in OTP memory integrated into
>> the SoC
>> 
>> 4. The OTP memory must be write-protected to prevent attackers
>> installing arbitrary keys without physical presence
>> 
>> 5. The OTP is write-protected by configuration held in the OTP.
>> 
>> The consequence with respect to 2. is that the system manufacturer
>> either must:
>> 
>> 6. Program and write-protect the OTP during production, or
>> 
>> 7. Ship the system with the OTP in a vulnerable state.
>> 
>> We figure the latter isn't desirable which means dealing with
>> limitations of the former.
>> 
>> If the OTP is programmed (with the required public keys) and
>> write-protected by the manufacturer, then when configured as a
>> secure-boot root-of-trust, the AST2600 must only boot an SPL image
>> signed by the manufacturer. From here there are two options for owner
>> control:
>> 
>> 8. The manufacturer signs arbitrary SPLs upon request. This requires
>> trust from both parties and potentially a lot of auditing focus from the
>> manufacturer.
>> 
>> 9. The manufacturer publishes the source for the signed u-boot SPL
>> binary in a fashion that allows reproducible builds for verification by
>> inspection. Firmware signed by owner-controlled keys can only be applied
>> beyond this boot stage.
>> 
>> Despite the compromise, the latter approach seems to be the most
>> reasonable in the circumstances.
>> 
>> Again for completeness, broadly, security can be divided into two
>> categories:
>> 
>> 10. Software security
>> 11. Physical security
>> 
>> Controlling secure-boot in a way that requires physical presence rules
>> out the ability to influence the boot process via (remote) software
>> attacks. This is beneficial. The approach at the platform level does not
>> yet solve for physical security, however given this is motivated by use
>> on BMCs, physical security concerns could be viewed as taken care of in
>> the sense that the systems are likely installed in a datacenter or some
>> other controlled environment.
>
> We can decouple HW RoT and runtime control on enforcing secure boot
> (requiring one or keys) on FIT image. Conflating two raises lot of
> questions.

Right. They are decoupled. What I'm proposing in the patch only affects 
FIT verification.

Cheers,

Andrew
