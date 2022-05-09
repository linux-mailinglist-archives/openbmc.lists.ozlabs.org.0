Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08446520014
	for <lists+openbmc@lfdr.de>; Mon,  9 May 2022 16:42:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxkQy6Lq9z3bf9
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 00:42:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=kqMiqEbS;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=lxr6LF1k;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=kqMiqEbS; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=lxr6LF1k; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxkQS65kKz3bY5
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 00:41:51 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id ED13832003D3;
 Mon,  9 May 2022 10:41:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 09 May 2022 10:41:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1652107307; x=1652193707; bh=rQoaX2zN+y
 vIEnz8OE1pmubPAPMDt9jiRPpYZwIgWqw=; b=kqMiqEbSYDp+3qS0+tCckdw/Fi
 nwvGUiOoGvLvTijTF5DcEE5vlhaeQm1PRHSRnGZDatNFdnQAiGndmQxpY3aAKD+4
 eClG5H6sWynrlOiDamad1UyvYIwq5udvYfldWb8/uW/t6OGCaVIzxtdQ+1FxVZDB
 WoGVUS9GXFbsI06TsGHGtZ3D6fJSXWUQ8Tu8yGZnLwF06IqwhYlloTNjogeK73rl
 mm5l56UcboCP7hKwikGHcod7LI1e8Y4uSt9AUjrXjeNM0OS86Gf8ArJVbGpvebnk
 eld3zhpR4zhVFIJWBqOK2YkxEEn32PbzIsoEWBRCeEK0XJWVMxIaTXOmNR0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1652107307; x=1652193707; bh=rQoaX2zN+yvIE
 nz8OE1pmubPAPMDt9jiRPpYZwIgWqw=; b=lxr6LF1kb0GDLAKP3Sh0jZWWBfRrE
 FsFsywcsDQz5LDGMpNPaPotZkYRyT8pvq+ovwMQ6wt430tFS8+c3ebyLhlDwBtS8
 0uZ2I0Whzxnku5VMRvIfsXeqzyd2+uAogQxw86f8e3V5JShvJsPeeM+swX3Riesm
 VuVL4puv97EGU91SMQcRJwx9uRAE4sTtkFFC0LsrpFOsGVThTn/7rPVMRfPH4fGT
 BVYUhirJ8fzadkDztGVN/dGIQFC30ZShAnvVxYQkj4DBoikoPE0jiVSrie5BrJ0M
 hUmJKnbpsSRlBeC7LLvC8jF9A4TYk29DhsaapDEkld6S08UfotM2KkTgQ==
X-ME-Sender: <xms:Kih5Yh9t2w6ty2EM20etWQconHUWycTEGposBGQ4gs0g9mvlQ_ln7g>
 <xme:Kih5YltsATqYD_rZfxnqKzldZnTUWNgXcD_mVI9APO8eZrvjq3saC2zpjrEhPh_D_
 aHZb6jpg2vezHKZ6bY>
X-ME-Received: <xmr:Kih5YvA8Ob966LvLD-3uYv5yjTZiua07V1t3DxHZlNR26ZCMwBmodEY2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelgdejlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggugfgjsehtke
 ertddttdejnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepvdeivedtve
 ejudeggfdugffggeetledvgfeijeduudeuveeghfeujeejudeiieeknecuffhomhgrihhn
 pehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:Kih5Ylf-QWqMBQB8VcK4oecgPG7yrK-1CoFqQ6iaNwauBlb697m8RA>
 <xmx:Kih5YmM5E6_A3DuXw72HcS-qot7V18T8DEWlD8qUBpkV8Z4gixeU2g>
 <xmx:Kih5Ynn96BJcne2vIk56GzW36YuOxGFxgD5yEk_rJ2aLQOFT3nd-gQ>
 <xmx:Kyh5Yjo5nNQvaUvOkfOOaxw_rKF2rP8UpbNwWD_idl6PDG-ooLxMUg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 May 2022 10:41:46 -0400 (EDT)
Date: Mon, 9 May 2022 10:41:44 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: =?utf-8?B?5oiQ5L+u5rK7?= <xzcheng@zd-tech.com.cn>
Subject: Re: New repo request: kunlun-ipmi-oem
Message-ID: <20220509144144.7nlz4gandqx7rfqy@cheese>
References: <AHcAiwCqIcaSxUw7ysgwraqT.1.1652067491174.Hmail.xzcheng@zd-tech.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AHcAiwCqIcaSxUw7ysgwraqT.1.1652067491174.Hmail.xzcheng@zd-tech.com.cn>
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
Cc: openbmc@lists.ozlabs.org, =?utf-8?B?55m955Co?= <kbai@zd-tech.com.cn>,
 =?utf-8?B?546L5Lqa5rSy?= <yzwang@zd-tech.com.cn>,
 =?utf-8?B?6ZmI5bCP5pil?= <xcchen@zd-tech.com.cn>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 09, 2022 at 11:38:11AM +0800, 成修治 wrote:
>Hi Brad ,
>   Would you like to help me to create a new repo kunlun-ipmi-oem for kunlun oem IPMI command handling?

Hello Xiuzhi

Can you open an issue with your new repository request here:

https://github.com/openbmc/technical-oversight-forum/issues

Here is an example of a previous new repository request issue:

https://github.com/openbmc/technical-oversight-forum/issues/14

>
>
>And please add
>  kbai@zd-tech.com.cn
>to my company's CCLA

Apologies but I cannot add new developers to your CCLA.  That must be 
done by someone already listed your CCLA, and they must be denoted as a 
CLA Manager.  Please have someone like that send an updated Schedule A, 
and I will review it and upload it to the Google drive where we store 
CCLAs.

Thanks - Brad
