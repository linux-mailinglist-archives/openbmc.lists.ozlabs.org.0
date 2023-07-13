Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D49A57515DA
	for <lists+openbmc@lfdr.de>; Thu, 13 Jul 2023 03:39:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=a5lRXH7o;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JFPW3065;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1cj557j7z3by2
	for <lists+openbmc@lfdr.de>; Thu, 13 Jul 2023 11:39:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=a5lRXH7o;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JFPW3065;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=lists.ozlabs.org)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1chP72gmz30MY
	for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2023 11:38:45 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 5F45B3200312;
	Wed, 12 Jul 2023 21:38:41 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Wed, 12 Jul 2023 21:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1689212320; x=1689298720; bh=nr8yoac+RY1t+WsdiJqOFGSj7
	P/4pb4mDPyANm53Qio=; b=a5lRXH7oDJLXRwRbVfWgDBGndYaI4R89OkpeZUvLr
	eWp+mULnZfturpZdlIMjDOxPszUltnoqLaXAUe7Hv0cy503aWgRrRYqrAh7BCI1t
	k1EggbxRe5jL+QaiPQbPLNm1789W1+UOJh/vBkhrGVFbIn7up9pAF99VpIR1dTjW
	BZX4J39vEpcCF3EptpRnbRsnJMrVR4CUiTYA2vpx+nzkll9Mf1QsG2+X6IGcvZfM
	GbqLfMxs3eqk7mOnSjwu4cLaDIX5DfazETaFymx9jW/YxXYIGfxV695R9l99P+jO
	EefrQeWQOxdYy/FII8U+psO1FFKINzbSjCiM1GkEIJ9cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1689212320; x=1689298720; bh=nr8yoac+RY1t+WsdiJqOFGSj7P/4pb4mDPy
	ANm53Qio=; b=JFPW3065WiOaVKdhXkGTI6rJCsZ8Xm9awq/YZDo2ueiHDsmXh07
	GpMDQtpSGc4ZYvKqQKfstjLMENdUEU6ONtTJYF1v3nKsGM/13c094d4DMZrGJ7G0
	mIGSwvvXyMGl8wDfbJf0/V3lV/7cwUXBI+2+V8iJzyPSalJk7wigXY65Hd3XKtYN
	OdAk0qFVYJSwr04CmPr7/MPIfX/0zdWiNqVx1HKLg1wrjv/f5e+984ZUdKyEMzZI
	s6XalaZIT2LqJAOdtFtq0YnjjqltWPn3H2fXXtVyQNNYQMuTaLq4QaOyvKELQZ0a
	8RBSEfn475KyfhFfNFLWzUVdJ/ILuJxQCtQ==
X-ME-Sender: <xms:oFWvZA4brq-NhA5LL285n51yqWqghy_CCeK6cUvKKxBBOip1WzaCbg>
    <xme:oFWvZB41TpbnhTWvFadLUNaM-bfCJIsgsBU1Zv5buk0gHaxrYLguSskC2Vc5P3cty
    9u3InzCKi6w-IpF9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfeefgdegjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetnhgurhgv
    ficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrth
    htvghrnheplefhffekfeeuvdfffeelgfdtteelgfdvuedvjedtieelfefhiefgjedvvedu
    uddunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmpdhsuh
    gsphhrohhjvggtthdqmhgrihhnthgrihhnvghrshhhihhprdhmugdpohhpvghnsghmtgdr
    ohhrghdptghomhhmuhhnihhthidqmhgvmhgsvghrshhhihhprdhmugenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
    ugdrrghu
X-ME-Proxy: <xmx:oFWvZPfpDTYW9gx5xsHVNtRK-s_byj2E-2YU-Iito4PjqMGwVreb_w>
    <xmx:oFWvZFL0t6qMSsRCJbKxfpit8_qttZi5i1YQ_s9gCJl_wd2NXeOtlQ>
    <xmx:oFWvZEJ3sIkla4qCaheLh_MolCqf5HKTWdjOnF6V8vHrb0qNdEgcHQ>
    <xmx:oFWvZOh3ppuCh11ZA8IhiQVngxgEXxDsJw099LyDKZPbf9blg5mc_Q>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4AB811700097; Wed, 12 Jul 2023 21:38:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <d47818d4-4167-4508-bec0-db6eee93edb0@app.fastmail.com>
Date: Thu, 13 Jul 2023 11:07:47 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: ratankgupta31@gmail.com, vernon.mauery@linux.intel.com,
 openbmc@lists.ozlabs.org
Subject: openbmc/ipmi-fru-parser: Second notification of unresponsiveness
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

Hello Ratan and Vernon,

A complaint has been raised to the Technical Oversight Forum that one or more patches to openbmc/ipmi-fru-parser have not been responded to in a reasonable timeframe.

This is the second notice of a complaint of unresponsiveness within the past 12 months. The first notice can be found here:

https://lore.kernel.org/openbmc/f086d7a4-7363-4e90-b070-af7ab65a6475@app.fastmail.com/

The project has recently defined some constraints on timeliness for reviews. This helps to set expectations for both contributors and maintainers. Maintainers are expected to find time to provide feedback on patches inside one month of them being pushed to Gerrit. Upon complaint, missing this deadline forms one count of unresponsiveness. If a subproject's maintainers receive three notices of unresponsiveness within a 12 month period then the Technical Oversight Forum will seek to introduce new maintainers to the subproject.

Further details and considerations of this policy can be found at the following location:

https://github.com/openbmc/docs/blob/master/process/subproject-maintainership.md

The complaints regarding openbmc/ipmi-fru-parser can be found below:

1. https://github.com/openbmc/technical-oversight-forum/issues/27#issuecomment-1632793299
2. https://github.com/openbmc/technical-oversight-forum/issues/27#issuecomment-1632803581

The specific patches identified by the complaints are:

1. 63228: clang-format: copy latest and re-format
   https://gerrit.openbmc.org/c/openbmc/ipmi-fru-parser/+/63228

2. 58446: fru-parser: Remove the use of mktime
   https://gerrit.openbmc.org/c/openbmc/ipmi-fru-parser/+/58446

If you are unable to continue with your maintenance role for openbmc/ipmi-fru-parser then please work with the community identify others who are capable and willing. Please also consider the expectations set out in the community membership documentation as part of that effort:

https://github.com/openbmc/docs/blob/master/community-membership.md

On behalf of the Technical Oversight Forum,

Andrew
