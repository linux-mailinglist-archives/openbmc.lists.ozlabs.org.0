Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA19411C5A
	for <lists+openbmc@lfdr.de>; Mon, 20 Sep 2021 19:07:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCrZl2MXxz2yPn
	for <lists+openbmc@lfdr.de>; Tue, 21 Sep 2021 03:07:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=JTQxw+JY;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=i+gYuDE4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=JTQxw+JY; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=i+gYuDE4; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCrZG6p4Tz2yLq
 for <openbmc@lists.ozlabs.org>; Tue, 21 Sep 2021 03:06:46 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 4B8D33201A3C;
 Mon, 20 Sep 2021 13:06:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 20 Sep 2021 13:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm3; bh=SBt
 INXuPA0FXbpBwuLTzsNUUl1rL3RXTJ6IkzbDy4qM=; b=JTQxw+JY6uyEn5nEtwe
 KBbEe8TysfdU1geN1tKZy0/dimcpiwfhPLE2aDfnJ7QjRGag53eIS3t6cc/WdNc7
 id4W2LLj0Z3ewufxRYC7acdQQ7JVdVpxfsStHDiVUYxqMvbwH+bELWd0jjLpNWsq
 HAnPz1xB3a9TL4akKe13iHfDX20B30gZq6WL3iX48mXOp30YWam5nx9d1WzkMNUB
 Ej7OpMxJILcWQhs5UA9on35/VFzVW8YXV1vNVLu8CLsImXnUby2SKtyDKIcLYivL
 B9Dtr4Kcntgalh9G4CGgauXuqNuwga5YW9QAUWkhxhQphiPpjRieXdqvFZjMVFhs
 RjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=SBtINX
 uPA0FXbpBwuLTzsNUUl1rL3RXTJ6IkzbDy4qM=; b=i+gYuDE4wn873Ybr+5yhQB
 +6qsBm0vb7ePEm83bFnEu3pe7XPS+LQ4AcqLdsmup3VjXokMUeWQ3cdzsczhunna
 ZhrBWlib+5j9/olz42o6/Lm+BF/nIW0o9Y4RBClMs8qNa/0Iz0aPCQXi6NJxwEaw
 0hfbs9witF3P+6ettLszrQouccZGpvnFq4HLedEPp0NlNvl+fIojHx/DkIdupawP
 cziprxvthtL5aCXMQu9p/HzQbIVG1SFcUhw6XccsjOoP2RdheEZKIUAogJjaKzGX
 FNtHZv0LTDHfqpACsZNb59SDfbvsXGsUR8p3c9H3Ro9Ouw9DLGS4aNjm7wyNFYsw
 ==
X-ME-Sender: <xms:or9IYfSgdHgqggzObRb_DXOKW-lalBOBIqTe9_1No8M7lm4l6sawbQ>
 <xme:or9IYQzcKVPzBUR-cMNA9wRE7ROAu2mH0OSBK0ZMREZeg8X07JHoRl1D_wDDmt9YD
 9fwv092eP9WdOrQAfo>
X-ME-Received: <xmr:or9IYU3R9T6Os5hkOYuDaf_3xshRIy2KaHIRFCkzeThC_rFmgJG2_sAO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeivddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrggu
 uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
 hmqeenucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeek
 fedufeeuvedulefgkefffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:or9IYfC3lKaR9rAKChTPeDou57Uvterp6U_ieJYnew0N335tHNi0ig>
 <xmx:or9IYYi1F3hSxr5Z2-OINtjAmBAar80oBWUV6WeM2gF3rctKKLq9Rg>
 <xmx:or9IYToXdzkIR1c4uZI04liWvnPFpjsSrevG9gXTyhyvSK4AwRFuFg>
 <xmx:or9IYQLrHAYUbbZY7zl4DZdR2V9r8Pptscd-oUNWlqFzwJ6Fpf93Kg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Sep 2021 13:06:42 -0400 (EDT)
Date: Mon, 20 Sep 2021 13:06:40 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Graeme Gregory <quic_ggregory@quicinc.com>
Subject: Re: CCLA for Qualcomm Innovation Center, Inc.
Message-ID: <20210920170640.x6ry2mdwgeav3ano@cheese>
References: <06616d14-6add-bfcf-760e-a98a8eb26a8a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <06616d14-6add-bfcf-760e-a98a8eb26a8a@quicinc.com>
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

On Fri, Sep 17, 2021 at 01:50:45PM +0100, Graeme Gregory wrote:
>Please find attached the CCLA for Qualcomm Innovation Center, Inc.

Hi Graeme, CCLA accepted, thanks and welcome!

-brad
