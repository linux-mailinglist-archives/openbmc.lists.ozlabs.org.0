Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4320A8C1A28
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2024 02:02:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=26XDpRvn;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=W5ve9Vjg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vb8FS5Wsbz3c5Y
	for <lists+openbmc@lfdr.de>; Fri, 10 May 2024 10:02:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm2 header.b=26XDpRvn;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=W5ve9Vjg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=stwcx.xyz (client-ip=103.168.172.149; helo=fout6-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz; receiver=lists.ozlabs.org)
X-Greylist: delayed 392 seconds by postgrey-1.37 at boromir; Fri, 10 May 2024 10:01:28 AEST
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vb8Dm696gz3c4v
	for <openbmc@lists.ozlabs.org>; Fri, 10 May 2024 10:01:27 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailfout.nyi.internal (Postfix) with ESMTP id 4162213800F3;
	Thu,  9 May 2024 19:54:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 09 May 2024 19:54:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1715298890;
	 x=1715385290; bh=FYUOpP0lpTEeBFtYcrVerAoh9WPy9keJ3dM0h32v6mA=; b=
	26XDpRvnO8496cJpi3I9625DanyTqMEyTeyszHr1QuAkGExADeosPh7FhuSGGlnY
	6kLfdlBl1yQ/uzZGHh6xFKEeMmP4mWqDDzyYkTBQM4o9SkcIc7yM+ChdsO8JbjtA
	zaii7GOoI7naDmPJ0wZazjgXCY62UauMQm2bJt5eWg9NZv7GkF/vBpS1FLK1ggte
	hNZzbwi2mQkxQZFCHBXzrtsgSISeFLX//TUIRcaqwhTluNDzAakSv+QhDHWqCi0q
	82UEeQztDW7N/biR0i4latHJtvtVilh+Qbvw4bAtg1WTwDP29X3H+XE7Aw9R62IR
	yALBrOBmiFDSLkskTOqnUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1715298890; x=
	1715385290; bh=FYUOpP0lpTEeBFtYcrVerAoh9WPy9keJ3dM0h32v6mA=; b=W
	5ve9VjgBZ0PPynRIOBa7FnwsSF3kdJ59IsrL6JTIbyXLfdR2Hr5hRZfGQshnFxH1
	89xHncf7tPwybYj6lyQyezI2I00UWzD3CloMYzLCN7l+62o9b+0hx0g/JaPS8E+p
	u5MaIlRuycBETbzR//NHjMmnr6G7zssmCZBypF7xcvyYqiScEy8nerF+JT+hVcah
	5vZFC/c6nGnxpqLPt3ZQxd5o7aP9NcH1l+EAP/MZ1PoV2uNVmk3WwmaipM/ksyv3
	kErpoHU5+AJ1Znlup/MjPX0KaNoEt79CY0dxrhZDWvQLHmby6zr3VrCv5RjlgvFD
	Pr3rDDRmQxDDVKaH9ZnnA==
X-ME-Sender: <xms:SWI9ZiqQwEYEanLxe7qi5wn8viBV2V6G8SRUJJvvuqQtQ3QgnY9EWw>
    <xme:SWI9Zgo6MbxSGtLIP1AaIwmZLSvQNatsU3uE8d3toq1K4B0PEeP7Upk9wuxw_bq-V
    CHHwhZGOoNXsasmPzw>
X-ME-Received: <xmr:SWI9ZnMKs3-wAQxvNvc9vt2rtO0_rGJRgwgYqD-eBV72Ogvv4h1BuuqAAlQim1C4YRIJFEE0Fml1daELRp8KRRixPpmuz0Lg8UoCk1NJdEd7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeffedgvdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdlvdefmdenucfjughrpegtgffhggfufffkfhevjgfvofesrgejmher
    hhdtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkh
    esshhtfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepheduheetgeeiudelvdfhtdeg
    ueefuefgjeeggedvhedvgedvtdefveelhfeutddvnecuffhomhgrihhnpegumhhtfhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
    rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:SWI9Zh4xhtt5OA4l8q9Gh23VxATAifusWveIiDUqwwW2LuiF2WWS2w>
    <xmx:SWI9Zh6iL5DB6IDQkYRwJHvCbbeWWCIf_qBcFz9gLdRuYwY1fayMWQ>
    <xmx:SWI9ZhiXfSgjIGRK9H4S_7t3Zj-eCle6mBm4n_f7hn6PjB3BqPkhzg>
    <xmx:SWI9Zr529p9A7mfM5SVS-bKAjhIneErFs-06pM3VfXv7SNSkkrMoqQ>
    <xmx:SmI9ZhGV9fgj_mS-7i5a9Tt3TiXOKrNbqzSBPYhOJm2X6Y4YcISmYKGh>
Feedback-ID: i68a1478a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 May 2024 19:54:49 -0400 (EDT)
Content-Type: multipart/alternative; boundary=Apple-Mail-CDB08349-268C-47FC-A0E4-2CEAE4B7616C
Content-Transfer-Encoding: 7bit
From: Patrick Williams <patrick@stwcx.xyz>
Mime-Version: 1.0 (1.0)
Subject: Re: Information about CXL
Date: Thu, 9 May 2024 18:54:38 -0500
Message-Id: <B03AB93A-A912-4997-AA6C-4E3C49B05CDC@stwcx.xyz>
References: <BN8PR04MB5906892BD5B7DD9A26AEB15594E62@BN8PR04MB5906.namprd04.prod.outlook.com>
In-Reply-To: <BN8PR04MB5906892BD5B7DD9A26AEB15594E62@BN8PR04MB5906.namprd04.prod.outlook.com>
To: "Ananth, Rajesh" <rajesh.ananth@smartm.com>
X-Mailer: iPhone Mail (21E236)
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--Apple-Mail-CDB08349-268C-47FC-A0E4-2CEAE4B7616C
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

=46rom what I've seen, the BMC would interact with a CXL using MCTP and not P=
CIe. See https://www.dmtf.org/sites/default/files/standards/documents/DSP028=
1_1.0.0_0.pdf
---
Patrick Williams

> On May 9, 2024, at 4:58=E2=80=AFPM, Ananth, Rajesh <rajesh.ananth@smartm.c=
om> wrote:
>=20
> =EF=BB=BF
> Hi,
> =20
> We are in the process of developing OpenBMC based firmware update mechanis=
m for the PCI-e based CXL controllers. The CXL controllers typically expose t=
heir interfaces as a memory mapped mailbox in the PCI-e space.
> =20
> Basic things we are looking forward to implement are (depends on the feasi=
bility here):
> 1.       Probe the PCI-e config space to locate our controller  (using PCI=
 VID/DID)
> 2.       Probe the PCI-e config space to access the memory mapped register=
s
> 3.       Use the mapped registers to send commands and update the firmware=

> =20
> We would like to have some pointers on how to proceed (sample code/develop=
ment docs etc.,). We are initially targeting s2600wf board as our target.
> =20
> Thanks,
> Rajesh
> =20
> =20

--Apple-Mail-CDB08349-268C-47FC-A0E4-2CEAE4B7616C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">=46rom what I've seen, the BMC would intera=
ct with a CXL using MCTP and not PCIe. See&nbsp;<a href=3D"https://www.dmtf.=
org/sites/default/files/standards/documents/DSP0281_1.0.0_0.pdf">https://www=
.dmtf.org/sites/default/files/standards/documents/DSP0281_1.0.0_0.pdf</a><br=
 id=3D"lineBreakAtBeginningOfSignature"><div dir=3D"ltr">---<div>Patrick Wil=
liams</div></div><div dir=3D"ltr"><br><blockquote type=3D"cite">On May 9, 20=
24, at 4:58=E2=80=AFPM, Ananth, Rajesh &lt;rajesh.ananth@smartm.com&gt; wrot=
e:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=
=BF

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">=

<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style>@font-face { font-family: "Cambria Math"; }
@font-face { font-family: Calibri; }
p.MsoNormal, li.MsoNormal, div.MsoNormal { margin: 0in 0in 0.0001pt; font-si=
ze: 11pt; font-family: Calibri, sans-serif; }
a:link, span.MsoHyperlink { color: rgb(5, 99, 193); text-decoration: underli=
ne; }
a:visited, span.MsoHyperlinkFollowed { color: rgb(149, 79, 114); text-decora=
tion: underline; }
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph { margin: 0in 0=
in 0.0001pt 0.5in; font-size: 11pt; font-family: Calibri, sans-serif; }
span.EmailStyle17 { font-family: Calibri, sans-serif; color: windowtext; }
.MsoChpDefault { font-family: Calibri, sans-serif; }
@page WordSection1 { size: 8.5in 11in; margin: 1in; }
div.WordSection1 { page: WordSection1; }
ol { margin-bottom: 0in; }
ul { margin-bottom: 0in; }</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->


<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are in the process of developing OpenBMC based fir=
mware update mechanism for the PCI-e based CXL controllers. The CXL controll=
ers typically expose their interfaces as a memory mapped mailbox in the PCI-=
e space.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Basic things we are looking forward to implement are (=
depends on the feasibility here):<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level1=
 lfo1"><!--[if !supportLists]--><span style=3D"mso-list:Ignore">1.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><!--[endif]-->Probe the PCI-e config space to locate our contr=
oller&nbsp; (using PCI VID/DID)<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level1=
 lfo1"><!--[if !supportLists]--><span style=3D"mso-list:Ignore">2.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><!--[endif]-->Probe the PCI-e config space to access the memor=
y mapped registers<o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level1=
 lfo1"><!--[if !supportLists]--><span style=3D"mso-list:Ignore">3.<span styl=
e=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;
</span></span><!--[endif]-->Use the mapped registers to send commands and up=
date the firmware<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We would like to have some pointers on how to proceed=
 (sample code/development docs etc.,). We are initially targeting s2600wf bo=
ard as our target.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<br>
Rajesh<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>


</div></blockquote></body></html>=

--Apple-Mail-CDB08349-268C-47FC-A0E4-2CEAE4B7616C--
