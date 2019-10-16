Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65307DA20B
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 01:19:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tpCx56CYzDr7p
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 10:19:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="aVusOTQV"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ic6ileUk"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tpCK6MgVzDr6P
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 10:19:09 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 730D8143F;
 Wed, 16 Oct 2019 19:19:07 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Wed, 16 Oct 2019 19:19:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=xhPIzuCsg8IGWM/RZe0FSyBmzfpwH/N
 A0bOnk1dgpv4=; b=aVusOTQVz5FYVBIujBPPk73QX4su/fTwiZ880Lrhvm+G1I8
 P+zdpB4uAXRxWGQvgnnCbiYy2i8bqjfneVXFGcntsHEXMAjV/NkfzErTVkuwECvX
 IKGpEn8Q1nACILMpYbsr5lUsodyGbhXlO7s4Dw9XhoxAooIpW+f+2m4gFDsXhp2n
 XjHcErJVSH2Qoyd3EAV2BTI9mCqhMkg7reOhNmRWT7ShWIwllRncAGe2EflzdXpq
 DQNDLY4FcGllssOxZ46eeujDo7psWlmSeK3tRKEIhJIUovdKVYB6BVVrQf7ur7AN
 7oXdj2D7NY5gbwZ5WCwktYZ98YLK3PvKLkbdauw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=xhPIzu
 Csg8IGWM/RZe0FSyBmzfpwH/NA0bOnk1dgpv4=; b=ic6ileUkWQPG5TqEDJuWr5
 I1x85orBAqwpY+ArkRY3lOVJpAK0evQYipbMzwk0841MGRx6/f0RsP5lbiCLDDY9
 cjChr27HXWKpeqk8QJqQ9dvUoqJ+0LNoGcqXxLq3FqOknxIjA6zK8YIpj/a24Arc
 YM+d4qMWluzpUfNdSjtISWDcTNeIidrtKVFGl49NPOvXLozEavvddftKdU+I4fJf
 t7wxIHSHjcWigumw51UE1sNsu7c3SbbbQ8nEz4oNb7UwGVIYgoJsxiyRsBNMtBVA
 hbcyW6/zTxYtsSb2Et/X9SuwnDoc56CrLZukwZfqHbQWUS7KPPllikFlxAH8nOJQ
 ==
X-ME-Sender: <xms:aqWnXW9_HuZKJjpXx9LiFhgpvcR7V7fEAyBruMIlA5wK_PjnSx-m1A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjeeigddukecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:aqWnXYvCauGX4Go0jciHmBMYiT0qHJbz_n_bgD_dzZjRe1qeGwrY0w>
 <xmx:aqWnXU0OloicksXeVM1WiLTfbeXmaCIvY4HIt6b1T13HzE9XIZe1iw>
 <xmx:aqWnXWWxkq_ArKE3PqMMlRTTFDjQY2z0zENpIHDfsh1jxp89q01Jkw>
 <xmx:a6WnXTGe6Cwnt3tr0EIizRhba9VgOV7G1dUSOuwiS8i8c-12nOvBpA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id F34F5E00A5; Wed, 16 Oct 2019 19:19:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-360-g7dda896-fmstable-20191004v2
Mime-Version: 1.0
Message-Id: <6ed83860-c187-4da8-9f2d-17deef391dae@www.fastmail.com>
In-Reply-To: <CABoTLcSgz-_LJ3tZ70-WenCqWqv3Kknfsbe1qstKmoTiP2wqQA@mail.gmail.com>
References: <33bfd87f4c3345d28be4e8c1d64f1437@SCL-EXCHMB-13.phoenix.com>
 <CABoTLcSgz-_LJ3tZ70-WenCqWqv3Kknfsbe1qstKmoTiP2wqQA@mail.gmail.com>
Date: Thu, 17 Oct 2019 09:50:02 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Oskar Senft" <osk@google.com>,
 "Bruce Mitchell" <Bruce_Mitchell@phoenix.com>
Subject: =?UTF-8?Q?Re:_Recommendations_for_development_platforms_for_the_ASPEED_A?=
 =?UTF-8?Q?ST2500_&_AST2600=3F?=
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 17 Oct 2019, at 02:14, Oskar Senft wrote:
> Hi Bruce
> 
> I've had good experience with the TYAN S7106. We still need to upstream 
> the DTS for the board, though (sorry, upstreaming is hard).

How can we help with upstreaming your changes? Its better that they're there
than out of tree / inaccessible to others.

Andrew
