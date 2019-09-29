Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A184BC140E
	for <lists+openbmc@lfdr.de>; Sun, 29 Sep 2019 11:20:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46h0PR0jNJzDqfd
	for <lists+openbmc@lfdr.de>; Sun, 29 Sep 2019 19:20:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.4; helo=mail1.bemta23.messagelabs.com;
 envelope-from=liuyh21@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46h0Ns1ZkTzDqf2
 for <openbmc@lists.ozlabs.org>; Sun, 29 Sep 2019 19:19:55 +1000 (AEST)
Received: from [67.219.246.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-4.bemta.az-b.us-east-1.aws.symcld.net id 94/26-25788-837709D5;
 Sun, 29 Sep 2019 09:19:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRWlGSWpSXmKPExsWS8eIhj655+YR
 Yg/kvZS1OtbxgcWD0OD9jIWMAYxRrZl5SfkUCa0b722VMBSvMK+4sqGpg/G7YxcjFISQwj0ni
 z75z7BDOS0aJmwcuMEI4exgl9u89z9bFyMHBJqAtMX1/ahcjJ4eIgL7Erkm72UBsYQFZie6F1
 1kg4koSj9fNYYOw9SSebHzABGKzCKhK7Jl1FCzOK2Apsa9pHlg9I1DvtEf3wWqYBcQl5k6bxQ
 piSwgISCzZc54ZwhaVePn4H1RcQeLqvSVQ9QkST1csZoWYKShxcuYTlgmMgrOQjJqFpGwWkjK
 IuI7Egt2f2CBsbYllC18zw9hnDjxmQhZfwMi+itEsqSgzPaMkNzEzR9fQwEDX0NBIF0haWOol
 Vukm6ZUW66YmFpfoGuollhfrFVfmJuek6OWllmxiBMZMSgHD3h2Mu2e90TvEKMnBpCTKG3OyL
 1aILyk/pTIjsTgjvqg0J7X4EKMMB4eSBC9b3oRYIcGi1PTUirTMHGD8wqQlOHiURHg1SoHSvM
 UFibnFmekQqVOM9hwTXs5dxMxx8Og8IPlx1RIg+R1ECrHk5eelSonzXi8BahMAacsozYMbCks
 3lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ804AmcKTmVcCt/sV0FlMQGc5pPaDnFWSiJCS
 amCKKTx+zJVZjEto3RX99zrNbrrftrh9ebk7srH5a5ZP74zYBabdsx4ZvONctqbk6X9zuz0vx
 Lpr36v+037YtVso5nmvwo7I1vP6ag/1d0ze53NruXrWHptC57Zbzz51mJW2Ob7TV7J9v/pu9C
 t7wwfbdyQFbJ28i/cAv80Z0zLOtfq5k+bsrH1b+vHwMbZbeyL2sciFbo9TWbZbc5vMomkWi6z
 ZC+c9VNjzIuHwxI33K2a3rHsYvbQ3dAp3CXeSbcfrNUETH1/33z7l1Zt7qzd/vz1L1Kp5W7de
 ZpC16EmXeweXZllttrpnO3HfT8Of2ueMtJme/g+rdJm+4AbnXFaNr5Od1oT7fC0prkxzOLXCW
 4mlOCPRUIu5qDgRAP32bZmyAwAA
X-Env-Sender: liuyh21@lenovo.com
X-Msg-Ref: server-7.tower-386.messagelabs.com!1569748791!129720!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28574 invoked from network); 29 Sep 2019 09:19:51 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-7.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Sep 2019 09:19:51 -0000
Received: from pekwpmail03.lenovo.com (unknown [10.96.93.81])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id CBB2179EB32E15B05274
 for <openbmc@lists.ozlabs.org>; Sun, 29 Sep 2019 05:19:50 -0400 (EDT)
Received: from pekwpmail05.lenovo.com (10.96.93.83) by pekwpmail03.lenovo.com
 (10.96.93.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Sun, 29 Sep
 2019 17:19:42 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Sun, 29 Sep 2019 17:19:42 +0800
From: Yonghui YH21 Liu <liuyh21@lenovo.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Broadcom PHY Setting
Thread-Topic: Broadcom PHY Setting
Thread-Index: AdV2pSYSIl/bJ665S0ieVbe0G1ysmQ==
Date: Sun, 29 Sep 2019 09:19:42 +0000
Message-ID: <1fa116e4d9c0406b81e244c4ef6a611d@lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.252]
Content-Type: multipart/alternative;
 boundary="_000_1fa116e4d9c0406b81e244c4ef6a611dlenovocom_"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_1fa116e4d9c0406b81e244c4ef6a611dlenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

HI All,
         Now I am trying to enable RGMII interface in my project, and now I=
 can get BMC dedicated port IP when I enable related setting in DTS file.
         But due to hardware design, I have to try to modify some function =
setting.
For example:

(1)     Disable CLK125 MUX on LED4 .

(2)     Setup delay mode on TXD/TXC of RGMII to fix setup/hold time issues
But I cannot get related user interface to change them, DTS or configure se=
tting file.
I have to modify driver setting by patch BCM driver.
Could you help double confirm whether there is any user interface? If yes, =
please give an sample?


Thanks


--_000_1fa116e4d9c0406b81e244c4ef6a611dlenovocom_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	text-indent:21.0pt;
	font-size:10.5pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1951273563;
	mso-list-type:hybrid;
	mso-list-template-ids:-1505346134 -176552280 67698713 67698715 67698703 67=
698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-text:"\(%1\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:60.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%2\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:84.0pt;
	text-indent:-21.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:105.0pt;
	text-indent:-21.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:126.0pt;
	text-indent:-21.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%5\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:147.0pt;
	text-indent:-21.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:168.0pt;
	text-indent:-21.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:189.0pt;
	text-indent:-21.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-text:"%8\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:210.0pt;
	text-indent:-21.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:231.0pt;
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
<body lang=3D"ZH-CN" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">HI All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; Now I am trying to enable RGMII interface in my project, =
and now I can get BMC dedicated port IP when I enable related setting in DT=
S file.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; But due to hardware design, I have to try to modify some =
function setting.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">Fo=
r example:<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:60.0pt;text-indent:-18.0=
pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US"><span style=3D"mso-list:Ignore">(=
1)<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Disable CLK125 MUX on L=
ED4 .<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"margin-left:60.0pt;text-indent:-18.0=
pt;mso-list:l0 level1 lfo1">
<![if !supportLists]><span lang=3D"EN-US"><span style=3D"mso-list:Ignore">(=
2)<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;=
&nbsp;
</span></span></span><![endif]><span lang=3D"EN-US">Setup delay mode on TXD=
/TXC of RGMII to fix setup/hold time issues
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">Bu=
t I cannot get related user interface to change them, DTS or configure sett=
ing file.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">I =
have to modify driver setting by patch BCM driver.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">Co=
uld you help double confirm whether there is any user interface? If yes, pl=
ease give an sample?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US"><o=
:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US"><o=
:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">&n=
bsp;&nbsp;<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_1fa116e4d9c0406b81e244c4ef6a611dlenovocom_--
