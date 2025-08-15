Return-Path: <openbmc+bounces-464-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 454C2B28092
	for <lists+openbmc@lfdr.de>; Fri, 15 Aug 2025 15:25:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3NC60xXYz3cfv;
	Fri, 15 Aug 2025 23:25:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755264322;
	cv=none; b=bAp1+3m20g0WhahPJBU8hw6gYuHibn/pQey492oLexo6JcJH8nwUiOBV02S1aGBRAM/M0fcA0JmSUsittn5URQHHNu7mWFRsxx1bKrwOSIqKKefQ6wKCOs+wnq0UYfw9zGM9s6w3mDcim/AuCMGQe2rcgQjdOck2Q9rlttMDygZXB579GJdC0qEhbg9EBBr6YQ0g339/mHMs99j6C22Rp/hA/J/6PRp85By2FNaSkd34ybZsdk4cgGkG8ee2QFF8/NPFywJex6WszhxDUl5+vfNhMS1xMGR1Sr0uZyHeeDT9uUBMVkKfdAJkroWUv9cIwu+hwqM4Txilo+h2gxoTKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755264322; c=relaxed/relaxed;
	bh=LQCdW4+eDKBB67hsBQjqNcMhDA80yXZ+oDcjhEM81sY=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=TwzVdMHoqcUJS0v3NlA2+1n9bT4yGT1MjrbAdoyvsK/v8Ra8Sq3DV5PytAlrLwxLrzagDBFxMr6+qc4E1SFKb+XPaO9lg91Gv5wfEidVu8yUaMZGYGjoRwtYgcyFb7mZg0D/cFRTYd9Qx57SCtRty39f2b2kY+QKkMJWp3ukjCMpQT7c7IWGxIVUb0+78OJdbY9Fh/dWGwT7otvJCTVzZLHWO0O3se+TaY2Ac3nrG8Bcat1vdgjzBIyCxdOcYEghvZM1mbx4COpwA2b0zH8GHb5tjY7jQyyxXlIPBA3iFvYznwfqVdOrwsFAFnVqqS1e/XcZbnJbcYk44NkBvzs/Ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=PirbIYMS; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=L/ibEqyp; dkim-atps=neutral; spf=pass (client-ip=103.168.172.156; helo=fhigh-a5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=PirbIYMS;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=L/ibEqyp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.156; helo=fhigh-a5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3NC21q4Tz3cbL
	for <openbmc@lists.ozlabs.org>; Fri, 15 Aug 2025 23:25:17 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EBE5F140008E;
	Fri, 15 Aug 2025 09:25:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 15 Aug 2025 09:25:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1755264313;
	 x=1755350713; bh=LQCdW4+eDKBB67hsBQjqNcMhDA80yXZ+oDcjhEM81sY=; b=
	PirbIYMS4B5jNpU7+9OVcm5gFzOJsPBZZMVziOVcSCM4s9Cffp4B/4TzRgkWoYLF
	aKr0XUKcmIqF2jaAWv2g1bxBFuZnJkMSJzJO5almrmEGrZlr+gbpMQxao5Hy44z1
	MSFQGo0zPToq1lngi4ewQasudylG7QauIhIFTBXY5puqJ8TORXgh91mKpihE4hCb
	jiA3sfuyFGT9nKReLdsno1iCQ2f3PfVDY+R+9mgto4V1GOeR43+uVIJBEat/pJ6/
	fmf4ImTeb8r1Vb7YcXYlv6pv58qvcwzMjD8vtY5/7sT9C42JXsrFRWJi6NY7hv6a
	COL+o6ANmxGahi7qJqVNgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755264313; x=
	1755350713; bh=LQCdW4+eDKBB67hsBQjqNcMhDA80yXZ+oDcjhEM81sY=; b=L
	/ibEqyp0lL9ZIGJjFRHP/CGVAE9+3yyRfy6DxXPp1c27Bugz+/E31FFiZ4O4AMm/
	oLQc4R6RyvPKF1zKPuZm20PpfMEZgx6tNRTCl/op/mvlprWbOutnQM17n2yJkfxm
	zvxhFwz1BftwhFfJGUZrPaxWPKIfKDE0KVKUV/FRtaOHG1os++XETbFB+0ur/172
	vURmQorMexW50noVu6+HBr+Qq/WRYXzP4whwxY5StcQKKhmt4bxtttkVuTezKWc8
	3crEdz1xyN4GtkJ5LmGzEDvTwc77Hd/tOpy4UEStuwDD0YIP22+JdDTqktSCFKhg
	sySIlVQrcFVO3TB/QLnSQ==
X-ME-Sender: <xms:OTWfaI_CBOaMn_7ojAgtjz4GQYh8W93yHIFmEcW5KJG-qe3N5hI-bQ>
    <xme:OTWfaA5H8MjGc4h5utMgglWib7JYdrdPPGWlvZMiyZHZ9g79LOh-qBkLA-AwYWT3x
    pZjeVJ2CkTREgY5ZK4>
X-ME-Received: <xmr:OTWfaP0d5zrLtG1pNnHxANpRQ52KaMmVoC7a_AI23XvKNlujo-zjk63gpfL6UBLHe4IQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeegtdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegfrh
    hlucfvnfffucdlfeehmdenucfjughrpegtgffhggfufffkfhevjgfvofesrgejmherhhdt
    jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
    htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepteekheetfffggfevuddvuedvjefg
    leehtdfhvdefjeejffdvheeftdeulefgveetnecuffhomhgrihhnpehnvhhiughirgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
    rghtrhhitghksehsthiftgigrdighiiipdhnsggprhgtphhtthhopedvpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehruhhshhhtohhtohhmsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepohhpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhg
X-ME-Proxy: <xmx:OTWfaHCQW67juGJm9QZLva4eYfCq5glmkd_tFn_LLOl_heKmmuy5fw>
    <xmx:OTWfaB0LmWVJ17W2F52M8BIqUikVcHB7kIFjanARD85HOxhGj4Hi7A>
    <xmx:OTWfaBt8dgIW1LGEvPtLyxCZ9TvWqebEHHkDV9zAVOrTGavNTSO2ag>
    <xmx:OTWfaB4RqQRjsXoyPQ0F07rg-heNGCb4BZau94emROaAd1YlY6hJaQ>
    <xmx:OTWfaK41P2cOScEkFFM2tXUIOd9OW-brQmNJLysa0Eijd9fxOm0D2mq4>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Aug 2025 09:25:12 -0400 (EDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-B8A473B7-8C3B-4C3F-BDC2-3BA524CF7F88
Content-Transfer-Encoding: 7bit
From: Patrick Williams <patrick@stwcx.xyz>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: Modifications in PLDM T5 flow to support SPI staged update
Date: Fri, 15 Aug 2025 09:25:02 -0400
Message-Id: <DC3C6C29-2ABB-4E27-834A-02EBE322B82D@stwcx.xyz>
References: <CADCscQ=9xHFPfoS9BY5Nuib36nQvfcC_jwhmcPRyibgw4_ObXA@mail.gmail.com>
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
In-Reply-To: <CADCscQ=9xHFPfoS9BY5Nuib36nQvfcC_jwhmcPRyibgw4_ObXA@mail.gmail.com>
To: Tom Joseph <rushtotom@gmail.com>
X-Mailer: iPhone Mail (22G86)
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,HTML_MESSAGE,
	MIME_QP_LONG_LINE,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--Apple-Mail-B8A473B7-8C3B-4C3F-BDC2-3BA524CF7F88
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Are there Redfish methods of initiating this now?  I recall a workgroup at O=
CP was trying to get this done there.=20

=E2=80=94 Patrick Williams

> On Aug 15, 2025, at 8:15=E2=80=AFAM, Tom Joseph <rushtotom@gmail.com> wrot=
e:
>=20
> =EF=BB=BF
> Hello All,
>=20
> SPI Staged Update enables pre-downloading firmware component images for su=
pported devices, significantly reducing downtime during firmware updates and=
 activation. This requires devices to support at least two slots =E2=80=94 o=
ne for the running firmware and another for staging the new image.
>=20
> The update process occurs in two iterations:
>=20
> First Iteration:
>=20
> The PLDM UA initiates the PLDM T5 flow with the PLDM FD supporting staged u=
pdates.
>=20
> All stages (Transfer, Verify, Apply) are completed except activation. This=
 is achieved by PLDM UA skipping the PLDM T5 ActivateFirmware command.
>=20
> Upon state machine timeout, the PLDM FD marks the new image as staged (not=
 failed update). Since it=E2=80=99s staged, it remains inactive until explic=
itly activated later.
>=20
> Second Iteration:
>=20
> The same PLDM package is used. Since the image is already staged, the PLDM=
 FD skips most of the Transfer stage, reducing downtime.
>=20
> This iteration is typically scheduled during a maintenance window.
>=20
> Devices that do not support SPI staging are updated in this iteration.
>=20
> All firmware is activated after this iteration.
>=20
> To enable this, we propose introducing a new OEM parameter in the MultiPar=
t API to instruct the PLDM UA to skip sending the ActivateFirmwarecommand, a=
long with necessary PLDM UA modifications to support the SPI staged flow.
>=20
> If there is interest within the OpenBMC community to adopt and collaborate=
 on this feature, please feel free to reach out.
>=20
>=20
> [1] https://docs.nvidia.com/multi-node-nvlink-systems/nvfupd-guide/appendi=
x/spi-staged.html
>=20
> Regards,
> Tom

--Apple-Mail-B8A473B7-8C3B-4C3F-BDC2-3BA524CF7F88
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Are there Redfish methods of initiating thi=
s now? &nbsp;I recall a workgroup at OCP was trying to get this done there.&=
nbsp;<div><br id=3D"lineBreakAtBeginningOfSignature"><div dir=3D"ltr"><span s=
tyle=3D"background-color: rgba(255, 255, 255, 0);">=E2=80=94 Patrick William=
s</span></div><div dir=3D"ltr"><br><blockquote type=3D"cite">On Aug 15, 2025=
, at 8:15=E2=80=AFAM, Tom Joseph &lt;rushtotom@gmail.com&gt; wrote:<br><br><=
/blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div d=
ir=3D"ltr"><div dir=3D"ltr"><div><p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4=
 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong:has(+br)]:pb=
-2" style=3D"box-sizing:border-box;border-width:0px;border-style:solid;margi=
n:1rem 0px 0.5rem;letter-spacing:0.08px"><font face=3D"arial, sans-serif">He=
llo All,</font></p><p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_=
strong:has(+br)]:inline-block gmail-[&amp;_strong:has(+br)]:pb-2" style=3D"b=
ox-sizing:border-box;border-width:0px;border-style:solid;margin:1rem 0px 0.5=
rem;letter-spacing:0.08px"><font face=3D"arial, sans-serif">SPI Staged Updat=
e enables pre-downloading firmware component images for supported devices, s=
ignificantly reducing downtime during firmware updates and activation. This r=
equires devices to support at least two slots =E2=80=94 one for the running f=
irmware and another for staging the new image.</font></p><p class=3D"gmail-m=
y-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&=
amp;_strong:has(+br)]:pb-2" style=3D"box-sizing:border-box;border-width:0px;=
border-style:solid;margin:1rem 0px 0.5rem;letter-spacing:0.08px"><font face=3D=
"arial, sans-serif">The update process occurs in&nbsp;<span style=3D"box-siz=
ing:border-box;border-width:0px;border-style:solid">two iterations</span>:</=
font></p><ol class=3D"gmail-marker:text-quiet gmail-list-decimal" style=3D"b=
ox-sizing:border-box;border-width:0px;border-style:solid;list-style-position=
:initial;margin:0px;padding:0px;letter-spacing:0.08px"><li class=3D"gmail-py=
-0 gmail-my-0 gmail-prose-p:pt-0 gmail-prose-p:mb-2 gmail-prose-p:my-0 gmail=
-[&amp;>p]:pt-0 gmail-[&amp;>p]:mb-2 gmail-[&amp;>p]:my-0" style=3D"box-sizi=
ng:border-box;border-width:0px;border-style:solid;margin-top:0px;margin-bott=
om:0px;padding-top:0px;padding-bottom:0px"><p class=3D"gmail-my-2 gmail-[&am=
p;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong:ha=
s(+br)]:pb-2" style=3D"box-sizing:border-box;border-width:0px;border-style:s=
olid;margin:0px 0px 0.5rem;padding-top:0px"><span style=3D"box-sizing:border=
-box;border-width:0px;border-style:solid"><font face=3D"arial, sans-serif">Fi=
rst Iteration:</font></span></p><ul class=3D"gmail-marker:text-quiet gmail-l=
ist-disc" style=3D"box-sizing:border-box;border-width:0px;border-style:solid=
;list-style:disc;margin:0.75em 0px;padding:0px"><li class=3D"gmail-py-0 gmai=
l-my-0 gmail-prose-p:pt-0 gmail-prose-p:mb-2 gmail-prose-p:my-0 gmail-[&amp;=
>p]:pt-0 gmail-[&amp;>p]:mb-2 gmail-[&amp;>p]:my-0" style=3D"box-sizing:bord=
er-box;border-width:0px;border-style:solid;margin-top:0px;margin-bottom:0px;=
padding-top:0px;padding-bottom:0px"><p class=3D"gmail-my-2 gmail-[&amp;+p]:m=
t-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong:has(+br)]=
:pb-2" style=3D"box-sizing:border-box;border-width:0px;border-style:solid;ma=
rgin:0px 0px 0.5rem;padding-top:0px"><font face=3D"arial, sans-serif">The PL=
DM UA initiates the PLDM T5 flow with the PLDM FD supporting staged updates.=
</font></p></li><li class=3D"gmail-py-0 gmail-my-0 gmail-prose-p:pt-0 gmail-=
prose-p:mb-2 gmail-prose-p:my-0 gmail-[&amp;>p]:pt-0 gmail-[&amp;>p]:mb-2 gm=
ail-[&amp;>p]:my-0" style=3D"box-sizing:border-box;border-width:0px;border-s=
tyle:solid;margin-top:0px;margin-bottom:0px;padding-top:0px;padding-bottom:0=
px"><p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)=
]:inline-block gmail-[&amp;_strong:has(+br)]:pb-2" style=3D"box-sizing:borde=
r-box;border-width:0px;border-style:solid;margin:0px 0px 0.5rem;padding-top:=
0px"><font face=3D"arial, sans-serif">All stages (Transfer, Verify, Apply) a=
re completed&nbsp;<span style=3D"box-sizing:border-box;border-width:0px;bord=
er-style:solid">except</span>&nbsp;activation. This is achieved by PLDM UA s=
kipping the PLDM T5&nbsp;<span style=3D"font-family:monospace;letter-spacing=
:0.08px">ActivateFirmware</span>&nbsp;command.</font></p></li><li class=3D"g=
mail-py-0 gmail-my-0 gmail-prose-p:pt-0 gmail-prose-p:mb-2 gmail-prose-p:my-=
0 gmail-[&amp;>p]:pt-0 gmail-[&amp;>p]:mb-2 gmail-[&amp;>p]:my-0" style=3D"b=
ox-sizing:border-box;border-width:0px;border-style:solid;margin-top:0px;marg=
in-bottom:0px;padding-top:0px;padding-bottom:0px"><p class=3D"gmail-my-2 gma=
il-[&amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_st=
rong:has(+br)]:pb-2" style=3D"box-sizing:border-box;border-width:0px;border-=
style:solid;margin:0px 0px 0.5rem;padding-top:0px"><font face=3D"arial, sans=
-serif">Upon state machine timeout, the PLDM FD marks the new image as&nbsp;=
<em style=3D"box-sizing:border-box;border-width:0px;border-style:solid">stag=
ed</em>&nbsp;(not failed update). Since it=E2=80=99s staged, it remains inac=
tive until explicitly activated later.</font></p></li></ul></li><li class=3D=
"gmail-py-0 gmail-my-0 gmail-prose-p:pt-0 gmail-prose-p:mb-2 gmail-prose-p:m=
y-0 gmail-[&amp;>p]:pt-0 gmail-[&amp;>p]:mb-2 gmail-[&amp;>p]:my-0" style=3D=
"box-sizing:border-box;border-width:0px;border-style:solid;margin-top:0px;ma=
rgin-bottom:0px;padding-top:0px;padding-bottom:0px"><p class=3D"gmail-my-2 g=
mail-[&amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_=
strong:has(+br)]:pb-2" style=3D"box-sizing:border-box;border-width:0px;borde=
r-style:solid;margin:0px 0px 0.5rem;padding-top:0px"><span style=3D"box-sizi=
ng:border-box;border-width:0px;border-style:solid"><font face=3D"arial, sans=
-serif">Second Iteration:</font></span></p><ul class=3D"gmail-marker:text-qu=
iet gmail-list-disc" style=3D"box-sizing:border-box;border-width:0px;border-=
style:solid;list-style:disc;margin:0.75em 0px;padding:0px"><li class=3D"gmai=
l-py-0 gmail-my-0 gmail-prose-p:pt-0 gmail-prose-p:mb-2 gmail-prose-p:my-0 g=
mail-[&amp;>p]:pt-0 gmail-[&amp;>p]:mb-2 gmail-[&amp;>p]:my-0" style=3D"box-=
sizing:border-box;border-width:0px;border-style:solid;margin-top:0px;margin-=
bottom:0px;padding-top:0px;padding-bottom:0px"><p class=3D"gmail-my-2 gmail-=
[&amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_stron=
g:has(+br)]:pb-2" style=3D"box-sizing:border-box;border-width:0px;border-sty=
le:solid;margin:0px 0px 0.5rem;padding-top:0px"><font face=3D"arial, sans-se=
rif">The same PLDM package is used. Since the image is already staged, the P=
LDM FD skips most of the Transfer stage, reducing downtime.</font></p></li><=
li class=3D"gmail-py-0 gmail-my-0 gmail-prose-p:pt-0 gmail-prose-p:mb-2 gmai=
l-prose-p:my-0 gmail-[&amp;>p]:pt-0 gmail-[&amp;>p]:mb-2 gmail-[&amp;>p]:my-=
0" style=3D"box-sizing:border-box;border-width:0px;border-style:solid;margin=
-top:0px;margin-bottom:0px;padding-top:0px;padding-bottom:0px"><p class=3D"g=
mail-my-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block gm=
ail-[&amp;_strong:has(+br)]:pb-2" style=3D"box-sizing:border-box;border-widt=
h:0px;border-style:solid;margin:0px 0px 0.5rem;padding-top:0px"><font face=3D=
"arial, sans-serif">This iteration is typically scheduled during a maintenan=
ce window.</font></p></li><li class=3D"gmail-py-0 gmail-my-0 gmail-prose-p:p=
t-0 gmail-prose-p:mb-2 gmail-prose-p:my-0 gmail-[&amp;>p]:pt-0 gmail-[&amp;>=
p]:mb-2 gmail-[&amp;>p]:my-0" style=3D"box-sizing:border-box;border-width:0p=
x;border-style:solid;margin-top:0px;margin-bottom:0px;padding-top:0px;paddin=
g-bottom:0px"><p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_stron=
g:has(+br)]:inline-block gmail-[&amp;_strong:has(+br)]:pb-2" style=3D"box-si=
zing:border-box;border-width:0px;border-style:solid;margin:0px 0px 0.5rem;pa=
dding-top:0px"><font face=3D"arial, sans-serif">Devices that do not support S=
PI staging are updated in this iteration.</font></p></li><li class=3D"gmail-=
py-0 gmail-my-0 gmail-prose-p:pt-0 gmail-prose-p:mb-2 gmail-prose-p:my-0 gma=
il-[&amp;>p]:pt-0 gmail-[&amp;>p]:mb-2 gmail-[&amp;>p]:my-0" style=3D"box-si=
zing:border-box;border-width:0px;border-style:solid;margin-top:0px;margin-bo=
ttom:0px;padding-top:0px;padding-bottom:0px"><p class=3D"gmail-my-2 gmail-[&=
amp;+p]:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong:=
has(+br)]:pb-2" style=3D"box-sizing:border-box;border-width:0px;border-style=
:solid;margin:0px 0px 0.5rem;padding-top:0px"><font face=3D"arial, sans-seri=
f">All firmware is activated after this iteration.</font></p></li></ul></li>=
</ol><p class=3D"gmail-my-2 gmail-[&amp;+p]:mt-4 gmail-[&amp;_strong:has(+br=
)]:inline-block gmail-[&amp;_strong:has(+br)]:pb-2" style=3D"box-sizing:bord=
er-box;border-width:0px;border-style:solid;margin:0.5rem 0px;letter-spacing:=
0.08px"><font face=3D"arial, sans-serif">To enable this, we propose introduc=
ing a&nbsp;<span style=3D"box-sizing:border-box;border-width:0px;border-styl=
e:solid">new OEM parameter</span>&nbsp;in the MultiPart API to instruct the P=
LDM UA to skip sending the&nbsp;<code style=3D"box-sizing:border-box;border-=
width:0px;border-style:solid;font-feature-settings:normal;background-color:r=
gba(0,0,0,0);border-radius:0.3125rem;padding:0px 4px;font-synthesis:none">Ac=
tivateFirmware</code>command, along with necessary PLDM UA modifications to s=
upport the SPI staged flow.</font></p><p class=3D"gmail-my-2 gmail-[&amp;+p]=
:mt-4 gmail-[&amp;_strong:has(+br)]:inline-block gmail-[&amp;_strong:has(+br=
)]:pb-2" style=3D"box-sizing:border-box;border-width:0px;border-style:solid;=
margin:1rem 0px 0.5rem;letter-spacing:0.08px"><font face=3D"arial, sans-seri=
f" style=3D"">If there is interest within the OpenBMC community to adopt and=
 collaborate on this feature, please feel free to reach out.<br><br></font><=
/p></div><div><font face=3D"arial, sans-serif"><span style=3D"color:rgb(26,2=
6,26)">[1]&nbsp;</span><a href=3D"https://docs.nvidia.com/multi-node-nvlink-=
systems/nvfupd-guide/appendix/spi-staged.html">https://docs.nvidia.com/multi=
-node-nvlink-systems/nvfupd-guide/appendix/spi-staged.html</a></font></div><=
div><br></div><div>Regards,</div><div>Tom</div></div>
</div>
</div></blockquote></div></body></html>=

--Apple-Mail-B8A473B7-8C3B-4C3F-BDC2-3BA524CF7F88--

