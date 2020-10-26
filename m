Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF2029859E
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 03:46:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CKK3b5HgPzDqNr
	for <lists+openbmc@lfdr.de>; Mon, 26 Oct 2020 13:46:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.229;
 helo=new3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=gfg+YwTi; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=mTkhON/g; 
 dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CKK2f4zQlzDqNG;
 Mon, 26 Oct 2020 13:45:46 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5E01958033E;
 Sun, 25 Oct 2020 22:45:43 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 25 Oct 2020 22:45:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=spYZpkcjWH5b4RxjGtzyps7vpiTVhVY
 z5Hwu/hHZRTo=; b=gfg+YwTivQV/OI9oMXgq5jfxPFyMv0xFCJd1rsoh99T0jYM
 3kn6QirjM/mCeOxNYrNnQ8tVTrgZ+RE8/WYLW2J1DuGj9zxzvI0XUfm+HFXWINIm
 vam+sxI0p4jl6N7+YH0zLSOLwxUhBLQpVDVZyFFTKajLpYXQ/VePeXtkAP1xe7Pr
 pEFpFV4JSkBWMMKxulRfjfTUbqwvFRylmC8CbuItiZk72x8+nXq1Nfit2b+bGy3p
 tBMVVP93eHT5kcz+vKr8HVSQXi+ydnwpz+DCF6Yce/LveTfzliNePrXZ5KcpkvDf
 6rIho20nwEFvNCDFs64CNbbc2NuETvaX85A5+nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=spYZpk
 cjWH5b4RxjGtzyps7vpiTVhVYz5Hwu/hHZRTo=; b=mTkhON/gyiug/jhbbtcRDN
 yGqRrR13psbnn3bjiu7JaZ+hUwIJJEPsc9u1P1CZKBtpj8Z77ULha8VN2ZDZxTNS
 0ZW4Msl49qZVWsHWdNEB3IYpxC5iwBMQDIx/wHQvOizxgVGw1N0MnTbHJ8E/SSbq
 MCiOYzvVayrnuNdptS4OiuWvj/olpB2KP2IGHDL4mVUZ58ScxUApGDS0JEy9+Z6W
 5oV/xlxV4hNAeIaRLsz/U7lbKovDfYSg4KIoHZ/QK1a2JBf9W8XWt/XlsPUV9aNt
 fxBx498TKRTRIof0ijNGuDXYh+WdLpZPkSaDMgcgLrslbic7Zhk9XdhuA6ItYoPA
 ==
X-ME-Sender: <xms:VjiWX5a8m2rBD_vqpSlROQucNSrhusXkxds6sRhEGzCrbH8XSw8L2A>
 <xme:VjiWXwYs_IVIvYVZDfl2nw1PeFUR9UFozYNTCb4tBAsOkCI8JVHV4L5ujctBA1yRm
 aupKkhRz55NA-hHvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrkeehgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:VjiWX7961FxvQJlX_tNZkwQEr1ch3TvecVwYt3OvoTe4sraAanqkkg>
 <xmx:VjiWX3pJt3v72JjhULwbOXmGuMSgi6wgxr0QRWHgsnAHO6oqJfzHgA>
 <xmx:VjiWX0qpyR3S3mZrwDTMKyCoe17DK5mjJhrCvB71fpAbLsb1kewwVQ>
 <xmx:VziWX_DOwBa7GxZTrnwEF57ej63gu9YNsfqTNIx9CNIgyGwDIgLPZQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4A63BE0508; Sun, 25 Oct 2020 22:45:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-529-g69105b1-fm-20201021.003-g69105b13
Mime-Version: 1.0
Message-Id: <33fc9ee2-c588-4c1b-ab74-4f023469e3f0@www.fastmail.com>
In-Reply-To: <HK0PR06MB377943740366AB328247C452911F0@HK0PR06MB3779.apcprd06.prod.outlook.com>
References: <20201005082806.28899-1-chiawei_wang@aspeedtech.com>
 <HK0PR06MB377943740366AB328247C452911F0@HK0PR06MB3779.apcprd06.prod.outlook.com>
Date: Mon, 26 Oct 2020 13:15:21 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 "Lee Jones" <lee.jones@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Joel Stanley" <joel@jms.id.au>, "Corey Minyard" <minyard@acm.org>,
 "Arnd Bergmann" <arnd@arndb.de>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Haiyue Wang" <haiyue.wang@linux.intel.com>,
 "Cyril Bur" <cyrilbur@gmail.com>, "Robert Lippert" <rlippert@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 0/5] Remove LPC register partitioning
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 20 Oct 2020, at 16:33, ChiaWei Wang wrote:
> Hi All,
> 
> Do you have any comment on the v2 changes?
> Thanks.
> 

Hmm, seems I'm missing patches 3/5 and 4/5 from my inbox. Weird.

Anyway, sorry for the delay, I'm looking at them now.

Andrew
