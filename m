Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1742A56D3
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 22:32:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQjgJ1tTWzDqq5
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 08:32:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=preossec.com (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=lee@preossec.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=preossec.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=preossec.com header.i=@preossec.com header.a=rsa-sha256
 header.s=mesmtp header.b=AC46v0Sz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=VvltXcCF; 
 dkim-atps=neutral
X-Greylist: delayed 541 seconds by postgrey-1.36 at bilbo;
 Wed, 04 Nov 2020 08:31:02 AEDT
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQjdL458KzDqcR
 for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2020 08:31:02 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 916718EE
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2020 16:21:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 03 Nov 2020 16:21:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=preossec.com; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=mesmtp;
 bh=ldar8+Gd3aTlDagK2zY5nY5EJ6GTwfgWHd9O/V2SMFc=; b=AC46v0SzPsVj
 iuyOzK0tSjUzpradaRyQTc8iJ9jQFig1Ps0C0ZAjAZ1rvvHzmFRwEXhnWcp5hpQ5
 2g8gDVls8iXibtQFvVhVTmkK/TZaWDWSn87UqS3iVuQJ4nK3iLnen/ueyM/OqpQl
 /F+Y8T0QPRTaXCMmhaAqxvjgI7FZCD4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=ldar8+Gd3aTlDagK2zY5nY5EJ6GTwfgWHd9O/V2SM
 Fc=; b=VvltXcCFkajXIppI6xYjc6Fp42p1JxdwfP59yzuU8FXKRC3YIqQftOIKU
 NfroQqLbP89PZaxvBmU/MPA6ibQ8kSb8Oo2+vPjreEffeIjG3h0ARiiv9g2LMEwX
 bxPYXwwqbFHK9MRdI1Ot4/WVncNSQnJWAbht23MYqhVpKL0qvgV2l9Tl6lpWpPAP
 jNTfWXktf12R7qz1n2je3tL6jPAF+2khNddB5dE2/r/TDh+MN337yMXNjvXYRWup
 cmNp+1p+H1DQDDEB//ROB7futmu9quWOst03AYMsW3Y6wal5lXGaHbnPOJIYeIAp
 4S5EBwEQvRwHwOPiMQqXCOYjtfq1g==
X-ME-Sender: <xms:88mhX6Fx_C85luJzd1JTqIWKJ8K8B01AFCvmhAz_8Pg-1cPiZpCSow>
 <xme:88mhX7Uj9eKNHuYFcklrdzX_xV8zbIKih-KthQVM8DRhb03V9UAw_330drp0SJm7w
 t88zZYlax0TPHbjrg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtfedgudegjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepuffvfhfhkffffgggjggtgfesth
 ejredttdefheenucfhrhhomhepnfgvvgcuhfhishhhvghruceolhgvvgesphhrvghoshhs
 vggtrdgtohhmqeenucggtffrrghtthgvrhhnpeehgeetfedvfeekgfffleffkeejudduvd
 ejffffieekvddvleelkeelvdetleeutdenucffohhmrghinhepghhithhhuhgsrdgtohhm
 pdhfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeehtddrfeehrdekrddvkeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehlvggvsehprhgv
 ohhsshgvtgdrtghomh
X-ME-Proxy: <xmx:88mhX0IqsbjPYb80uLiTTJ0LwbUmc9kmDG9GgmUtSHQiVjfpsbzY4Q>
 <xmx:88mhX0G2IUXawqtIRX-ufp10jeax3ijuSqR2EFrZdsOjL6nWMr0C6Q>
 <xmx:88mhXwXESFcsPxSt6euiAlChKLOAdXagC_XYjKpBoXEj3kLc662i-w>
 <xmx:9MmhX4gPs_FGlPr2UVANTtfSD7oMJsxm9rwLKia3m_TGC99ORhDUVw>
Received: from [192.168.1.100] (unknown [50.35.8.28])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6B6B03064674
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2020 16:21:55 -0500 (EST)
Subject: Re: Secure boot/signed images and GPL code
To: openbmc@lists.ozlabs.org
References: <CAM=TmwWinuWjpNr+NeTXTmPv0wUCCzg5BUKhhR=Rp=mfmma_6Q@mail.gmail.com>
 <20201103205600.GA38269@patrickw3-mbp.lan.stwcx.xyz>
From: Lee Fisher <lee@preossec.com>
Message-ID: <c3da59d4-b312-2372-0bfd-77014fb1fba6@preossec.com>
Date: Tue, 3 Nov 2020 13:21:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201103205600.GA38269@patrickw3-mbp.lan.stwcx.xyz>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

> Does secure boot on the BMC (I think for my question it doesn't matter
> where the hardware root of trust is - it could be on the BMC or an
external
> chip) or signed images deprive users of rights associated with code in
> OpenBMC that is GPL licensed? [...]

In this thread I don't see any reference to OpenBMC use of the existing
Shim[1] -- the current Linux UEFI Secure Boot solution to address these
legal issues. It seems that if the Shim can't work for OpenBMC case,
then OpenBMC could create a similar Shim-like widget. FYI, there's a
Shim mailing list.

[1] https://github.com/rhboot/shim

https://lists.freedesktop.org/mailman/listinfo/shim-review

