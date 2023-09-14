Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF767A0773
	for <lists+openbmc@lfdr.de>; Thu, 14 Sep 2023 16:36:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=D9m7DYLl;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=PJguvD/9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmfyh3L3Zz3cp0
	for <lists+openbmc@lfdr.de>; Fri, 15 Sep 2023 00:36:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=D9m7DYLl;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=PJguvD/9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=lists.ozlabs.org)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmfy373pxz3c9d
	for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2023 00:35:55 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E21425C02AA;
	Thu, 14 Sep 2023 10:26:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 14 Sep 2023 10:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1694701598; x=1694787998; bh=8DcqOZq1em
	j0vSEuXLNOOpNjJ0DcS6sB18zNmNi8Mo8=; b=D9m7DYLleYdgvV6lt/6XPjc97e
	Lmxp4opHsYmlLbEaBdVjPmAI3sqjWiw2CH9GDDGBycn3UTFDe0BC4zwxxvxPnRiP
	ZV4EhQgFB81DHr9lvD0jf5aLl2KlcVTF89w+Y+91+Lw8K5YP6nyUUV6CwnQfOtbj
	ob4K+tSu3S6DAK6swxSzkmqmJiXLGS+hqYVGao45hs3yCNwQb8HPexfFLD9yswIe
	A2zhhjihXya5nSu+PDc3rczHKIVkinxtZUkpZ+oO7mXN0kqPEIDwoMgahN/Kf2R/
	Z+WVPre0gm4n+QxhHZ3TmxEsiEbWZii4zjugzt6PZfT2zVJ7N2rpbsst7qZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1694701598; x=
	1694787998; bh=8DcqOZq1emj0vSEuXLNOOpNjJ0DcS6sB18zNmNi8Mo8=; b=P
	JguvD/9muZbg8gPxGEd4lEb+x5Mh6YU2/L1+jago+MkcNMeKsEItTvpQACtlg2bu
	vph7uvse1dCOZebiQFsRuZ4XsfzhJYXrZmDEyEPCqQaqjMOKXxCgZ1Fc0vi06oQt
	VGwndqNS/MSfphYt/eRWovxwiSVzr2eeREexTuJCvVElwhwo1UVNbu/wAvr392LF
	VjJJe5lUqIywbiujV3DZ1ZpPOxMqWZpewdMfHd44iF8Lo/k1WjYE3oU6BLRexKyw
	O2QgiW9px3Nk42cwxt85lVNCEWdZ4UaeGmE2f5gJClq1MyP56xG65gyBpS2TvUyr
	cYCOMP2LcQbEGbAahMing==
X-ME-Sender: <xms:HhgDZWacsT4R1x3M2fkIjZjHmMCtvqraMS4v76D_uVPBPS4o9Qny5A>
    <xme:HhgDZZZXIS4PLB80BcmslQnBhvhi2Sowu2-QvnXHoSmXza8xgMSoF9byTXgWqEhFS
    lhzYHm0UalvZdAfrPQ>
X-ME-Received: <xmr:HhgDZQ9ni2LkI3fP7S-FXWTd9Q0qbog7wCs_AW8zrHnqRgt1p7NKFHEacb4rY65a5-_uSMfXzM-Nnp3QvhTgfT2gJdBowy0YdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudejtddgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvffgjfhgtgfgfggesthhqredttderjeenucfhrhhomhepuehrrggu
    uceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeefheffkeekgeegvefgfffhkeefgeevfeevudfghfdu
    keevudeuhfejkeelhfeifeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:HhgDZYrHqXx4IyNAYAYEx1ReJZPH-QCZKQpFcR19EpISR4uFLpk-ug>
    <xmx:HhgDZRq2C3lW-6JTmddUDXjTBd4B666T-8RacNcBt7kx7NZWUCI5hw>
    <xmx:HhgDZWSBdvzRlEFeo7geMNU2Dou2kJzWVpiH5k3xWpZhTe5y7lt0Gw>
    <xmx:HhgDZQS3cqeSyx6KCIvW0HfXScyMDRxwrzgmsqSVYixJPjFIem5uuQ>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Sep 2023 10:26:38 -0400 (EDT)
Message-ID: <aaecc12856e6ba3ef92e6927bb1ad7360281098d.camel@fuzziesquirrel.com>
Subject: Re: Towards less magic strings.
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>, OpenBMC List
	 <openbmc@lists.ozlabs.org>
Date: Thu, 14 Sep 2023 10:26:37 -0400
In-Reply-To: <ZQKp6bcE3rvXsTIF@heinlein.vulture-banana.ts.net>
References: <ZQKp6bcE3rvXsTIF@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
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

On Thu, 2023-09-14 at 01:36 -0500, Patrick Williams wrote:
> When I look at these, the vast majority of them falls into 1 of 4
> different reasons:
> =C2=A0=C2=A0=C2=A0 - A well-known service name.
> =C2=A0=C2=A0=C2=A0 - A well-known path (or path prefix).
> =C2=A0=C2=A0=C2=A0 - An interface name.

In my mind these are not magic strings.  These are parts of an API.  We
don't get annoyed by having to hardcode c++ function names when we call
them - why do we get annoyed by having to hardcode DBus names?

Thanks,
Brad
