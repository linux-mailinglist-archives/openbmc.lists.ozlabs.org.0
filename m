Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A25A4D7F
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 05:18:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MFfh1vMszDqcH
	for <lists+openbmc@lfdr.de>; Mon,  2 Sep 2019 13:18:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.209; helo=mail1.bemta23.messagelabs.com;
 envelope-from=pengms1@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MFVt278szDqZj
 for <openbmc@lists.ozlabs.org>; Mon,  2 Sep 2019 13:12:04 +1000 (AEST)
Received: from [67.219.247.54] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-2.bemta.az-d.us-east-1.aws.symcld.net id 61/DD-22799-1888C6D5;
 Mon, 02 Sep 2019 03:12:01 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRWlGSWpSXmKPExsWS8eIhj25jR06
 swYol/BanWl6wODB6nJ+xkDGAMYo1My8pvyKBNeNo/zHWgq8yFdtXqDcwTpLqYuTiEBKYxyQx
 /dgmxi5GTiDnJaPE2xWuEIlXjBK71l5ig3B2M0p83HiLDaSKTUBLYuH/PUwgtoiApcSSB+1gc
 WEBC4nLV7ezQsRtJQ6f3MgCYetJXPy8E6yGRUBF4sj7t+wgNi9Q77wVu8FsRgFZiWmP7oPNZB
 YQl5g7bRbYHAkBAYkle84zQ9iiEi8f/4OKK0i0X2pmhahPkLh8cC4rxExBiZMzn7BMYBSahWT
 ULCRls5CUQcR1JBbs/sQGYWtLLFv4mhnGPnPgMROy+AJG9lWMpklFmekZJbmJmTm6hgYGuoaG
 RrqWuuYWeolVuil6pcW6qYnFJbqGeonlxXrFlbnJOSl6eaklmxiBsZRSwOm3g3HXrDd6hxglO
 ZiURHn5D2XHCvEl5adUZiQWZ8QXleakFh9ilOHgUJLgfdGeEyskWJSanlqRlpkDjGuYtAQHj5
 II70GQNG9xQWJucWY6ROoUoz3HhJdzFzFzHDw6D0h+XLUESH4HkUIsefl5qVLivPwgbQIgbRm
 leXBDYWnoEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3kUgU3gy80rgdgOTC9BHIrw3pmeC
 nFWSiJCSamDKn5PPdWvvtfIDlj/Tt6/SO/zd92B9zMFp/gHqzD/6fjZNrtr94tzVumS3xD1eG
 jxt2b8CorRyGV//W6xz89Qcs9stim6l/z4L3eE/fDY2aUXO6cl3XzDf4/K+MHH+p9oA3alCOx
 MeZp37Omfj9Br+lY92vnvgfs69weTCx5Tw1EPPorvFYkWfXa9sNrzq/+dBSMyrpu4N57fzPZ6
 Rs0tKXNPPXWiThPSee5/uheftdZ/P4ePrxtnw9Hm1KX+e9oH29oI9N/Te75ha235OLcKG43b/
 hQ+F9h4BHduqNiyTrVy0Uv7q7GVpixk3GNS82/pdMuu9xkLfwMV7rr1Sz1QpPp+RK911N/mxx
 t6Z98tElFiKMxINtZiLihMBM/KTiL4DAAA=
X-Env-Sender: pengms1@lenovo.com
X-Msg-Ref: server-32.tower-426.messagelabs.com!1567393921!319238!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2679 invoked from network); 2 Sep 2019 03:12:01 -0000
Received: from unknown (HELO aesmtp.lenovo.com) (104.232.225.12)
 by server-32.tower-426.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Sep 2019 03:12:01 -0000
Received: from pekwpmail04.lenovo.com (unknown [10.96.93.82])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 9B8FAFD262CC6DA2D242
 for <openbmc@lists.ozlabs.org>; Sun,  1 Sep 2019 23:12:00 -0400 (EDT)
Received: from pekwpmail08.lenovo.com (10.96.81.160) by pekwpmail04.lenovo.com
 (10.96.93.82) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 2 Sep
 2019 11:11:59 +0800
Received: from pekwpmail05.lenovo.com (10.96.81.230) by pekwpmail08.lenovo.com
 (10.96.81.160) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 2 Sep
 2019 11:11:58 +0800
Received: from pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf]) by
 pekwpmail05.lenovo.com ([fe80::c91f:415c:90bb:3ddf%7]) with mapi id
 15.01.1591.008; Mon, 2 Sep 2019 11:11:58 +0800
From: Andrew MS1 Peng <pengms1@lenovo.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How to handle a  specific platform application?
Thread-Topic: How to handle a  specific platform application?
Thread-Index: AdVhOivGKaNxf267TWuqPcexuPdLng==
Date: Mon, 2 Sep 2019 03:11:58 +0000
Message-ID: <643a0f27aed44f9b95a1d0287c2e204d@lenovo.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.96.12.253]
Content-Type: multipart/alternative;
 boundary="_000_643a0f27aed44f9b95a1d0287c2e204dlenovocom_"
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

--_000_643a0f27aed44f9b95a1d0287c2e204dlenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

If we implemented a specific application on our platform such as FPGA commu=
nication tool, it's just used in our products rather than a general purpose=
 application. Could I create a repo for it on our github and create a bb fi=
le in our OpenBmc meta-layer to fetch it? Does it need to do OpenBmc gerrit=
 code review?

Thanks,
Andrew

--_000_643a0f27aed44f9b95a1d0287c2e204dlenovocom_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:DengXian;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:DengXian;}
/* Page Definitions */
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
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Hi Team,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">If we implemented a specific applica=
tion on our platform such as FPGA communication tool, it's just used in our=
 products rather than a general purpose application.
 Could I create a repo for it on our github and create a bb file in our Ope=
nBmc meta-layer to fetch it? Does it need to do OpenBmc gerrit code review?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Calibri&quot;,sans-serif">Andrew<o:p></o:p></span></p>
</div>
</body>
</html>

--_000_643a0f27aed44f9b95a1d0287c2e204dlenovocom_--
