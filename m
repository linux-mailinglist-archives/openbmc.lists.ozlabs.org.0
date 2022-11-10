Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B78E624E95
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 00:51:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N7dsV6jBRz3cKq
	for <lists+openbmc@lfdr.de>; Fri, 11 Nov 2022 10:51:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=ewQjMx5y;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Lm8NbliV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=ewQjMx5y;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Lm8NbliV;
	dkim-atps=neutral
X-Greylist: delayed 575 seconds by postgrey-1.36 at boromir; Fri, 11 Nov 2022 10:51:08 AEDT
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N7drr0pFsz3c3W
	for <openbmc@lists.ozlabs.org>; Fri, 11 Nov 2022 10:51:07 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id B28C33200406;
	Thu, 10 Nov 2022 18:41:25 -0500 (EST)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Thu, 10 Nov 2022 18:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1668123685; x=1668210085; bh=Jk7DTEmX7s
	1t+MY4wTCO4N7WX2Xy6MHCBQ8VDodG2BY=; b=ewQjMx5yCHE+Cvb3I+qbQ6Smlb
	16w9y6VfMZbfE7orEV6uloL9PLc8y+SHFJchiQyNbpMcWuqI+sMIs8QEM02cqNlD
	ZppWpZOlJIBzx3jvBumpUpQqgjbTSgF0ekgm8uG+B3AQHQUDr20F/hHqFHiEcFSx
	gcPGdZWxIODn/m8oVfvgrN1U+3ViWCTiSgj52bEseKUw+H6GdPJ51S5VISabTqD1
	o2mNOLKU3KpS8YUdamult5MRTBM233h7PkDxpXfwewU0PbYXka4DIm7dVI+bFNuZ
	5vRRgjqSlooHH5jy1J/iuL0krRPybKFFI8VH5DH9KmJ9zH0mSJRyFcfrPR5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668123685; x=1668210085; bh=Jk7DTEmX7s1t+MY4wTCO4N7WX2Xy
	6MHCBQ8VDodG2BY=; b=Lm8NbliVApm0G7O7ci7o8v3Gfln5yGXvlKHixfHyPiwx
	5ATwYKSPmuIiWtYDWjL63UyooAy9kHBQFA5KVxvbjGioukZVdwrBBeH4TZwpoUKX
	kfoIBfK+t2KxJ4Su9UnhzVWXyFRyoHdc/EM3CYCTchxZcuP9o8iaRC8rmBUDZ1iB
	wL/sUUPib9y9m75ZbhNh7+yRb25ABdjsTRx29HeqTTd8/tp2DqXg6yZxEY5H9xvk
	HHUE3ZAHyFHuS8a0kd8a7TI0cgSfMw3sy7Scxlexg2e5be3IA4YgYt3TGVll4GgG
	DFoD72ecWhdWTD7zx6xhfwFw62cpURbGSI4dIsHJqQ==
X-ME-Sender: <xms:JIxtY0Qif4SWkNy2ISMlhfunnhqWvb41Te5HQV68ewkhNMo33JbGdQ>
    <xme:JIxtYxzLkHkCI2v0SwXKo9L_Yx32Gu_l9AW3TEcI-TrbxWCGF_GIpdZZHz3GZqwqj
    FI2APsfoQDILPuOUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeehgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
    veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:JYxtYx37UVbf2fhfKLhad8cdhoGbKtQdGiQX6QBC_sx9Jed19HjyvA>
    <xmx:JYxtY4BlI1KFhZqZsASXgUtFtPyKxqgIlnOBP7frgOCSSTqx8DZJMQ>
    <xmx:JYxtY9j7hpQYENhFQNSy6l3JGrssaF2bk1qUZVTYhzqg1hfIWs90HA>
    <xmx:JYxtY3fFoMg6YspyjNr1s2qs8fL1gzolKs9Z6Yk712cYtGqeEpWE6w>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D303E1700089; Thu, 10 Nov 2022 18:41:24 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <3d8ca8ab-56a3-4ad7-8b34-d97f50ae0d81@app.fastmail.com>
In-Reply-To: <73130EC5-5B2A-4E79-9AAD-88D26C61D71F@gmail.com>
References: <73130EC5-5B2A-4E79-9AAD-88D26C61D71F@gmail.com>
Date: Fri, 11 Nov 2022 10:11:04 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Andrew Geissler" <geissonator@gmail.com>,
 "OpenBMC List" <openbmc@lists.ozlabs.org>
Subject: Re: obmc-op-control-power_git.bb refactoring
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 11 Nov 2022, at 07:29, Andrew Geissler wrote:
>
> Here's what I'm thinking:
>
> Move these services to PSM and rename them as follows:
> - op-power-start@.service -> phosphor-power-start@.service
> - op-power-stop@.service -> phosphor-power-stop@.service

This isn't terribly constructive but I feel like given s/op-/phosphor-/ 
results in names like 'phosphor-power*' it's going to be confusing with 
respect to the existing phosphor-power subproject.

Not sure how to fix it though.

Andrew
