Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E38CD57C230
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 04:18:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LpGTV65rcz3c1d
	for <lists+openbmc@lfdr.de>; Thu, 21 Jul 2022 12:18:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=FFdoUsYn;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=H3xMjqYt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=FFdoUsYn;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=H3xMjqYt;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LpGT23H56z2xmc;
	Thu, 21 Jul 2022 12:18:30 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 638055C00F2;
	Wed, 20 Jul 2022 22:18:28 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 20 Jul 2022 22:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1658369908; x=1658456308; bh=a/WhCcHtL5
	ftLMRCFuXtpLpQbnMhIlj4bWgYa17E7mM=; b=FFdoUsYntxaptXljDptRVMllML
	NHspwggff1OgZZIDvcc9jpzs87OHkfk4oJV9DGvA6duTqdxRW21lg9uNE8AZCi+S
	iLuUc3fIpxte9QMOX7EwQsMxHogOl5ajfP25LJnrwMnJPR9UmE8f9U/SyZi/yC/G
	7iY7HXUv7cupjsHfE6djIuqE8fZq2ChYXLdJr7s1p3qnCsFvI0mbt9aavcQTq7zO
	FhRp0gdsNjHDIqtasw4ZuzdBM0AgSG7aHKGYYROZiRD8qXiBPys55wrqyK48DqfM
	bmxtWHKHwoc75ongSslvywPX0s8Oq3P//B66VjqEfR6pbR7NVLbxITNOqJ8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658369908; x=1658456308; bh=a/WhCcHtL5ftLMRCFuXtpLpQbnMh
	Ilj4bWgYa17E7mM=; b=H3xMjqYt7aLTZG8sZ8vVD53akffMTktroBPpVEEuc0xt
	JB622jt36MjFhejbYqWV7d2FkKG7glQieQmGiEudpKfTHOb+lH0AbwWECiJ1inUx
	ElZ6U7rJJKfk8/eafLhtLjBxHUqrq8n2HTWtF5b4AKq2nfmZL8A6Br57sTXla+TZ
	BBpscQzDXN2ykM0XtlCiyuBR4d1fgCCutjIEpEGuYCb0XCLBgJSAoyGCpZah2YmU
	b5G27fV50/qXw5mIRwvAGR8Q/nN2aj2SEce1yCDzDcahJg+S4BwuppUM2T0ZpTR6
	AewhX2un5Tk8LZOvlsONZXAKoTxDFwf6p3vUX6DM5g==
X-ME-Sender: <xms:c7fYYjfmC5PqnuMNcD7V63z_GQWk780Uwm9pXAVAmWdqjuRYvJr7tQ>
    <xme:c7fYYpOLkIEXOiNBfxjmSzbVurL5IGQCu8nWtCb3k9hB56js1inH8UUdO863AjTLQ
    z4y9Ypcj17JOKKOZw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelfedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:c7fYYsjX1STmctb7o6WOaMx9ZdM_gmLvAn4Ydub7xEuDgXOurnzOmw>
    <xmx:c7fYYk_8LXDcPlKd4lUJEHSGw5R5f8qe6UmKNc7GUiS2HIG_4DayKQ>
    <xmx:c7fYYvsrW2v7uvDbmC3mtHS0xKyn_E0XQvjWiaJV57fxPJrHXWdG_Q>
    <xmx:dLfYYo6dI3S6Vzez4bjItVx9l1mEOeoWPXgyOKA90dpraaItuKIAkg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A1056170007E; Wed, 20 Jul 2022 22:18:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <6df54656-5d2e-4308-9256-fc1629ca0ab5@www.fastmail.com>
In-Reply-To: <20220712012353.386887-1-wangmin_phy@126.com>
References: <20220712012353.386887-1-wangmin_phy@126.com>
Date: Thu, 21 Jul 2022 11:48:07 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: wangmin_phy@126.com, openbmc@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH 0/1] *** Add device tree for Phytium's BMC ***
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
Cc: wangmin@phytium.com.cn
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Min Wang,

Can you please refrain from using *** in the subject going forward? 
This is meant to highlight the template data, which you need to replace.

On Tue, 12 Jul 2022, at 10:53, wangmin_phy@126.com wrote:
> From: Min Wang <wangmin@phytium.com.cn>
>
> *** BLURB HERE ***

You also need to write a blurb if you're sending a cover letter, 
however, if it's just one patch, you can omit the cover letter 
altogether (and skip writing the blurb that way).

Andrew
