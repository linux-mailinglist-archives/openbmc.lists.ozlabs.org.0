Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1846393A75
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 02:49:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrmL55y11z304T
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 10:49:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XquQeist;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=ckimchan17@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XquQeist; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrmKm6W0Vz2xtx
 for <openbmc@lists.ozlabs.org>; Fri, 28 May 2021 10:49:32 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id x188so1956488pfd.7
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 17:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:date:from:subject:thread-topic:in-reply-to:message-id
 :references:to:cc:content-transfer-encoding;
 bh=+uIT7P3MMlHODVWDDfrfM2ShyGC1P6Sha2PVmsaaHZI=;
 b=XquQeistYykcZ5W+krM4BTHIr1HdjvrCapofc0tpbv0KgrpWM448/OldwWb72Xj4O3
 W1zZWF7sggyQ/tf045hro31dQDjm8lhsJifowkMGHSwhODvz+opyz3+6icEI/7Bs/O4X
 RoPhI59mO+66yRhwhD7eHS41OC3jTAWM0bwX1ZjC4rzL+muOvMIpr/OvD3mWxEVnsfg5
 bD/LRG338lBPa6j1voxuXk7jdQlTbc/zUocr/xpS5hOtpaANnmKWzvN4Wjawpx3tl8+H
 pTox8p/H0oJozyeDEWOPzP6HNhvYcbjI2bH5HJHlgAH3dHL2+gKjVVodQs8QLxHHwap5
 njcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:from:subject:thread-topic
 :in-reply-to:message-id:references:to:cc:content-transfer-encoding;
 bh=+uIT7P3MMlHODVWDDfrfM2ShyGC1P6Sha2PVmsaaHZI=;
 b=EuS3P01s/i1ql5EVIGbnbJyTGjyTVVTntfC9FlYnmNABE4XlX2++9W+RVdmzGSai1D
 X5VjN5Evf7UOajVxhulQ2ufJHJj7c50bZ+NoeA9aikpSZkJvnKBaiTsUFCMFSoRIrT32
 rGQ57jnY6x2n3w42cxzjRCx3RBw8J9wKJZhOFPfXXzz1YTa2EP++OxiyG6X0ps4Joj9w
 kQ94lyMBiNNbnT/xfho1lUzhbhfre1ilGQy1H934YwQoPUTMtIoZZRChw+wVYrbjJwGY
 W6Ivf2Gcn7uhFLXfIrNFM/4icThQlY6/mYJHBQqtkTq9Jlgr4gNtMdT/lkg36Qem1Rr8
 1QrQ==
X-Gm-Message-State: AOAM532zyXAIriX5Z/hThI82XsnzoqS+CEmtWXOqQhmOhMF1UofFDDC0
 RSmIP90elz7542fdn76iV5c=
X-Google-Smtp-Source: ABdhPJxiflbgJYb0ti5V0ovzqzC/+E4uqUpAlCpKgh16RjU5ZblBOzrHzyDaxjo6THAH0iNU34L5DA==
X-Received: by 2002:a65:640f:: with SMTP id a15mr6246093pgv.251.1622162969483; 
 Thu, 27 May 2021 17:49:29 -0700 (PDT)
Received: from LAPTOP-V32M9UDS ([123.194.33.67])
 by smtp.gmail.com with ESMTPSA id q24sm2711340pgb.19.2021.05.27.17.49.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 May 2021 17:49:29 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 28 May 2021 08:49:22 +0800
From: "outlook_60A7133428934D5F@outlook.com" <ckimchan17@gmail.com>
Subject: =?utf-8?Q?=E5=9B=9E=E8=A6=86:_How_to_submit_meta_subfolder?=
Thread-Topic: =?utf-8?Q?=E5=9B=9E=E8=A6=86:_How_to_submit_meta_subfolder?=
In-Reply-To: <YK+SUUXRcek2KzBv@heinlein>
Message-ID: <DE99272B-68FA-4E37-9804-05EACE890184@hxcore.ol>
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
	{font-family:MingLiU;
	panose-1:2 2 5 9 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:MingLiU;
	panose-1:2 1 6 9 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
code
	{mso-style-priority:99;
	font-family:MingLiU;}
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
>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Thanks for helping, I checked b=
elow document and it said:</span></p><p class=3DMsoNormal><span lang=3DEN-U=
S><o:p>&nbsp;</o:p></span></p><div><p style=3D'mso-margin-top-alt:0cm;margi=
n-right:0cm;margin-bottom:12.0pt;margin-left:0cm;background:white'><span la=
ng=3DEN-US style=3D'font-family:"Segoe UI",sans-serif;color:#24292E'>From y=
our OpenBMC git repository, add a remote to the Gerrit server, where 'openb=
mc_repo' is the current git repository you're working on, such as phosphor-=
state-manager, and 'openbmc.gerrit' is the name of the Host previously adde=
d:<o:p></o:p></span></p><p style=3D'margin:0cm;background:white;box-sizing:=
 border-box;font-variant-ligatures: normal;font-variant-caps: normal;orphan=
s: 2;text-align:start;widows: 2;-webkit-text-stroke-width: 0px;text-decorat=
ion-thickness: initial;text-decoration-style: initial;text-decoration-color=
: initial;word-spacing:0px'><code><span lang=3DEN-US style=3D'font-size:10.=
0pt;font-family:Consolas;color:#24292E'>git remote add gerrit ssh://openbmc=
.gerrit/openbmc/openbmc_repo</span></code><span lang=3DEN-US style=3D'font-=
family:"Segoe UI",sans-serif;color:#24292E'><o:p></o:p></span></p></div><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoN=
ormal><span lang=3DEN-US><a href=3D"https://github.com/openbmc/docs/blob/ma=
ster/CONTRIBUTING.md#submitting-changes-via-gerrit-server-to-openbmc">https=
://github.com/openbmc/docs/blob/master/CONTRIBUTING.md#submitting-changes-v=
ia-gerrit-server-to-openbmc</a><o:p></o:p></span></p><p class=3DMsoNormal><=
span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span la=
ng=3DEN-US>should I use below command to create meta layer?<o:p></o:p></spa=
n></p><p style=3D'margin:0cm;background:white'><code><span lang=3DEN-US sty=
le=3D'font-size:10.0pt;font-family:Consolas;color:#24292E'>git remote add g=
errit ssh://openbmc.gerrit/openbmc/openbmc/meta-asrockrack</span></code><sp=
an lang=3DEN-US style=3D'font-family:"Segoe UI",sans-serif;color:#24292E'><=
o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o=
:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Jeff<o:p></o:p></span=
></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><d=
iv style=3D'mso-element:para-border-div;border:none;border-top:solid #E1E1E=
1 1.0pt;padding:3.0pt 0cm 0cm 0cm'><p class=3DMsoNormal style=3D'border:non=
e;padding:0cm'><b><span style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=
=E9=AB=94",serif'>=E5=AF=84=E4=BB=B6=E8=80=85</span><span lang=3DEN-US>: </=
span></b><span lang=3DEN-US><a href=3D"mailto:patrick@stwcx.xyz">Patrick Wi=
lliams</a><br></span><b><span style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=
=98=8E=E9=AB=94",serif'>=E5=82=B3=E9=80=81=E6=99=82=E9=96=93</span><span la=
ng=3DEN-US>: </span></b><span lang=3DEN-US>2021</span><span style=3D'font-f=
amily:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E5=B9=B4</span><span l=
ang=3DEN-US>5</span><span style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=
=E9=AB=94",serif'>=E6=9C=88</span><span lang=3DEN-US>27</span><span style=
=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E6=97=A5</sp=
an> <span style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif=
'>=E4=B8=8B=E5=8D=88</span><span lang=3DEN-US> 08:36<br></span><b><span sty=
le=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E6=94=B6=
=E4=BB=B6=E8=80=85</span><span lang=3DEN-US>: </span></b><span lang=3DEN-US=
><a href=3D"mailto:ckimchan17@gmail.com">Jeff</a><br></span><b><span style=
=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E5=89=AF=E6=
=9C=AC</span><span lang=3DEN-US>: </span></b><span lang=3DEN-US><a href=3D"=
mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>; <a href=3D"m=
ailto:jeff9_chan@asrockrack.com">jeff9_chan@asrockrack.com</a><br></span><b=
><span style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=
=E4=B8=BB=E6=97=A8</span><span lang=3DEN-US>: </span></b><span lang=3DEN-US=
>Re: How to submit meta subfolder</span></p></div><p class=3DMsoNormal><spa=
n lang=3DEN-US style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",=
serif'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>=
On Thu, May 27, 2021 at 01:04:37PM +0800, Jeff wrote:</span></p><p class=3D=
MsoNormal><span lang=3DEN-US>&gt; Hi,</span></p><p class=3DMsoNormal><span =
lang=3DEN-US>&gt; </span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; W=
e would like to submit meta-asrockrack as a sub folder of openbmc.</span></=
p><p class=3DMsoNormal><span lang=3DEN-US>&gt; </span></p><p class=3DMsoNor=
mal><span lang=3DEN-US>&gt; I followed the steps describe in the document t=
o add remote server:</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;=
=C2=A0 &nbsp;&nbsp;&nbsp;&nbsp; git remote add gerrit ssh://openbmc.gerrit/=
openbmc/meta-asrockrack</span></p><p class=3DMsoNormal><span lang=3DEN-US><=
o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Which do=
cument is this?</span></p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbs=
p;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-US>Previously you h=
ad to request a meta-layer repository be created but</span></p><p class=3DM=
soNormal><span lang=3DEN-US>about 4-6 months ago we moved to a model where =
all layer code is in the</span></p><p class=3DMsoNormal><span lang=3DEN-US>=
single openbmc/openbmc repository.=C2=A0 We may have missed a documentation=
</span></p><p class=3DMsoNormal><span lang=3DEN-US>update somewhere.</span>=
</p><p class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p =
class=3DMsoNormal><span lang=3DEN-US>&gt; when I tried to push it I got bel=
ow error:</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;=C2=A0 &nbs=
p;&nbsp;&nbsp; fatal: project openbmc/mata-asrockrack not found</span></p><=
p class=3DMsoNormal><span lang=3DEN-US>&gt;=C2=A0 &nbsp;&nbsp;&nbsp; fatal:=
 Could not read from remote repository.</span></p><p class=3DMsoNormal><spa=
n lang=3DEN-US>&gt; </span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;=
=C2=A0 &nbsp;&nbsp;&nbsp; Please make sure you have the correct access righ=
ts</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt;=C2=A0 &nbsp;&nbsp=
;&nbsp; and the repository exists.</span></p><p class=3DMsoNormal><span lan=
g=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=3DEN-=
US>You'll want to set your remote to ssh://openbmc.gerrit/openbmc/openbmc</=
span></p><p class=3DMsoNormal><span lang=3DEN-US>and push there.=C2=A0 Idea=
lly you would have originally cloned from there and</span></p><p class=3DMs=
oNormal><span lang=3DEN-US>done your work on that repository.</span></p><p =
class=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=
=3DMsoNormal><span lang=3DEN-US>-- </span></p><p class=3DMsoNormal><span la=
ng=3DEN-US>Patrick Williams</span></p><p class=3DMsoNormal><span lang=3DEN-=
US><o:p>&nbsp;</o:p></span></p></div></body></html>=

