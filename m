Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7821835B8E2
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 05:21:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJYtj3FVRz309c
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 13:21:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=lB00+RBq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=hzYJgnD/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=lB00+RBq; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=hzYJgnD/; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJYtS53YVz309c
 for <openbmc@lists.ozlabs.org>; Mon, 12 Apr 2021 13:21:36 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3AEF91384;
 Sun, 11 Apr 2021 23:21:33 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 11 Apr 2021 23:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=NT+w9qhPSADAawArL9oddINbRgL23Uy
 s/4j8wa6m1yk=; b=lB00+RBq2FZ2OjZxgWR8ICNHhB+u2PQob2mli5nijQIupVt
 GaapTMXSJ78lwr6XBrk5lsc6xjS4lBjBluiofzNXRsix6dxuQtN3Hy5uq9eL0qDF
 WLi7EzGyNnI/FtLA96uUzFtgrVO1GqcwDGFeo337KCB+84/Pm/wsEpGYNfmMa9Ba
 0GehXB3LOErv/EHVr0+8KnTayqQ66DuIf6nwbnA4HHM9+5T+9Um/7hZPXi21SSCz
 E917CUv8WHfTxpZGKgOCPcAnDQ/LCbcHLMblNPbUhI1a8W0evhZtKKwz4x26n1T9
 umZHrzPqSRkgT1iG+pG8QsIS71Z1Pg60oNm5T4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=NT+w9q
 hPSADAawArL9oddINbRgL23Uys/4j8wa6m1yk=; b=hzYJgnD/j9MOFV5z/WcvtL
 5KGAVzJvfaiNjDmYkmWY7X8VaXL5Vhqw3ECls65NC2is/a5nRVuTJM7Q8fpPZgSE
 m4m2NSV2FHls7afUx2IQfhtdvCCwC7VT707+X3JpAP69PPY8iH/ILmz4S0T4bpa5
 dlVLyDswgMLoV0AZsxxwYNzF+/Q/1PzUjHlhThD4Z5nSyrZ39gmgkPg5Ls/wT7sb
 njqr2DZezUf34GjlH1oYTyuU2YpOAgFXbpDIQ63kc7jAXTpckFznM33LabI459Aq
 0JfABxMRKh55I+Dms6GCCPFD3C1LKEGtxEkyqi5Emh+uqEZLeVvUqH9163HHR3aw
 ==
X-ME-Sender: <xms:u7xzYKFxvpiXgp01bddt1ruX_1I4angq5GQW6UwGXZgRXmrKLYFy5Q>
 <xme:u7xzYLUjj8nI22dzRjQrZTPlAciEDycG_5C6LMEwK3EeAMoaVXuSSS50LlnzHAcdv
 9MeaNpjD63qxl8g_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekiedgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhepuddttdekueeggedvtddtueekiedutdfguedutdefieeuteefieelteet
 vddthfeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:u7xzYEIqQ0S9SyH9R5Q_OJk_aAAzVJcrh1z_8_YxE9TdfsuOQ_DqpQ>
 <xmx:u7xzYEG2S94XC9BBzrcVHobcb0yNJhyy388WMGGmm80h9gAU7D5-1g>
 <xmx:u7xzYAXEKkpNJHHdW8NxWaSF4yeVHCPYxsNogr9-LzpMzk2GRkCDbQ>
 <xmx:vLxzYJeNvsU2s3ckkkEMwSE6-uyyltIL8ZOCfGWwuXHl3o4i55Kgmg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6908FA00079; Sun, 11 Apr 2021 23:21:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <43c8e61d-a90a-43cb-96a9-c81dbd438fb5@www.fastmail.com>
In-Reply-To: <CACPK8XewJUfpJTVEmBddse7iM5UgyaDnGOvWzk0hNDy5Z0vUVA@mail.gmail.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-14-eajames@linux.ibm.com>
 <CACPK8XewJUfpJTVEmBddse7iM5UgyaDnGOvWzk0hNDy5Z0vUVA@mail.gmail.com>
Date: Mon, 12 Apr 2021 12:51:11 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Eddie James" <eajames@linux.ibm.com>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.10_13/35]_dt:_bindings:_mmc:_Add_phase_?=
 =?UTF-8?Q?control_properties_for_the_Aspeed_SDHCI?=
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 12 Mar 2021, at 10:49, Joel Stanley wrote:
> On Mon, 8 Mar 2021 at 22:54, Eddie James <eajames@linux.ibm.com> wrote:
> >
> > From: Andrew Jeffery <andrew@aj.id.au>
> >
> > Add properties to control the phase delay for input and output data
> > sampling.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> 
> Andrew, can you please review this and the other mmc related device
> tree changes in this series.
> 
> I'm particularly interested in the upstream state of these changes.

I've got MMC phase support for the Aspeed driver upstream in 5.12. We 
should backport those changes instead.

Andrew
