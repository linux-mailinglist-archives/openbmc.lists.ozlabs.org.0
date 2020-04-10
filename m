Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 371F41A4219
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 06:47:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48z5922BrDzDrHm
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 14:47:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=UtAXc5KB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=SOYdN5Jv; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48z5840cCyzDrHZ
 for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2020 14:46:42 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C52375C0105;
 Fri, 10 Apr 2020 00:46:37 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 10 Apr 2020 00:46:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=KrGZ+
 yqJX2r0PBCZsN0OOll27JYDNpAVeaX5tI10kbU=; b=UtAXc5KBuyytPcwY6ocLu
 xFnU9j2+GNP/28wYZA2HNdBDCnAlqs26JQxUFRR+zdWcXkEfCuw+ycI21+9Rj020
 uFP+Q86GLa4pKYnBw+NPK2byJo4G6U0JPonpaD1lHFu9YEZsZ54fD1pqy15dnIom
 nLs0ITfAiEVvfKV7QDu69hGaZsvRW3Ao42Ykqwn8WcCxzrmw/e2jVQr6O1eNJ298
 WGsluNtzLIhfjDiHIhS1MxH9RtNK9MFessol6/HqXGte/n2/SugC4W7SP3vcZWRe
 gAHDZR8KUXgbdCWn8F+ZQpJU+OJLqbX+5FY9LcpnAHzo8Wenoz7N6XeWAdUdPbpl
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=KrGZ+yqJX2r0PBCZsN0OOll27JYDNpAVeaX5tI10k
 bU=; b=SOYdN5Jv37C74dsgSyxid410zDem/JUIv2XNeCMai4LoJDURRD/c+NUw1
 y9UG1F/CIby8RlMRH6bt4M0MuBrEfnB8DM5yGJvdkQldfPGqUV2PNuAqHEpG0j5K
 4grJs0KEqnFGoZ0muyR7KvR5aB/GEIg8t0By0mq0H+nZMsH88HTnAAnklZj8pDZN
 +xqsQNQaK40lpYgC+7v6fjpXxUHWUy3gwOOFYAOyshSeHaW/hr76FlAILngtBRyr
 en8UpRiz7dgrfHY7UA3ecrvK3mlMUyuXatySVHnU2xpocmbnxhrGJWjVVcZ8Hemx
 GF3A8Dw2b3BCIqnZg4kZy46C4FCyA==
X-ME-Sender: <xms:LfqPXkqbSbSEazuimDgH3qxCKG7WTzOr73k_BFNQC-rWgfiAi79HPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrvddugdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegr
 jhdrihgurdgruh
X-ME-Proxy: <xmx:LfqPXnTmr3VsjloFEB5k4XYYG4Sv6ZGsBzCFaI4nDHsG5aHzU1Acag>
 <xmx:LfqPXvm8AdTRK2e_J2Z0zmEIg-PajJqCifhmTub44t-IGtpemThvuQ>
 <xmx:LfqPXlzCntW2BrcM6F0SmJgf059Be3ftenCWeBlBt-ZwjmI-b__gbg>
 <xmx:LfqPXhD-0usqzk_EGZuBx_4s4rVor_t8WkiT5QRNJM8i2L8ZP7SFwg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E7C2CE00A5; Fri, 10 Apr 2020 00:46:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1104-g203475c-fmstable-20200408v2
Mime-Version: 1.0
Message-Id: <625f79f9-0490-4dbe-b364-959e2091fdc8@www.fastmail.com>
In-Reply-To: <B81F049C-24DB-49A0-9DE5-5D7C02496AD0@fb.com>
References: <73161AF5-F6B6-40C6-AE70-5FCF5A530B82@fb.com>
 <451f5f0e-a1ba-4016-b044-e55b966f64ea@www.fastmail.com>
 <B81F049C-24DB-49A0-9DE5-5D7C02496AD0@fb.com>
Date: Fri, 10 Apr 2020 14:17:00 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vijay Khemka" <vijaykhemka@fb.com>
Subject: Re: objc console new design
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On Tue, 7 Apr 2020, at 05:11, Vijay Khemka wrote:
>=20
>=20
> =EF=BB=BFOn 4/5/20, 5:10 AM, "Andrew Jeffery" <andrew@aj.id.au> wrote:=

>=20
>    =20
>    =20
>     On Sat, 4 Apr 2020, at 08:09, Vijay Khemka wrote:
>     > =20
>     > Hi Andrew,
>     >=20
>     > How is server launched as per new design code. With latest updat=
e,=20
>     > console server is not launching in our platform. I saw config op=
tion=20
>     > =E2=80=9COBMC_CONSOLE_HOST_TTY ?=3D "ttyVUART0" =E2=80=9C has be=
en removed from bb file=20
>     > and also there is no triggering point in obmc-console-ssh socket=
 and=20
>     > service like earlier Wants=3Dobmc-console@{OBMC_CONSOLE_HOST_TTY=
}.service=20
>     > <mailto:Wants=3Dobmc-console@%7bOBMC_CONSOLE_HOST_TTY%7d.service=
>.
>     >=20
>     >=20
>     > I see udev rules added in latest patch for launching server whic=
h needs=20
>     > config definition of udev, do we need this for launching, please=
 advise.
>    =20
>     Yes, obmc-console now ships a udev rules file that launches=20
> obmc-console-server
>     via an `ENV{SYSTEMD_WANTS}` directive:
>=20
> If this is mandatory then why do we need to enable UDEV config as it=20=

> should be enabled by default.
>

It's not mandatory, just I don't know the requirements of any systems th=
at
aren't using udev. The switch exists in obmc-console so you can implemen=
t
support for systems without udev if that's desired. Maybe adding the swi=
tch
was premature?

Andrew
