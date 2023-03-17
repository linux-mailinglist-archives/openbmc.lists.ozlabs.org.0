Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA09B6BEC9E
	for <lists+openbmc@lfdr.de>; Fri, 17 Mar 2023 16:13:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdSM1415vz3cf4
	for <lists+openbmc@lfdr.de>; Sat, 18 Mar 2023 02:13:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=B0C4iHxO;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=D4SuTNuS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=B0C4iHxO;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=D4SuTNuS;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdSLK2ppGz3ccl
	for <openbmc@lists.ozlabs.org>; Sat, 18 Mar 2023 02:12:55 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 4905D5C012F;
	Fri, 17 Mar 2023 11:12:50 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 17 Mar 2023 11:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1679065970; x=1679152370; bh=VG
	89h2qlkyB6IZyzHlEvOd4043stnLQ8kCwTLcVn9EQ=; b=B0C4iHxOmf+YcKBYwW
	ypLHUeWEu4ZgWO+L57C3ocJCJHdu1G0Q1reI/md8XvkIP0H7NBY+4okAW1FLidaC
	nHAGBSpcfoF9hWqOIt25P+B7yOyJCZylZzR/xhPUpkULBkWZArwUnEwz3pzEtP05
	3bKQMNcNw7Kwn5FGONJLJx/ifyidu4M2noautF4SKSuP2jcZ55jGv2I8Gx5lh6sR
	wqrxo1BvtxNd1UvyJje6wp5ytVEjF8gTK2tY/MUjCUgGj49D1D2M1exVMvbNeJ8S
	ayehlr7I4DAQNn3K3ELD6Jc0i89iCor8jQzW92NFBV9bu+SCECjBgGLEde58bs3C
	CTwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679065970; x=1679152370; bh=VG89h2qlkyB6I
	ZyzHlEvOd4043stnLQ8kCwTLcVn9EQ=; b=D4SuTNuS3tz7+OsIXpNwu7UIoMeom
	iM8r8ULHx7je504+kV+KFpA+b2v4kXbmriiJX/JsEHACfQMzJwudQhV6vp+MpUVP
	8kG+QdP9IgyqNyEWdhphjYEX3wdqkd2Pry435y72Jxi8/4aYFhIFt4pm3KPAe8IX
	QqPjmV1N9uogcJcI10LXdoNCtt8Veng9AtiE9K6rQh1mDWuiv82qf+CgQulYHttd
	k6g+4tWsn0+oqugAGXK6woOcxAYCFC7PZDk1CfFfkjx6vzrnFk45xqh8ZBTL6+7x
	XO7roKk8a2yQk5nBvaGQ+J0miPyMgJuWuhGXg72dMzLToi600p+YbVmvw==
X-ME-Sender: <xms:cYMUZJM5Dq4tHqjvTMadGb8rCXCRMeI0yAvP3s3zvidl4PSO8NTRmQ>
    <xme:cYMUZL-xQrmleZItr-fK_5p3DS-uPkcPzCePZT0B03iT4WtZgqcdIgePRmb9lRvmq
    6VDjH01T57XOo7kH_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefvddgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:cYMUZISgi0LJyZK-CbfDEnZvD0m_Mcj2InXfNGaM-1R9rigjtrhf7g>
    <xmx:cYMUZFtcPX7s3CfiAZKg_yDCK0BvUZeDPAAtk9Zns-QHGU96Odh02A>
    <xmx:cYMUZBfZQStwznvotb23Qh4QHTUKzR8-WUnJ0WVdnc5JCSdHxL-jyg>
    <xmx:coMUZM0vaPD-dRKv3OAs28EVcmjGB_xHEUBRDqAwdwTujx-L8sEsrQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 89984B60089; Fri, 17 Mar 2023 11:12:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-221-gec32977366-fm-20230306.001-gec329773
Mime-Version: 1.0
Message-Id: <c193ee65-b3c8-4993-a50a-f01139a5827e@app.fastmail.com>
In-Reply-To: <20230303063435.803097-1-davidwang@quantatw.com>
References: <20230303063435.803097-1-davidwang@quantatw.com>
Date: Fri, 17 Mar 2023 16:11:58 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Wang" <tomato1220@gmail.com>, "Olof Johansson" <olof@lixom.net>,
 soc@kernel.org, "Rob Herring" <robh+dt@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 1/7] ARM: dts: nuvoton: Add Quanta GIS BMC Device Tree
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
Cc: devicetree@vger.kernel.org, David Wang <davidwang@quantatw.com>, fran.hsu@quantatw.com, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-arm-kernel@lists.infradead.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 3, 2023, at 07:34, David Wang wrote:
> Add the device tree for the Quanta GIS BMC and it's
> based on NPCM730 SoC
>
> Signed-off-by: David Wang <davidwang@quantatw.com>
> ---
>  arch/arm/boot/dts/Makefile                    |    1 +
>  .../boot/dts/nuvoton-npcm730-gis-pincfg.dtsi  |  732 +++++++++++
>  arch/arm/boot/dts/nuvoton-npcm730-gis.dts     | 1076 +++++++++++++++++
>  3 files changed, 1809 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gis-pincfg.dtsi
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gis.dts

Hi David,

I have not looked at the patch series in detail and assume it's
largely ok, but I should clarify a few issues about the submission:

You have sent this 'To:' the SoC and DT maintainers, but we are not
the ones that would pick up the patches. On a future submission,
please address the npcm maintainers  in the 'To' field to clarify
that they are the ones to review and accept the patches. Please
leave out the soc@kernel.org address entirely from future submissions,
as we only use that when the platform maintainers send the pull
request for integration into the soc tree, not for getting things
into the platform specific trees.

There are a few automated replies from the build bot, you should
address those and resend the series.

       Arnd
