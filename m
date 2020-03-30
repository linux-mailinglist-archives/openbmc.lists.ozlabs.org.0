Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC9119720B
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 03:36:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rFRQ5Rl4zDqYX
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 12:36:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=UYVvVJTD; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=f4ZUzUVn; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rFQ36CBYzDqRh
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 12:35:07 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 10AE05C0969;
 Sun, 29 Mar 2020 21:35:04 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 29 Mar 2020 21:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=zuC8d4BxPwvQNtEJF5zL0EWGDF4FylJ
 g8pU1w2dcpEc=; b=UYVvVJTDiHWtjonq10wWYFkO8UJJHNNFe7hl5+szFKjYyQj
 RSs6EwM4jQj2TGUpJ+5VD7piQkqb9xl9asOlnq981SiI3e8bTN3AypztHOczRjPT
 z0mBCEcsZu2BoP3cE9FBgR1QT4hz34CeAnFYN7IrJ7XTOPxUZuoC1mPoWD7VAHj6
 s8Tj9QNNr0GXwALYh34NU40+t0ie3j+qrNacDgH91DUSV1U9FMqeZ06/fLQkbmoD
 iwjhNlBI8BkHPNTW/86wPFG6pWQqedBSbgKO98f4ye7eJlyxK4StipNVp1vZ9aW4
 Fc12n2K35rIL3/RS7h0rqyFuK3K4wUwdZPPV+RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=zuC8d4
 BxPwvQNtEJF5zL0EWGDF4FylJg8pU1w2dcpEc=; b=f4ZUzUVnQXfnkUyKQzlfMa
 WPmsCspSK2s/iwpFyRM7ozRzDNzHk0TVJv4+JhCiPBfLEIwr3srx1ve2xliPkZju
 OlTQZ3xUNHRseJ7MpWS2/U2quAvAi10TqqoT5nFky6yizRJ2ZEkH7FkOgT+P6dx8
 hqf72VDt4EcmViCfTRXW11Zg7n8sKF+6687wjxZ7LmoOKuF9NiAhDmy9W+4kOtz+
 BQ+owR6tTICcTpK8mTijFQCPwK3Sox6hmh/WHTFt9Yw5JBONMdBJenhoVhzgzC3L
 nweuauXMLweTe+gciIYB/O9Xp5pPBZWW7aMWEpZPAXW5UvwnMPYwSZIZlwtyxIBg
 ==
X-ME-Sender: <xms:x0yBXkzWkn9fOHxRWsDWABjIfAw3R3ARvNoH9g6WSPpWrzEOzxtopQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeigedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruh
X-ME-Proxy: <xmx:x0yBXlx-j4CrOc4vZd06obOETdVe5740Q9YpdMJY1mXgUAa24TSaWA>
 <xmx:x0yBXso1XDs13OG3CvH0zi3rspPJG4hgIsHp9J0rF3gYJ6yS14BnJg>
 <xmx:x0yBXpqKvgfoAAd1Uzq8oCaHsBoGWer_A5yb267WBI_fEKVuYmxjdw>
 <xmx:yEyBXg3xbtQCZWJLIx-JzN-hJ3eq8iXcJ5Mfbjcb_yBLUyO0DIUiKQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 55C88E00C2; Sun, 29 Mar 2020 21:35:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1021-g152deaf-fmstable-20200319v1
Mime-Version: 1.0
Message-Id: <005b33fb-0c85-42ca-8b0f-7225c42876e6@www.fastmail.com>
In-Reply-To: <1585253643-23634-2-git-send-email-eajames@linux.ibm.com>
References: <1585253643-23634-1-git-send-email-eajames@linux.ibm.com>
 <1585253643-23634-2-git-send-email-eajames@linux.ibm.com>
Date: Mon, 30 Mar 2020 12:05:14 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_1/4]_soc:_aspeed:_xdma:_Switch_to_res?=
 =?UTF-8?Q?erved_memory?=
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



On Fri, 27 Mar 2020, at 06:44, Eddie James wrote:
> Use a reserved memory node with no-map for the memory used by the XDMA
> engine. This replaces the memory property previously used to access the
> reserved VGA memory space.

Great. Can you refresh the upstream patch series (apologies if you already have)?

Acked-by: Andrew Jeffery <andrew@aj.id.au>
