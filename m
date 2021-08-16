Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5BB3ED991
	for <lists+openbmc@lfdr.de>; Mon, 16 Aug 2021 17:11:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpHgN3JyYz3bTW
	for <lists+openbmc@lfdr.de>; Tue, 17 Aug 2021 01:11:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=o88o/Drw;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=V2zaPAWt;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.18;
 helo=wnew4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=o88o/Drw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=V2zaPAWt; 
 dkim-atps=neutral
X-Greylist: delayed 391 seconds by postgrey-1.36 at boromir;
 Tue, 17 Aug 2021 01:11:00 AEST
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GpHfr3Bb4z2yxx
 for <openbmc@lists.ozlabs.org>; Tue, 17 Aug 2021 01:10:59 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 9A0C62B01256;
 Mon, 16 Aug 2021 11:04:23 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 16 Aug 2021 11:04:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=MCDMYbP7+CIk9Es8QjShX5kQ53
 liA5nVYQOOctu4VHQ=; b=o88o/DrwWQPOPKO6Dw/T23KJsots/Qzv8jRp9UPt6p
 lhin0OxFb4JrKt6njzwm/i8zSnsu9G8T2Mp/gWAgIb2H0e555qY7ZCSfqPFbKG5g
 gueo0NqhQcshZUdOrC6Nytax/1rtvWJOVxhFfpw4284+Iv930bcAAdjHMlF2GYd/
 2bXIkCWxUn/+6PumBu+7YQopO81jEIjBOULixa4XEX9OAHVSzbMQ7eSTIlC/+Knm
 fYv/18ki6bAODfSknG4Uo2wDMmzA0/HITv4NSwV8QqYJhWkfnVZMlzw9pifvROj7
 MP74Wr2Gl+gW6t6l8IzzRfSxGgjyo8GvkjGu928afG+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=MCDMYbP7+CIk9Es8QjShX5kQ53liA5nVYQOOctu4V
 HQ=; b=V2zaPAWtHJO2XumkY54lTDiuk6V/Zy6qNPOhtR34glHPpYHjm8WKLmzIT
 mKY0yBnReFJcLGmuQ+YAVoKNJbKZx8tvwwHgYNrDiU0E24KFgZ/reKFrMg4sAKv6
 vd+Ig3wkocHh2xtqhfR5bqN2rDctTwiecl0tevvHfcpMN62OS1Nd2nMb9jsumTlV
 z/X88KRhYIUds+oW4uHLEa0FdtlO03VtmU14wCua1wCU3XIQxSkdqLkl0F84SyMT
 6+oiaVUUZTHMvcZn0gEaEt6A3N9VV+LOvy8IW+j+FDXXKjoVLKQw9D2dK2JezjBL
 TKqDcwbDlUS7IhHbIvdhXMog6+oag==
X-ME-Sender: <xms:dX4aYSeWErpKCf_qsb5Yvbwu8-pMLBi67RFk2aJNGhcmPor_wy4ghw>
 <xme:dX4aYcMUu3Jxbmdi0Pixz2utcyI0GPcPkAL4mZ9naxpymQpSxPiZ_t_FxlsLdy_rG
 FSGpjx9dUSCwrPS_LQ>
X-ME-Received: <xmr:dX4aYThhcyNFwBJQDWmR8x3d75X-AivI837I0-4GluvIXkz_8j4RcQN0G_JysFIgDK1AGy4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledugdekfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepudejfeetkeegiefggeettdfgjeelleeutdehhfethfet
 udefkeeuieeifeefgfetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:dX4aYf8g_DWtZnCxedw9BkF6-u6GR7IGj4ukbjmoxeWGZvf3JOrPMA>
 <xmx:dX4aYevqVkteFFsxnCcGcm2uG9XYpTJZo_O8X7CYg0uAgJxvI7WLjg>
 <xmx:dX4aYWHEmwZTE6duPVMljYpV3SPO7SGnfI3lfiEqhQOjEip4XyLbvQ>
 <xmx:d34aYTWtMM8cm5ntXLYoYcFx-KMiebt_t4IkY7oWdr_SyaJ1NBC9CZQRlng>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Aug 2021 11:04:21 -0400 (EDT)
Message-ID: <3345a4efa688ea1bd92b17e76d89547791a9b742.camel@fuzziesquirrel.com>
Subject: Re: Requesting maintainer privilege on smbios-mdr repo
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Ren, Zhikui" <zhikui.ren@intel.com>, "Bills, Jason M"
 <jason.m.bills@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Mon, 16 Aug 2021 11:04:20 -0400
In-Reply-To: <DM6PR11MB44103299FE530EF7125E728194F89@DM6PR11MB4410.namprd11.prod.outlook.com>
References: <59d36746-4a19-025b-1a43-9ec2bde0307c@linux.intel.com>
 <056b270e73e030377e175b1a79f1aefb841d6780.camel@fuzziesquirrel.com>
 <d57f2680-e196-eb4b-bb80-5ba5f8a9d81c@linux.intel.com>
 <DM6PR11MB44103299FE530EF7125E728194F89@DM6PR11MB4410.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2021-08-11 at 15:57 +0000, Ren, Zhikui wrote:
> Brad, can you please add me to the OpenBMC organization first so that
> I can be added as smbios-mdr maintainer?
> Thanks! 

done!

