Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E84959F1CD
	for <lists+openbmc@lfdr.de>; Tue, 27 Aug 2019 19:41:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hx5B6BHLzDqwM
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 03:41:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.71.126; helo=nam05-by2-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="jhc04QTw"; dkim-atps=neutral
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710126.outbound.protection.outlook.com [40.107.71.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hx4Z5F7czDqh3
 for <openbmc@lists.ozlabs.org>; Wed, 28 Aug 2019 03:41:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1zkg8yp/AkU8n+A/8V2k0bQxEf9SVosz4Z6DVVwh543rZo+on+b+G0A6ApUVAIxGrlzDES/lA1Ine1u6D4LZ4FmI1i5hZ8ZDbq7kNGmAQFj1Wt6h6DpOWHHlz8K0MweRjlqlxLolje58dfIycLUIqbALwQM7k+3lPfDK/xKbZSbO+/R0dvIJjGj+onbIS72Pfri2N0OMH/Ip20oO5itPMhmw+ZQQBckGh0mMBSd+weG2+xV8y/4U9qdZ2MtD8c01Rg1oKTU3qFwcodDtFhVtVEWuAeCi3mj4kUKbDL1wBqGjnuV8K/Kwx6eliYld8n86rG6lhlnLUdQy/DgNY+Znw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1vVdudKAnyr5DH88AQ0hVpx4pN+9DA9iecwt7UMESo=;
 b=VqwfGyEEX2RFumTSeN1cqYlpkcjmFIf1wpw43/GKOBn9yQnzyi1VYAZAW4UKWIWLX8hDSK9Qpw6PDzgOOm/IaYnEqEJyQdLn+fW8mOirHMKm64DPA/YMWeM+1Ib7zGPQ4qEdBdC5sNemFJxwgzZv1fHHcrj9mtdFd1a2AiSRg7I/BmJ1N108lKQG5NwMhSLgyDXWf8cex1WBq5P3lrVExU2ZDP6HC7Ed7EK3XspYNsIokcYLPyAKKFLOlLZ7fYnlj0xdzKGNu8+B8vfM1SY6mUD8p1bVZ8J6PA4otJv1n74sNSr2Arybl3Q4uXbupBLm5vqvSz8iUuty4wZmtOoB8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1vVdudKAnyr5DH88AQ0hVpx4pN+9DA9iecwt7UMESo=;
 b=jhc04QTwv55M0hCK5nJ63K1H0DFR4DeTNq4tLv0L59nNe0VO96idKzNS2TB6UcK+rqoqcbuHvtvIxn+KvbDN00jXcdq4GX6CjcIPByedjkF+aUUu9PJGcZkbUEiLIsT/lNcrgi+hXgO0zhHKahV9qGVgfI7fkQPIf2Fr5wrk/k4=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1269.namprd21.prod.outlook.com (20.179.57.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.13; Tue, 27 Aug 2019 17:41:12 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e805:a5bc:9f69:771b]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e805:a5bc:9f69:771b%9]) with mapi id 15.20.2241.000; Tue, 27 Aug 2019
 17:41:12 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Platform telemetry and health monitoring Work Group meeting
Thread-Topic: Platform telemetry and health monitoring Work Group meeting
Thread-Index: AdVc/pFaN9JQT+A+QemSJkUwozIXJgAAAuOA
Date: Tue, 27 Aug 2019 17:41:12 +0000
Message-ID: <BYAPR21MB1191F86101DFCB77988CAEBAC8A00@BYAPR21MB1191.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-ms-exchange-calendar-series-instance-id: BAAAAIIA4AB0xbcQGoLgCAAAAACQ637gw1zVAQAAAAAAAAAAEAAAAMEJzOwVPCdForuIrc7xUKc=
x-originating-ip: [2001:4898:80e8:7:78b5:dd69:44fd:ea0e]
x-ms-office365-filtering-correlation-id: bbe0f694-944f-48ab-e743-08d72b15c0d9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR21MB1269; 
x-ms-traffictypediagnostic: BYAPR21MB1269:MeetingMessage
x-ms-exchange-purlcount: 9
x-microsoft-antispam-prvs: <BYAPR21MB126977CFF22607AA617D48B3C8A00@BYAPR21MB1269.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(189003)(199004)(25786009)(55016002)(5640700003)(236005)(10090500001)(9686003)(6306002)(54896002)(66446008)(8936002)(6436002)(7696005)(53936002)(5660300002)(99286004)(66476007)(66556008)(478600001)(186003)(1730700003)(81156014)(8990500004)(8676002)(81166006)(2906002)(102836004)(64756008)(4744005)(52536014)(14454004)(486006)(74316002)(76116006)(66946007)(256004)(71190400001)(86362001)(22452003)(7736002)(71200400001)(790700001)(6116002)(476003)(6506007)(2351001)(606006)(10290500003)(966005)(2501003)(46003)(6916009)(33656002)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1269;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Kl/IUlNFn60W8GhWSj5Pf7W2a9Yq+l5sAlqlz5t/YctID8hMTaGTad6QzwnXvj+NumuJkJlYN9C31j9Bvy+cR6joDm+Bhh+oQgwMLH040PYTsAtWU8H0NGuBr7SKeDS6Lt3JoIUKDIlrcGFnFNMYbmCbalQr22O2EudpjbUnGyEc1VE6kKg9En1+uQSjv68IXpkSxJQkL/Pg9pgLzC5RW4VxiHbhIs2NvGorAfaRciB66EcPDL1SXkiEyf9pIN69oQgjuFLcSKCv0jvfM9gAakG8ZXfD9ioN33e+cD8eHD+COe9sv4+3bGBPmyu0aH7zUWfYwm6sEK0sfNiUM/j1AEsyv5I1lhud/WxunRwV3OTFcI9RB3ZHoc+p9rN0qmdR/1pI7mIxLFO7HiYeDXYm+eThl77s2a4Jd4cK9ss4JJU=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR21MB1191F86101DFCB77988CAEBAC8A00BYAPR21MB1191namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe0f694-944f-48ab-e743-08d72b15c0d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 17:41:12.4429 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3bqKxbklzdDjGnNizjfj3/U21Sa9vCuiVLXzr69Bt8cSRzILy7nQDTSw86m0pOC67fdrX9ToXn9cFuAIs8aYlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1269
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

--_000_BYAPR21MB1191F86101DFCB77988CAEBAC8A00BYAPR21MB1191namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

https://github.com/openbmc/openbmc/wiki/Platform-telemetry-and-health-monit=
oring-Work-Group

___________________________________________________________________________=
_____
Join Microsoft Teams Meeting<https://teams.microsoft.com/l/meetup-join/19%3=
ameeting_NzhkNmNiYmQtMWRiZS00NDE2LTk2MmItM2ViOTY3YzlmZWE1%40thread.v2/0?con=
text=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22Oid%2=
2%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d>
+1 323-849-4874<tel:+1%20323-849-4874,,37688521#>   United States, Los Ange=
les (Toll)
(866) 679-9995<tel:(866)%20679-9995,,37688521#>   (Toll-free)
Conference ID: 376 885 21#
Local numbers<https://dialin.teams.microsoft.com/8551f4c1-bea3-441a-8738-69=
aa517a91c5?id=3D37688521> | Reset PIN<https://mysettings.lync.com/pstnconfe=
rencing> | Learn more about Teams<https://go.microsoft.com/fwlink/?linkid=
=3D857250> | Meeting options<https://teams.microsoft.com/meetingOptions/?or=
ganizerId=3D1c29c2f7-d386-4c5a-a3bc-0ee13b48bc65&tenantId=3D72f988bf-86f1-4=
1af-91ab-2d7cd011db47&threadId=3D19_meeting_NzhkNmNiYmQtMWRiZS00NDE2LTk2MmI=
tM2ViOTY3YzlmZWE1@thread.v2&messageId=3D0&language=3Den-US>
Join with a video conferencing device
813878896@t.plcm.vc<mailto:813878896@t.plcm.vc> VTC Conference ID: 01652803=
7
Alternate VTC dialing instructions<https://dialin.plcm.vc/teams/?key=3D8138=
78896&conf=3D016528037>
___________________________________________________________________________=
_____


--_000_BYAPR21MB1191F86101DFCB77988CAEBAC8A00BYAPR21MB1191namp_
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
	color:#2F5496;
	font-weight:normal;
	font-style:normal;}
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
<p class=3D"MsoNormal"><span style=3D"color:#2F5496;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:gray">_________________________=
_______________________________________________________</span>
<o:p></o:p></p>
<div>
<div style=3D"margin-top:.25in;margin-bottom:7.5pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://teams.microsoft.com/l/meetup-join/=
19%3ameeting_NzhkNmNiYmQtMWRiZS00NDE2LTk2MmItM2ViOTY3YzlmZWE1%40thread.v2/0=
?context=3D%7b%22Tid%22%3a%2272f988bf-86f1-41af-91ab-2d7cd011db47%22%2c%22O=
id%22%3a%221c29c2f7-d386-4c5a-a3bc-0ee13b48bc65%22%7d" target=3D"_blank"><s=
pan style=3D"font-size:13.5pt;font-family:&quot;Segoe UI Semibold&quot;,san=
s-serif;color:#6264A7">Join
 Microsoft Teams Meeting</span></a> <o:p></o:p></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:&#43;1%20323-849-4874,,37688521# " tar=
get=3D"_blank"><span style=3D"font-size:10.5pt;color:#6264A7;text-decoratio=
n:none">&#43;1 323-849-4874</span></a>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424">&nbsp; United States, Los Angeles (Toll)
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:3.0pt">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"tel:(866)%20679-9995,,37688521# " target=
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
s-serif;color:#252424">376 885 21#
</span><span style=3D"font-family:&quot;Segoe UI&quot;,sans-serif;color:#25=
2424"><o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:.25in">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Segoe UI&quot;,sans=
-serif;color:#252424"><a href=3D"https://dialin.teams.microsoft.com/8551f4c=
1-bea3-441a-8738-69aa517a91c5?id=3D37688521" target=3D"_blank"><span style=
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
011db47&amp;threadId=3D19_meeting_NzhkNmNiYmQtMWRiZS00NDE2LTk2MmItM2ViOTY3Y=
zlmZWE1@thread.v2&amp;messageId=3D0&amp;language=3Den-US" target=3D"_blank"=
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
 VTC Conference ID: 016528037 <o:p></o:p></span></p>
</div>
<div style=3D"margin-bottom:15.0pt">
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Seg=
oe UI&quot;,sans-serif;color:#252424"><a href=3D"https://dialin.plcm.vc/tea=
ms/?key=3D813878896&amp;conf=3D016528037"><span style=3D"color:#6264A7;text=
-decoration:none">Alternate VTC dialing instructions</span></a>
<o:p></o:p></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:gray">_________________________=
_______________________________________________________</span>
<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><span style=3D"color:#2F5496;mso-fareast-language:EN=
-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_BYAPR21MB1191F86101DFCB77988CAEBAC8A00BYAPR21MB1191namp_
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
b3JrLUdyb3VwXG5cbl9fX19fX19fX19fX19fX19fX19fX19fX19fXw0KIF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXG5Kb2luIE1pY3Jvc29mdCBU
ZWFtDQogcyBNZWV0aW5nPGh0dHBzOi8vdGVhbXMubWljcm9zb2Z0LmNvbS9sL21lZXR1cC1qb2lu
LzE5JTNhbWVldGluZ19OemhrTm1OaVkNCiBtUXRNV1JpWlMwME5ERTJMVGsyTW1JdE0yVmlPVFkz
WXpsbVpXRTElNDB0aHJlYWQudjIvMD9jb250ZXh0PSU3YiUyMlRpZCUyMg0KICUzYSUyMjcyZjk4
OGJmLTg2ZjEtNDFhZi05MWFiLTJkN2NkMDExZGI0NyUyMiUyYyUyMk9pZCUyMiUzYSUyMjFjMjlj
MmY3LWQzDQogODYtNGM1YS1hM2JjLTBlZTEzYjQ4YmM2NSUyMiU3ZD5cbisxIDMyMy04NDktNDg3
NDx0ZWw6KzElMjAzMjMtODQ5LTQ4NzRcLFwNCiAsMzc2ODg1MjEjPiAgIFVuaXRlZCBTdGF0ZXNc
LCBMb3MgQW5nZWxlcyAoVG9sbClcbig4NjYpIDY3OS05OTk1PHRlbDooODY2KQ0KICUyMDY3OS05
OTk1XCxcLDM3Njg4NTIxIz4gICAoVG9sbC1mcmVlKVxuQ29uZmVyZW5jZSBJRDogMzc2IDg4NSAy
MSNcbkxvY2FsDQogIG51bWJlcnM8aHR0cHM6Ly9kaWFsaW4udGVhbXMubWljcm9zb2Z0LmNvbS84
NTUxZjRjMS1iZWEzLTQ0MWEtODczOC02OWFhNTENCiA3YTkxYzU/aWQ9Mzc2ODg1MjE+IHwgUmVz
ZXQgUElOPGh0dHBzOi8vbXlzZXR0aW5ncy5seW5jLmNvbS9wc3RuY29uZmVyZW5jaQ0KIG5nPiB8
IExlYXJuIG1vcmUgYWJvdXQgVGVhbXM8aHR0cHM6Ly9nby5taWNyb3NvZnQuY29tL2Z3bGluay8/
bGlua2lkPTg1NzI1DQogMD4gfCBNZWV0aW5nIG9wdGlvbnM8aHR0cHM6Ly90ZWFtcy5taWNyb3Nv
ZnQuY29tL21lZXRpbmdPcHRpb25zLz9vcmdhbml6ZXINCiBJZD0xYzI5YzJmNy1kMzg2LTRjNWEt
YTNiYy0wZWUxM2I0OGJjNjUmdGVuYW50SWQ9NzJmOTg4YmYtODZmMS00MWFmLTkxYWItMg0KIGQ3
Y2QwMTFkYjQ3JnRocmVhZElkPTE5X21lZXRpbmdfTnpoa05tTmlZbVF0TVdSaVpTMDBOREUyTFRr
Mk1tSXRNMlZpT1RZM1l6DQogbG1aV0UxQHRocmVhZC52MiZtZXNzYWdlSWQ9MCZsYW5ndWFnZT1l
bi1VUz5cbkpvaW4gd2l0aCBhIHZpZGVvIGNvbmZlcmVuY2kNCiBuZyBkZXZpY2VcbjgxMzg3ODg5
NkB0LnBsY20udmM8bWFpbHRvOjgxMzg3ODg5NkB0LnBsY20udmM+IFZUQyBDb25mZXJlbmNlIA0K
IElEOiAwMTY1MjgwMzdcbkFsdGVybmF0ZSBWVEMgZGlhbGluZyBpbnN0cnVjdGlvbnM8aHR0cHM6
Ly9kaWFsaW4ucGxjbS52Yy90DQogZWFtcy8/a2V5PTgxMzg3ODg5NiZjb25mPTAxNjUyODAzNz5c
bl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXG5cbg0KVUlEOjA0MDAwMDAwODIwMEUwMDA3NEM1
QjcxMDFBODJFMDA4MDAwMDAwMDA5MEVCN0VFMEMzNUNENTAxMDAwMDAwMDAwMDAwMDAwDQogMDEw
MDAwMDAwQzEwOUNDRUMxNTNDMjc0NUEyQkI4OEFEQ0VGMTUwQTcNClNVTU1BUlk7TEFOR1VBR0U9
ZW4tVVM6UGxhdGZvcm0gdGVsZW1ldHJ5IGFuZCBoZWFsdGggbW9uaXRvcmluZyBXb3JrIEdyb3Vw
IA0KIG1lZXRpbmcNCkRUU1RBUlQ7VFpJRD1QYWNpZmljIFN0YW5kYXJkIFRpbWU6MjAxOTA4MjdU
MjEzMDAwDQpEVEVORDtUWklEPVBhY2lmaWMgU3RhbmRhcmQgVGltZToyMDE5MDgyN1QyMjMwMDAN
CkNMQVNTOlBVQkxJQw0KUFJJT1JJVFk6NQ0KRFRTVEFNUDoyMDE5MDgyN1QxNzQxMTBaDQpUUkFO
U1A6T1BBUVVFDQpTVEFUVVM6Q09ORklSTUVEDQpTRVFVRU5DRTowDQpMT0NBVElPTjtMQU5HVUFH
RT1lbi1VUzpNaWNyb3NvZnQgVGVhbXMgTWVldGluZw0KWC1NSUNST1NPRlQtQ0RPLUFQUFQtU0VR
VUVOQ0U6MA0KWC1NSUNST1NPRlQtQ0RPLU9XTkVSQVBQVElEOjE5NTAwNTg0NjcNClgtTUlDUk9T
T0ZULUNETy1CVVNZU1RBVFVTOlRFTlRBVElWRQ0KWC1NSUNST1NPRlQtQ0RPLUlOVEVOREVEU1RB
VFVTOkJVU1kNClgtTUlDUk9TT0ZULUNETy1BTExEQVlFVkVOVDpGQUxTRQ0KWC1NSUNST1NPRlQt
Q0RPLUlNUE9SVEFOQ0U6MQ0KWC1NSUNST1NPRlQtQ0RPLUlOU1RUWVBFOjANClgtTUlDUk9TT0ZU
LVNLWVBFVEVBTVNNRUVUSU5HVVJMOmh0dHBzOi8vdGVhbXMubWljcm9zb2Z0LmNvbS9sL21lZXR1
cC1qb2luLw0KIDE5JTNhbWVldGluZ19OemhrTm1OaVltUXRNV1JpWlMwME5ERTJMVGsyTW1JdE0y
VmlPVFkzWXpsbVpXRTElNDB0aHJlYWQudjIvDQogMD9jb250ZXh0PSU3YiUyMlRpZCUyMiUzYSUy
MjcyZjk4OGJmLTg2ZjEtNDFhZi05MWFiLTJkN2NkMDExZGI0NyUyMiUyYyUyMk8NCiBpZCUyMiUz
YSUyMjFjMjljMmY3LWQzODYtNGM1YS1hM2JjLTBlZTEzYjQ4YmM2NSUyMiU3ZA0KWC1NSUNST1NP
RlQtU0NIRURVTElOR1NFUlZJQ0VVUERBVEVVUkw6aHR0cHM6Ly9zY2hlZC5zZXJ2aWNlcy5za3lw
ZS5uZXQvdGVhDQogbXMvNzJmOTg4YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3LzFjMjlj
MmY3LWQzODYtNGM1YS1hM2JjLTBlZTEzYjQ4YmMNCiA2NS8xOV9tZWV0aW5nX056aGtObU5pWW1R
dE1XUmlaUzAwTkRFMkxUazJNbUl0TTJWaU9UWTNZemxtWldFMUB0aHJlYWQudjIvMA0KWC1NSUNS
T1NPRlQtU0tZUEVURUFNU1BST1BFUlRJRVM6eyJjaWQiOiIxOTptZWV0aW5nX056aGtObU5pWW1R
dE1XUmlaUzAwTkRFDQogMkxUazJNbUl0TTJWaU9UWTNZemxtWldFMUB0aHJlYWQudjIiXCwicHJp
dmF0ZSI6dHJ1ZVwsInR5cGUiOjBcLCJtaWQiOjBcLCINCiByaWQiOjBcLCJ1aWQiOm51bGx9DQpY
LU1JQ1JPU09GVC1PTkxJTkVNRUVUSU5HRVhURVJOQUxMSU5LOg0KWC1NSUNST1NPRlQtT05MSU5F
TUVFVElOR0NPTkZMSU5LOmNvbmY6c2lwOm5lbGFka0BtaWNyb3NvZnQuY29tXDtncnV1XDtvcGFx
DQogdWU9YXBwOmNvbmY6Zm9jdXM6aWQ6dGVhbXM6MjowITE5Om1lZXRpbmdfTnpoa05tTmlZbVF0
TVdSaVpTMDBOREUyTFRrMk1tSXQNCiBNMlZpT1RZM1l6bG1aV0UxLXRocmVhZC52MiExYzI5YzJm
N2QzODY0YzVhYTNiYzBlZTEzYjQ4YmM2NSE3MmY5ODhiZjg2ZjE0MQ0KIGFmOTFhYjJkN2NkMDEx
ZGI0Nw0KWC1NSUNST1NPRlQtRE9OT1RGT1JXQVJETUVFVElORzpGQUxTRQ0KWC1NSUNST1NPRlQt
RElTQUxMT1ctQ09VTlRFUjpGQUxTRQ0KWC1NSUNST1NPRlQtTE9DQVRJT05TOlsgeyAiRGlzcGxh
eU5hbWUiIDogIk1pY3Jvc29mdCBUZWFtcyBNZWV0aW5nIlwsICJMb2NhDQogdGlvbkFubm90YXRp
b24iIDogIiJcLCAiTG9jYXRpb25Tb3VyY2UiIDogMFwsICJVbnJlc29sdmVkIiA6IGZhbHNlXCwg
IkxvY2ENCiB0aW9uVXJpIiA6ICIiIH0gXQ0KQkVHSU46VkFMQVJNDQpERVNDUklQVElPTjpSRU1J
TkRFUg0KVFJJR0dFUjtSRUxBVEVEPVNUQVJUOi1QVDE1TQ0KQUNUSU9OOkRJU1BMQVkNCkVORDpW
QUxBUk0NCkVORDpWRVZFTlQNCkVORDpWQ0FMRU5EQVINCg==

--_000_BYAPR21MB1191F86101DFCB77988CAEBAC8A00BYAPR21MB1191namp_--
