Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ED2187817
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 04:22:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hJPr5s8vzDqPv
	for <lists+openbmc@lfdr.de>; Tue, 17 Mar 2020 14:22:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vertiv.com (client-ip=40.107.244.69;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=troy.lee@vertiv.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vertiv.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vertivco.onmicrosoft.com
 header.i=@vertivco.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vertivco-onmicrosoft-com header.b=a7yWNpK2; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2069.outbound.protection.outlook.com [40.107.244.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hJPC4ck1zDqPk
 for <openbmc@lists.ozlabs.org>; Tue, 17 Mar 2020 14:21:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMKtA4HpGR3hNOBQP0023I/JTIRHYRafYYtg6962lE1nN1EuqG1tXbGvjQYgbcAkez8KgbTbicv0j/8fUwomFbaBVZUxq1WiUqAqmniRlBpYEH60Rn+mizF8+J7CLr2rvOqZ6ViCG8nOgSJh67PTnL1vXGow72QyODF9SN9sS6s6M8pgkWVIkCXIY/6dqhsBOveYl2zN7+sJICNvq0JFsvi8nI2EVKbP2l3+5gnf2vkGp4TBG5J+ihOCJjSAs6l1NiIER1ng6+emfo3MfVs+Htp17sq+JdhrF5ktk5Y473OSaEGtB7iqtVUGtMQ1w8PmAHDMnL0cNdiXe5Y1fuQEUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWuUI0OL6H4d+AXS0ifmLhzVBYl3IF/LvktLqVcAdi4=;
 b=Zn7yyj5JwhX35RqYmwUtLyf1V7fg11DuOApBJFiHd5uaMsTUhb/mMohvG2PwvdymI6nKUmiXKGnHc6aql4rTr4pTpfEFwHaOgHp8Eod/I+6hLtj96fGT2tAH28f0nsbyWIog4UKAgqT1OcRY2r5tt4rxPsdAqn0Ncef4AzfwKLk40LIOHLjNLnpg3VlYUnI1GvSOZmzUZ9uXYvyvtu1uau0nLyzXsg16RZqQqfKTvUEEDJKm2a/X8/ndnLd5qG4N07IuyBVSl22Eew+kQkdjboXfOwyfsWTTtdOp4ES8+kdR3Zs3Dw/MvySCNqShaoGnGlL9FZK0OkkAkOrL3UrEzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vertiv.com; dmarc=pass action=none header.from=vertiv.com;
 dkim=pass header.d=vertiv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vertivco.onmicrosoft.com; s=selector2-vertivco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWuUI0OL6H4d+AXS0ifmLhzVBYl3IF/LvktLqVcAdi4=;
 b=a7yWNpK2vF1UWAbAyynHpMAPNWNhqP9Jb1PGcSzNpv2yH5fmkLwrdXmcdf1LSW3v0hPz1moRieozhXGcE4fx0375lHVpwI6rF7XdEclbRUas2Iv9I3u74tSbsREYoNttXj2ZLK4PKyV4Jrvsab2LLWPlxyr4k5vIvqWQjeKYgxg=
Received: from SN6PR13MB2480.namprd13.prod.outlook.com (2603:10b6:805:58::31)
 by SN6PR13MB2414.namprd13.prod.outlook.com (2603:10b6:805:5e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.14; Tue, 17 Mar
 2020 03:21:44 +0000
Received: from SN6PR13MB2480.namprd13.prod.outlook.com
 ([fe80::cea:373e:a199:fc26]) by SN6PR13MB2480.namprd13.prod.outlook.com
 ([fe80::cea:373e:a199:fc26%7]) with mapi id 15.20.2835.013; Tue, 17 Mar 2020
 03:21:43 +0000
From: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>
To: xiuzhi <1450335857@qq.com>, jae.hyun.yoo <jae.hyun.yoo@linux.intel.com>,
 openbmc <openbmc@lists.ozlabs.org>, eajames <eajames@linux.ibm.com>
Subject: RE: [ExternalEmail] How change the  ikvm  port to 5901
Thread-Topic: [ExternalEmail] How change the  ikvm  port to 5901
Thread-Index: AQHV/ApTlYHuP5ogkUGQYDShCNozSahMHh7w
Date: Tue, 17 Mar 2020 03:21:43 +0000
Message-ID: <SN6PR13MB248037ACFB1C54BF58671A6EEDF60@SN6PR13MB2480.namprd13.prod.outlook.com>
References: <tencent_51B1839602A2624376D6376B@qq.com>
In-Reply-To: <tencent_51B1839602A2624376D6376B@qq.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Troy.Lee@vertiv.com; 
x-originating-ip: [103.83.160.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d66f530-29e9-41cd-f61b-08d7ca22515e
x-ms-traffictypediagnostic: SN6PR13MB2414:
x-microsoft-antispam-prvs: <SN6PR13MB24148F0637D1DC7977357F32EDF60@SN6PR13MB2414.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0345CFD558
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(199004)(9686003)(55016002)(2906002)(4001150100001)(86362001)(71200400001)(33656002)(8936002)(8676002)(81156014)(81166006)(966005)(478600001)(110136005)(7696005)(66556008)(52536014)(66476007)(26005)(66946007)(316002)(66446008)(76116006)(64756008)(6506007)(53546011)(5660300002)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR13MB2414;
 H:SN6PR13MB2480.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
received-spf: None (protection.outlook.com: vertiv.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UQByRIb7KBM3gG818cnYu0z0VaJa05EpfQOnE1sGtD42yoZZjtrnkh6uG0UzqpAc1URqhqtlIurLYtb682ErjKKyKOG9E36f53zf3VYerSbviWaxo+Axwn+Vj4/OCWPkxhySLKX/5dc4eRFTomnARgMGS00ZliWtxZy0rgoM0l6ItdHe1Ze/XBTSZ72be7ylCX/Vh6wc3H9xNVJnuyRy/SMZ4u2Glj80bGjDlcxffBx7fm4unmHsaZqPrAPT8Fnbdxl00QUy2rSG9gsblDJFul1KQFsFXwnliOr/1DwHTu6tCuSUsqndHy0NMZPH8rUSJ9OoXnmxyE+FUZXcVQmAcQEo10q3mV2o3DdUc0+bVep7M11lFMR6LeQSQqthBJ9yJD4rWo/Jcmo7IjKhrtj2fdCiKBWhtDDUWnuM77eVsIuGuRTQmWCNWJI6+oyS3zBujxN8qvygVE4wGJdZ3RNJGD/mRbN9++I4dA8mkI+AWMy7mX1NnETtqRUWktltLXvXz1wkWSmfBDKZR4VVbcnLqw==
x-ms-exchange-antispam-messagedata: WdmBBalzTPIwaxGypJEn2gMqN5gRaLu8ezqMxg7Lmz/OqGto5cQzldL74+37fSfHcCnWYtycdPu6fWZy80yMvSuODxAEIGjFQpoX2HPikZlXUZ3egGdoanmSg7Tb8FjE0ITDIOkB2bI/VD2Jam3Flw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SN6PR13MB248037ACFB1C54BF58671A6EEDF60SN6PR13MB2480namp_"
MIME-Version: 1.0
X-OriginatorOrg: vertiv.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d66f530-29e9-41cd-f61b-08d7ca22515e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2020 03:21:43.7332 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 74fe92c5-ef57-4d1a-a0e7-9451117d9272
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +jLBiCM59R5dYhmlmI0JpQN6ILgqxSVFII7dyJRMXN9u3lSWgN/ow8bOhScYxdHlLta+bw8HK9soPZTj28dgyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR13MB2414
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

--_000_SN6PR13MB248037ACFB1C54BF58671A6EEDF60SN6PR13MB2480namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You might need to patch bmcweb as well.
https://github.com/openbmc/bmcweb/blob/master/include/kvm_websocket.hpp#L24

Troy

From: openbmc <openbmc-bounces+troy.lee=3Dvertiv.com@lists.ozlabs.org> On B=
ehalf Of xiuzhi
Sent: Tuesday, March 17, 2020 11:12 AM
To: jae.hyun.yoo <jae.hyun.yoo@linux.intel.com>; openbmc <openbmc@lists.ozl=
abs.org>; eajames <eajames@linux.ibm.com>
Subject: [ExternalEmail] How change the ikvm port to 5901

Hi Jae,Eddie,
    I want to change the ikvm server port from 5900 to 5901 .
I try to modify the following source:
1. obmc-ikvm
--- a/ikvm_server.cpp    2019-09-03 05:47:42.060110145 +0800
+++ b/ikvm-server.cpp    2020-03-16 15:45:59.389571737 +0800
@@ -43,7 +43,7 @@
                                     (char*)cursorMask);
     server->cursor->xhot =3D 1;
     server->cursor->yhot =3D 1;
-
+    server -> port =3D 5901 ;
     rfbStringToAddr(&ip[0], &server->listenInterface);

     rfbInitServer(server);
2. bmcweb
--- a/include/kvm_websocket.hpp    2019-12-19 18:11:38.838532037 +0800
+++ b/include/kvm_websocket.hpp    2020-03-17 11:07:09.814836005 +0800
@@ -20,7 +20,7 @@
         conn(conn), doingWrite(false), hostSocket(conn.get_io_context())
     {
         boost::asio::ip::tcp::endpoint endpoint(
-            boost::asio::ip::make_address("::1"), 5900);
+            boost::asio::ip::make_address("::1"), 5901);
         hostSocket.async_connect(
             endpoint, [this, &conn](const boost::system::error_code& ec) {
                 if (ec)
I can connect to ikvm by tightvnc on port 5901 .
But the webui kvm page don't work, the kvm page cannot connect to the ikvm =
server success.
How to  modify the webui ?
  Best,
Xiuzhi
CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are i=
ntended solely for the use of the individual or entity to whom they are add=
ressed and may contain confidential and privileged information protected by=
 law. If you received this e-mail in error, any review, use, dissemination,=
 distribution, or copying of the e-mail is strictly prohibited. Please noti=
fy the sender immediately by return e-mail and delete all copies from your =
system.

--_000_SN6PR13MB248037ACFB1C54BF58671A6EEDF60SN6PR13MB2480namp_
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
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">You might need to patch bmcweb =
as well.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/bmcweb/blob/master/include/kvm_websocket.hpp#L24">https://github.com=
/openbmc/bmcweb/blob/master/include/kvm_websocket.hpp#L24</a></span><span l=
ang=3D"EN-US" style=3D"font-size:12.0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Troy=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> openbmc &lt;openbmc-bounces&#43;troy.lee=3Dvertiv.com@lists.ozl=
abs.org&gt;
<b>On Behalf Of </b>xiuzhi<br>
<b>Sent:</b> Tuesday, March 17, 2020 11:12 AM<br>
<b>To:</b> jae.hyun.yoo &lt;jae.hyun.yoo@linux.intel.com&gt;; openbmc &lt;o=
penbmc@lists.ozlabs.org&gt;; eajames &lt;eajames@linux.ibm.com&gt;<br>
<b>Subject:</b> [ExternalEmail] How change the ikvm port to 5901<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Jae,Eddie, <o:p></o:p></span=
></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; &nbsp; I want to change =
the ikvm server port from 5900 to 5901 .<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I try to modify the following s=
ource:<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">1. obmc-ikvm<o:p></o:p></span><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/ikvm_server.cpp&nbsp;&nbs=
p;&nbsp; 2019-09-03 05:47:42.060110145 &#43;0800<br>
&#43;&#43;&#43; b/ikvm-server.cpp&nbsp;&nbsp;&nbsp; 2020-03-16 15:45:59.389=
571737 &#43;0800<br>
@@ -43,7 &#43;43,7 @@<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (char*)c=
ursorMask);<br>
&nbsp;&nbsp;&nbsp;&nbsp; server-&gt;cursor-&gt;xhot =3D 1;<br>
&nbsp;&nbsp;&nbsp;&nbsp; server-&gt;cursor-&gt;yhot =3D 1;<br>
-<br>
&#43;&nbsp;&nbsp;&nbsp; server -&gt; port =3D 5901 ;<br>
&nbsp;&nbsp;&nbsp;&nbsp; rfbStringToAddr(&amp;ip[0], &amp;server-&gt;listen=
Interface);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp; rfbInitServer(server);<br>
2. bmcweb<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/include/kvm_websocket.hpp=
&nbsp;&nbsp;&nbsp; 2019-12-19 18:11:38.838532037 &#43;0800<br>
&#43;&#43;&#43; b/include/kvm_websocket.hpp&nbsp;&nbsp;&nbsp; 2020-03-17 11=
:07:09.814836005 &#43;0800<br>
@@ -20,7 &#43;20,7 @@<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conn(conn), doingWrite(fal=
se), hostSocket(conn.get_io_context())<br>
&nbsp;&nbsp;&nbsp;&nbsp; {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boost::asio::ip::tcp::endp=
oint endpoint(<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boost::=
asio::ip::make_address(&quot;::1&quot;), 5900);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; boo=
st::asio::ip::make_address(&quot;::1&quot;), 5901);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hostSocket.async_connect(<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; en=
dpoint, [this, &amp;conn](const boost::system::error_code&amp; ec) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (ec)<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I can connect to ikvm by tightv=
nc on port 5901 .
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">But the webui kvm page don't wo=
rk, the kvm page cannot connect to the ikvm server success.<o:p></o:p></spa=
n></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">How to&nbsp; modify the webui ?=
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp; Best,<o:p></o:p></span><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Xiuzhi<o:p></o:p></span></p>
</div>
</div>
CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are i=
ntended solely for the use of the individual or entity to whom they are add=
ressed and may contain confidential and privileged information protected by=
 law. If you received this e-mail
 in error, any review, use, dissemination, distribution, or copying of the =
e-mail is strictly prohibited. Please notify the sender immediately by retu=
rn e-mail and delete all copies from your system.
</body>
</html>

--_000_SN6PR13MB248037ACFB1C54BF58671A6EEDF60SN6PR13MB2480namp_--
