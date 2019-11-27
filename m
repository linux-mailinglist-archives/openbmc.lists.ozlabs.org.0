Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB36910C089
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2019 00:16:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Nc8v1y7GzDqfK
	for <lists+openbmc@lfdr.de>; Thu, 28 Nov 2019 10:16:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="rWOpX8dv"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="WXMh9Sl5"; dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Nc861VJJzDq7j
 for <openbmc@lists.ozlabs.org>; Thu, 28 Nov 2019 10:15:50 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D4C3E226AE;
 Wed, 27 Nov 2019 18:15:47 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 27 Nov 2019 18:15:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=s2WeLIYP4Gt1ABeOi3tSQhzWsm/Lnga
 cGliEc/Hw1QE=; b=rWOpX8dvcjptBqMuzUPQqE4T0NgM+vC0dj1bq26X7Ej4rfU
 oI7Pv8TrWP3T/howYshtltzDZyncOd+keWe0X0rf5RKNW0XisRPYWD311fzek7Rt
 TiomlTjhtRsbhxTyDOx11kStQZ0KA/ZjnFKUAK4FGM9CbuY+njr5jAFF6/rTaMKY
 Ys07cH6qTwewWh76YplAd22l22vB3lNaFgZUuRv4zLn+WugeSa0CX9r71kxLJ8w3
 JpOQbJq3h/aLHMmzEYhQRHxSo+qZIigjokuP+gcF9BxnISJFhNGfP7b0NEyx4dZq
 wA70UZJv9cEgGstuhxWvyzaXfjOIZ4+knyQ99tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=s2WeLI
 YP4Gt1ABeOi3tSQhzWsm/LngacGliEc/Hw1QE=; b=WXMh9Sl5QWQLtKkZvwmTeG
 AGNPDcQvM9EF7cW1X9JENAoevt+/YigGyI6bBdvayALa/6jg5wwhLo1f5mYGSagq
 eTVO7ybyRSVNIiGdmE3sfAc1UHQ60gGyC9pJiU3UJecou/vhB7er701eI0KDsJ13
 URscFDbokqNP4H+SH8A0Xykt5XZ3jQ4BO4La9uRfDTh31eGRSmw+oY5nOt/QRykc
 Uxll84+1w/GUEuZpsljvs902G2frCeQ2kEYxBGASJZoAYhmsUOO2XFZ4vdgTcLei
 NaAdq3uIW/NbKUw9lXeLqa7X8qus8SRXhQFkJwenJ7AMotS0j04Chm8/G+SYOnzQ
 ==
X-ME-Sender: <xms:owPfXbEOlTOLVcOL1hwBa8yINprkua0bkX9KA_FD4mvSt3Zpzwf89Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeiiedgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:owPfXdif3lG_vKpuYO17pKGJwxxW75MfLAk2Mbz0qCA2Six6VbFBWg>
 <xmx:owPfXdv10iUpGqDDmJTTr8zFe4rQmCfjHQM16HX-37TtFIkTeAReqQ>
 <xmx:owPfXT9oCwDQOGWxjQG3bFD6RZVkd6rxRGmnfZPdQ6e3sdOleyrhxw>
 <xmx:owPfXXzT93b48iuZYM3ECyWjTu399tUfxB1imG5RFBta160t8nNDLg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id DD897E00A3; Wed, 27 Nov 2019 18:15:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <b047f771-0e24-4660-9ef6-abd3af63bc86@www.fastmail.com>
In-Reply-To: <1aa6a722.1f0b.16ea53900bf.Coremail.ouyangxuan10@163.com>
References: <1b4dacbd.8278.16e6e6c2234.Coremail.ouyangxuan10@163.com>
 <a06a7845-cf16-4e37-8674-acd0950d6245@www.fastmail.com>
 <42def251.79a4.16e87d7a3a7.Coremail.ouyangxuan10@163.com>
 <e4d8ad9b-49cf-4942-a64c-0c47a94efa17@www.fastmail.com>
 <348aed94.42d2.16e915b4531.Coremail.ouyangxuan10@163.com>
 <839a25fc-1244-4c96-b3ed-6a2c04445736@www.fastmail.com>
 <5d3da051.585b.16e91e043b7.Coremail.ouyangxuan10@163.com>
 <eed376e8-445f-4a2f-8184-de2c3800f953@www.fastmail.com>
 <1aa6a722.1f0b.16ea53900bf.Coremail.ouyangxuan10@163.com>
Date: Thu, 28 Nov 2019 09:47:17 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: www <ouyangxuan10@163.com>
Subject: =?UTF-8?Q?Re:_[openbmc-kernel]:_How_to_make_pinctrl_not_affect_pass-thro?=
 =?UTF-8?Q?ugh_function=3F?=
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
Cc: openbmc@lists.ozlabs.org, Ryan Chen <ryan_chen@aspeedtech.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Tue, 26 Nov 2019, at 11:30, www wrote:
> hi Andrew,
> 
> This suggestion is my personal imperfect idea. It's also the easiest 
> way to do it. It may not match the requirements of the kernel 
> organization, and it may be necessary to find a more perfect method.
> 

Right, if you're going to do it as an out-of-tree hack then there's nothing
I can do to prevent you :)

I'd prefer to stick to discussing solutions we can upstream.

Cheers,

Andrew
