Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E383B440072
	for <lists+openbmc@lfdr.de>; Fri, 29 Oct 2021 18:37:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hgp4n5GV2z3000
	for <lists+openbmc@lfdr.de>; Sat, 30 Oct 2021 03:37:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=kBbUoCdC;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=S/GnjTaa;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=kBbUoCdC; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=S/GnjTaa; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hgp4N3qzcz2xCk
 for <openbmc@lists.ozlabs.org>; Sat, 30 Oct 2021 03:37:24 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 955005C01C2;
 Fri, 29 Oct 2021 12:37:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 29 Oct 2021 12:37:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm3; bh=xq2
 F91V71SKW8umBWMuGTUdvAKMnZwTZhRMUMiGOEbI=; b=kBbUoCdCOI0lTOIhas4
 MYvq1PzGJNcWNiUQHdFUf80t6XIFPoOTxX2IceK8DqizqPfixwQao7/Myuj1OQct
 mosIi0ICta/FG4+j0W2THresA97v+RyNRnawnQHu5UcW8Kw2ouj+YEHHkTGROxJe
 w1msFALE0T8092JS8bv9jlel7ASveBNjPraWmlRrfYGLOFfQDZYkRMv5owIp9545
 0exY0PJqtQJRdjme7JrIVShLKdpO2P64kyMYr0i2nz0OBl10Y2+h1JgR7KeuvUX8
 dTtdljE3KTUYaLVQDm0G/k0rE3fPc/lAihGul3AKzwZGkV9VYbR+V9mViCIQl9jj
 7ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xq2F91
 V71SKW8umBWMuGTUdvAKMnZwTZhRMUMiGOEbI=; b=S/GnjTaaoK6FCaSW3aP7Jh
 BywrfmiHKKEUloKwP2dhnnNo8le6f8Oq192mwFwrnDRx57Fp1R3hmU2Fj3M49bzE
 UxFt2m36tZxoPJyhqpITDcP+DalM7OVc3VYE29NrgWtDTqlhbLdgcOIMI7P62sDH
 PLA+2k7Jy9e3rrP9yJZ0RU31X0cJTgCUcEYf98GC+BYNiEaRzteqaVLfZxhCOc82
 LtPkd+v0yImzhimRiVK3MeaK+ZUl03tFCBe+z+VqINRESrCdlwDoPLDq621Pa2RA
 nvird+W9aAdQOKh70Wgh6bDp+/51FVTARXt3Qyyy67GjaCerR/9e5pfeWOIxAVkw
 ==
X-ME-Sender: <xms:QiN8Ydl3BUVRMNjJ3uKSFOfCUG4mO0HVisj1E5JWenOo-s86OwpIOw>
 <xme:QiN8YY0ZAz-DgJO9t4VsJ3-49RdUWoMq1eMi83e9TTxA_Rzkm7zHvfxA3GLjPaAcJ
 dtoGXQKRn7E4hGgOpg>
X-ME-Received: <xmr:QiN8YTrnomjGsSFylbVrPfmr4foqz72g26y22G-9UpEPkXmXBUDFKNGJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdeghedgleekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:QiN8Ydn7daPfB8gn2PrkBnXTz0RbX9WezZzH4MLQ-MaIa-FTtR7zZw>
 <xmx:QiN8Yb310C8Bv08wK9F_fC4KTF-umPMSV-HQZGiOHe08lyCK1G6gGw>
 <xmx:QiN8YcsL4wk7bWVY3tLTyeyIHKdG8woTsiqsvv7I7b8nNHWpL4XHPA>
 <xmx:QiN8YY_xS0Rr6piFf_0BfXlXCKfOh92x98Y-CiJe1dSnoXLGlt6wwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Oct 2021 12:37:21 -0400 (EDT)
Date: Fri, 29 Oct 2021 12:37:20 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: OTP-5: "OpenBMC TOF Proposal" Process
Message-ID: <20211029163720.ztct456rqf7tmezj@cheese>
References: <YXDtrwHhUcxwtlij@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YXDtrwHhUcxwtlij@heinlein>
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 20, 2021 at 11:33:51PM -0500, Patrick Williams wrote:

>## Definitions
>
>* OTP: An "OpenBMC TOF Proposal".  Any request to the TOF should be framed as
>  an OTP as documented by this process.
>
>* Author: The individual(s) who write the initial draft of the OTP.
>
>* Champion: A member of the TOF, confirmed by the current TOF chair, who will

What does confirmed mean here?  The chair will document the champion 
somewhere?  Also what if nobody on the TOF wants to volunteer to 
champion the proposal?  One will be appointed and try their hardest to 
represent the interests of the person making the proposal?

>  work with the Author while this process is being followed to ensure that
>  appropriate updates to the OTP are being made.  If the Author is a member of
>  the TOF it is expected that they will also act as Champion to their own OTP.
