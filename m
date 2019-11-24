Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFEFB10853D
	for <lists+openbmc@lfdr.de>; Sun, 24 Nov 2019 23:09:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LkqF2SslzDqXm
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 09:09:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Tumy2VfN"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="Hg7ROYeh"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Lkpc0cLszDqXK
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 09:09:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 69E7321D25;
 Sun, 24 Nov 2019 17:09:09 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 24 Nov 2019 17:09:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=062b8Ev0XtN2ybhqXawxjhXbNYSLt8j
 jHSzM4wyaLJw=; b=Tumy2VfNyC0JKiYl5u7i3UC6VrX/VQ4Oc97QQBM/0cRRj0q
 YxSAWcFpe2sPCql/iuruw3KALIb0aM0SxHbEhm8dSBpd/4CNICJMrk4nOSgwauGD
 J2r1tAu/JxoGfSbtOqXntwmNYEFyOOhWlN7n4MiRMUdCk+FXuPknj9xtFRAAqssD
 T5Bwub1+ddvGrctrJ9uoDsiRJCbV0ob8RGMP6+zU2Zk4yNybGP3gbpt7GHFt2RUi
 FCNmC8Vu1XtmKYjCoWdwrtYvZ+B46r5ji1HyidRhTpT+b8LhMZBqDDiiE2UOkvQh
 9k3vfJHZILD010/sjxfI/xT+a7dTHtSbD9MWjdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=062b8E
 v0XtN2ybhqXawxjhXbNYSLt8jjHSzM4wyaLJw=; b=Hg7ROYehMKbf8OfCbrimzb
 dZDHitE4L/+N+yT7n3rKuC8HggPvYZridBXs52mKWgavdU59Egb/YyVLPAwbvCJC
 JJUEKgH7ZtxcxWwkQ4Z9Z2PFmi/ALJ/XbdawTvHTiNKUIGVd02oAVC5J620rt8ev
 7okQrRYsFKMW4BCjlL0A8Z6B678HmVeQPUlo6FbVQmL3AraX38NqcnfV5MCk5Z7u
 I2fgWfiCyLX/t4Cv+DGJrCHRm9mH5dDIsqaUgosmtMV6NVxKz3YkCY4VJf2xPdC/
 Zu4HPFRri6pK3UKLtQYyCBjJPrAIeFSyeZLnm5/FiJoXQ16y5iN7WVFHOCAWqrGg
 ==
X-ME-Sender: <xms:hP_aXUw95oJmy6lbSN4G99bZwRWmXyB4trq0Yy1aHGMqZ-uC6Npgkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehkedgudeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrg
 hrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushht
 vghrufhiiigvpedt
X-ME-Proxy: <xmx:hP_aXVpYqlcByzEamovSxluAKosv5Tz_SebiyGYP3svBqLXMp-nVuw>
 <xmx:hP_aXSVvwrI5WJDMkE49HzHwYl0-6Q9tyX9nCVCz0Pdqy6vNRgViCg>
 <xmx:hP_aXWMTi_oKKijYedi59QJUYZv67Ql9J1xMJo8x35c8QHyPFkGYyw>
 <xmx:hf_aXSxxhYIqMiHvML6XNJlpngVr5GWOepinaUtq7T988XpGHmcuJQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 631C8E00A5; Sun, 24 Nov 2019 17:09:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <eed376e8-445f-4a2f-8184-de2c3800f953@www.fastmail.com>
In-Reply-To: <5d3da051.585b.16e91e043b7.Coremail.ouyangxuan10@163.com>
References: <1b4dacbd.8278.16e6e6c2234.Coremail.ouyangxuan10@163.com>
 <a06a7845-cf16-4e37-8674-acd0950d6245@www.fastmail.com>
 <42def251.79a4.16e87d7a3a7.Coremail.ouyangxuan10@163.com>
 <e4d8ad9b-49cf-4942-a64c-0c47a94efa17@www.fastmail.com>
 <348aed94.42d2.16e915b4531.Coremail.ouyangxuan10@163.com>
 <839a25fc-1244-4c96-b3ed-6a2c04445736@www.fastmail.com>
 <5d3da051.585b.16e91e043b7.Coremail.ouyangxuan10@163.com>
Date: Mon, 25 Nov 2019 08:40:37 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: www <ouyangxuan10@163.com>
Subject: =?UTF-8?Q?Re:_[openbmc-kernel]:_How_to_make_pinctrl_not_affect_pass-thro?=
 =?UTF-8?Q?ugh_function=3F?=
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
Cc: openbmc@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 22 Nov 2019, at 17:20, www wrote:
> Dear Andrew,
> 
> Thank you. I got it.
> Pass-through function is only a small and special part of GPIO 
> function. 
> If the entire pinctrl and ****/sys/class/gpio **** are changed due to 
> this function, I am not sure whether it is appropriate.
> 

I'm not suggesting you change pinctrl at all, so I'm not sure where you
got the idea that we'd need something so drastic as changing entire
subsystems. What I'm proposing should boil down to a new
configuration option to pass through the gpio userspace interface,
then adding appropriate support to the GPIO driver. We might need
to tinker with pinctrl a little to get the interfaces right, but nothing more.

Andrew
