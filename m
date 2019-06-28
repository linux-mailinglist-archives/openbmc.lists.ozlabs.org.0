Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DBD5901A
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 04:01:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zg4G5TwRzDqYP
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 12:01:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.78.124; helo=nam03-by2-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="RPq5ZLqR"; dkim-atps=neutral
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780124.outbound.protection.outlook.com [40.107.78.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zg1z0rcrzDqc2
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 11:59:49 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gpi+4pK9mae4VH4mhJnETy3lk1gaD2g39YQjRayKUPqqXTt6p7HIEll4gtYykkLUwo7MUDQBTuVw6Zgapw9ff24p5DHR9sLpDuRP+V05XVbqjapAeMNyqUMqb4NPGz7MgidxglL1r11jTJbL/s4JNGY0XBQp46DTzKmePZjb0kp69cfaRuT1DUDue29mGidrBsFfwFPtk0WlulP2NlL01MRq9nXau8A1GBHkXilpMtkb02Kr77IPwocDPMBZ3Lmq3Js3VOQAU0kDO5/i6t7TqHPJ7drykoc3+5B8qzVTafnqYJmCrd99Y48zR5NHmfgU70kUfLS1uO7tjD3YfDlfIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOjRM/8BghBIv0irwAyyqh15D+OuB5cWBrcJ9j9EQ70=;
 b=mqgclIANZ53GHDCQchfkrmjzE9Bdtxtkd4ThsI/VinO7MrCSj9xGu+2sQ6thlDxMgTdDoTGYPQaa/UOU4e8es+C+YdPNwfIg7DQbffrWvNhwik5S3TBBjmjuYkBew+CnfXlMmH/zZpjpeZMp0r1FWPEoJE0cI6L26XeZ9VEugVejNIfIbB5rdp8clvdUq1OCc/qfCLHrhaAdU82CXdzdBV6JOzXnqRn25ZZqo2wQ/8bf9ltC4BGWV2leJFhHUOxgj9DoQoBF4tejgWn0gKifP9by4Lv0DAa8jdSmVXi4lI/sXxErRJduIUFnlHabWLXSHzHVKNxgHLM91qiOcCtclg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=microsoft.com;dmarc=pass action=none
 header.from=microsoft.com;dkim=pass header.d=microsoft.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rOjRM/8BghBIv0irwAyyqh15D+OuB5cWBrcJ9j9EQ70=;
 b=RPq5ZLqRG7OoNkR12P2+aD5ZsndslpA0LmePlLsxwbekBXmfpWrSsdSlybrh18nPviEGa+L5uId5ZUeuhbEG6YuOSDA9EuONiBq8e+PwvCQcQbKqSbFxHMoyais4JmGUmMn8gZ1x6egUClH7cjFK33Etf7WdQ5o1srKMI77US/Q=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1143.namprd21.prod.outlook.com (20.179.56.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.4; Fri, 28 Jun 2019 01:59:45 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::d8f2:358f:52df:2969]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::d8f2:358f:52df:2969%2]) with mapi id 15.20.2052.003; Fri, 28 Jun 2019
 01:59:45 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Platform telemetry and health monitoring - PST AM 
Thread-Topic: Platform telemetry and health monitoring - PST AM 
Thread-Index: AdUtVLT+5UuG+XQ0Qk+0liU5b4GipwAABBAw
Date: Fri, 28 Jun 2019 01:59:44 +0000
Message-ID: <BYAPR21MB1191FB603B4E4214DA6A5062C8FC0@BYAPR21MB1191.namprd21.prod.outlook.com>
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
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-ms-exchange-calendar-series-instance-id: BAAAAIIA4AB0xbcQGoLgCAAAAABw5veoZxrVAQAAAAAAAAAAEAAAAErAeogCSh1JlndscP9neDA=
x-originating-ip: [2001:4898:80e8:7:f2:8e63:ab17:b2ab]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 196eb01f-e89e-41cb-66cf-08d6fb6c4ae8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR21MB1143; 
x-ms-traffictypediagnostic: BYAPR21MB1143:
x-ms-exchange-purlcount: 9
x-microsoft-antispam-prvs: <BYAPR21MB114327826A68EDC4A8EF2C59C8FC0@BYAPR21MB1143.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(346002)(39860400002)(366004)(396003)(199004)(189003)(33656002)(52536014)(46003)(5660300002)(8936002)(99286004)(10290500003)(102836004)(25786009)(2906002)(478600001)(2501003)(4744005)(8676002)(68736007)(81166006)(1730700003)(81156014)(6116002)(790700001)(186003)(6916009)(22452003)(486006)(8990500004)(256004)(476003)(316002)(66946007)(73956011)(76116006)(71190400001)(74316002)(64756008)(71200400001)(66446008)(66556008)(66476007)(6506007)(966005)(10090500001)(53936002)(7736002)(5640700003)(2351001)(7696005)(606006)(9686003)(6436002)(4743002)(6306002)(54896002)(55016002)(236005)(86362001)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1143;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QK3oTY25uA8gnTIWiVFljQOmq65n9Q96Z6zvTLQMnN2ymiwgQUsHDULO2x4sDfPBGAEpsqSsFoT4JCMMlgS3NrVf2JRn6/aRo5hnAlD7hOUYfzRfK5eMEQgwhN5ofkzbqeiAt+CEOxFktQOEgfHjKn1NAreEr0zmQTkQIw1VD1H+q6oXd+9/32o81s3cA55qjOWXheTlQKVPbVuDq6/V8rLxpaefpWSU8AhPy8uGusVG7A86VmnmvBMhNxRVhdQljsQh8NgarRtkZ6D675eylHVBNFNO34Ap0LdvoPTZEufcUsRGkKgdhtQjWVRkAAszWHD9ylfMNq69g1PV0pfxEYhEXGycUZTOah/tIxriVhccNEyILmGap9h8/JgYOg0k7R6oHbqtnUlQKeNdpJ5zESW2RNrzl6sCz1+LsP71Yr0=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR21MB1191FB603B4E4214DA6A5062C8FC0BYAPR21MB1191namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196eb01f-e89e-41cb-66cf-08d6fb6c4ae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 01:59:45.0447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1143
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

--_000_BYAPR21MB1191FB603B4E4214DA6A5062C8FC0BYAPR21MB1191namp_
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


--_000_BYAPR21MB1191FB603B4E4214DA6A5062C8FC0BYAPR21MB1191namp_
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
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/openbmc/wiki/P=
latform-telemetry-and-health-monitoring-Work-Group">https://github.com/open=
bmc/openbmc/wiki/Platform-telemetry-and-health-monitoring-Work-Group</a><o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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

--_000_BYAPR21MB1191FB603B4E4214DA6A5062C8FC0BYAPR21MB1191namp_
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
DQpERVNDUklQVElPTjtMQU5HVUFHRT1lbi1VUzpodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9v
cGVuYm1jL3dpa2kvUGxhdGZvcm0NCiAtdGVsZW1ldHJ5LWFuZC1oZWFsdGgtbW9uaXRvcmluZy1X
b3JrLUdyb3VwXG5cblxuXG5cbkpvaW4gTWljcm9zb2Z0IFRlYW1zIA0KIE1lZXRpbmc8aHR0cHM6
Ly90ZWFtcy5taWNyb3NvZnQuY29tL2wvbWVldHVwLWpvaW4vMTklM2FtZWV0aW5nX01EVTFORE0y
WTJFDQogdE9UWmtZeTAwWmpJNUxUa3pNRGN0TWpNeFpEWXlOemxoTmpReSU0MHRocmVhZC52Mi8w
P2NvbnRleHQ9JTdiJTIyVGlkJTIyJTMNCiBhJTIyNzJmOTg4YmYtODZmMS00MWFmLTkxYWItMmQ3
Y2QwMTFkYjQ3JTIyJTJjJTIyT2lkJTIyJTNhJTIyMWMyOWMyZjctZDM4Ng0KIC00YzVhLWEzYmMt
MGVlMTNiNDhiYzY1JTIyJTdkPlxuKzEgMzIzLTg0OS00ODc0PHRlbDorMSUyMDMyMy04NDktNDg3
NFwsXCw3DQogMzU3Mjg0MiM+ICAgVW5pdGVkIFN0YXRlc1wsIExvcyBBbmdlbGVzIChUb2xsKVxu
KDg2NikgNjc5LTk5OTU8dGVsOig4NjYpJTINCiAwNjc5LTk5OTVcLFwsNzM1NzI4NDIjPiAgIChU
b2xsLWZyZWUpXG5Db25mZXJlbmNlIElEOiA3MzUgNzI4IDQyI1xuTG9jYWwgbg0KIHVtYmVyczxo
dHRwczovL2RpYWxpbi50ZWFtcy5taWNyb3NvZnQuY29tLzg1NTFmNGMxLWJlYTMtNDQxYS04NzM4
LTY5YWE1MTdhDQogOTFjNT9pZD03MzU3Mjg0Mj4gfCBSZXNldCBQSU48aHR0cHM6Ly9teXNldHRp
bmdzLmx5bmMuY29tL3BzdG5jb25mZXJlbmNpbmcNCiA+IHwgTGVhcm4gbW9yZSBhYm91dCBUZWFt
czxodHRwczovL2dvLm1pY3Jvc29mdC5jb20vZndsaW5rLz9saW5raWQ9ODU3MjUwPg0KICB8IE1l
ZXRpbmcgb3B0aW9uczxodHRwczovL3RlYW1zLm1pY3Jvc29mdC5jb20vbWVldGluZ09wdGlvbnMv
P29yZ2FuaXplcklkDQogPTFjMjljMmY3LWQzODYtNGM1YS1hM2JjLTBlZTEzYjQ4YmM2NSZ0ZW5h
bnRJZD03MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0yZDcNCiBjZDAxMWRiNDcmdGhyZWFkSWQ9MTlf
bWVldGluZ19NRFUxTkRNMlkyRXRPVFprWXkwMFpqSTVMVGt6TURjdE1qTXhaRFl5TnpsaA0KIE5q
UXlAdGhyZWFkLnYyJm1lc3NhZ2VJZD0wJmxhbmd1YWdlPWVuLVVTPlxuSm9pbiB3aXRoIGEgdmlk
ZW8gY29uZmVyZW5jaW5nDQogIGRldmljZVxuODEzODc4ODk2QHQucGxjbS52YzxtYWlsdG86ODEz
ODc4ODk2QHQucGxjbS52Yz4gVlRDIENvbmZlcmVuY2UgSUQNCiA6IDAxNzkyMDY4NFxuQWx0ZXJu
YXRlIFZUQyBkaWFsaW5nIGluc3RydWN0aW9uczxodHRwczovL2RpYWxpbi5wbGNtLnZjL3RlYQ0K
IG1zLz9rZXk9ODEzODc4ODk2JmNvbmY9MDE3OTIwNjg0PlxuXG4NClJSVUxFOkZSRVE9V0VFS0xZ
O1VOVElMPTIwMTkxMTE5VDE3MzAwMFo7SU5URVJWQUw9NDtCWURBWT1UVTtXS1NUPVNVDQpVSUQ6
MDQwMDAwMDA4MjAwRTAwMDc0QzVCNzEwMUE4MkUwMDgwMDAwMDAwMDcwRTZGN0E4NjcxQUQ1MDEw
MDAwMDAwMDAwMDAwMDANCiAwMTAwMDAwMDA0QUMwN0E4ODAyNEExRDQ5OTY3NzZDNzBGRjY3Nzgz
MA0KU1VNTUFSWTtMQU5HVUFHRT1lbi1VUzpQbGF0Zm9ybSB0ZWxlbWV0cnkgYW5kIGhlYWx0aCBt
b25pdG9yaW5nIC0gUFNUIEFNIA0KRFRTVEFSVDtUWklEPVBhY2lmaWMgU3RhbmRhcmQgVGltZToy
MDE5MDcwOVQwOTMwMDANCkRURU5EO1RaSUQ9UGFjaWZpYyBTdGFuZGFyZCBUaW1lOjIwMTkwNzA5
VDEwMzAwMA0KQ0xBU1M6UFVCTElDDQpQUklPUklUWTo1DQpEVFNUQU1QOjIwMTkwNjI4VDAxNTk0
MFoNClRSQU5TUDpPUEFRVUUNClNUQVRVUzpDT05GSVJNRUQNClNFUVVFTkNFOjINCkxPQ0FUSU9O
O0xBTkdVQUdFPWVuLVVTOk1pY3Jvc29mdCBUZWFtcyBNZWV0aW5nDQpYLU1JQ1JPU09GVC1DRE8t
QVBQVC1TRVFVRU5DRToyDQpYLU1JQ1JPU09GVC1DRE8tT1dORVJBUFBUSUQ6MzUyNjEwMjc1DQpY
LU1JQ1JPU09GVC1DRE8tQlVTWVNUQVRVUzpURU5UQVRJVkUNClgtTUlDUk9TT0ZULUNETy1JTlRF
TkRFRFNUQVRVUzpCVVNZDQpYLU1JQ1JPU09GVC1DRE8tQUxMREFZRVZFTlQ6RkFMU0UNClgtTUlD
Uk9TT0ZULUNETy1JTVBPUlRBTkNFOjENClgtTUlDUk9TT0ZULUNETy1JTlNUVFlQRToxDQpYLU1J
Q1JPU09GVC1TS1lQRVRFQU1TTUVFVElOR1VSTDpodHRwczovL3RlYW1zLm1pY3Jvc29mdC5jb20v
bC9tZWV0dXAtam9pbi8NCiAxOSUzYW1lZXRpbmdfTURVMU5ETTJZMkV0T1Raa1l5MDBaakk1TFRr
ek1EY3RNak14WkRZeU56bGhOalF5JTQwdGhyZWFkLnYyLw0KIDA/Y29udGV4dD0lN2IlMjJUaWQl
MjIlM2ElMjI3MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0yZDdjZDAxMWRiNDclMjIlMmMlMjJPDQog
aWQlMjIlM2ElMjIxYzI5YzJmNy1kMzg2LTRjNWEtYTNiYy0wZWUxM2I0OGJjNjUlMjIlN2QNClgt
TUlDUk9TT0ZULVNDSEVEVUxJTkdTRVJWSUNFVVBEQVRFVVJMOmh0dHBzOi8vc2NoZWQuc2Vydmlj
ZXMuc2t5cGUubmV0L3RlYQ0KIG1zLzcyZjk4OGJmLTg2ZjEtNDFhZi05MWFiLTJkN2NkMDExZGI0
Ny8xYzI5YzJmNy1kMzg2LTRjNWEtYTNiYy0wZWUxM2I0OGJjDQogNjUvMTlfbWVldGluZ19NRFUx
TkRNMlkyRXRPVFprWXkwMFpqSTVMVGt6TURjdE1qTXhaRFl5TnpsaE5qUXlAdGhyZWFkLnYyLzAN
ClgtTUlDUk9TT0ZULVNLWVBFVEVBTVNQUk9QRVJUSUVTOnsiY2lkIjoiMTk6bWVldGluZ19NRFUx
TkRNMlkyRXRPVFprWXkwMFpqSQ0KIDVMVGt6TURjdE1qTXhaRFl5TnpsaE5qUXlAdGhyZWFkLnYy
IlwsInByaXZhdGUiOnRydWVcLCJ0eXBlIjowXCwibWlkIjowXCwiDQogcmlkIjowXCwidWlkIjpu
dWxsfQ0KWC1NSUNST1NPRlQtT05MSU5FTUVFVElOR0NPTkZMSU5LOmNvbmY6c2lwOm5lbGFka0Bt
aWNyb3NvZnQuY29tXDtncnV1XDtvcGFxDQogdWU9YXBwOmNvbmY6Zm9jdXM6aWQ6dGVhbXM6Mjow
ITE5Om1lZXRpbmdfTURVMU5ETTJZMkV0T1Raa1l5MDBaakk1TFRrek1EY3QNCiBNak14WkRZeU56
bGhOalF5LXRocmVhZC52MiExYzI5YzJmN2QzODY0YzVhYTNiYzBlZTEzYjQ4YmM2NSE3MmY5ODhi
Zjg2ZjE0MQ0KIGFmOTFhYjJkN2NkMDExZGI0Nw0KWC1NSUNST1NPRlQtT05MSU5FTUVFVElOR0lO
Rk9STUFUSU9OOnsiT25saW5lTWVldGluZ1Byb3ZpZGVyIjozfQ0KWC1NSUNST1NPRlQtRE9OT1RG
T1JXQVJETUVFVElORzpGQUxTRQ0KWC1NSUNST1NPRlQtRElTQUxMT1ctQ09VTlRFUjpGQUxTRQ0K
WC1NSUNST1NPRlQtTE9DQVRJT05TOlt7IkRpc3BsYXlOYW1lIjoiTWljcm9zb2Z0IFRlYW1zIE1l
ZXRpbmciXCwiTG9jYXRpb25BDQogbm5vdGF0aW9uIjoiIlwsIkxvY2F0aW9uVXJpIjoiIlwsIkxv
Y2F0aW9uU3RyZWV0IjoiIlwsIkxvY2F0aW9uQ2l0eSI6IiJcLCINCiBMb2NhdGlvblN0YXRlIjoi
IlwsIkxvY2F0aW9uQ291bnRyeSI6IiJcLCJMb2NhdGlvblBvc3RhbENvZGUiOiIiXCwiTG9jYXRp
bw0KIG5GdWxsQWRkcmVzcyI6IiJ9XQ0KQkVHSU46VkFMQVJNDQpERVNDUklQVElPTjpSRU1JTkRF
Ug0KVFJJR0dFUjtSRUxBVEVEPVNUQVJUOi1QVDE1TQ0KQUNUSU9OOkRJU1BMQVkNCkVORDpWQUxB
Uk0NCkVORDpWRVZFTlQNCkVORDpWQ0FMRU5EQVINCg==

--_000_BYAPR21MB1191FB603B4E4214DA6A5062C8FC0BYAPR21MB1191namp_--
