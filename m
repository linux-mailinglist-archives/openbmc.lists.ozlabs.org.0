Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5DC44AA8B
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 10:24:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpMyB0Gntz2yZ6
	for <lists+openbmc@lfdr.de>; Tue,  9 Nov 2021 20:24:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=LQodvVh2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=59471ce898=yuho.tsai@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=LQodvVh2; dkim-atps=neutral
X-Greylist: delayed 7731 seconds by postgrey-1.36 at boromir;
 Tue, 09 Nov 2021 20:24:20 AEDT
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpMxc5wyXz2xrl
 for <openbmc@lists.ozlabs.org>; Tue,  9 Nov 2021 20:24:18 +1100 (AEDT)
Received: from pps.filterd (m0132503.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A96TWKp014958
 for <openbmc@lists.ozlabs.org>; Tue, 9 Nov 2021 07:15:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=dkim;
 bh=iZGaMzo2cHx24mYBHMXIwwHl1dP+tGVND0Klhb4Gek8=;
 b=LQodvVh2KEIbUqBdZL645b8OU/hardLqhzDhWjVUZG8cEvQSFfVWW7YuT9khQh/fshRc
 MNVWnU/cV2Z+CLwEq2STYykrmfpESxQ197tPbHM05WTUD64rPEAITSx9pUZ70HLGrdRb
 Axk/WAJ9mZaqpAL3+Yu/rNvmw/Ih4jd+AR/OksXklLLbKXSqnb4Od6Q1xB1ksYm86eRR
 tikMRDER2gXmVw5j+64YeEl4HcRvfyBW+fzhRpWg/vNmWAdgvF8H3hz5FBZxUozwu4MS
 L90n0sD129HHkik1RLXeULbJJJ0ulrBtBYUN43Apce52ZbPbqCy7Ht1dtpt70KygjzTZ sQ== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 by mx07-002d6701.pphosted.com with ESMTP id 3c6x2nfgpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Nov 2021 07:15:23 +0000
Received: from MWHPR03CA0006.namprd03.prod.outlook.com (2603:10b6:300:117::16)
 by SN6PR08MB4845.namprd08.prod.outlook.com (2603:10b6:805:6e::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15; Tue, 9 Nov
 2021 07:15:21 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:117:cafe::ba) by MWHPR03CA0006.outlook.office365.com
 (2603:10b6:300:117::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Tue, 9 Nov 2021 07:15:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.64)
 smtp.mailfrom=flex.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=fail action=oreject
 header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.64 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.64; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.64) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10 via Frontend Transport; Tue, 9 Nov 2021 07:15:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amWdAOrh9GlfDb5jhWWRvU6rzfrxk0XsvGGxvf3PFTzT61tDwEk3e59ytMCz81ExKH7+6HqejBfNBur+WG2h1xXLfRPMMqgG4ABSrb4WMs7mIxUdwzpUcBJszHcX7tkw5vTzWw3eJBluXVERe5k7zXWj9lgTUtSvUWGf0iwbcAJbtyfn4i0YhKSg1ZkJVPJUa84g30/0Ga8DJ8hNnYO5SZTxpLHNiekMYqyf4XStN/kSVEl2RAEEr/iFRHeUfo7X+chaSI4lNRdeM+oQ+pgYpbSvGRO4rro0bSfyE2jsaFCKcVeO9SO3sLUSBOy91wbb1tM0dSiH0FAzUwEbh8sp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZkgGwEgbVRfxO65wAwwd0NWSYr+vM3wZCvQeYwiTSc=;
 b=Pn/2SgB+xbkjWcMyDMXSNvFFCsgOBqJNpCBO8DjAWAzloYyxZnFJxt8LM1Tp5v9DUYDIURnPHirSpW5SnARdWPj8oZ6ri4VVuedXdGACsGb9wKh6iP8b5CTSTyNLQUdK1l4ROcRszGNtpfNKKUd5wwj5M/ddyix62ywjaZoGfEibvQ+YUPBim1swNDHLXcstp7q5yj0l1BYXBCN5qYRucE6++3TPZMMQyH1YqjLQf5jIWLRe5GXDVI58GVDk5OpMXthkLF5iP+EArB8SMW4bcp2wQ5lzIGGaZOmkz7gdWzwhFYF3D87QfwoJdsjBOZemaVG0ZS0qj9XUWKXEszJW8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5098.namprd08.prod.outlook.com (2603:10b6:5:4d::33) by
 DM5PR08MB3579.namprd08.prod.outlook.com (2603:10b6:4:6a::37) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11; Tue, 9 Nov 2021 07:15:18 +0000
Received: from DM6PR08MB5098.namprd08.prod.outlook.com
 ([fe80::20b5:b92c:3b6f:1fa2]) by DM6PR08MB5098.namprd08.prod.outlook.com
 ([fe80::20b5:b92c:3b6f:1fa2%7]) with mapi id 15.20.4669.016; Tue, 9 Nov 2021
 07:15:18 +0000
From: Yuho Tsai <Yuho.Tsai@flex.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: The question about the firmware update
Thread-Topic: The question about the firmware update
Thread-Index: AdfUmDJJli6el6tyS8m2vOZfSQpomQ==
Date: Tue, 9 Nov 2021 07:15:17 +0000
Message-ID: <DM6PR08MB509869155D0E2235CCA5694E88929@DM6PR08MB5098.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c53bf2e7-2296-4dd8-89b7-08d9a350b0c5
x-ms-traffictypediagnostic: DM5PR08MB3579:|SN6PR08MB4845:
X-Microsoft-Antispam-PRVS: <SN6PR08MB48454485B105BF192B7E992788929@SN6PR08MB4845.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 941bGsByOPjOIKf+zfuwVHwNEXMar7pK/YyKuVbStgQelRy91rtSh5JNHjMp81R2fJj6GcmEaXGbgMi9c+4gVtEjCJaXWeqY9f7w29IYnKmMJJfaFgbcJzF56+2VwtnB/VrK5tq2ShYTvTQQQtznjq/zpW+VqvuWR4wXfdSOLEU78E+sAFBZ4hWEsRm8fWwlCL7JfQABujZh3juVB3quH2nX3DT4KH/p2o78Z0Bm6sagf/GThQWb+WwRqfPUgStk89D8woBrAD7qcBhLwzDn+mkBPsawmc0982ZA88jC7oyMTAgc9oKqeWWSCdCOnUvJMoE9edOgo1deUIm3fj2NbAtVC8e9d+drT27ccD2o+/fYtGSu9ARizD0rvOnnFgUjMHOrch7vhhVn+Ys8liI6mVkMupK5DKM6uZebkSLwZM0PJj3C8/jH+5qXrMclMn3hM+DX/PBXiWUfhyzgcinza9BdYu9K2jYUW4JmtO0otYR94jyz/PGczxqRVuGpqjckRXvAtoHHhpQOr/PbFa7FC5p1StJ34GOtjyE8vhN2Ow81EBKUB05eogD/vPbCk1kkxGTuwLj+aw7andybRnTvZ4emwIMEJl/Xnnxk0Hk2UHjDhEkPE9VvBhUSxc7nc/8ibar2yGEL4jLTya++6dW4vntrEVKBF8UVKlYHy2Nx5m99vBBAGKh5s6Ln3sMkB89vR9T48VcSW5ugPXsM1w06GQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5098.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(15650500001)(52536014)(86362001)(2906002)(64756008)(38070700005)(66556008)(76116006)(83380400001)(6506007)(9686003)(66446008)(26005)(5660300002)(186003)(508600001)(7696005)(55016002)(6916009)(316002)(8676002)(38100700002)(66476007)(33656002)(122000001)(4744005)(66946007)(8936002);
 DIR:OUT; SFP:1102; 
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB509869155D0E2235CCA5694E88929DM6PR08MB5098namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR08MB3579
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: c916bc4e-af25-49e8-4f2a-08d9a350af38
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BJNcQTKmoia2iXdjM42WQ5PxT7YzVbaKB/dWQM+IEohaUOZBs+NUSWvDhNymPd1nIYCHu9qpEX8ttGVU1rs6XdVS3P1r2LPsiHkPDaBFkObjK6DYzXEt3TCSIhdlUxZWCBLE8KmG/K5ZObZdrnnlaVpGXCTvdswFVOikuOqNg3iJ7rUd8gr5cEwhAuawcTFkQHy0P1KmPmF/YifOfy9R9gewxwVDFBaHX83Wg5L15B2dCfHJmuUG62GWOKIRwH34RHZy9RLgGgXxSnDwV12x+lPtO2jQUJkh1mfMLMo2MfQF66PMnfkJP0qK1INprndO8matVZ+EVoP/7dUX2TSTFdZ/jYimoyiZDqEvCBqEOwNCFj9sovJDw80MF0CagJZhUfH3Dx0Q93E9YG3j0FrK1kwvYc7cdJqsT81JmNqLXovBBfnlOTQvwWUmcFY7kn23iVNY6oTtSxhiBaTDLnkFI0obVmf/PX4dUbL6Zcvt1hQ6+K2VIBlVZsDhdrTQJ+HT8uDquxcD4+xmVS6jQ1EEjy3NM6sD/h5I7Okccd2FhwlULIQqjQcAeOLXgZ4Aqg83ZdtCTB4TaIbNc1lYUzNvszDYWWJOWf1kbUpJrJVYF+jKaGM7vQxVqMEc3WPZuk0FdpbxnQXybDucshjAIrujFV56GfmIQ+9Y5aSdfLNSZlgyQccjJ78H8xCR/YJPYzL/63pU4/Kj/rNThx6EOK0jgbUyS7dwRDATKUIyTtnQJvc=
X-Forefront-Antispam-Report: CIP:144.49.247.64; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(46966006)(36840700001)(316002)(15650500001)(83380400001)(86362001)(36860700001)(6916009)(356005)(4186021)(8936002)(508600001)(70586007)(81166007)(2906002)(7696005)(186003)(55016002)(70206006)(8676002)(336012)(33656002)(47076005)(5660300002)(52536014)(26005)(6506007)(82310400003)(9686003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2021 07:15:20.6044 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c53bf2e7-2296-4dd8-89b7-08d9a350b0c5
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.64];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4845
X-Proofpoint-ORIG-GUID: zH1GltTWOT2JO7ik4LNiLu5vklsROuEF
X-Proofpoint-GUID: zH1GltTWOT2JO7ik4LNiLu5vklsROuEF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-09_02,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=693 clxscore=1011
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 mlxscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111090042
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

--_000_DM6PR08MB509869155D0E2235CCA5694E88929DM6PR08MB5098namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm a rookie in the open BMC development. I have an ast2600 platform with a=
 flash socket. So I can have offline program my new built firmware.

As I tried to update by using Webui, I put the obmc-phosphor-image-platform=
name-date.static.mtd.tar in the add file and push start update.
I can see the web ui tell me the updates started, and verify update. And fi=
nally I got a Error dialog and it display "Error starting firmware update".

I'd like to know how can I solve the problem? Is there any configuration I =
missed?

Thanks.


Legal Disclaimer :
The information contained in this message may be privileged and confidentia=
l.=20
It is intended to be read only by the individual or entity to whom it is ad=
dressed=20
or by their designee. If the reader of this message is not the intended rec=
ipient,=20
you are on notice that any distribution of this message, in any form,=20
is strictly prohibited. If you have received this message in error,=20
please immediately notify the sender and delete or destroy any copy of this=
 message!

--_000_DM6PR08MB509869155D0E2235CCA5694E88929DM6PR08MB5098namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:"Century Gothic";
	panose-1:2 11 5 2 2 2 2 2 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Century Gothic",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif">I&#8217;m a rookie in the open BMC development. I have an ast=
2600 platform with a flash socket. So I can have offline program my new bui=
lt firmware.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif">As I tried to update by using Webui, I put the obmc-phosphor-=
image-platformname-date.static.mtd.tar in the add file and push start updat=
e.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif">I can see the web ui tell me the updates started, and verify =
update. And finally I got a Error dialog and it display &#8220;Error starti=
ng firmware update&#8221;.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif">I&#8217;d like to know how can I solve the problem? Is there =
any configuration I missed?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif">Thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Century Gothic&quot=
;,sans-serif"><o:p>&nbsp;</o:p></span></p>
</div>

<DIV>
Legal Disclaimer :<BR>
The information contained in this message may be privileged and confidentia=
l. <BR>
It is intended to be read only by the individual or entity to whom it is ad=
dressed <BR>
or by their designee. If the reader of this message is not the intended rec=
ipient, <BR>
you are on notice that any distribution of this message, in any form, <BR>
is strictly prohibited. If you have received this message in error, <BR>
please immediately notify the sender and delete or destroy any copy of this=
 message!<BR>
</DIV></body>
</html>

--_000_DM6PR08MB509869155D0E2235CCA5694E88929DM6PR08MB5098namp_--
