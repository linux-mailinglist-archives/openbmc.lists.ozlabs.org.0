Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E4C22BC19
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 04:42:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCYQ103TyzDrhY
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 12:42:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=oyICDykM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=KjflT6Xn; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCYN43g9CzDrhb
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 12:40:36 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 118C2B66;
 Thu, 23 Jul 2020 22:40:34 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 23 Jul 2020 22:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=xu+2hywnZK/f11N9LsbSVV0nGJpVU6z
 HtYX65IZBKzU=; b=oyICDykMHidHVKhN1+d1CT/aEygdcSdI4LqEE3f5AyIh4db
 tCNm6c6QLnJoap0bVTXgtVKX6TreAxfRJNOy4yC3/YFuYCWcXPt13/goVnX+iZME
 MXnhr8h87bdZzaEG7RqWMghhoWM3z1OYkYkCIOoB0wOcM4CK9sXu6q1RTMi6QqST
 pE2IbWJHbE3bSSSuj4J+wddMRGVJST4ex/VDox43YPw/saTSW4FbnQtzh2X97SOi
 yGPJREgkpzaFM+epHrxUpJ76/xK10SCkImxzc9fmN3qP2NMY/6uoy2dMzJ8Ci2tf
 kD5zpWy3R2yz6AtsCpxi8BS36xv0pcLI18g+Bbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xu+2hy
 wnZK/f11N9LsbSVV0nGJpVU6zHtYX65IZBKzU=; b=KjflT6XnmHwKvNXHs5p/9G
 mU+F2mzLbkq0mYdjx5vviOMpNvf8Y0Ruk7oluKIdJx2mY43DVqi6eGfb9mUee/si
 ERkBSUOiejr02ie1TjHpPbujrN4s8cz7wDBjcvAKlenjgAq25ZOQSYk8yAtlHzrE
 FvlNxPUgQd+i7+nK9l/RGYPXr9czmdZ+tW1FlKAi7QUceY9rf11FU/FPUexQ3Wli
 D568nCaf8ucUTFNnSea30O7JEuFf6gSRHHUnwT0tfis4w6DnlvoYASAasXytvuMj
 2mFdthTgTjZSJwJjv5l9InsjT6/L6YmPSRGzqPhGtvVgrSLAGAVDid/Ad2p7Sd7w
 ==
X-ME-Sender: <xms:IUoaX-CG0NK2f-fCOhjtAiose2SdWcM0M5IF6KbtmaSkMROCO5kP7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrhedvgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpedutddtkeeugeegvddttdeukeeiuddtgfeuuddtfeeiueetfeeileettedv
 tdfhieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:IUoaX4jJbPpllMIlzNOMhZDIGUHxTGo7FibFopvgZJboijK0X3jDQw>
 <xmx:IUoaXxlXIg4IxBuhwivV2mIjAJUWzoeQYZYfuHcqusWNWZ8gSf5KKA>
 <xmx:IUoaX8z3zhzsx3NK7IYM1y7Xd2p8xA_sorLZ3WAiJVnBUjItyV_kcA>
 <xmx:IUoaX6ftVtstFOGpM9PG8aiusCy0DXk6rHCsyxYMdu4crQWhplzc3A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7B173E00C9; Thu, 23 Jul 2020 22:40:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-92-g11c785d-fm-20200721.004-g11c785d5
Mime-Version: 1.0
Message-Id: <f5b8dd78-12af-4c51-9f35-209572470fdf@www.fastmail.com>
In-Reply-To: <20200724023036.354310-3-joel@jms.id.au>
References: <20200724023036.354310-1-joel@jms.id.au>
 <20200724023036.354310-3-joel@jms.id.au>
Date: Fri, 24 Jul 2020 12:10:12 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.4_2/3]_ARM:_dts:_aspeed:_rainier:_Add_C?=
 =?UTF-8?Q?FAM_reset_GPIO?=
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



On Fri, 24 Jul 2020, at 12:00, Joel Stanley wrote:
> The GPIO on Q0 is used for resetting the CFAM of the processor that the
> ASPEED master is connected to.
> 
> The signal is wired as active high on the first pass systems.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
