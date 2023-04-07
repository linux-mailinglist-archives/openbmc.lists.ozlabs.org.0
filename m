Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8516DAC67
	for <lists+openbmc@lfdr.de>; Fri,  7 Apr 2023 13:56:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtGzt4CYrz3fSt
	for <lists+openbmc@lfdr.de>; Fri,  7 Apr 2023 21:56:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=agaQZGNX;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=tmlpTYeh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=agaQZGNX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=tmlpTYeh;
	dkim-atps=neutral
X-Greylist: delayed 566 seconds by postgrey-1.36 at boromir; Fri, 07 Apr 2023 21:55:51 AEST
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtGzC74GFz3fK3
	for <openbmc@lists.ozlabs.org>; Fri,  7 Apr 2023 21:55:51 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id D55D53200A0F;
	Fri,  7 Apr 2023 07:46:17 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Fri, 07 Apr 2023 07:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1680867977; x=1680954377; bh=r05++r5PdRw+bQTkOLKvB5xRJ6pPTkl/TWF
	6g+E8zmY=; b=agaQZGNX5rG1Uf3M5E3TsMUy4MNMrlJS5vhmFi/+VMPgTWmnD5D
	sStU6Qy4mAwApfnVhLeYcBvP/uLCZFc+Zt01XkU6cQ+cCNf9M+Yj6U0gNcui/wH5
	zqFbDp0l5jOAK0fNpkjFImBDI1qz2QqPtmXRZsLpBH3bSXPt86akFXGvFbZ/jGXd
	Lc4ljJk0JBF0M1agdXBv0U4XuvJRApqGYHvbL7Z+qS5DlqTCMz9HDweducVN7LWD
	u4oTftWpxONxH6q8GYMSmtdMjrp15713nYlUHfIz9a8CL8kuFr8i+vPHz2muK7jh
	6sluZ7wAPMirWQDiKdk/uaPzQYSHwIZxMOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1680867977; x=1680954377; bh=r05++r5PdRw+bQTkOLKvB5xRJ6pPTkl/TWF
	6g+E8zmY=; b=tmlpTYehKTpR6QZh32aAWEEVJ02OsgJal+wMIh128Pk1YydW83S
	l18Wskid2ZdqrKK3dYCdGW1n5ioQlG0rSNkg9q5sPD74qDzFgEythu51cTMyUjAg
	wuECgbru9eSEWC1v44k1fkhsQape33rd/Z0mo7rR4svSkL28MrkrRQjaAAtirowq
	vkvFZw/+sDJuBQWzqb51y1iQQIsA5RjNwrsIHC0jEyoVHZWgBrNhGMEC8TlONiU5
	Bg6sl/dMXgY3lhgE8ELWvVMLFiiuxCq4s0waCIPZsnwilfM23UCnlSEjhTYyr9C2
	SdiOpzvCwpvqUoGBa9ijEizmXcnHgm4feRA==
X-ME-Sender: <xms:iAIwZLGiHtKgZCLI8WNfo7m25x0Dvms-GaU_ypXXkc35A3sPQ2IxyA>
    <xme:iAIwZIVnWL6R4HbdFbgqdMIV3JWwamrBkHSrcG2_SQ9uA5c0byGIDYjiqCncHB7WX
    A0111l1UjRNWhC_mQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejhedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepgefhvdegfeduffduvdektedugfekieefieevudduleegjefhvdek
    veevudekgfeknecuffhomhgrihhnpehoiihlrggsshdrohhrghdpphhorhhtfigvlhhlrd
    gtohhmpdhophgvnhgsmhgtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:iQIwZNLpoTR7EeXZlhlfQ38zZ-A4eq_MWNyoxuzPkatgJwo-54G5vg>
    <xmx:iQIwZJGmfs90p49-y_dW2ao05WvIl1NZut_AEpmN5AJBcbVuG9aEZw>
    <xmx:iQIwZBX2gqrEN-w_a3Iev_Ob4nwp-6CuwBnqfiZAq30APkPaURuTJA>
    <xmx:iQIwZOjQjKpAipLkIaowrnnXO81z3HEm0P1BZpxaoHQz3NemFLCSjQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id ED7491700093; Fri,  7 Apr 2023 07:46:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <c9adff03-16f4-40d4-8334-6cdbbdea2407@betaapp.fastmail.com>
In-Reply-To:  <PR3P195MB055546905D984A24BEB9D474C3969@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
References:  <PR3P195MB055546905D984A24BEB9D474C3969@PR3P195MB0555.EURP195.PROD.OUTLOOK.COM>
Date: Fri, 07 Apr 2023 21:15:58 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Lior Weintraub" <liorw@pliops.com>
Subject: Re: OpenBMC - Support NVMe drive health monitoring
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: jianghao@google.com, openbmc@lists.ozlabs.org, Ed Tanous <ed@tanous.net>, rashmica@linux.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 7 Apr 2023, at 19:50, Lior Weintraub wrote:
> Hi Jet,
>
> My name is Lior Weintraub and I face exactly the same task that you=20
> handled 2 years ago =F0=9F=98=8A
> I found this mailing list thread on OpenBmc:
> https://lists.ozlabs.org/pipermail/openbmc/2020-November/024012.html
>
> Can you please advice about the current status of this issue?
> I need to add OOB support to our NVMe device (supporting NVMe MI ->=20
> MCTP with SMBus binding).
> For this task we plan to buy the AST2600 development=20
> kit<https://portwell.com/solutions/openBMC.php> and use the OpenBMC fo=
r=20
> our development and testing.

Currently OpenBMC only supports NVMe-MI via the basic management command=
. See phosphor-nvme or nvmesensor from dbus-sensors. We're working on mi=
grating the OpenBMC MCTP stack to the AF_MCTP sockets that are now provi=
ded by Linux.

Please help review and test Rashmica's work in Gerrit to speed that proc=
ess along:

https://gerrit.openbmc.org/q/topic:AF_MCTP

Along with Hao Jiang's work to exploit libnvme-mi in nvmesensor:

https://gerrit.openbmc.org/q/topic:nvme-mi

Andrew
