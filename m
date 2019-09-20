Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB9BBAD56
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 06:43:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cBXy6kKmzDqLk
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 14:43:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lenovo.com
 (client-ip=67.219.246.3; helo=mail1.bemta23.messagelabs.com;
 envelope-from=dlin23@lenovo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=lenovo.com
Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com
 [67.219.246.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZNsD31qlzF3NY
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 16:21:34 +1000 (AEST)
Received: from [67.219.246.102] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
 by server-3.bemta.az-b.us-east-1.aws.symcld.net id 0A/91-21607-BEF648D5;
 Fri, 20 Sep 2019 06:21:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRWlGSWpSXmKPExsWSLveKTfdlfku
 swf3nFhanWl6wODB6nJ+xkDGAMYo1My8pvyKBNWP3tpPMBUdCKrbenMHSwPjNp4uRi0NIYD6T
 xPaGzYxdjJxAzmtGiV8HnCAS+xkllr+4y9LFyMHBJqAqcX8aN0iNiIC+xK5Ju9lAbGEBaYlDz
 c/YIeIKEqv2/2CFsPUkZhz+CBZnAWqdfLaZBcTmFbCUOLVnChOIzSggK/FkwTMwm1lAXOLcxV
 awegkBAYkle84zQ9iiEi8f/2OFsBUkmve8ZoGoT5CY3DyLFWKmoMTJmU9YJjAKzkIyahaSsll
 IyiDiOhILdn9ig7C1JZYtfM0MY5858JgJWXwBI/sqRtOkosz0jJLcxMwcXUMDA11DQyNdQ10L
 C73EKt0kvdJi3dTE4hJdQ73E8mK94src5JwUvbzUkk2MwIhJKWCM2MF4YtYbvUOMkhxMSqK8L
 nYtsUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeP/nAuUEi1LTUyvSMnOA0QuTluDgURLh/ZgHlO
 YtLkjMLc5Mh0idYrTnmPBy7iJmjoNH5wHJj6uWAMnvIFKIJS8/L1VKnPcJSJsASFtGaR7cUFi
 yucQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcRZApPZl4J3O5XQGcxAZ1lF9EIclZJIkJK
 qoHpkFNG87Kuyyfzvc9fPzZVZHE2d8Hz3qK3R6oL6670h/bMXiHscLhD4e/ktxPeOzGJ6tlYT
 43n//J7QlO515nVE440rf6rwHb79vc/b5dmcDq9fMjQsCYg3PSs9kVtzc3vRWYoHug/s5yd++
 Se3ktmnut3GfgveGPx4v2u6VP9V725sDmKy+9n7+Q/x0/PlngpYl/pUy93pJolbKKkcad/F5u
 eot/n1tDAW5df3gzP56hst217ufhx0X2FB1rzuHe1RjueOvDqss+fC4eFuC45efx3C1iR6ZGo
 1sFyit1souW2T/euV/VsC8mPS7Kuvrcw+MV0lgUf7O9I3hXcv0MuegIzl1BzbpLhgrIp65T8l
 ViKMxINtZiLihMB3X21pLEDAAA=
X-Env-Sender: dlin23@lenovo.com
X-Msg-Ref: server-10.tower-386.messagelabs.com!1568960487!89645!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.43.12; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2545 invoked from network); 20 Sep 2019 06:21:29 -0000
Received: from unknown (HELO apsmtp.lenovo.com) (103.30.234.6)
 by server-10.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2019 06:21:29 -0000
Received: from HKGWPEMAIL01.lenovo.com (unknown [10.128.3.69])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by Forcepoint Email with ESMTPS id 0DBEC8B70F749CEE488D
 for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2019 14:21:27 +0800 (CST)
Received: from HKGWPEMAIL02.lenovo.com (10.128.3.70) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1591.10; Fri, 20 Sep 2019 14:21:05 +0800
Received: from HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba]) by
 HKGWPEMAIL02.lenovo.com ([fe80::7020:5ebb:e3eb:29ba%12]) with mapi id
 15.01.1591.008; Fri, 20 Sep 2019 14:21:26 +0800
From: Derek Lin23 <dlin23@lenovo.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: PECI sensor rename
Thread-Topic: PECI sensor rename
Thread-Index: AdVvczEc4JIh9rDeSauE2DE3VmlT5g==
Date: Fri, 20 Sep 2019 06:21:26 +0000
Message-ID: <f59e0897a48c4922b82ff0110df5a33c@lenovo.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.128.115.1]
Content-Type: multipart/alternative;
 boundary="_000_f59e0897a48c4922b82ff0110df5a33clenovocom_"
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 23 Sep 2019 14:40:35 +1000
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

--_000_f59e0897a48c4922b82ff0110df5a33clenovocom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team:

          I have a question for how to rename PECI sensor in cpu-sensor.
          Currently, I am using peci-dimmtemp & peci-cputemp drivers under =
Kernel to read DIMM and CPU temperatures.
          So, under /sys/class/hwmon directories, I can find the correspond=
ing CPU & DIMM label names and temperatures.

          Now, my question is how do I change the label names of each corre=
sponding temperature in cpu-sensor component.

          Here is the snapshot of my cpu-sensor using busctl. My goal is to=
 show temperature name to be something else other than "Die_CPU1" or "DIMM_=
C1_CPU1".

                    root@abc/sys/class/hwmon/hwmon23# busctl tree --no-page=
 xyz.openbmc_project.CPUSensor
                   ...
                   /xyz/openbmc_project/sensors
      mq/xyz/openbmc_project/sensors/temperature
        tq/xyz/openbmc_project/sensors/temperature/Core_0_CPU1
        tq/xyz/openbmc_project/sensors/temperature/Core_10_CPU1
        tq/xyz/openbmc_project/sensors/temperature/Core_11_CPU1
        tq/xyz/openbmc_project/sensors/temperature/Core_12_CPU1
        tq/xyz/openbmc_project/sensors/temperature/Core_13_CPU1
        tq/xyz/openbmc_project/sensors/temperature/Core_14_CPU1
        tq/xyz/openbmc_project/sensors/temperature/Core_15_CPU1
        tq/xyz/openbmc_project/sensors/temperature/Core_17_CPU1
        tq/xyz/openbmc_project/sensors/temperature/Core_2_CPU1
        tq/xyz/openbmc_project/sensors/temperature/Core_3_CPU1
        tq/xyz/openbmc_project/sensors/temperature/Core_4_CPU1
        tq/xyz/openbmc_project/sensors/temperature/Core_5_CPU1
        tq/xyz/openbmc_project/sensors/temperature/Core_6_CPU1
        tq/xyz/openbmc_project/sensors/temperature/Core_7_CPU1
        tq/xyz/openbmc_project/sensors/temperature/Core_9_CPU1
        tq/xyz/openbmc_project/sensors/temperature/DIMM_C1_CPU1
        tq/xyz/openbmc_project/sensors/temperature/DIMM_C2_CPU1
        mq/xyz/openbmc_project/sensors/temperature/Die_CPU1
                   ...

          I understand that "Die" comes from peci-cputemp driver and "DIMM_=
C1" comes from peci-dimmtemp driver. Besides rewriting the label names in t=
he drivers, do I have other options?

Thank you,

Derek


--_000_f59e0897a48c4922b82ff0110df5a33clenovocom_
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
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Team:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; I have a question for how to rename PECI sensor in =
cpu-sensor.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Currently, I am using peci-dimmtemp &amp; peci-cput=
emp drivers under Kernel to read DIMM and CPU temperatures.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; So, under /sys/class/hwmon directories, I can find =
the corresponding CPU &amp; DIMM label names and temperatures.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Now, my question is how do I change the label names=
 of each corresponding temperature in cpu-sensor component.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; Here is the snapshot of my cpu-sensor using busctl.=
 My goal is to show temperature name to be something else other than &#8220=
;Die_CPU1&#8221; or &#8220;DIMM_C1_CPU1&#8221;.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; root@abc/sys/class/hwmon/hwmon23# busctl tree --no-page xyz.openbmc_pro=
ject.CPUSensor<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; /xyz/openbmc_project/sensors<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
mq/xyz/openbmc_project/sensors/temperature<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/Core_0_CPU1<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/Core_10_CPU1<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/Core_11_CPU1<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/Core_12_CPU1<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/Core_13_CPU1<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/Core_14_CPU1<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/Core_15_CPU1<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/Core_17_CPU1<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/Core_2_CPU1<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/Core_3_CPU1<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/Core_4_CPU1<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;tq/xyz/openbmc_project/sensors/temperature/Core_5_CPU1<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/Core_6_CPU1<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/Core_7_CPU1<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/Core_9_CPU1<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &nbsp;tq/xyz/openbmc_project/sensors/temperature/DIMM_C1_CPU1<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; tq/xyz/openbmc_project/sensors/temperature/DIMM_C2_CPU1<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; mq/xyz/openbmc_project/sensors/temperature/Die_CPU1<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; &#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; I understand that &#8220;Die&#8221; comes from peci=
-cputemp driver and &#8220;DIMM_C1&#8221; comes from peci-dimmtemp driver. =
Besides rewriting the label names in the drivers, do I have other options?
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thank you,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Derek<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_f59e0897a48c4922b82ff0110df5a33clenovocom_--
