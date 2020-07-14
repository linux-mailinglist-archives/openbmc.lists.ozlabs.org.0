Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9786D220070
	for <lists+openbmc@lfdr.de>; Wed, 15 Jul 2020 00:07:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5vl56SfFzDqWg
	for <lists+openbmc@lfdr.de>; Wed, 15 Jul 2020 08:07:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=63.128.21.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=patrick_voelker@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=br21QSAa; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=br21QSAa; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [63.128.21.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5vkC6BVWzDqK5
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2020 08:06:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1594764398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=TZoFqhrhnyGVl3KPBzDXcbJOfI0wT3HxGjDo0aS5YYs=;
 b=br21QSAa9VukpTuk86hnr1hzRs6QuCliBNN+VKQKTGi9MPJLKocxXWG6AMwgxTMT9KNSrz
 yPUVdGBLLZYBcltzAdlk/VebfC3pwadsG7fmEzsG1e4Smj87qs30bLO7qPvxgYlA/EGAph
 QSiCmUy1pkFOnqGcN8+nQXHGNRJXzjk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1594764398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=TZoFqhrhnyGVl3KPBzDXcbJOfI0wT3HxGjDo0aS5YYs=;
 b=br21QSAa9VukpTuk86hnr1hzRs6QuCliBNN+VKQKTGi9MPJLKocxXWG6AMwgxTMT9KNSrz
 yPUVdGBLLZYBcltzAdlk/VebfC3pwadsG7fmEzsG1e4Smj87qs30bLO7qPvxgYlA/EGAph
 QSiCmUy1pkFOnqGcN8+nQXHGNRJXzjk=
Received: from SCL-EXCHMB-13.phoenix.com (67.51.239.50 [67.51.239.50])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-YKfqoWT7NuK4_pvGoTfI6Q-1; Tue, 14 Jul 2020 14:04:00 -0400
X-MC-Unique: YKfqoWT7NuK4_pvGoTfI6Q-1
X-CrossPremisesHeadersFilteredBySendConnector: SCL-EXCHMB-13.phoenix.com
Received: from SCL-EXCHMB-13.phoenix.com (10.122.68.16) by
 SCL-EXCHMB-13.phoenix.com (10.122.68.16) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Tue, 14 Jul 2020 11:03:59 -0700
Received: from SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b]) by
 SCL-EXCHMB-13.phoenix.com ([fe80::fd2e:a8f8:f740:cb3b%12]) with mapi id
 15.00.1156.000; Tue, 14 Jul 2020 11:03:58 -0700
From: Patrick Voelker <Patrick_Voelker@phoenix.com>
To: "OpenBMC (openbmc@lists.ozlabs.org)" <openbmc@lists.ozlabs.org>
Subject: Discrete sensors for host error monitor signals
Thread-Topic: Discrete sensors for host error monitor signals
Thread-Index: AdZaBtPfaDKvEfLTTQ2Oqgr/rUvEwQ==
Date: Tue, 14 Jul 2020 18:03:58 +0000
Message-ID: <b0f8f9e05d6041cd87474866b8dc70dc@SCL-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.122.68.139]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: SCL-EXCHMB-13.phoenix.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: phoenix.com
Content-Type: multipart/alternative;
 boundary="_000_b0f8f9e05d6041cd87474866b8dc70dcSCLEXCHMB13phoenixcom_"
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

--_000_b0f8f9e05d6041cd87474866b8dc70dcSCLEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi, I'd like to log IPMI SEL events for changes in the signals monitored by=
 OpenBMC/host-error-monitor.  I don't have much experience with OpenBMC's s=
ensors yet so I'm not sure what the best approach is and am looking for som=
e guidance.

I haven't found a good example yet of a IPMI discrete sensor and I don't wa=
nt to put IPMI specific information into host-error-monitor to directly add=
 SEL events via phosphor-sel-logger.

Here's my understanding thus far :

* A module needs to instantiate dbus sensors representing the signals being=
 monitored.  This could be done in host-error-monitor or duplicate some of =
the functionality in dbus-sensors.  Is there a benefit to extending one ove=
r the other?

* One or more IPMI SDRs should be created for the IPMI sensors needed to gr=
oup all the necessary discrete offsets.  If I'm using entity-manager in my =
build, is that where I would define this sensor?  If not, is there some oth=
er way to accomplish this?

* phosphor-sel-logger then needs to monitor (match) dbus discrete sensor pr=
operty changes to create appropriate IPMI and redfish logs for the events a=
s they occur.

Does that sound about right? Thanks in advance for your help.

--_000_b0f8f9e05d6041cd87474866b8dc70dcSCLEXCHMB13phoenixcom_
Content-Type: text/html; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
=09{font-family:Wingdings;
=09panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
=09{font-family:PMingLiU;
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
=09{font-family:PMingLiU;
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
=09{font-family:Calibri;
=09panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
=09{font-family:"\@PMingLiU";
=09panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
=09{margin:0in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
=09{mso-style-priority:99;
=09color:blue;
=09text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
=09{mso-style-priority:99;
=09color:purple;
=09text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
=09{mso-style-priority:34;
=09margin-top:0in;
=09margin-right:0in;
=09margin-bottom:0in;
=09margin-left:.5in;
=09margin-bottom:.0001pt;
=09font-size:11.0pt;
=09font-family:"Calibri","sans-serif";}
span.EmailStyle17
=09{mso-style-type:personal-compose;
=09font-family:"Calibri","sans-serif";
=09color:windowtext;}
.MsoChpDefault
=09{mso-style-type:export-only;
=09font-family:"Calibri","sans-serif";}
@page WordSection1
=09{size:8.5in 11.0in;
=09margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
=09{page:WordSection1;}
/* List Definitions */
@list l0
=09{mso-list-id:1273636793;
=09mso-list-type:hybrid;
=09mso-list-template-ids:451844412 -483367740 67698691 67698693 67698689 67=
698691 67698693 67698689 67698691 67698693;}
@list l0:level1
=09{mso-level-start-at:0;
=09mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;
=09mso-fareast-font-family:PMingLiU;
=09mso-bidi-font-family:"Times New Roman";}
@list l0:level2
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l0:level3
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l0:level4
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l0:level5
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l0:level6
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
@list l0:level7
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0B7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Symbol;}
@list l0:level8
=09{mso-level-number-format:bullet;
=09mso-level-text:o;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:"Courier New";}
@list l0:level9
=09{mso-level-number-format:bullet;
=09mso-level-text:\F0A7;
=09mso-level-tab-stop:none;
=09mso-level-number-position:left;
=09text-indent:-.25in;
=09font-family:Wingdings;}
ol
=09{margin-bottom:0in;}
ul
=09{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi, I&#8217;d like to log IPMI SEL events for change=
s in the signals monitored by OpenBMC/host-error-monitor.&nbsp; I don&#8217=
;t have much experience with OpenBMC&#8217;s sensors yet so I&#8217;m not s=
ure what the best approach is and am looking for some guidance.<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I haven&#8217;t found a good example yet of a IPMI d=
iscrete sensor and I don&#8217;t want to put IPMI specific information into=
 host-error-monitor to directly add SEL events via phosphor-sel-logger.<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Here&#8217;s my understanding thus far :<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">* A module needs to instantiate dbus sensors represe=
nting the signals being monitored.&nbsp; This could be done in host-error-m=
onitor or duplicate some of the functionality in dbus-sensors.&nbsp; Is the=
re a benefit to extending one over the other?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">* One or more IPMI SDRs should be created for the IP=
MI sensors needed to group all the necessary discrete offsets. &nbsp;If I&#=
8217;m using entity-manager in my build, is that where I would define this =
sensor?&nbsp; If not, is there some other way to accomplish
 this?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">* phosphor-sel-logger then needs to monitor (match) =
dbus discrete sensor property changes to create appropriate IPMI and redfis=
h logs for the events as they occur.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Does that sound about right? Thanks in advance for y=
our help.<o:p></o:p></p>
</div>
</body>
</html>

--_000_b0f8f9e05d6041cd87474866b8dc70dcSCLEXCHMB13phoenixcom_--

