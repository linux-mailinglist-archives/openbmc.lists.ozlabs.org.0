Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A0314505
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 01:43:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZPJP3ZJKzDvVr
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 11:43:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=mYEIGY/l; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=mlRiu5Hn; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZPHL2cxnzDr0y
 for <openbmc@lists.ozlabs.org>; Tue,  9 Feb 2021 11:42:21 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id BAC955C01B5;
 Mon,  8 Feb 2021 19:42:18 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 08 Feb 2021 19:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=zB92YW3JcLly2c1aRu73UGOcqgCUMR3
 Q1PsmGG/7ZCU=; b=mYEIGY/lo+UxXaJFPJPoBynkAzvSiH4pjfwD0lndCqK27rx
 FoNI7T5XpOTGmkzN4LFx19+7jwo8HhzFf5+U2RKbvchuDruH1AZDPglumEzw9WFE
 PPlWckPFro1S22VE/xsxkjc/EzQrMq/MMVkFgDTHHwggoi9f+FsUZbncAfpYFQRI
 jbq1kYqPqHMjRQfwDtaait+fOqunKVZfly8vL6iaoAjyYpnIuXlNiW/rsfHpJjHW
 JCkn/D5IsIUZvVf7NfQUvSUpD76UjZlPeUE+yJiCh7ADOrsbPRUz1GOdp+CIqgTP
 Lq7DT4me2ISTPnPQ2CDUqKcY8caENicr984tJBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zB92YW
 3JcLly2c1aRu73UGOcqgCUMR3Q1PsmGG/7ZCU=; b=mlRiu5HnYLy+uHBCno5ySc
 aw7olrIfAQqQ2d2AtS3LV3toIrX3mNyTFq8Di/NxWrYcbbhfubwy/Zzga36d2JGt
 7OZ0iY4hEm8h6Ei4GG2Y+KzYm06pRNJ5IoWSt80ErChwHgJBPurTsjYn9VRKXfV0
 ncql4UEX5mawwRsUN1XmJr88qpaxaY5fDj+ekRumtsg/CzJToyaSzO6EwQZsjMNW
 b+Y76OQtSnBhWNUIO/4iidGJgNkjW8dXwyhjdRgDaNhicyTmtkjqne1I2SR6i7lO
 qGZd6CCtK2eXm92jZ+I0OcMeYHXdzsSx8HzqRhJTbkayIiWuzdIk3ZNxDBXo15Tg
 ==
X-ME-Sender: <xms:adohYEW66aQmHXmZcsTZy5fcoApxnriHlcVgIn-1qPFVAFFfLpMoEg>
 <xme:adohYIlpcArA7XsPf76E7eFDzie1Ruef2nAYfyBqTvuW5AftvkcrV21umAVj5ys5R
 8eIE2Wx-vTWsccJmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddvhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgif
 segrjhdrihgurdgruheqnecuggftrfgrthhtvghrnhepuddttdekueeggedvtddtueekie
 dutdfguedutdefieeuteefieelteetvddthfeinecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:adohYIZdWoDA45vIGUHdcdIdFkKxAO7g6V-ZhcF8EYgEQRliLSg4bA>
 <xmx:adohYDWi64asIsaKnyJ9PfnaP2Ek3Ti5DM12Y627pygyoqHaOFffUw>
 <xmx:adohYOlyL-E1rWASlWk5BcYyzv1r2AOm9HLgzhQDx6TRfpZPWEdmRg>
 <xmx:atohYITkmvHLSpA6ZbQFedTc66zf8lqv7knXcakLiDpbaRapbvKZBA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B98F3A00060; Mon,  8 Feb 2021 19:42:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-93-gef6c4048e6-fm-20210128.002-gef6c4048
Mime-Version: 1.0
Message-Id: <12175d11-f353-4926-a125-f01e59135113@www.fastmail.com>
In-Reply-To: <380419ba.ece.1777679c335.Coremail.ouyangxuan10@163.com>
References: <380419ba.ece.1777679c335.Coremail.ouyangxuan10@163.com>
Date: Tue, 09 Feb 2021 11:11:57 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: www <ouyangxuan10@163.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: =?UTF-8?Q?Re:_Does_openbmc_implement_NC-SI_over_MCTP_over_SMBus_to_obtai?=
 =?UTF-8?Q?n_information=3F?=
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



On Sat, 6 Feb 2021, at 19:03, www wrote:
> Dear all,
> 
> Does openbmc implement NC-SI over MCTP over SMBus to obtain information? 

Unfortunately not. There is an out-of-tree implementation of the SMBus MCTP 
binding, but that needs some effort put into it for it to go anywhere. We're 
likely to see a socket-based AF_MCTP implementation before SMBus support is 
merged in libmctp for the purposes of OpenBMC.

I haven't yet heard of anyone running NC-SI over MCTP so you might be breaking 
new ground on that front too :)

Cheers,

Andrew
