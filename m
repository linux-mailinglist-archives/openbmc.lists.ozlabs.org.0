Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758E692362
	for <lists+openbmc@lfdr.de>; Fri, 10 Feb 2023 17:34:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCzpd1xVKz3f53
	for <lists+openbmc@lfdr.de>; Sat, 11 Feb 2023 03:34:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=YjL4NqSI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inventron.com.tr (client-ip=185.216.113.70; helo=ns1.ihsdnsx51.com; envelope-from=zehra.ozdemir@inventron.com.tr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=YjL4NqSI;
	dkim-atps=neutral
Received: from ns1.ihsdnsx51.com (ns1.ihsdnsx51.com [185.216.113.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCznz2kbtz30CT
	for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2023 03:33:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inventron.com.tr;
	s=default; t=1676046831;
	bh=Wq33WiXzjndXdq51WDBwm/A/e1a3Pna5HWXs6ILAdJo=;
	h=Received:Received:From:To:Subject;
	b=YjL4NqSIS5qeVIpemoHgTBs7obGRWZ0aE9Ds0zLhjI/gGn5svTvAPcYAgkLa98smH
	 9Lc+ZjDeTKwdH3bLWLpGXDd/seikabQpaK6gyL2e4LhlxjwkI+qljId9B2BIpQYJTr
	 CDL1ccYtUQDW435u/a6lIE5atD/r+ojr/jDuoTYY=
Received: (qmail 2821266 invoked from network); 10 Feb 2023 19:33:51 +0300
Received: from 78.189.148.199.static.ttnet.com.tr (HELO INVLT5250ZO)
 (78.189.148.199)
  by ns1.ihsdnsx51.com with ESMTPSA (DHE-RSA-AES256-GCM-SHA384 encrypted,
 authenticated); 10 Feb 2023 19:33:50 +0300
From: <zehra.ozdemir@inventron.com.tr>
To: <openbmc@lists.ozlabs.org>
Subject: PSU Sensors Association with Entity Manager
Date: Fri, 10 Feb 2023 19:33:52 +0300
Message-ID: <000001d93d6d$7618b2c0$624a1840$@inventron.com.tr>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01D93D86.9B6834B0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Adk9ZSkyL+xBCufORFmtSRuCN80U+Q==
Content-Language: en-us
X-PPP-Message-ID:  <167604683133.2821260.10653277331904788743@ns1.ihsdnsx51.com>
X-PPP-Vhost: inventron.com.tr
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
Cc: "'M. Erhan Yigitbasi'" <erhan.yigitbasi@inventron.com.tr>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multipart message in MIME format.

------=_NextPart_000_0001_01D93D86.9B6834B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

We are trying to implement psu sensors with entity-manager by defining
chassis and power supply in separate json configuration file according to
entity-manager's sample configurations.  PSU sensors are not displayed under
/xyz/openbmc_project/inventory/system/board/{chassisID}/all_sensors but
under
/xyz/openbmc_project/inventory/system/powersupply/{powersupplyID}/all_sensor
s. And they are not shown in the Web UI. Here is the powersupply.json
configuration we used:

{

    "Exposes": [

        {

            "Address": "0x58",

            "Bus": "3",

            "Labels": [

                "iin",

                "iout1",

                "iout2",

                "fan1",

                "vin",

                "vout1",

                "vout2",

                "pin",

                "pout1",

                "pout2",

                "temp1"

            ],

            "Name": "Some_PSU",

            "PollRate": 5.0,

            "Type": "pmbus"

        }

    ],

    "Name": "Some Power Supply Name",

    "Probe": "TRUE",

    "Type": "PowerSupply",

    "xyz.openbmc_project.Inventory.Decorator.Asset": {

        "Manufacturer": "SomeManufacturer",

        "Model": "SomeModel",

        "PartNumber": "SomePart",

        "SerialNumber": "SomeSerial"

    }

}

We examined the Inventory and LEDs page from bmcweb logs and we saw that
sensorAssocPath does not include our psu sensors in the
getInventoryItemAssociation() method in sensors.hpp. sensorAssocPath filled
from sensorNames vector and this vector comes from
/xyz/openbmc_project/inventory/system/board/{chassisID}/all_sensors as much
as we understand. So our question is how to show psu sensors in the WebUI
and what can possibly be wrong with our configuration. Do we certainly need
to list psu sensors under
/xyz/openbmc_project/inventory/system/board/{chassisID}/all_sensors? Also
what needs to be done to show the manufacturer and model information of
Power Supply in UI too?


------=_NextPart_000_0001_01D93D86.9B6834B0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.E-postaStili17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DTR =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal>Hello,<o:p></o:p></p><p class=3DMsoNormal>We are =
trying to implement psu sensors with entity-manager by defining chassis =
and power supply in separate json configuration file according to =
entity-manager&#8217;s sample configurations. &nbsp;PSU sensors are not =
displayed under =
/xyz/openbmc_project/inventory/system/board/{chassisID}/all_sensors but =
under =
/xyz/openbmc_project/inventory/system/powersupply/{powersupplyID}/all_sen=
sors. And they are not shown in the Web UI. Here is the powersupply.json =
configuration we used:<o:p></o:p></p><p class=3DMsoNormal =
style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>{<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp; =
</span><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;Exposes&quot;</span><sp=
an style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: [<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; {<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;Address&quot;</span><sp=
an style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#0451A5;mso-fareast-language:TR'>&quot;0x58&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;Bus&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#0451A5;mso-fareast-language:TR'>&quot;3&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;Labels&quot;</span><spa=
n style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: [<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;iin&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;iout1&quot;</span><span=
 style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;iout2&quot;</span><span=
 style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;fan1&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;vin&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;vout1&quot;</span><span=
 style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;vout2&quot;</span><span=
 style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;pin&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;pout1&quot;</span><span=
 style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;pout2&quot;</span><span=
 style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;temp1&quot;</span><span=
 style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'><o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ],<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;Name&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#0451A5;mso-fareast-language:TR'>&quot;Some_PSU&quot;</span><s=
pan style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;PollRate&quot;</span><s=
pan style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#6554C0;mso-fareast-language:TR'>5.0</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;Type&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#0451A5;mso-fareast-language:TR'>&quot;pmbus&quot;</span><span=
 style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'><o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; }<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp; =
],<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp; =
&nbsp;</span><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;Name&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#0451A5;mso-fareast-language:TR'>&quot;Some Power Supply =
Name&quot;</span><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp; =
</span><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;Probe&quot;</span><span=
 style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#0451A5;mso-fareast-language:TR'>&quot;TRUE&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp; =
</span><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;Type&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#0451A5;mso-fareast-language:TR'>&quot;PowerSupply&quot;</span=
><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp; =
</span><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;xyz.openbmc_project.Inv=
entory.Decorator.Asset&quot;</span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: {<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; </span><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;Manufacturer&quot;</spa=
n><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#0451A5;mso-fareast-language:TR'>&quot;SomeManufacturer&quot;<=
/span><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; </span><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;Model&quot;</span><span=
 style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#0451A5;mso-fareast-language:TR'>&quot;SomeModel&quot;</span><=
span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; </span><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;PartNumber&quot;</span>=
<span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#0451A5;mso-fareast-language:TR'>&quot;SomePart&quot;</span><s=
pan style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>,<o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; </span><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#A31515;mso-fareast-language:TR'>&quot;SerialNumber&quot;</spa=
n><span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>: </span><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:#0451A5;mso-fareast-language:TR'>&quot;SomeSerial&quot;</span>=
<span style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'><o:p></o:p></span></p><p =
class=3DMsoNormal style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>&nbsp;&nbsp;&nbsp; =
}<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'line-height:13.5pt;background:#FFFFFE'><span =
style=3D'font-size:10.0pt;font-family:"Courier =
New";color:black;mso-fareast-language:TR'>}<o:p></o:p></span></p><p =
class=3DMsoNormal>We examined the Inventory and LEDs page from bmcweb =
logs and we saw that sensorAssocPath does not include our psu sensors in =
the getInventoryItemAssociation() method in sensors.hpp. sensorAssocPath =
filled from sensorNames vector and this vector comes from =
/xyz/openbmc_project/inventory/system/board/{chassisID}/all_sensors as =
much as we understand. So our question is how to show psu sensors in the =
WebUI and what can possibly be wrong with our configuration. Do we =
certainly need to list psu sensors under =
/xyz/openbmc_project/inventory/system/board/{chassisID}/all_sensors? =
Also what needs to be done to show the manufacturer and model =
information of Power Supply in UI too?<o:p></o:p></p></div></body></html>
------=_NextPart_000_0001_01D93D86.9B6834B0--

