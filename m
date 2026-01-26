Return-Path: <openbmc+bounces-1275-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF4BJnVCd2mMdQEAu9opvQ
	(envelope-from <openbmc+bounces-1275-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 26 Jan 2026 11:31:17 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE3586F52
	for <lists+openbmc@lfdr.de>; Mon, 26 Jan 2026 11:31:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f04ZT5WW9z2xqD;
	Mon, 26 Jan 2026 21:31:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769423473;
	cv=none; b=JbMgek22tZeITlvGPMxfHLI8iXbt/PNMPYaYBi1YllCHgdzzdRKtoa2tHbC3QWi9OblbUbRU9uldAbvOOBUVEOFKacSYmaTUQZWULity6RXG6g6r0Tuoe8WapdeFIjDAMAg7qnFxiUYWpA8JrCC5TqOwMHrKxBiklWpYQovDCcVq0yms9QHBe79U5dDVCaLitYnAEGYDZ05GbsUCSi5B7I/4UB8gLWC0bKFji6wbaLmZBJ86MI03rAq40RLyseZM3Dc27Ujih76jcrQsVrGifaRXP2nvYhsEMpV5NXhMDYXKmzUPQZN3agpLcO5CHgXGVRDrZZdRh3iOkYqtd9LOzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769423473; c=relaxed/relaxed;
	bh=ygNdzeJ1y8PAdT7itvFJy1Pyza1Ip9hWFDRQeNs6ZFg=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=QjMoBsadPVqvYNy8XxqQ48yUN1GLglOWf0rUUZL7etqrRjwD6L86p8wY5iwDVWRbeoCi16+oxEsTyv0rVQwetSzDrDSv4LQG3Kq1eqONcT+45RVdQHsmk17Ezdya8eIACWccQSbsuEkfCP5udika76bZEHLg/5MXknBPdZd2qzlhFeaxHpstZGPYZ4fAIOysIO8SrALqXb75BBdAnQH4j4gGiPW2NtHtKHVk6NYnJ1kpIuk8WoZApBDsrOjClgXPkhQynmL9n8dWHfE/cLw+R+KEo0H0SEhMhZY9C0oYCU64Dxs8acai+OKbyhm9+NmR315nr29Xy2N19o9kZ/T0HQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=MQII9YV1; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Lt9uzyd2; dkim-atps=neutral; spf=pass (client-ip=202.12.124.146; helo=fout-b3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=MQII9YV1;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Lt9uzyd2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=202.12.124.146; helo=fout-b3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 448 seconds by postgrey-1.37 at boromir; Mon, 26 Jan 2026 21:31:09 AEDT
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f04ZP5hJ8z2xpk
	for <openbmc@lists.ozlabs.org>; Mon, 26 Jan 2026 21:31:09 +1100 (AEDT)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id F27921D0007E;
	Mon, 26 Jan 2026 05:23:37 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Mon, 26 Jan 2026 05:23:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1769423017;
	 x=1769509417; bh=ygNdzeJ1y8PAdT7itvFJy1Pyza1Ip9hWFDRQeNs6ZFg=; b=
	MQII9YV141EHJXG/o8GTej0vAYYm8iOR3AJt5YtlYc7uRaW3KPmDvNmXQ5kxMYl5
	XddrEQgtObcaYTs3/2xw+LHKqHBUX/2o+btdRzk0VeuWPPJBQWlK5L1pM0Xwn3p9
	VDM0CMMxSlrSCzdIC1kp/hgPXAUgbUX9ssh+/vU4zsjz3l4zDSdqc/Dxn3jwOhU1
	LtHn9Gy4XgF6FO+wMme0WaDeQ4ZMQsGB/KLApgOnLwgATIVIiRxXu5SNQM0BTfBy
	z6kr3QUd6jYIz+N3AWmBap4pU9YP8btd3yvRpiSaNmtQS4chhS95K/YxAn0ovuxh
	F/Yu0/ClXD7g5f9FE2xfSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769423017; x=
	1769509417; bh=ygNdzeJ1y8PAdT7itvFJy1Pyza1Ip9hWFDRQeNs6ZFg=; b=L
	t9uzyd21bLUMy4Hqim0Zn1Rzu9jlkhZiHFd1S0GyctxEYuOMKM+euFvgaVQ3UMue
	fhYNc6E0N/Qh/kLKZBF5iB29MigpPHC0PF9e9okzYAglBI9PIYQWWhfDhp8Jj+nl
	HLyAEkkCS1rkDYC1jRolaYcry5Kv4uSl3r69aDcsvKpwmncShUtVkuf5V68PNQZf
	BrKxfFY2ydPV0wsb10j6YI70uy/iXIJswdOjO4Ykn2GxrOoZlfeBo4KBWZBKN56W
	+/3pNEs8OrPXStw5p5Dv9x3Enlp0DR1UD58/xDqplKO9ugJptlm5n345+/c7dtKr
	r/p6YmWEIqS+5Zy7Jq5nA==
X-ME-Sender: <xms:qUB3aSUdVOsse0NLZ_rtIlZPUCxeaxPWxxODSeXT4sUegCA1dqZ31A>
    <xme:qUB3aWCe7Wrp8_QhdKxIuh1g9pqRxIvqBm9CRF-hs5rRn1JPXtfDWoqtvxQMwCyuL
    NsEwPXlAbhj_2H6TGGFRZVXTb-7YbpRDYq2Fzt03sqRLfNsjkl3yrs>
X-ME-Received: <xmr:qUB3aTy3dHhlLesTptKkBaOgifPFaUkfPFeNjHq5DWKN7ZcJ4hCqETLbpbXVDOWTL7C4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheejgedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnegouf
    hushhpvggtthffohhmrghinhculdegledmnegfrhhlucfvnfffucdlfeehmdenucfjughr
    pegtgffhggfufffkfhevjgfvofesrgejmherhhdtjeenucfhrhhomheprfgrthhrihgtkh
    cuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecuggftrfgr
    thhtvghrnhepveekfeeuhfejueektdfhteffhfffteetveekjeeiffffuefghfdtfffgje
    ekteffnecuffhomhgrihhnpehgohhoghhlvgdrtghomhenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighi
    iipdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehm
    rghnrghgvghrsehlfhhprhhojhgvtghtshdrohhrghdprhgtphhtthhopehophgvnhgsmh
    gtsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehgrghrhigsvghihhhl
    sehmihgtrhhoshhofhhtrdgtohhm
X-ME-Proxy: <xmx:qUB3aTBwbAKCzCHEBU7Sbxc3shTA7JdmW7edFYugY-w5676m8mBnPQ>
    <xmx:qUB3aQZgmOvjyt_qVrtHW-8X7F0bGsrfQePWZVZCzAWk0Tb-Mk0mCQ>
    <xmx:qUB3abjHP_pl1w4UkY6ZaEU4yntKL7Kb3-Cr7T5dX3nKs1K03jgJ6w>
    <xmx:qUB3aS5jCvZbz-hCuBaGQuLOfjCgd8E-fEDlJIgk5UbfAYBmygR8Kw>
    <xmx:qUB3ac-N-25GeCyg0VsX4kUse_5d6EWN22bvEP-PI0DWx-b5aJo5Kl6M>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jan 2026 05:23:37 -0500 (EST)
Content-Type: multipart/alternative; boundary=Apple-Mail-53DC1E61-6E15-40B0-86FB-64F7D42C1DB1
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
Subject: Re: Request for addition to Microsoft CCLA for OpenBMC
Date: Mon, 26 Jan 2026 05:23:26 -0500
Message-Id: <B1923028-D885-4AD4-A1C9-CF6BD90B9D70@stwcx.xyz>
References: <SA6PR21MB44617BF0999CA8D83524DF83A693A@SA6PR21MB4461.namprd21.prod.outlook.com>
Cc: openbmc@lists.ozlabs.org, manager@lfprojects.org
In-Reply-To: <SA6PR21MB44617BF0999CA8D83524DF83A693A@SA6PR21MB4461.namprd21.prod.outlook.com>
To: Gary Beihl <garybeihl@microsoft.com>
X-Mailer: iPhone Mail (23C55)
X-Spam-Status: No, score=1.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,HTML_MESSAGE,
	MIME_QP_LONG_LINE,PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.70 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[stwcx.xyz:s=fm1,messagingengine.com:s=fm2];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[stwcx.xyz];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1275-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[stwcx.xyz:+,messagingengine.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[patrick@stwcx.xyz,openbmc@lists.ozlabs.org];
	APPLE_IOS_MAILER_COMMON(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim]
X-Rspamd-Queue-Id: 6AE3586F52
X-Rspamd-Action: no action


--Apple-Mail-53DC1E61-6E15-40B0-86FB-64F7D42C1DB1
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Gary,

One of the CLA managers from Microsoft will need to submit a new version of t=
he contributor list. See this folder for contacts: https://drive.google.com/=
drive/u/0/mobile/folders/1Ooi0RdTcaOWF1DWFJUAJDdN7tRKde7Nl/1VJbxFhwUEY96jCmz=
BkzkXFMJ0yRQw9wS?sort=3D13&direction=3Da

=E2=80=94 Patrick Williams

> On Jan 25, 2026, at 8:36=E2=80=AFPM, Gary Beihl <garybeihl@microsoft.com> w=
rote:
>=20
> =EF=BB=BF
> Hello,
> =20
> I am a Microsoft employee contributing to the OpenBMC project and would li=
ke to confirm my inclusion under Microsoft=E2=80=99s Corporate Contributor L=
icense Agreement (CCLA) with the Linux Foundation/OpenBMC.
> =20
> Please add me to the authorized contributor list for Microsoft=E2=80=99s C=
CLA.
> =20
> Details:
> - Full Name: Gary Beihl
> - Microsoft Email: garybeihl@microsoft.com
> - GitHub Username: garybeihl
> =20
> Microsoft has an active CCLA with OpenBMC, and I am requesting to be added=
 as an approved contributor under that agreement.
> =20
> Please let me know if you need any additional information or steps from my=
 side.
> =20
> Thank you for your assistance.
> =20
> Best regards,=20
> Gary Beihl
> =20

--Apple-Mail-53DC1E61-6E15-40B0-86FB-64F7D42C1DB1
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html class=3D"apple-mail-supports-explicit-dark-mode"><head><meta http-equi=
v=3D"content-type" content=3D"text/html; charset=3Dutf-8"></head><body dir=3D=
"auto">Hi Gary,<div><br></div><div>One of the CLA managers from Microsoft wi=
ll need to submit a new version of the contributor list. See this folder for=
 contacts:&nbsp;<a href=3D"https://drive.google.com/drive/u/0/mobile/folders=
/1Ooi0RdTcaOWF1DWFJUAJDdN7tRKde7Nl/1VJbxFhwUEY96jCmzBkzkXFMJ0yRQw9wS?sort=3D=
13&amp;direction=3Da">https://drive.google.com/drive/u/0/mobile/folders/1Ooi=
0RdTcaOWF1DWFJUAJDdN7tRKde7Nl/1VJbxFhwUEY96jCmzBkzkXFMJ0yRQw9wS?sort=3D13&am=
p;direction=3Da</a></div><div><br id=3D"lineBreakAtBeginningOfSignature"><di=
v dir=3D"ltr"><span style=3D"background-color: rgba(255, 255, 255, 0);">=E2=80=
=94 Patrick Williams</span></div><div dir=3D"ltr"><br><blockquote type=3D"ci=
te">On Jan 25, 2026, at 8:36=E2=80=AFPM, Gary Beihl &lt;garybeihl@microsoft.=
com&gt; wrote:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D=
"ltr">=EF=BB=BF

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">=

<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style>@font-face { font-family: "Cambria Math"; }
@font-face { font-family: Aptos; }
p.MsoNormal, li.MsoNormal, div.MsoNormal { margin: 0in; font-size: 12pt; fon=
t-family: Aptos, sans-serif; }
span.EmailStyle17 { font-family: Aptos, sans-serif; color: windowtext; }
.MsoChpDefault { }
@page WordSection1 { size: 8.5in 11in; margin: 1in; }
div.WordSection1 { page: WordSection1; }</style>


<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hello,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I am a Microsoft emp=
loyee contributing to the OpenBMC project and would like to confirm my inclu=
sion under Microsoft=E2=80=99s Corporate Contributor License Agreement (CCLA=
) with the Linux Foundation/OpenBMC.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Please add me to the=
 authorized contributor list for Microsoft=E2=80=99s CCLA.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Details:<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- Full Name: Gary Be=
ihl<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- Microsoft Email: g=
arybeihl@microsoft.com<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">- GitHub Username: g=
arybeihl<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Microsoft has an act=
ive CCLA with OpenBMC, and I am requesting to be added as an approved contri=
butor under that agreement.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Please let me know i=
f you need any additional information or steps from my side.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Thank you for your a=
ssistance.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Best regards,&nbsp; <=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Gary Beihl<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></s=
pan></p>
</div>


</div></blockquote></div></body></html>=

--Apple-Mail-53DC1E61-6E15-40B0-86FB-64F7D42C1DB1--

