Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D137E73266D
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 06:57:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=i6O31sp8;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=J/Kzlq/P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj6Nc4WbFz3bZF
	for <lists+openbmc@lfdr.de>; Fri, 16 Jun 2023 14:57:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=i6O31sp8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=J/Kzlq/P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=lists.ozlabs.org)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj6N34KNhz307s
	for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2023 14:57:23 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 8A824320092A;
	Fri, 16 Jun 2023 00:57:21 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Fri, 16 Jun 2023 00:57:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1686891441; x=1686977841; bh=OnwWNoMjJld9/seIquFt6CSJy
	aWqPf8RUMHBXztKlO0=; b=i6O31sp8qB+1Q1DWb/TTXfJXK2/0/H8LVuH+b4I3f
	wkJqGUwsKvGnfhit06flbUX90M08di2oUx4ps9/TaUvpbLAKuqH/rdKnXWJh0HtT
	fHDpRzNqKu2g8MORF4Vonl0N1iYPuf6vA0TT5UFlg3H27GkCVB9O8lkpB2BmNHKl
	+5WK3hyyNwt4m5aTQavTLhlOGGu0xRYSh8/Wcg0i9Z8vVkcl0+/PQ8WRMBf1hmBi
	Hn/BDtr3MQkqV4L8t4NAFSmeBP7GyJz0Nn06feIAXr1MeqaAWy5RpEEnHXEEmT3F
	SwwDrXOFR/tEkIEcrEIz2xZ3ZG26u3gxqAHfIki/Tx86w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1686891441; x=1686977841; bh=OnwWNoMjJld9/seIquFt6CSJyaWqPf8RUMH
	BXztKlO0=; b=J/Kzlq/PxK44WiIWns/bG+/qQ2YZqL7HNc8jQXe3H8E9Yc/LjdY
	b3QIkm3jyQRvp6upcZKb6JK72nPHY3mOWBBUWQ/dVEdCrs2D8EwBGFOCKfdm/fEw
	3Z80Zgs0PIMTvp3UJoN/zFwmLG8WB5JJiJgBY935ytI49qHTbrpiDGw7VbSxEhTO
	8zC2JxgfRael6Hj77/1a3BSctlg/3VSa/YDdYnc1E66Lo1zNkM/GnU4cF52ExYe8
	hffdQmabxMA+UO4R1TK0kmpaeXfOe+9mXLY0CgaAm7SARtPz+098+pmzziLrzaZe
	Te0qFxaf9WufUk2b+MlRZLtHFDN4BEgz+Bw==
X-ME-Sender: <xms:sOuLZIathShpRNgpy0RTn4D0wUU059izj-y5PSIh-wTj9vdXHwk-tw>
    <xme:sOuLZDZiT87xyzb4HJkL7ncCmSkaxmNSLs3yHt5qyJVfjT0qyrPENd3e85TdtbDUi
    Dsz09NOs-4YeFN9SQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedvfedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkfffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehnughr
    vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
    htthgvrhhnpefhkeehveegffeihfejvdekkeetvdefhedtfeeiheffvdefgefhgeeitdeu
    udetudenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhsuhgsphhrohhjvggtthdqmh
    grihhnthgrihhnvghrshhhihhprdhmugdpohhpvghnsghmtgdrohhrghdptghomhhmuhhn
    ihhthidqmhgvmhgsvghrshhhihhprdhmugenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:sOuLZC-tMX-tsiOHfqk3XqaVIhIj0FVGCHvJjnTczExeiwZtbBLExg>
    <xmx:sOuLZCpj9ndAlSFwmtXEFFKrI6szgwLNGOO7qd9pZB73Mp0xpAUQOA>
    <xmx:sOuLZDq5-4OeTvlojmgAKznkFIiTGI7nf82Eq3vAlAdIiG_O4bo7OQ>
    <xmx:seuLZMDpwgQJynW3t-frjSUg18pMxj4t2GGUQKK_VJBohRt3bbK2YQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A22691700089; Fri, 16 Jun 2023 00:57:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-496-g8c46984af0-fm-20230615.001-g8c46984a
Mime-Version: 1.0
Message-Id: <f21a5062-b462-4597-8770-4869b0071ba2@app.fastmail.com>
Date: Fri, 16 Jun 2023 14:26:33 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: wangkuiying.wky@alibaba-inc.com, suryakanth.sekar@linux.intel.com,
 openbmc@lists.ozlabs.org
Subject: openbmc/bios-settings-mgr: Notification of unresponsiveness
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

Hello Kuiying and Suryakanth,

A complaint has been raised to the Technical Oversight Forum that one or more patches to openbmc/bios-settings-mgr have not been responded to in a reasonable timeframe.

This is the first notice of a complaint of unresponsiveness.

The project has recently defined some constraints on timeliness for reviews. This helps to set expectations for both contributors and maintainers. Maintainers are expected to find time to provide feedback on patches inside one month of them being pushed to Gerrit. Upon complaint, missing this deadline forms one count of unresponsiveness. If a subproject's maintainers receive three notices of unresponsiveness within a 12 month period then the Technical Oversight Forum will seek to introduce new maintainers to the subproject.

Further details and considerations of this policy can be found at the following location:

https://github.com/openbmc/docs/blob/master/process/subproject-maintainership.md

The complaint regarding openbmc/bios-settings-mgr can be found below:

https://github.com/openbmc/technical-oversight-forum/issues/27#issuecomment-1589985292

The specific patches identified by the complaint are:

1. 63276: clang-format: copy latest and re-format
   https://gerrit.openbmc.org/c/openbmc/bios-settings-mgr/+/63276

If you are unable to continue with your maintenance role for openbmc/bios-settings-mgr then please work with the community identify others who are capable and willing. Please consider the expectations set out in the community membership documentation as part of this effort:

https://github.com/openbmc/docs/blob/master/community-membership.md

On behalf of the Technical Oversight Forum,

Andrew
