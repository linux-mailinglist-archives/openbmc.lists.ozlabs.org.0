Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA305607A18
	for <lists+openbmc@lfdr.de>; Fri, 21 Oct 2022 17:07:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mv7BD4pL9z3dvv
	for <lists+openbmc@lfdr.de>; Sat, 22 Oct 2022 02:07:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=gnpE0/0P;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=HLGvW2te;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=gnpE0/0P;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=HLGvW2te;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mv79Z4Mdhz2yfg
	for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2022 02:07:13 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id AC3E45C0051;
	Fri, 21 Oct 2022 11:07:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 21 Oct 2022 11:07:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1666364829; x=1666451229; bh=2W7qCJPrT8
	maun/3hjeAHd5+ucL7B18r4hsxviRHObs=; b=gnpE0/0PR9q+qWKZ89gJRsgm7C
	gHf3el4PBl4nLBQFI1lwV39r5e132vz9m65S68vHmilUarWTPg2PQBd6PBMD2cF4
	KS7zD7POCncw/mSh9NmMojxF5RjNVm6Bb6QH8e60R3wwWVPGZOPN0icGzDaDeyYd
	KnCcWtktryTIW5F7iKeoQKQirqLOg8PpaDYmHVmBNbfXJvXnUM88hkSjkDufUXwd
	xgbpgTJW++5hTUXo6hU0BYVgE0K/SD+sC0pBmcCcUYhZANPbLV1LjFjlGL+3Bv5R
	8CioI5985yXi86kpS4ohaVB+eFxNUtCSqKSeOyiWA6QnrNX6sdhlcEZRVLdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666364829; x=
	1666451229; bh=2W7qCJPrT8maun/3hjeAHd5+ucL7B18r4hsxviRHObs=; b=H
	LGvW2teYcdj6MaeFOAnjbdt0ndnVGY1PTNLUOvz048MEWnFOTBUPIDR0pC8VOkES
	a5MWonIiLUHqMOT5V64t24AsMaSTcykZdzFIxn+m5Js6moW0ZedHrFHiHTI7xuxj
	J1I11l4miOlv2BYV6Osglxn34dN+wcxezayol2W3R1ZnmsVNwfFiT2LysCQ2LBrB
	pNfeKdAW1ZwrXXSvnY1rurt1YCLnCOFQxs6td0Wwf/Z8LkB39i20Rq274OMQf5mE
	AIUVk2RJ21QwHEdIp6uRNsq5nS1d/8/kFdMawWLRRnj0KK85LmA1HySNY2Sqsn7P
	ZxkoLIgGgdkvX4yxqs9bg==
X-ME-Sender: <xms:nLVSY-8IcxPbizRNtqD8P1C1vgw3l8pS552uRSJPRxgY595jPEe4Rg>
    <xme:nLVSY-ujS2gOWJKWg9a1NxBL0SJeRUrXrTdGpe1GKOpDuQpD9M7PGgXY7FJ6R_Njt
    h_eEkmZrCUq0pWkTLU>
X-ME-Received: <xmr:nLVSY0BFfjsGSLduh7ros7y7-vpmtpraajtseBZYEQ3X0EQjFO24oRiE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelkedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesthdtredttd
    dtvdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiii
    ihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpedukedvuddvffevje
    fhveejieehhfdvvdffgffglefgkefgjeetiedvhfevuedtvdenucffohhmrghinhepohhp
    vghnsghmtgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:nLVSY2do3mJSlVIT_pf51t8Xpvt7Fzdcev1_9FOYQ7X3kkxMr9UtJQ>
    <xmx:nLVSYzPCtrf2KCtVotKsRSiUSpRdA2b0OOdPNHsn1h9XQ1Cwt8lNuw>
    <xmx:nLVSYwkeNS2875aq69JA7aGejXzka8jE5Vy85i-IRgqf_WZtO7S6Pg>
    <xmx:nbVSY1XK1gIoK9qPeggGdGRN1AXKJr-pwSOGPMLyaqYSNpEdqE8lkw>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 11:07:08 -0400 (EDT)
Date: Fri, 21 Oct 2022 11:07:06 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: wltu@google.com, openbmc@lists.ozlabs.org
Subject: New mapper interface proposal
Message-ID: <20221021150706.hkytptw3iwqbb4le@cheese>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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

Hi all

There is a new mapper interface being proposed here: 
https://gerrit.openbmc.org/c/openbmc/phosphor-dbus-interfaces/+/57821.  
Given where the mapper sits in OpenBMC it seemed good to highlight this 
addition.  Please have a look if you are able.  Thanks to Willy for the 
patches.

-brad
