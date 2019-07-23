Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA9F72577
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 05:43:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45th5234xSzDqFB
	for <lists+openbmc@lfdr.de>; Wed, 24 Jul 2019 13:43:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.70.138; helo=nam04-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="XhTFGgOg"; dkim-atps=neutral
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700138.outbound.protection.outlook.com [40.107.70.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45t8NW5vLrzDqS2
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 16:54:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krLbcmVbI7ayr83Gj66Jy5WMGQKrLQPu7KQK7pLekjZC/UFxm+t7O4TVb3WaKlSZe9bv37KeoRG5ls1bv27V691yQQHm1WZQwOH71P52zx2EKIqQfnJBEE06xhDXotdKFMcbPP0qOvEgFzLACPJ4OtlUuSgUL1/qCwUvL04SXtx4DRY+Z4SCz+vOu8/B2rxc/sP3yQAuGpUAKuGegv4N4L4gu0bpjIM/CLWgRRxE0Zrc5eNgu+avQ8jQGLbq4LK+N+dSOGX01AFM7ooo1wAH5yljTKKUC/coFWdRQrWLf4c596lOPV89cT/Q2Q/PVE+gLWRcRNkPQFRhWiFUqAzpaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBC3vG1YFj2UJlPJ6c2V76g4WM3NGB/iOrluMGwVV20=;
 b=NhA1FoasXeynjJQTs5BTIvsUwZ1/NkrM96kUcKEEnLzzMksHNQCMLRIOkKV3l5E1lZNKLSGbOjM0F/jFDZCgN5abuQDp6og8Sc7gwXNY+Ybas6V3wzS/scyYT/bayRc4Dhimaae75DPSXw9h2gBQDKu5n2CXMJzd4RGoPonjje77ljKG8ZVCQVdg8usaceNGoazgOwlkPzbC2Vy/oDHbFfsCo7BX8s3i4D/eOfek24KsiacyQUI/6uu+mW10d9O4LUOwAsK1q+jk9MoC5UoGrtPxbezWb7blTvz/7SJehNkQRDbhlTMenR6d97+BEOXfTtWlpYZ5pgdWOR5u+c9rZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microsoft.com;dmarc=pass action=none
 header.from=microsoft.com;dkim=pass header.d=microsoft.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBC3vG1YFj2UJlPJ6c2V76g4WM3NGB/iOrluMGwVV20=;
 b=XhTFGgOg11AiLRa2ctBJ7wHbac7lh+cFmeb10Oc4XJ25KbKkp/fXNJ07mii6Lqq07ZSqol4VChkV1KwZpt09EAJRavxrCdDUxP6N2H4C6jApVWwIbr0rtdGpPXZyHh22kAGsFZDwG79E9NR/bx9svtzP5jg6CrmtEDGg3E33l70=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1157.namprd21.prod.outlook.com (20.179.56.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.3; Tue, 23 Jul 2019 06:54:26 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e130:926f:9b7a:76e4]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e130:926f:9b7a:76e4%2]) with mapi id 15.20.2136.000; Tue, 23 Jul 2019
 06:54:26 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Kun Yi
 <kunyi@google.com>
Subject: Platform telemetry and health monitoring - PST PM
Thread-Topic: Platform telemetry and health monitoring - PST PM
Thread-Index: AdUtVLT+5UuG+XQ0Qk+0liU5b4GipwAABBAw
Date: Tue, 23 Jul 2019 06:54:26 +0000
Message-ID: <BYAPR21MB1191D2F2C0CC3FB009E538F0C8C70@BYAPR21MB1191.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-05-20T20:24:51.7634725Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=7ad7e3a0-0fda-4efe-b5af-bd9df99a438a;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
x-ms-publictraffictype: Email
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-ms-exchange-calendar-series-instance-id: BAAAAIIA4AB0xbcQGoLgCAfjBwlw5veoZxrVAQAAAAAAAAAAEAAAAErAeogCSh1JlndscP9neDA=
x-originating-ip: [50.35.87.135]
x-ms-office365-filtering-correlation-id: bca63f4b-1f00-4a17-fa56-08d70f3a9a31
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR21MB1157; 
x-ms-traffictypediagnostic: BYAPR21MB1157:MeetingMessage
x-ms-exchange-purlcount: 9
x-microsoft-antispam-prvs: <BYAPR21MB115726D89994345F91189D0CC8C70@BYAPR21MB1157.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(23433003)(189003)(199004)(71190400001)(71200400001)(9686003)(6306002)(54896002)(55016002)(236005)(8990500004)(6436002)(2906002)(7736002)(4744005)(10090500001)(74316002)(8676002)(7696005)(3846002)(6116002)(790700001)(6506007)(68736007)(476003)(186003)(8936002)(26005)(81156014)(81166006)(102836004)(14454004)(53936002)(606006)(966005)(25786009)(10290500003)(478600001)(66066001)(66946007)(76116006)(5660300002)(110136005)(99286004)(486006)(316002)(33656002)(86362001)(52536014)(66446008)(66476007)(64756008)(66556008)(2501003)(256004)(22452003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1157;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZG0cvlnHalrvJJuwHuXSH1fjvcfgBMnhpji7fY5d7HKu3cUyBfeRsCdH940C5TZ89sHjzUyFIzWBl7wwTI/LUrX98cw3A24bKdUJ3XYQjmBKMOqcdSaBsMU+wv/0nIO7nWACjgG0F4iIWUgRT4dYZv8sTlFhGhS/WGszZ+JHapgICjPJmNlo1GkCYD3a7kV0SopccC+PKta/yb56L4eDMDLLRXbV0dRxtBL1esVcpAqy0MJF54ZUmp2ylgX5E4Y/lFTypP9sCpCXwGNOS3JXvTgNoBom0tXr22fn08BS8i9LDawxHkce66Amf9mVWI5UERpcimCxTgm9a7zkmzfBqGGyCFs0SaTW91Z058rho91x9hy0t11ZSGY9f6pAcu6Lz8a4Kkp4oGRy35u7O8VtOW42QwVoH44Zw40508zNZ5E=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR21MB1191D2F2C0CC3FB009E538F0C8C70BYAPR21MB1191namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bca63f4b-1f00-4a17-fa56-08d70f3a9a31
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 06:54:26.3639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1157
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

--_000_BYAPR21MB1191D2F2C0CC3FB009E538F0C8C70BYAPR21MB1191namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


https://github.com/openbmc/openbmc/wiki/Platform-telemetry-and-health-monit=
oring-Work-Group


Join Microsoft Teams Meeting<https://teams.microsoft.com/l/meetup-join/19%3=
ameeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQy%40thread.v2/0?con=
text=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22Oid%2=
2%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d>
+1 323-849-4874<tel:+1%20323-849-4874,,73572842#>   United States, Los Ange=
les (Toll)
(866) 679-9995<tel:(866)%20679-9995,,73572842#>   (Toll-free)
Conference ID: 735 728 42#
Local numbers<https://dialin.teams.microsoft.com/8551f4c1-bea3-441a-8738-69=
aa517a91c5?id=3D73572842> | Reset PIN<https://mysettings.lync.com/pstnconfe=
rencing> | Learn more about Teams<https://go.microsoft.com/fwlink/?linkid=
=3D857250> | Meeting options<https://teams.microsoft.com/meetingOptions/?or=
ganizerId=3D1c29c2f7-d386-4c5a-a3bc-0ee13b48bc65&tenantId=3D72f988bf-86f1-4=
1af-91ab-2d7cd011db47&threadId=3D19_meeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDc=
tMjMxZDYyNzlhNjQy@thread.v2&messageId=3D0&language=3Den-US>
Join with a video conferencing device
813878896@t.plcm.vc<mailto:813878896@t.plcm.vc> VTC Conference ID: 01792068=
4
Alternate VTC dialing instructions<https://dialin.plcm.vc/teams/?key=3D8138=
78896&conf=3D017920684>


--_000_BYAPR21MB1191D2F2C0CC3FB009E538F0C8C70BYAPR21MB1191namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Gulim;
	panose-1:2 11 6 0 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:"Segoe UI Semibold";
	panose-1:2 11 7 2 4 2 4 2 2 3;}
@font-face
	{font-family:"\@Gulim";
	panose-1:2 11 6 0 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
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
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:KO;}
span.EmailStyle19
	{mso-style-type:personal;
	color:#2F5496;
	font-weight:normal;
	font-style:normal;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/openbmc/wiki/P=
latform-telemetry-and-health-monitoring-Work-Group">https://github.com/open=
bmc/openbmc/wiki/Platform-telemetry-and-health-monitoring-Work-Group</a><o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://teams.microsoft.com/l/meetup-join/=
19%3ameeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQy%40thread.v2/0=
?context=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22O=
id%22%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d" target=3D"_blank"><s=
pan style=3D"font-size:13.5pt;font-family:&quot;Segoe UI Semibold&quot;,san=
s-serif;color:#6264A7">Join
 Microsoft Teams Meeting</span></a> <o:p></o:p></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:&#43;1%20323-849-4874,,73572842# " tar=
get=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decoratio=
n:none">&#43;1 323-849-4874</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; United States, Los Angeles (Toll)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:(866)%20679-9995,,73572842# " target=
=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decoration:n=
one">(866) 679-9995</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; (Toll-free)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
</div>
<div style=3D"margin-top:7.5pt;margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424">Conference ID:
</span><span style=3D"font-size:10.5pt;font-family:&quot;Segoe UI&quot;,san=
s-serif;color:#252424">735 728 42#
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:.25in">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://dialin.teams.microsoft.com/8551f4c=
1-bea3-441a-8738-69aa517a91c5?id=3D73572842" target=3D"_blank"><span style=
=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Local
 numbers</span></a> | <a href=3D"https://mysettings.lync.com/pstnconferenci=
ng" target=3D"_blank">
<span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Reset PI=
N</span></a> |
<a href=3D"https://go.microsoft.com/fwlink/?linkid=3D857250" target=3D"_bla=
nk"><span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Lear=
n more about Teams</span></a> |
<a href=3D"https://teams.microsoft.com/meetingOptions/?organizerId=3D1c29c2=
f7-d386-4c5a-a3bc-0ee13b48bc65&amp;tenantId=3D72f988bf-86f1-41af-91ab-2d7cd=
011db47&amp;threadId=3D19_meeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyN=
zlhNjQy@thread.v2&amp;messageId=3D0&amp;language=3Den-US" target=3D"_blank"=
>
<span style=3D"font-size:9.0pt;color:#6264A7;text-decoration:none">Meeting =
options</span></a>
<o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif;color:#252424">Join with a video conferencing devic=
e
<o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span class=3D"MsoHyperlink"><span style=3D"font-siz=
e:9.0pt;font-family:&quot;Segoe UI&quot;,sans-serif;color:#6264A7;text-deco=
ration:none"><a href=3D"mailto:813878896@t.plcm.vc">813878896@t.plcm.vc</a>=
</span></span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quo=
t;,sans-serif;color:#252424">
 VTC Conference ID: 017920684 <o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424"><a href=3D"https://dialin.plcm.vc/tea=
ms/?key=3D813878896&amp;conf=3D017920684"><span style=3D"color:#6264A7;text=
-decoration:none">Alternate VTC dialing instructions</span></a>
<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR21MB1191D2F2C0CC3FB009E538F0C8C70BYAPR21MB1191namp_
Content-Type: text/calendar; charset="utf-8"; method=REQUEST
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpNRVRIT0Q6UkVRVUVTVA0KUFJPRElEOk1pY3Jvc29mdCBFeGNoYW5n
ZSBTZXJ2ZXIgMjAxMA0KVkVSU0lPTjoyLjANCkJFR0lOOlZUSU1FWk9ORQ0KVFpJRDpQYWNpZmlj
IFN0YW5kYXJkIFRpbWUNCkJFR0lOOlNUQU5EQVJEDQpEVFNUQVJUOjE2MDEwMTAxVDAyMDAwMA0K
VFpPRkZTRVRGUk9NOi0wNzAwDQpUWk9GRlNFVFRPOi0wODAwDQpSUlVMRTpGUkVRPVlFQVJMWTtJ
TlRFUlZBTD0xO0JZREFZPTFTVTtCWU1PTlRIPTExDQpFTkQ6U1RBTkRBUkQNCkJFR0lOOkRBWUxJ
R0hUDQpEVFNUQVJUOjE2MDEwMTAxVDAyMDAwMA0KVFpPRkZTRVRGUk9NOi0wODAwDQpUWk9GRlNF
VFRPOi0wNzAwDQpSUlVMRTpGUkVRPVlFQVJMWTtJTlRFUlZBTD0xO0JZREFZPTJTVTtCWU1PTlRI
PTMNCkVORDpEQVlMSUdIVA0KRU5EOlZUSU1FWk9ORQ0KQkVHSU46VkVWRU5UDQpPUkdBTklaRVI7
Q049TmVlcmFqIExhZGthbmk6TUFJTFRPOm5lbGFka0BtaWNyb3NvZnQuY29tDQpBVFRFTkRFRTtS
T0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPW9w
ZW5ibWNAbGkNCiBzdHMub3psYWJzLm9yZzpNQUlMVE86b3BlbmJtY0BsaXN0cy5vemxhYnMub3Jn
DQpBVFRFTkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNW
UD1UUlVFO0NOPUt1biBZaTpNQUkNCiBMVE86a3VueWlAZ29vZ2xlLmNvbQ0KREVTQ1JJUFRJT047
TEFOR1VBR0U9ZW4tVVM6XG5odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3dpa2kv
UGxhdGZvDQogcm0tdGVsZW1ldHJ5LWFuZC1oZWFsdGgtbW9uaXRvcmluZy1Xb3JrLUdyb3VwXG5c
blxuSm9pbiBNaWNyb3NvZnQgVGVhbXMgTWUNCiBldGluZzxodHRwczovL3RlYW1zLm1pY3Jvc29m
dC5jb20vbC9tZWV0dXAtam9pbi8xOSUzYW1lZXRpbmdfTURVMU5ETTJZMkV0Tw0KIFRaa1l5MDBa
akk1TFRrek1EY3RNak14WkRZeU56bGhOalF5JTQwdGhyZWFkLnYyLzA/Y29udGV4dD0lN2IlMjJU
aWQlMjIlM2ElDQogMjI3MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0yZDdjZDAxMWRiNDclMjIlMmMl
MjJPaWQlMjIlM2ElMjIxYzI5YzJmNy1kMzg2LTQNCiBjNWEtYTNiYy0wZWUxM2I0OGJjNjUlMjIl
N2Q+XG4rMSAzMjMtODQ5LTQ4NzQ8dGVsOisxJTIwMzIzLTg0OS00ODc0XCxcLDczNQ0KIDcyODQy
Iz4gICBVbml0ZWQgU3RhdGVzXCwgTG9zIEFuZ2VsZXMgKFRvbGwpXG4oODY2KSA2NzktOTk5NTx0
ZWw6KDg2NiklMjA2DQogNzktOTk5NVwsXCw3MzU3Mjg0MiM+ICAgKFRvbGwtZnJlZSlcbkNvbmZl
cmVuY2UgSUQ6IDczNSA3MjggNDIjXG5Mb2NhbCBudW0NCiBiZXJzPGh0dHBzOi8vZGlhbGluLnRl
YW1zLm1pY3Jvc29mdC5jb20vODU1MWY0YzEtYmVhMy00NDFhLTg3MzgtNjlhYTUxN2E5MQ0KIGM1
P2lkPTczNTcyODQyPiB8IFJlc2V0IFBJTjxodHRwczovL215c2V0dGluZ3MubHluYy5jb20vcHN0
bmNvbmZlcmVuY2luZz4gDQogfCBMZWFybiBtb3JlIGFib3V0IFRlYW1zPGh0dHBzOi8vZ28ubWlj
cm9zb2Z0LmNvbS9md2xpbmsvP2xpbmtpZD04NTcyNTA+IHwNCiAgTWVldGluZyBvcHRpb25zPGh0
dHBzOi8vdGVhbXMubWljcm9zb2Z0LmNvbS9tZWV0aW5nT3B0aW9ucy8/b3JnYW5pemVySWQ9MQ0K
IGMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYzY1JnRlbmFudElkPTcyZjk4OGJmLTg2
ZjEtNDFhZi05MWFiLTJkN2NkDQogMDExZGI0NyZ0aHJlYWRJZD0xOV9tZWV0aW5nX01EVTFORE0y
WTJFdE9UWmtZeTAwWmpJNUxUa3pNRGN0TWpNeFpEWXlOemxoTmoNCiBReUB0aHJlYWQudjImbWVz
c2FnZUlkPTAmbGFuZ3VhZ2U9ZW4tVVM+XG5Kb2luIHdpdGggYSB2aWRlbyBjb25mZXJlbmNpbmcg
ZA0KIGV2aWNlXG44MTM4Nzg4OTZAdC5wbGNtLnZjPG1haWx0bzo4MTM4Nzg4OTZAdC5wbGNtLnZj
PiBWVEMgQ29uZmVyZW5jZSBJRDogDQogMDE3OTIwNjg0XG5BbHRlcm5hdGUgVlRDIGRpYWxpbmcg
aW5zdHJ1Y3Rpb25zPGh0dHBzOi8vZGlhbGluLnBsY20udmMvdGVhbXMNCiAvP2tleT04MTM4Nzg4
OTYmY29uZj0wMTc5MjA2ODQ+XG5cbg0KVUlEOjA0MDAwMDAwODIwMEUwMDA3NEM1QjcxMDFBODJF
MDA4MDAwMDAwMDA3MEU2RjdBODY3MUFENTAxMDAwMDAwMDAwMDAwMDAwDQogMDEwMDAwMDAwNEFD
MDdBODgwMjRBMUQ0OTk2Nzc2QzcwRkY2Nzc4MzANClJFQ1VSUkVOQ0UtSUQ7VFpJRD1QYWNpZmlj
IFN0YW5kYXJkIFRpbWU6MjAxOTA3MDlUMDkzMDAwDQpTVU1NQVJZO0xBTkdVQUdFPWVuLVVTOlBs
YXRmb3JtIHRlbGVtZXRyeSBhbmQgaGVhbHRoIG1vbml0b3JpbmcgLSBQU1QgUE0NCkRUU1RBUlQ7
VFpJRD1QYWNpZmljIFN0YW5kYXJkIFRpbWU6MjAxOTA3MjNUMjEwMDAwDQpEVEVORDtUWklEPVBh
Y2lmaWMgU3RhbmRhcmQgVGltZToyMDE5MDcyM1QyMjAwMDANCkNMQVNTOlBVQkxJQw0KUFJJT1JJ
VFk6NQ0KRFRTVEFNUDoyMDE5MDcyM1QwNjU0MjFaDQpUUkFOU1A6T1BBUVVFDQpTVEFUVVM6Q09O
RklSTUVEDQpTRVFVRU5DRTo0DQpMT0NBVElPTjtMQU5HVUFHRT1lbi1VUzpNaWNyb3NvZnQgVGVh
bXMgTWVldGluZw0KWC1NSUNST1NPRlQtQ0RPLUFQUFQtU0VRVUVOQ0U6NA0KWC1NSUNST1NPRlQt
Q0RPLU9XTkVSQVBQVElEOjM1MjYxMDI3NQ0KWC1NSUNST1NPRlQtQ0RPLUJVU1lTVEFUVVM6VEVO
VEFUSVZFDQpYLU1JQ1JPU09GVC1DRE8tSU5URU5ERURTVEFUVVM6QlVTWQ0KWC1NSUNST1NPRlQt
Q0RPLUFMTERBWUVWRU5UOkZBTFNFDQpYLU1JQ1JPU09GVC1DRE8tSU1QT1JUQU5DRToxDQpYLU1J
Q1JPU09GVC1DRE8tSU5TVFRZUEU6Mw0KWC1NSUNST1NPRlQtU0tZUEVURUFNU01FRVRJTkdVUkw6
aHR0cHM6Ly90ZWFtcy5taWNyb3NvZnQuY29tL2wvbWVldHVwLWpvaW4vDQogMTklM2FtZWV0aW5n
X01EVTFORE0yWTJFdE9UWmtZeTAwWmpJNUxUa3pNRGN0TWpNeFpEWXlOemxoTmpReSU0MHRocmVh
ZC52Mi8NCiAwP2NvbnRleHQ9JTdiJTIyVGlkJTIyJTNhJTIyNzJmOTg4YmYtODZmMS00MWFmLTkx
YWItMmQ3Y2QwMTFkYjQ3JTIyJTJjJTIyTw0KIGlkJTIyJTNhJTIyMWMyOWMyZjctZDM4Ni00YzVh
LWEzYmMtMGVlMTNiNDhiYzY1JTIyJTdkDQpYLU1JQ1JPU09GVC1TQ0hFRFVMSU5HU0VSVklDRVVQ
REFURVVSTDpodHRwczovL3NjaGVkLnNlcnZpY2VzLnNreXBlLm5ldC90ZWENCiBtcy83MmY5ODhi
Zi04NmYxLTQxYWYtOTFhYi0yZDdjZDAxMWRiNDcvMWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVl
MTNiNDhiYw0KIDY1LzE5X21lZXRpbmdfTURVMU5ETTJZMkV0T1Raa1l5MDBaakk1TFRrek1EY3RN
ak14WkRZeU56bGhOalF5QHRocmVhZC52Mi8wDQpYLU1JQ1JPU09GVC1TS1lQRVRFQU1TUFJPUEVS
VElFUzp7ImNpZCI6IjE5Om1lZXRpbmdfTURVMU5ETTJZMkV0T1Raa1l5MDBaakkNCiA1TFRrek1E
Y3RNak14WkRZeU56bGhOalF5QHRocmVhZC52MiJcLCJwcml2YXRlIjp0cnVlXCwidHlwZSI6MFws
Im1pZCI6MFwsIg0KIHJpZCI6MFwsInVpZCI6bnVsbH0NClgtTUlDUk9TT0ZULU9OTElORU1FRVRJ
TkdDT05GTElOSzpjb25mOnNpcDpuZWxhZGtAbWljcm9zb2Z0LmNvbVw7Z3J1dVw7b3BhcQ0KIHVl
PWFwcDpjb25mOmZvY3VzOmlkOnRlYW1zOjI6MCExOTptZWV0aW5nX01EVTFORE0yWTJFdE9UWmtZ
eTAwWmpJNUxUa3pNRGN0DQogTWpNeFpEWXlOemxoTmpReS10aHJlYWQudjIhMWMyOWMyZjdkMzg2
NGM1YWEzYmMwZWUxM2I0OGJjNjUhNzJmOTg4YmY4NmYxNDENCiBhZjkxYWIyZDdjZDAxMWRiNDcN
ClgtTUlDUk9TT0ZULU9OTElORU1FRVRJTkdJTkZPUk1BVElPTjp7Ik9ubGluZU1lZXRpbmdQcm92
aWRlciI6M30NClgtTUlDUk9TT0ZULURPTk9URk9SV0FSRE1FRVRJTkc6RkFMU0UNClgtTUlDUk9T
T0ZULURJU0FMTE9XLUNPVU5URVI6RkFMU0UNClgtTUlDUk9TT0ZULUxPQ0FUSU9OUzpbeyJEaXNw
bGF5TmFtZSI6Ik1pY3Jvc29mdCBUZWFtcyBNZWV0aW5nIlwsIkxvY2F0aW9uQQ0KIG5ub3RhdGlv
biI6IiJcLCJMb2NhdGlvblVyaSI6IiJcLCJMb2NhdGlvblN0cmVldCI6IiJcLCJMb2NhdGlvbkNp
dHkiOiIiXCwiDQogTG9jYXRpb25TdGF0ZSI6IiJcLCJMb2NhdGlvbkNvdW50cnkiOiIiXCwiTG9j
YXRpb25Qb3N0YWxDb2RlIjoiIlwsIkxvY2F0aW8NCiBuRnVsbEFkZHJlc3MiOiIifV0NCkVORDpW
RVZFTlQNCkVORDpWQ0FMRU5EQVINCg==

--_000_BYAPR21MB1191D2F2C0CC3FB009E538F0C8C70BYAPR21MB1191namp_--
