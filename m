Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 619124E4BC1
	for <lists+openbmc@lfdr.de>; Wed, 23 Mar 2022 05:06:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNZXW1QP1z2ywJ
	for <lists+openbmc@lfdr.de>; Wed, 23 Mar 2022 15:06:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=ETZzIt/h;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EI0GGGnD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=ETZzIt/h; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=EI0GGGnD; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNZX16KfDz2xTq
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2022 15:05:36 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 5AC905C02B8;
 Wed, 23 Mar 2022 00:05:32 -0400 (EDT)
Received: from imap49 ([10.202.2.99])
 by compute5.internal (MEProxy); Wed, 23 Mar 2022 00:05:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=Np+QyQI1uB3q+4T6pTmdJJkKnx9ws99Vdj30jB
 4IYvo=; b=ETZzIt/h0CjpGv3gtVmR4hsA/l444IZCjMavnx9DhRyHdpWLIbutCr
 /n2y7AvgCtL8y5pSXFUIPuqf4lVdFH3cSOA6TTaMMahXL1gkILvtRP5k+W7GTWp+
 rfyv9D6KlCklEu1edYArJsE/DjSh9Jcs7cTC3A4Bc7At2SybC1Xm9ilyhe3srshy
 WcPodlEwuOe5XOy5s7LF4u8srJlaVdu7iPjJLEDGHFDsw3RrKi6TgSOi3EV8tPeD
 vNepwMQbWiGyOGDUozT2adDirf8S27hX5eox7vhI0bILub7IDFBVIwHxXZcfH7ny
 vDPDVfikD5KqsA+J8Coov51+y8Cqcqyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Np+QyQI1uB3q+4T6p
 TmdJJkKnx9ws99Vdj30jB4IYvo=; b=EI0GGGnDDmH2XftK34b3P6Ghopc7OQuDO
 X/oUjdMCsZ87Xqd2F5Pcb6NSVlk1WJd9wtlIobnq1M+RIJvhwnkLH2Y6jji0HEoJ
 FQ4UbJmvwyAODxuDGI+DNJ02hqYxCFiOJty6qzlsV8WyDFUArGzB+42rRHkDkjqc
 6p8KM7RDAMZXrDgp38BDkQphlBuLG137c8GnMZW+mLcR7mtjwMonT31CeaBACObC
 AvXEVWQhTDQupivbUnBAcza52ih9itfGGtPYvkYT9yun9iM1a8Cw6ypY8UiuHDap
 G7iiVyCKxfMMgqQVdpCDM7xpdkd/DGSvt+eReILtOXIPqhNccuxow==
X-ME-Sender: <xms:i5w6Yngs2MQp1VPeP2BI57B6sF6xd6v0HulPZZddkdJAtSgJ16rvsQ>
 <xme:i5w6YkDblF7N4q4tw4OVk7VBD2kp92MfvkGXUG6yJu4kSdM9RDKYFFBmGuhRAvHvj
 1fLc2m975L9sWDUfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegiedgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
 grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
 hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:i5w6YnEyvZjB8hwI3ywjuqTwf9C91_kzdB_xaOFP4SHwNdDo5rm1CQ>
 <xmx:i5w6YkRs78ZQ8HJkA-SdbcT1iMZeYeRJV-rPOAC5hThTPlBmhP9IuQ>
 <xmx:i5w6Ykz1KdIqay4FywmfPNZM_ZZTvrhpSGUO88qE3gquuEAaNcAVrg>
 <xmx:jJw6Yho8RlYkCNgWEV0uuCp8X6jJTPPz4fkl0XqLwW_k0BHz4ryGkw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 7FC64F60083; Wed, 23 Mar 2022 00:05:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4907-g25ce6f34a9-fm-20220311.001-g25ce6f34
Mime-Version: 1.0
Message-Id: <ea0c2d76-0a89-487a-a710-d6a07ae967b9@www.fastmail.com>
In-Reply-To: <CAGpPFEHeN0NL3EJ238BbGLNpaayRo4SGcfWdRTdNiEgpq2a0Ng@mail.gmail.com>
References: <CAGpPFEHeN0NL3EJ238BbGLNpaayRo4SGcfWdRTdNiEgpq2a0Ng@mail.gmail.com>
Date: Wed, 23 Mar 2022 14:35:10 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "logananth hcl" <logananth13.hcl@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: Applying patches to U-boot 2019.04
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
Cc: "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 23 Mar 2022, at 01:13, logananth hcl wrote:
> Hai all,
> I'm trying to port the u-boot to the 2019.04-aspeed-openbmc,
> Here trying to apply *.patch file and also applying the defconfig for the
> u-boot from the specific meta-layer.
>
> In this case, the defconfig file changes have been applied clearly to
> u-boot in tmp, but those patch files are copying to the machine tmp folder
> but not applied to the code!
>
> Is there any restriction for applying patches to the 2019.04-aspeed openbmc
> ?
> If not, is there any other suggestion for applying patches.

Send them to this list so we can apply them to the openbmc/u-boot tree :)

Andrew
