Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E095A9710
	for <lists+openbmc@lfdr.de>; Thu,  1 Sep 2022 14:42:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJLKf0TyJz2yPm
	for <lists+openbmc@lfdr.de>; Thu,  1 Sep 2022 22:42:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=bNFa7/bS;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=AQSOyWcX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=bNFa7/bS;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=AQSOyWcX;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJLK735Dyz2xHb
	for <openbmc@lists.ozlabs.org>; Thu,  1 Sep 2022 22:42:02 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E2FFF5C006C;
	Thu,  1 Sep 2022 08:41:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Thu, 01 Sep 2022 08:41:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1662036115; x=
	1662122515; bh=L6akDGO37cRKiyYXqWwxbYxPTczQoM9En++azm42rz4=; b=b
	NFa7/bSf+Hzl92kMDuutw56VH49nFqvpWLfmVBA2u0j1dJcbUj+rg3YcWefw4eDx
	2qbrXIiXs1QRZ+i69IEa+h1p+RorZwXtSKn/+XiDm+JQvWzdW7okmI6AgmUOxkCe
	ju1MmcQ7EJlNsDPmkNi9qXqFkfTy7yPHXOD8ZZPX0RjDiFLL/TPjytGQai5m/xlF
	ef3wD04VZROx3TH2sU8n7ZRKFqdF/MRkCx02WROZeCHV0eF5EMgaMShxsidIRPgC
	TwTaFpiwH95b18UBZbUujmW1+cfpAY41K11q3Q55lyvF1/N3nVSoUEBgwgQwKp9W
	XPEtYDiwDBtCbijBnHCoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1662036115; x=1662122515; bh=L6akDGO37cRKiyYXqWwxbYxPTczQ
	oM9En++azm42rz4=; b=AQSOyWcXzLbeDP81q0UimkPLRjeYxy4C8W4/hUgG0uat
	myGrRZBWJ5aPhhhZR0cvLCX3fmrs/uES3P9HKKuFmh0r8gwN/m3+sgx5Pj/IVS29
	JaqxduQlzKpEYERBTXgLCPagXKz7uz4K5FhZoz87b5WF1c6m4Lgh6DmrrdatZV7T
	yUnzr2fuIYw6fN/hgqvlnsRuDQR0wwnaZH6hqFNQcFrwwM4NeJWfFFaRgOiBtf7W
	yn2X3lNbcHwVIXgPxGVuAccbdPgjcNypcx+0Qo9+bA36LZU4bGTKUcYkrwY3qHhj
	NI9uh5byRpLlvwjVmgrCuC5lwwMAc58BJkLbjY5p5w==
X-ME-Sender: <xms:k6gQY4sGlBXTrW8idx_bvjc76gBWcj6h0ajPy9_X4_4XseUIVwC8bg>
    <xme:k6gQY1fHAQgM9NuasCCNMEQVpHL7VhHeP5SdmtgtFbJlZau9gdRoTnJXqo4qRKGQ-
    L5ufbdgTi4Iy5LN9SI>
X-ME-Received: <xmr:k6gQYzxibi-hmueOkwdeKcOE2MmgJHNG12bT3O13AULMRGZ5mMU_-F-N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdekkedgheejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrggu
    uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeegteeuffegtefguefgtedtudfguddvudekhfffteff
    fedvgeelvdeileetffduleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:k6gQY7MndTout8TOiNNcXt-E8cTBV1ARUtx7VyiQ-emmFEpO5B2hnA>
    <xmx:k6gQY4991DSeO7SUppte_bUNPJ9Ub-sfZOzjwSwNRrm-S2Zklxfy9g>
    <xmx:k6gQYzWMAqpICrOuQonLyYxHuGSl9ZJUX1foO5CvzYeU1AbB_tAICw>
    <xmx:k6gQY2lW-FEZ52DqGR5rv_z4Yv6XXfp2OsTsfGmdCoUf3eMpLGQqyQ>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Sep 2022 08:41:55 -0400 (EDT)
Date: Thu, 1 Sep 2022 08:41:53 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Security Working Group meeting - Wednesday August 31 - results
Message-ID: <20220901124153.ofhmyymhcra34akr@cheese>
References: <e093dea2-ca08-fd8d-3151-2e858164f633@linux.ibm.com>
 <c0f6cc7e-6c7e-fe22-498d-2c3cb7851b73@linux.ibm.com>
 <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YxCWpNZ+O89B+ulA@heinlein.stwcx.org.github.beta.tailscale.net>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Sep 01, 2022 at 06:25:24AM -0500, Patrick Williams wrote:

>written entirely in Python, which makes it very difficult for us to support
>on any of the NOR-based systems (all of them except IBM's latest).

Is the suggestion that they rewrite it in C++ and contribute that?  If 
it is, why would they invest in building a project and community from 
scratch as opposed to using an existing one just because all the other 
in-tree servers are hyper-cost optimized?
