Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE7D130CEB
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 06:15:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rkHG5P3fzDqCB
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 16:15:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="ixAD/7HS"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WXBllRLS"; dkim-atps=neutral
X-Greylist: delayed 249 seconds by postgrey-1.36 at bilbo;
 Mon, 06 Jan 2020 16:14:36 AEDT
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rkG408NkzDqCB
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jan 2020 16:14:35 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8AA3D4B7;
 Mon,  6 Jan 2020 00:14:33 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 06 Jan 2020 00:14:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=Q40JR4AtLFxw+Wv0GLxykLcBQSXEcw3
 9wyvi9/c3r1s=; b=ixAD/7HSZNhGFr6vFtlh/MO7cm639jv8OwzE6n1RZBKNofx
 snPZKCXd14c2XmZHzESvLERrw9AbfFuM5xM8b+JYaIDu5v1G4gkL9CDuRKixN0OX
 xd6DuW1oy0uiXYvWBUNxrchOpZRocuP3WjILvuMbWDO/6377UhV5Bt5KRiAH8xxV
 rz1bhH8p9IMu94vyp9IyEoLdRRu8sIbhHkAXC/b4YO+WZccYqmwpFXADQXTGQ/5T
 qMJi4tKvOTctH68erNywRdAGI9pNClxOaZvFwOyCsm38m34qR8eTyybBjIk3P22B
 pW6sXU2iS2VU8uVM0KPmh8zGQnyDjcXJK1po4DA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Q40JR4
 AtLFxw+Wv0GLxykLcBQSXEcw39wyvi9/c3r1s=; b=WXBllRLSPChiie/PomQ4id
 yn8yti3Oq+MnRxzJ5O07f3K4RFqgsalipJ32rmL9VFE/EudKWQa3q1QPVla5owY+
 YVfAwovkNKrJ7qJn09TIgz7BN3TVMrxBjU52AyLgalVMIiqL2LOxgArxGdIIl0SW
 j7JzpkMqbJdFNaggoqgnUBvci5+d1nb9MkNT6Kk0UwXk3hhsTuBBJMqfjtHkcWs7
 TqMHExof6WI08GfltQ1Qn09vMB9nFkwRwCrnjnWKeLLAb4FtE91JvrlLkd3WIawC
 HGzF6/m793GNkvKzx0wrxaGaNCvG9x7WfVqk7D4vY9MCaD6YH+Lbih7KwwD4O9Ng
 ==
X-ME-Sender: <xms:OMISXrkAjQvlykDcZAJi6dZ4rSBrxxhNOc6jeYYcdSXOQpLzo4Ke8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegledgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:OMISXmf98qlZ4_YoXTjTCthtOufhRIz6b_YA-JnJebXR5WBi1TAgSw>
 <xmx:OMISXh123a5cxAWARZQlP5d_vLZjekrQiFODHfCkr68OeU3r5Onq4w>
 <xmx:OMISXrk959uTLGVEoTLXAS3HWduVelTENSktBXhyKjGHK_ynXtayNw>
 <xmx:OcISXu86MTjlV5OaWfTeNtBS3Fu51a0Be3xeSBGOm_38y1UvmAr0xA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B9571E00A7; Mon,  6 Jan 2020 00:14:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-731-g1812a7f-fmstable-20200106v2
Mime-Version: 1.0
Message-Id: <1cc8991d-bda3-4500-9b81-416957328415@www.fastmail.com>
In-Reply-To: <20191223134735.559200-3-joel@jms.id.au>
References: <20191223134735.559200-1-joel@jms.id.au>
 <20191223134735.559200-3-joel@jms.id.au>
Date: Mon, 06 Jan 2020 15:46:31 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_2/4]_ARM:_dts:_aspeed:_tacoma:_Remove?=
 =?UTF-8?Q?_duplicate_i2c_busses?=
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



On Tue, 24 Dec 2019, at 00:17, Joel Stanley wrote:
> This is a revert of "ARM: dts: aspeed: tacoma: Enable I2C busses", which
> was already applied as part of "ARM: dts: aspeed: Add Tacoma machine".
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
