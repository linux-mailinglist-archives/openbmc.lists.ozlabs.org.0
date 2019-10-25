Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E92E4158
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 04:09:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46znc06hcGzDqnB
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 13:09:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BNWFEJ4Z"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="N8bN1y4l"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46znbD4XKxzDqjb
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 13:08:40 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E00562F9;
 Thu, 24 Oct 2019 22:08:37 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 24 Oct 2019 22:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=b6FGYC5jd4jLs71PmN4JCPoSVwwFPmm
 dGg4bVTkRnq8=; b=BNWFEJ4ZIh+Amsn4OC0hyvVquK+C1mOJre724YsiK+lEQfN
 NX2cVU1k6c2YNrXrqkRkh1ZMhnRsU7Dak3ns4kus6DTpLg96qSJM7JD5y1ftZwGO
 xVZLJTHPTypOfxOqLF3I7MyuMTVJTMsmjZTY6aL4smP1Hw4PO/MIwG0wfMs5OCJF
 o8npqTImw5aauR3+1jhBbcQWG+HySdkkH3i/FxMSXPrFgg5WK9+FrXbYxmsAQZRw
 VrhldtrOefCQpSwLIV/Yj8AaL5NmKoMTavf5SJ2HBSMh1BXefDROCYIYhozXn8ZB
 rP3FhML9EjrkplfcUVBqNSGeCo3P40QUOiyUbPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=b6FGYC
 5jd4jLs71PmN4JCPoSVwwFPmmdGg4bVTkRnq8=; b=N8bN1y4lPFMgdjUOZOW5Jp
 OSQWxHlPLpsCMAh392VImP0lS2KwcahTqZe7o8XseuNd2o2eJOnEIIyn5aXbOqVl
 S3gPEzE5ljARgUxhfNYZt/kgGtaiO85uzKDq4cF6Gg1Ae73+mpI99dF6w6ofxofB
 6Du9sngTtl2Gf64X3JC009IvpX+7mNVppKLK+vuut7KfEYCLLW+i9BkgquTVd0vx
 E1Y/mWwPs2CFGhlTrzhPar7nl4IG2Nes49KCDQZRudy+dLHJJID4jJT4PNNXKrG+
 21elpNXsYeoIbKtF+FaAwuwDfRa94WSTJHoov00/34nxnxLrSFWK6typvG0ggYfw
 ==
X-ME-Sender: <xms:JFmyXbi6ZR5tT-SWYqMp4gpXKh4e-fgeNBk8wejamPr9mFAPvtqEwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrledvgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:JFmyXTPEzJi7cN_KAW7nlwHs0NQa2_tUPycVgFP2nfINOcpAW1r3jQ>
 <xmx:JFmyXaO2jzRMbD4LMc99qPq86aloN90EjPskpNx7_JfJWTUa2TY7Sw>
 <xmx:JFmyXYjzIgU-M3i3TRJFHrGwmDnezJC0gfYqsTtWxJQG_HaGBoxEKg>
 <xmx:JVmyXe4rQiWkLXwFFLFNnt5XVLxQcN4XPSR_MR5rMGPVSYKGh-xklQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 87A4DE00A3; Thu, 24 Oct 2019 22:08:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-470-gedfae93-fmstable-20191021v4
Mime-Version: 1.0
Message-Id: <cb0f1510-3c24-4d47-824c-135d9fa68e13@www.fastmail.com>
In-Reply-To: <20191025010351.30298-6-joel@jms.id.au>
References: <20191025010351.30298-1-joel@jms.id.au>
 <20191025010351.30298-6-joel@jms.id.au>
Date: Fri, 25 Oct 2019 13:09:38 +1100
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, "Jeremy Kerr" <jk@ozlabs.org>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_5/7]_fsi:_aspeed:_Avoid_copying_read_?=
 =?UTF-8?Q?data_twice?=
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 25 Oct 2019, at 12:03, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
