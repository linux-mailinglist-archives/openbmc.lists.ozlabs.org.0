Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9081580294
	for <lists+openbmc@lfdr.de>; Mon, 25 Jul 2022 18:23:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls52044l8z3c29
	for <lists+openbmc@lfdr.de>; Tue, 26 Jul 2022 02:23:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=F9Rig0GH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=e/MKtNCf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=F9Rig0GH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=e/MKtNCf;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls51Y5G4Zz30LS
	for <openbmc@lists.ozlabs.org>; Tue, 26 Jul 2022 02:22:57 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 98363320090E;
	Mon, 25 Jul 2022 12:22:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 25 Jul 2022 12:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1658766173; x=1658852573; bh=iwIYAQbYA0
	puJ/O1ecJGAJJmgyXpV4fRIIZd/JOv95k=; b=F9Rig0GHap+fxsx6hw+NhMzg8J
	FD0DuZy7pqaCqWkdea/Flxtg2eQTew4mtHU1luPYNZ5WANUv1R3KyEFpZL930xgM
	Ohp/95L8wb/WTMwmX9sSsoQBfOnRLfuqYzp99mjaBoAN/ChB1aSZg8B9cptbJo45
	TNViUfB24bt/35KDlhGu+x2q0uCDzygJcl4oohhXx1wvhuIwMMRuAnnEPIv0AFt0
	SAQVk8wHEzMz7WYwaGOzGSdQbPFWhX+NCKRB5iFdPqnIbeMNuHMXw4BYeE36mGH5
	/ql68YvQ3sQg234jShh1GRgskhAMg2pnYUOiyxmtPtSEldzEAGErm2eXQ5IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1658766173; x=
	1658852573; bh=iwIYAQbYA0puJ/O1ecJGAJJmgyXpV4fRIIZd/JOv95k=; b=e
	/MKtNCfHktKOYOAOj8/4fz7FvDRwH0yz5FH1WXEJUqlxAoSifYvlREGvk1ejP9bM
	nxre8y5li1DuTcWD3TSM7lSZoXtzFCCRlJJ1rKfcdDv1v3S217N2o2beMtcqvzQY
	NbjjmDqhspJoiDT1HNxs6WowFcmiWqoHhWs+g0lxQYMPy0XJ8fMnLWM1Kz8P98T3
	CCITPa1K8c8rJOhlrCXv8xRh46+nnT2niOyd5pv2rN/llbcfwPUBFrPTJPKy5Hl4
	w1jnXAotWo5dUJ0JdQsuZZwUWVPhhgVv4GP1881xTuCYLU4ymVnLi6AFlc5FE+bx
	V5VWqIJXjyzXiYOooL3/g==
X-ME-Sender: <xms:XMPeYtST0Rk37tEx_A7-4p5x7QdUvK8M0u512wIJma2cCbFtw2GzpA>
    <xme:XMPeYmyFcrD5cMW6haZxzpVg7lcj2InWzY5Uai3vaZFmWvDKAXjQDAu_3ek2Wibva
    5IieP0ayKnOWX3GGV8>
X-ME-Received: <xmr:XMPeYi0vkqMRk6d7s7cNlpw2lCtHCiymQUWJNe0WLoadKuto9nF9D-sK3cRhlvrgz_yBbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddtkedgleekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurheptggguffhjgffvefgkfhfvffosehtqhhmtdhhtddvnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnheptdfhfeeutefgueektdekgfekveefvedvtedvgedv
    vddvheeuueefkeetudethfelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:XcPeYlDw_8ObzI5Fr81zT2FJvo8ybKkux3a7nfE-LusDLcbcJMfWqA>
    <xmx:XcPeYmj25IsINnew-aMqBvBVcGsrPTC8nYkRTJ6xsJB1skJJnfVSww>
    <xmx:XcPeYpr2pB6FhpmmEgPF4x-mV6VuxMu10T4RszhJ_urXbDKRi5mshA>
    <xmx:XcPeYptoYS_V9wQ4U-RzZD_Xv3Ks1lTLt297_0nGSwHVS1ONljkHzA>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Jul 2022 12:22:52 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: group for foxconn CI / fii oem repo
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <SN6PR08MB50879F47244702D7920CC0AB9C8C9@SN6PR08MB5087.namprd08.prod.outlook.com>
Date: Mon, 25 Jul 2022 12:22:51 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <766127F8-4F23-409B-B929-F4FD7EE5EDAD@fuzziesquirrel.com>
References: <SN6PR08MB50879F47244702D7920CC0AB9C8C9@SN6PR08MB5087.namprd08.prod.outlook.com>
To: Lancelot Kao <lancelot.cy.kao@fii-na.com>
X-Mailer: Apple Mail (2.3696.100.31)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Charles Boyer <Charles.Boyer@fii-usa.com>, Neil Chen <neil.ny.chen@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jul 18, 2022, at 4:05 PM, Lancelot Kao <lancelot.cy.kao@fii-na.com> =
wrote:
>=20
> Hi, Kurt=20
>                 We need to update our list again.  Thanks for the =
help.


CCLA updated.

Thanks,
Brad=
