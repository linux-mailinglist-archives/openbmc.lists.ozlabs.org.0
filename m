Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DC85BF623
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 08:14:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXSmF3pfHz3bqT
	for <lists+openbmc@lfdr.de>; Wed, 21 Sep 2022 16:14:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=rWm/OJZj;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QNFiE/KU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=rWm/OJZj;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QNFiE/KU;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXSlr1J3sz2xgb
	for <openbmc@lists.ozlabs.org>; Wed, 21 Sep 2022 16:13:44 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 463A35C00F8;
	Wed, 21 Sep 2022 02:13:42 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 21 Sep 2022 02:13:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663740822; x=1663827222; bh=zK6kqNMDgt
	ixSYdH0VtNjJvqZlPdOTZi9WjLDA8Dn6I=; b=rWm/OJZjvDjutUJjqnS4wxCdvP
	oeY8/DZpLBpwIrn7/PiVeVnpqSVtAmDarG8KCAwN+tvgf0xD3lYAAu4HJBVst8xH
	tKUfML4OgNfl3MImaUQejGTr38/3cgYfNlJ0pmBIiKEdm53Qlrpa8SFNC/BJlvsZ
	GvAteUv33CxVUzXdvwSsr0z5A1O37x6BX7XGmf/OIk1Gnb9AGfm9d2fJe4iJtt2d
	Z5jEsh4QDM41YWucaFstZpmaCYdcmg5yTzbWcPvVIV8VJ8cDg4zTrWO/Q2p1bo7j
	8GU2n78n9OAiPZ+QBcbJZIC90JjJ/04QvdGHZYkEgnO6HVKptALwOYg8BxPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663740822; x=1663827222; bh=zK6kqNMDgtixSYdH0VtNjJvqZlPd
	OTZi9WjLDA8Dn6I=; b=QNFiE/KUzuBGheS/WA6LzpI8Wz06BCT79Wj9LCRZtkji
	MX9ExETYczTT/BLll9cK23JNXD7cHiSVaC2vDO33d3KLnfPZWLe4HOPQPlCGFuS3
	HxxrfaA6Xi/ATLSv/8muCTPCWWncdxw2zx/hx3m3sQxYgY3JLIAa677wcAYouai2
	sSqlHVgTLTNQGeWU6Dkdg1J8D6OYBA+1yUq38N/3pLu0CTZSq4xGdbAgGqWi4JFt
	u6474DqBgYQtQoFtx8payJaotHWnR2zqfVf7dkjtl9wpYdN22AldyIvDpp7lfOvm
	rrMAWuBWglnuOYCVCUpOxvKRDrtOeMadT57m3+GkgA==
X-ME-Sender: <xms:lqsqY-wKNDNd8Y1GJnAIVXF2rG_HJ_6I716hBu85eZBbtmeEbnys5Q>
    <xme:lqsqY6TKfpCr4ysH_YMiItx-BfYxRZ5uzUfMJ54MJ7SA58-5UQBD54VIsxrv0Nl69
    siuzHbR-sAr6XBRhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeftddguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepkedvkeejkefgjeduffetteegjeekteetudevtdfftdeluddthfeh
    veefteekieetnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:lqsqYwX4m26StiojYTPuoK6qj2pxx3KNRYwHX188ldd9Id_E0vK9sg>
    <xmx:lqsqY0iEvHgsNV4B_tRPKG8cKh-AVgMvTG-Psbi2af7XBssBzX4A8Q>
    <xmx:lqsqYwDHwGUoKkGNwsTyfDgGvgb-rJPNgFfiu-u2U0l1nDxZwu2fgA>
    <xmx:lqsqY7owLD2cCPBIiJGmvrI_JEmj0jIOvnwoVO-FGMh4WVs6OVxGuw>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 181881700083; Wed, 21 Sep 2022 02:13:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <598c2e1f-d931-4133-8b3f-245a5c70f96d@app.fastmail.com>
In-Reply-To: <20220921045420.2116037-4-joel@jms.id.au>
References: <20220921045420.2116037-1-joel@jms.id.au>
 <20220921045420.2116037-4-joel@jms.id.au>
Date: Wed, 21 Sep 2022 15:43:21 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v2 3/3] ARM: dts: aspeed: p10bmc:
 Enable ECC
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
Cc: Adriana Kobylak <anoo@us.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 21 Sep 2022, at 14:24, Joel Stanley wrote:
> Enable ECC to cover the entire DRAM by not setting the size property.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
