Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 241F940D9EA
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 14:27:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9GYp0GSQz2yQ9
	for <lists+openbmc@lfdr.de>; Thu, 16 Sep 2021 22:27:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=j5UUsdtT;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=XlOmq404;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=j5UUsdtT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=XlOmq404; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9GYJ5Kqkz2xvV
 for <openbmc@lists.ozlabs.org>; Thu, 16 Sep 2021 22:26:59 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D85D5C025B;
 Thu, 16 Sep 2021 08:26:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 16 Sep 2021 08:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm3; bh=1IL
 yBOoPs5+3FZdzzoGKDWUwFNm6w7r1aFFz6xOwF60=; b=j5UUsdtTxCohn0aiUij
 Ndx9TSzxJX9AQp6/7mB3tVTqMEo1wZ/ZxwsSSQsJZiYnB73nwLvAYyCWz7H3Yuq/
 JvNlRgJ9tWAHvWkFLdHrpvWlKf0TEtHamZEZ1FhC2JPAVlzxM8byJ+4StQyvKpyn
 pGJbGXE1edt+a+ZDJ6xlVPdNrqa7JfBVNl7ySZ60ZNsbZDyLe3TU9si+F91XbJaR
 cS8C+0udBF2HscRNtsZMygTIYf2ZlkbnXdBO1VaC8eDw8k77/Qt0Z4KrAU8qGf1Y
 3IwG3GvZWh+UuV3avwdIFrSE4A679AfQFxvDZaBxOALPAIWBGGv8ac+ewVFmYl9r
 aDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1ILyBO
 oPs5+3FZdzzoGKDWUwFNm6w7r1aFFz6xOwF60=; b=XlOmq404mYTWxhMfNNqRUl
 NwtOBXYvDi6Oty5FYLgPfHNLm4XXj/W7lw1oOvyIL1r1rdtMh0IZu/DMfNhp4GVk
 90YY19ffLIgt3+EAnNsbH1DjpUdKeAj+Q2IjRQ7JwAiLjCqEZCu3KYk69P4lqjKo
 2E9BJ1Lzskid/KIOu3E4gfoz0eTRQ8QbbH9xOjlQMvmuxBctjW22iFCwTXKorFnw
 HXweykoI6YcYrIwRtctIf3d9rrd7ileoZDQN+xQE2/tQ1GIDd2/V0et0GBQMmNiq
 cEBRMOIaFJJbnsHfLf6HOrikzkDWG4W6KfgIJY9L7BX2PLnGU6m2/LAqbli7WSNg
 ==
X-ME-Sender: <xms:DThDYbsF7rC-1P14vuL5XmtuiXMdnwLtTks4MHuNoq2-0obdQOy0TA>
 <xme:DThDYceO2OgO0qDcU82WBCDQkTCLYej7TxYl_00_LbA_6V-kyPy3rKJ9kHZt4T31O
 EnHlFkoZ4HcWLOIP1E>
X-ME-Received: <xmr:DThDYezsT913BngJ_d9foJz9gKqG3JOTVGpBEpFScCVoostX_P41WD2X>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgedggeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:DjhDYaNUV2CIiNP3wBWZT9QgIDMGcql7QxVKSBNgc1qzMj3bUoEtXQ>
 <xmx:DjhDYb8_wRf-CBpnzwl7_A3LDp_8moVir6oT44dFhgQJ1f1Eq6IMNw>
 <xmx:DjhDYaVaiKOIjbcX9fFj0AdV-VzoZAg3ob_n_Cnmp1m1FXlYtB1iJA>
 <xmx:DjhDYVkxuTxpSPx7ygmsBQ8Kw0dzKuZ3GzSbs3AsJZ_kh9xkVkh3QQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Sep 2021 08:26:53 -0400 (EDT)
Date: Thu, 16 Sep 2021 08:26:52 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: George Liu <liuxiwei1013@gmail.com>
Subject: Re: Question regarding phosphor-dbus-monitor repo
Message-ID: <20210916122652.qi553jxvvvhtnkdn@cheese>
References: <CANFuQ7BWedK3LNh4vy8uVN3Jk8GaG-GJ1BwMHDzpTv+kgzxc+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CANFuQ7BWedK3LNh4vy8uVN3Jk8GaG-GJ1BwMHDzpTv+kgzxc+Q@mail.gmail.com>
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
Cc: Devender Rao <devenrao@in.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi George

On Thu, Sep 16, 2021 at 03:24:09PM +0800, George Liu wrote:

>The current default configuration has the realization of `OCC` 
Hm.  That probably shouldn't be in the default configuration.

>1. Today the architecture of openBmc is gradually discarding YAML
>files right (because I think it requires templates and py paarsing to
>support).

And because this technique has proven to make it difficult to support 
multiple configurations or combinations of hardware in a single image.
For example, supporting two different revisions of the same board with 
minor differences.

>2. I think we can migrate the functions of this repo to the
>corresponding repo

Sounds fine on the surface.  Personally, I would like to see any and all 
configuration moved to entity manager, so it is all in the same place.  
Some system integrators are not software developers and do not want to 
hunt for configuration spread across different repositories or bitbake 
metadata layers.  But the community is split on this - there is a 
concern with making every application have a dependency on 
entity-manager, which is an understandable concern.

>I suspect that the original design idea was to aggregate all D-Bus 
>monitoring into this repo

Sort of.  The intent of the code was to provide a way to implement a 
wide variety of highly specific policy.  For example: shut down the 
system when more than 4 processor cores are hotter than 100 degrees C if 
the chassis is water cooled.  Policy that has broad applicability would 
be implemented closer to the application - so it wasn't really meant to 
aggregate _all_ policy in the system.  Just the really esoteric stuff.  
In hindsight, I think it is too abstract and enables too much 
logic implemented with data.

>4. At present, most repos use D-Bus to monitor certain attributes,
>objectPaths, etc, but they have not done YAML file adaptation in this
>repo, but implemented in their respective repos (eg: PLDM,
>phosphor-led-manager).

For the led applications, again, I would like to see those get their 
configuration from entity-manager.  I don't think PLDM should have any 
configuration files at all.

>So, my thoughts is: If we transplant `OCC` & `snmp` and other
>functions to their respective repos one day in the future, can this
>repo be discarded?

Sure - my long term goal for IBM systems anyway is to not be using this 
application.  If noone else in the OpenBMC community is using it - sure 
we could discard it entirely.

-brad
