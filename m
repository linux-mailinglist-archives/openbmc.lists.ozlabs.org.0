Return-Path: <openbmc+bounces-700-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F10A9BAFCF7
	for <lists+openbmc@lfdr.de>; Wed, 01 Oct 2025 11:12:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cc8Mk4ZmSz3cdG;
	Wed,  1 Oct 2025 19:12:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759309954;
	cv=none; b=HIN4Zx1FHAmZB+nFl19yQx3OS9Meahpu9uA6Bz92Qcek27ucQ/KYsAvNLQn5cPmtRzRTedsQ4lYHimiip/Z49oE9FrNYaeQtTWf6929axtQAAlSP0jBZqLugY7H/RagrSoFKBAfTeDX04dhs2bURgm5kC0o5YEqOCv6dKjSFCRllZJUhhm74EU0QfOX1z+6Pjl9G2PLYttKIJWvUIhmS71nvsj6JBbF/tHwIm5bDbvWbElooiiq2W1rrrDl8LdXz+INWO64eTaKo7qkZ7saufC9CPzBDZzz5X0M/GcBm4sXs/Y60ko4T06cmPjzI+b8vC95+9p4XKHJWJnmLzBuoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759309954; c=relaxed/relaxed;
	bh=K9bjQR6tgfV+CiTdvZdhEAcGjLH5ULMfaWSB7BUivzk=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=kAzeg09fUy4j1UaGBPTb67hcCywKqkoG2OfebYQYVqZvsFruh6VTxp1oce1uusdSUBS9dal79Z0k7v6gLpojw6Sx53Yrs8NgYwq9y9IHdz4ZgzJfg8FOk8bjHEnQP0KlZhEhA+jrAYLZk5pWEwghtBzzdZYPS3YUJxwQH44PhThA2Ix/qTI8SUJCrSIouzItpC3J6+q1nF5pJ30VHhz0pjBVXSW8iH2XgMHVlQDtdZv4dZaMKSTTG+4gJZj810/yr+FKassURYLbsuz+n1d0KIaBTGgH1QgFno4wXIMLcI3KkUBHZFH9zuxbO+ki0gCB58cEYXnunEiHmpm/4D/TfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=EAcYHOzW; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ocw0k+q2; dkim-atps=neutral; spf=pass (client-ip=103.168.172.146; helo=fout-a3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=EAcYHOzW;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Ocw0k+q2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.146; helo=fout-a3-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cc8Mh1gVvz3cdD
	for <openbmc@lists.ozlabs.org>; Wed,  1 Oct 2025 19:12:31 +1000 (AEST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 39E0EEC0091;
	Wed,  1 Oct 2025 05:12:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 01 Oct 2025 05:12:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759309948;
	 x=1759396348; bh=K9bjQR6tgfV+CiTdvZdhEAcGjLH5ULMfaWSB7BUivzk=; b=
	EAcYHOzWp5xBZlsP68r59vrLelMy8UmoPeoJ0oULT3HDVEsSYakFucI+U6+DZyW8
	pNg/fTmD6guj27A9g7xfyu+lCD2pViab8+z+7642iMouykcrSTJIXFKrXYp+PRd9
	HvW296PpowuASi0xhOPKFTcaCcEI4croac4Z8gxKEr+JQJTRLadWPM/C+PKTeYHJ
	ir5CKmXfM8/qzAKAVOM0Vz+hDCEhajvsTIsrtqX7w6RrBirW1SxYR4WMAYjAqLEr
	25zDZCdjaxnxyX2Tj5GN0lHErdszvjF2ofhU+Tdxi1rco7C1HVkrUlLPTwUHF5da
	qKIY7Kt5gEG1tRfhiD70ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1759309948; x=
	1759396348; bh=K9bjQR6tgfV+CiTdvZdhEAcGjLH5ULMfaWSB7BUivzk=; b=O
	cw0k+q2YqkvU5ZFnnoQbiyhcXO1rc4H4TK+AwF9xEm8sv8vlRgePZi6vgf24UfRq
	6tawCzv8iu/HdO7lN/eYBQ32nX21YQVcOOPivNvYNKphkyJ8q1O0M4DmCv0bstdC
	08Y8JhlrDDeZ0rYtXf/HzjUnXO9DBD8mQ3Z2UkzUPVd4w2njJNdQfKleiFZnrDk3
	qgFOYzySx3pctVP+cZW1mgMg/1EEX8mABc8to3WSiwygx1Fi9AdOASFaBBuYNRRN
	M+kdiQlw4VOBqM9rO1uz5TzRWbus3Smvfm4B6mcy+wVY3/+ew/e7CTpkBew4997h
	8cRvakPOEPeZ66j5iVzjg==
X-ME-Sender: <xms:e_DcaMXMRjtBvcwvkjZqw76kYCnCmiDssfsxdo7NVPn5zq5Aaltarw>
    <xme:e_DcaGnNTU2-l8zEJYCFn1TDRKv3fqL47boTo7A0CteEX5O48JBPy2gOeHQEnuwkA
    AOkQdZIUgMYWOGccNk9M06VefZl1L0Q76uHYk3X24N9-cTvSlptOPo>
X-ME-Received: <xmr:e_DcaODBwW80DjlPUmKTpzMTp-p6qQ4IqWpbNroVrtE3rg8pXNJHqvEiMJlFah96VT3R>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekvdejhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecuqfhnlhihuchonhgvuchprghrthculdehuddmnegfrhhluc
    fvnfffucdlvdefmdenucfjughrpegtgffhggfufffkfhevjgfvofesrgejmherhhdtjeen
    ucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhesshhtfi
    gtgidrgiihiieqnecuggftrfgrthhtvghrnheptedvtdetveehhedvfefhgfelhfevveeh
    heegiedtkefgheduieeigfejudffjefhnecuffhomhgrihhnpehgihhthhhusgdrtghomh
    dptghonhhtrhhisghuthhinhhgrdhmugdpohhpvghnsghmtgdrohhrghenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsth
    iftgigrdighiiipdhnsggprhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehtfihpvghnghehtdeitdeisehgmhgrihhlrdgtohhmpdhrtghpthhtohepoh
    hpvghnsghmtgeslhhishhtshdrohiilhgrsghsrdhorhhg
X-ME-Proxy: <xmx:e_DcaGcVCcxqlKtIGw3s6dt9Fvo0om5MWECBmF8Xhqd_u_sWa9pe8g>
    <xmx:fPDcaJIk0__mIlzSmhwKkt2XzKXHq8TrVayTxa8csSvenfIB7icxIA>
    <xmx:fPDcaJep8Y-CgJkpn072PmjEk0d9-o7gYaO0vj-Kkrxj_4eC0KI9ug>
    <xmx:fPDcaA2SC40C9DD-C_9PabaxDVy2t_m5D2qKAkPHflvYt2OqybDLEg>
    <xmx:fPDcaNk-KG35UqCQtkSTnjIKuXBC0QRnzxiqyxf8-dcBcKw-lO3fhYft>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Oct 2025 05:12:27 -0400 (EDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-FAD7E058-60A0-4DE0-8197-6076275C2DF7
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
Subject: Re: Request for Gerrit account approval
Date: Wed, 1 Oct 2025 05:12:16 -0400
Message-Id: <6C7787FD-F4D6-4131-9775-EC743968BF30@stwcx.xyz>
References: <CANbCeAEeNUsV82ae4AexY-LNAh7UHggaNMQ3+gcguxFY1dq0_A@mail.gmail.com>
Cc: openbmc@lists.ozlabs.org
In-Reply-To: <CANbCeAEeNUsV82ae4AexY-LNAh7UHggaNMQ3+gcguxFY1dq0_A@mail.gmail.com>
To: =?utf-8?B?6ICB6JiH57KJ?= <twpeng50606@gmail.com>
X-Mailer: iPhone Mail (22G100)
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,HTML_MESSAGE,
	MIME_HTML_ONLY,MIME_HTML_ONLY_MULTI,MIME_QP_LONG_LINE,MPART_ALT_DIFF,
	PDS_OTHER_BAD_TLD,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--Apple-Mail-FAD7E058-60A0-4DE0-8197-6076275C2DF7
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hello, Welcome.&nbsp;<div><br></div><div>Pl=
ease see&nbsp;<a href=3D"https://github.com/openbmc/docs/blob/master/CONTRIB=
UTING.md#starting-out">https://github.com/openbmc/docs/blob/master/CONTRIBUT=
ING.md#starting-out</a>&nbsp;. &nbsp;The project requires you to be part of a=
 =E2=80=9CContributor License Agreement=E2=80=9D. If you are doing work on b=
ehalf of your employer, you should get them to fill out a CCLA. If this is a=
 contribution in your own time, entirely unrelated to your employment, you m=
ay fill out an ICLA. &nbsp;Whichever route you go, you can cc this list and t=
he CLA can be processed faster.&nbsp;</div><div><br id=3D"lineBreakAtBeginni=
ngOfSignature"><div dir=3D"ltr"><span style=3D"background-color: rgba(255, 2=
55, 255, 0);">=E2=80=94 Patrick Williams</span></div><div dir=3D"ltr"><br><b=
lockquote type=3D"cite">On Sep 30, 2025, at 8:49=E2=80=AFPM, =E8=80=81=E8=98=
=87=E7=B2=89 &lt;twpeng50606@gmail.com&gt; wrote:<br><br></blockquote></div>=
<blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">Hi Open=
BMC maintainers,<br><br>I recently subscribed to the OpenBMC mailing list an=
d submitted my first patch to Gerrit: &nbsp;<br><a href=3D"https://gerrit.op=
enbmc.org/c/openbmc/phosphor-pid-control/+/84144">https://gerrit.openbmc.org=
/c/openbmc/phosphor-pid-control/+/84144</a><br><br>However, my account (emai=
l: <a href=3D"mailto:twpeng50606@gmail.com">twpeng50606@gmail.com</a>) is cu=
rrently not approved, so CI is not running. &nbsp;<br>Could you please help a=
pprove my Gerrit account so that CI can run and reviewers can proceed? &nbsp=
;<br><br>Thank you very much for your help! &nbsp;<br><br>Best regards, &nbs=
p;<br>YouPeng Wu<br></div>
</div></blockquote></div></body></html>=

--Apple-Mail-FAD7E058-60A0-4DE0-8197-6076275C2DF7--

