Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7632B4EC79B
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 16:59:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT8j42ydkz2yyM
	for <lists+openbmc@lfdr.de>; Thu, 31 Mar 2022 01:59:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=mVHRv9Dk;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ETB1LPzM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=mVHRv9Dk; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ETB1LPzM; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT8hc4R4xz2yZd
 for <openbmc@lists.ozlabs.org>; Thu, 31 Mar 2022 01:58:56 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 4860D3201F7B;
 Wed, 30 Mar 2022 10:58:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 30 Mar 2022 10:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=0NhrMtp9yXLzVV
 zSl2gYzwT20Xhdmf3whOl7bDGqYL0=; b=mVHRv9Dk2ylD6fvdglkJLCoN8edmrV
 JDj7wSjJ4iAsIGLw1vMyy4EvHLKfUBv5g+xTMA70PzljM58VhTnitE2oTFAQEEMh
 h2lfXTOB9nMdj3WHZaFNOGdVdAhOeVMB8G1pzSLjJUMmzYg0zp6ftAPCcx2QJZbX
 KaxDlX/Hw46begUvmaZNZSi6WjcQE3HpYA8UZ0bCFQ5HfG7rN6c/crGnmjLnoOCk
 lWytrqNc82IlWrkZaYOdWhooz7GxXoqjN7TYTza3QWfovO2y1Kh7WBgVwmtEZeds
 5k72Is784RHmYzkq6IXJKFA92Wrvdt2+Uwee4tRR3IiVkNQhk3F7JDBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0NhrMtp9yXLzVVzSl
 2gYzwT20Xhdmf3whOl7bDGqYL0=; b=ETB1LPzMpAjJRggRZIFpaE9Q8tVMLYXu7
 /8PHfA1p8Jhv2qhbKnvfvrAGvoWFyIo2IHYpLPLYl8yfRS6FANDUgFRD2bvyAJMl
 zCcx3Eev+ZX8d/IUl4G7YsNhoTXxxd+CLHGcsrNqj/GoDOrO29U+rgGXmQKOmnAR
 6Puv6xXlRm7y8zhEBGrR/8tMh9I0v3rQeqpOCSu5fsIuKCD7mKkJqIsAMb9li+zE
 0dpejQ5IVVHv0L39/X2ss8h6rUY0WJ+VxdfOyvdgp7YTfpvNjHu4TYAPiZgYIK1m
 /j6IruvbwGTYkH9fdhmZJrWRjmTAzXp2Cv1UGhN06BMvIh4LJ2Rrg==
X-ME-Sender: <xms:KnBEYqrn9xUuRk6vdNtrFOGar81GxmdcKBGLOucnXQAgQ1YfFDvu4A>
 <xme:KnBEYop7XlmstHdw54Ak7jnxc8soPIrcJlkjI9yMf0NKtioLlOo3Q27nJxVQz35RT
 XVtlGbmZLMpKQL9O70>
X-ME-Received: <xmr:KnBEYvPt0HbBTYdeI0QddF9YVHwH5BFcBCgE8hfVm6ycjQQBhZ52d9Qb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeivddgkeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:KnBEYp4OpaftaF5HNRkpS30D1Vf4wM5qS5YRuuV1ep2Lu2PMQ7RzpQ>
 <xmx:KnBEYp7xVGZk1juM7kJToNf5bytlO8dTqG4OxrxA-Nqs72mKdOt57A>
 <xmx:KnBEYphwzSVyjOrcm8UulHJM_SU-psp7EqNHpOsaK2ZIfV-nGrXqBw>
 <xmx:KnBEYpFUpb1d6kgJGElJn5RYWkhe88rjzFqSuCuINDBwPeQFkvWXfw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Mar 2022 10:58:49 -0400 (EDT)
Date: Wed, 30 Mar 2022 10:58:48 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Luke Chen <luke_chen@aspeedtech.com>
Subject: Re: Signed CLA from ASPEED 2022/3/25
Message-ID: <20220330145848.o5if3p6hwdzkjgwg@cheese>
References: <TYAPR06MB2256B0D5198B54642EFF1158E11A9@TYAPR06MB2256.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <TYAPR06MB2256B0D5198B54642EFF1158E11A9@TYAPR06MB2256.apcprd06.prod.outlook.com>
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
Cc: "manager@lfprojects.org" <manager@lfprojects.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 25, 2022 at 12:50:32AM +0000, Luke Chen wrote:
>Hi Manager, Brad
>I would like to update CCLA, I added 5 more team members into the CCLA.

Hi Luke, CCLA update approved, thanks!

-brad
