Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3930AC3A51
	for <lists+openbmc@lfdr.de>; Tue,  1 Oct 2019 18:21:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jPdr69gBzDqTK
	for <lists+openbmc@lfdr.de>; Wed,  2 Oct 2019 02:21:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.75.118; helo=nam02-bl2-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="fbiVtLK/"; dkim-atps=neutral
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750118.outbound.protection.outlook.com [40.107.75.118])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jPcz6jlczDqTK
 for <openbmc@lists.ozlabs.org>; Wed,  2 Oct 2019 02:20:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLveNvWUTRAjwaJJjiHU3qYbHeNkjqUjIYDI8ulV24xwlGB/YPuslgBOtNOQ1LlTaJC8OZminh1T/OZhEG62zDSXF3HrRBLAkuGKBKZ8HDqB8OSidIlQ0RhLyG5BvewKirPsYcgdRIYULOkEY4+CRfNDbbtKvLaTLAFUweWvFEMCXh90/D+NqrfFjZc/dThCdrwJ3/SAj/mcrkaMd7URaantm9h6l3tCC6qf5r5GtD3CXwYPbl39iNNBIUiGzHnZQEv+lB5umSSIDK7Mg8+xGY7fhnsaAUmjQLmX3CYIqAEgzIxX5QBbbTAslMFq3jYEs3+95CCpkTyW0yMx20oYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PPuLkrbOzxmOojJCQwmNaGzn2YLTtdkttJQLT9spW4=;
 b=k2xGQ3/nlwVin/5xAHqbEBanXRfPxTvQSifTOTu4XC29jMLliKnhjn2MVW19gRKZEY6w2mXCpgy24MVDXQqUEGMC4QcqzFOFYvAUu1Fu4e14DyiagU+DwBHgWQ5mTioo4BG92UNGxiBOET69GuMRCAGHT4vpzipE7VTeB/g3THmtvVc/Y3K7aqVvwpHNIJnhlLkT1DtJwXoCvySGY+E2n1GQokmo4YPAoA3O9thEg1CFoAlrYTfz6KkFcx3USYaR2Gw8T4z/llvYIB+H/n/9B+cV7WrIdRwIfon3/dR4h3RiQOQ7huEmZzTXgBb9/SFhTHFGLVB3akvh3rePRHt7Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7PPuLkrbOzxmOojJCQwmNaGzn2YLTtdkttJQLT9spW4=;
 b=fbiVtLK/MSWK5leiQVBMn9neH8C7J98c1s8e6F9aa35rO9NTwpvTtxHwZzYjVt4i2YPCLmPKFA4D0poSEBjj7m7vp5wkkMTAz3hiEAgboPSZL6evW41hiR4B80f4gwTgje2v7p8Hpvn3BPhk3cm4D4dT2JQyu2ngeUn8qCFk9E8=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1174.namprd21.prod.outlook.com (20.179.56.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.6; Tue, 1 Oct 2019 16:20:12 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::20e7:c182:6e68:28db]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::20e7:c182:6e68:28db%2]) with mapi id 15.20.2327.009; Tue, 1 Oct 2019
 16:20:12 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Canceled: Platform telemetry and health monitoring - PST AM ( please
 use "Platform Telemetry workgroup- bi-weekly sync" )
Thread-Topic: Platform telemetry and health monitoring - PST AM ( please use
 "Platform Telemetry workgroup- bi-weekly sync" )
Thread-Index: AdV4c+/p4OVIjWoLSpeq0f73thcJMAAAAOlQ
Importance: high
X-Priority: 1
Date: Tue, 1 Oct 2019 16:20:12 +0000
Message-ID: <BYAPR21MB1191F417A3780683E4527855C89D0@BYAPR21MB1191.namprd21.prod.outlook.com>
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
x-ms-exchange-calendar-series-instance-id: BAAAAIIA4AB0xbcQGoLgCAAAAABw5veoZxrVAQAAAAAAAAAAEAAAAErAeogCSh1JlndscP9neDA=
x-originating-ip: [50.35.85.58]
x-ms-office365-filtering-correlation-id: 6d7073e6-6f3b-4f63-51cf-08d7468b3c84
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BYAPR21MB1174:MeetingMessage
x-ms-exchange-purlcount: 6
x-microsoft-antispam-prvs: <BYAPR21MB1174B8E8437DB5C7B9C5605DC89D0@BYAPR21MB1174.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(9763003)(199004)(189003)(54906003)(4326008)(8676002)(2501003)(66446008)(66556008)(66476007)(64756008)(606006)(8990500004)(66946007)(33656002)(76116006)(66066001)(10090500001)(10290500003)(6916009)(8936002)(478600001)(25786009)(1730700003)(81166006)(81156014)(7416002)(316002)(74316002)(22452003)(7736002)(55016002)(5640700003)(6436002)(14454004)(54896002)(6306002)(9686003)(236005)(4744005)(486006)(256004)(86362001)(5660300002)(476003)(52536014)(71200400001)(71190400001)(6506007)(2906002)(102836004)(7696005)(81686011)(26005)(186003)(2351001)(99286004)(3846002)(6116002)(790700001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1174;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kwRAKndn+anmklu6RCpWxLTVteRoVfUVRDSgzV0L4cdVMpvbnuD2gYw9M+J3iTbqSVz4KtI8C1unA2DX2xu4LNQ1aiWdg93l2xL9keOED7ICvptcbTZd2vU0b7Zfzvis4x1G8Vgmo15gKfTu0391jnMUj+lNu9m/ur++IAGp1dC0YY/uA88ckeu5jn9Qwhlc2SSD+S4mJ48/WVwvhZF/qDEbSTQ00kHLMUle3zC07Il7pocyg0DhU6I7yxqW+UtQewp8D7A+J+llQmdD4a63EerCdZWWb8NxoDMS2rS/BTE5ppHVhMiUCgOojzG6EtlRicHZ4axKqi+QMM/ii9+O854DJTl7kMccIldFAGEXXWZRlyqqMlY6zNxcNDifhTLdpU1KlsgUGtAN9ilybzYJeYAFe1yTnlGGWIKjYMzQy30htyGLNY7GfskbAsyEgShUovSW+tM7+Htei+dY/VD6/w==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR21MB1191F417A3780683E4527855C89D0BYAPR21MB1191namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7073e6-6f3b-4f63-51cf-08d7468b3c84
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 16:20:12.5048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xGj0nJBytQuC4Y4n7Ev9NU5TRfhH+M650tsFzGZCWY3ZnXbov+bpY9F3MRAJUq50kyEE0UhlR/GG2j8tG4cbiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1174
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
Cc: Tom Sand <trsand@us.ibm.com>, "Tanous,
 Ed" <ed.tanous@intel.com>, Michael Lim <youhour@us.ibm.com>,
 Asmaa Mnebhi <Asmaa@mellanox.com>, Reed B Frandsen <rfrandse@us.ibm.com>,
 Dong Wei <Dong.Wei@arm.com>, "Paul.Vancil@dell.com" <Paul.Vancil@dell.com>,
 Vijay Khemka <vijaykhemka@fb.com>, Nicole Conser1 <nicoleconser@ibm.com>,
 Matt Chen/WYHQ/Wiwynn <Matt_Chen@wiwynn.com>,
 James Morse <James.Morse@arm.com>,
 =?ks_c_5601-1987?B?QnVkZHkgSHVhbmcgKPzc9Lj7+Ck=?= <Buddy.Huang@quantatw.com>,
 Joe P Mulholland <jpmulhol@us.ibm.com>, Luke Chen <luke_chen@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BYAPR21MB1191F417A3780683E4527855C89D0BYAPR21MB1191namp_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

UGxlYXNlIHVzZSB0aGUgb3RoZXIgaW52aXRlIG5hbWVkIKGwUGxhdGZvcm0gVGVsZW1ldHJ5IHdv
cmtncm91cC0gYmktd2Vla2x5IHN5bmOhsQ0KDQoNCg0KSm9pbiBNaWNyb3NvZnQgVGVhbXMgTWVl
dGluZzxodHRwczovL3RlYW1zLm1pY3Jvc29mdC5jb20vbC9tZWV0dXAtam9pbi8xOSUzYW1lZXRp
bmdfTURVMU5ETTJZMkV0T1Raa1l5MDBaakk1TFRrek1EY3RNak14WkRZeU56bGhOalF5JTQwdGhy
ZWFkLnYyLzA/Y29udGV4dD0lN2IlMjJUaWQlMjIlM2ElMjI3MmY5ODhiZi04NmYxLTQxYWYtOTFh
Yi0yZDdjZDAxMWRiNDclMjIlMmMlMjJPaWQlMjIlM2ElMjIxYzI5YzJmNy1kMzg2LTRjNWEtYTNi
Yy0wZWUxM2I0OGJjNjUlMjIlN2Q+DQorMSAzMjMtODQ5LTQ4NzQ8dGVsOisxJTIwMzIzLTg0OS00
ODc0LCw3MzU3Mjg0MiM+ICAgVW5pdGVkIFN0YXRlcywgTG9zIEFuZ2VsZXMgKFRvbGwpDQooODY2
KSA2NzktOTk5NTx0ZWw6KDg2NiklMjA2NzktOTk5NSwsNzM1NzI4NDIjPiAgIChUb2xsLWZyZWUp
DQpDb25mZXJlbmNlIElEOiA3MzUgNzI4IDQyIw0KTG9jYWwgbnVtYmVyczxodHRwczovL2RpYWxp
bi50ZWFtcy5taWNyb3NvZnQuY29tLzg1NTFmNGMxLWJlYTMtNDQxYS04NzM4LTY5YWE1MTdhOTFj
NT9pZD03MzU3Mjg0Mj4gfCBSZXNldCBQSU48aHR0cHM6Ly9teXNldHRpbmdzLmx5bmMuY29tL3Bz
dG5jb25mZXJlbmNpbmc+IHwgTGVhcm4gbW9yZSBhYm91dCBUZWFtczxodHRwczovL2dvLm1pY3Jv
c29mdC5jb20vZndsaW5rLz9saW5raWQ9ODU3MjUwPiB8IE1lZXRpbmcgb3B0aW9uczxodHRwczov
L3RlYW1zLm1pY3Jvc29mdC5jb20vbWVldGluZ09wdGlvbnMvP29yZ2FuaXplcklkPTFjMjljMmY3
LWQzODYtNGM1YS1hM2JjLTBlZTEzYjQ4YmM2NSZ0ZW5hbnRJZD03MmY5ODhiZi04NmYxLTQxYWYt
OTFhYi0yZDdjZDAxMWRiNDcmdGhyZWFkSWQ9MTlfbWVldGluZ19NRFUxTkRNMlkyRXRPVFprWXkw
MFpqSTVMVGt6TURjdE1qTXhaRFl5TnpsaE5qUXlAdGhyZWFkLnYyJm1lc3NhZ2VJZD0wJmxhbmd1
YWdlPWVuLVVTPg0KSm9pbiB3aXRoIGEgdmlkZW8gY29uZmVyZW5jaW5nIGRldmljZQ0KODEzODc4
ODk2QHQucGxjbS52YzxtYWlsdG86ODEzODc4ODk2QHQucGxjbS52Yz4gVlRDIENvbmZlcmVuY2Ug
SUQ6IDAxNzkyMDY4NA0KQWx0ZXJuYXRlIFZUQyBkaWFsaW5nIGluc3RydWN0aW9uczxodHRwczov
L2RpYWxpbi5wbGNtLnZjL3RlYW1zLz9rZXk9ODEzODc4ODk2JmNvbmY9MDE3OTIwNjg0Pg0KDQo=

--_000_BYAPR21MB1191F417A3780683E4527855C89D0BYAPR21MB1191namp_
Content-Type: text/html; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dks_c_5601=
-1987">
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
<p class=3D"MsoNormal">Please use the other invite named =A1=B0Platform Tel=
emetry workgroup- bi-weekly sync=A1=B1<o:p></o:p></p>
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

--_000_BYAPR21MB1191F417A3780683E4527855C89D0BYAPR21MB1191namp_
Content-Type: text/calendar; charset="utf-8"; method=CANCEL
Content-Transfer-Encoding: base64

QkVHSU46VkNBTEVOREFSDQpNRVRIT0Q6Q0FOQ0VMDQpQUk9ESUQ6TWljcm9zb2Z0IEV4Y2hhbmdl
IFNlcnZlciAyMDEwDQpWRVJTSU9OOjIuMA0KQkVHSU46VlRJTUVaT05FDQpUWklEOlBhY2lmaWMg
U3RhbmRhcmQgVGltZQ0KQkVHSU46U1RBTkRBUkQNCkRUU1RBUlQ6MTYwMTAxMDFUMDIwMDAwDQpU
Wk9GRlNFVEZST006LTA3MDANClRaT0ZGU0VUVE86LTA4MDANClJSVUxFOkZSRVE9WUVBUkxZO0lO
VEVSVkFMPTE7QllEQVk9MVNVO0JZTU9OVEg9MTENCkVORDpTVEFOREFSRA0KQkVHSU46REFZTElH
SFQNCkRUU1RBUlQ6MTYwMTAxMDFUMDIwMDAwDQpUWk9GRlNFVEZST006LTA4MDANClRaT0ZGU0VU
VE86LTA3MDANClJSVUxFOkZSRVE9WUVBUkxZO0lOVEVSVkFMPTE7QllEQVk9MlNVO0JZTU9OVEg9
Mw0KRU5EOkRBWUxJR0hUDQpFTkQ6VlRJTUVaT05FDQpCRUdJTjpWRVZFTlQNCk9SR0FOSVpFUjtD
Tj1OZWVyYWogTGFka2FuaTpNQUlMVE86bmVsYWRrQG1pY3Jvc29mdC5jb20NCkFUVEVOREVFO1JP
TEU9UkVRLVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSVUU7Q049b3Bl
bmJtY0BsaQ0KIHN0cy5vemxhYnMub3JnOk1BSUxUTzpvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcN
CkFUVEVOREVFO1JPTEU9T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQ
PVRSVUU7Q049Sm9lIFAgTXVsaA0KIG9sbGFuZDpNQUlMVE86anBtdWxob2xAdXMuaWJtLmNvbQ0K
QVRURU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9
VFJVRTtDTj1MdWtlIENoZW46DQogTUFJTFRPOmx1a2VfY2hlbkBhc3BlZWR0ZWNoLmNvbQ0KQVRU
RU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJV
RTtDTj1NYXR0IENoZW4vDQogV1lIUS9XaXd5bm46TUFJTFRPOk1hdHRfQ2hlbkB3aXd5bm4uY29t
DQpBVFRFTkRFRTtST0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNW
UD1UUlVFO0NOPURvbmcgV2VpOk0NCiBBSUxUTzpEb25nLldlaUBhcm0uY29tDQpBVFRFTkRFRTtS
T0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPUpp
dGVuZHJhX0sNCiB1bWFyNEBEZWxsLmNvbTpNQUlMVE86Sml0ZW5kcmFfS3VtYXI0QERlbGwuY29t
DQpBVFRFTkRFRTtST0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNW
UD1UUlVFO0NOPVJlZWQgQiBGcmENCiBuZHNlbjpNQUlMVE86cmZyYW5kc2VAdXMuaWJtLmNvbQ0K
QVRURU5ERUU7Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9
VFJVRTtDTj1NaWNoYWVsIExpDQogbTpNQUlMVE86eW91aG91ckB1cy5pYm0uY29tDQpBVFRFTkRF
RTtST0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NO
PUJ1ZGR5IEh1YW4NCiBnICjpu4PlpKnptLspOk1BSUxUTzpCdWRkeS5IdWFuZ0BxdWFudGF0dy5j
b20NCkFUVEVOREVFO1JPTEU9T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtS
U1ZQPVRSVUU7Q049VG9tIFNhbmQ6TQ0KIEFJTFRPOnRyc2FuZEB1cy5pYm0uY29tDQpBVFRFTkRF
RTtST0xFPU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NO
PUFzbWFhIE1uZWINCiBoaTpNQUlMVE86QXNtYWFAbWVsbGFub3guY29tDQpBVFRFTkRFRTtST0xF
PU9QVC1QQVJUSUNJUEFOVDtQQVJUU1RBVD1ORUVEUy1BQ1RJT047UlNWUD1UUlVFO0NOPVBhdWwu
VmFuY2kNCiBsQGRlbGwuY29tOk1BSUxUTzpQYXVsLlZhbmNpbEBkZWxsLmNvbQ0KQVRURU5ERUU7
Uk9MRT1PUFQtUEFSVElDSVBBTlQ7UEFSVFNUQVQ9TkVFRFMtQUNUSU9OO1JTVlA9VFJVRTtDTj0i
VGFub3VzLCBFZCINCiA6TUFJTFRPOmVkLnRhbm91c0BpbnRlbC5jb20NCkFUVEVOREVFO1JPTEU9
T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSVUU7Q049Q2hyaXN0
b3BoZQ0KIHIgQm9zdGljOk1BSUxUTzpjYm9zdGljQHVzLmlibS5jb20NCkFUVEVOREVFO1JPTEU9
T1BULVBBUlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSVUU7Q049SmFtZXMg
TW9ycw0KIGU6TUFJTFRPOkphbWVzLk1vcnNlQGFybS5jb20NCkFUVEVOREVFO1JPTEU9T1BULVBB
UlRJQ0lQQU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSVUU7Q049VmlqYXkgS2hlbQ0K
IGthOk1BSUxUTzp2aWpheWtoZW1rYUBmYi5jb20NCkFUVEVOREVFO1JPTEU9T1BULVBBUlRJQ0lQ
QU5UO1BBUlRTVEFUPU5FRURTLUFDVElPTjtSU1ZQPVRSVUU7Q049Tmljb2xlIENvbg0KIHNlcjE6
TUFJTFRPOm5pY29sZWNvbnNlckBpYm0uY29tDQpERVNDUklQVElPTjtMQU5HVUFHRT1lbi1VUzpQ
bGVhc2UgdXNlIHRoZSBvdGhlciBpbnZpdGUgbmFtZWQg4oCcUGxhdGZvcm0gVGUNCiBsZW1ldHJ5
IHdvcmtncm91cC0gYmktd2Vla2x5IHN5bmPigJ1cblxuXG5cbkpvaW4gTWljcm9zb2Z0IFRlYW1z
IE1lZXRpbmc8aA0KIHR0cHM6Ly90ZWFtcy5taWNyb3NvZnQuY29tL2wvbWVldHVwLWpvaW4vMTkl
M2FtZWV0aW5nX01EVTFORE0yWTJFdE9UWmtZeTAwDQogWmpJNUxUa3pNRGN0TWpNeFpEWXlOemxo
TmpReSU0MHRocmVhZC52Mi8wP2NvbnRleHQ9JTdiJTIyVGlkJTIyJTNhJTIyNzJmOTgNCiA4YmYt
ODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3JTIyJTJjJTIyT2lkJTIyJTNhJTIyMWMyOWMyZjct
ZDM4Ni00YzVhLWEzYg0KIGMtMGVlMTNiNDhiYzY1JTIyJTdkPlxuKzEgMzIzLTg0OS00ODc0PHRl
bDorMSUyMDMyMy04NDktNDg3NFwsXCw3MzU3Mjg0MiM+DQogICAgVW5pdGVkIFN0YXRlc1wsIExv
cyBBbmdlbGVzIChUb2xsKVxuKDg2NikgNjc5LTk5OTU8dGVsOig4NjYpJTIwNjc5LTk5OTUNCiBc
LFwsNzM1NzI4NDIjPiAgIChUb2xsLWZyZWUpXG5Db25mZXJlbmNlIElEOiA3MzUgNzI4IDQyI1xu
TG9jYWwgbnVtYmVyczxodA0KIHRwczovL2RpYWxpbi50ZWFtcy5taWNyb3NvZnQuY29tLzg1NTFm
NGMxLWJlYTMtNDQxYS04NzM4LTY5YWE1MTdhOTFjNT9pZD03DQogMzU3Mjg0Mj4gfCBSZXNldCBQ
SU48aHR0cHM6Ly9teXNldHRpbmdzLmx5bmMuY29tL3BzdG5jb25mZXJlbmNpbmc+IHwgTGVhcm4N
CiAgbW9yZSBhYm91dCBUZWFtczxodHRwczovL2dvLm1pY3Jvc29mdC5jb20vZndsaW5rLz9saW5r
aWQ9ODU3MjUwPiB8IE1lZXRpbg0KIGcgb3B0aW9uczxodHRwczovL3RlYW1zLm1pY3Jvc29mdC5j
b20vbWVldGluZ09wdGlvbnMvP29yZ2FuaXplcklkPTFjMjljMmY3DQogLWQzODYtNGM1YS1hM2Jj
LTBlZTEzYjQ4YmM2NSZ0ZW5hbnRJZD03MmY5ODhiZi04NmYxLTQxYWYtOTFhYi0yZDdjZDAxMWRi
NDcNCiAmdGhyZWFkSWQ9MTlfbWVldGluZ19NRFUxTkRNMlkyRXRPVFprWXkwMFpqSTVMVGt6TURj
dE1qTXhaRFl5TnpsaE5qUXlAdGhyZQ0KIGFkLnYyJm1lc3NhZ2VJZD0wJmxhbmd1YWdlPWVuLVVT
PlxuSm9pbiB3aXRoIGEgdmlkZW8gY29uZmVyZW5jaW5nIGRldmljZVxuDQogODEzODc4ODk2QHQu
cGxjbS52YzxtYWlsdG86ODEzODc4ODk2QHQucGxjbS52Yz4gVlRDIENvbmZlcmVuY2UgSUQ6IDAx
NzkyMDYNCiA4NFxuQWx0ZXJuYXRlIFZUQyBkaWFsaW5nIGluc3RydWN0aW9uczxodHRwczovL2Rp
YWxpbi5wbGNtLnZjL3RlYW1zLz9rZXk9OA0KIDEzODc4ODk2JmNvbmY9MDE3OTIwNjg0PlxuXG4N
ClJSVUxFOkZSRVE9V0VFS0xZO1VOVElMPTIwMTkxMTE5VDE3MzAwMFo7SU5URVJWQUw9NDtCWURB
WT1UVTtXS1NUPVNVDQpFWERBVEU7VFpJRD1QYWNpZmljIFN0YW5kYXJkIFRpbWU6MjAxOTA5MDNU
MDkzMDAwDQpVSUQ6MDQwMDAwMDA4MjAwRTAwMDc0QzVCNzEwMUE4MkUwMDgwMDAwMDAwMDcwRTZG
N0E4NjcxQUQ1MDEwMDAwMDAwMDAwMDAwMDANCiAwMTAwMDAwMDA0QUMwN0E4ODAyNEExRDQ5OTY3
NzZDNzBGRjY3NzgzMA0KU1VNTUFSWTtMQU5HVUFHRT1lbi1VUzpDYW5jZWxlZDogUGxhdGZvcm0g
dGVsZW1ldHJ5IGFuZCBoZWFsdGggbW9uaXRvcmluZyAtDQogIFBTVCBBTSAoIHBsZWFzZSB1c2Ug
IlBsYXRmb3JtIFRlbGVtZXRyeSB3b3JrZ3JvdXAtIGJpLXdlZWtseSBzeW5jIiApDQpEVFNUQVJU
O1RaSUQ9UGFjaWZpYyBTdGFuZGFyZCBUaW1lOjIwMTkwNzA5VDA5MzAwMA0KRFRFTkQ7VFpJRD1Q
YWNpZmljIFN0YW5kYXJkIFRpbWU6MjAxOTA3MDlUMTAzMDAwDQpDTEFTUzpQVUJMSUMNClBSSU9S
SVRZOjENCkRUU1RBTVA6MjAxOTEwMDFUMTYxOTA4Wg0KVFJBTlNQOlRSQU5TUEFSRU5UDQpTVEFU
VVM6Q0FOQ0VMTEVEDQpTRVFVRU5DRTo2DQpMT0NBVElPTjtMQU5HVUFHRT1lbi1VUzpNaWNyb3Nv
ZnQgVGVhbXMgTWVldGluZw0KWC1NSUNST1NPRlQtQ0RPLUFQUFQtU0VRVUVOQ0U6Ng0KWC1NSUNS
T1NPRlQtQ0RPLU9XTkVSQVBQVElEOjM1MjYxMDI3NQ0KWC1NSUNST1NPRlQtQ0RPLUJVU1lTVEFU
VVM6RlJFRQ0KWC1NSUNST1NPRlQtQ0RPLUlOVEVOREVEU1RBVFVTOkZSRUUNClgtTUlDUk9TT0ZU
LUNETy1BTExEQVlFVkVOVDpGQUxTRQ0KWC1NSUNST1NPRlQtQ0RPLUlNUE9SVEFOQ0U6Mg0KWC1N
SUNST1NPRlQtQ0RPLUlOU1RUWVBFOjENClgtTUlDUk9TT0ZULVNLWVBFVEVBTVNNRUVUSU5HVVJM
Omh0dHBzOi8vdGVhbXMubWljcm9zb2Z0LmNvbS9sL21lZXR1cC1qb2luLw0KIDE5JTNhbWVldGlu
Z19NRFUxTkRNMlkyRXRPVFprWXkwMFpqSTVMVGt6TURjdE1qTXhaRFl5TnpsaE5qUXklNDB0aHJl
YWQudjIvDQogMD9jb250ZXh0PSU3YiUyMlRpZCUyMiUzYSUyMjcyZjk4OGJmLTg2ZjEtNDFhZi05
MWFiLTJkN2NkMDExZGI0NyUyMiUyYyUyMk8NCiBpZCUyMiUzYSUyMjFjMjljMmY3LWQzODYtNGM1
YS1hM2JjLTBlZTEzYjQ4YmM2NSUyMiU3ZA0KWC1NSUNST1NPRlQtU0NIRURVTElOR1NFUlZJQ0VV
UERBVEVVUkw6aHR0cHM6Ly9zY2hlZC5zZXJ2aWNlcy5za3lwZS5uZXQvdGVhDQogbXMvNzJmOTg4
YmYtODZmMS00MWFmLTkxYWItMmQ3Y2QwMTFkYjQ3LzFjMjljMmY3LWQzODYtNGM1YS1hM2JjLTBl
ZTEzYjQ4YmMNCiA2NS8xOV9tZWV0aW5nX01EVTFORE0yWTJFdE9UWmtZeTAwWmpJNUxUa3pNRGN0
TWpNeFpEWXlOemxoTmpReUB0aHJlYWQudjIvMA0KWC1NSUNST1NPRlQtU0tZUEVURUFNU1BST1BF
UlRJRVM6eyJjaWQiOiIxOTptZWV0aW5nX01EVTFORE0yWTJFdE9UWmtZeTAwWmpJDQogNUxUa3pN
RGN0TWpNeFpEWXlOemxoTmpReUB0aHJlYWQudjIiXCwicHJpdmF0ZSI6dHJ1ZVwsInR5cGUiOjBc
LCJtaWQiOjBcLCINCiByaWQiOjBcLCJ1aWQiOm51bGx9DQpYLU1JQ1JPU09GVC1PTkxJTkVNRUVU
SU5HRVhURVJOQUxMSU5LOg0KWC1NSUNST1NPRlQtT05MSU5FTUVFVElOR0NPTkZMSU5LOmNvbmY6
c2lwOm5lbGFka0BtaWNyb3NvZnQuY29tXDtncnV1XDtvcGFxDQogdWU9YXBwOmNvbmY6Zm9jdXM6
aWQ6dGVhbXM6MjowITE5Om1lZXRpbmdfTURVMU5ETTJZMkV0T1Raa1l5MDBaakk1TFRrek1EY3QN
CiBNak14WkRZeU56bGhOalF5LXRocmVhZC52MiExYzI5YzJmN2QzODY0YzVhYTNiYzBlZTEzYjQ4
YmM2NSE3MmY5ODhiZjg2ZjE0MQ0KIGFmOTFhYjJkN2NkMDExZGI0Nw0KWC1NSUNST1NPRlQtT05M
SU5FTUVFVElOR0lORk9STUFUSU9OOnsiT25saW5lTWVldGluZ1Byb3ZpZGVyIjozfQ0KWC1NSUNS
T1NPRlQtRE9OT1RGT1JXQVJETUVFVElORzpGQUxTRQ0KWC1NSUNST1NPRlQtRElTQUxMT1ctQ09V
TlRFUjpGQUxTRQ0KRU5EOlZFVkVOVA0KRU5EOlZDQUxFTkRBUg0K

--_000_BYAPR21MB1191F417A3780683E4527855C89D0BYAPR21MB1191namp_--
