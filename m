Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E366033CC
	for <lists+openbmc@lfdr.de>; Tue, 18 Oct 2022 22:10:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsQ333PDxz3c5v
	for <lists+openbmc@lfdr.de>; Wed, 19 Oct 2022 07:10:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=YgJ+LfYu;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pZl3EgEJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=YgJ+LfYu;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pZl3EgEJ;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsQ2Q5qbhz2yfg
	for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2022 07:10:05 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 0F4285C012A;
	Tue, 18 Oct 2022 16:09:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 18 Oct 2022 16:09:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1666123799; x=1666210199; bh=jWWrO58uCq3rmMEfrUpxNY/kF
	l7UPwy0j1v4Xj1TnXc=; b=YgJ+LfYuM1Sm+3gcQuNVs8FSaIiZRwvHQy0UTzez1
	58bSsFuuil97hy8O+snC/3AfdPlmMr3YHSKkkWeOjD9J7J8D/CA60Llz0WwzfzDH
	UMafPNWHOX1dZu6jlB1KophOj0upPztThqycoVuGL2q1yZX8fo9Z86a/6ezgDFcd
	hEPIozHVOE/zq2rKJRmfh9s2IN9PUof8NyoQ+cKKePQaLkNDhABwMNBh9mF38COI
	1K8rPZG1XuRWs/dHTtnfAqXMnNAt7TCbwHPAWdowYmCQ061xAUTYfTMwVdl1zMZC
	mcFfvOq9pOSNGX1omXUicdC5GiD+pTW603vRN+jyB2vpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1666123799; x=1666210199; bh=j
	WWrO58uCq3rmMEfrUpxNY/kFl7UPwy0j1v4Xj1TnXc=; b=pZl3EgEJBVxXIyBqq
	SdqVabxxkGGh0WkT2xfdlDJ1bt8jD51FsBtOJrq+6zRIxpgM69EJhrcEsXG/KeLR
	PJuSv48cp/hVqGW+qIGfJJigN9buNEWU1uc+W9diH14Og0R63pbQTN0ONkilu1ef
	Ju+jSmcGZ7f+OdZ/i1QRggpt3MIb1eI84NU7ONVrsDuC9u9PlGRZ8SDv0sxGeUWV
	+B2sH/PjaLCQKUII59dQPM3b7qfz9/ojx9oQQxPgWn/l91uKXjtX/KGRq7tZ96z7
	cyn1vm/+f+r6VSUshjQ7J9s9QTSIcaiMk5QHeHhPwY5YyqY5lIyMVLaVQkA3h/4f
	aP+lA==
X-ME-Sender: <xms:FghPY_Chm8vXZ32SZLmgA6Fxwsb-8qIr37MDV0tQKq4vZRbXdH0tkw>
    <xme:FghPY1iv9zVaWBdsExTWZt4oYkFEikZLPgiZM_Z9wWQ02EZZDjEorXXMg2JhtngEZ
    9gmfJ8jR7cLkCvsgQo>
X-ME-Received: <xmr:FghPY6kQf25TDGPyH-qxikwDd7eYxp0djInGmcyWYiD9aPZPCXm7kGHELIWnX45qtapK8-3lu0ongtYdUiwY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelvddgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdefhedmnecujfgurhepkf
    fuhffvffgjfhgtgfgfggesthhqredttderjeenucfhrhhomhepuehrrgguuceuihhshhho
    phcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqeenucggtf
    frrghtthgvrhhnpeeigeduhfdukeehffehledvgfetteegtedtvdffleejueeguddtheev
    leejgeefleenucffohhmrghinhepohhpvghnsghmtgdqphhrohhjvggtthdrgiihiienuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsrhgrughl
    vgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:FghPYxxawWMkPratyCwyiMIx71IlCJTKFp5yRnDdtzcMdkzM6hysYw>
    <xmx:FghPY0RKXMbkcrygD5MNj_S_W-Z9jjVcF72eoKRKEo5l9KPXl0-KcQ>
    <xmx:FghPY0ZTm0-ebDvbFzETc00OctsgddgkszDQzjBbCkWy6jfay4GNJQ>
    <xmx:FwhPY945dLHGZNRLYs5kKVA4x2u6_lYDcSKP00OvkHXcG_pERNh-sg>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Oct 2022 16:09:58 -0400 (EDT)
Message-ID: <e91a28c961288e3ead27cff19dfc9f03907f4405.camel@fuzziesquirrel.com>
Subject: Re: Adding support for custom SEL records
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Lei Yu <yulei.sh@bytedance.com>, openbmc <openbmc@lists.ozlabs.org>
Date: Tue, 18 Oct 2022 16:09:57 -0400
In-Reply-To: <CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
References: 	<CAGm54UFshn7RpFMhpoJrMVHh9ONibDQ0DKoUokaG0q7V4Qi5VQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
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

Thanks Lei YU for adding the support desribed below.  Sorry for the
necropost but I had a couple questions (below) for anyone that feels
like indulging me with answers.

On Mon, 2020-12-07 at 15:35 +0800, Lei Yu wrote:
> This mail is to propose some changes in openbmc to support custom SEL
> records.
>=20
> * Background
> The phosphor-sel-logger is the service to provide methods (IpmiSelAdd,
> IpmiSelAddOem) to add custom SEL records.
> However:
> 1. It only sends the log into the journal;
> 2. It depends on
> meta-intel/meta-common/recipes-extended/rsyslog/rsyslog/rsyslog.conf
> to filter the journal log and write to "/var/log/ipmi_sel"
> 3. It depends on intel-ipmi-oem to parse the "/var/log/ipmi_sel" to
> provide the SEL entries.
>=20
> In short, phosphor-sel-logger only works with the meta-intel layer and
> intel-ipmi-oem.
>=20
> To make it support general usage, several changes are submitted to
> gerrit:
> https://gerrit.openbmc-project.xyz/q/topic:%22dev-add-custom-sel%22+(stat=
us:open%20OR%20status:merged)

To make it support general usage, I think we could have just moved the
rsyslog.conf to meta-phosphor and moved the handlers from intel-ipmi-oem
to phosphor-host-ipmid, correct?  Instead, we invented something
completely new.  My question is, why?

Whatever the reason, OpenBMC now has two ways of doing SELs, and I am
tasked with picking one.  Knowing what was wrong with the rsyslog=20
approach that led you to invent something new to replace it would help
me, (and others I suspect), make that decision.

Thanks!
brad
