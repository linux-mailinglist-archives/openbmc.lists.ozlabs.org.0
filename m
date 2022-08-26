Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4015A2B74
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 17:42:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDkbb1XVLz3bY8
	for <lists+openbmc@lfdr.de>; Sat, 27 Aug 2022 01:42:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=DDtCptn3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=TvtfqN+4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=DDtCptn3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=TvtfqN+4;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDkb55ZHTz3bY8
	for <openbmc@lists.ozlabs.org>; Sat, 27 Aug 2022 01:41:36 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id CA5ED5C02B4
	for <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2022 11:41:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 26 Aug 2022 11:41:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1661528488; x=1661614888; bh=LjlfZhQatf
	8jYpCQZg+ASaNgaQRS66NuqZxL6UUyqcE=; b=DDtCptn3IiKC7HtCt4UdnvoPUf
	Eb6w9LUlxRFGAOthHzObcjBOUrnAfu2XEUI5w3oiO6plV+7IHq+J+jqu5Oj5UOnf
	e06EVI9g/Ikw0uASArhQ+bd8bX/29qp93mxij7XRkcVi2+RfdjwVWKH49mck1M+F
	ZUjsVREAlVVjeQT6YU+3bU3sSNZL/WDGMEU7vasZ64HnRwKbOrMQG2CLdKfRbGG1
	zi/uLJX+e+HprBmc5GXS/nAMcfSZ0hXYn9nP1g5jP/6ePTNsaMqFLhLP8lLUKvaW
	vKP0ktVuZyLcw2t/w9noTfwgKPZq+OO9lfeUetx+Qu8LdtyEbCJBfI+DR+iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661528488; x=
	1661614888; bh=LjlfZhQatf8jYpCQZg+ASaNgaQRS66NuqZxL6UUyqcE=; b=T
	vtfqN+4lQNxVaUo7oXaXOr1QJW7lUzyWEmt21sfH+jnCD0PkpngiTB9FwF2usQVy
	zrayZGZQL3rRcEB/as1oSJx7pZBSEcRxC7JEQ/LF5QNSyex3Vpsb77yYkKeWpvCn
	FZRIDBSQ19wWdUq/LRUABKRRaPB4yY+0nvJc08F8E1PCQpCp3HZfOQfdGJeCDSxG
	VywS4GLDA41yvMqMJWpVCv35gQzkiHZB05uicyxbvet3j0GUAsJP76oHrlDH34he
	VUla36Hosd2JUgpm7RfvvIHQIEd7pT1kFV797oAAGKa7YdMX6gZRtRpzRFJiHhDK
	KFVM8a6Sw04MtVE05fxvw==
X-ME-Sender: <xms:qOkIYzOjmtpmH0YGyXWZ08Y7CYq44n3c7aAUEDrb2y9qWAu4NsNS-g>
    <xme:qOkIY99qcfdTn6u0H22W8TLeugsIvbgLiQRyCmjLkJcsCq7x9ImbkApt0ehHWaw8P
    jQbBB3IAN5hNUWfVtE>
X-ME-Received: <xmr:qOkIYyQzQyCk4FspOq3FIH0zs28eO5Bd4R236aoC12IL_MTBmab0xm4l>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejhedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesthdtredttd
    dtvdenucfhrhhomhepuehrrgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiii
    ihgvshhquhhirhhrvghlrdgtohhmqeenucggtffrrghtthgvrhhnpedukedvuddvffevje
    fhveejieehhfdvvdffgffglefgkefgjeetiedvhfevuedtvdenucffohhmrghinhepohhp
    vghnsghmtgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:qOkIY3uKor5usNomOd8t6mU6P4t7cs6x9Ttd4hnxfRdp7kPL471ZRw>
    <xmx:qOkIY7c8R8OOp1vY4UyVg2efaWhafzuDgZ7exteKwVss9VPBQQmUcA>
    <xmx:qOkIYz3ge1Fn0k36Ycxp1QI1TlipjSecjruV6IyiMPMq9q6UJvPgPg>
    <xmx:qOkIY5p6_rneeBUb0bG1IquzOCmVOkxZuRo-fNulkg_cwqo-3P6tXA>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2022 11:41:28 -0400 (EDT)
Date: Fri, 26 Aug 2022 11:41:26 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openbmc@lists.ozlabs.org
Subject: removal of mapper allowlists
Message-ID: <20220826154126.b265sq7vh4qk5b7q@cheese>
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

As a part of an effort to reduce our bitbake metadata complexity I have 
made a mapper change here: https://gerrit.openbmc.org/c/54243/ that 
removes the need to configure lists of service namespaces.  Instead, the
mapper will introspect anything that claims a well known service name,
with the exception of anything in the org.freedesktop namespace.  Please 
let me know if you have any questions.

Thanks,
Brad
