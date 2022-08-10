Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA4A58F3BD
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 23:12:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M32h53Ws2z3bhF
	for <lists+openbmc@lfdr.de>; Thu, 11 Aug 2022 07:12:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=InDGzt2M;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=lk490j+7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pjd.dev (client-ip=64.147.123.17; helo=wnew3-smtp.messagingengine.com; envelope-from=peter@pjd.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=pjd.dev header.i=@pjd.dev header.a=rsa-sha256 header.s=fm2 header.b=InDGzt2M;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=lk490j+7;
	dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M32gj64K2z2xX6
	for <openbmc@lists.ozlabs.org>; Thu, 11 Aug 2022 07:12:01 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailnew.west.internal (Postfix) with ESMTP id 716ED2B05921;
	Wed, 10 Aug 2022 17:11:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 10 Aug 2022 17:11:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
	:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to; s=fm2; t=
	1660165917; x=1660169517; bh=64RWNbnp4lIwILKc3j505A2jNccmRaSvKnS
	6/wgtol4=; b=InDGzt2MJhQvPmq8OpcMRS7n4D66x3TPxD5nxZa9qdR3foic/cb
	vC8dmP4U2BvRk1+aR38r//UnPAKYmolK15tbd+DmF9jAnPhRqHmeea05zaTMBk1F
	84p77hhNuOn8So+yzr0ECB271JLASWcgLPDZvJKI3JWZnHkZI08h9BAJ39lGjzx+
	bzBKD8CNzQgZxQJqaP8q/o7zCkaoDDie7f0R8Lncb39lh8F4QNms+Aduof1eGgYt
	bGbFd5AkQypyUENCZl75OV56zb+pZwtP3pP0E6dyjLUympPfbqAUggjzcfT6elWu
	A4tZMm6zFlWRsSBPsv6pVKKnLnCDHeF3qWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1660165917; x=
	1660169517; bh=64RWNbnp4lIwILKc3j505A2jNccmRaSvKnS6/wgtol4=; b=l
	k490j+7GITYI5I02/Ik9hX2dhncrlHZYXc9LYjqLHc2KpmP2Uf0p5q82W9yOhYAM
	ooa7DgPKiZel7ha++mDZmKShsL2DAHmpYYsbhSG11AXvWxFZrGZmMdyC4U0QyaUf
	Lthf26Kw/lzoIG4jB5mvACSqQX/0gPhAJyi6haqslj4zTEUfbph9yV35I/kFvKFh
	bqOXcjL2NbXbJLt2V4eJL5SbpP+ySoDeBVw6lCX/iL+n87u+GpPvRJMqHLgPzSGA
	NbTOk+EoBWY2BO7mlK7dxdH2QAHi3hY68GEqWpMDzovaAz+NVWOT923lTmiW9Wa9
	LZfELLfBm5SLR6POwHjsA==
X-ME-Sender: <xms:HR_0Yu5FwjS_JN5e7MSm1CVl0YTn-2veUFKzG-lfO5m3-17_ZeFIFw>
    <xme:HR_0Yn626SSEckSzBF2sEfNEDneUC0Hg6htSS4mz8gznPX0SniBuHMMiKo3u4PTrS
    xFw1E9LJvrGKmnlj8Q>
X-ME-Received: <xmr:HR_0Ytc_ACkp2JXmD8OysaB9OCcN8JC6lnHnckJX2Do2FVJGsT3dnkZxoXhBUX4arE2IuYWP9WcRT7eiEbG9EA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdegvddgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecumhhishhsihhnghcuvffquchfihgvlhguucdlfe
    dtmdenucfjughrpeffhfevuffkgggtugesthdtredttddtvdenucfhrhhomheprfgvthgv
    rhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrfgrth
    htvghrnhepfeefhfeutdfhhfdtheejvdffgeejjeetiefftdehiefhgeffvddtjeehleet
    gfejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrsehpjhgurdguvghv
X-ME-Proxy: <xmx:HR_0YrLEjT-3GYLHD8tkwlEu_YydZjXbtZ7-MT9rkcSCvo1HfC2H2Q>
    <xmx:HR_0YiJwcFq25ehZy8sIFwGJn4jMw2-ew1thuznyOsERt7S5_QHzFw>
    <xmx:HR_0Yszm3OJlg4o-QkGiGeAlUEEQI2KtGYZSEtDlGObi4A4ebQGUOQ>
    <xmx:HR_0Yu3Z9mZFwwPFc4t7aSgVdrK3wjJV8W2nx8jzvz4ZbaPEXx_OP7cKrUY>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Aug 2022 17:11:56 -0400 (EDT)
Date: Wed, 10 Aug 2022 14:11:54 -0700
From: Peter Delevoryas <peter@pjd.dev>
Subject: TODO items for the AST2600 PWM driver
Message-ID: <YvQfGlro4tKsZ4T5@pdel-mbp.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Cc: billy_tsai@aspeedtech.com, garnermic@gmail.com, joel@jms.id.au, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hey Joel and Billy,

I was looking at this thread from 2021, and I'm trying to figure out
what we need to change to get the driver accepted upstream.

https://lore.kernel.org/lkml/CACPK8XfM4C7v3keXaxMs9SkqNzb8XWbZ6QvcZXWcy3ZKJCrvWQ@mail.gmail.com/

It seems like there's a few major things:

1. Use one device tree binding, and one driver file.
2. Should be a hwmon driver and not a pwm driver.
3. Don't use regmap.

And, is anybody working on this at the moment? Can someone else pick this up?

Thanks,
Peter
