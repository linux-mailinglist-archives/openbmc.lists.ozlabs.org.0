Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3015B32C7
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 02:23:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Wn5b3CHCzF4sC
	for <lists+openbmc@lfdr.de>; Mon, 16 Sep 2019 10:23:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="Ks5HO5cU"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="1cyrA8an"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Wn4r3k8rzF4Vy
 for <openbmc@lists.ozlabs.org>; Mon, 16 Sep 2019 10:22:34 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0955A2108A;
 Sun, 15 Sep 2019 20:22:31 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 15 Sep 2019 20:22:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm3; bh=3mWZQ
 dbuCCfVfitHn3H7JHnY9xjvVjvrGv/Wb3HnafY=; b=Ks5HO5cUUfWKtubIB+ZKL
 j/kCyccOLXsbaQ2p69DVMoMGjbyAJ5W30Z85IdkAIvQ6Y28ohgaH5Z5ZwJfInRWF
 jBOZSMo67SEXIQyI+1FmxxM0Afy4ik1faSvZB2ViCCofK+CAPfnj6A4zNR65TVnR
 Vw12xszuJ2ZoeEJmro9OUSKZxObcGcIoIyd6iYCjSO+9NTaxGTvB9OjMl2P3J6DM
 gR+/vWXKbiHsp7cTklRFv+d8eXrRKBVPWVfCsvza2u5EsYGebQzGnAuWa4eCDNV3
 hdagMverS/CE/6h2zIPvPWZoYJMwDO2eZzbw7iEK4FJa1AjHCDj74oNrcDEAofi7
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=3mWZQdbuCCfVfitHn3H7JHnY9xjvVjvrGv/Wb3Hna
 fY=; b=1cyrA8anvYofugI0huzGOym+dBzQMC/qnYRqbdatsNT7HAeXiFq4leH9b
 sLG0DBMLAZxTB/k0j+/b4AkKbCT/jQALdFX7/utAr7jYu5gtvXJz3EGaY3d6gx4q
 oFYDgUhfgR2XnlGVK4+lMpq/C2hblCE5MXOg2F9L4VB7tO7hxIu8n9EHAqA4gnoq
 cB6G7lhlkTldTkyBTdfIHut9fsrbn6yjrwJCEsCB8c33UqRf7QyEzg9iIeqkYZtL
 G371Kq3bM1n44GYreKu94HB24aodcI0J+Z+aVQU/BbGXueDGH7GRbiCG5Kk2/ans
 yX7qnnn3DQ56VrKk2ABb5ye2zGl5Q==
X-ME-Sender: <xms:xtV-XWqCTqM_bzWLmUwrjAR-uSyU-BcgiCbhAN4BSGX4650IGzRLTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvgdefgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:xtV-XV0WdHQaqf8t_lwJJtE_cBcbjO1U7wN3-f65MXXg0UaOhHVYLw>
 <xmx:xtV-Xbr9-wltn9MPYpCEvqxKCrLIeTBY23KoOuA9H_oJvLG50z2u_A>
 <xmx:xtV-XfSnA1Y1CdSG8sQOG9DAivU606QNM-5uMy6gpBwfRUXWg7m1RA>
 <xmx:x9V-XZH1J5iBzSYNbi-cU-SUJxkrwlH5MXY9AeO7t-UgERPprkyJDQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 89C33E00A9; Sun, 15 Sep 2019 20:22:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-237-gf35468d-fmstable-20190912v1
Mime-Version: 1.0
Message-Id: <2c053e01-f549-411d-949e-399c38b06bf1@www.fastmail.com>
In-Reply-To: <7DA89F57-35F7-41B3-94B7-62B72442E6D2@gmail.com>
References: <7DA89F57-35F7-41B3-94B7-62B72442E6D2@gmail.com>
Date: Mon, 16 Sep 2019 09:53:06 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joe Gialluca" <joe.gialluca@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: Information on Boxelder
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joe,

On Sat, 14 Sep 2019, at 21:00, Joe Gialluca wrote:
>=20
> Can anyone send me any information or pointers on Boxelder? I see test=
s=20
> for it in the OpenBMC automation test harness, but I don=E2=80=99t hav=
e a clue=20
> as to what it is. My Google-Fu has been inadequate to the task of=20
> finding more information on it. If someone has more insight as to what=
=20
> this refers to it would be much appreciated. Thanks in advance!

Boxelder is the name for the BMC card that is integrated into IBM AC922
(aka Witherspoon) systems.

Andrew
