Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0841433F87
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 09:09:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J32M3JzBzDqCM
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 17:09:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.72.91; helo=nam05-co1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="cW+kqPOd"; dkim-atps=neutral
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720091.outbound.protection.outlook.com [40.107.72.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J31q1Dm7zDqMh
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 17:09:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=vjSJLwlrXnS0sP59D74WZlbh8W9kHooe4S3jPm7b+w0DjOA9n6unIuurxuHHmYg9EadPMx4KZiKg7ZZhgq0GSGFgSoc90nC5oB3CwimU+uTQ3rra9UKnpasRBybkChj4uP7Nt447ZUK1tUoLfy4MKC4A1ZOo0g6/wtt0Zb++RfI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71rruEoHHwRUJ15htjoi1uS483kFGN+yOexGzPKbW9Q=;
 b=xsYdy1No+sUsPbSHL4fmOX0HgOskHND2MkXo3FDLApydMxWlssVqJdiMshd9VKB+ztgH5axd4ieaGRZhXkDJz85+22LC5tUufmg3WeeuTv/hgG1OgXMHrqrZjt1nO3PxwNA/2fEdMeCKq11nTgO/hvhFYoU62uvzuNR7gqblc/E=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71rruEoHHwRUJ15htjoi1uS483kFGN+yOexGzPKbW9Q=;
 b=cW+kqPOdgcwwyWsUs3Yg3A+GtYVjR3UYvrrAoBgQWHQMPYLD9/u6K+aYczXQ+dsYEinCfNwmlnrfwEcUyT/sTtwgU+VBagn9oXd4eOWjZCZmHSga8LUvMhgijIluyz72IyRI73srDoXnGvINJXzIEUzcGx0meu3MuJDGT6fduzU=
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 (2603:10b6:207:30::20) by BL0PR2101MB1316.namprd21.prod.outlook.com
 (2603:10b6:208:92::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1987.3; Tue, 4 Jun
 2019 07:08:56 +0000
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae]) by BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae%4]) with mapi id 15.20.1987.003; Tue, 4 Jun 2019
 07:08:55 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: Chris Wood <cwood2@lenovo.com>, "Srikishen Pondicherry Shanmugam (kishan)"
 <kishan@cisco.com>, Sumeet Kochar <skochar@lenovo.com>, vishwa
 <vishwa@linux.vnet.ibm.com>, srinivas k <srinuklge@gmail.com>, Ofer Yehielli
 <ofery@google.com>, Kun Yi <kunyi@google.com>
Subject: Platform telemetry and health monitoring 
Thread-Topic: Platform telemetry and health monitoring 
Thread-Index: AdUapExp5UuG+XQ0Qk+0liU5b4GipwAABBAw
Date: Tue, 4 Jun 2019 07:08:55 +0000
Message-ID: <BL0PR2101MB09329DD2F8ABD41DCB4E4C63C8150@BL0PR2101MB0932.namprd21.prod.outlook.com>
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
x-originating-ip: [50.47.128.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 666bb1ad-f74c-41f5-36de-08d6e8bb8227
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BL0PR2101MB1316; 
x-ms-traffictypediagnostic: BL0PR2101MB1316:
x-ms-exchange-purlcount: 8
x-ld-processed: 72f988bf-86f1-41af-91ab-2d7cd011db47,ExtAddr
x-microsoft-antispam-prvs: <BL0PR2101MB1316624082F7410CB9307387C8150@BL0PR2101MB1316.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(39860400002)(346002)(376002)(396003)(199004)(189003)(497574002)(53754006)(71200400001)(6506007)(476003)(53546011)(102836004)(478600001)(14454004)(4326008)(26005)(256004)(33656002)(66476007)(73956011)(10290500003)(790700001)(3846002)(53936002)(4743002)(6116002)(66066001)(10090500001)(81166006)(81156014)(8676002)(7736002)(8936002)(86362001)(71190400001)(74316002)(64756008)(66556008)(110136005)(316002)(68736007)(66446008)(76116006)(186003)(66946007)(2906002)(99286004)(486006)(52536014)(606006)(7696005)(52396003)(9686003)(6306002)(54896002)(22452003)(5660300002)(6436002)(25786009)(8990500004)(236005)(55016002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR2101MB1316;
 H:BL0PR2101MB0932.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u82k7NEbEjNDENwd5DUevGL7tj9FsoRvvj8QYMmhRP5JJuorVa2udf7F/zxkyrQZzufZICna99kWEQUI/bmMkP11QoE6Aap1nK02VHYMCJqRXZPD/2DTMKKc/ox6ypq8o/gWhQ27EKcBg5rLP/eM9f3oIYmyhHnBAKLSokr/IvOFLxSNKiOtqs56CS5xWRw1YM0EFDNOcF+3bpdXTZvpniJ1vWqiyDFNS1NMgDPTdzt8AlLtN+FKFr5mc99LZ1QISlI8DDHnl8nYBrhQT63WQ0hguLq3EZJUFc6UjBhaNx+IALFsL13/WdxF0UniyMiI6VFVL4Q+53/0whfc3LapVn6JTGLgUAgDjqVDPDjvQhAtlFK5xGQruuKnNTN2EgYWzfq8TF+XE0lHN2V9NUoS7URp3EU9VVuzMMr9cfoskOY=
Content-Type: multipart/alternative;
 boundary="_000_BL0PR2101MB09329DD2F8ABD41DCB4E4C63C8150BL0PR2101MB0932_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666bb1ad-f74c-41f5-36de-08d6e8bb8227
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 07:08:55.7401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR2101MB1316
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BL0PR2101MB09329DD2F8ABD41DCB4E4C63C8150BL0PR2101MB0932_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Based on interests so far, we will meet bi-weekly Monday 9 PM PST.  We can =
also rotate the meeting times if required.
Agenda:

  1.  Define requirements for platform telemetry and health monitoring

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

_____________________________________________
From: openbmc <openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org<mail=
to:openbmc-bounces+neladk=3Dmicrosoft.com@lists.ozlabs.org>> On Behalf Of N=
eeraj Ladkani
Sent: Monday, May 20, 2019 1:25 PM
To: OpenBMC Maillist <openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.=
org>>
Subject: Platform telemetry and health monitoring

Hi All,

As we discussed having a focused workstream for "Platform telemetry and hea=
lth monitoring" in one of email thread, Please let me know if you would lik=
e to join this work stream. It would be great to have participation from Si=
licon partners/ mainboard design and mfg partners/ Memory/ NICs/ Firmware a=
nd other components.

Name
Preferred Timings
Agenda / Contribution Areas










Once we have enough quorum, we will put together bi-weekly call to brainsto=
rm various ideas and proposals.

Thanks
Neeraj


--_000_BL0PR2101MB09329DD2F8ABD41DCB4E4C63C8150BL0PR2101MB0932_
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
/* List Definitions */
@list l0
	{mso-list-id:135028022;
	mso-list-type:hybrid;
	mso-list-template-ids:-1410585410 67698703 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:1511599105;
	mso-list-template-ids:-1174396434;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Based on interests so far, we will meet bi-weekly Mo=
nday 9 PM PST. &nbsp;We can also rotate the meeting times if required.
<o:p></o:p></p>
<div>
<div>
<div style=3D"margin-top:.25in;margin-bottom:7.5pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">Agenda:<o:p></o:p></span></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"color:#252424;margin-top:.25in;marg=
in-bottom:7.5pt;margin-left:0in;mso-list:l0 level1 lfo3">
<span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif">Define requirem=
ents for platform telemetry and health monitoring
<o:p></o:p></span></li></ol>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://teams.microsoft.com/l/meetup-join/=
19%3ameeting_MDU1NDM2Y2EtOTZkYy00ZjI5LTkzMDctMjMxZDYyNzlhNjQy%40thread.v2/0=
?context=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22O=
id%22%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d" target=3D"_blank"><s=
pan style=3D"font-size:13.5pt;font-family:&quot;Segoe UI Semibold&quot;,san=
s-serif;color:#6264A7">Join
 Microsoft Teams Meeting</span></a> <o:p></o:p></span></p>
</div>
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
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">_____________________________________________<br>
<b>From:</b> openbmc &lt;<a href=3D"mailto:openbmc-bounces&#43;neladk=3Dmic=
rosoft.com@lists.ozlabs.org">openbmc-bounces&#43;neladk=3Dmicrosoft.com@lis=
ts.ozlabs.org</a>&gt;
<b>On Behalf Of </b>Neeraj Ladkani<br>
<b>Sent:</b> Monday, May 20, 2019 1:25 PM<br>
<b>To:</b> OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
>openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject:</b> Platform telemetry and health monitoring <o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Hi All, <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">As we discussed having=
 a focused workstream for &#8220;<i>Platform telemetry and health monitorin=
g</i>&#8221; in one of email thread, Please let me know if you would like t=
o join this work stream. It would be great to have
 participation from Silicon partners/ mainboard design and mfg partners/ Me=
mory/ NICs/ Firmware and other components.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"border-collapse:collapse">
<tbody>
<tr>
<td width=3D"208" valign=3D"top" style=3D"width:155.8pt;border:solid window=
text 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Name<o:p></o:p></span>=
</p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border:solid windo=
wtext 1.0pt;border-left:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Preferred Timings<o:p>=
</o:p></span></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border:solid windo=
wtext 1.0pt;border-left:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Agenda / Contribution =
Areas<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"208" valign=3D"top" style=3D"width:155.8pt;border:solid window=
text 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
</tr>
<tr>
<td width=3D"208" valign=3D"top" style=3D"width:155.8pt;border:solid window=
text 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
</tr>
<tr>
<td width=3D"208" valign=3D"top" style=3D"width:155.8pt;border:solid window=
text 1.0pt;border-top:none;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
<td width=3D"208" valign=3D"top" style=3D"width:155.85pt;border-top:none;bo=
rder-left:none;border-bottom:solid windowtext 1.0pt;border-right:solid wind=
owtext 1.0pt;padding:0in 5.4pt 0in 5.4pt">
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Once we have enough qu=
orum, we will put together bi-weekly call to brainstorm various ideas and p=
roposals.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Thanks <o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496">Neeraj<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BL0PR2101MB09329DD2F8ABD41DCB4E4C63C8150BL0PR2101MB0932_
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
T0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPUNo
cmlzIFdvb2QNCiA6TUFJTFRPOmN3b29kMkBsZW5vdm8uY29tDQpBVFRFTkRFRTtST0xFPVJFUS1Q
QVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPVNyaWtpc2hlbiAN
CiBQb25kaWNoZXJyeSBTaGFubXVnYW0gKGtpc2hhbik6TUFJTFRPOmtpc2hhbkBjaXNjby5jb20N
CkFUVEVOREVFO1JPTEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQ
PVRSVUU7Q049U3VtZWV0IEtvYw0KIGhhcjpNQUlMVE86c2tvY2hhckBsZW5vdm8uY29tDQpBVFRF
TkRFRTtST0xFPVJFUS1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVF
O0NOPXZpc2h3YTpNQUkNCiBMVE86dmlzaHdhQGxpbnV4LnZuZXQuaWJtLmNvbQ0KQVRURU5ERUU7
Uk9MRT1SRVEtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTtDTj1z
cmluaXZhcyBrDQogOk1BSUxUTzpzcmludWtsZ2VAZ21haWwuY29tDQpBVFRFTkRFRTtST0xFPVJF
US1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPU9mZXIgWWVo
aWUNCiBsbGk6TUFJTFRPOm9mZXJ5QGdvb2dsZS5jb20NCkFUVEVOREVFO1JPTEU9UkVRLVBBUlRJ
Q0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSVUU7Q049S3VuIFlpOk1BSQ0KIExU
TzprdW55aUBnb29nbGUuY29tDQpBVFRFTkRFRTtST0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RB
VD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPU9wZW5CTUMgTWENCiBpbGxpc3Q6TUFJTFRPOm9w
ZW5ibWNAbGlzdHMub3psYWJzLm9yZw0KREVTQ1JJUFRJT047TEFOR1VBR0U9ZW4tVVM6QmFzZWQg
b24gaW50ZXJlc3RzIHNvIGZhclwsIHdlIHdpbGwgbWVldCBiaS13ZWVrDQogbHkgTW9uZGF5IDkg
UE0gUFNULiAgV2UgY2FuIGFsc28gcm90YXRlIHRoZSBtZWV0aW5nIHRpbWVzIGlmIHJlcXVpcmVk
LlxuQWcNCiBlbmRhOlxuXG4gIDEuICBEZWZpbmUgcmVxdWlyZW1lbnRzIGZvciBwbGF0Zm9ybSB0
ZWxlbWV0cnkgYW5kIGhlYWx0aCBtb25pdA0KIG9yaW5nXG5cbkpvaW4gTWljcm9zb2Z0IFRlYW1z
IE1lZXRpbmc8aHR0cHM6Ly90ZWFtcy5taWNyb3NvZnQuY29tL2wvbWVldHVwDQogLWpvaW4vMTkl
M2FtZWV0aW5nX01EVTFORE0yWTJFdE9UWmtZeTAwWmpJNUxUa3pNRGN0TWpNeFpEWXlOemxoTmpR
eSU0MHRocmUNCiBhZC52Mi8wP2NvbnRleHQ9JTdiJTIyVGlkJTIyJTNhJTIyNzJmOTg4YmYtODZm
MS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3JTIyJQ0KIDJjJTIyT2lkJTIyJTNhJTIyMWMyOWMyZjct
ZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYzY1JTIyJTdkPlxuKzEgMzIzLTg0OS00DQogODc0PHRl
bDorMSUyMDMyMy04NDktNDg3NFwsXCw3MzU3Mjg0MiM+ICAgVW5pdGVkIFN0YXRlc1wsIExvcyBB
bmdlbGVzIChUb2wNCiBsKVxuKDg2NikgNjc5LTk5OTU8dGVsOig4NjYpJTIwNjc5LTk5OTVcLFws
NzM1NzI4NDIjPiAgIChUb2xsLWZyZWUpXG5Db25mZQ0KIHJlbmNlIElEOiA3MzUgNzI4IDQyI1xu
TG9jYWwgbnVtYmVyczxodHRwczovL2RpYWxpbi50ZWFtcy5taWNyb3NvZnQuY29tLzg1DQogNTFm
NGMxLWJlYTMtNDQxYS04NzM4LTY5YWE1MTdhOTFjNT9pZD03MzU3Mjg0Mj4gfCBSZXNldCBQSU48
aHR0cHM6Ly9teXNldHQNCiBpbmdzLmx5bmMuY29tL3BzdG5jb25mZXJlbmNpbmc+IHwgTGVhcm4g
bW9yZSBhYm91dCBUZWFtczxodHRwczovL2dvLm1pY3Jvcw0KIG9mdC5jb20vZndsaW5rLz9saW5r
aWQ9ODU3MjUwPiB8IE1lZXRpbmcgb3B0aW9uczxodHRwczovL3RlYW1zLm1pY3Jvc29mdC5jDQog
b20vbWVldGluZ09wdGlvbnMvP29yZ2FuaXplcklkPTFjMjljMmY3LWQzODYtNGM1YS1hM2JjLTBl
ZTEzYjQ4YmM2NSZ0ZW5hbnQNCiBJZD03MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0yZDdjZDAxMWRi
NDcmdGhyZWFkSWQ9MTlfbWVldGluZ19NRFUxTkRNMlkyRXRPVA0KIFprWXkwMFpqSTVMVGt6TURj
dE1qTXhaRFl5TnpsaE5qUXlAdGhyZWFkLnYyJm1lc3NhZ2VJZD0wJmxhbmd1YWdlPWVuLVVTPlxu
DQogSm9pbiB3aXRoIGEgdmlkZW8gY29uZmVyZW5jaW5nIGRldmljZVxuODEzODc4ODk2QHQucGxj
bS52YzxtYWlsdG86ODEzODc4ODkNCiA2QHQucGxjbS52Yz4gVlRDIENvbmZlcmVuY2UgSUQ6IDAx
NzkyMDY4NFxuQWx0ZXJuYXRlIFZUQyBkaWFsaW5nIGluc3RydWN0aQ0KIG9uczxodHRwczovL2Rp
YWxpbi5wbGNtLnZjL3RlYW1zLz9rZXk9ODEzODc4ODk2JmNvbmY9MDE3OTIwNjg0PlxuXG5fX19f
X19fDQogX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19cbkZyb206IG9wZW5i
bWMgPG9wZW5ibWMtYm91bmNlcytuZWwNCiBhZGs9bWljcm9zb2Z0LmNvbUBsaXN0cy5vemxhYnMu
b3JnPG1haWx0bzpvcGVuYm1jLWJvdW5jZXMrbmVsYWRrPW1pY3Jvc29mdA0KIC5jb21AbGlzdHMu
b3psYWJzLm9yZz4+IE9uIEJlaGFsZiBPZiBOZWVyYWogTGFka2FuaVxuU2VudDogTW9uZGF5XCwg
TWF5IDIwDQogXCwgMjAxOSAxOjI1IFBNXG5UbzogT3BlbkJNQyBNYWlsbGlzdCA8b3BlbmJtY0Bs
aXN0cy5vemxhYnMub3JnPG1haWx0bzpvcGUNCiBuYm1jQGxpc3RzLm96bGFicy5vcmc+PlxuU3Vi
amVjdDogUGxhdGZvcm0gdGVsZW1ldHJ5IGFuZCBoZWFsdGggbW9uaXRvcmluZw0KIFxuXG5IaSBB
bGxcLFxuXG5BcyB3ZSBkaXNjdXNzZWQgaGF2aW5nIGEgZm9jdXNlZCB3b3Jrc3RyZWFtIGZvciDi
gJxQbGF0Zm9yDQogbSB0ZWxlbWV0cnkgYW5kIGhlYWx0aCBtb25pdG9yaW5n4oCdIGluIG9uZSBv
ZiBlbWFpbCB0aHJlYWRcLCBQbGVhc2UgbGV0IG0NCiBlIGtub3cgaWYgeW91IHdvdWxkIGxpa2Ug
dG8gam9pbiB0aGlzIHdvcmsgc3RyZWFtLiBJdCB3b3VsZCBiZSBncmVhdCB0byBoYQ0KIHZlIHBh
cnRpY2lwYXRpb24gZnJvbSBTaWxpY29uIHBhcnRuZXJzLyBtYWluYm9hcmQgZGVzaWduIGFuZCBt
ZmcgcGFydG5lcnMvDQogIE1lbW9yeS8gTklDcy8gRmlybXdhcmUgYW5kIG90aGVyIGNvbXBvbmVu
dHMuXG5cbk5hbWVcblByZWZlcnJlZCBUaW1pbmdzXG4NCiBBZ2VuZGEgLyBDb250cmlidXRpb24g
QXJlYXNcblxuXG5cblxuXG5cblxuXG5cblxuT25jZSB3ZSBoYXZlIGVub3VnaCBxdW9ydQ0KIG1c
LCB3ZSB3aWxsIHB1dCB0b2dldGhlciBiaS13ZWVrbHkgY2FsbCB0byBicmFpbnN0b3JtIHZhcmlv
dXMgaWRlYXMgYW5kIHByDQogb3Bvc2Fscy5cblxuVGhhbmtzXG5OZWVyYWpcblxuDQpSUlVMRTpG
UkVRPVdFRUtMWTtVTlRJTD0yMDE5MTEyMFQwNTAwMDBaO0lOVEVSVkFMPTI7QllEQVk9TU87V0tT
VD1TVQ0KVUlEOjA0MDAwMDAwODIwMEUwMDA3NEM1QjcxMDFBODJFMDA4MDAwMDAwMDA3MEU2RjdB
ODY3MUFENTAxMDAwMDAwMDAwMDAwMDAwDQogMDEwMDAwMDAwNEFDMDdBODgwMjRBMUQ0OTk2Nzc2
QzcwRkY2Nzc4MzANClNVTU1BUlk7TEFOR1VBR0U9ZW4tVVM6UGxhdGZvcm0gdGVsZW1ldHJ5IGFu
ZCBoZWFsdGggbW9uaXRvcmluZyANCkRUU1RBUlQ7VFpJRD1QYWNpZmljIFN0YW5kYXJkIFRpbWU6
MjAxOTA2MTBUMjEwMDAwDQpEVEVORDtUWklEPVBhY2lmaWMgU3RhbmRhcmQgVGltZToyMDE5MDYx
MFQyMjAwMDANCkNMQVNTOlBVQkxJQw0KUFJJT1JJVFk6NQ0KRFRTVEFNUDoyMDE5MDYwNFQwNzA4
NTBaDQpUUkFOU1A6T1BBUVVFDQpTVEFUVVM6Q09ORklSTUVEDQpTRVFVRU5DRTowDQpMT0NBVElP
TjtMQU5HVUFHRT1lbi1VUzpNaWNyb3NvZnQgVGVhbXMgTWVldGluZw0KWC1NSUNST1NPRlQtQ0RP
LUFQUFQtU0VRVUVOQ0U6MA0KWC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElEOjM1MjYxMDI3NQ0K
WC1NSUNST1NPRlQtQ0RPLUJVU1lTVEFUVVM6VEVOVEFUSVZFDQpYLU1JQ1JPU09GVC1DRE8tSU5U
RU5ERURTVEFUVVM6QlVTWQ0KWC1NSUNST1NPRlQtQ0RPLUFMTERBWUVWRU5UOkZBTFNFDQpYLU1J
Q1JPU09GVC1DRE8tSU1QT1JUQU5DRToxDQpYLU1JQ1JPU09GVC1DRE8tSU5TVFRZUEU6MQ0KWC1N
SUNST1NPRlQtU0tZUEVURUFNU01FRVRJTkdVUkw6aHR0cHM6Ly90ZWFtcy5taWNyb3NvZnQuY29t
L2wvbWVldHVwLWpvaW4vDQogMTklM2FtZWV0aW5nX01EVTFORE0yWTJFdE9UWmtZeTAwWmpJNUxU
a3pNRGN0TWpNeFpEWXlOemxoTmpReSU0MHRocmVhZC52Mi8NCiAwP2NvbnRleHQ9JTdiJTIyVGlk
JTIyJTNhJTIyNzJmOTg4YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3JTIyJTJjJTIyTw0K
IGlkJTIyJTNhJTIyMWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYzY1JTIyJTdkDQpY
LU1JQ1JPU09GVC1TQ0hFRFVMSU5HU0VSVklDRVVQREFURVVSTDpodHRwczovL3NjaGVkLnNlcnZp
Y2VzLnNreXBlLm5ldC90ZWENCiBtcy83MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0yZDdjZDAxMWRi
NDcvMWMyOWMyZjctZDM4Ni00YzVhLWEzYmMtMGVlMTNiNDhiYw0KIDY1LzE5X21lZXRpbmdfTURV
MU5ETTJZMkV0T1Raa1l5MDBaakk1TFRrek1EY3RNak14WkRZeU56bGhOalF5QHRocmVhZC52Mi8w
DQpYLU1JQ1JPU09GVC1TS1lQRVRFQU1TUFJPUEVSVElFUzp7ImNpZCI6IjE5Om1lZXRpbmdfTURV
MU5ETTJZMkV0T1Raa1l5MDBaakkNCiA1TFRrek1EY3RNak14WkRZeU56bGhOalF5QHRocmVhZC52
MiJcLCJwcml2YXRlIjp0cnVlXCwidHlwZSI6MFwsIm1pZCI6MFwsIg0KIHJpZCI6MFwsInVpZCI6
bnVsbH0NClgtTUlDUk9TT0ZULU9OTElORU1FRVRJTkdDT05GTElOSzpjb25mOnNpcDpuZWxhZGtA
bWljcm9zb2Z0LmNvbVw7Z3J1dVw7b3BhcQ0KIHVlPWFwcDpjb25mOmZvY3VzOmlkOnRlYW1zOjI6
MCExOTptZWV0aW5nX01EVTFORE0yWTJFdE9UWmtZeTAwWmpJNUxUa3pNRGN0DQogTWpNeFpEWXlO
emxoTmpReS10aHJlYWQudjIhMWMyOWMyZjdkMzg2NGM1YWEzYmMwZWUxM2I0OGJjNjUhNzJmOTg4
YmY4NmYxNDENCiBhZjkxYWIyZDdjZDAxMWRiNDcNClgtTUlDUk9TT0ZULURPTk9URk9SV0FSRE1F
RVRJTkc6RkFMU0UNClgtTUlDUk9TT0ZULURJU0FMTE9XLUNPVU5URVI6RkFMU0UNClgtTUlDUk9T
T0ZULUxPQ0FUSU9OUzpbeyJEaXNwbGF5TmFtZSI6Ik1pY3Jvc29mdCBUZWFtcyBNZWV0aW5nIlws
IkxvY2F0aW9uQQ0KIG5ub3RhdGlvbiI6IiJcLCJMb2NhdGlvblVyaSI6IiJcLCJMb2NhdGlvblN0
cmVldCI6IiJcLCJMb2NhdGlvbkNpdHkiOiIiXCwiDQogTG9jYXRpb25TdGF0ZSI6IiJcLCJMb2Nh
dGlvbkNvdW50cnkiOiIiXCwiTG9jYXRpb25Qb3N0YWxDb2RlIjoiIlwsIkxvY2F0aW8NCiBuRnVs
bEFkZHJlc3MiOiIifV0NCkJFR0lOOlZBTEFSTQ0KREVTQ1JJUFRJT046UkVNSU5ERVINClRSSUdH
RVI7UkVMQVRFRD1TVEFSVDotUFQxNU0NCkFDVElPTjpESVNQTEFZDQpFTkQ6VkFMQVJNDQpFTkQ6
VkVWRU5UDQpFTkQ6VkNBTEVOREFSDQo=

--_000_BL0PR2101MB09329DD2F8ABD41DCB4E4C63C8150BL0PR2101MB0932_--
