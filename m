Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 981F2732643
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 06:41:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=f7l/GAxJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=D4pxM5M2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj61j34BWz3bVf
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 14:41:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=f7l/GAxJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=D4pxM5M2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=lists.ozlabs.org)
X-Greylist: delayed 484 seconds by postgrey-1.37 at boromir; Fri, 16 Jun 2023 14:40:51 AEST
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj60z4x14z3072
	for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2023 14:40:51 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id BD75F32002D8;
	Fri, 16 Jun 2023 00:32:41 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Fri, 16 Jun 2023 00:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1686889961; x=1686976361; bh=t5GPVh8Ebr59E7jkYzWVuyzoj
	JKGQ4BJoxBZKWXhKq0=; b=f7l/GAxJ9sCfNS6mwo0iE6qYgCKZDG8ICqJwSFo42
	xaIo11LL9RtOJ0ORDn6u3VhxNMDr5kWCE4rUMrEqsBqfxjRsJDfHw7j/sMM0Hs5b
	eddLl0hB/7my81I8yO9/9bc8VNzrKRYbK55j6Q+cie8tSQ4bX1XZMj3vO3rwMuXo
	jxsde8yaLbkg87PLxlb4MfH3biepsBZH78YQF56JzUlcOWPdm1gnH2HMbFpKW1VD
	hME1CzCfjzBeYFc5BD489hzjjPFyb24PQmTP6flcOANV74uH4+0rC9SV7pYgCQnA
	pXUTGXI5ciAbiMHeCKI/J6k7LtALCCGJ8Q6Y0EhkWBD4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1686889961; x=1686976361; bh=t5GPVh8Ebr59E7jkYzWVuyzojJKGQ4BJoxB
	ZKWXhKq0=; b=D4pxM5M27uIZImAbP8xx2GYt/2A40MZtA9MY6qlzL7nc6GNhrN9
	htegDFzSDTK1PFQceeu55KLkzjK5ksPLyasr+NuLq9nBMlt1lG0wfPYpfWFRTdFT
	m17862JR8mf+uo3/CIfRr+kRXZDy/ErXzCL5I3VsVylSarCAtjvo+klzH9j6koS3
	BzxWIrFkN1LHlf4z4AO3oEvheiy+thpvv5JP+9mQ681g3+Gw4wimUtOk9R+pmfAG
	EZDF84G4CWRqzmkT3lNmi/iGE1ryUedBvh8qp0Wc+sr1r9P6UFdoGfhHSdW5puxN
	wDQHJA14+fG/J3qKL8G71tAsKyNzs9opkEQ==
X-ME-Sender: <xms:6OWLZI8HBI57W_qkEUB8LjAf-igo2WpUUZtC2sBVHQDadgzzzK7g2g>
    <xme:6OWLZAvOS1g-023RaNjBTWXI3DmwgIAdnHnSfVQrNAMvIk-yHrngyHzCrWGBqhL9A
    Y_5nFS6_SJIzXwREw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedvfedgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkfffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpefhkeehveegffeihfejvdekkeetvdefhedtfeeiheffvdefgefhgeeitdeu
    udetudenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhsuhgsphhrohhjvggtthdqmh
    grihhnthgrihhnvghrshhhihhprdhmugdpohhpvghnsghmtgdrohhrghdptghomhhmuhhn
    ihhthidqmhgvmhgsvghrshhhihhprdhmugenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:6OWLZOD06CbEs_BrBZnR-STD4yi0sp0ZJAELCxbj_9va_aDpZ-AMRQ>
    <xmx:6OWLZIfvlCC4YID8R1klaSbZcLAOPv79LRjCuOW694_Ju1NTp1aCwA>
    <xmx:6OWLZNMKVc2wpTSl6baFfTyi3m22KSDinRnDL-TC-yJpqOot3xu6Nw>
    <xmx:6eWLZL3E0UYBHCXdexh0hi40NMJ0GdhlExPM25B8FiN8R1yhnPFokA>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BFF9F1700089; Fri, 16 Jun 2023 00:32:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-496-g8c46984af0-fm-20230615.001-g8c46984a
Mime-Version: 1.0
Message-Id: <afb45974-9153-42d6-a53f-a8f74ef68d61@app.fastmail.com>
Date: Fri, 16 Jun 2023 14:00:51 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: apparao.puli@linux.intel.com, richard.marian.thomaiyar@linux.intel.com,
 openbmc@lists.ozlabs.org
Subject: openbmc/service-config-manager: Notification of unresponsiveness
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

Hello AppaRao and Richard,

A complaint has been raised to the Technical Oversight Forum that one or more patches to openbmc/service-config-manager have not been responded to in a reasonable timeframe.

This is the first notice of a complaint of unresponsiveness.

The project has recently defined some constraints on timeliness for reviews. This helps to set expectations for both contributors and maintainers. Maintainers are expected to find time to provide feedback on patches inside one month of them being pushed to Gerrit. Upon complaint, missing this deadline forms one count of unresponsiveness. If a subproject's maintainers receive three notices of unresponsiveness within a 12 month period then the Technical Oversight Forum will seek to introduce new maintainers to the subproject.

Further details and considerations of this policy can be found at the following location:

https://github.com/openbmc/docs/blob/master/process/subproject-maintainership.md

The complaint regarding openbmc/service-config-manager can be found below:

https://github.com/openbmc/technical-oversight-forum/issues/27#issuecomment-1589985292

The specific patches identified by the complaint are:

1. 63275: clang-format: copy latest and re-format
   https://gerrit.openbmc.org/c/openbmc/service-config-manager/+/63275

2. 62387: meson: remove deprecated get_pkgconfig_variable
   https://gerrit.openbmc.org/c/openbmc/service-config-manager/+/62387

If you are unable to continue with your maintenance role for openbmc/service-config-manager then please work with the community identify others who are capable and willing. Please consider the expectations set out in the community membership documentation as part of this effort:

https://github.com/openbmc/docs/blob/master/community-membership.md

On behalf of the Technical Oversight Forum,

Andrew
