Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA44D591D
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 02:49:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s0MC5gf5zDqvW
	for <lists+openbmc@lfdr.de>; Mon, 14 Oct 2019 11:49:43 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="JDn30kNQ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="DRN5mpvi"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s0LZ1nZGzDqsb
 for <openbmc@lists.ozlabs.org>; Mon, 14 Oct 2019 11:49:09 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D29D23ED;
 Sun, 13 Oct 2019 20:49:04 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 13 Oct 2019 20:49:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=6JBDpTgEmXX0gNF+s568PDU6bb1eYEp
 +9cd+5l+PLAo=; b=JDn30kNQCPaB6QLZpe2uSWJiKxMgpnanwbh8ThvYWQzgg1t
 BodfxOyIIKMZdmf1r7VnQAbesMZLr4K3i3Nu571zjAxuevc83URXePq9nCltbpXV
 0wwzPZhIbja6dG9YXZvl9ScC0N5bsjxXpnNt3tu4MvDRffqSJCA4ilw9a5cqK4cO
 H1ooua2y85q7dN4naX7VPBTtGYojgcQGeTq2WUFW+K7dPokLyCEVYmHNzznSI/84
 kN2l2JqpdnfuwwU0r9mSZDcqr3FhF1wjKgnVeK+c7J+HC1UFVvPgwKeZPRNA0fHv
 fqYAbw8fieepEXskz0UbAopNGg4vHG/HZeZwxWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=6JBDpT
 gEmXX0gNF+s568PDU6bb1eYEp+9cd+5l+PLAo=; b=DRN5mpvi4DQje+JFBd96dt
 dH0TlCMyPhSNLiydtKRnh9vhQaUh+Ak42bGEN1KuN39Mxit8MBKidLqHyyIzZ3lD
 FhvMkb8dGSuksJ1LRTKszsMGigdtNnwzMacBRlkjDIW/rDWcdXWhowZU+7jh7rk5
 Mx+hBUd7V5xGU4W2xWQd/ekubHAY4peKH7/gvyQ+EuP6Yt3KCSBL5CBPY5fxT4te
 uFbfhyuLwAfPknME5E7HOYWydmWe4LqUNh8+sYgI5gsXwl7X7m8/a3NdFHauXrkG
 xnUHn/1HyCaOOadHtYKU43XHLsCZkwfXLzv98bSq9Oy09gA50F87grHSGeTCOGFg
 ==
X-ME-Sender: <xms:_8WjXfa6mTG1PFT5OuvIrgOjwMr1eoC-m8ZkN4r7fKy6V1Fs8jQxkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjedtgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:_8WjXaTtOMeZk33A3R827a01Vi3mlNzkwjyKR-uJw2QMkup3Q4PKGQ>
 <xmx:_8WjXddtAk3HrWsY7PRUDmhBt4ASsUrkmkhqK3TeGI95E2soRjB53w>
 <xmx:_8WjXZnYXgDkQriTrzpM1a0D_l-RtLh14iO2P9ujI51tW29N58kdAg>
 <xmx:AMajXfimgv67GGvNI14tn-bGUvDFq-4s_ZRETY67oG8qWuMV1cUZJw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 813D4E00A5; Sun, 13 Oct 2019 20:49:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <de89b084-be95-4113-97c4-40c62d8572c9@www.fastmail.com>
In-Reply-To: <20191014004433.28180-1-joel@jms.id.au>
References: <20191014004433.28180-1-joel@jms.id.au>
Date: Mon, 14 Oct 2019 11:20:01 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-5.3] fsi: aspeed: Add debugfs entries
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 14 Oct 2019, at 11:14, Joel Stanley wrote:
> From: Eddie James <eajames@linux.ibm.com>
> 
> Add debugfs entries for the FSI master registers.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

A bit ugly, but:

Acked-by: Andrew Jeffery <andrew@aj.id.au>
