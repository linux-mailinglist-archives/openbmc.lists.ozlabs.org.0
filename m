Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1AB365A0A
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 15:28:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPkyk50mrz302K
	for <lists+openbmc@lfdr.de>; Tue, 20 Apr 2021 23:28:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=GWtHSvRJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=iNeAgnUJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=GWtHSvRJ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=iNeAgnUJ; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPkyS1NKvz2xxp
 for <openbmc@lists.ozlabs.org>; Tue, 20 Apr 2021 23:27:59 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EF0855C00F7;
 Tue, 20 Apr 2021 09:27:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 20 Apr 2021 09:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :mime-version:content-type; s=fm2; bh=7PELTarqDL2AZZsMysQWglcV2c
 /GpwcSw80OKysMBrE=; b=GWtHSvRJUazSk2bdCWFq5G8WO51Wth9WnBaGzUAP9S
 uEtOqlvQqlphLizd+zhgXdvwXVoF504B3vmTRxwrS6N5eJup7lUQse8uRobQ72we
 du5eylKGZJLKaw/m9fivoqTn80XQr+L8b1Qm633mOG0h5duY13kr/FjRMGz7FZMl
 gwDDNm79HVeTgjPONqkCg25fQfGb7FjkVOfxIxf3r/ea0Xv3w+3Cd4rWLdVk/DWN
 zusW/Ub9q8tYASJcTHgOP7fC//c0aHoZoX/G4YT8jItiCOzA5HANRMyidu6kE9h4
 UCKI+2/3WZJ4ptX0VW/OxiYxdRw3p0FOjFWHKbe0MyFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=7PELTarqDL2AZZsMysQWglcV2c/Gp
 wcSw80OKysMBrE=; b=iNeAgnUJcqQ8qtbdlNF4tNl+mbW4Q9IHOz+dcKwirn8tK
 q2dsl/yez5URV1MXK+cgKWWgI8Y3D2xyU4A9fXtbZMRUGsz6vlONwQLqiqkBi4BD
 zT9lqIT78dBFF0zHor0XcJ5PjdJLmlS5I1vaNKZBEOEhbW4G00D42QhFCfYpWvI3
 YFUXY5mgdYy9UqVuiycnwbSIIzdvGhJk5vMS5bmnBbBoOCBLfASVBPuyA716fRx0
 qepErVvjSNocQHec48/SUu6nkCtyZLM/6x4aqs4oKI9G+01lYCD0mQe5fgC4eotY
 fTmIQg8RK8XQXQIpB8d5/JB7o0G+bcTg8NNDVITZQ==
X-ME-Sender: <xms:29Z-YJex6xStq5xh8MP-EcVDUH_cpF7cUAYGDh61aVsLRV5lceC1Ng>
 <xme:29Z-YHNjEpvs3c8jIl14qQiKtHAARQJlIhZmvOYX3y7kLXsR4ro-3fGTxRO7j0LSq
 IyiTK3DzXlIGY7FhP4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtiedgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesthdtredttd
 dtvdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiii
 ihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpeeuleejgeefteekhe
 dvueefleduleeuffdugfdvvedtuedtleeufeduueeufeduveenucfkphepudejfedrudei
 jedrfedurdduleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
 hfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:29Z-YCgCkusfAkSf2Ix3eUsDclDGzIhCsCdm1gId64e0sT2ZvR4LYA>
 <xmx:29Z-YC9H3mzPt5xILm_60_XJPi5XoSewfu3irfbQXsi0ZPbP2kEHFQ>
 <xmx:29Z-YFtNMKzKZSULpptYSaqadOkhiN7V0SuaD_Fp_Q9MFL0950gzbQ>
 <xmx:29Z-YD08Pl1L6SjY_1PkdNtTvarNml-ULcwlVujxdAhmHoLZbdLAzw>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5ADBC240069;
 Tue, 20 Apr 2021 09:27:55 -0400 (EDT)
Date: Tue, 20 Apr 2021 09:27:53 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: minimal config and use cases other than general purpose servers?
Message-ID: <20210420132753.bu5cntwydwvgfnca@thinkpad.fuzziesquirrel.com>
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
Cc: rmsenger@us.ibm.com, ruud@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all 

OpenBMC build defaults tend to favor a general purpose server.   Most all of
the functions are enabled by default.

However, I know a number of you hack on OpenBMC and work for someone building
OpenBMC with very specific server use cases that are not general purpose
servers.  Do any of you take OpenBMC and then the first thing you do is turn a
bunch of functionality off?  I hope so - if you do, would you be willing to
share your modifications that enable this?  Does anyone have any opinions on
how this should be done?  Sets of distro features tied together with different
distro configurations per use-case?

thx -brad
