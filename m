Return-Path: <openbmc+bounces-1289-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBceLhGDeWmexQEAu9opvQ
	(envelope-from <openbmc+bounces-1289-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 28 Jan 2026 04:31:29 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5399CB3F
	for <lists+openbmc@lfdr.de>; Wed, 28 Jan 2026 04:31:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f17992VgRz2xT6;
	Wed, 28 Jan 2026 14:31:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769571085;
	cv=none; b=CcsQ7IhaVJSsn01fot/7HDGWjnriTjeddPLaxyeUEellZriuhM11p28guZXyIq2jqx+5u6c4EZySJXwSekVJye4p+FYOhJ2HGSdUNJTXnORbEJ+i4jdLJN2iBAEcLSUZYYxfIxGJdkrbM/GjYPBrn8iv9J2Sye1pN49npJ+NgT6HigDgeJfBij7B4JE51lMGPuht+dN16vODOB4XKtc576epQyBUWhzrEYJzxop88Czv+ghTXxFmRhQzIPxAjjS/24leLmefbE8VPFGEi5DWM4cjr8TUg4/ttLHQgNibpMzzD4dHe+4+KkglHYjBy7//pC1j+m1N06qU95Q/8v7stg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769571085; c=relaxed/relaxed;
	bh=U6VKrY9l+UeLGDIJtF04k5MU3v07+f6V3Au3Tw9XSJo=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=m4eRQeW/xdP++Xk9b50X+z0IU1BUIwd/JoP0hhld70wwSHjYes/PEVAsM9IZ3qdU52z21BNfvAT4C4aQLOOrEyscGpdi7fHafvYeVGHLN66ySx1Mc8AXIDeUchSgsTHvSTUD1cuNKDdVPd1n2Gym0sFanGJ0gvISXIiMTcy6BQHs1/fOzfr3b2VpLb5Vl1VGodkJNvzNK0xDYZRPojoR3UbanTVSTlL6CapafpJ1A5+GxEeyxnpTbDmrGlEBS/3zt+etVmS0ZQpxeZzPm1HOhakG8mrOOQ84zYPpdHCJiRmNu+YiP4nGGmBWxIN5ZoLcs7Ao+IWh+P+RrHqBbwmHxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz; dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=jdcY5Iyg; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DOCqRlMS; dkim-atps=neutral; spf=pass (client-ip=103.168.172.148; helo=fout-a5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org) smtp.mailfrom=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=jdcY5Iyg;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=DOCqRlMS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.148; helo=fout-a5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 336 seconds by postgrey-1.37 at boromir; Wed, 28 Jan 2026 14:31:21 AEDT
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f17954LmFz2xHt
	for <openbmc@lists.ozlabs.org>; Wed, 28 Jan 2026 14:31:21 +1100 (AEDT)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id DE5BEEC02AA;
	Tue, 27 Jan 2026 22:25:41 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 27 Jan 2026 22:25:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1769570741;
	 x=1769657141; bh=U6VKrY9l+UeLGDIJtF04k5MU3v07+f6V3Au3Tw9XSJo=; b=
	jdcY5Iygl7HocWUMYqfgEMzRwnSzjScI/5fJhv7+CKncomNbx4fMzNyXwxXrPAle
	9LIjJpARR/Aaz2EhQtcNmrmFwq1EegMg7xbLtnOb22DFPyBcpR05TCotFoDKn6eh
	UtA+1k/0pTDm28nBKXnSHX+LZwjE1WrRJJz+rHDmiG5Ct/hDCzuR0NQ4qWZT4SPo
	k2mqyE43J2S8AFpuBGXNBFWfd3Mk+0st6XiES5Hsk3T/AXRJ8PkszyhfgomGbKst
	4xFS+/6xRwJCq01vKjhvIGXueLGjQxnALbK4evgKSv1XEy1xk+5VwMNypjUpfuxi
	wuHn0L73K5elu8Mt3QFNfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1769570741; x=
	1769657141; bh=U6VKrY9l+UeLGDIJtF04k5MU3v07+f6V3Au3Tw9XSJo=; b=D
	OCqRlMS5zOR6RBMwO00L0g3QWCm52yfoIwC4rT8btK4KqzGVtzUwLhhuYzUhZBK2
	JOjxem5FtTcrT6+055hMsyuXOAVj+VnKTNlJ4pDOaYEPNXeUH/o0XO2NrNmb9OTT
	X+054anhqPrTcyRc/iTFDEQ675+gj2WxSUB0p//HHIJJT1E8wYzd3vXqwxUB6Se5
	k2b557tZecIhqk3asOJJfrYB3J0ODsCyC7OyGyIjIbqcHfIGsd+atTMPMuB71xdg
	UJPMUs4Ti1e5Q4ca8oJgnpRdKPnWURSDKK+aSWAZnqEnpbzpUMRnilbrDBx9cjol
	vDIDe6UCpjwPxNcuwGJDg==
X-ME-Sender: <xms:tIF5aaGY4aF3PGWpj-XO6yUkY5NX5UVXKHkzQ4weYY9yLxSXBBqSkQ>
    <xme:tIF5aSyabKD05IkMyXPiD_aKcP2jagluBuozcRcGDe40fDhprwE5Mwv4uxVJ9gnze
    zTeNt6Y_LPwEgcCP4PohGcZdpeXE6d15FqI3NXkLorqATMvj5lQYw>
X-ME-Received: <xmr:tIF5aRg1z13p-h7j-vF-uYAL12C0rqthc3VpuCmFnaJuh9ZFHpXlEPxczte_fmn96dY1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedvvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnefqnh
    hlhicuohhnvgcuphgrrhhtucdlhedumdenfghrlhcuvffnffculddvfedmnecujfgurhep
    tgfghfggufffkfhfvegjvffosegrjehmrehhtdejnecuhfhrohhmpefrrghtrhhitghkuc
    ghihhllhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrght
    thgvrhhnpeehhfetieeihfffjefgvefhueeuhfejudekkedtveeutdeikeekfeefledttd
    fgffenucffohhmrghinhepohhpvghnsghmtgdrohhrghenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghtrhhitghksehsthiftgigrdighi
    iipdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeho
    phgvnhgsmhgtsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtthhopehnrghthh
    grnhdrjhhirghnjeesghhmrghilhdrtghomhdprhgtphhtthhopehgvghishhsohhnrght
    ohhrsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:tIF5adyu18W8wN3OekmnAmvmZ7BT3nNMGXhqi3Wmufpql3v3Zxb3bQ>
    <xmx:tIF5aUKXIGmIozlo5UiYaTW58VpEmeJDuEfdz4PiHQc9arXKIHQo3g>
    <xmx:tIF5aUQ0L8KSnNu-ZGo05Iwbdl-7JXUseOgIuzJQ9VBPfcvkaXPOJg>
    <xmx:tIF5acpikasOtqUtdwuupwnRh2zXVhfiERna38HEtbahcarhGCl3VA>
    <xmx:tYF5aaoVV93gXupnbf_vYGQdlodG1DHxLg1dZUrsavNq_BaHmjKwMQPw>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Jan 2026 22:25:40 -0500 (EST)
Content-Type: multipart/alternative; boundary=Apple-Mail-73AC95FB-4929-4EAD-9DA2-E51AE39CCAA2
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
Date: Tue, 27 Jan 2026 22:25:29 -0500
Message-Id: <5DF62D20-B18A-454B-B91D-BEE5E6184D04@stwcx.xyz>
References: <CAAFL+NN255PQWamHJn8QtZrqdE4HwWY8EwoyUfqsR8iLUqkGeQ@mail.gmail.com>
Cc: Andrew Geissler <geissonator@gmail.com>, openbmc@lists.ozlabs.org
In-Reply-To: <CAAFL+NN255PQWamHJn8QtZrqdE4HwWY8EwoyUfqsR8iLUqkGeQ@mail.gmail.com>
To: Nathan Jian <nathan.jian7@gmail.com>
X-Mailer: iPhone Mail (23C55)
X-Spam-Status: No, score=2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,HTML_MESSAGE,
	MIME_HTML_ONLY,MIME_HTML_ONLY_MULTI,MPART_ALT_DIFF,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.50 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	URI_COUNT_ODD(1.00)[3];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[stwcx.xyz:s=fm1,messagingengine.com:s=fm2];
	MIME_HTML_ONLY(0.20)[];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geissonator@gmail.com,m:openbmc@lists.ozlabs.org,m:nathan.jian7@gmail.com,m:nathanjian7@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-1289-lists,openbmc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:~];
	DMARC_NA(0.00)[stwcx.xyz];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER(0.00)[patrick@stwcx.xyz,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrick@stwcx.xyz,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[stwcx.xyz:+,messagingengine.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	APPLE_IOS_MAILER_COMMON(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: EB5399CB3F
X-Rspamd-Action: no action


--Apple-Mail-73AC95FB-4929-4EAD-9DA2-E51AE39CCAA2
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html class=3D"apple-mail-supports-explicit-dark-mode"><head><meta http-equi=
v=3D"content-type" content=3D"text/html; charset=3Dutf-8"></head><body dir=3D=
"auto">Hi Nathan,<div><br></div><div>If you are currently working for Quanta=
, you must be covered by their Corporate CLA and not an Individual one. &nbs=
p;Thank you for looking into this.&nbsp;</div><div><br id=3D"lineBreakAtBegi=
nningOfSignature"><div dir=3D"ltr"><span style=3D"background-color: rgba(255=
, 255, 255, 0);">=E2=80=94 Patrick Williams</span></div><div dir=3D"ltr"><br=
><blockquote type=3D"cite">On Jan 27, 2026, at 5:46=E2=80=AFPM, Nathan Jian &=
lt;nathan.jian7@gmail.com&gt; wrote:<br><br></blockquote></div><blockquote t=
ype=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div><div style=3D"font-size:inherit"=
 dir=3D"auto">Hi Andrew,</div><div style=3D"font-size:inherit" dir=3D"auto">=
<br style=3D"font-size:inherit">I am currently employed by Quanta Computer.<=
br style=3D"font-size:inherit">I need to verify with my management regarding=
 our internal process and whether I should contribute under an existing Corp=
orate CLA instead of the Individual CLA I previously submitted.</div><div st=
yle=3D"font-size:inherit" dir=3D"auto"><br style=3D"font-size:inherit">Could=
 you please put my Individual CLA application on hold for now? I will get ba=
ck to you as soon as I have confirmed the correct procedure with my employer=
.</div><div style=3D"font-size:inherit" dir=3D"auto"><br style=3D"font-size:=
inherit">Thanks,<br style=3D"font-size:inherit">Qi-Han Jian</div><br></div><=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Andrew Geissler &lt;<a href=3D"mailto:geissonator@gmail.c=
om">geissonator@gmail.com</a>&gt;=E6=96=BC 2026=E5=B9=B41=E6=9C=8822=E6=97=A5=
 =E9=80=B1=E5=9B=9B=EF=BC=8C=E4=B8=8B=E5=8D=889:49=E5=AF=AB=E9=81=93=EF=BC=9A=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;padding-left:1ex;border-left=
-color:rgb(204,204,204)">On Wed, Jan 21, 2026 at 4:06=E2=80=AFPM Nathan Jian=
 &lt;<a href=3D"mailto:nathan.jian7@gmail.com" target=3D"_blank">nathan.jian=
7@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I'm a new contributor and just submitted my first change:<br>
&gt; <a href=3D"https://gerrit.openbmc.org/c/openbmc/x86-power-control/+/867=
39" rel=3D"noreferrer" target=3D"_blank">https://gerrit.openbmc.org/c/openbm=
c/x86-power-control/+/86739</a><br>
&gt;<br>
&gt; I received "User not approved, see admin, no CI" message.<br>
&gt;<br>
&gt; Could an admin please approve my account?<br>
<br>
Hi Nathan, I manage the CLA's for the project and one must be filed<br>
and approved to be added to the gerrit CI approval group. If you sent<br>
it to the linux foundation email then it usually takes a week or two<br>
to make it to me.<br>
<br>
If you prefer, you can send the signed CLA directly to me. Please note<br>
that if it is an individual CLA then we need confirmation that you are<br>
not employed by any company with an interest in OpenBMC. If you are<br>
employed by a company with an interest in OpenBMC then you must work<br>
with them to get a corporate CLA.<br>
<br>
Andrew<br>
<br>
&gt;<br>
&gt; Username: nathanjian7<br>
&gt;<br>
&gt; Thanks!<br>
</blockquote></div></div>
</div></blockquote></div></body></html>=

--Apple-Mail-73AC95FB-4929-4EAD-9DA2-E51AE39CCAA2--

