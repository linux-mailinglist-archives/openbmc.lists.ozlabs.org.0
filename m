Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC62393A6B
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 02:44:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrmDN5Zrmz2ymb
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 10:44:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bf/GpkFw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=ckimchan17@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bf/GpkFw; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrmD648FBz2xtx
 for <openbmc@lists.ozlabs.org>; Fri, 28 May 2021 10:44:36 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id v13so805781ple.9
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 17:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:date:from:subject:thread-topic:in-reply-to:message-id
 :references:to:cc:content-transfer-encoding;
 bh=RyoTQI5Lkp+nvhBPAd+BwMs/igpgKopsFr8p2EZ1wZ4=;
 b=bf/GpkFw8ivws0mbMrur5r6pzr47kONWr0+CS5Po5TnZCkXaeds474E47d3ywWhxQT
 HrLQRsPlUfUJTtb3kgopGl7NSlQQ6egP/Q5qrHLkhywX9hJLKEptdvmgLES4ulJt9BTR
 rLX/CVc3eK4mBXYnI3LMz5O4T3YHXR80/2Ugu/60i9upUhlhEOfAs1M3D6/Kcvgh8V0v
 SyIDLyTXzRenalgFqo45JOoyocYDs8uOtsL0CkTXoNIB84JdGUBzL/u8XxRl0O8+M9kC
 L9WxQuquS3aj08FbgCHlJm6mPCyMJ4PltS2Zxv8xJEr0mRNKQRGTPW8/ZL/V/9mwhcGq
 IbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:from:subject:thread-topic
 :in-reply-to:message-id:references:to:cc:content-transfer-encoding;
 bh=RyoTQI5Lkp+nvhBPAd+BwMs/igpgKopsFr8p2EZ1wZ4=;
 b=FIGR0vYTjoX66NiAaAumZBTHxQJsJ1ViTgQyL8eDOH6/966o2LBWVvhhT/rvrsSIR3
 b4eKQQrKKJbCQue7nZzU3H/2OnysQEcsgmrIlcIMKSLa7cdaeajzfhEWOP2dWRP4O9EU
 06Am3RCTcOf0USEePicl1VGPGuP9I5Goyt+mnccgST5xM+loyETkDBIN5j51meC+g032
 AWU0YZjf9fCJd8s2ASHuVK4dNofBHiWlAPOuNqczhIUJFIUx+RadSaQX0FpIrJgQxvvo
 eFxq03Hnl5bjBlMLLvl/bXmQMyEQPCcz93cLYboMqULh+efiExhV/sozDkiIgHkwflxb
 9rjA==
X-Gm-Message-State: AOAM532ADidT0j01j9AJ9c5yxFiuKf35XWLwhh7NPLPHqJmig/Dj78qs
 dllzgw9VRNh7Q77w//6t0uI=
X-Google-Smtp-Source: ABdhPJzcYdIB5J/EckTN/PQa5mZlxTW8QazPT3WpWFI1ukkgLnRsxLW2ETp2ot3PzNOOUyogR7Zmzw==
X-Received: by 2002:a17:90a:fa91:: with SMTP id
 cu17mr1320874pjb.178.1622162671755; 
 Thu, 27 May 2021 17:44:31 -0700 (PDT)
Received: from LAPTOP-V32M9UDS (123-194-33-67.dynamic.kbronet.com.tw.
 [123.194.33.67])
 by smtp.gmail.com with ESMTPSA id w15sm2909157pjy.1.2021.05.27.17.44.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 May 2021 17:44:31 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 28 May 2021 08:44:26 +0800
From: "outlook_60A7133428934D5F@outlook.com" <ckimchan17@gmail.com>
Subject: =?utf-8?Q?=E5=9B=9E=E8=A6=86:_How_to_submit_meta_subfolder?=
Thread-Topic: =?utf-8?Q?=E5=9B=9E=E8=A6=86:_How_to_submit_meta_subfolder?=
In-Reply-To: <YK+SUUXRcek2KzBv@heinlein>
Message-ID: <1F0FA512-F228-4B01-B269-02303C2F72E2@hxcore.ol>
References: <fd2a0d0e-988c-8bab-aedd-1253ba7042ef@gmail.com>,
 <YK+SUUXRcek2KzBv@heinlein>
To: Patrick Williams <patrick@stwcx.xyz>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="utf-8"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "jeff9_chan@asrockrack.com" <jeff9_chan@asrockrack.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta ht=
tp-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta name=
=3DGenerator content=3D"Microsoft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3DZH-TW link=3Dblue vlink=3D"#954F72" style=3D=
'word-wrap:break-word'><div class=3DWordSection1><p class=3DMsoNormal><span=
 lang=3DEN-US>Hi Patrick,</span></p><p class=3DMsoNormal><span lang=3DEN-US=
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Thanks for helping on this, I r=
efer to below doc and it said:</span></p><p class=3DMsoNormal><span lang=3D=
EN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nb=
sp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span><span lang=3DEN-US><o:p></o:p></span></p=
><p class=3DMsoNormal><span lang=3DEN-US><a href=3D"https://github.com/open=
bmc/docs/blob/master/CONTRIBUTING.md#submitting-changes-via-gerrit-server-t=
o-openbmc">https://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#subm=
itting-changes-via-gerrit-server-to-openbmc</a><o:p></o:p></span></p><p cla=
ss=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMs=
oNormal><span lang=3DEN-US>Jeff<o:p></o:p></span></p><p class=3DMsoNormal><=
span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><div style=3D'mso-element:par=
a-border-div;border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm 0=
cm 0cm'><p class=3DMsoNormal style=3D'border:none;padding:0cm'><b><span sty=
le=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E5=AF=84=
=E4=BB=B6=E8=80=85</span><span lang=3DEN-US>: </span></b><span lang=3DEN-US=
><a href=3D"mailto:patrick@stwcx.xyz">Patrick Williams</a><br></span><b><sp=
an style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E5=
=82=B3=E9=80=81=E6=99=82=E9=96=93</span><span lang=3DEN-US>: </span></b><sp=
an lang=3DEN-US>2021</span><span style=3D'font-family:"=E6=96=B0=E7=B4=B0=
=E6=98=8E=E9=AB=94",serif'>=E5=B9=B4</span><span lang=3DEN-US>5</span><span=
 style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E6=9C=
=88</span><span lang=3DEN-US>27</span><span style=3D'font-family:"=E6=96=B0=
=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E6=97=A5</span> <span style=3D'font-fa=
mily:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E4=B8=8B=E5=8D=88</span=
><span lang=3DEN-US> 08:36<br></span><b><span style=3D'font-family:"=E6=96=
=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E6=94=B6=E4=BB=B6=E8=80=85</span><s=
pan lang=3DEN-US>: </span></b><span lang=3DEN-US><a href=3D"mailto:ckimchan=
17@gmail.com">Jeff</a><br></span><b><span style=3D'font-family:"=E6=96=B0=
=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E5=89=AF=E6=9C=AC</span><span lang=3DE=
N-US>: </span></b><span lang=3DEN-US><a href=3D"mailto:openbmc@lists.ozlabs=
.org">openbmc@lists.ozlabs.org</a>; <a href=3D"mailto:jeff9_chan@asrockrack=
.com">jeff9_chan@asrockrack.com</a><br></span><b><span style=3D'font-family=
:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E4=B8=BB=E6=97=A8</span><sp=
an lang=3DEN-US>: </span></b><span lang=3DEN-US>Re: How to submit meta subf=
older</span></p></div><p class=3DMsoNormal><span lang=3DEN-US style=3D'font=
-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'><o:p>&nbsp;</o:p></sp=
an></p><p class=3DMsoNormal><span lang=3DEN-US>On Thu, May 27, 2021 at 01:0=
4:37PM +0800, Jeff wrote:</span></p><p class=3DMsoNormal><span lang=3DEN-US=
>&gt; Hi,</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; </span></p=
><p class=3DMsoNormal><span lang=3DEN-US>&gt; We would like to submit meta-=
asrockrack as a sub folder of openbmc.</span></p><p class=3DMsoNormal><span=
 lang=3DEN-US>&gt; </span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; =
I followed the steps describe in the document to add remote server:</span><=
/p><p class=3DMsoNormal><span lang=3DEN-US>&gt;=C2=A0 &nbsp;&nbsp;&nbsp;&nb=
sp; git remote add gerrit ssh://openbmc.gerrit/openbmc/meta-asrockrack</spa=
n></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><=
p class=3DMsoNormal><span lang=3DEN-US>Which document is this?</span></p><p=
 class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-US>Previously you had to request a meta-layer =
repository be created but</span></p><p class=3DMsoNormal><span lang=3DEN-US=
>about 4-6 months ago we moved to a model where all layer code is in the</s=
pan></p><p class=3DMsoNormal><span lang=3DEN-US>single openbmc/openbmc repo=
sitory.=C2=A0 We may have missed a documentation</span></p><p class=3DMsoNo=
rmal><span lang=3DEN-US>update somewhere.</span></p><p class=3DMsoNormal><s=
pan lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lan=
g=3DEN-US>&gt; when I tried to push it I got below error:</span></p><p clas=
s=3DMsoNormal><span lang=3DEN-US>&gt;=C2=A0 &nbsp;&nbsp;&nbsp; fatal: proje=
ct openbmc/mata-asrockrack not found</span></p><p class=3DMsoNormal><span l=
ang=3DEN-US>&gt;=C2=A0 &nbsp;&nbsp;&nbsp; fatal: Could not read from remote=
 repository.</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; </span>=
</p><p class=3DMsoNormal><span lang=3DEN-US>&gt;=C2=A0 &nbsp;&nbsp;&nbsp; P=
lease make sure you have the correct access rights</span></p><p class=3DMso=
Normal><span lang=3DEN-US>&gt;=C2=A0 &nbsp;&nbsp;&nbsp; and the repository =
exists.</span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p>=
</span></p><p class=3DMsoNormal><span lang=3DEN-US>You'll want to set your =
remote to ssh://openbmc.gerrit/openbmc/openbmc</span></p><p class=3DMsoNorm=
al><span lang=3DEN-US>and push there.=C2=A0 Ideally you would have original=
ly cloned from there and</span></p><p class=3DMsoNormal><span lang=3DEN-US>=
done your work on that repository.</span></p><p class=3DMsoNormal><span lan=
g=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-=
US>-- </span></p><p class=3DMsoNormal><span lang=3DEN-US>Patrick Williams</=
span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></=
p></div></body></html>=

