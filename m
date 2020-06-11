Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D0C1F77D0
	for <lists+openbmc@lfdr.de>; Fri, 12 Jun 2020 14:19:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49k0CK1z5QzDqyf
	for <lists+openbmc@lfdr.de>; Fri, 12 Jun 2020 22:19:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam02-cy1-obe.outbound.protection.outlook.com
 (client-ip=40.107.76.73; helo=nam02-cy1-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=v1/MdosY; 
 dkim-atps=neutral
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760073.outbound.protection.outlook.com [40.107.76.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jch74WKyzDqgF
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jun 2020 07:39:33 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ew9qGd4Ne+LNMNIweUD3d/vpYfgfYinPYMoYYV0yLlk1BV/x64Y3lQC86X4q1SpvzIPrSlKYBLrObIZYQ/xYfOqMgZCd7wpIWY682RgetFlyIlvXM3lhrjOu7UPpoeLroKYlXAmLf/oyi3S+pJ5Sx2JcBWP8kdOo7PJq/IkM2HUYL0Sa5VhFumJ1YyHH3o8O1mreaNcBXLS3oXjbuS1aCNqExeZCbPTYLAKkfLB3HCmyqw3y7pJWH37mLa0gZEinhnssLKRAz+p29KA26GTt4FN7C/CU+Ov3nXnUyJtc7Jdfo8EQmcdmW2d+TfF7SRUOiqedv9+p54HbmgGQtk06/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djOQpniXDQVqEQrqbWCqM/ZY6SvZtsJEj7CPuJq0QEs=;
 b=Quk+WiwD5xA9pT1gtczTNk1Lbb3YrKqKoQGQMMPOl+OFwB+bIaAbQ9nkDlmDotQtfOenJ6BJnZ3B7PP5EPL23Hq2F2SoEaKxKS6QS4SE3mpiRKHRf3T6teyJVWNVOtrForXQY/TuKJyYOwgf1TNhKZKvicNY+aNnG6I+avdUgRE4mCDkwrwpiNOgZkEVC9NJmzn7j1OwJwWXeOP+wJD6U//8XlCzwRcoJmH/QmNqL42oWz0MwLzI0ArB4vyterjBfVDW2LqDhlr8H/LfSbZmxEUnYtalLjqbcQjt52b5n2lt/jy0+QGIGe9tkUIM1IsnJ9pgSK8FF1VpYII+Bq3uRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djOQpniXDQVqEQrqbWCqM/ZY6SvZtsJEj7CPuJq0QEs=;
 b=v1/MdosYkz92X+AG+k2m6qT1yEk3J3MMwgfkZktjXWLvyRaZsEzvoVUyHgd1s7BhKaHJ4M+lvsb4UkheHxFib/LQldndcWiLheyFu4dmr3FbJqnDRGTfP6T5kiYSHGscg5TBV+gbyKo+380hZp6L9FepZGY9jhwXYzYvR9ca6G4=
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SN1PR12MB2544.namprd12.prod.outlook.com (2603:10b6:802:2b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.23; Thu, 11 Jun
 2020 21:39:27 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::2571:49d:affd:c175]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::2571:49d:affd:c175%4]) with mapi id 15.20.3088.022; Thu, 11 Jun 2020
 21:39:27 +0000
From: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>
To: Mike Dolan <manager@lfprojects.org>, Bradley W Bishop <bradleyb@us.ibm.com>
Subject: RE: AMD's Signed CCLA
Thread-Topic: AMD's Signed CCLA
Thread-Index: AdY/MKmLvWwwQ29BR0ihLnuZG1S+MwA/h7uAAAJwJlA=
Date: Thu, 11 Jun 2020 21:39:26 +0000
Message-ID: <SN1PR12MB2542B7316775ABE7C8F5033F96800@SN1PR12MB2542.namprd12.prod.outlook.com>
References: <SN1PR12MB25428FA4CD525DF87AC73F8496830@SN1PR12MB2542.namprd12.prod.outlook.com>
 <CALVHhecYnixzFTgxbFTcYcgTQNh8JSZpikBnmj4RDo2dax63sg@mail.gmail.com>
In-Reply-To: <CALVHhecYnixzFTgxbFTcYcgTQNh8JSZpikBnmj4RDo2dax63sg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-06-11T21:39:04Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=e882205b-0454-4a1d-a398-0000b189c0bc;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-06-11T21:39:25Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: f998a5c6-1af1-40ab-b063-0000293c4523
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-06-11T21:38:51Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: fe38da8c-5633-4127-b9cd-0000bc157bb9
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
authentication-results: lfprojects.org; dkim=none (message not signed)
 header.d=none;lfprojects.org; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.77.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0a3fb011-3a2b-4191-c9d9-08d80e4fea5f
x-ms-traffictypediagnostic: SN1PR12MB2544:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB2544CED7E02021FB38EA6EA596800@SN1PR12MB2544.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0431F981D8
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TOfhcOBr1YYtA171wKzWWecodUYqwPy0DPNqUjcYsenAj1JReyOAT9ZXEGf0rEy46hK08qLwN9/x8thq2P94fsOiDy0aDs/1vAExDaOp506ryp00tlo7dRGYfxFPLoWiJm+uRRV5l+dNQEINIqN1MdRIADBe08bZfdq1AiKEQzGKEzSbK5+IHFuwcto4j6ts4joPP5spdxyFA2LWfdrVmbGLf5nLylB9poW45xDRJ+vhVMOz4YuCtZ1UWf+FZMIa0b7oGFqPZCAcepjHrVlnqaCfQt7uVWkMsLiSLgQgNw8y132N8Xz/92YJFf60Yh9bCM/sDSOhd1Xxx9ZCS2Qm9Et3DPBM0mTdQkWpSjf5d+aJyYa1Ev8zfRjLuBSLJqMz4hjYwbRAJDKKH/b5RjceCQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(316002)(4326008)(5660300002)(52536014)(478600001)(7696005)(54906003)(110136005)(9686003)(8676002)(76116006)(66616009)(8936002)(66556008)(2906002)(66476007)(64756008)(66946007)(99936003)(55016002)(86362001)(26005)(33656002)(186003)(53546011)(6506007)(166002)(66446008)(3480700007)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: lJqPn+ipy6aLQvVKuuLaVl1NqHEooLlvMlDTa+23DYScTqft4+SZUTh8B30UK4438HgIiXHsoFyYsg37ePcSrchnBag4Baz3ffMnX6eQ8wHph3ceHziI8fpjFDPScPelLU8EvnUt1Z1QLnJRoGc9b19SYWwvCZbttIzGjX1AvE11ikGSxHuPYUtw07mVXyuw36RXJrx3gHleG+plkeUMIMuFB4nS3kEzcOZB4Cr5gEGQ++M/Q87KsipeuEH7ZUc4Tk9cI8U7moTsXTBQlgYjMxaIeMW5h3QHJjOaN+lAGZ7GTYPOPlnAOlNTiGREoR6xPXmuD0b9sU6Gv15e2aolcuUbw+YJA3qHJyl8un5Zkcr9Da3hQbgMqr2q2waUppR+UvWoN5BRAdy0ZgXI0lmaWXXasFHbKLT5mFkYIanltkci2WEdhOTqPDc+h8LBmU95SOrc1LSocjdFphHbgwq9dfpsQQd0E6BxlB895W3csT4=
Content-Type: multipart/related;
 boundary="_004_SN1PR12MB2542B7316775ABE7C8F5033F96800SN1PR12MB2542namp_";
 type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3fb011-3a2b-4191-c9d9-08d80e4fea5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2020 21:39:26.8757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: skjedg4Lfc7g2NAHlte4Gwz1JtLqRTFG1+R0+26cJeRvalp37MPt3b5aE2TPZUztG2XZKcUycAzBwbW0G+JAbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2544
X-Mailman-Approved-At: Fri, 12 Jun 2020 22:16:55 +1000
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "bradleyb@fuzziesquirrel.com" <bradleyb@fuzziesquirrel.com>,
 "kurt.r.taylor@gmail.com" <kurt.r.taylor@gmail.com>, "Stephens,
 Christie" <Christie.Stephens@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_SN1PR12MB2542B7316775ABE7C8F5033F96800SN1PR12MB2542namp_
Content-Type: multipart/alternative;
	boundary="_000_SN1PR12MB2542B7316775ABE7C8F5033F96800SN1PR12MB2542namp_"

--_000_SN1PR12MB2542B7316775ABE7C8F5033F96800SN1PR12MB2542namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Public Use]

Thanks Mike.

Brad,
Can you please help create meta-amd?

Supreeth Venkatesh
System Manageability Architect  |  AMD
Server Software
---------------------------------------------------------------------------=
---------------------------------------
7171 Southwest Parkway, Austin, TX 78735
Facebook<https://www.facebook.com/AMD> |  Twitter<https://twitter.com/AMD> =
|  amd.com<http://www.amd.com/>
[cid:image001.png@01D4ACEA.20484940]

From: Mike Dolan <manager@lfprojects.org>
Sent: Thursday, June 11, 2020 3:28 PM
To: Venkatesh, Supreeth <Supreeth.Venkatesh@amd.com>; Bradley W Bishop <bra=
dleyb@us.ibm.com>
Cc: openbmc@lists.ozlabs.org; bradleyb@fuzziesquirrel.com; kurt.r.taylor@gm=
ail.com; Stephens, Christie <Christie.Stephens@amd.com>
Subject: Re: AMD's Signed CCLA

[CAUTION: External Email]
Hi everyone, I'm copying Brad Bishop from the project community who can get=
 you setup for adding people.

Thanks,

Mike Dolan
manager@lfprojects.org<mailto:manager@lfprojects.org>

On Wed, Jun 10, 2020 at 10:36 AM Venkatesh, Supreeth <Supreeth.Venkatesh@am=
d.com<mailto:Supreeth.Venkatesh@amd.com>> wrote:

[AMD Public Use]

Please find the signed CCLA from AMD attached.
We look forward to working with the OpenBMC community.

In my previous role, I enjoyed working with the OpenBMC Community and
I look forward to continue collaboration with the OpenBMC Community.

We have ported OpenBMC on AMD customer reference boards and would like to u=
pstream OpenBMC support for AMD customer reference boards.
Can you please help create meta-amd?

Thanks,
Supreeth Venkatesh
System Manageability Architect  |  AMD
Server Software
---------------------------------------------------------------------------=
---------------------------------------
7171 Southwest Parkway, Austin, TX 78735
Facebook<https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fwww.facebook.com%2FAMD&data=3D02%7C01%7CSupreeth.Venkatesh%40amd.com%7Cd1=
2d90af11e5433a083508d80e45f268%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7=
C637275040889497878&sdata=3Dx50oNAJhiToyY2t0V%2BWvQ%2FeMTt%2BTe%2BpCspEpAko=
kADQ%3D&reserved=3D0> |  Twitter<https://nam11.safelinks.protection.outlook=
.com/?url=3Dhttps%3A%2F%2Ftwitter.com%2FAMD&data=3D02%7C01%7CSupreeth.Venka=
tesh%40amd.com%7Cd12d90af11e5433a083508d80e45f268%7C3dd8961fe4884e608e11a82=
d994e183d%7C0%7C0%7C637275040889507872&sdata=3DoAgEBxiqCYwOBWaLQW8tbwZ5SRp8=
rT9JbyadqXifMvw%3D&reserved=3D0> |  amd.com<https://nam11.safelinks.protect=
ion.outlook.com/?url=3Dhttp%3A%2F%2Fwww.amd.com%2F&data=3D02%7C01%7CSupreet=
h.Venkatesh%40amd.com%7Cd12d90af11e5433a083508d80e45f268%7C3dd8961fe4884e60=
8e11a82d994e183d%7C0%7C0%7C637275040889507872&sdata=3Dwwwwk%2F7u8Z%2BZ1ropZ=
HfY5QiK4Rg5tjIQ3t3DcKTpOGA%3D&reserved=3D0>
[cid:image001.png@01D4ACEA.20484940]


--_000_SN1PR12MB2542B7316775ABE7C8F5033F96800SN1PR12MB2542namp_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
p.msipheader251902e5, li.msipheader251902e5, div.msipheader251902e5
	{mso-style-name:msipheader251902e5;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"msipheader251902e5" style=3D"margin:0in;margin-bottom:.0001pt">=
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;co=
lor:#317100">[AMD Public Use]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks Mike. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Brad,<o:p></o:p></p>
<p class=3D"MsoNormal">Can you please help create meta-amd?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Arial&quot;,sans-serif;color:black">Supreeth Venkatesh</span></b><span sty=
le=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:black">System Manageability Architect&nbsp;&nbsp;=
|<b>&nbsp;&nbsp;AMD</b><br>
Server Software<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#C4BBA0;letter-spacing:-1.4pt">---------------=
---------------------------------------------------------------------------=
------------------------</span></b><b><span style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,sans-serif;color:#C4BBA0"><o:p></o:p></span></b></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:black">7171 Southwest Parkway, Austin, TX 78735<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Ari=
al&quot;,sans-serif;color:black"><a href=3D"https://www.facebook.com/AMD"><=
span style=3D"color:black">Facebook</span></a>&nbsp;|&nbsp;&nbsp;<a href=3D=
"https://twitter.com/AMD"><span style=3D"color:black">Twitter</span></a>&nb=
sp;|&nbsp;&nbsp;<a href=3D"http://www.amd.com/"><span style=3D"color:black"=
>amd.com</span></a></span><span style=3D"font-size:10.0pt;font-family:&quot=
;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp;</span><span style=3D"font=
-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black"><img border=3D"0" width=3D"150" height=3D"35" style=3D"wid=
th:1.5625in;height:.3645in" id=3D"Picture_x0020_11" src=3D"cid:image001.png=
@01D6400E.C9931DF0" alt=3D"cid:image001.png@01D4ACEA.20484940"></span><span=
 style=3D"font-family:&quot;Arial&quot;,sans-serif;color:black"><o:p></o:p>=
</span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Mike Dolan &lt;manager@lfprojects.org&g=
t; <br>
<b>Sent:</b> Thursday, June 11, 2020 3:28 PM<br>
<b>To:</b> Venkatesh, Supreeth &lt;Supreeth.Venkatesh@amd.com&gt;; Bradley =
W Bishop &lt;bradleyb@us.ibm.com&gt;<br>
<b>Cc:</b> openbmc@lists.ozlabs.org; bradleyb@fuzziesquirrel.com; kurt.r.ta=
ylor@gmail.com; Stephens, Christie &lt;Christie.Stephens@amd.com&gt;<br>
<b>Subject:</b> Re: AMD's Signed CCLA<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">[CAUTION: External Email] <o:p></o:p></p>
<div>
<div>
<p class=3D"MsoNormal">Hi everyone, I'm copying Brad Bishop from the projec=
t community who can get you setup for adding people.
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Mike Dolan<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"mailto:manager@lfprojects.org">manager@lf=
projects.org</a><o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, Jun 10, 2020 at 10:36 AM Venkatesh, Supreeth=
 &lt;<a href=3D"mailto:Supreeth.Venkatesh@amd.com">Supreeth.Venkatesh@amd.c=
om</a>&gt; wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<div>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:10.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:#317100">[AMD Public Use]=
</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Please find the signed CCLA from AMD attached.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">We look forward to working with the OpenBMC community.<o:p></o:p><=
/p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">In my previous role, I enjoyed working with the OpenBMC Community =
and
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">I look forward to continue collaboration with the OpenBMC Communit=
y.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">We have ported OpenBMC on AMD customer reference boards and would =
like to upstream OpenBMC support for AMD customer reference boards.<o:p></o=
:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">Can you please help create meta-amd?<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans=
-serif;color:black">Thanks,</span><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><b><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,s=
ans-serif;color:black">Supreeth Venkatesh</span></b><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-=
serif;color:black">System Manageability Architect&nbsp;&nbsp;|<b>&nbsp;&nbs=
p;AMD</b><br>
Server Software</span><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><b><span style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sa=
ns-serif;color:#C4BBA0;letter-spacing:-1.4pt">-----------------------------=
---------------------------------------------------------------------------=
----------</span></b><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-=
serif;color:black">7171 Southwest Parkway, Austin, TX 78735</span><o:p></o:=
p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-=
serif;color:black"><a href=3D"https://nam11.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fwww.facebook.com%2FAMD&amp;data=3D02%7C01%7CSupreeth=
.Venkatesh%40amd.com%7Cd12d90af11e5433a083508d80e45f268%7C3dd8961fe4884e608=
e11a82d994e183d%7C0%7C0%7C637275040889497878&amp;sdata=3Dx50oNAJhiToyY2t0V%=
2BWvQ%2FeMTt%2BTe%2BpCspEpAkokADQ%3D&amp;reserved=3D0" target=3D"_blank"><s=
pan style=3D"color:black">Facebook</span></a>&nbsp;|&nbsp;&nbsp;<a href=3D"=
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Ftwitter=
.com%2FAMD&amp;data=3D02%7C01%7CSupreeth.Venkatesh%40amd.com%7Cd12d90af11e5=
433a083508d80e45f268%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637275040=
889507872&amp;sdata=3DoAgEBxiqCYwOBWaLQW8tbwZ5SRp8rT9JbyadqXifMvw%3D&amp;re=
served=3D0" target=3D"_blank"><span style=3D"color:black">Twitter</span></a=
>&nbsp;|&nbsp;&nbsp;<a href=3D"https://nam11.safelinks.protection.outlook.c=
om/?url=3Dhttp%3A%2F%2Fwww.amd.com%2F&amp;data=3D02%7C01%7CSupreeth.Venkate=
sh%40amd.com%7Cd12d90af11e5433a083508d80e45f268%7C3dd8961fe4884e608e11a82d9=
94e183d%7C0%7C0%7C637275040889507872&amp;sdata=3Dwwwwk%2F7u8Z%2BZ1ropZHfY5Q=
iK4Rg5tjIQ3t3DcKTpOGA%3D&amp;reserved=3D0" target=3D"_blank"><span style=3D=
"color:black">amd.com</span></a></span><span style=3D"font-size:10.0pt;font=
-family:&quot;Arial&quot;,sans-serif;color:black">&nbsp;&nbsp;</span><o:p><=
/o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto"><span style=3D"font-family:&quot;Arial&quot;,sans-serif;color:blac=
k"><img border=3D"0" width=3D"150" height=3D"35" style=3D"width:1.5625in;he=
ight:.3645in" id=3D"gmail-m_1053515230859926111Picture_x0020_11" src=3D"cid=
:image001.png@01D6400E.C9931DF0" alt=3D"cid:image001.png@01D4ACEA.20484940"=
></span><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto">&nbsp;<o:p></o:p></p>
</div>
</div>
</blockquote>
</div>
</div>
</div>
</body>
</html>

--_000_SN1PR12MB2542B7316775ABE7C8F5033F96800SN1PR12MB2542namp_--

--_004_SN1PR12MB2542B7316775ABE7C8F5033F96800SN1PR12MB2542namp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=3608;
	creation-date="Thu, 11 Jun 2020 21:39:26 GMT";
	modification-date="Thu, 11 Jun 2020 21:39:26 GMT"
Content-ID: <image001.png@01D6400E.C9931DF0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAJYAAAAjCAYAAAB2BvMkAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJ
bWFnZVJlYWR5ccllPAAAA0xpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdp
bj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6
eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuNi1jMTQ1IDc5LjE2
MzQ5OSwgMjAxOC8wOC8xMy0xNjo0MDoyMiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJo
dHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlw
dGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEu
MC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVz
b3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1N
OkRvY3VtZW50SUQ9InhtcC5kaWQ6Njg2Njg2MTAwRDEzMTFFOTg1OEREMTQ2NTU1Qjg5RTUiIHht
cE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6Njg2Njg2MEYwRDEzMTFFOTg1OEREMTQ2NTU1Qjg5RTUi
IHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKE1hY2ludG9zaCkiPiA8
eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0iYWRvYmU6ZG9jaWQ6cGhvdG9zaG9w
OmRmOTM1NGYxLTFiODYtNDE0Zi1hYmE2LWIzZDg0OGUzYjMxYiIgc3RSZWY6ZG9jdW1lbnRJRD0i
YWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOmRmOTM1NGYxLTFiODYtNDE0Zi1hYmE2LWIzZDg0OGUzYjMx
YiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0
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
PP9xuG0AAAAASUVORK5CYII=

--_004_SN1PR12MB2542B7316775ABE7C8F5033F96800SN1PR12MB2542namp_--
