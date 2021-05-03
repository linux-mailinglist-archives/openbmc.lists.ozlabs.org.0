Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D93371063
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 03:37:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYQb73fhNz2yxk
	for <lists+openbmc@lfdr.de>; Mon,  3 May 2021 11:37:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=plrAUeOw;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=od78Yzun;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=plrAUeOw; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=od78Yzun; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYQZm2ddlz2xgJ
 for <openbmc@lists.ozlabs.org>; Mon,  3 May 2021 11:37:35 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 31A3E5C00C1;
 Sun,  2 May 2021 21:37:31 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Sun, 02 May 2021 21:37:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=mZpVJ
 FIf+WqaT/1O5h4TcRUOZ6dgoCpd8lt29IWl23U=; b=plrAUeOwcrQBr3cR/XuMb
 TxXHUJBeFPWSK9hsNfOqg+lls61MjRB/FulI/qjGYwz869R0AIUUNvQYqYBKRls2
 GbIMq0+6vo+xTwjsjoVIg09hEJ408RO3jA/AH/wMZp0GxpIA2FlvQJxZLHPhkUxg
 lu1sT9Nnq6YyOq4xbVHJ1eZsX4JhlqzQ6dl+2rN2eGmGcX5lP8DC/NWxCNjKo6nA
 qLiYP1lF2WnEHON8lFXGePwWS3UA9pgY76wiLyCU/zZ9hdyEZ+tEc+W+qDLC9QAN
 4TJGEvgBXd+8Iu28lJM9Xu4XaQDehnCaBVIx911nZ75nBFr2cC6y0r/uYVrdJUaB
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=mZpVJFIf+WqaT/1O5h4TcRUOZ6dgoCpd8lt29IWl2
 3U=; b=od78YzunpZ1yS9z5McSbIGw5yP/R+SCH3Nb/k8wkjmq75WqXVZjV8c2R1
 Q+CTY3IFdXG4dScWQ3YYKHa14Be5VdezdJOu/6UR3yUl9rUH6tmgyxuyILqzXrvt
 yTTY3UUGjYux1CjO96yOA0otOS/S/ApYmKq7Iln4S/XbSHe/BxiTj/wS2NdBUrNL
 t0bRuRo88DhvEstA9h1Zckg+TRJsv02pUAWNEVew42HxiK8EPx8AXFoB/cWx+lmj
 bgnTT8AzQTggq+Hc0iR5TCN8OwhpxB1T8Y5GlbefW9UD/JQm/wwWN2c0x5aIkMTx
 GwQqEM3Pbyux0nXzgAr/c2K3pr2bQ==
X-ME-Sender: <xms:2lOPYGghlyFQdWd1IIPlpsXE2_2InxhBwdJh51RnJmc2BI-8Zhs9zw>
 <xme:2lOPYHDFMlmWxVW3K4YFY98oTBV194pXi8pS-dlINSDgh_XOLA4tbp0ydFc40lT5G
 U-ztkUmZ5mdG_IjFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefvddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 nhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecugg
 ftrfgrthhtvghrnhephffgkefhudeghfejudfhtdfguedtfeehjeevteffgeduudetjeei
 jefhheffgfefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdr
 rghu
X-ME-Proxy: <xmx:2lOPYOEIobI6zZxZta8dCeyvvVrLNeXgBauq61Bz9KkfSKMBnTy89w>
 <xmx:2lOPYPRZ2k5WLSdbLQnKO3lxJSSNsoGP1wjZDtU1OgUcZn-i0sta7Q>
 <xmx:2lOPYDxJ_YC5W4IrOrtYYcmO3vLhWwRVIilgFoNTPaubsJYjBTqCBA>
 <xmx:21OPYMovn29muaUN5PAwYU4TcgmOe6C1xkUE-tS5_4KAV8cWWm-6Lg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A8356A00079; Sun,  2 May 2021 21:37:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-403-gbc3c488b23-fm-20210419.005-gbc3c488b
Mime-Version: 1.0
Message-Id: <f7a7b565-72c2-454b-9b8e-789614f66755@www.fastmail.com>
In-Reply-To: <bc91e7df-6ad7-416f-b394-32b1a60facd6@www.fastmail.com>
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <YEKDY6+zfW5Uuqkl@heinlein>
 <dc7eb87e-c13f-dcb7-7b98-dbeb382d7caa@linux.ibm.com>
 <YEZwz6C5uGk8Vobs@heinlein>
 <2b7c9c78-37c5-5964-5f4c-d07fadf3590a@linux.ibm.com>
 <YIwGHYc11MZ6Dxz7@heinlein>
 <4b25d1d9-b4c7-1a58-f0a0-b9fd9cd73fe8@linux.ibm.com>
 <bc91e7df-6ad7-416f-b394-32b1a60facd6@www.fastmail.com>
Date: Mon, 03 May 2021 11:07:08 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>,
 "Patrick Williams" <patrick@stwcx.xyz>
Subject: Re: Request new repo for IBM-specific code: ibm-acf
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 3 May 2021, at 09:16, Andrew Jeffery wrote:
>=20
>=20
> On Sat, 1 May 2021, at 15:00, Joseph Reynolds wrote:
> > On 4/30/21 8:29 AM, Patrick Williams wrote:
> > > On Thu, Apr 29, 2021 at 04:09:58PM -0500, Joseph Reynolds wrote:
> > >  =20
> > >> So ... does the GitHub OpenBMC organization host vendor specific =
repos
> > >> (perhaps github.com/openbmc/ibm-misc), or does the source code go=

> > >> somewhere else (such as IBM's public fork in
> > >> github.com/ibm-openbmc/pam-ibm-acf)?
> > > I'm strongly opposed to dumping-ground repositories like
> > > "<company>-misc".  We approved exactly one of those and the ration=
ale we
> > > were given was they had a bunch of existing code they were going t=
o work
> > > at getting upstreamed, but wanted a place to be able to interact w=
ith
> > > their vendors in the interrim.  We should not be having *new* code=
 going
> > > into that or any other "misc" repository.
> > >
> > > We have generally not wanted OpenBMC-oriented code in non-openbmc-=
org
> > > repositories that are then picked up by openbmc/openbmc recipes.  =
If you
> > > have a generally applicable library that isn't tied to openbmc in =
any
> > > way, or especially one that already has good usage outside of open=
bmc,
> > > then another github org seems reasonable.  That isn't what you hav=
e
> > > here.
> > >
> > > It sounds like you have a good definition here of what you want to=
 do,
> > > so I'm fine with `openbmc/pam-ibm-acf`.  I don't see any reason we=

> > > cannot host `openbmc/<company>-<feature>` repositories for things =
which
> > > are company specific, as long as those repositories are only picke=
d up
> > > by your meta-<company> layer.
> >=20
> > Patrick,
> >=20
> > Thanks.=C2=A0 That works for me.=C2=A0 I propose a new repo ibm-acf =
which will=20
> > have 4 related parts:
> > 1. The Linux-PAM pam_ibmacf module (targeted to run on the BMC)
> > 2. A tool to create and read ACF files (targeted to run on the build=
 host)
> > 3. Common source library for use by the two items above and by the B=
MC's=20
> > function to upload & validate an ACF file.
> > 4. Absolutely minimal test cases and documentation.
>=20
> What? Why? I don't have much context, but I think this needs more just=
ification.

To clarify, "absolutely minimal test cases and documentation" is what I=20=

what I think needs more justification.

Andrew
