Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 542D9389E4F
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 08:52:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm0lz2HSHz306v
	for <lists+openbmc@lfdr.de>; Thu, 20 May 2021 16:52:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=fKKhcjnh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=nAwBxIw/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.230;
 helo=new4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=fKKhcjnh; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=nAwBxIw/; 
 dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm0lc57D7z2yXb;
 Thu, 20 May 2021 16:51:56 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id A3D105806A2;
 Thu, 20 May 2021 02:51:52 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 20 May 2021 02:51:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=zDP1gHyDrszLLnytgrAGtVNqgUC22fE
 HUxnVJ2tMd80=; b=fKKhcjnhxfcH7inJWHHa3A0cIBqtVrGLLK8jvG+xfQwIGzm
 bGWCJ44WwNzxCF8LGPZUi65ZCXMXngS1vsTDxRdzfol8lD1dHuEgpGgLFUv9et3w
 OJ3SvDac4cFKl1d7U4KAW2HknDt9WnjR5lilUFmxt7UivlHmLCBNVRQ0rFBG7VIe
 MPr81VVcR/4DXrgGz2OxplRAzjFOAF7sk4Mxuyq2BW9MNTqMXg8E4Tr5s9Hh4K+I
 fhKGLqpgj3uPGGyuTpf+qRwBXHoFPH+p5EEwPLW4xD7Um5nvemR5/YNTyXBK4HZ6
 vOopsIqr5AfTTY+Z7OWeQGGotHKC657w6JynXNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zDP1gH
 yDrszLLnytgrAGtVNqgUC22fEHUxnVJ2tMd80=; b=nAwBxIw/gsRIXpTw1UBOVP
 2Qq3iNRZx42+ZO6l/9j8pz7ZpUVp5GbYOpu37WNhVzijYTZEBDErWpvzF08KJUGI
 bvojQ4a3ccg4GMH8ZquVURmoeKaswm8PjRsRN1dXLtZTbplRLB2op9ouPYF/gpvt
 4q70LvH15smlxFOg5nsaRnwygHe0wnCyUY90s5uQcxTpTqCEdN7dbyGmAviBClId
 wSw9kirQU4DPrXwLnCQB52FfIKIX4IxhctXuTiuS+iQRTabR6Sb3BIRoPSUQQK8d
 pi8vxz33I3vi+0mQYJ1NJznWJ9Dx/ZWKVGxJCG6xdTZ/VNBv708Cp3OAizS5Ux2w
 ==
X-ME-Sender: <xms:BwemYIWE9ShKCRcIHlIT8n11f3DDJKr76ap4kBC_n_PjMwlNNa1ckw>
 <xme:BwemYMkGK86YIf_wNEDeQijxAtKrFcWPwOXq3WkMNCTMQZwITAPU5uPXQhBY8Z5eC
 kUIVLUcLkm0bETAjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdejtddguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpeduffdtvdevkeffgfetffffueevgeejleeghfffjedthedthfelgfek
 fefhfeekieenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uh
X-ME-Proxy: <xmx:BwemYMbRFvfVszlZL3_K6ezre0UAozJvK9U_t6x18uxp2Um6fFn-Rw>
 <xmx:BwemYHWhmhBEUTF23J-0nzWeWbqJ7TUsu4J-RskfyAbMEDbetvyFog>
 <xmx:BwemYCmhBYnhkVznydHBegbLzOyq4s3YjENph1GV2_dPWNluMg04Ng>
 <xmx:CAemYIneiAhMNiKkCrRH-Gg0uc6EV9XAMtfTjAEQ68MxtKZH8ggN0Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9E230A004B5; Thu, 20 May 2021 02:51:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-448-gae190416c7-fm-20210505.004-gae190416
Mime-Version: 1.0
Message-Id: <5b549fee-63b1-4c05-a1d6-f6a13e235e1e@www.fastmail.com>
In-Reply-To: <20210510054213.1610760-1-andrew@aj.id.au>
References: <20210510054213.1610760-1-andrew@aj.id.au>
Date: Thu, 20 May 2021 16:21:31 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 "Corey Minyard" <minyard@acm.org>
Subject: Re: [PATCH v3 00/16] ipmi: Allow raw access to KCS devices
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 linux-aspeed@lists.ozlabs.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, "Chia-Wei,
 Wang" <chiawei_wang@aspeedtech.com>, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Zev Weiss <zweiss@equinix.com>,
 linux-arm-kernel@lists.infradead.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Corey,

On Mon, 10 May 2021, at 15:11, Andrew Jeffery wrote:
> Hello,
> 
> This is the 3rd spin of the series refactoring the keyboard-controller-style
> device drivers in the IPMI subsystem.
> 
> v2 can be found (in two parts because yay patch workflow mistakes) at:
> 
> Cover letter:
> https://lore.kernel.org/linux-arm-kernel/20210319061952.145040-1-andrew@aj.id.au/
> 
> Patches:
> https://lore.kernel.org/linux-arm-kernel/20210319062752.145730-1-andrew@aj.id.au/
> 
> Several significant changes in v3:
> 
> 1. The series is rebased onto v5.13-rc1
> 
> 2. v5.13-rc1 includes Chiawei's patches reworking the LPC devicetree bindings,
>    so they're no-longer required in the series.
> 
> 3. After some discussion with Arnd[1] and investigating the serio subsystem,
>    I've replaced the "raw" KCS driver (patch 16/21 in v2) with a serio adaptor
>    (patch 11/16 in this series). The adaptor allows us to take advantage of the
>    existing chardevs provided by serio.
> 
> [1] 
> https://lore.kernel.org/linux-arm-kernel/37e75b07-a5c6-422f-84b3-54f2bea0b917@www.fastmail.com/
> 
> Finally, I've also addressed Zev Weiss' review comments where I thought it was
> required. These comments covered a lot of minor issues across (almost) all the
> patches, so it's best to review from a clean slate rather than attempt to review
> the differences between spins.

I backported this series for OpenBMC and posting those patches provoked
some feedback:

* A bug identified in patch 9/18 for the Nuvoton driver where we enable
  the OBE interrupt:

https://lore.kernel.org/openbmc/HK2PR03MB4371F006185ADBBF812A5892AE509@HK2PR03MB4371.apcprd03.prod.outlook.com/

* A discussion on patch 10/18 about lifting the single-open constraint

https://lore.kernel.org/openbmc/CAPnigKku-EjOnV9gsmnXzH=XZxSU78iLeccNbsK8k2_4b4UwSg@mail.gmail.com/

I need to do a v4 to fix the bug in the Nuvoton driver. Did you have any
feedback for the remaining patches or thoughts on the discussions linked
above?  I'd like to incorporate whatever I can into the series before
respinning.

Cheers,

Andrew
