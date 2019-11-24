Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E01E108532
	for <lists+openbmc@lfdr.de>; Sun, 24 Nov 2019 23:00:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Lkc553fTzDqY0
	for <lists+openbmc@lfdr.de>; Mon, 25 Nov 2019 09:00:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Dwrl1wzP"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="pt/klV/O"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LkbF4GDtzDqXG
 for <openbmc@lists.ozlabs.org>; Mon, 25 Nov 2019 08:59:20 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id A434922775;
 Sun, 24 Nov 2019 16:59:16 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 24 Nov 2019 16:59:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm1; bh=P5+vM
 TVjJlgR1xXGsW6rvvg0Kh8BHK8uGGXLWJEsZfQ=; b=Dwrl1wzP4hwnktiPNpG3a
 ySDKOkpFS22lJFmjKkQv/qw+SRo9MhfRPNeRaLMW27wvQkQwlBnwgdYRpVqjwpoZ
 H2CJx+TY8t4oRo1S9J1ZVl0IQV5h9Re4ORxA2U2+5PF8/N8635tWtsIzveWhEjrn
 NYM/4RC2+5RDbuUhtVL6QTCHYmnBFlBpQXL3eHI3yMcz5FLK1wKwbgRbybnkLiQs
 5K8VONLkpTBOKZJJL+v+qP4uzEtN8SaZUnqEuUSPWTu0jlAlJw4w3kxNAvLNXvFx
 AwN8tnhZegqpe0Dg/4s698J/cEvAbV50np9A5TkDpaXlYgQsvemdLCUSVHHtE9zb
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=P5+vMTVjJlgR1xXGsW6rvvg0Kh8BHK8uGGXLWJEsZ
 fQ=; b=pt/klV/Odg23nFeXL2LfbPAnD02Dl1+trlxEY2jGfAv3h4+yLCWXoj4iQ
 YhYLUOfScdUxHU9CJf+BLVJB+VtFhvMB+AVKpaYpo+VMk0T3Z9QBe9bKYgNjSDUi
 SMrU0uWWyhsOGpnJ0twAwaONcYfTwm+GRcwNX4mf8fnX6z9oorWEqtPVQ5ULMDZD
 Yfp9To1N+8saUMtUPS5QBXqCFLY/ykD17Jk9clKkUHnbMz+eDcAIvjhOKBFta9vR
 2CBoJKgLmYxDPWp7LHHSj7RJMGoo5Fw8HIoEvqZ8hbnEG8a9jhOykBv4XIPhEb5y
 6LZ+MwShRh1tBd/DUeeceMbvmJUmQ==
X-ME-Sender: <xms:NP3aXYyzVLnn08YYUqnV8LV7NL1FauTsYpQ6WqIT5qIVre2Dffkcmw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehkedgudehkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgfgse
 htqhertderreejnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgu
 rhgvfiesrghjrdhiugdrrghuqeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:NP3aXSm7Uee6TXhIVn9d66uT1rQfC-4wQHP4qkyFCz8tb14r-D4a4g>
 <xmx:NP3aXbGbYR9VOjACDmeaI5rYDG2zoazx5QDkqGkkG3UcdPpO64Nj6g>
 <xmx:NP3aXfVRgLGPyLeMASPnz19YWOPBG3-R5QEm-st4bdYnZehUJXwfRw>
 <xmx:NP3aXSL5rOo0cGNnWWsOV2F4NPqZEP4bXLeVwJjHrHfydn_y1fwYvw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 56C26E00A3; Sun, 24 Nov 2019 16:59:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <4e9b1994-b303-4d74-8176-aebb89a0f0e2@www.fastmail.com>
In-Reply-To: <154200de-8eea-2204-e572-45d2f2fe6075@mail.ru>
References: <2edbb697-aa07-2610-3bf2-cbd7707c6259@mail.ru>
 <2fa9a025-abf9-45f9-88bc-eddcc2726c89@www.fastmail.com>
 <9f3eaecd-6fec-8af8-21f6-8292c422593c@mail.ru>
 <e5994432-fcec-4994-a8bc-2ec46c103600@www.fastmail.com>
 <154200de-8eea-2204-e572-45d2f2fe6075@mail.ru>
Date: Mon, 25 Nov 2019 08:30:45 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: =?UTF-8?Q?=D0=95=D0=B2=D0=B3=D0=B5=D0=BD=D0=B8=D0=B9?= <9165394577@mail.ru>
Subject: Re: NCSI eth0 (ftgmac100): transmit queue 0 timed out error
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 23 Nov 2019, at 18:50, =D0=95=D0=B2=D0=B3=D0=B5=D0=BD=D0=B8=D0=B9=
 wrote:
> Hello Andrew,
>=20
> It turned out that the i210 firmware was not loaded by the manufacture=
r.=20
> Maybe this is normal, but how then did they test the board?

No idea. Glad you solved it. The pinmux issue is a bit disconcerting sti=
ll.

Andrew
