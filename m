Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E5D73265C
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 06:52:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=plq72/AZ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Laubvez3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj6GG6dGYz30dm
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 14:52:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=plq72/AZ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Laubvez3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=lists.ozlabs.org)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj6Fg5Kg1z307s
	for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2023 14:51:51 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 7B9A332004AE;
	Fri, 16 Jun 2023 00:51:49 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Fri, 16 Jun 2023 00:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1686891109; x=1686977509; bh=pE5rGgm2WNWpkxo9sk+/ZCXQc
	i9N51rZKCUTBNQIauY=; b=plq72/AZsPG+ZeD3Gx5bKRbxqyYuBa9wyaFOwoCJO
	rsV3z7xeOoDLmjjzJ0LOpToq5NjbG1ueEvN+/+Z6msqCWyxDmK4ygxOYhpo5xdLy
	utfo5kYxpg7b6yjBnHrERq9gvGMhgcKCSt45k0MYBffT/dwSDT2y0RrVt7azapW4
	E1s0tJGcitxOP6t8vuNhWpepVHY7Vfu49cZwSmgi3GB/JpN0A1StN6eRs85TTgH+
	K6OOqxjkClvQar9NFtp2RLIl+ivBGvggKRhu7F37J3h8z1ApcwmI7UIoIu25OSLJ
	dAHnYMSzvLonEYyjWrH96vYxQQ7W92YJpOnoY8vA0zzAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1686891109; x=1686977509; bh=pE5rGgm2WNWpkxo9sk+/ZCXQci9N51rZKCU
	TBNQIauY=; b=Laubvez3FEfzZtS9S20IviQFWENQFGdoI8h87K1cneoixa7DfJ5
	h0TZeDvu4GJgiJoeCpYz6LTZTNpRoKfnbVnaHNMFaOUvdaGtf+Qb5U1nK6h29tVa
	kURCxumTLjhoCoDVbus2HKbosPty+c0zfjv5awjq5/lWbg4yVVJb7aEMVjwqrUgK
	88dxQ2SUQWVF9E/k0tDs4rP88doIITVmENu/U8ncNaMuFcaIa2KCpg/8X0huTIMK
	ivwEzXxr/H7JApm7bt/BlQOLVeMVwd/zQHH5042WlCDisOERiqSfrVXbz1DfXbJp
	zBeBfgEuWeEV44XpQqtX/bfTCtXxeWWk7rQ==
X-ME-Sender: <xms:ZOqLZFpQJdJSswMRt7CSFp_YHgPAIbGon3U6AZ91YGvElpYkz3cPcQ>
    <xme:ZOqLZHouAmf2bKVCtU5pPibXVXQ-MrNPri3caJqaj0rGwcIk1G8bS_LU6F01WRDOf
    GlujrVxt1a2HWz6ig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedvfedgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkfffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpefhkeehveegffeihfejvdekkeetvdefhedtfeeiheffvdefgefhgeeitdeu
    udetudenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhsuhgsphhrohhjvggtthdqmh
    grihhnthgrihhnvghrshhhihhprdhmugdpohhpvghnsghmtgdrohhrghdptghomhhmuhhn
    ihhthidqmhgvmhgsvghrshhhihhprdhmugenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ZOqLZCO-h22Y9MqRTDGnmVafqa6Yz1GLpLClxnBBIH39e_vgcH3-dg>
    <xmx:ZOqLZA7Txn6_pWxNYYifMj4pYdbYs8ug89LtnDpXBbAaAfTDKuJD8g>
    <xmx:ZOqLZE41co2qHk_PwtraiUzHdptkLJ1HfIpciWruSl9wOEW-BPtxsw>
    <xmx:ZeqLZCTyEyNVhNUEH8pUfRjQ1nKRcQ1A6EZjP0rxvqKmL3iL8Hp56g>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 3E4731700089; Fri, 16 Jun 2023 00:51:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-496-g8c46984af0-fm-20230615.001-g8c46984a
Mime-Version: 1.0
Message-Id: <44c7eb21-fff5-4300-9a81-b89848245dc0@app.fastmail.com>
Date: Fri, 16 Jun 2023 14:20:35 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: george.hung@quantatw.com, will.liang@quantatw.com,
 openbmc@lists.ozlabs.org
Subject: openbmc/phosphor-ecc: Notification of unresponsiveness
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

Hello George and Will,

A complaint has been raised to the Technical Oversight Forum that one or more patches to openbmc/phosphor-ecc have not been responded to in a reasonable timeframe.

This is the first notice of a complaint of unresponsiveness.

The project has recently defined some constraints on timeliness for reviews. This helps to set expectations for both contributors and maintainers. Maintainers are expected to find time to provide feedback on patches inside one month of them being pushed to Gerrit. Upon complaint, missing this deadline forms one count of unresponsiveness. If a subproject's maintainers receive three notices of unresponsiveness within a 12 month period then the Technical Oversight Forum will seek to introduce new maintainers to the subproject.

Further details and considerations of this policy can be found at the following location:

https://github.com/openbmc/docs/blob/master/process/subproject-maintainership.md

The complaint regarding openbmc/phosphor-ecc can be found below:

https://github.com/openbmc/technical-oversight-forum/issues/27#issuecomment-1589985292

The specific patches identified by the complaint are:

1. 63285: clang-format: copy latest and re-format
   https://gerrit.openbmc.org/c/openbmc/phosphor-ecc/+/63285

If you are unable to continue with your maintenance role for openbmc/phosphor-ecc then please work with the community identify others who are capable and willing. Please consider the expectations set out in the community membership documentation as part of this effort:

https://github.com/openbmc/docs/blob/master/community-membership.md

On behalf of the Technical Oversight Forum,

Andrew
