Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A051042F29E
	for <lists+openbmc@lfdr.de>; Fri, 15 Oct 2021 15:28:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW6Xf2DPLz2xr9
	for <lists+openbmc@lfdr.de>; Sat, 16 Oct 2021 00:28:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=LG3KiH3K;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=J+5UnQVn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=LG3KiH3K; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=J+5UnQVn; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW6X94KKbz304x
 for <openbmc@lists.ozlabs.org>; Sat, 16 Oct 2021 00:27:52 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E17603200EC0;
 Fri, 15 Oct 2021 09:27:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 15 Oct 2021 09:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=Zq/ATc5AiVO606hWOpvSkziRIJ
 dRKTw+NsBs57TufaY=; b=LG3KiH3KGT6iZZ3RkLLEnUZM7v2t1D8tStujSjdRS9
 lNTDtqts/eP0O2o/3sguXI571Wg6drdqzr3nPVtB+3TlYy0pNUTxFeimhVoy/sK5
 4q76xBFKt6HHSFpA5YhuK6ZLjCF1iP31QGrrlqh4ZYvZphkDhnEHPdBkfJwgQhnD
 TX+cxLKCgB0W1Bc8y7fiK6A3jsSyYbJpl7r90b7PEYDUY2tfaJTtk0r6ZnHvKu0k
 yJnNFRz5JlWccWMSSjCBBvRNZpQiN7/OCzyyNwPKrEKcYLD3MXJ9If6ETauOGMF6
 EZYVrURnCB2mLRLhxSnfur2z+m6oNqyKMtvMZXsuukww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=Zq/ATc5AiVO606hWOpvSkziRIJdRKTw+NsBs57Tuf
 aY=; b=J+5UnQVnELgty6GoatuycndaZP1lEvZR5XimbH9K6kyEQXoqCxqlrs9wZ
 M1zssQKLHrU/Mg3Nj+RZKsuD6uHxXFaCkIM4a52yhdIe6iaTAyXP5LjHBz+fhmoC
 xdu/lcyllKMz/bEUhoEmJI9hTzv6nX/ZRTIW+GpmiPbkTloGOaXPRBFSUWN/Qcsl
 xpk1qzHrwk8ckccmP22nhiwWg8BxO0f6xD9Dxfqi8L0iC4TJYIv4e6OjBayszJWu
 fuccoYovJh0lw9cH2SMuhhiA8SvaNo0fe+JSVFKRqOe5N66WJJZDM0RvvPdJjVc4
 ea+JeCY6k8RVFcqW0+T66YFZWlFqw==
X-ME-Sender: <xms:04FpYQoy7isFnfRCaNH2V9n6RoL7Pghk6TvkYNRHaB31Vatn9v_M3Q>
 <xme:04FpYWpmjsqnGaTcHualrFWfCWW9MImvyvdxTCyuNbBvRcXUYlut5tImZ8y2etzJ7
 amUIuylHyh18DxvSXU>
X-ME-Received: <xmr:04FpYVMvvXug0ASSBYSA4znAKim5Mv-fvGILL5zhf6QGCI5mQz67a_McnRRrl0J2yqhxclA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddugedgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtje
 ertddtreejnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepudejfeetke
 egiefggeettdfgjeelleeutdehhfethfetudefkeeuieeifeefgfetnecuvehluhhsthgv
 rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehfuh
 iiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:04FpYX4keYcddIKvXhZU92xicQ2nnw0ZPSaizJHKbToUscSHZ0RC7g>
 <xmx:04FpYf6ByanBJlqWJCt-p5wU_Fo4g9cA-yW8j1JVja83NO2ezPKdgg>
 <xmx:04FpYXgppfCJa8X4ECLVogcYiawO_o0DE13vpU4i4gaBQ-zK8WqHSA>
 <xmx:1IFpYfGQN1O6YzSp92LaZCA0R0_hRgfup4XJVeLndVYLX4H8ScVpKQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Oct 2021 09:27:47 -0400 (EDT)
Message-ID: <1e9182625fccf479c4d254f8c7d856c78006a45b.camel@fuzziesquirrel.com>
Subject: Re: Softoff features in PLDM lib.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Date: Fri, 15 Oct 2021 09:27:46 -0400
In-Reply-To: <2c5bc5d0-2e1b-2cf3-0452-b852afb4174c@amperemail.onmicrosoft.com>
References: <702956f7-e667-8fd5-ed8c-4ddafbe67ccd@amperemail.onmicrosoft.com>
 <C7E88C14-8945-4556-8B2A-0C871398320C@fuzziesquirrel.com>
 <2c5bc5d0-2e1b-2cf3-0452-b852afb4174c@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, liuxiwei@inspur.com,
 duanzhijia01@inspur.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 2021-10-15 at 11:14 +0700, Thu Nguyen wrote:
> 
> On 12/10/2021 01:01, Brad Bishop wrote:
> > 
> > 
> > How did you implement soft-off-via-bmc before OpenBMC?
> 
> The softoff in OpenBmc is using host IPMI command thru BT interface to
> request shutdown the host OS.
> 
> In Ampere, we are using feature ACPI graceful shutdown, Bmc will
> trigger GPIO SHUTDOWN_REQ,
> 
> Linux host OS detects GPIO pins then shutdown the host OS.

To shutdown the host you set a GPIO.  That's awesome.  Nice and simple,
I like it!

thx - brad

