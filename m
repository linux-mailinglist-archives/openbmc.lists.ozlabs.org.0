Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53445169711
	for <lists+openbmc@lfdr.de>; Sun, 23 Feb 2020 10:46:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QL1Z0R9FzDqYV
	for <lists+openbmc@lfdr.de>; Sun, 23 Feb 2020 20:46:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=ckimchan17@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pExSn0b3; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48QL0w1k33zDqWN
 for <openbmc@lists.ozlabs.org>; Sun, 23 Feb 2020 20:45:48 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id t6so2757089plj.5
 for <openbmc@lists.ozlabs.org>; Sun, 23 Feb 2020 01:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:date:from:subject:thread-topic:to:cc
 :content-transfer-encoding;
 bh=O02l9RRZG9ZK6Bg60dl5Fyj2svR9J0ML5r6Uq0tuMCE=;
 b=pExSn0b37gZdpr/7+VtKsW7G73na/SFshOUcf67ZWFS/RE+8yetHY89imHb/ud3Xah
 AzazelfNBpIFy3ZOKG8EMuRBA2mQu75kZub/l6ypPI1MxwBm+8DAm15pJSZQLjyyYu2A
 XVO2J67PZijN/J8Y8L1UiphsxDy7jiRz5vUKI9n/FSyxTWHo8pmZqgSBd4D6vAccrrkp
 NJVsYzOsN75tPzT0jADRJLUb3L6wTM0+OXpq+hpxx4Hj3IF6CNR5xQgj9/NpZGcBSfqt
 oVrE9F7sA1B71SvZ9pp+f56xrbucfURRLzJKLB3rMssdiYErZ5QzE57VeE4NF+5UvQuk
 w8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:date:from:subject
 :thread-topic:to:cc:content-transfer-encoding;
 bh=O02l9RRZG9ZK6Bg60dl5Fyj2svR9J0ML5r6Uq0tuMCE=;
 b=HgbYcG9L0MkSjefSylpMnrw8jFHoecBOGTUyi4f+1uIqkRqI0TtdkuaO7N8Zfm4xzz
 h03Ew+1bjD3S+F85eoNmZx3hpuQsMm4DH4UjCfq+dmzNjaLeOExQmJxB4fgMpDqm+bzy
 /C94Zgat9w1NEEDQdM3yB3ZGxz3wDa+eYXnz6cIr0WIVWhAlbSdH9v1nRiRKdgShm8MR
 abE9V3Wb0JySy4FzvwpEw1sRxwa2cpeQs9Q+WmrGdknaKRNV2A7+uSywVPFEoWO18INi
 4ogjq1x3aVQyaDrTBXEjedyRYwtjw95SX3DCD+0TpRKbeoKZnbzi+7lIs7utBIGNQ8BN
 OZ0g==
X-Gm-Message-State: APjAAAW2QxyCXa2HriZLhCLJV57uHb14uNcVMACiNbi+SXh7sHwBV8wy
 qVNOSqmcLXpVQY3MV5tJhxU=
X-Google-Smtp-Source: APXvYqybpMmrzT35dnqPeHNZSLD/MqYgC3zeBbZwaUfaTgFeJZG7RL8xWRIFCZocLbKMvJUTCRvyaA==
X-Received: by 2002:a17:90a:8a98:: with SMTP id
 x24mr14350046pjn.113.1582451145440; 
 Sun, 23 Feb 2020 01:45:45 -0800 (PST)
Received: from smtp.gmail.com (180-177-28-13.dynamic.kbronet.com.tw.
 [180.177.28.13])
 by smtp.gmail.com with ESMTPSA id y10sm8762841pfq.110.2020.02.23.01.45.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 Feb 2020 01:45:44 -0800 (PST)
Message-ID: <5e5249c8.1c69fb81.2f4cd.9202@mx.google.com>
MIME-Version: 1.0
Date: Sun, 23 Feb 2020 17:45:40 +0800
From: =?utf-8?Q?=E9=99=B3=EF=BC=8C=E6=9D=BE=E5=84=89?= <ckimchan17@gmail.com>
Subject: =?utf-8?Q?=E5=9B=9E=E8=A6=86:_Re:_=E5=9B=9E=E8=A6=86=EF=BC=9Askeleton?=
Thread-Topic: =?utf-8?Q?=E5=9B=9E=E8=A6=86:_Re:_=E5=9B=9E=E8=A6=86=EF=BC=9Askeleton?=
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:24.0pt;
	margin-bottom:.0001pt;
	mso-para-margin-top:0cm;
	mso-para-margin-right:0cm;
	mso-para-margin-bottom:0cm;
	mso-para-margin-left:2.0gd;
	mso-para-margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:2140564079;
	mso-list-type:hybrid;
	mso-list-template-ids:-15441016 -1 67698713 67698715 67698703 67698713 676=
98715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%2\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:48.0pt;
	text-indent:-24.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:72.0pt;
	text-indent:-24.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:96.0pt;
	text-indent:-24.0pt;}
@list l0:level5
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%5\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:120.0pt;
	text-indent:-24.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:144.0pt;
	text-indent:-24.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-24.0pt;}
@list l0:level8
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%8\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:192.0pt;
	text-indent:-24.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:216.0pt;
	text-indent:-24.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style></head><body lang=3DZH-TW link=3Dblue vlink=3D"#954F72"><div cla=
ss=3DWordSection1><p class=3DMsoNormal><span lang=3DEN-US>Hi Brad,</span></=
p><p class=3DMsoNormal><span lang=3DEN-US>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 I=E2=80=99m new to openbmc, now I can boot openbmc on MB with AST=
2500.</span></p><p class=3DMsoNormal><span lang=3DEN-US>What I=E2=80=99m tr=
ying to achieve are:</span></p><ol style=3D'margin-top:0cm' start=3D1 type=
=3D1><li class=3DMsoListParagraph style=3D'margin-left:-18.0pt;mso-para-mar=
gin-left:0gd;mso-list:l0 level1 lfo1'><span lang=3DEN-US>Power control.</sp=
an><span lang=3DEN-US><o:p></o:p></span></li><li class=3DMsoListParagraph s=
tyle=3D'margin-left:-18.0pt;mso-para-margin-left:0gd;mso-list:l0 level1 lfo=
1'><span lang=3DEN-US>Update BMC firmware.</span><span lang=3DEN-US><o:p></=
o:p></span></li><li class=3DMsoListParagraph style=3D'margin-left:-18.0pt;m=
so-para-margin-left:0gd;mso-list:l0 level1 lfo1'><span lang=3DEN-US>Sensors=
 monitoring.</span><span lang=3DEN-US><o:p></o:p></span></li></ol><p class=
=3DMsoListParagraph style=3D'margin-left:18.0pt;mso-para-margin-left:0gd'><=
span lang=3DEN-US>Thanks for your suggestion in advance.</span></p><p class=
=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoN=
ormal><span lang=3DEN-US>Jeff</span></p><p class=3DMsoNormal><span lang=3DE=
N-US style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'><o:=
p>&nbsp;</o:p></span></p><div style=3D'mso-element:para-border-div;border:n=
one;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm'><p class=3DMs=
oNormal style=3D'border:none;padding:0cm'><b><span style=3D'font-family:"=
=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E5=AF=84=E4=BB=B6=E8=80=85</s=
pan><span lang=3DEN-US>: </span></b><span lang=3DEN-US><a href=3D"mailto:br=
adleyb@fuzziesquirrel.com">Brad Bishop</a><br></span><b><span style=3D'font=
-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E5=82=B3=E9=80=81=E6=
=99=82=E9=96=93</span><span lang=3DEN-US>: </span></b><span lang=3DEN-US>20=
20</span><span style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",=
serif'>=E5=B9=B4</span><span lang=3DEN-US>2</span><span style=3D'font-famil=
y:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E6=9C=88</span><span lang=
=3DEN-US>21</span><span style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=
=E9=AB=94",serif'>=E6=97=A5</span> <span style=3D'font-family:"=E6=96=B0=E7=
=B4=B0=E6=98=8E=E9=AB=94",serif'>=E4=B8=8A=E5=8D=88</span><span lang=3DEN-U=
S> 01:02<br></span><b><span style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=
=8E=E9=AB=94",serif'>=E6=94=B6=E4=BB=B6=E8=80=85</span><span lang=3DEN-US>:=
 </span></b><span lang=3DEN-US><a href=3D"mailto:ckimchan17@gmail.com">=E2=
=80=AA=E2=80=AA=E2=80=AA=E2=80=AAJeff Chan</a><br></span><b><span style=3D'=
font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E5=89=AF=E6=9C=
=AC</span><span lang=3DEN-US>: </span></b><span lang=3DEN-US><a href=3D"mai=
lto:openbmc@lists.ozlabs.org">OpenBMC Maillist</a><br></span><b><span style=
=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E4=B8=BB=E6=
=97=A8</span><span lang=3DEN-US>: </span></b><span lang=3DEN-US>Re: </span>=
<span style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=
=E5=9B=9E=E8=A6=86=EF=BC=9A</span><span lang=3DEN-US>skeleton</span></p></d=
iv><p class=3DMsoNormal><span lang=3DEN-US style=3D'font-family:"=E6=96=B0=
=E7=B4=B0=E6=98=8E=E9=AB=94",serif'><o:p>&nbsp;</o:p></span></p><p class=3D=
MsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNorm=
al><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><spa=
n lang=3DEN-US>&gt; On Feb 19, 2020, at 8:06 PM, =E2=80=AA=E2=80=AA=E2=80=
=AA=E2=80=AAJeff Chan &lt;ckimchan17@gmail.com&gt; wrote:</span></p><p clas=
s=3DMsoNormal><span lang=3DEN-US>&gt; </span></p><p class=3DMsoNormal><span=
 lang=3DEN-US>&gt; Hi Brad,</span></p><p class=3DMsoNormal><span lang=3DEN-=
US>&gt; Thanks for reply, I checked=C2=A0 github.com/openbmc/skeleton, most=
 of them released 2 years ago, and the title said &quot;will be replaced...=
&quot;, is it still good to adopt it? </span></p><p class=3DMsoNormal><span=
 lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span lang=
=3DEN-US>No I would not recommend that.=C2=A0 Skeleton covers a lot of BMC =
functions - which one in particular are you interested in?</span></p><p cla=
ss=3DMsoNormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p><p class=3DMs=
oNormal><span lang=3DEN-US>&gt; </span></p><p class=3DMsoNormal><span lang=
=3DEN-US>&gt; Jeff</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; <=
/span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; </span></p><p class=
=3DMsoNormal><span lang=3DEN-US>&gt; -------- </span><span style=3D'font-fa=
mily:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E5=8E=9F=E5=A7=8B=E9=83=
=B5=E4=BB=B6</span><span lang=3DEN-US> --------</span></p><p class=3DMsoNor=
mal><span lang=3DEN-US>&gt; </span><span style=3D'font-family:"=E6=96=B0=E7=
=B4=B0=E6=98=8E=E9=AB=94",serif'>=E5=AF=84=E4=BB=B6=E8=80=85=EF=BC=9A</span=
><span lang=3DEN-US> Brad Bishop &lt;bradleyb@fuzziesquirrel.com&gt;</span>=
</p><p class=3DMsoNormal><span lang=3DEN-US>&gt; </span><span style=3D'font=
-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E6=97=A5=E6=9C=9F=EF=
=BC=9A</span><span lang=3DEN-US> 2020</span><span style=3D'font-family:"=E6=
=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E5=B9=B4</span><span lang=3DEN-U=
S>2</span><span style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94"=
,serif'>=E6=9C=88</span><span lang=3DEN-US>14</span><span style=3D'font-fam=
ily:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E6=97=A5</span> <span st=
yle=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=E9=80=B1=
=E4=BA=94</span><span lang=3DEN-US> 02:39</span></p><p class=3DMsoNormal><s=
pan lang=3DEN-US>&gt; </span><span style=3D'font-family:"=E6=96=B0=E7=B4=B0=
=E6=98=8E=E9=AB=94",serif'>=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=9A</span><span=
 lang=3DEN-US> =E2=80=AA=E2=80=AA=E2=80=AA=E2=80=AAJeff Chan &lt;ckimchan17=
@gmail.com&gt;</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; </spa=
n><span style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=AB=94",serif'>=
=E5=89=AF=E6=9C=AC=EF=BC=9A</span><span lang=3DEN-US> OpenBMC Maillist &lt;=
openbmc@lists.ozlabs.org&gt;</span></p><p class=3DMsoNormal><span lang=3DEN=
-US>&gt; </span><span style=3D'font-family:"=E6=96=B0=E7=B4=B0=E6=98=8E=E9=
=AB=94",serif'>=E4=B8=BB=E6=97=A8=EF=BC=9A</span><span lang=3DEN-US> Re: sk=
eleton</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; </span></p><p=
 class=3DMsoNormal><span lang=3DEN-US>&gt; </span></p><p class=3DMsoNormal>=
<span lang=3DEN-US>&gt; &gt; On Feb 11, 2020, at 6:29 AM, =E2=80=AA=E2=80=
=AA=E2=80=AA=E2=80=AAJeff Chan &lt;ckimchan17@gmail.com&gt; wrote:</span></=
p><p class=3DMsoNormal><span lang=3DEN-US>&gt; &gt; </span></p><p class=3DM=
soNormal><span lang=3DEN-US>&gt; &gt; Hi,</span></p><p class=3DMsoNormal><s=
pan lang=3DEN-US>&gt; &gt; As the description in skeleton github, it will b=
e replaced with proper implementation, what's the up to date implementation=
? where can I find those docs or samples?</span></p><p class=3DMsoNormal><s=
pan lang=3DEN-US>&gt; &gt; </span></p><p class=3DMsoNormal><span lang=3DEN-=
US>&gt; &gt; Jeff</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; </=
span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; Hi Jeff</span></p><p =
class=3DMsoNormal><span lang=3DEN-US>&gt; </span></p><p class=3DMsoNormal><=
span lang=3DEN-US>&gt; Most of skeleton has been rewritten.=C2=A0 skeleton =
covers a lot of BMC functions - which one in particular are you interested =
in?</span></p><p class=3DMsoNormal><span lang=3DEN-US>&gt; </span></p><p cl=
ass=3DMsoNormal><span lang=3DEN-US>&gt; thx -brad</span></p><p class=3DMsoN=
ormal><span lang=3DEN-US><o:p>&nbsp;</o:p></span></p></div></body></html>=

