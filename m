Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F8CDA2C0
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 02:38:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tqyp5rYjzDr1j
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 11:38:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Km7s8zZr"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="upzlmCs5"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tqy634K7zDr0V
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 11:37:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 3ADB82202A;
 Wed, 16 Oct 2019 20:37:47 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 16 Oct 2019 20:37:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=oqjQ8iC4Bv9RyvCBusrunkOf/HPDiYv
 /LQzKDs+iyTk=; b=Km7s8zZrmwZa3qz4NOV7rxfb2f73E+3C5XRvNBzH4Gv/p69
 eN6YNjXmIc+leIyExfIzDFKgmmya+TyIuUDhTeC2rVmQGh1KdpJADcR9M+NXAppy
 Sc4CVM1gCmnjbH4jeco6oWFKzS52BEnwNHvvQSr0/Cdr6Cg85YvgeJruE8o8/BF1
 OHHblJhAnPwSFe2HZM/09zA3BR6JY098cW1WzaRONv6s2xO83+PwufPRV+QLEAFl
 QpKIFKUjVrMfQwl5b+i7T78RN1AnqvyUI8NrUz4tLRlqpixaUCm/I5Ot8kRGKcQe
 BTF5/pBMhyIc1uL3STKrfe8UypL9GM5PpgOA8fA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=oqjQ8i
 C4Bv9RyvCBusrunkOf/HPDiYv/LQzKDs+iyTk=; b=upzlmCs5ypsG9QxUZWakRE
 EnPRrtkQZ35Uaf5iPcpFo/eYtTgc6v3qNgpicaCRfNBgjGkW7n4kHkLXfb77OYga
 ZgdDil8HSZaKSZOaVUi4EyLTmAHiypWwYBIkKkcf5wH+3VSENCq8gmpJQSCwo2Wv
 bhUK6I7un4lvwI32TWcgGaGgPr07SVnaf5k7j3o7LqYDCWuRb0FthepVZB6BJH+g
 4P1Yh1Y79pwR9Ipp3+MfeV7+j+ZOnTwxGzpotOYwuiKOERTbt/UTO2RBE2rPKnif
 kJvTBCJs1FVp4C3wulph/3LMrIUtICGuBTdWbn7gzsf3ipheWr8JCIwwL+2oxsug
 ==
X-ME-Sender: <xms:2benXVVVUgQO5J_Q-SuTPSeGaCrRFpAJ5SRlfIo7pbLF7Dwc7P69Ow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:2benXdTJtSL4pI7EyV49aAdpF5LxgG1sU8U0qPYQJwCM5aW8qIRU6Q>
 <xmx:2benXTl32WTyk-cxOBnaCqf0E7H-V0cV4uFxyOT2Pvg-dgiZZDi6qA>
 <xmx:2benXXB-6nAkYsFMFehFF71VinSw-AKmwWLT8YVF_Jo2dPLimGnTNQ>
 <xmx:27enXUz-0hVRkheyVPfYu1_VZJm6bguFsZgqiEGpa7bWb9Wr9-Kn1w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 76E94E00A5; Wed, 16 Oct 2019 20:37:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <94697fd7-b545-40dc-aac7-ebc3a35a642e@www.fastmail.com>
In-Reply-To: <20191017002955.2925-3-joel@jms.id.au>
References: <20191017002955.2925-1-joel@jms.id.au>
 <20191017002955.2925-3-joel@jms.id.au>
Date: Thu, 17 Oct 2019 11:08:42 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_v2_2/3]_ARM:_dts:_aspeed:_tacoma:_Use?=
 =?UTF-8?Q?_64MB_for_firmware_memory?=
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



On Thu, 17 Oct 2019, at 10:59, Joel Stanley wrote:
> Mbox's file mode needs a window the same size as the image being loaded.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
