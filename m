Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB26CBC0CE
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 05:53:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cnNK0CFQzDqRX
	for <lists+openbmc@lfdr.de>; Tue, 24 Sep 2019 13:53:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.71.110; helo=nam05-by2-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="bWSmGlwj"; dkim-atps=neutral
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710110.outbound.protection.outlook.com [40.107.71.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cnMW6rxCzDqQs
 for <openbmc@lists.ozlabs.org>; Tue, 24 Sep 2019 13:52:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXfSxJuyoUf2yxCvhkfLcxDnW6pZRd9HO0R1pvOhU22PgoR87/hOWF1ILRqN5RrNxXcSR6XfD42WDSLn5BN2cfFggDBIFH9YiewN4Ngx6NVD5v1EaL2mDDfpoP9LHKnE5FkiDeouP4hNZN/kHFNZ03mX59dziqb8unHx9CvkpiTd4nDz72Hjhey2F6dkFLaJN26BtxWE6YHPZwgq52eGtOTCvUNiILbDAHAf/0KxItG3vZhosqieKdQkCx7z36mPDdM0Jm184b8/MFtIrYsDfGGj58vN4SqifD2CVT609Vz2n+Cba4BuMzc9LBfOp4c3sNqkmjRTS+gv2SO1RqI4vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1foMUBStNg30ehSbnoEKnma3Z0DpriLWwQrTUcedxAU=;
 b=KAL+HDjK1mv3VLF0OAyXIkJh+L6PB7t+SKfue2kBB+KgSnlQqCkD725AupynAS2QeLyQpYzvR4foSMA6mKHmemWyXus7ggp89dtDE7iV+31W7cTO4ZRJRn0KoDz0UxwbZbKtgCAVXlWst6vsyfTkok1MEwuSobyYU55txzRXqaW0MR7ZWJpZgbd2TbfdYGbDDAjlyKL1JbDUp8rZWBX+51MQnsRcWKD17w+y17LjG4TGNxgOYn2ROkMt2gTe17VbO6AgVsPpDH521ZtQFTHD2eGexmYBkZ8Oe4CHp+Axex2ojfDX/BPwA42xjqm5SD2CBLHW0K1tOmdx3YQVDIhvhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1foMUBStNg30ehSbnoEKnma3Z0DpriLWwQrTUcedxAU=;
 b=bWSmGlwj7peAGmWttOG9zcWD+oCo3YtPxMkzPOVENMZ8BaOlGgyzRTANydiILksiXjBfG/pRVnDzZUMtMu3DHV1rVXf7eG0kRFpf0QSFd2ynwc+ujFjcWJ9keMB+5VVdJw2RUzEg3qasPoeDsUQzSTcwWtJtE3satM/o0/hDS0I=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1221.namprd21.prod.outlook.com (20.179.57.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.6; Tue, 24 Sep 2019 03:52:33 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::3c52:4e1f:202:b5db]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::3c52:4e1f:202:b5db%7]) with mapi id 15.20.2305.000; Tue, 24 Sep 2019
 03:52:33 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Platform Telemetry workgroup- bi-weekly sync 
Thread-Topic: Platform Telemetry workgroup- bi-weekly sync 
Thread-Index: AdVyi2uS47ovS1jOTeK/p2xl45QzrAAABGNA
Date: Tue, 24 Sep 2019 03:52:33 +0000
Message-ID: <BYAPR21MB11914DE3FBEFA6BDCE9935BDC8840@BYAPR21MB1191.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-ms-exchange-calendar-series-instance-id: BAAAAIIA4AB0xbcQGoLgCAAAAAAwQKuQUHLVAQAAAAAAAAAAEAAAAG9ABZX2S+ZPmzvlyGFC47c=
x-originating-ip: [50.54.140.107]
x-ms-office365-filtering-correlation-id: 212e724a-f6e4-4c8d-06fc-08d740a2a1a0
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR21MB1221:MeetingMessage
x-ms-exchange-purlcount: 6
x-microsoft-antispam-prvs: <BYAPR21MB1221594B85E107EEF2F123DBC8840@BYAPR21MB1221.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(9763003)(189003)(199004)(74316002)(66066001)(7736002)(5660300002)(236005)(6436002)(6306002)(5640700003)(9686003)(33656002)(55016002)(54896002)(52536014)(71200400001)(66476007)(66556008)(66446008)(6916009)(64756008)(66946007)(4744005)(71190400001)(256004)(2351001)(86362001)(476003)(486006)(10290500003)(316002)(2501003)(25786009)(6506007)(7696005)(99286004)(102836004)(76116006)(10090500001)(26005)(186003)(606006)(8990500004)(790700001)(6116002)(14454004)(3846002)(4743002)(8676002)(22452003)(81166006)(81156014)(1730700003)(8936002)(2906002)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1221;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C6Y6aNycYmECf3N1fjoErFtg9SHGu5sZiQ9YgCqX6Au19kiHlN8+1S1n3ItR0hcuD8ygMpZsfc2CLik22ExWNgAFwl1fJtNhdN9NENds3M+vmiXVU4AcJ+qaJlrf70zCD0S/g07bvhfF3tuwULruFU6V4JkzeXRdrM2JmbFCu9vxBi3NJSGZIWDSeXsYNdg3X1vJnG4OUOb/eXj+cEsa7/7ICWs2q8ZOa/33iG1qs5HhYfIs0BCF/YYrDYuqcV53VWI6peZYae2GHjtZEdP34kYIXLVNipV+qZ72FtNL+JDnr6zjjdnuwR58tLx+2LiY8r+fY4NgY66nqG6yrc4olEVUXrLk+r2AqolysyuxRhnz81WSB2EELTIdwsYIqAkfkZMoXry12UEMgx9S+ABJF8KGOgIgXGIKEGfSTrMUjqYu44Wl+8b9qDhCbV/rtF+b6S4k56QJj0bKQmVnjW08gA==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR21MB11914DE3FBEFA6BDCE9935BDC8840BYAPR21MB1191namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 212e724a-f6e4-4c8d-06fc-08d740a2a1a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 03:52:33.5574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8PAjDw7K1wEA06PTWzpnbFMmUwWk6niRa1DDo+Ss+FT1gWHjofikRbfg8uKVMr6DdExcIRYH3LrA2fH6hrk/AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1221
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

--_000_BYAPR21MB11914DE3FBEFA6BDCE9935BDC8840BYAPR21MB1191namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Resending the invite

___________________________________________________________________________=
_____
Join Microsoft Teams Meeting<https://teams.microsoft.com/l/meetup-join/19%3=
ameeting_NjQ4OTFmNzYtNTlhOS00N2Q1LTlkYzUtNDBjYWQ0OGQ2OGJi%40thread.v2/0?con=
text=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22Oid%2=
2%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d>
+1 323-849-4874<tel:+1%20323-849-4874,,63604949#>   United States, Los Ange=
les (Toll)
(866) 679-9995<tel:(866)%20679-9995,,63604949#>   (Toll-free)
Conference ID: 636 049 49#
Local numbers<https://dialin.teams.microsoft.com/8551f4c1-bea3-441a-8738-69=
aa517a91c5?id=3D63604949> | Reset PIN<https://mysettings.lync.com/pstnconfe=
rencing> | Learn more about Teams<https://go.microsoft.com/fwlink/?linkid=
=3D857250> | Meeting options<https://teams.microsoft.com/meetingOptions/?or=
ganizerId=3D1c29c2f7-d386-4c5a-a3bc-0ee13b48bc65&tenantId=3D72f988bf-86f1-4=
1af-91ab-2d7cd011db47&threadId=3D19_meeting_NjQ4OTFmNzYtNTlhOS00N2Q1LTlkYzU=
tNDBjYWQ0OGQ2OGJi@thread.v2&messageId=3D0&language=3Den-US>
Join with a video conferencing device
813878896@t.plcm.vc<mailto:813878896@t.plcm.vc> VTC Conference ID: 01798859=
1
Alternate VTC dialing instructions<https://dialin.plcm.vc/teams/?key=3D8138=
78896&conf=3D017988591>
___________________________________________________________________________=
_____


--_000_BYAPR21MB11914DE3FBEFA6BDCE9935BDC8840BYAPR21MB1191namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
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
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
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
<p class=3D"MsoNormal">Resending the invite<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:gray">_________________________=
_______________________________________________________</span>
<o:p></o:p></p>
<div>
<div style=3D"margin-top:.25in;margin-bottom:7.5pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://teams.microsoft.com/l/meetup-join/=
19%3ameeting_NjQ4OTFmNzYtNTlhOS00N2Q1LTlkYzUtNDBjYWQ0OGQ2OGJi%40thread.v2/0=
?context=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22O=
id%22%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d" target=3D"_blank"><s=
pan style=3D"font-size:13.5pt;font-family:&quot;Segoe UI Semibold&quot;,san=
s-serif;color:#6264A7">Join
 Microsoft Teams Meeting</span></a> <o:p></o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:&#43;1%20323-849-4874,,63604949# " tar=
get=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decoratio=
n:none">&#43;1 323-849-4874</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; United States, Los Angeles (Toll)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:(866)%20679-9995,,63604949# " target=
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
s-serif;color:#252424">636 049 49#
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:.25in">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://dialin.teams.microsoft.com/8551f4c=
1-bea3-441a-8738-69aa517a91c5?id=3D63604949" target=3D"_blank"><span style=
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
011db47&amp;threadId=3D19_meeting_NjQ4OTFmNzYtNTlhOS00N2Q1LTlkYzUtNDBjYWQ0O=
GQ2OGJi@thread.v2&amp;messageId=3D0&amp;language=3Den-US" target=3D"_blank"=
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
 VTC Conference ID: 017988591 <o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424"><a href=3D"https://dialin.plcm.vc/tea=
ms/?key=3D813878896&amp;conf=3D017988591"><span style=3D"color:#6264A7;text=
-decoration:none">Alternate VTC dialing instructions</span></a>
<o:p></o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:gray">_________________________=
_______________________________________________________</span>
<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR21MB11914DE3FBEFA6BDCE9935BDC8840BYAPR21MB1191namp_
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
DQpERVNDUklQVElPTjtMQU5HVUFHRT1lbi1VUzpSZXNlbmRpbmcgdGhlIGludml0ZVxuXG5fX19f
X19fX19fX19fX19fX19fX19fX18NCiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX1xuSm9pbiBNaWNyb3NvZnQgVA0KIGVhbXMgTWVldGluZzxo
dHRwczovL3RlYW1zLm1pY3Jvc29mdC5jb20vbC9tZWV0dXAtam9pbi8xOSUzYW1lZXRpbmdfTmpR
NE9UDQogRm1Oell0TlRsaE9TMDBOMlExTFRsa1l6VXROREJqWVdRME9HUTJPR0ppJTQwdGhyZWFk
LnYyLzA/Y29udGV4dD0lN2IlMjJUaWQNCiAlMjIlM2ElMjI3MmY5ODhiZi04NmYxLTQxYWYtOTFh
Yi0yZDdjZDAxMWRiNDclMjIlMmMlMjJPaWQlMjIlM2ElMjIxYzI5YzJmNw0KIC1kMzg2LTRjNWEt
YTNiYy0wZWUxM2I0OGJjNjUlMjIlN2Q+XG4rMSAzMjMtODQ5LTQ4NzQ8dGVsOisxJTIwMzIzLTg0
OS00ODc0DQogXCxcLDYzNjA0OTQ5Iz4gICBVbml0ZWQgU3RhdGVzXCwgTG9zIEFuZ2VsZXMgKFRv
bGwpXG4oODY2KSA2NzktOTk5NTx0ZWw6KDgNCiA2NiklMjA2NzktOTk5NVwsXCw2MzYwNDk0OSM+
ICAgKFRvbGwtZnJlZSlcbkNvbmZlcmVuY2UgSUQ6IDYzNiAwNDkgNDkjXG5Mbw0KIGNhbCBudW1i
ZXJzPGh0dHBzOi8vZGlhbGluLnRlYW1zLm1pY3Jvc29mdC5jb20vODU1MWY0YzEtYmVhMy00NDFh
LTg3MzgtNjlhDQogYTUxN2E5MWM1P2lkPTYzNjA0OTQ5PiB8IFJlc2V0IFBJTjxodHRwczovL215
c2V0dGluZ3MubHluYy5jb20vcHN0bmNvbmZlcmUNCiBuY2luZz4gfCBMZWFybiBtb3JlIGFib3V0
IFRlYW1zPGh0dHBzOi8vZ28ubWljcm9zb2Z0LmNvbS9md2xpbmsvP2xpbmtpZD04NQ0KIDcyNTA+
IHwgTWVldGluZyBvcHRpb25zPGh0dHBzOi8vdGVhbXMubWljcm9zb2Z0LmNvbS9tZWV0aW5nT3B0
aW9ucy8/b3JnYW5pDQogemVySWQ9MWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYzY1
JnRlbmFudElkPTcyZjk4OGJmLTg2ZjEtNDFhZi05MWENCiBiLTJkN2NkMDExZGI0NyZ0aHJlYWRJ
ZD0xOV9tZWV0aW5nX05qUTRPVEZtTnpZdE5UbGhPUzAwTjJRMUxUbGtZelV0TkRCallXUQ0KIDBP
R1EyT0dKaUB0aHJlYWQudjImbWVzc2FnZUlkPTAmbGFuZ3VhZ2U9ZW4tVVM+XG5Kb2luIHdpdGgg
YSB2aWRlbyBjb25mZXJlDQogbmNpbmcgZGV2aWNlXG44MTM4Nzg4OTZAdC5wbGNtLnZjPG1haWx0
bzo4MTM4Nzg4OTZAdC5wbGNtLnZjPiBWVEMgQ29uZmVyZW4NCiBjZSBJRDogMDE3OTg4NTkxXG5B
bHRlcm5hdGUgVlRDIGRpYWxpbmcgaW5zdHJ1Y3Rpb25zPGh0dHBzOi8vZGlhbGluLnBsY20udg0K
IGMvdGVhbXMvP2tleT04MTM4Nzg4OTYmY29uZj0wMTc5ODg1OTE+XG5fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQogX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX1xuXG4NClJSVUxFOkZSRVE9V0VFS0xZO0lOVEVSVkFMPTI7QllEQVk9VFU7V0tT
VD1TVQ0KVUlEOjA0MDAwMDAwODIwMEUwMDA3NEM1QjcxMDFBODJFMDA4MDAwMDAwMDAzMDQwQUI5
MDUwNzJENTAxMDAwMDAwMDAwMDAwMDAwDQogMDEwMDAwMDAwNkY0MDA1OTVGNjRCRTY0RjlCM0JF
NUM4NjE0MkUzQjcNClNVTU1BUlk7TEFOR1VBR0U9ZW4tVVM6UGxhdGZvcm0gVGVsZW1ldHJ5IHdv
cmtncm91cC0gYmktd2Vla2x5IHN5bmMgDQpEVFNUQVJUO1RaSUQ9UGFjaWZpYyBTdGFuZGFyZCBU
aW1lOjIwMTkxMDAxVDA5MzAwMA0KRFRFTkQ7VFpJRD1QYWNpZmljIFN0YW5kYXJkIFRpbWU6MjAx
OTEwMDFUMTAzMDAwDQpDTEFTUzpQVUJMSUMNClBSSU9SSVRZOjUNCkRUU1RBTVA6MjAxOTA5MjRU
MDM1MjMwWg0KVFJBTlNQOk9QQVFVRQ0KU1RBVFVTOkNPTkZJUk1FRA0KU0VRVUVOQ0U6MA0KTE9D
QVRJT047TEFOR1VBR0U9ZW4tVVM6TWljcm9zb2Z0IFRlYW1zIE1lZXRpbmcNClgtTUlDUk9TT0ZU
LUNETy1BUFBULVNFUVVFTkNFOjANClgtTUlDUk9TT0ZULUNETy1PV05FUkFQUFRJRDotMTEzMDkx
NTg2OQ0KWC1NSUNST1NPRlQtQ0RPLUJVU1lTVEFUVVM6VEVOVEFUSVZFDQpYLU1JQ1JPU09GVC1D
RE8tSU5URU5ERURTVEFUVVM6QlVTWQ0KWC1NSUNST1NPRlQtQ0RPLUFMTERBWUVWRU5UOkZBTFNF
DQpYLU1JQ1JPU09GVC1DRE8tSU1QT1JUQU5DRToxDQpYLU1JQ1JPU09GVC1DRE8tSU5TVFRZUEU6
MQ0KWC1NSUNST1NPRlQtU0tZUEVURUFNU01FRVRJTkdVUkw6aHR0cHM6Ly90ZWFtcy5taWNyb3Nv
ZnQuY29tL2wvbWVldHVwLWpvaW4vDQogMTklM2FtZWV0aW5nX05qUTRPVEZtTnpZdE5UbGhPUzAw
TjJRMUxUbGtZelV0TkRCallXUTBPR1EyT0dKaSU0MHRocmVhZC52Mi8NCiAwP2NvbnRleHQ9JTdi
JTIyVGlkJTIyJTNhJTIyNzJmOTg4YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3JTIyJTJj
JTIyTw0KIGlkJTIyJTNhJTIyMWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYzY1JTIy
JTdkDQpYLU1JQ1JPU09GVC1TQ0hFRFVMSU5HU0VSVklDRVVQREFURVVSTDpodHRwczovL3NjaGVk
LnNlcnZpY2VzLnNreXBlLm5ldC90ZWENCiBtcy83MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0yZDdj
ZDAxMWRiNDcvMWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYw0KIDY1LzE5X21lZXRp
bmdfTmpRNE9URm1Oell0TlRsaE9TMDBOMlExTFRsa1l6VXROREJqWVdRME9HUTJPR0ppQHRocmVh
ZC52Mi8wDQpYLU1JQ1JPU09GVC1TS1lQRVRFQU1TUFJPUEVSVElFUzp7ImNpZCI6IjE5Om1lZXRp
bmdfTmpRNE9URm1Oell0TlRsaE9TMDBOMlENCiAxTFRsa1l6VXROREJqWVdRME9HUTJPR0ppQHRo
cmVhZC52MiJcLCJwcml2YXRlIjp0cnVlXCwidHlwZSI6MFwsIm1pZCI6MFwsIg0KIHJpZCI6MFws
InVpZCI6bnVsbH0NClgtTUlDUk9TT0ZULU9OTElORU1FRVRJTkdFWFRFUk5BTExJTks6DQpYLU1J
Q1JPU09GVC1PTkxJTkVNRUVUSU5HQ09ORkxJTks6Y29uZjpzaXA6bmVsYWRrQG1pY3Jvc29mdC5j
b21cO2dydXVcO29wYXENCiB1ZT1hcHA6Y29uZjpmb2N1czppZDp0ZWFtczoyOjAhMTk6bWVldGlu
Z19OalE0T1RGbU56WXROVGxoT1MwME4yUTFMVGxrWXpVdA0KIE5EQmpZV1EwT0dRMk9HSmktdGhy
ZWFkLnYyITFjMjljMmY3ZDM4NjRjNWFhM2JjMGVlMTNiNDhiYzY1ITcyZjk4OGJmODZmMTQxDQog
YWY5MWFiMmQ3Y2QwMTFkYjQ3DQpYLU1JQ1JPU09GVC1ET05PVEZPUldBUkRNRUVUSU5HOkZBTFNF
DQpYLU1JQ1JPU09GVC1ESVNBTExPVy1DT1VOVEVSOkZBTFNFDQpYLU1JQ1JPU09GVC1MT0NBVElP
TlM6WyB7ICJEaXNwbGF5TmFtZSIgOiAiTWljcm9zb2Z0IFRlYW1zIE1lZXRpbmciXCwgIkxvY2EN
CiB0aW9uQW5ub3RhdGlvbiIgOiAiIlwsICJMb2NhdGlvblNvdXJjZSIgOiAwXCwgIlVucmVzb2x2
ZWQiIDogZmFsc2VcLCAiTG9jYQ0KIHRpb25VcmkiIDogIiIgfSBdDQpCRUdJTjpWQUxBUk0NCkRF
U0NSSVBUSU9OOlJFTUlOREVSDQpUUklHR0VSO1JFTEFURUQ9U1RBUlQ6LVBUMTVNDQpBQ1RJT046
RElTUExBWQ0KRU5EOlZBTEFSTQ0KRU5EOlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K

--_000_BYAPR21MB11914DE3FBEFA6BDCE9935BDC8840BYAPR21MB1191namp_--
