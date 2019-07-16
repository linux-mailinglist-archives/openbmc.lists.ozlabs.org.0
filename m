Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2FD6A8E1
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 14:44:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45p0Tj657lzDqCM
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 22:44:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.250.2; helo=mail1.bemta24.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com
 [67.219.250.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45p0Bw0B48zDqRX
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2019 22:31:50 +1000 (AEST)
Received: from [67.219.251.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-5.bemta.az-c.us-west-2.aws.symcld.net id 68/B7-14524-0B3CD2D5;
 Tue, 16 Jul 2019 12:31:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJKsWRWlGSWpSXmKPExsWS8eIhr+6Gw7q
 xBlOfMFmcannBYrH3wEYWByaPBZtKPc7PWMgYwBTFmpmXlF+RwJrxpbmPveDtMcaKLw09rA2M
 jTsZuxi5OIQE2pkk7l+azw7hrGWUaOmbzAzhvGKUWN+4iLWLkRPI2cMoMXWWAojNJqAlsfD/H
 iYQW0RAV6Lt4kswm1kgQmL79W4gm4NDWMBN4tbCFIgSb4mtD1exQNh6Ej8P72IEsVkEVCW+P1
 8EFucVsJRY3L4KbBWjgKzEtEf3oUaKS8ydNgssLiEgILFkz3lmCFtU4uXjf1BxBYkZb7dA1Sd
 IPF5wjBVipqDEyZlPWCYwCs9CMmoWkrJZSMog4joSC3Z/YoOwtSWWLXzNDGOfOfCYCVl8ASP7
 KkaLpKLM9IyS3MTMHF1DAwNdQ0MjXUNjc11DIwu9xCrdZL3SYt3y1OISXSO9xPJiveLK3OScF
 L281JJNjMD4SynobNjB+OrIa71DjJIcTEqivMd26MYK8SXlp1RmJBZnxBeV5qQWH2KU4eBQku
 BdcAgoJ1iUmp5akZaZA0wFMGkJDh4lEd67B4HSvMUFibnFmekQqVOMyRwTXs5dxMyx8+g8IHk
 QTF5ZtQRIfgST38Hkm7Ug8i2YbLt3F0i2g0ghlrz8vFQpcd4ukM0CIKMzSvPgFsNS4CVGWSlh
 XkYGBgYhnoLUotzMElT5V4ziHIxKwrw/QQ7kycwrgbsPmL6AvhbhlXfRAjm9JBEhJdXAtPN23
 CPXOyrznv6fcuab059H4gIPuau4JMN29HpHFmyOMggTNdtmvrZXVHuuqCXPZx72NwIqK7d6v8
 js9Z7TfHJBZnxgjZ3qYU6LZ5Y5j9a41E28Y3aFxcPZ8HBFs2S2QdwfrSCHjqltN+9UB0V7xic
 V9k3YqalsGFeksKlTLHHiLqYal4gMSYFCX/f+ZbrKlkqzL3oUKM20rdPx33vGYGli/L49l/Zw
 LW2tEJpsUyK7an0zZ+nZ5/0T7X8LKlpbXCmavsKle4PB8swIUReRg0fYJ86x5ZSPfJEjULxA+
 /Dma8nNy1WizJaxGVcamnwLn2iu+0jo+s/ypfe2HXiwMbrr37NpHo633qrcaFJiKc5INNRiLi
 pOBACLHTe//AMAAA==
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-20.tower-366.messagelabs.com!1563280302!1459191!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24195 invoked from network); 16 Jul 2019 12:31:43 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.13)
 by server-20.tower-366.messagelabs.com with DHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Jul 2019 12:31:43 -0000
Received: from CNMAILCH01.lenovo.com (unknown [10.96.97.129])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 360651B32F2A26EEBD9C;
 Tue, 16 Jul 2019 08:31:40 -0400 (EDT)
Received: from pekwpmail09.lenovo.com (10.96.81.78) by CNMAILCH01.lenovo.com
 (10.96.97.129) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 16 Jul
 2019 20:31:38 +0800
Received: from pekwpmail05.lenovo.com (10.96.81.230) by pekwpmail09.lenovo.com
 (10.96.81.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 16 Jul
 2019 20:31:38 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Tue, 16 Jul 2019 20:31:38 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: "venture@google.com" <venture@google.com>
Subject: configure error and the image content  seems to be  incorrect
Thread-Topic: configure error and the image content  seems to be  incorrect
Thread-Index: AdU7wED6lXzOnHWTS/+oPAAS8wHIOA==
Date: Tue, 16 Jul 2019 12:31:38 +0000
Message-ID: <55738808da484183a4fb1a59f7097e9c@lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.251]
Content-Type: multipart/alternative;
 boundary="_000_55738808da484183a4fb1a59f7097e9clenovocom_"
MIME-Version: 1.0
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
 Duke KH Du <dukh@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_55738808da484183a4fb1a59f7097e9clenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Patrick,

1.      I downloaded the latest version of phosphor-ipmi-flash to build hos=
t tool with the SDK environment you provide, but encounter configure error =
as below, could you help to take a look at it?

Source code hash id


Compile Status


Error message


b90cacdd0c1ab8ea7576d4ca9f20aa5828a84e42


configure successful


fd182168d9d1c852b1047b9eccea56812b614586
1999eef0e6ad3ab4ad6fcf58cce47f352ca5e137
fa06a5f0056e91bfada390c4007fbd3472d75a56
7c2a00e02f1f0169b3e80ef1715002cefc6fa0d0
c9792e75361c86da7f674976eacd03c761021d2f


configure failed


checking whether C++ compiler accepts -lgtest... yes
checking whether C++ compiler accepts -pthread... (cached) yes
checking for main in -lgtest... yes
checking whether C++ compiler accepts -lgmock... yes
checking whether C++ compiler accepts -pthread... (cached) yes
checking for main in -lgmock... yes
checking for valgrind... no
checking whether to build with code coverage support... no
configure: Enabling OE-SDK at /home/pengms1/SDK/openbmc-sdk/2.8.0/sysroots/=
core2-64-openbmc-linux
configure: error: conditional "HAVE_SYSTEMD" was never defined.
Usually this means the macro was only invoked conditionally.


2.      The host tool compiled with phosphor-ipmi-flash hash id b90cacdd0c1=
ab8ea7576d4ca9f20aa5828a84e42 and BMC flash library compiled with phosphor-=
ipmi-flash hash id c9792e75361c86da7f674976eacd03c761021d2f, the BMC image =
can transfer from host side to BMC side via LPC bridge. The image size is c=
orrect, but the image content seems to be incorrect as below, could you giv=
e us some clues to solve it if this is an issue?

Image of host side


Image of BMC side


pengms1@hsbmc:/flash_tool$ hexdump -n 64 ./630.mtd

0000000 00be ea00 f014 e59f f014 e59f f014 e59f

0000010 f014 e59f f014 e59f f014 e59f f014 e59f

0000020 0060 0000 00c0 0000 0120 0000 0180 0000

0000030 01e0 0000 0240 0000 02a0 0000 beef dead


root@hr630:~# hexdump -n 64 /run/initramfs/bmc-image

0000000 abc4 ef4e 11f2 b128 2538 fd9c 9f7a 2e00

0000010 78c4 af6e 01f2 a92a 7438 759c 8e76 2e00

0000020 f397 05f0 84e4 6546 0ac6 b6d0 ef19 cb80

0000030 e9d7 82f0 c4e4 75dc 1bc6 a295 7319 49c4


DTS setting:
             flash_memory: region@98000000 {
                    no-map;
                    reg =3D <0x98000000 0x00100000>; /* 1M */
             };

BMC configuration setting:
EXTRA_OECONF +=3D " --enable-reboot-update  --enable-static-layout --enable=
-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-update"

Host tool setting:
./burn_my_bmc --command update --interface ipmilpc --image ./630.mtd --sig =
./sig.txt --type static --address 2550136832 --length 65536
Thanks,
Andrew

--_000_55738808da484183a4fb1a59f7097e9clenovocom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:SimSun;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin:0cm;
	margin-bottom:.0001pt;
	text-indent:21.0pt;
	font-size:12.0pt;
	font-family:SimSun;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
p.gmail-m1545270694092823127gmail-m-8411625341099404742msolistparagraph, li=
.gmail-m1545270694092823127gmail-m-8411625341099404742msolistparagraph, div=
.gmail-m1545270694092823127gmail-m-8411625341099404742msolistparagraph
	{mso-style-name:gmail-m_1545270694092823127gmail-m-8411625341099404742msol=
istparagraph;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:SimSun;}
span.EmailStyle19
	{mso-style-type:personal-compose;
	font-family:DengXian;
	color:windowtext;}
p.gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m1788754371567=
513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-m586527764=
4764564145gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-7106=
965077525685122msolistparagra, li.gmail-m1545270694092823127gmail-m-8411625=
341099404742gmail-m1788754371567513735gmail-m6436252274273416049gmail-m-487=
1403681716629123gmail-m5865277644764564145gmail-m5232517683823064206gmail-m=
-6091798217660211465gmail-m-7106965077525685122msolistparagra, div.gmail-m1=
545270694092823127gmail-m-8411625341099404742gmail-m1788754371567513735gmai=
l-m6436252274273416049gmail-m-4871403681716629123gmail-m5865277644764564145=
gmail-m5232517683823064206gmail-m-6091798217660211465gmail-m-71069650775256=
85122msolistparagra
	{mso-style-name:"gmail-m_1545270694092823127gmail-m-8411625341099404742gma=
il-m1788754371567513735gmail-m6436252274273416049gmail-m-487140368171662912=
3gmail-m5865277644764564145gmail-m5232517683823064206gmail-m-60917982176602=
11465gmail-m-7106965077525685122msolistparagra";
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:SimSun;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1511067852;
	mso-list-type:hybrid;
	mso-list-template-ids:1306969414 -336284276 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%2\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:42.0pt;
	text-indent:-21.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:63.0pt;
	text-indent:-21.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:84.0pt;
	text-indent:-21.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%5\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:105.0pt;
	text-indent:-21.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:126.0pt;
	text-indent:-21.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:147.0pt;
	text-indent:-21.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%8\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-21.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:189.0pt;
	text-indent:-21.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans=
-serif;color:black">Hi Patrick,<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"mso-margin-top-alt:auto;mso-margin-b=
ottom-alt:auto;margin-left:18.0pt;text-indent:-18.0pt;mso-list:l0 level1 lf=
o1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:&quot;Calibr=
i&quot;,sans-serif;color:black"><span style=3D"mso-list:Ignore">1.<span sty=
le=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif;color:black">I downloaded the latest version o=
f phosphor-ipmi-flash to build host tool with the SDK environment you provi=
de, but encounter configure error as below, could
 you help to take a look at it?<o:p></o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"margin-left:21.0pt;border-collapse:collapse">
<tbody>
<tr>
<td width=3D"333" valign=3D"top" style=3D"width:250.55pt;border:solid windo=
wtext 1.0pt;background:yellow;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742msolistpar=
agraph">
<b><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif=
;color:black">Source code hash id</span></b><span lang=3D"EN-US"><o:p></o:p=
></span></p>
</td>
<td width=3D"87" valign=3D"top" style=3D"width:124.95pt;border:solid window=
text 1.0pt;border-left:none;background:yellow;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742msolistpar=
agraph">
<b><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif=
;color:black">Compile Status</span></b><span lang=3D"EN-US"><o:p></o:p></sp=
an></p>
</td>
<td width=3D"259" valign=3D"top" style=3D"width:16.0cm;border:solid windowt=
ext 1.0pt;border-left:none;background:yellow;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742msolistpar=
agraph">
<b><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif=
;color:black">Error message</span></b><span lang=3D"EN-US"><o:p></o:p></spa=
n></p>
</td>
</tr>
<tr>
<td width=3D"333" valign=3D"top" style=3D"width:250.55pt;border:solid windo=
wtext 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742msolistpar=
agraph">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black">b90cacdd0c1ab8ea7576d4ca9f20aa5828a84e42</span><span lang=3D"EN-=
US" style=3D"font-family:&quot;Calibri&quot;,sans-serif"><o:p></o:p></span>=
</p>
</td>
<td width=3D"87" valign=3D"top" style=3D"width:124.95pt;border-top:none;bor=
der-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windo=
wtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742msolistpar=
agraph">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black">configure successful</span><span lang=3D"EN-US" style=3D"font-fa=
mily:&quot;Calibri&quot;,sans-serif"><o:p></o:p></span></p>
</td>
<td width=3D"259" valign=3D"top" style=3D"width:16.0cm;border-top:none;bord=
er-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid window=
text 1.0pt;padding:0cm 5.4pt 0cm 5.4pt">
</td>
</tr>
<tr>
<td width=3D"333" valign=3D"top" style=3D"width:250.55pt;border:solid windo=
wtext 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742msolistpar=
agraph">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black">fd182168d9d1c852b1047b9eccea56812b614586<br>
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;color:black;background:white">1999eef0e6ad3ab4ad6fcf58cce47f352ca5e137=
<br>
fa06a5f0056e91bfada390c4007fbd3472d75a56<br>
7c2a00e02f1f0169b3e80ef1715002cefc6fa0d0<br>
c9792e75361c86da7f674976eacd03c761021d2f</span><span lang=3D"EN-US" style=
=3D"font-family:&quot;Calibri&quot;,sans-serif"><o:p></o:p></span></p>
</td>
<td width=3D"87" valign=3D"top" style=3D"width:124.95pt;border-top:none;bor=
der-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid windo=
wtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742msolistpar=
agraph">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black">configure failed</span><span lang=3D"EN-US" style=3D"font-family=
:&quot;Calibri&quot;,sans-serif"><o:p></o:p></span></p>
</td>
<td width=3D"259" valign=3D"top" style=3D"width:16.0cm;border-top:none;bord=
er-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid window=
text 1.0pt;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742msolistpar=
agraph">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif">c=
hecking whether C&#43;&#43; compiler accepts -lgtest... yes<br>
checking whether C&#43;&#43; compiler accepts -pthread... (cached) yes<br>
checking for main in -lgtest... yes<br>
checking whether C&#43;&#43; compiler accepts -lgmock... yes<br>
checking whether C&#43;&#43; compiler accepts -pthread... (cached) yes<br>
checking for main in -lgmock... yes<br>
checking for valgrind... no<br>
checking whether to build with code coverage support... no<br>
configure: Enabling OE-SDK at /home/pengms1/SDK/openbmc-sdk/2.8.0/sysroots/=
core2-64-openbmc-linux<br>
<span style=3D"color:red">configure: error: conditional &quot;HAVE_SYSTEMD&=
quot; was never defined.<br>
Usually this means the macro was only invoked conditionally.</span><o:p></o=
:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m178=
8754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-=
m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465gm=
ail-m-7106965077525685122msolistparagra" style=3D"margin-left:18.0pt;text-i=
ndent:-18.0pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US" style=3D"font-family:&quot;Calibr=
i&quot;,sans-serif;color:black;mso-fareast-language:ZH-TW"><span style=3D"m=
so-list:Ignore">2.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US" style=3D"font-family:&q=
uot;Calibri&quot;,sans-serif;color:black;mso-fareast-language:ZH-TW">The ho=
st tool compiled with
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;color:black">phosphor-ipmi-flash</span><span lang=3D"EN-US" style=3D"f=
ont-family:&quot;Calibri&quot;,sans-serif;color:black;mso-fareast-language:=
ZH-TW"> hash id
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;color:black">b90cacdd0c1ab8ea7576d4ca9f20aa5828a84e42 and BMC flash li=
brary
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;color:black;mso-fareast-language:ZH-TW">compiled with
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;color:black">phosphor-ipmi-flash</span><span lang=3D"EN-US" style=3D"f=
ont-family:&quot;Calibri&quot;,sans-serif;color:black;mso-fareast-language:=
ZH-TW"> hash id
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;color:black;background:white">c9792e75361c86da7f674976eacd03c761021d2f=
, the BMC image can transfer from host side to BMC side via LPC bridge. The=
 image size is correct, but the image content
 seems to be incorrect as below, could you give us some </span><span lang=
=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"=
>clues to solve it if this is an issue?
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;color:black;mso-fareast-language:ZH-TW"><o:p></o:p></span></p>
<table class=3D"MsoTableGrid" border=3D"1" cellspacing=3D"0" cellpadding=3D=
"0" style=3D"margin-left:18.0pt;border-collapse:collapse;border:none">
<tbody>
<tr>
<td width=3D"347" valign=3D"top" style=3D"width:307.65pt;border:solid windo=
wtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m178=
8754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-=
m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465gm=
ail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">Image of host side<o:p></o:p></span><=
/p>
</td>
<td width=3D"336" valign=3D"top" style=3D"width:318.95pt;border:solid windo=
wtext 1.0pt;border-left:none;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m178=
8754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-=
m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465gm=
ail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">Image of BMC side<o:p></o:p></span></=
p>
</td>
</tr>
<tr>
<td width=3D"347" valign=3D"top" style=3D"width:307.65pt;border:solid windo=
wtext 1.0pt;border-top:none;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m178=
8754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-=
m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465gm=
ail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">pengms1@hsbmc:/flash_tool$ hexdump -n=
 64 ./630.mtd
<o:p></o:p></span></p>
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m178=
8754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-=
m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465gm=
ail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">0000000 00be ea00 f014 e59f f014 e59f=
 f014 e59f<o:p></o:p></span></p>
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m178=
8754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-=
m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465gm=
ail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">0000010 f014 e59f f014 e59f f014 e59f=
 f014 e59f<o:p></o:p></span></p>
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m178=
8754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-=
m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465gm=
ail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">0000020 0060 0000 00c0 0000 0120 0000=
 0180 0000<o:p></o:p></span></p>
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m178=
8754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-=
m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465gm=
ail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">0000030 01e0 0000 0240 0000 02a0 0000=
 beef dead<o:p></o:p></span></p>
</td>
<td width=3D"336" valign=3D"top" style=3D"width:318.95pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0cm 5.4pt 0cm 5.4pt">
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m178=
8754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-=
m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465gm=
ail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">root@hr630:~# hexdump -n 64 /run/init=
ramfs/bmc-image<o:p></o:p></span></p>
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m178=
8754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-=
m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465gm=
ail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">0000000 abc4 ef4e 11f2 b128 2538 fd9c=
 9f7a 2e00<o:p></o:p></span></p>
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m178=
8754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-=
m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465gm=
ail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">0000010 78c4 af6e 01f2 a92a 7438 759c=
 8e76 2e00<o:p></o:p></span></p>
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m178=
8754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-=
m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465gm=
ail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">0000020 f397 05f0 84e4 6546 0ac6 b6d0=
 ef19 cb80<o:p></o:p></span></p>
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m178=
8754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-=
m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465gm=
ail-m-7106965077525685122msolistparagra">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">0000030 e9d7 82f0 c4e4 75dc 1bc6 a295=
 7319 49c4<o:p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"gmail-m1545270694092823127gmail-m-8411625341099404742gmail-m178=
8754371567513735gmail-m6436252274273416049gmail-m-4871403681716629123gmail-=
m5865277644764564145gmail-m5232517683823064206gmail-m-6091798217660211465gm=
ail-m-7106965077525685122msolistparagra" style=3D"margin-left:24.0pt;mso-pa=
ra-margin-left:2.0gd">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">DTS setting:</span><span lang=3D"EN-U=
S" style=3D"font-family:&quot;Calibri&quot;,sans-serif;color:black"><br>
</span><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-s=
erif;color:black;mso-fareast-language:ZH-TW">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flash_memory: region@98000000 {<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; no-map;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D &lt;0x98000000 0x00100000&g=
t;; /* 1M */<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };=
<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"mso-margin-top-alt:auto;mso-margin-b=
ottom-alt:auto;margin-left:18.0pt;text-indent:0cm">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">BMC configuration setting:<br>
EXTRA_OECONF &#43;=3D &quot; --enable-reboot-update&nbsp; --enable-static-l=
ayout --enable-aspeed-lpc MAPPED_ADDRESS=3D0x98000000 --enable-reboot-updat=
e&quot;<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"mso-margin-top-alt:auto;mso-margin-b=
ottom-alt:auto;margin-left:18.0pt;text-indent:0cm">
<span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans-serif;co=
lor:black;mso-fareast-language:ZH-TW">Host tool setting:<br>
./burn_my_bmc --command update --interface ipmilpc --image ./630.mtd --sig =
./sig.txt --type static --address 2550136832 --length 65536<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span lang=3D"EN-US" style=3D"font-family:&quot;Calibri&quot;,sans=
-serif;mso-fareast-language:ZH-TW">Thanks,<br>
Andrew<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_55738808da484183a4fb1a59f7097e9clenovocom_--
