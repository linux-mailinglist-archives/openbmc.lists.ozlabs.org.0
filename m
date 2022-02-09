Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EED4AEFAB
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 12:10:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jtxxc3J2Fz3bPK
	for <lists+openbmc@lfdr.de>; Wed,  9 Feb 2022 22:10:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=gnQF5KfA;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ofonA0yN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=gnQF5KfA; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ofonA0yN; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jtxx65GvQz2xtp
 for <openbmc@lists.ozlabs.org>; Wed,  9 Feb 2022 22:10:02 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id F22305C00D7;
 Wed,  9 Feb 2022 06:09:57 -0500 (EST)
Received: from imap50 ([10.202.2.100])
 by compute3.internal (MEProxy); Wed, 09 Feb 2022 06:09:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=bWykmU5VmuX3v2wq8uHr4mhP9EAoUC3ZxrE+Yf
 c6LRY=; b=gnQF5KfAWvPrfY2K9T4/348CKKKkaa9QtLkgcyN79+AFwZWzZtDv0B
 r7ne+XpcmBHnmbNimIFAxYmVE9xC84aBOBXj953aCXosJt4YnMJu4CYnsKqzn8bS
 FIM2RVpaZh1mA4tmi1Bckep/SXSn3ECOnX+wPymf/gbhvW+rXRqcKRtF9mrbY42x
 nE/kOT/mZnaPBWwSwn3i3CuDNYmbz1A1OznQvnHUUh2Zzy5Kt4OOsGkx5Pa3T4Xp
 gT7Hm537Q3X0+fP/ktYg0Qq9bWbiJ8h8aQK3Y5xcL+8V83dtp++2vsC8oF3pdFE5
 mwnqBFQSRut4dkbdbxObCuGAkb9Na34A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bWykmU5VmuX3v2wq8
 uHr4mhP9EAoUC3ZxrE+Yfc6LRY=; b=ofonA0yN5MzvKXEmLp+WLz4RoxLoAK2SY
 VSctIEZaBjOt2cNLvSzK6COQHYpKnlaZHo6sHznYCy/DmcK90cj9vybjr2vGLCW1
 ehJt0W+K8RxQE+kg5T+PNHz/hd5U4JC609/9ZKcMUdztxdE4JgeIkrS8kol8tBnm
 c+ZGEmKJYfuqQqOkB1HkwCGydDU1WbpInsy+KGPZoW93iIieYdW0t2/m6cfbVuS5
 SRyxT8ACZrvI8LRIquPpZSbDvLl8zDA+ju8ykA3K4OB5qZBx/dr7R3KJ5x2MI+FC
 bk1iu+YQW8MwEkUBQ/L4JYJ/eh1yDvib8/Po0uw6qlrh3WTUsNydw==
X-ME-Sender: <xms:BaEDYmFJhueAYfF2QM1vmhqPMQh4tVIU21R4l8DNM1cV-FWAnMWJkg>
 <xme:BaEDYnWAfEWGF_evAoW2mRPPBhXoZAm3bgd76U3Jjh_IbDoZ-VN3KXfp1j2qkyg-l
 KgthsEiUzgjSO7sCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrheelgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:BaEDYgIoqEq2MYrrfRT9qZ7jD03rWQaCaGY9-S8YKKIKI8NaHuakyg>
 <xmx:BaEDYgFBRsALI6rtBF2RGHRgbQCVwGpSWHtwLGH9JEnlhSXxAMFHtw>
 <xmx:BaEDYsVXgANt8v8UQt3rVuLWwqg9_L6rrejjUDIv3g8xo7J-MJ266Q>
 <xmx:BaEDYncL6orGCwQwjXNe-taW_Ob4HQcCCpDEnDzAP7TfA2tx4-TMbg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 866991920084; Wed,  9 Feb 2022 06:09:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4748-g31a5b5f50e-fm-cal2020-20220204.001-g31a5b5f5
Mime-Version: 1.0
Message-Id: <6706daf1-f289-41d4-980a-98a5b59b45fe@www.fastmail.com>
In-Reply-To: <20220207150409.358888-1-andrew@aj.id.au>
References: <20220207150409.358888-1-andrew@aj.id.au>
Date: Wed, 09 Feb 2022 21:39:36 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 0/3] hw: aspeed_gpio: Model new interface for the AST2600
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
Cc: Peter Maydell <peter.maydell@linaro.org>, openbmc@lists.ozlabs.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 8 Feb 2022, at 01:34, Andrew Jeffery wrote:
> Hello,
>
> This series adds support for a new register interface supported by the
> Aspeed GPIO controller, present in at least the AST2600.
>
> The new interface is a single register implementing an indirect command
> protocol that allows us to manipulate up to (at least) 208 GPIOs. This
> makes it possible to write very simple drivers for e.g. u-boot and
> jettison the need for the tedious data model required to deal with the
> old register layout.
>
> I've lightly tested the device consistency under Linux. The Linux
> driver is implemented in terms of the old interface, so data model
> consistency can be tested one way by poking the driver using the
> libgpiod tools and then the other using devmem to drive the new
> interface.
>
> Please review!

Naturally further testing revealed some quirks that require further 
enhancements to the modelling.

Hold off on doing anything with this series for the moment.

Cheers,

Andrew
