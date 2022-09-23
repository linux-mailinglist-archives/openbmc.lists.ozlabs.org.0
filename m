Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D699C5E73A5
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 08:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYhS66BcKz3cDF
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 16:04:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=q9y0WYbR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bjMGR6mv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=q9y0WYbR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bjMGR6mv;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYhRc3pVZz3cCP
	for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2022 16:03:56 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 6A0E95C0106;
	Fri, 23 Sep 2022 02:03:54 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Fri, 23 Sep 2022 02:03:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663913034; x=1663999434; bh=Pm2DhcOqhD
	ePIdTTT83Al3FyB2KVMuU2JP1PzILcPkw=; b=q9y0WYbRTLHIA3o9OZx3Ycf8RC
	dXXrqevTyvYF+PunxxX3sHkWTQcEZmXS+0muYOrkuc47HojuyYD/W+W0FLms+sF9
	cQK3KhrFSTNSSZToulwAbCffAGBkurMbeN/AONCKvrJAd/yVJBFH6nm9dlflzx7t
	Cd8Py52jlRRd8TMdxa+HWbs+DYlih2uYtwYqITbuG0ki01YvWlR12pPbnBwfafNH
	PW3pK6XXxbXjopQDqEpo09Ek4nj9OCGhYGh1r+GdKConfJTC6OzYLxf/I/w5mfEK
	dQgMkoo0joq2dE096g8tY2OYv7IiBFiRNgoGDLP6Z5PO8D6LuR9QMbzjg+dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663913034; x=1663999434; bh=Pm2DhcOqhDePIdTTT83Al3FyB2KV
	MuU2JP1PzILcPkw=; b=bjMGR6mvMHHHZoZd28b3XuagZx9y9AyA9Z2nM4s1QkKP
	vjkL9B7VQbxDiIZJ2Z/y0WkCF+/BRVT8RkBGRD1v+4KlGXeeVbVJ0TIRtqnmXB0S
	Jy1syQYMSX0YzqYT09UtbuLynwGMs7OjhWhUVKhIpTXkDTQKOhEtFfXsUO2Emn35
	+9BVvfhjDCSifdmhSHA4qA5xtUHmyvueiXeo26azZ58mJd8suEHFiwbzSgPm4co4
	3aP/CH4gr4ajVFfuKWkA/YjuvDAAKv+86HUNzKrtv/ewCT6AaF81UjwlGecroZdB
	6fnUbS68CRJo7fu6/LnoG6L5y4Mbn/LOmoEseox/gA==
X-ME-Sender: <xms:SkwtY_pv9UHV2cvcwQONeD_ySV67jVq_QEumeaWq4rS9t1rpVj4SpA>
    <xme:SkwtY5pliebhftMEV9u7fBUhxdtKs0ZIZbaKFD2abfobf_DxK31kYeKZ1WjhLwtcK
    mcmdFW7p90NdGP2Mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeefhedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
    ftrfgrthhtvghrnhepkedvkeejkefgjeduffetteegjeekteetudevtdfftdeluddthfeh
    veefteekieetnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrh
    homheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:SkwtY8P2IMceMxvQOkH4OYrMcEi82f8x-5k7JoQXQODLL5MYP4ytQQ>
    <xmx:SkwtYy6vY0FVB2JX7LTRkMsI5wZ3g-UgekRbEZZzBcaF03nZDs8RxA>
    <xmx:SkwtY-6ugAULEEjF5Io4kH_PmwbqU_ur46ybCc0vtF5lWlDrpybPuw>
    <xmx:SkwtYzgJ_xOF2nNSbKAtWEjqF5iVorSGofkiZYh_yH5q1QaMvSNiUQ>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0FD031700083; Fri, 23 Sep 2022 02:03:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <b9273112-02ff-4cc3-8b35-0acf843ca115@app.fastmail.com>
In-Reply-To: <20220921074439.2265651-5-joel@jms.id.au>
References: <20220921074439.2265651-1-joel@jms.id.au>
 <20220921074439.2265651-5-joel@jms.id.au>
Date: Fri, 23 Sep 2022 15:33:33 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v3 4/4] config/ast2500: Enable RAM
 devices
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



On Wed, 21 Sep 2022, at 17:14, Joel Stanley wrote:
> While the ASPEED RAM driver builds unconditionally, without selecting
> the CONFIG_RAM symbol it does not load.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
