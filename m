Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 566B5614151
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 00:06:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1TL61f2Hz3cJc
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 10:06:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=TAx9FKWZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FFyhfZxH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=TAx9FKWZ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=FFyhfZxH;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1TKQ5tkgz2xrk
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 10:06:01 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id E13795C00F3
	for <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2022 19:05:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 31 Oct 2022 19:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1667257554; x=1667343954; bh=ri7HuCGvuG
	IHm9ZfC4gRsaxStC5X4Rv2atRDa4MNP8E=; b=TAx9FKWZgm1MhuQ6/QaIapo5Cn
	wt4xp0ZUSvzDvQKJymkkpcKtDZN9sxo4qhAfTWovzWm1VchQhHpS2kkTgcCwSaVt
	UXEPvlfQj23pY/k+4u7rVYIn/jf3CZJxbP+IgOo7h0WVAVGOwjAy9lUwhHs5wd11
	KX+UBYiJ44LWAb5x8Rz4Fqrn1cNx6BhY8B4zwAy+4z9Og8IUoBp8bLCtcgdRkhV2
	DJhvhLEWLXd/KWo/6gSKTrjxBMBhPEgsN8mgMsgp6M1H7s/PLzU268TjOozP5BRs
	JmxOvm2BDzhifgY4+YFIduzrCoPTAm4qpHo7dfF5P1x+PiVZWscBx5jY+7VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1667257554; x=
	1667343954; bh=ri7HuCGvuGIHm9ZfC4gRsaxStC5X4Rv2atRDa4MNP8E=; b=F
	FyhfZxHMRZAjYPw46lZ6qOrxfpdhBjNMiIbpsYYrpUCfO/nlu4CkQCeZlJpfX20m
	lp21ic2eseeoeK/L0Vj7s2TR0BM9za+PB85Yq9XZAdJ9J5TwfX1jkyGjTqcaQ3Yf
	YDiYqL6R1Wbq6ugcaDpVVFPO0G7aaNdBlb55B60KqiI9om8DQFBy3dVQ+5W10tBC
	/+CSpKFKu8/W9hLXluVk14DZ94JZUslx/3O4B6z8KnAXII3J6Jb/POFjitVj6Gzc
	CAJXMEZ8Pd8BjI9iU+us0ihKnupxCnTuGAQ620V6ExhOJn6YOC5M/ZCTIhz41hMN
	8JkgCuNiJses2pdwf+UwA==
X-ME-Sender: <xms:0lRgY_7dlFqTiClo_f6K6iUn7tIm3XvcAta2r1HbdN37A4z8xr5u4w>
    <xme:0lRgY07V8oKxRK7sSrtyqwFB6F8f7K4FduO2HTG9pWCeMQqqWUq4RjODcWihFvoaK
    45iZHvj4vW_W-MJc1s>
X-ME-Received: <xmr:0lRgY2c-USzyawKYDc-IWMqmOrsMrT0JGLZ24d4Gc84qxiWGc5f5U5EX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudeggddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehttdertddttd
    dvnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihi
    vghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepjeejheejteffhedvff
    fhkedvuefhhfduvdevjeekveekvdelfeduhfefteekfedunecuffhomhgrihhnpehgohho
    ghhlvghsohhurhgtvgdrtghomhdptghonhhfihhgrdhmugenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgv
    shhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:0lRgYwKIf_ppxpnhwRkdzwbrFyH_qtZDn9bD6GkjBkGKk_r5by0bWA>
    <xmx:0lRgYzJ5mpa_aV8d8C8cxVFejSExSSmUWZI8X3_sjYfAUfGchTwxZQ>
    <xmx:0lRgY5wip39WLmEQfy0rcVhoO9_KaEo2_VotlXVD-knjOjbY5iseWQ>
    <xmx:0lRgY-kj02mfa6ga-r0aV9ue9nLCUOxHuHjW3osy5yYalmdvzDK9BQ>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Mon, 31 Oct 2022 19:05:54 -0400 (EDT)
Date: Mon, 31 Oct 2022 19:05:52 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: project wide changes to maintainer ACLs
Message-ID: <20221031230552.5ssc33v2xnghooqy@cheese>
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

OpenBMC maintainers

This coming Sunday, November 6th, absent any feedback here I am planning 
on:

1 - Removing admin repository access by <xyz>-maintainers groups from 
all projects on Github that use the OpenBMC Gerrit instance for peer 
review (no change for projects that do not use the Gerrit instance like 
the kernel, u-boot, or qemu).
2 - Copying the submit prolog rules from the openbmc/openbmc Gerrit 
project to the openbmc-all-repos Gerrit project.

Impacts to maintainers are:

1 - Members of <xyz-maintainers> groups will no longer have any special 
access to the GitHub repository (such as push, force-push).  If anyone 
requires such access, please respond to this email.

2 - You may now delegate the Gerrit OWNER role via the OWNERS file in 
your project, as supported by the OWNERS plugin documented here:
https://gerrit.googlesource.com/plugins/owners/+/refs/heads/master/config.md

If there are any questions or concerns with the above, please reply.

thanks,
Brad
