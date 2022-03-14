Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A364D8398
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 13:16:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHFrD38Wxz30J7
	for <lists+openbmc@lfdr.de>; Mon, 14 Mar 2022 23:16:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bwbmail.net header.i=@bwbmail.net header.a=rsa-sha256 header.s=fm2 header.b=Duy/pRbt;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ACU6L+vA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bwbmail.net (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=brad@bwbmail.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bwbmail.net header.i=@bwbmail.net header.a=rsa-sha256
 header.s=fm2 header.b=Duy/pRbt; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=ACU6L+vA; 
 dkim-atps=neutral
X-Greylist: delayed 557 seconds by postgrey-1.36 at boromir;
 Mon, 14 Mar 2022 23:15:46 AEDT
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHFqk23rRz30G0
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2022 23:15:46 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 05A3B5C024F;
 Mon, 14 Mar 2022 08:06:25 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute1.internal (MEProxy); Mon, 14 Mar 2022 08:06:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bwbmail.net; h=
 cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=5SH3+wFYGMGUs8FIWrIGP8v3dcutSjHlPQd1Z8
 J8NO0=; b=Duy/pRbtXUxAXf8F5JZH9fkmlfl6whdpknMuGXWc40bhMeoucgfiTh
 UT1XLyAWr9Shs/VXgWYLFxY7jQ3mvuHZSvA6mY/8boSoegNnS39iBJlURVtAqIli
 jtfKmFYvFYRiNDYbIrD+ZN7KkqF9+ycDqleE9Sgi0zy/YYoAtC0im8nMwPxqehcK
 Hc2Lj79VyBqmhYzCnhcZUG/kdYIABCqL7soat5mr98TMOyyR3uUQFe4pR4F7HH39
 kGrQf5OWbN0IAHOaKPQ9LZMqLiTVBxA8zU3oQFHW39u7C+DakRtL+Vhxze2dwzzl
 icH2nOAd5YPzHxDLOpMuV6xpd65xXqXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5SH3+wFYGMGUs8FIW
 rIGP8v3dcutSjHlPQd1Z8J8NO0=; b=ACU6L+vAokgCXpaY/eGB5uqLbyYOCIbdO
 Zqm35XEgQXO+tjcoUB2Xbpm9sIZeyTygLxbVwNXhv0428kZK5e9nghFtMAq2hYIq
 0q+tqUPKys/5i2lm9ja11gVe9ggFZkTbudY2db22rQnfsX8KSjMlMZ0RtdsfQUcd
 0Ec0LahoQcSfbT2tPiIXlPxPC2+2jVq+zNlPQsLtITjnJ9zUJs+JKaNS6tfcIYRH
 dpUZS5q8N6mg8kzFtw4lxAxLh4mn3tDdYd7U9J3MJQc1by1DQIiSF451+YI8iHGB
 RSuqvlck1hUI2uyj5R4ChBim3LEj2d8FwebWdOLTroLEaqfoa0cDw==
X-ME-Sender: <xms:wC8vYsZOfG23GFyv6Esj098cMzNR1qKTbT0yGGLfNMOg2F3u7-SAUQ>
 <xme:wC8vYnaKMefCPAoxM-Z2GBtL8-gr9T83zTAYfZoZvWkVplUMYLsbhvJpDLiNx0tWD
 HVBuEYkI37JB6cO9XE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvkedgfeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdeurhgr
 ugcuuehishhhohhpfdcuoegsrhgrugessgifsghmrghilhdrnhgvtheqnecuggftrfgrth
 htvghrnhepgfejueeiffdtveefveefteehleetheehgffhjeevleelueffhffgkeelhedt
 keelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsg
 hrrggusegsfigsmhgrihhlrdhnvght
X-ME-Proxy: <xmx:wC8vYm9QpuJ5FFaFTyqtTPWabszUFV_KaOxjIKTiGKAkN2OWT_23ig>
 <xmx:wC8vYmplS5oxPweUgIgMoo7OIip8CX3O3NjlImB-7GuzvrYsTDjPFA>
 <xmx:wC8vYnouMxUYLh3ZoSDeYY_pD2UvU-RrCnLWrXrvjFTQyX5C9qGPPg>
 <xmx:wC8vYgD0XVGsqNzMIbSNroV-MuINGQ2zKMuFTe_Lscc8K4CvC0fs8w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 856F227400FA; Mon, 14 Mar 2022 08:06:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <228c6f6d-51aa-41c9-bd34-9ce27766761e@www.fastmail.com>
In-Reply-To: <9c5a07b1-99a4-3eae-6cea-973d96bb14f1@quicinc.com>
References: <9c5a07b1-99a4-3eae-6cea-973d96bb14f1@quicinc.com>
Date: Mon, 14 Mar 2022 08:06:04 -0400
From: "Brad Bishop" <brad@bwbmail.net>
To: "Graeme Gregory" <quic_ggregory@quicinc.com>, openbmc@lists.ozlabs.org
Subject: Re: Updated CCLA for Qualcomm Inovation Center Inc
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
Cc: quic_mkurapat@quicinc.com, quic_jaehyoo@quicinc.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Graeme

On Tue, Mar 8, 2022, at 7:40 AM, Graeme Gregory wrote:
> Hi, Please find attached updated CCLA with Updated Schedule A for 
> Qualcomm Inovation Center Inc.

Accepted!  Thanks.

Brad
