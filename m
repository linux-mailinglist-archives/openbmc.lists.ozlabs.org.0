Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 074DA4A5EF4
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 16:04:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp7WY6RG5z3bTZ
	for <lists+openbmc@lfdr.de>; Wed,  2 Feb 2022 02:04:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=oEn4zEDd;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Jflft9Cr;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=oEn4zEDd; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Jflft9Cr; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp7W71RWxz2x9N
 for <openbmc@lists.ozlabs.org>; Wed,  2 Feb 2022 02:04:19 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 9AF213200EE0;
 Tue,  1 Feb 2022 10:04:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 01 Feb 2022 10:04:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to;
 s=fm1; bh=ySUCO41qmJ8aHmpw383QPrjHHJTUAkalSbth1BB/uBw=; b=oEn4z
 EDd78E2hY20XkpwGpSJi/7FgtwQo96IbEioTq49IUnV6xib0cck2g1bcnxNPDq8b
 nbAyBR6E30kEv5AT867c22f3VEzzwm2ZCYZIsT5QprFVqCTSWBx234i5gOPJcoIz
 wZJpFgdwuW6zm7typ5p/fL7Mo4MSeedjRHAP0X0xy0KI6E3erR75JrFZNp45T7q6
 s68A5D3YRCNrE2ucWLyYkXMNNXzQUCpCuWoFaxaCXAeXkUoCZFdEOZzVzhuZw3C4
 cRg9PpcsRWO8DHVvw5/iERIztBQXpyqlh0c9vCUWmmioBUere/V2APIUCZPtrlGK
 naB2zkif/Xrtcxzyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ySUCO41qmJ8aHmpw383QPrjHHJTUAkalSbth1BB/uBw=; b=Jflft9Cr
 d6V5EKzekOi6DIByE7AiVbm5Qpqx+d2yvNRZ75PbYDG4kR0YJbydFGmD8mg0fniQ
 Y842uC3653Df+/+8Xkb9W6QDxq8GcCh40jqCJ9vMgW0TVuxD6+Ow5WFvPkAOGROO
 vo0pbY78Dt1/HOYx793xapfRElOHFtNhStUKSvmlHPuoPWHbCSeWdc+ATrMS6icr
 8sQj7VfBUf0FjlxOFS35e60FZHU6aLX4W6VpH6ODs4VGhYl01hDXQyWfE3YF7iuL
 YLw7qRFfKPEVbJplOV1Y1VJBlzFPlZ5i1Fgnu1e+v1mLaZET186remTezci38fMZ
 Fhd3n8baJ/WQ0g==
X-ME-Sender: <xms:7Uv5YeiNyWK2STUe6MnTVS29LCjAw5Eo1AMiMCnbuWWwBoV98nbK9g>
 <xme:7Uv5YfD3JW_yTp5mQF3semlO0w0f1op5VVJUjX6idmA-e9I23G_sefsU4Xb22SYFP
 92Vnl6F76A5sLSseQA>
X-ME-Received: <xmr:7Uv5YWGJjBg9-X0ABeuC7D_DvO0X4barRkpoigtQ3K0K9oL3wqZUPDV7PCModZqBLGdXlz4CnSxSFYRVSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeefgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkuffhvfffjghftggfggfgsehtkeertddtreejnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepuddvveehhfdvgfdvheeikeeliefgudegledtffevvdeu
 ieffjeduudffudefieehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:7Uv5YXQQk7-ty4mho3f1Q8jOrzPMVvDUPeYxvWFMg9h5lOX_q-Yq0A>
 <xmx:7Uv5Ybz9mbFftqWkCfTVaQ6LnJMJGpj91eH5CVkVSepjhGQjVHnq7w>
 <xmx:7Uv5YV6NvmoiF1hqaJNwVr4lzLZUx308mEh2c9lypOUvJmYRPaoGuw>
 <xmx:7kv5YZYRw7Vpz0xe3xSPSTOxwweBr21RTsJfa5_QmR19n3up9W3ZrQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Feb 2022 10:04:13 -0500 (EST)
Message-ID: <916ce38b21f52c51d30634c01175fa90d0515419.camel@fuzziesquirrel.com>
Subject: Re: Quanta's CCLA Schedule A update 2022-01-22
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Buddy Huang =?UTF-8?Q?=28=E9=BB=83=E5=A4=A9=E9=B4=BB=29?=
 <Buddy.Huang@quantatw.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Tue, 01 Feb 2022 10:04:12 -0500
In-Reply-To: <HK0PR04MB256395E4EF916D9CECD967779D5E9@HK0PR04MB2563.apcprd04.prod.outlook.com>
References: <HK0PR04MB256395E4EF916D9CECD967779D5E9@HK0PR04MB2563.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2022-01-24 at 06:01 +0000, Buddy Huang (黃天鴻) wrote:
> Hi team,
> 
> Please find the attached file for updated Schedule A of CCLA from
> Quanta.
> This file is also upload to shared folder.

Hi Buddy, thank you for maintaining the Quanta CCLA!

-brad
