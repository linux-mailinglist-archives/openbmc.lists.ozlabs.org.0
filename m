Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 152A32F3C7B
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 23:56:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFmCP0BSYzDrQV
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 09:56:17 +1100 (AEDT)
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
 header.s=fm1 header.b=WQi8407Q; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=pdBSq2iK; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFm9L4rXdzDqv5
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 09:54:30 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E72E71704;
 Tue, 12 Jan 2021 17:54:27 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 12 Jan 2021 17:54:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=by3TC76jtoRdqvvB32C3AvXJSvecVLD
 6DLvTF4YcM+o=; b=WQi8407Qc8OkRtY8M/AyuHm39F5y/MKkdEXyyKPPhZ6Spp6
 mcUjJmw3NfGvxqzl9fahifGTJJDIyY4pFcpXKr755dS9Gpgb3+Eaa07Rfokwy4zI
 AD900WD3VUuv+wtyn7YTsO+I+RiQnSd4k7fvL+TdqZMW0I9d1kMAlRC35QlEc6zH
 RVBBV0IxYwSmKPudRFvjJCfH5GP5Be6mVfnThvLLWeeT93m+HZp/n3TyL/7YAuMd
 w+z3rEeXziZpmyUu39LWnXNLWonaJg08hChkU93/+UTfHFfm5jchrs0bscb1eyxX
 TFgK9QNXvQk4C9PTao2XRyu4OIsjZjHKP9maJ8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=by3TC7
 6jtoRdqvvB32C3AvXJSvecVLD6DLvTF4YcM+o=; b=pdBSq2iKs3eiYwvEKwqLBb
 Vg0h6IIf1LI7rNbbNNssRCXZ1+EiEM0uQT4mvxphTeMyPBliU1JF2dlH4g0Drqh8
 oyhdNMxwzskzIAED7K0xzbykBKE8MpRwq3aDc3X8jhD8v+uiuWM/QrIy7WXJqlQY
 7jAtfj3MniSsP7DKAadrV89s5238VFsLNZj7CHf4vpfD5YM8oR5G4n9RiSsQ1wVt
 Cf49avDI6K/H8q+MP6WP/veIiZOYF0N/n8QCP3cr7hJ3ooJMUKc9gVgZbU1DvgrG
 gZCbK4dWZlF7jIEsadUsHkfJJhPia7htGED+hoijFZaRvStrs/NnxJ+sS1noZPZA
 ==
X-ME-Sender: <xms:oyj-X6-BjN2d4IFZFlCSxtEQvJ5kysc7w1_q9uydssHURQEJhjSdYw>
 <xme:oyj-X6uNoChxz6IHUb1WPu4qfKsSH30pVNShS9wtB99Rd6u3g5u1S-S2vOY88cV_6
 FwMZBEjhYfs-eDpGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeelkefgffekteejhfdtfffgveejvedvvdevgeduudffuddukefhhfekvefg
 iedtffenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:oyj-XwBMqGbAFvgDbYT44B0aDmNt7VknlP0CMRZDGuye_DFbhrLWAw>
 <xmx:oyj-XyfI0z5wiLL7RrU7mPiLfRWnGK9Cp5Z67I68w86oU4uTFrQhvw>
 <xmx:oyj-X_MGN5i3TmjCM4Z2Fe2wCRyHZZqZ55hm6YG4-Gh4eoloyV0lWg>
 <xmx:oyj-X-aqKhO5f3MyGS2RUvzwxCNnbza-HsVVG9i-DXWXk7USrdiaew>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 03D63E00D4; Tue, 12 Jan 2021 17:54:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-45-g4839256-fm-20210104.001-g48392560
Mime-Version: 1.0
Message-Id: <810c6160-b75f-4b89-b482-28664ac775f0@www.fastmail.com>
In-Reply-To: <9E1C7198-6C02-4A72-BE5C-5CF05AF2E9BB@gmail.com>
References: <9E1C7198-6C02-4A72-BE5C-5CF05AF2E9BB@gmail.com>
Date: Wed, 13 Jan 2021 09:24:06 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Mike Jones" <proclivis@gmail.com>,
 "OpenBMC Maillist" <openbmc@lists.ozlabs.org>
Subject: Re: READ_EIN/READ_EOUT
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



On Tue, 12 Jan 2021, at 08:18, Mike Jones wrote:
> Within the PMBus standard are two commands for energy: READ_EIN, READ_EOUT.
> 
> These commands exist on both regulators and hot swap devices.
> 
> - Are these functions getting used?
>  -And if so, to what purpose, examples of where to look in the layers 
> for the usage, and any other helpful pointers

In theory you should only need to look in the kernel, but we also have a 
userspace project that is implementing a pmbus subsystem in userspace (which is 
unfortunate):

https://github.com/openbmc/phosphor-power

Andrew
