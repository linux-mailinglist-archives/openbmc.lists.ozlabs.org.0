Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 836A0244938
	for <lists+openbmc@lfdr.de>; Fri, 14 Aug 2020 13:49:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BShYV0fNmzDqmY
	for <lists+openbmc@lfdr.de>; Fri, 14 Aug 2020 21:49:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=phoenix.com (client-ip=216.205.24.170;
 helo=us-smtp-delivery-170.mimecast.com;
 envelope-from=venkata_chandrappa@phoenix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=phoenix.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=phoenix.com header.i=@phoenix.com header.a=rsa-sha256
 header.s=mimecast20170203 header.b=cRhGd2rX; 
 dkim=pass (1024-bit key) header.d=phoenix.com header.i=@phoenix.com
 header.a=rsa-sha256 header.s=mimecast20170203 header.b=Mxzotnsf; 
 dkim-atps=neutral
Received: from us-smtp-delivery-170.mimecast.com
 (us-smtp-delivery-170.mimecast.com [216.205.24.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BShXY2tvtzDqlZ
 for <openbmc@lists.ozlabs.org>; Fri, 14 Aug 2020 21:48:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1597405702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=vwWGZfCWcm7HudFKoqbrWq2k5wKeA8mmA1j4sPdySbM=;
 b=cRhGd2rX/IvBO95A1Kn3TMmuj+R+6St1YqpAXVyJ3DII9BbBDMQv/j1JHXsd6gyUNVMqar
 rDt12K0SU24PcdqdVLiJzmSE8piZA0Y6DzWp6I8yAXgZtFYU0UAaMI5begruu/JtDJfgzd
 nwDpQkpf+q6EXB73c1ACiXxwEXagUCk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phoenix.com;
 s=mimecast20170203; t=1597405703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=vwWGZfCWcm7HudFKoqbrWq2k5wKeA8mmA1j4sPdySbM=;
 b=MxzotnsfOWaiE1C/zo0qFWqh/1RNYMkSIR8ZiIpsjeDEyS6dd34N0dufy/IyU4b/wAVQ36
 vWGX/2kZjcXRTtPJZqERbdkGUklWk8ss6y1r8XzO2pUfA4bLKXQuYBHRlS65DKlvisMD2v
 TEI5k0UDUyaHDetexLXvs0SsQBazZOQ=
Received: from TWN-EXCHMB-13.phoenix.com (123.51.168.5 [123.51.168.5])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-voOMR6tlPzWGC6me9W-gmA-1; Fri, 14 Aug 2020 03:43:43 -0400
X-MC-Unique: voOMR6tlPzWGC6me9W-gmA-1
X-CrossPremisesHeadersFilteredBySendConnector: TWN-EXCHMB-13.phoenix.com
Received: from TWN-EXCHMB-13.phoenix.com
 (2607:f0dc:5001:ff01:bd71:dee3:623a:a76a) by TWN-EXCHMB-13.phoenix.com
 (2607:f0dc:5001:ff01:bd71:dee3:623a:a76a) with Microsoft SMTP Server (TLS) id
 15.0.1156.6; Fri, 14 Aug 2020 15:43:40 +0800
Received: from TWN-EXCHMB-13.phoenix.com ([fe80::bd71:dee3:623a:a76a]) by
 TWN-EXCHMB-13.phoenix.com ([fe80::bd71:dee3:623a:a76a%12]) with mapi id
 15.00.1156.000; Fri, 14 Aug 2020 15:43:40 +0800
From: Venkata Chandrappa <Venkata_Chandrappa@phoenix.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Generate Crashdump log via Redfish
Thread-Topic: Generate Crashdump log via Redfish
Thread-Index: AdZyDliBKsufoj1gRm+dHCJ12IIg5w==
Date: Fri, 14 Aug 2020 07:43:40 +0000
Message-ID: <51f516da2d844dd4b3b5bbce44f5acf7@TWN-EXCHMB-13.phoenix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2607:f0dc:5001:ff01:d5d4:cd6:1890:f4e9]
MIME-Version: 1.0
X-OrganizationHeadersPreserved: TWN-EXCHMB-13.phoenix.com
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA70A150 smtp.mailfrom=venkata_chandrappa@phoenix.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: phoenix.com
Content-Type: multipart/alternative;
 boundary="_000_51f516da2d844dd4b3b5bbce44f5acf7TWNEXCHMB13phoenixcom_"
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

--_000_51f516da2d844dd4b3b5bbce44f5acf7TWNEXCHMB13phoenixcom_
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi Everyone,

I'm looking for guidance on generating a crashdump log via the Redfish inte=
rface. There are two actions available to the user to generate the dump - O=
nDemand and SendRawPeci. But I'm not aware of the payload data I need to be=
 sending along with the request to generate the dump in either of the cases=
. Could you please share the payload that I need to attach to the request.

      "#Crashdump.OnDemand": {
        "target": "/redfish/v1/Systems/system/LogServices/Crashdump/Actions=
/Oem/Crashdump.OnDemand"
      },
      "#Crashdump.SendRawPeci": {
        "target": "/redfish/v1/Systems/system/LogServices/Crashdump/Actions=
/Oem/Crashdump.SendRawPeci"

Best Regards,
Venka

--_000_51f516da2d844dd4b3b5bbce44f5acf7TWNEXCHMB13phoenixcom_
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Everyone,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m looking for guidance on generating a crash=
dump log via the Redfish interface. There are two actions available to the =
user to generate the dump &#8211; OnDemand and SendRawPeci. But I&#8217;m n=
ot aware of the payload data I need to be sending along
 with the request to generate the dump in either of the cases. Could you pl=
ease share the payload that I need to attach to the request.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=3D"font-size:9.0pt;=
font-family:&quot;Courier New&quot;;color:#A31515">&quot;#Crashdump.OnDeman=
d&quot;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&=
quot;;color:black">:&nbsp;{<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=3D"font=
-size:9.0pt;font-family:&quot;Courier New&quot;;color:#A31515">&quot;target=
&quot;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&q=
uot;;color:black">:&nbsp;</span><span style=3D"font-size:9.0pt;font-family:=
&quot;Courier New&quot;;color:#0451A5">&quot;/redfish/v1/Systems/system/Log=
Services/Crashdump/Actions/Oem/Crashdump.OnDemand&quot;</span><span style=
=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=3D"font-size:9.0pt;=
font-family:&quot;Courier New&quot;;color:#A31515">&quot;#Crashdump.SendRaw=
Peci&quot;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier N=
ew&quot;;color:black">:&nbsp;{<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:12.0pt;background:#FFFFFE"><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"=
>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=3D"font=
-size:9.0pt;font-family:&quot;Courier New&quot;;color:#A31515">&quot;target=
&quot;</span><span style=3D"font-size:9.0pt;font-family:&quot;Courier New&q=
uot;;color:black">:&nbsp;</span><span style=3D"font-size:9.0pt;font-family:=
&quot;Courier New&quot;;color:#0451A5">&quot;/redfish/v1/Systems/system/Log=
Services/Crashdump/Actions/Oem/Crashdump.SendRawPeci&quot;</span><span styl=
e=3D"font-size:9.0pt;font-family:&quot;Courier New&quot;;color:black"><o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Best Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Venka<o:p></o:p></p>
</div>
</body>
</html>

--_000_51f516da2d844dd4b3b5bbce44f5acf7TWNEXCHMB13phoenixcom_--

