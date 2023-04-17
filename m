Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5F56E3DB4
	for <lists+openbmc@lfdr.de>; Mon, 17 Apr 2023 04:59:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0Bbb4Fdtz3cMw
	for <lists+openbmc@lfdr.de>; Mon, 17 Apr 2023 12:59:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=le8rvGro;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CUbdqUeT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=le8rvGro;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CUbdqUeT;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0BZy2Tt6z3bhZ
	for <openbmc@lists.ozlabs.org>; Mon, 17 Apr 2023 12:58:49 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id AFA8D32007F0;
	Sun, 16 Apr 2023 22:58:45 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Sun, 16 Apr 2023 22:58:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1681700325; x=1681786725; bh=Dv
	hMSvmkQ69OxQGikqNzQFSNblB0OyIxaCT3gSBYBU8=; b=le8rvGroa9iQ/YLBX7
	+Pxry69MmqxGAZdLZBPhvLSAkPaxATKvqszrawG88EtHrPj8qlpaMOUAH3D9N6Wh
	ARd5VOajJW7DCGhEioZUQ6uJH3sswB+fzZIboVrhPNPkvLVCe0y6S/pDEBPGYuGN
	8xa1Nr9DnQb3Fi/D4zjjJzZFJAHKrqkJ8/NCZDAaIq8RnQSASDJgEJbF9HH/Cz9W
	vC2KNhA245Hyr8/IfqZqDIhsavcFT9iTnWn46ZdF29d9mswAIxRY/0jcCSEfbCHh
	AR4Suejd7Nmrq0DPexuCylit//JAWQLoUk3N9AtXN3ZZ8Y0oa6ffwisrG6UeHWC+
	2/Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1681700325; x=1681786725; bh=DvhMSvmkQ69Ox
	QGikqNzQFSNblB0OyIxaCT3gSBYBU8=; b=CUbdqUeTUkG+M8SvSJjfgKdYbYwCO
	bWMGj4lPw1pN394GZfWRxRe3gVCyh9WkLkHHQcv09FEz8f7J3T/CeIyrltOXaOR7
	9hPw3puYehC4elaTxcCxEXS4pdtYgBDTZxnNfuR+wbniDsksMB/glxmpkm1LHrU5
	N3oxpN9qnHiT8V4jItzjqj6zPWtiG6KEEIoHB2zMWbLoAnNQnDfQCKB3TyHn5h5R
	1uNLGXpx26Ff25sqRkb91bt7TaIHyfMJm4/5Ek1PLmZWF8BkXaItcoM7wvuYOjDL
	yrVOnSRxz57kjImLpWTgaQmLkK2aYUP+6hAlqu4hKjrxyrjnnAB7gWrBg==
X-ME-Sender: <xms:5LU8ZPo3Ax8NFbtIa7pS1GUhH0fPlRSLghi9GGXr712xaUzxvr7oMg>
    <xme:5LU8ZJqNF8dO3d7Fwefeko78Qri5CYhI4klJAeu_LWPltkn8sZ3Y87KhF68v7JQ5k
    co6w2I_UkIhCbcLMw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdelhedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpedvudefjefgvdejkefgtefhhedvveefteeftdekvefhffevveettdet
    hffhueevgfenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhpohhrthifvghllhdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegr
    nhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:5LU8ZMP-l_v9eDoXCyjr_qca2Uwfu6Zt-vzegvbnrd8dVx7nrtqwSg>
    <xmx:5LU8ZC4XQunsBrirmfprA_AOZQp8qLo2muZsmwLB9YVZCjLl0AgQ_w>
    <xmx:5LU8ZO72ojBCfpEAFUuS0-DhvySjQxM2MYZ5E-yWxeuSSQE3nIYhXQ>
    <xmx:5bU8ZESa5yRgQlaflb4JwmnsWc5Qbkwm5JvOpSTM1DQcNMwfdPlorg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A5B021700089; Sun, 16 Apr 2023 22:58:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <be8000ad-722b-418a-8629-ea7c90805782@app.fastmail.com>
In-Reply-To:  <PR3P195MB055571D5873D3A5F1425213BC39E9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
References:  <PR3P195MB055571D5873D3A5F1425213BC39E9@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
Date: Mon, 17 Apr 2023 12:28:21 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Lior Weintraub" <liorw@pliops.com>,
 "Patrick Williams" <patrick@stwcx.xyz>,
 "Ryan Chen" <ryan_chen@aspeedtech.com>
Subject: Re: OpenBMC porting to portwell pcomc660-ast2600 device.
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Lior,

On Sat, 15 Apr 2023, at 20:08, Lior Weintraub wrote:
> Hi Guys,
>
> I have forked the openbmc project and opened a "portwell" branch from 
> it's "master".
> The repo is under: https://github.com/wlbe4/openbmc
> I am trying to port OpenBMC into this board: 
> https://portwell.com/solutions/openBMC.php
>
> My first commit to this branch was the original code of meta-portwell 
> layer given to me by Portwell support (PCOM-C660-AST2600_BSP_20211210).
> The second commit tries to migrate meta-portwell layer to the latest 
> Yocto syntax.
>
> Changes include (among others):
> 1. replace _append with :append
> 2. replace _prepend with :prepend
> 3. move bblayers.conf.sample, conf-notes.txt and local.conf.sample into 
> templates/default folder.
> 4. Try to fix build errors on u-boot and aspeed-linux - Still there are 
> errors

This doesn't give us any insight as to what the errors were. Can you provide more detail?

> 5. Try to fix obmc-console - The build errors are gone but not sure it 
> will work (no platform for testing yet)

What build errors did you see?

>
> Some of the changes were just a syntax change but some requires deeper 
> understanding.
> Few examples are the changes in obmc-concole, u-boot and aspeed-linux.
> Since the original version is based on older u-boot and linux kernel, 
> the patches might not be relevant anymore.
>
> Can you please review the following changes on my repo:
> meta-portwell/meta-pcomc660-ast2600/recipes-phosphor/console/obmc-console_%.bbappend

It's hard to say whether that's correct for your platform, but I don't think there's anything obviously wrong there.

> meta-portwell/meta-pcomc660-ast2600/classes/socsec-sign.bbclass

Can you unpack what were you trying to achieve by copying socsec-sign.bbclass?

> meta-portwell/meta-pcomc660-ast2600/conf/machine/pcomc660-ast2600.conf
> meta-portwell/meta-pcomc660-ast2600/recipes-bsp/u-boot/u-boot-aspeed-sdk_2019.04.bbappend
> meta-portwell/meta-pcomc660-ast2600/recipes-kernel/linux/linux-aspeed_git.bb

Have you tried building without applying patches to u-boot and linux-aspeed? It's not clear whether its your own patches that are breaking the build or if something else is afoot.

Andrew
