Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3A3596C35
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 11:42:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M732t66ggz3cjY
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 19:42:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=dLpPtnL/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inventron.com.tr (client-ip=185.216.113.70; helo=ns1.ihsdnsx51.com; envelope-from=zehra.ozdemir@inventron.com.tr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventron.com.tr header.i=@inventron.com.tr header.a=rsa-sha256 header.s=default header.b=dLpPtnL/;
	dkim-atps=neutral
X-Greylist: delayed 397 seconds by postgrey-1.36 at boromir; Wed, 17 Aug 2022 19:41:38 AEST
Received: from ns1.ihsdnsx51.com (ns1.ihsdnsx51.com [185.216.113.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M731t4qRLz3bpW
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 19:41:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inventron.com.tr;
	s=default; t=1660729294;
	bh=P/yRRSVCIOAy9Sps/Ng7aVBPVdYt8vaJ0PEfsw3FSGQ=;
	h=Received:Received:From:To:Subject;
	b=dLpPtnL/WR2EIexK+vUT3ISu65G65V/rA8bE5lXIY8RtD4e+tEKeNACqhRkUzF2sC
	 JDIwqzctVzXiAINxECx80BueaACy7lnDsSpY1sZZoCOCBb+Z+/HN69xo+YhGYv628n
	 zxFtCURhq2JQSX55uN5CwZKs0maKiYt3oMvT25KI=
Received: (qmail 3395189 invoked from network); 17 Aug 2022 12:34:53 +0300
Received: from 78.189.148.199.static.ttnet.com.tr (HELO INVLT5250ZO)
 (78.189.148.199)
 by ns1.ihsdnsx51.com with ESMTPSA (DHE-RSA-AES256-GCM-SHA384 encrypted,
 authenticated); 17 Aug 2022 12:34:52 +0300
From: <zehra.ozdemir@inventron.com.tr>
To: <openbmc@lists.ozlabs.org>
Subject: Event Logs in Redfish
Date: Wed, 17 Aug 2022 12:34:52 +0300
Message-ID: <000001d8b21c$9b095c60$d11c1520$@inventron.com.tr>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----=_NextPart_000_0001_01D8B235.C059A1A0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdiyHJopTuPfqWGNRRyYnl1m94NWcw==
Content-Language: en-us
X-PPP-Message-ID: <20220817093453.3395177.24656@ns1.ihsdnsx51.com>
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

------=_NextPart_000_0001_01D8B235.C059A1A0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

 

I am trying to get an event log and I created a sample log by calling
logging create dbus interface as down below:

 

busctl call xyz.openbmc_project.Logging /xyz/openbmc_project/logging
xyz.openbmc_project.Logging.Create Create ssa{ss} "Hata olustu"
"xyz.openbmc_project.Logging.Entry.Level.Critical" 1 "CALLOUT_GPIO_NUM" "5"

 

It seems to created successfully when I viewed "GetManagedObjects" object of
the interface :

 

busctl call xyz.openbmc_project.Logging /xyz/openbmc_project/logging
org.freedesktop.DBus.ObjectManager GetManagedObjects

 

output:

 

a{oa{sa{sv}}} 2 "/xyz/openbmc_project/logging/entry/1" 8
"org.freedesktop.DBus.Peer" 0 "org.freedesktop.DBus.Introspectable" 0
"org.freedesktop.DBus.Properties" 0 "xyz.openbmc_project.Common.FilePath" 1
"Path" s "/var/lib/phosphor-logging/errors/1"
"xyz.openbmc_project.Software.Version" 2 "Version" s "0.1.0" "Purpose" s
"xyz.openbmc_project.Software.Version.VersionPurpose.BMC"
"xyz.openbmc_project.Association.Definitions" 1 "Associations" a(sss) 0
"xyz.openbmc_project.Object.Delete" 0 "xyz.openbmc_project.Logging.Entry" 10
"Id" u 1 "Timestamp" t 1660660714372 "Severity" s
"xyz.openbmc_project.Logging.Entry.Level.Critical" "Message" s "Hata olustu"
"EventId" s "" "AdditionalData" as 1 "CALLOUT_GPIO_NUM=5" "Resolution" s ""
"Resolved" b false "ServiceProviderNotify" b false "UpdateTimestamp" t
1660660714372 "/xyz/openbmc_project/logging/internal/manager" 4
"org.freedesktop.DBus.Peer" 0 "org.freedesktop.DBus.Introspectable" 0
"org.freedesktop.DBus.Properties" 0
"xyz.openbmc_project.Logging.Internal.Manager" 0

 

However, no data is displayed in the web-ui.  So, I examined the bmcweb
method which deals with getting event log requests from dbus and nothing
seems wrong. When I call this bmcweb method with redfish api, count returns
zero.:

 

curl -c cjar -b cjar -k
https://{$bmc}/redfish/v1/Systems/system/LogServices/EventLog/Entries
<https://%7b$bmc%7d/redfish/v1/Systems/system/LogServices/EventLog/Entries/>

{
  "@odata.id": "/redfish/v1/Systems/system/LogServices/EventLog/Entries",
  "@odata.type": "#LogEntryCollection.LogEntryCollection",
  "Description": "Collection of System Event Log Entries",
  "Members": [],
  "Members@odata.count": 0,
  "Name": "System Event Log Entries"

 

In short, what exactly do I need to do to view these event logs in the web
ui?

 

Thank you.

 

  


------=_NextPart_000_0001_01D8B235.C059A1A0
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
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
class=3DMsoNormal>Hello,<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I am trying =
to get an event log and I created a sample log by calling logging create =
dbus interface as down below:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><span =
style=3D'font-size:11.5pt;font-family:"Arial",sans-serif;color:#1D1C1D;ba=
ckground:#F8F8F8'>busctl call xyz.openbmc_project.Logging =
/xyz/openbmc_project/logging xyz.openbmc_project.Logging.Create Create =
ssa{ss} &quot;Hata olustu&quot; =
&quot;xyz.openbmc_project.Logging.Entry.Level.Critical&quot; 1 =
&quot;CALLOUT_GPIO_NUM&quot; &quot;5&quot;<o:p></o:p></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal> It seems to =
created successfully when I viewed &#8220;GetManagedObjects&#8221; =
object of the interface :<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><span =
style=3D'font-size:11.5pt;font-family:"Arial",sans-serif;color:#1D1C1D;ba=
ckground:#F8F8F8'>busctl call xyz.openbmc_project.Logging =
/xyz/openbmc_project/logging org.freedesktop.DBus.ObjectManager =
GetManagedObjects<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.5pt;font-family:"Arial",sans-serif;color:#1D1C1D;ba=
ckground:#F8F8F8'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.5pt;font-family:"Arial",sans-serif;color:#1D1C1D;ba=
ckground:#F8F8F8'>output:<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:11.5pt;font-family:"Arial",sans-serif;color:#1D1C1D;ba=
ckground:#F8F8F8'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:11.5pt;font-family:"Arial",sans-serif;color:#1D1C1D;ba=
ckground:#F8F8F8'>a{oa{sa{sv}}} 2 =
&quot;/xyz/openbmc_project/logging/entry/1&quot; 8 =
&quot;org.freedesktop.DBus.Peer&quot; 0 =
&quot;org.freedesktop.DBus.Introspectable&quot; 0 =
&quot;org.freedesktop.DBus.Properties&quot; 0 =
&quot;xyz.openbmc_project.Common.FilePath&quot; 1 &quot;Path&quot; s =
&quot;/var/lib/phosphor-logging/errors/1&quot; =
&quot;xyz.openbmc_project.Software.Version&quot; 2 &quot;Version&quot; s =
&quot;0.1.0&quot; &quot;Purpose&quot; s =
&quot;xyz.openbmc_project.Software.Version.VersionPurpose.BMC&quot; =
&quot;xyz.openbmc_project.Association.Definitions&quot; 1 =
&quot;Associations&quot; a(sss) 0 =
&quot;xyz.openbmc_project.Object.Delete&quot; 0 =
&quot;xyz.openbmc_project.Logging.Entry&quot; 10 &quot;Id&quot; u 1 =
&quot;Timestamp&quot; t 1660660714372 &quot;Severity&quot; s =
&quot;xyz.openbmc_project.Logging.Entry.Level.Critical&quot; =
&quot;Message&quot; s &quot;Hata olustu&quot; &quot;EventId&quot; s =
&quot;&quot; &quot;AdditionalData&quot; as 1 =
&quot;CALLOUT_GPIO_NUM=3D5&quot; &quot;Resolution&quot; s &quot;&quot; =
&quot;Resolved&quot; b false &quot;ServiceProviderNotify&quot; b false =
&quot;UpdateTimestamp&quot; t 1660660714372 =
&quot;/xyz/openbmc_project/logging/internal/manager&quot; 4 =
&quot;org.freedesktop.DBus.Peer&quot; 0 =
&quot;org.freedesktop.DBus.Introspectable&quot; 0 =
&quot;org.freedesktop.DBus.Properties&quot; 0 =
&quot;xyz.openbmc_project.Logging.Internal.Manager&quot; =
0<o:p></o:p></span></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal> However, no data is displayed in the web-ui. =
&nbsp;So, I examined the bmcweb method which deals with getting event =
log requests from dbus and nothing seems wrong. When I call this bmcweb =
method with redfish api, count returns zero.:<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><span =
style=3D'font-size:11.5pt;font-family:"Arial",sans-serif;color:#1D1C1D;ba=
ckground:#F8F8F8'>curl -c cjar -b cjar -k&nbsp;</span><span =
style=3D'font-size:11.5pt;font-family:"Arial",sans-serif;color:black;back=
ground:#F8F8F8'><a =
href=3D"https://%7b$bmc%7d/redfish/v1/Systems/system/LogServices/EventLog=
/Entries/">https://{$bmc}/redfish/v1/Systems/system/LogServices/EventLog/=
Entries</a></span><span =
style=3D'font-size:11.5pt;font-family:"Arial",sans-serif;color:#1D1C1D'><=
br><span style=3D'background:#F8F8F8'>{</span><br><span =
style=3D'background:#F8F8F8'>&nbsp;&nbsp;&quot;@odata.id&quot;: =
&quot;/redfish/v1/Systems/system/LogServices/EventLog/Entries&quot;,</spa=
n><br><span =
style=3D'background:#F8F8F8'>&nbsp;&nbsp;&quot;@odata.type&quot;: =
&quot;#LogEntryCollection.LogEntryCollection&quot;,</span><br><span =
style=3D'background:#F8F8F8'>&nbsp;&nbsp;&quot;Description&quot;: =
&quot;Collection of System Event Log Entries&quot;,</span><br><span =
style=3D'background:#F8F8F8'>&nbsp;&nbsp;&quot;Members&quot;: =
[],</span><br><span =
style=3D'background:#F8F8F8'>&nbsp;&nbsp;&quot;Members@odata.count&quot;:=
 0,</span><br><span =
style=3D'background:#F8F8F8'>&nbsp;&nbsp;&quot;Name&quot;: &quot;System =
Event Log Entries&quot;<o:p></o:p></span></span></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>In short, =
what exactly do I need to do to view these event logs in the web =
ui?<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p =
class=3DMsoNormal>Thank you.<o:p></o:p></p><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal> =
&nbsp;&nbsp;<o:p></o:p></p></div></body></html>
------=_NextPart_000_0001_01D8B235.C059A1A0--

