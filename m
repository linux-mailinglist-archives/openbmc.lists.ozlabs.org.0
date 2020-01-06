Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4149A130CF0
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 06:21:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rkPT2n0szDq9G
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 16:21:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="h4YH4rVb"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="o/iPQnzo"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rkKs0JZjzDqCG
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jan 2020 16:17:53 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id F22764A6;
 Mon,  6 Jan 2020 00:17:50 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 06 Jan 2020 00:17:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=Wp2g7lOipvnkapNo9/26LfxvCFqVFCi
 MjgXcb2ffC6o=; b=h4YH4rVbAKO7oCF3+u5bshNOXKkPAMu/Ark9MwmL1B5yYUq
 i7ImR0j+gXoRo8RKyq8BN5BprW58DjYPvo8j3wV1zTc5d0g/EmqJ/oBOPrIsdTQ0
 OTbpJYsZJulVOqCb8glMcfJ88dUIUadY2l3qj1QnyS6n9boEbF58kxhfkf4ZBBAp
 Zz/ZvUqc6SdAoa4Hr5ZI7z+WJPdiUVUCslg6qPBKbj21Stnughe2FOGfyJZnpNKO
 blYLaFB+ubcpIGAVh7uYMB7/bHQKbLusQI6JdA+Saxpk7VGtkWv2EyzMiUatmkQj
 zvlD5xT8qke9MI282CyTnuvcHhyOqt07g6cv1Fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Wp2g7l
 OipvnkapNo9/26LfxvCFqVFCiMjgXcb2ffC6o=; b=o/iPQnzoRvSiRTqU3KgySc
 jVH2sDAk8lYGzJBhkU54t9wxrzR7vHE+uhc9OG6jQNpIlJHGn+oKzR+QR/8o0lGA
 /4I3hNGiX1Xm2IdTvYuIVSRu7So2IKRSaFyOjhSkMLP3t9ecORPHZq1m0ZYwqJRE
 ENvUZRak9yVnf8VtP1g1NjcRMl56hON3TVW0srkDBS2Fb8Rg1iNjD9ykFFPx4uKR
 YvfjiGvRsVVJH+W6xJGc4mliYPdByMmHEMO6/bwJlfQ9BkW1aZzgzpvpTS1Q3jL6
 5CEsNdPDgDz1gFQ1FFhdRi3uvrkPjutj/2lYiCHJWQ19ZrZ4mBltW2f5Vtv3Or5w
 ==
X-ME-Sender: <xms:_sISXrUXiQ8BAeoQIe1xJqA27oanl7rRrLueMxtIigyRQxoZ-EMlOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegledgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:_sISXkW_-tppiT05QoIvPbEH8qKKvtXX-QIwe_dyQNwUjgF45X2d6A>
 <xmx:_sISXgSe_NuE4k1K5FHiUw4LVyR0Rx9HBq70-Rgw0t550H6G0TZYxw>
 <xmx:_sISXuN11Qk8pIZHdK_XIC6VcaiCfahrRx-MDgLstW4lhhH8CJusew>
 <xmx:_sISXt2omjjhOaUaGwATNcnN-TZxz-ChrzXgLr1WwJoXPZekFi_aHg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6C604E00B1; Mon,  6 Jan 2020 00:17:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-731-g1812a7f-fmstable-20200106v2
Mime-Version: 1.0
Message-Id: <75639e04-79df-4a52-967b-6aa17ae90283@www.fastmail.com>
In-Reply-To: <20191223134735.559200-1-joel@jms.id.au>
References: <20191223134735.559200-1-joel@jms.id.au>
Date: Mon, 06 Jan 2020 15:49:49 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.4 0/4] ast2600 device tree fixes
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
> Here are some fixes for some issues with the device tree.
> 
> Joel Stanley (4):
>   ARM: dts: aspeed: tacoma: Fix fsi master node
>   ARM: dts: aspeed: tacoma: Remove duplicate i2c busses
>   ARM: dts: aspeed: tacoma: Remove duplicate flash nodes
>   ARM: dts: aspeed-g6: Fix FSI master location

Haha, wow.

Fixed now at least :)
