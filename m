Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6D72FCA30
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 06:04:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLD3372dPzDqr6
	for <lists+openbmc@lfdr.de>; Wed, 20 Jan 2021 16:04:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=B65btyI7; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=PmwO0/iv; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLD1h0xlNzDqhF;
 Wed, 20 Jan 2021 16:03:19 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id D766E5804C4;
 Wed, 20 Jan 2021 00:03:17 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Wed, 20 Jan 2021 00:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=xNfm365uClhXGK6uG7giL0yzWNNeafG
 YOvKdTJ/PaV4=; b=B65btyI7ZbltdGycriiqYkYmIHNLpaB6Ai5O8lo33wsVxlL
 kYIRRM8BLvbAtN8tJna0alEZeDHuozOZVoHuVql/heJxoiJAafaT6piGJhAhTess
 V7Pxch+wx3RRBVhokHM8Az6IX3Jdml2ibmy64CJPNwcdZ60HjIqHQihyM3qUfJfN
 tudsRU4ALKIThFUCZ/D3L6uhCloJkZgwAZPSE1WAbwMGzbBpPH6DqTJsNKOD4Cbp
 3g4BcGqjA+aWvgMhNcfgqlX+nIVsJhWtCAYV+msOU5mKv+5/6gBVG9iQsLL5xY9S
 te25kRvCklAm1t272+4VRH/66UfZs3wetgGQ7Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xNfm36
 5uClhXGK6uG7giL0yzWNNeafGYOvKdTJ/PaV4=; b=PmwO0/ivKVegqmL9LjtChe
 ylEVxkhXZab9FLUmqqGlkuk7t7sO4iykeSm5N/hRBmCaE+HMg8AYe3fRXr+Jvbfa
 RFjVm74FaP2ZYxv+7r+Xgr57ZMYdOOzF4L1nVL5hvWrGX5eXLry74SepcpY7VdeZ
 1o0aRVEKOPnC0lr98FzWEc3V3/Dy7vkkXWsnByJrWeaKnTkgRyMpo0Le/nMmm6Bo
 R0isIzNjIhaJqyoszy26lsqE4+jjRQGfCmKh8op4iCZ5WpOYUZOysHjhoxfwcbdw
 MPG0O1TsVzS7rOsR/hBA7ePOeIXR9dr6JcGSN+BbZSrQokqkDzTaMLWENU90H3Pw
 ==
X-ME-Sender: <xms:lLkHYFt4DbO0L0G8OIDTbUJ4pVitSuGE98-4nUUfEqc_Tb2FdIyANA>
 <xme:lLkHYOccuHw6bzEEjUJYk9ee2MiBssVeDLor_pZ2IR-7KauLqO9IU2GyP6JdP3K0j
 qQWVXaDWiSSre5aLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddugdejlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:lLkHYIwwsHKKIUcfSRZCkoBkP2SUUYHW6Tj7eEZs8lZJx7nPV605GQ>
 <xmx:lLkHYMPflY4bGbYYJBMiVwNMPPZblfeAUDykF_pmLV7eGf5QWzL2aQ>
 <xmx:lLkHYF884fp1v8o0Z9GLAahX8n5sGKkzaEMxheM5ZzTx37yyeUx7sw>
 <xmx:lbkHYIVtadAKc1vvus-yfsIG9MTiRwwjjblm5qMxxIi2lFyNIhNCMw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BBB6BA0005D; Wed, 20 Jan 2021 00:03:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-78-g36b56e88ef-fm-20210120.001-g36b56e88
Mime-Version: 1.0
Message-Id: <c8421730-f8a6-46a7-9e2c-9107eb979276@www.fastmail.com>
In-Reply-To: <20210114131622.8951-4-chiawei_wang@aspeedtech.com>
References: <20210114131622.8951-1-chiawei_wang@aspeedtech.com>
 <20210114131622.8951-4-chiawei_wang@aspeedtech.com>
Date: Wed, 20 Jan 2021 15:32:55 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
 "Rob Herring" <robh+dt@kernel.org>, "Lee Jones" <lee.jones@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Corey Minyard" <minyard@acm.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v5 3/5] ipmi: kcs: aspeed: Adapt to new LPC DTS layout
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
Cc: BMC-SW@aspeedtech.com, Cyril Bur <cyrilbur@gmail.com>,
 Haiyue Wang <haiyue.wang@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 14 Jan 2021, at 23:46, Chia-Wei, Wang wrote:
> Add check against LPC device v2 compatible string to
> ensure that the fixed device tree layout is adopted.
> The LPC register offsets are also fixed accordingly.
> 
> Signed-off-by: Chia-Wei, Wang <chiawei_wang@aspeedtech.com>
> Acked-by: Haiyue Wang <haiyue.wang@linux.intel.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
