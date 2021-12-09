Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE7F46E67E
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 11:22:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8qpQ2vkwz3c56
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 21:22:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=Kmp5ttdM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=G47Rso+b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=Kmp5ttdM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=G47Rso+b; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8qnw5jjVz3069
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 21:21:40 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8EC4332015ED;
 Thu,  9 Dec 2021 05:21:35 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Thu, 09 Dec 2021 05:21:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=MIEtm
 AtPaM6Kaasw1/iK3mpUvQg43MxL9Idc6TkY2FM=; b=Kmp5ttdMVZ2InpZfKeIlR
 LopvcIax3MaGKm83IFVB+oePXh+O80er/3zAEQj8r/oGiQC7h1yZymaYPCM6A3kp
 ve8tma2g80Lc0jakgwEPgboUVptDb8Fmbkls4/29AYsv9U7XLO7qLkUBqkenQH8C
 V0kabNd4iY0J3ZsiaA0k2au9OuzU4CMFIvMhqzSU6FhIOdVfUo9jElNEyT2LHjxp
 C2lnkoyt3yrxVytPMqC8BH7fMlCoIxG0cpBn0tkr66hLr8Yjc1mV54myLdqEspE/
 a/GLdL9l/xsm4YIkI/Ihda2WFKcWzpD4FQDjb3oaEwZVTw9sO7UcjgEZU1HYQVi5
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=MIEtmAtPaM6Kaasw1/iK3mpUvQg43MxL9Idc6TkY2
 FM=; b=G47Rso+b/77c1Ct6/rEyPmg18Qcl/eRq69Ay9fh5RPAj+QzVyuTM6JD3A
 6Q3osc8M0rCelzvGryUFlHTBsQqGopYVPuY5xZeuW702iekGLRBfLw3vKhJCVkjy
 ibgrFh8EFT/QT66cLQ8ODQrldNPOs4TneDXUgpqfPANCD+PmmVNriyy1+JBTJQbv
 7S43PFJCPCSXTGIteqFQdu8/9WGULqVsCIOeADvkxv4GOJs0dp489lrXlr5KHqF/
 /utM+9ti5U+6rjNm2tvBg4imDQmJQDZ9czmGuEQ+jLPsV5QI84lk2r7uqGL/l5tX
 BDz3mA08eg9uwf2U9OxmSy0pzyaKg==
X-ME-Sender: <xms:rtixYRMwyYvWeKS1G5vOi-5bo7Ms1oyXXdRterLFdpVOU1hNniLNXA>
 <xme:rtixYT-mVFlGoWRh15_Mw7GXcbV33tFXz6gb-uHvyR8IYTF5oBkgMynMkPUydsu3u
 c8hobV0_ZD2OEE7FA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkedtgdduhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepvdegkeehgeefvdfhteehhfduteetgeeugefgieeigeeuheekudegtdek
 gfelgfehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:rtixYQS72_HrDzN54mIASXHH_LMT_vlrJs-gI5AAko_ZGw3DbyvFgQ>
 <xmx:rtixYdukJ4n-Drq917fEN6CKy7i4FlVIro4LMMjKagTAfcRGtX3xEg>
 <xmx:rtixYZe3JSTq7_erhySQ4uUTH3V6kenYI_S8sZRZ_ZnKE--QlXAxUQ>
 <xmx:r9ixYfrBCa9PM911p3rSQ0UXleDUAg0ZBoWwyPN4r5eC22NSuYp4Ug>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 878D3AC03DB; Thu,  9 Dec 2021 05:21:34 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4506-g4374de3f18-fm-20211208.001-g4374de3f
Mime-Version: 1.0
Message-Id: <2fb7a5f7-a9a3-4c00-9b16-d98a9c0af91c@www.fastmail.com>
In-Reply-To: <64bef7b7-2dae-056c-98dc-696b864f4fb7@linux.ibm.com>
References: <0abb0557-9797-cd8e-1d21-bc8abf24d7ad@linux.ibm.com>
 <64bef7b7-2dae-056c-98dc-696b864f4fb7@linux.ibm.com>
Date: Thu, 09 Dec 2021 20:51:13 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>
Subject: Re: Security Working Group meeting - Wednesday December 8 - results
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 9 Dec 2021, at 05:44, Joseph Reynolds wrote:

>
> 4 Progress on BMC secure boot?
>
> AST2600 hardware secure U-boot=C2=A0 boot, then secure booting the Lin=
ux=20
> kernel. No additional pieces.
>
> See the AST security guide.=C2=A0 How is signing-key management done?
>
> Dhananjay to=C2=A0 follow up.

As someone who was involved in integrating the AST2600 secure-boot suppo=
rt into OpenBMC, what's going on here?

Andrew
