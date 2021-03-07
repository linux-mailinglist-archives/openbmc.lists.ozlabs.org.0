Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B055332FE8F
	for <lists+openbmc@lfdr.de>; Sun,  7 Mar 2021 04:27:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtRk55C4Zz3cY8
	for <lists+openbmc@lfdr.de>; Sun,  7 Mar 2021 14:27:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=JLwXWHgW;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JQlf8jyb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=JLwXWHgW; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=JQlf8jyb; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DtRjp45bjz30Gw
 for <openbmc@lists.ozlabs.org>; Sun,  7 Mar 2021 14:27:25 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A0D995C0094;
 Sat,  6 Mar 2021 22:27:19 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sat, 06 Mar 2021 22:27:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=67nX9
 IgtdlOx4eqe34jkJQMfMblGwo2IcYIpa1j2l+A=; b=JLwXWHgWSU6GWKeVmVg5g
 Xklq7xUPH/4Fm6BgrkI05+i7KXWdU/TN2vQIuAVRivJcYtXAM8YoFTMr9/+uX2LE
 hp0mxFJYQW7dc92qad/TpejmfZG+bqme4Tlfou0UCnMR/tYe9/GFFNW25ujFk10z
 XINLYss6LjIalM0s6p0tpieAI2KiXc1GaOESR2exKpspRw6dH1Y4m7tDUKyKSL2n
 nxHKk4ArOuup///wShVmyyIUGHk3DCMUnkv4BGSHztWJbjS6woFjfM+DIsIxe/Xk
 qiQSFi6F0QeTaP37ZVeSDhseYtA8YhdHXIA/81WwZFgE124lzT37nA6MnMNxC7Ts
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=67nX9IgtdlOx4eqe34jkJQMfMblGwo2IcYIpa1j2l
 +A=; b=JQlf8jybsmMrlK9sABb3SJtsxB+mhazpDSqSna18YKyCIGsXzEXbbjtTH
 9fyy1jL18r1V1wQgtblj3U55pz6q4Z2G3dsqJOFcZiZ/YIv8By9ynvaBgiZrvSW1
 OVvxBN/rs0cXujzG6QC+417D45YxNecEF4HSjJYQQEON4bYZ4w3PGszHkGriMDqc
 WkSATrjr+g1MjT0ujG1PMs6XpWFj6MFpol5dWMJuTX9h8lgD9RHfUshDPP9N7YtE
 T6D6hJj6RTFC9VGEXMgitl/z5VbfsZEoKruFjGsC/klXJqe+hRShxnPl2yj5WijL
 hzRffdRgXDkRBOyBDtQk7ST+ezoIg==
X-ME-Sender: <xms:FUhEYIxreYK1ctLLtfxcmnWuljk5BUpc0xjLiC6Ngmif6TudjJgdWg>
 <xme:FUhEYMSuWHk8emjh38HtLKtEW1cOUEO8QmE9LmmPw7iyt2SN05NC_ZCy8e2rY9CUg
 EWEvcUhFOKfQkv0Vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtledgheejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpefhgfekhfdugefhjeduhfdtgfeutdefheejveetffegudduteejieej
 hfehfffgfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uh
X-ME-Proxy: <xmx:FUhEYKXZ1mMstPZXwHv8xku5CRP38CbUeFXf6TXqLEOLmV9Tll1Z-w>
 <xmx:FUhEYGhVBIlJgDkDLlKrdvOg0ACwztYZnqtA76DfeypYiuclO-Yg2g>
 <xmx:FUhEYKCRt2PfnYibgnnRBIKLBhz6nMwVKeusj12uyfk-b_vvdyyT_Q>
 <xmx:F0hEYFqmBWhsQq9i25k1f3AlibunJulX01WcIBEGiCLhR8yLUtLO4g>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 89C0DA00064; Sat,  6 Mar 2021 22:27:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-206-g078a48fda5-fm-20210226.001-g078a48fd
Mime-Version: 1.0
Message-Id: <6f31c48c-5366-49ac-b20b-73bdc5179044@www.fastmail.com>
In-Reply-To: <8301a30c6dc065c266c1a028b6c173b427055f82.camel@codeconstruct.com.au>
References: <DF4PR8401MB06346506DB2E0B65A9B5EC1B8F969@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
 <8301a30c6dc065c266c1a028b6c173b427055f82.camel@codeconstruct.com.au>
Date: Sun, 07 Mar 2021 13:56:57 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Jeremy Kerr" <jk@codeconstruct.com.au>,
 "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: BIOS/UEFI host firmware interfaces into OpenBMC (x86)
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



On Sun, 7 Mar 2021, at 12:01, Jeremy Kerr wrote:
> Hi Mike,
>=20
> > We could add the vendor specific support we need into our OpenBMC
> > port to handle our UEFI firmware=E2=80=99s POST-time data transfers,=
 but
> > would prefer to first understand if there=E2=80=99s an emerging cons=
ensus
> > on what replaces IPMI over KCS for x86.
>=20
> We've implemented a PLDM-over-MCTP stack for host-firmware-to-BMC
> communication:
>=20
>  https://github.com/openbmc/docs/blob/master/designs/mctp/mctp.md
>=20
> for the PLDM specifics:
>=20
>  https://github.com/openbmc/docs/blob/master/designs/pldm-stack.md
>=20
>=20
> > From what I can tell from reading, the Open Power folks are going
> > with PLDM over MCTP over some interface (KCS or BT?) to enable host
> > firmware to BMC comms.
>=20
> This isn't really OpenPOWER-specific; you should be able to do the sam=
e
> on x86, where just the hardware channel can be platform-specific.
>=20
> In the implementations I've been working on, the hardware binding is a=

> hybrid of the KCS channel (for synchronisation) plus the AST2x00
> hardware-based LPC memory-map (for the data transfers):
>=20
>   https://github.com/openbmc/libmctp/blob/master/astlpc.c
>=20
> - where that same code can be used on both the host-firmware and BMC
> sides, and should be fine for x86.

In addition the binding is documented here (which might be an easier rea=
d):

https://github.com/openbmc/libmctp/blob/192752301b9d98b8699e88ede61d75e9=
6eaed4bb/docs/bindings/vendor-astlpc.md

Andrew
