Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 028DF130CEF
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 06:19:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47rkMr1CZNzDqCB
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2020 16:19:36 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="q6xSXrAJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="V5E7BR9F"; dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47rkK90PljzDqDT
 for <openbmc@lists.ozlabs.org>; Mon,  6 Jan 2020 16:17:17 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id B7AB04A6;
 Mon,  6 Jan 2020 00:17:14 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 06 Jan 2020 00:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=ATQxHbw+ESAnaf+l1xxJ6ov2st4bB2R
 z36SqaP9tYYQ=; b=q6xSXrAJFq2Q0Q2HMk+GDsWXDBESE9T1yfAbA3mLsvB6mkE
 dhxZyTqjCnzkwoZUJuS2TAnVOnoN+A+MK6CohLfpUyDm7ZB5uLbb+2yTiGJaqLRQ
 sH+BaqWsu8xsNG+NFq+MEY+GEJQ2jMUcqUFkpmHp3Ln8VNTMg4Bpid6TwnOkJs4b
 HsjibTnEOAAcBjmMAvR03fqj5I6htu1McGt6GJ/E1BAVxXc00KUyGktnTRT07sHi
 nZjF3ct530n/nq336eJ71NfvX7beWY6OgR7T1RpMYvc583pBNSu3L1k33HNvBRku
 ymkFZsr0UnFT+SFMGgjPYgQ/bIlsKNqyUUqj9uA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ATQxHb
 w+ESAnaf+l1xxJ6ov2st4bB2Rz36SqaP9tYYQ=; b=V5E7BR9F6nBhN1Y+TgXjKQ
 cxR0PPRoIQ4Io5gEv2X8M1+p+/Yu3d+xIO2znTwvhqc2DLYDguWMmYcQa2ioUsqy
 GgWjV/RWhg1s7yiSMBSIUMyOPuqeOvY9swlJm2pA25nqo6HUto74dCS08yLRwbOB
 RQGQ83iEpqsYgVPWBBrDkihhTZDj4n8nj4tSpDWiBeyzlAQqQ9TqBgCIlnXj3CCX
 lw4Xz6plHVe7befFzrH3mDZwsxAj2Xzp/0OLYTHcE4wGOTGeWZTuJf5hICxf3vr7
 eXO245Uh0IAcve94lzAWFT2Fy/m+Y5GAke+oJcANfH6U2DR522qM1TnOeBNXeTJA
 ==
X-ME-Sender: <xms:2sISXvsMdPBeLxSYpnY-3b5gkVJIiB4u8vW0L3lzdurrhYnXfDhUGQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegledgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgepvd
X-ME-Proxy: <xmx:2sISXsVXeiLSEsiWpKrDIN2D24VBctcninnn-d1kfeRaYvgOU3iuPw>
 <xmx:2sISXuRDomG0Rjn7jHu7Lt7faj493FM1jKlVyBnoE6zuzhno62_hbQ>
 <xmx:2sISXiKquPzDMkLwgaoMtuyBZ6zLBdmmB2_WDVCBRW-WDW2LkGdM1w>
 <xmx:2sISXmyBJcVpwxDF5TErnHZ65WOW7durFV3uR4ShC2_OMVQz7FCSog>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 323F5E00A7; Mon,  6 Jan 2020 00:17:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-731-g1812a7f-fmstable-20200106v2
Mime-Version: 1.0
Message-Id: <82b7ce93-94b2-4e12-8150-5b84ca49a776@www.fastmail.com>
In-Reply-To: <20191223134735.559200-5-joel@jms.id.au>
References: <20191223134735.559200-1-joel@jms.id.au>
 <20191223134735.559200-5-joel@jms.id.au>
Date: Mon, 06 Jan 2020 15:49:14 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_4/4]_ARM:_dts:_aspeed-g6:_Fix_FSI_mas?=
 =?UTF-8?Q?ter_location?=
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
> They were placed incorrectly when rebasing the patches on top of 5.4.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
