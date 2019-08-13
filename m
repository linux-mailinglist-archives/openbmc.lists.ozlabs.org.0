Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3638ADEF
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 06:41:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4670RX6KPjzDqNt
	for <lists+openbmc@lfdr.de>; Tue, 13 Aug 2019 14:41:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VQRBAf9O"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="YgKyQDAj"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4670PQ4nMLzDqRs
 for <openbmc@lists.ozlabs.org>; Tue, 13 Aug 2019 14:39:54 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E5EB321FA7;
 Tue, 13 Aug 2019 00:39:51 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 13 Aug 2019 00:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=NV/KKBOI2Sq8UN21nABYejq/B2QCeHp
 IVi/bDfKa/is=; b=VQRBAf9OhKz0Sir6A/t0WIvZN/4E9DIrgn5vqdbVzYs225y
 fuSl6oYbjOwBxK6DF1KicNz/uvfpH0FK87OzogXb7o1HTOdYbGPdDsCQMqPYWMGx
 6th50DMCFOnnKvXJL+UTO7pPRsnJRAQUqYWIHJFJ/wR+bNPyl6YKnZPs1esRejY3
 CDqF+J6tjrqrVbbLoglmycS1PUaeIGDYyD5zbWSSCnojqSdnY1O/pfMBR643sx6R
 fNt9ANPXP014Ccl+IdAJEI7HKHAA3cPy6NaLD8zyw+s99U2E10X15tg4mM+CYIUy
 wWUE/BX1f8EPau0iUPdShgQRJfD0JoPaqyNDe/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NV/KKB
 OI2Sq8UN21nABYejq/B2QCeHpIVi/bDfKa/is=; b=YgKyQDAjV2GZricEQBeVMz
 yvOTCTb9e0iwN3U1aNclodmPL39f6XS4rRUMlJx/MzLHEBuegRfQl9W9aq5b01gd
 7IZ9vMchmaFPYWxtDdkFJ6L9glZyzWqdT/MJ9g7GtoaHbNYOekW6L/d38yJjKBjo
 47RzIRAZyOJFA/Iu9nY3sMgKVpfNdev8y5WgYmEnNVi3OPd+PDew5xVIjkez/IEU
 MpZByqU4r5IjLlCTXkx5XjkmdXbA1VP2uCYZGddM+36dARblAPiM8o93uMfnBXHx
 1xlIZui8jo2/6S/51ut6MfHkDRPumCDGFvbt8OAIQPBU3VzYzuU/QU3fLb1c0wNg
 ==
X-ME-Sender: <xms:Fj9SXbHx6HaO07-AdjFDglxNSFnFgOsP2QuZ83iGbt5tEJ_vnDPm7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddvhedgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgepud
X-ME-Proxy: <xmx:Fj9SXYZPAKVkKvPj3DPsx-PeI5EOjrJA5PDRqwYnetrVKJeGCj7Yjw>
 <xmx:Fj9SXdoS7bXtBvH_dumoCL-viFq53dEKC5KeoRRizO4KIxQ5nYEuBw>
 <xmx:Fj9SXfyb8CEDypEY7ElCrzXZfTpu2mMc7lxQIZF_ZAU-oneOd4DoXg>
 <xmx:Fz9SXf4L5doF5o-MKa6niyRnt-KrHQe4t02uxGVAPAYtIGqDRPlR5Q>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 71557E00A2; Tue, 13 Aug 2019 00:39:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-864-ga937f03-fmstable-20190813v1
Mime-Version: 1.0
Message-Id: <7161921b-70d1-4dbd-9bf3-39d67f95a823@www.fastmail.com>
In-Reply-To: <20190812111307.22321-1-Ben_Pai@wistron.com>
References: <20190812111307.22321-1-Ben_Pai@wistron.com>
Date: Tue, 13 Aug 2019 14:10:19 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ben Pai" <Ben_Pai@wistron.com>, openbmc@lists.ozlabs.org,
 "Joel Stanley" <joel@jms.id.au>
Subject: Re: [PATCH linux dev-5.2] ARM: dts: aspeed: Add Mihawk BMC platform
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
Cc: Alvin Wang <wangat@tw.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 12 Aug 2019, at 20:43, Ben Pai wrote:
> The Mihawk BMC is an ASPEED ast2500 based BMC that is part of an
> OpenPower Power9 server.
> 
> Signed-off-by: Ben Pai <Ben_Pai@wistron.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
