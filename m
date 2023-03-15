Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D05AC6BBF09
	for <lists+openbmc@lfdr.de>; Wed, 15 Mar 2023 22:28:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcNm05Q9Dz3chJ
	for <lists+openbmc@lfdr.de>; Thu, 16 Mar 2023 08:28:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=lJB7eOXJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NJBIopE+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=lJB7eOXJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NJBIopE+;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcNlJ3JKhz3bh8
	for <openbmc@lists.ozlabs.org>; Thu, 16 Mar 2023 08:27:22 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id DBC615C0082;
	Wed, 15 Mar 2023 17:27:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 15 Mar 2023 17:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1678915638; x=1679002038; bh=w8ZyvjVaYP
	o2dqsTIiI5GfFhpirzf/fSnGPHCsS4c9o=; b=lJB7eOXJwwKULXttu1kliU7LV0
	FIHnYoh2Yu56Rlj8Zm3FEYaAjaDxkvVpdGvbw2ixI2Cd9dd/La/CuJBrv5dp/bEc
	cZKn3nFmvvryYPAMUQWIUPvF1KbvYH3TKAGdKmqAcYOAX3G2VzNfonQDlFmtwtU0
	+qxL2ZxqkpPw2BEU9+woOmCdKzbz/wirs2d+3KKb+61gxZm3pj1yeTuRETJRyNvI
	GP0TWye4n/ViF31WdHMegauyKF9mephswtEjY4XlM8govbNbIu5zSB6Jr5sQ09Hf
	EDM3hPDtkcC/nZuVfcivcRjhNxglBHGkHD99JJav5hWYmDgESTde0Lcm5Vdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1678915638; x=
	1679002038; bh=w8ZyvjVaYPo2dqsTIiI5GfFhpirzf/fSnGPHCsS4c9o=; b=N
	JBIopE+FGxS0t23IaKZmyOU0wIbM/6/FV7V4lLAg26ANivOs7SsDimQgJHD5tE5d
	SuNo2yHoFE1KC+hwkrrGiaqj/1KGwpgSAuJOjyFLMkAgCC8sEyWNxfgl7u9dQy8c
	EXp2I/pY1kjIyLoScLaTMlJrjmYAF/0FcKhdiOXBlha9GNrsMG4JEVt9hWV8ig7F
	172JhobOcTLLDU+0bJQHlvqTwyyAlbNhY1LyRTeTQVhSKoGp+ZJfCwfGDxYS1p1x
	ow67oNX401M0kJCRI4tvo3oFbzpt6rPu6oL0YGgzWEs4M4gtJdQjha6Wlk88HbSg
	NpML/oiv9J/2RTHfx3Kqw==
X-ME-Sender: <xms:NjgSZK4LPVr7odMIzg6lQVISCbdJRtL8LV64Y3HjtKvr02zk6-SdYQ>
    <xme:NjgSZD5p2jTB008DAAyVDtaa-r-1OjXNQTVEBX1VpLUuYQowoNtykYB3Teb3yshnI
    gtFPHaAX0vYHvPKhkc>
X-ME-Received: <xmr:NjgSZJfbFHzkSvcynRy2y93Cn8zRHTdMB1IMMMrXkR4L-d0dYco_0gDpLr1jef8ZbYF85OCOOnu2KjrncxhJLYxJJWGSM1hlS80UxlMlRxpVr_2wrBs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvkedgudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkuffhvfffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepfeehffekkeeggeevgfffhfekfeegveefvedugffh
    udekveduuefhjeeklefhieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:NjgSZHKVQjhR7WpqffEFEB7aQ6YFZzFhZr4sezQVA0XluGklngSwuQ>
    <xmx:NjgSZOLR-aMd66qpL9B2KVidKbOR8JJakRACvKYU0enazwRZp1wl_Q>
    <xmx:NjgSZIwFLj0ZyuWjoCo65Cqk7iDZYbeFZBDG_cWMQuxFXy5cjndtAw>
    <xmx:NjgSZIw0M6GHgQtgYqoYygTV7yYnEoKIE59UEuXuF3KJ39rNHp1Ltg>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Mar 2023 17:27:18 -0400 (EDT)
Message-ID: <ea34b23bffc6b1120da50d2a0a62360380610766.camel@fuzziesquirrel.com>
Subject: Re: Insyde's CCLA Schdule A update 20230314
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Andy Wang <andy.wang@insyde.com>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>
Date: Wed, 15 Mar 2023 17:27:16 -0400
In-Reply-To: <PSBPR02MB4437DA6A0A2691B7F8D9D1709ABE9@PSBPR02MB4437.apcprd02.prod.outlook.com>
References: 	<PSBPR02MB4437DA6A0A2691B7F8D9D1709ABE9@PSBPR02MB4437.apcprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
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

On Tue, 2023-03-14 at 02:54 +0000, Andy Wang wrote:
> Hi,=20
> =C2=A0
> Attached is the updated Schedule A of CCLA from Insyde.
> =C2=A0
> Please help review. Thanks in advance

Hi Andy

You aren't designated as a CLA Manager for Insyde.  Please have a CLA
Manager (Chris Liao) send the update.

Thanks!

Brad
