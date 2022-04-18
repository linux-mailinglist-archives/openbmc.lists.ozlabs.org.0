Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B6A5051EE
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 14:42:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhmmC41Bxz2yn1
	for <lists+openbmc@lfdr.de>; Mon, 18 Apr 2022 22:42:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=Ry5NT4II;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=IP7Ie+b5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm2 header.b=Ry5NT4II; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=IP7Ie+b5; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Khmlk0CCNz2yZc
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2022 22:41:52 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E602B5C00F0;
 Mon, 18 Apr 2022 08:41:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 18 Apr 2022 08:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1650285707; x=
 1650372107; bh=+zc9OHdJU3G08M37tYifOBHJ7dV9ixtCId6LQp3HROI=; b=R
 y5NT4IIjGEWiEGDZv6b5fYdeDM6GoMMCEWQR1MG/ZUCwlTSAOgPZmqu9x4SfTk4g
 3GJ38D4Ws7uqHWvsG8bn5IPfL0hq1atjGn/tbYvTnhR9Int0d5uBIcwRa8kZ9cre
 GrQAzR1aF8HnZ1DOUqM0bYIpTPO8naZaH5+tZnXiUrPAIscK1orOH+8ojq58S+e8
 pcijV2CZkU9jOxzpDECREXeaZW4g/Vwn4LxrXuvHRY6oxESRzkKeO7G2NqwlIaSE
 wq/wFr/13LZpdYmyXR7zvj/D8vf7n7VTztw3+Ofn/Kcpqe23bVwIrjE93JwXqpX7
 xpxw1CIpqo3ouZtkjEYKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650285707; x=
 1650372107; bh=+zc9OHdJU3G08M37tYifOBHJ7dV9ixtCId6LQp3HROI=; b=I
 P7Ie+b50tuP46gLfIDWoKAe33HTSo9gu9vpPqNXrS963YFNKiUQyFRC0HcKyB7z/
 sv8WWYBi1jeJAfDhsKxlV3nLjVf3zdAZcTCk7hRi5Zw7q/XeE+xQ8jkYAANCpGUf
 OpeZTXIBgMCwJEQZm5dlDlHDsKt4ftTHzfVrEUbQ3NBmisyJaeoDyFZ6gPuvRtvP
 kgTcdXwYDFkwAIh7MBm//gAbnarHQ1LDyx4i76pVNLv9hIJFBcz+YiBxqBHQqMKZ
 RWaetOGCDyvrSRXGew5inBeZoqn1UJwsRVSscMIvx+ASBPVa0rjqPmAc45S1nFV5
 v9YyRTJLjLF3gn+8DlNGw==
X-ME-Sender: <xms:i1xdYvH8uu0ERmxCpnoK4L9J8S2zAyQDLlgbeYhPoUFBYFevyvY2zw>
 <xme:i1xdYsVUAKz9QP_Z5GkhC9-hyDE5N026oSwBUUXDpa57MLubW5gM6aYI_XgvxRxIy
 Pe2XcnnPa-nQhZ7sj4>
X-ME-Received: <xmr:i1xdYhJuSXt_hwRaLIXAUcRq4YjUnvp0t53cgJqdMl8VlJ7auNIwO1m6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtuddgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepfeffhfefheeguddtvddtueeihfduieefkeefieefkeef
 udefueevudelgfekffefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:i1xdYtF1o9A8pWsrBKx42BF0hEeEvCQGjmth27fuGrSq8VrIMe3w1g>
 <xmx:i1xdYlW0YshxfP-ZxtirDB4rUmmfj86KP1Pb4beoqfmcwT2G5Cihdg>
 <xmx:i1xdYoPCTXVAAKNq-bxSxcmD3h8NZNT5omNlpPVTFjjRQyVDP9lKAA>
 <xmx:i1xdYmd7u752TZEgHV2CfcuDtvVHnCzvM-vokCBgN7dnpUzIG9gb3w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Apr 2022 08:41:46 -0400 (EDT)
Date: Mon, 18 Apr 2022 08:41:45 -0400
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Edward Chen (TRK)" <Edward_Chen@jabil.com>
Subject: Re: Signed OpenBMC CCLA from JABIL
Message-ID: <20220418124145.vn2ly3okgtuk54vq@cheese>
References: <DM6PR02MB527414D4F123D6FCF3A5B37B87E69@DM6PR02MB5274.namprd02.prod.outlook.com>
 <DM6PR02MB5274AE1CA4CFD952D49F39B287EF9@DM6PR02MB5274.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <DM6PR02MB5274AE1CA4CFD952D49F39B287EF9@DM6PR02MB5274.namprd02.prod.outlook.com>
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

On Thu, Apr 14, 2022 at 07:42:23AM +0000, Edward Chen (TRK) wrote:
>Hi Sir,
>Our company, Jabil, is ready to join and contribute to the OpenBMC.
>Please find the signed CCLA from Jabil for your approval.

Welcome Jabil.  CCLA accepted.

Thanks,
Brad
