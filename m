Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0AF7546FD
	for <lists+openbmc@lfdr.de>; Sat, 15 Jul 2023 08:11:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=k+Jd6f8c;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LDvsXY7O;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2yfM3VhLz3c5V
	for <lists+openbmc@lfdr.de>; Sat, 15 Jul 2023 16:11:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=k+Jd6f8c;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LDvsXY7O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=lists.ozlabs.org)
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2ydZ0Swvz3bn7
	for <openbmc@lists.ozlabs.org>; Sat, 15 Jul 2023 16:10:56 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id CD9AA3200907;
	Sat, 15 Jul 2023 02:10:51 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Sat, 15 Jul 2023 02:10:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1689401451; x=1689487851; bh=yM
	iqoD5VC+qTlQWCqWtyoIYyAkBYETRkF14HQK6h8vw=; b=k+Jd6f8cjznFwS6HNi
	lwinX+lA0J5iJqNHfULFkbGw9Eq7IeFgMsNrcJuJI2vW+rAGJyOFlNM805LiNImk
	oMQBLgeYBZa9M9rftN27w+tQn/KqxDUkWy+XfuH3/Lv3YlBgbNa29+CdMAxq5FfU
	nRbiHtHBQstTF8j8JVa5XwjqeEbEG7I1Y/PVIAxXSQiaS9xJ2hdkKvil4hPMPide
	uLmdxoWUuF6N1L4hSiKiXOR2u9bkg0CiH5rEjMuiTq0CmrUwJXDCreZmcLsHJFKy
	6XQKG8+50+VwIFmlO04+uSh81K5j4Ov9INNjU7jnEgD9xvSZ50/ZBupjSrnI6j6K
	EIAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689401451; x=1689487851; bh=yMiqoD5VC+qTl
	QWCqWtyoIYyAkBYETRkF14HQK6h8vw=; b=LDvsXY7OyaCxu2WP6CBrzcECnMds8
	kxKHqlqSCpzB4mUaUivRxbaC752xuX2zV2vIdUIf32x3QB0R/SqGLtTPyV6iEUI8
	PvJjtQJS5sSLzlaFP8ecTpDx5h5mJaofrcanvE1u9ytg0sNMZ65wSbO2sKzfjQqh
	KMkyOcpgO92v1Pv3qYhO0Rq9xtGPi/OKkSyUdm4mfwBtV+fOFFkUi+BoUZzZzG57
	Qm/EDFsvLQOXCsBz7W5qZ+lLiZdw8w/rkiqcWqQLpq4nNGKBvag5uTuRNc5jiOJo
	d/U+tjqS2Ru2bVcp+geilUm0bJ65GMOO1GSe0Qkptt/CAGQh5kSr+7jbg==
X-ME-Sender: <xms:ajiyZKeikHcJNTfST1I42uM9wWnrcze_XTJ7mYFRWBY4u_tEZuK-fg>
    <xme:ajiyZENnoeaXngEVLKZEI09QOb4oFYUa43cxImGe8rj_uDNzZPTTRVaxSUCX9GKqF
    N4xREarvwJWF_ddXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfeejgddutdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ajiyZLiBo3jtuHqySaDBfUI3ITTcEX8tt28CxuOgucYbr4wsDOzbkg>
    <xmx:ajiyZH_3rK4K2prUFlTInvsIIKiZFB5n1NhG_cKeMzzfZLXfvCe8yw>
    <xmx:ajiyZGs_WU1BCnBf819ljRbAExf-wcoy6qg6TPh1g8Fe6Pqlp-rLuw>
    <xmx:aziyZM0dikoZ3nS3pASSKgAb35VnBn1C8KCALqC-17eSugtoF_uk7w>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9BFEE1700089; Sat, 15 Jul 2023 02:10:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <207fa362-a1f8-4d7d-b543-eb5866b385e8@app.fastmail.com>
In-Reply-To:  <CAMhqiMpTV=ZAg3NcwgdfVRMT_A5-Bb=Eh1o+a5fy7+mzL-7SEA@mail.gmail.com>
References: <d47818d4-4167-4508-bec0-db6eee93edb0@app.fastmail.com>
 <CAMhqiMpTV=ZAg3NcwgdfVRMT_A5-Bb=Eh1o+a5fy7+mzL-7SEA@mail.gmail.com>
Date: Sat, 15 Jul 2023 15:40:27 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ratan Gupta" <ratankgupta31@gmail.com>
Subject: Re: openbmc/ipmi-fru-parser: Second notification of unresponsiveness
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
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 13 Jul 2023, at 18:05, Ratan Gupta wrote:
> Hi Andrew,
>
> My role in ipmi-fru-parser is as a reviewer and I have not been
> reviewing the parser code since a long, I will request Vernon to
> review this.
> I will create an gerrit commit to remove my name as a reviewer from
> the ipmi-fru-parser repo.

Yep, if you're not actively reviewing code for ipmi-fru-parser it's best that OWNERS reflects that.

Thanks,

Andrew
