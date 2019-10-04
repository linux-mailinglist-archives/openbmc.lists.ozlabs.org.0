Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FF8CBC5E
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 15:57:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46lBJp4ptRzDqdX
	for <lists+openbmc@lfdr.de>; Fri,  4 Oct 2019 23:57:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=40.107.8.47; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.b="LgE/5BOK"; 
 dkim=fail reason="signature verification failed" (1024-bit key)
 header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com
 header.b="KTr/VAA8"; dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80047.outbound.protection.outlook.com [40.107.8.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46lBHc0d98zDqXZ
 for <openbmc@lists.ozlabs.org>; Fri,  4 Oct 2019 23:56:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBQMKhBHtLjRFAckndehgdPvgHnVoFcIocAdWxnCUS4=;
 b=LgE/5BOKm9yByQVDujcDbcvkiPHVhsIISzc0u9J1YIEHk519AmtoE2zxK6MMWcadKJXY89wStVWDLZg0/Io8zNy/DnksfPebqDv/LUbyqY2EU2fopdMgntRx5NQAdtoMoTSJFQ2AfuvP3NAfTkN/G4x5aCLsh4EwW+xjFHGdn8w=
Received: from VE1PR08CA0023.eurprd08.prod.outlook.com (2603:10a6:803:104::36)
 by VI1PR08MB3614.eurprd08.prod.outlook.com (2603:10a6:803:85::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2305.20; Fri, 4 Oct
 2019 13:56:16 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2a01:111:f400:7e0a::202) by VE1PR08CA0023.outlook.office365.com
 (2603:10a6:803:104::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2305.17 via Frontend
 Transport; Fri, 4 Oct 2019 13:56:16 +0000
Authentication-Results: spf=temperror (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.ozlabs.org; dmarc=none action=none
 header.from=arm.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arm.com: DNS Timeout)
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2305.15 via Frontend Transport; Fri, 4 Oct 2019 13:56:14 +0000
Received: ("Tessian outbound 927f2cdd66cc:v33");
 Fri, 04 Oct 2019 13:56:14 +0000
X-CR-MTA-TID: 64aa7808
Received: from bcbea3086890.2 (ip-172-16-0-2.eu-west-1.compute.internal
 [104.47.2.50]) by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D5A740E-630E-4D23-A073-6C76B3017B5B.1; 
 Fri, 04 Oct 2019 13:56:09 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50])
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bcbea3086890.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 04 Oct 2019 13:56:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+lV2hOAsdq8vlFBOcfFNr/sEl8qblsFwxYshnGb388mQM+BmRKfQJO6hQ/YmyhJQRujGEwh+XrU1V/4baNaqsCgy3jnCbIhoxuTUDZmLDr52AQ0K7BYT1rwhrRz2EJurLimAAgTSqDE/BS/OOEde4yKtTsWlXiIF+rhaNo611XX+Vx2NoJgbAa4Zye7xTcrdyYigzghmMUxrmAwJ8Rwpqp4IGmxkQS8iZxgPEleTI/VJF+mTrmJ4wGTCIAmESIiCJfeM6xAwFfaaiscDNQWRLleBmXayFu3+3DzTtHYrxtqDUXqmxibjQUo0hNQuakWfc0OiX+CWTEg4UuPc1fPMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMCOcoofDQY37L381H4li903Tyo9MId/jtdH/UayiNc=;
 b=AGM9dyi0okqhvFs73VilEWR3u9JcicMimVXLDFBhl6hAkidH400DG9ccbp5ePdazxxBT/wFzTUcMvCQSxgAWuFo96Eb4yyLkl4O8sBF5E2Lqq/F5bhchBuORfV5CKS5fCYrCJTVwRvLcvMyY0hXyTB7Kp1RL9ZJqHRpxvTiea6oUxcYwbzyiuhaKbWpFUgKlPWu3okMKxtkdKL2mJGxwWpChXacokstEt8K4rXWCWsKHS1aAWguIi+Dho8b77Lc64LN/QlJVLex5AJXa9F/xG9vOU2jcUHUFRqGwumOHmLfdvNWfU/lPzfXmZxco4qxcPbSbSJwtgcrr/VPWzxjVyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMCOcoofDQY37L381H4li903Tyo9MId/jtdH/UayiNc=;
 b=KTr/VAA8tS4EdZD11eXwkGTZdfGj085Cpy3aGDcbx+LPIFcWQ2+eFFUeWKayxiuqcQ8cmi8lPuQNOT/rckubEqg7ISkkKFKLGP46w0/sCERBTZINPCbmabcGba8xoOSCQcRLq0M2HuCa5Om0o3hCkWnt0UUVkuV13TndRIwwwR8=
Received: from VE1PR08MB5165.eurprd08.prod.outlook.com (20.179.30.215) by
 VE1PR08MB4990.eurprd08.prod.outlook.com (10.255.158.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Fri, 4 Oct 2019 13:56:08 +0000
Received: from VE1PR08MB5165.eurprd08.prod.outlook.com
 ([fe80::e12f:ddb9:70ae:c193]) by VE1PR08MB5165.eurprd08.prod.outlook.com
 ([fe80::e12f:ddb9:70ae:c193%6]) with mapi id 15.20.2305.023; Fri, 4 Oct 2019
 13:56:07 +0000
From: Supreeth Venkatesh <Supreeth.Venkatesh@arm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Deepak Kodihalli
 <dkodihal@in.ibm.com>
Subject: libpldmresponder comments
Thread-Topic: libpldmresponder comments
Thread-Index: AdV6tnHQJ8ldU6zoQiGMSS4hHWLycg==
Date: Fri, 4 Oct 2019 13:56:07 +0000
Message-ID: <VE1PR08MB51659EF13F43D182785C0B81809E0@VE1PR08MB5165.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: c8525990-0749-49b6-bc1f-43abc5842576.0
x-checkrecipientchecked: true
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Supreeth.Venkatesh@arm.com; 
x-originating-ip: [99.185.131.209]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5deb6fb0-658a-4495-57e3-08d748d29f1f
X-MS-Office365-Filtering-HT: Tenant
X-MS-TrafficTypeDiagnostic: VE1PR08MB4990:|VE1PR08MB4990:|VI1PR08MB3614:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB3614A068F931F0EFDABE9B6A809E0@VI1PR08MB3614.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 018093A9B5
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(199004)(189003)(71200400001)(14454004)(71190400001)(6506007)(55016002)(52536014)(3480700005)(4326008)(86362001)(7116003)(9686003)(25786009)(102836004)(54896002)(6306002)(2906002)(5660300002)(6436002)(99286004)(7696005)(74316002)(8936002)(81166006)(8676002)(33656002)(6116002)(186003)(316002)(81156014)(26005)(66446008)(66556008)(64756008)(486006)(66946007)(66476007)(66066001)(110136005)(7736002)(476003)(2501003)(256004)(478600001)(76116006)(221733001)(790700001)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB4990;
 H:VE1PR08MB5165.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Eh0OX4ctao9+v9QtoN221hR2qL4h4hDJxzKv0h0EwAARn4V7oSnikXWcVlMCuKdXng08pk5YQLmtENfYLOlM+0d46+hky125T6OrX5oSx55pqZittaxppiezcbNk4Yb+AnSNDW2fWB1D3ou695JfDKAxZACaDBbcsv1Ru/efpqtkFzVg3yIG7TGrFIDR+j/9yxYLKGDGV3P0ExL1CPTV/tg766z6ctIbggLrncfj4xvxMftUdAolUJZU2Hcfap57hMRxVXHybzAKjgXU5lEVEjG5IjdUoab6ec2TMOYIkTGUvTu/AoVF6pQltyCP/BCh3p9395MMrV5p3jJY8kt8s+g53tllnCN7uZsdIczcCl36GGywyCeG3t/YuuIdix9rwbbekUwT8emLbYO051BTbcThN0nyTPIv6aeKLtmkEAY=
Content-Type: multipart/alternative;
 boundary="_000_VE1PR08MB51659EF13F43D182785C0B81809E0VE1PR08MB5165eurp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4990
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Supreeth.Venkatesh@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; IPV:CAL; SCL:-1; CTRY:IE;
 EFV:NLI; SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(136003)(39860400002)(346002)(40434004)(189003)(199004)(221733001)(66066001)(14444005)(76130400001)(81156014)(81166006)(478600001)(2501003)(8936002)(70206006)(70586007)(26826003)(74316002)(2906002)(356004)(5660300002)(14454004)(33656002)(5024004)(71190400001)(52536014)(25786009)(63350400001)(7116003)(790700001)(3846002)(6116002)(3480700005)(99286004)(86362001)(7696005)(486006)(6506007)(336012)(126002)(102836004)(26005)(476003)(110136005)(55016002)(7736002)(316002)(9686003)(6306002)(54896002)(16586007)(186003)(22756006)(4326008)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR08MB3614;
 H:64aa7808-outbound-1.mta.getcheckrecipient.com; FPR:; SPF:TempError; LANG:en;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; MX:1; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 39e70bc8-0919-4745-4112-08d748d29b17
X-Forefront-PRVS: 018093A9B5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ORkqyuqBsyWfKbiUfPJwFz2XxcSUNBGxxPxN+bF83U3qi4MdJDS6l9uVi7kVsdrdBmD1kAyOdno170UOMU2wA0vIKB24Nidq7LkV/s0wH97fo2LAS3rTLTADVkZOWqtHqtH3MUXDcuF5RSH9TEc8k4rsfW3PKifJEtxFCeEbYk1bkKqvntoWqcanGCCrVR1D3XTcfvXuNMAsYi06vWuiZg1Anr0ixzEdr+IkxdlgacXMUpFoXab/DTuJLHnqg+3I8X+L6L2AM5PZWw4O306fxA+G/bcfbFaHawx3H6xJ2Wi+fu49/T7pX0oobv2w0GVHVUQeDXkuWJ77J8L8z4TytbH3V58+04NQl/AuAMgqjjJ/89On7Bff2pu3PVggNmJ5I7Dg09Zk6NKPOHQsjpMOX2L4eNf2ckIhSFU6Eg+3LoY=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2019 13:56:14.5407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5deb6fb0-658a-4495-57e3-08d748d29f1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3614
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
Cc: Dong Wei <Dong.Wei@arm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_VE1PR08MB51659EF13F43D182785C0B81809E0VE1PR08MB5165eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Deepak/all,

Sorry for the late comments/feedback.
I was looking at porting libpldmresponder and libpldm to an Arm based platf=
orm.
These are  few observations with the design, some of them were discussed du=
ring OSF OpenBMC Hackathon, summarizing them here:

Assumption was that libpldmresponder can be easily ported to Host/other Sat=
ellite/Service Management controller,
However, in the current design,

  1.  libpldmresponder implements standard Commands/APIs defined by PLDM sp=
ecifications in C++.
  2.  libpldmresponder PDR, BIOS config structures are defined by PLDM spec=
ifications, However, the library uses Json format, thus making JSON parser =
mandatory for

Host/Service management controller firmware.

  1.  libpldmresponder has DBUS/other OpenBMC implementation dependencies, =
thus making portability harder.
  2.  I guess the expectation when we started with the design was that ther=
e will be one **single** library which will handle all pldm requests/respon=
ses and

upper layer application/Daemon will call the APIs provided by PLDM library =
to implement use cases as they fit.

  1.  Libpldm also has dependencies on OpenBMC structures/DBUS objects, mak=
ing it a little harder to port.

Please let me know, how I can help fix some of these, so that it is easily =
portable.

Thanks,
Supreeth

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

--_000_VE1PR08MB51659EF13F43D182785C0B81809E0VE1PR08MB5165eurp_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:56557874;
	mso-list-type:hybrid;
	mso-list-template-ids:-2131691842 67698703 67698713 67698715 67698703 6769=
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
	{mso-list-id:1309895645;
	mso-list-type:hybrid;
	mso-list-template-ids:-222907770 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
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
<p class=3D"MsoNormal">Hello Deepak/all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sorry for the late comments/feedback.<o:p></o:p></p>
<p class=3D"MsoNormal">I was looking at porting libpldmresponder and libpld=
m to an Arm based platform.<o:p></o:p></p>
<p class=3D"MsoNormal">These are &nbsp;few observations with the design, so=
me of them were discussed during OSF OpenBMC Hackathon, summarizing them he=
re:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Assumption was that libpldmresponder can be easily p=
orted to Host/other Satellite/Service Management controller,<o:p></o:p></p>
<p class=3D"MsoNormal">However, in the current design, <o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo2">libpldmresponder implements standard Commands/APIs defined by PLDM sp=
ecifications in C&#43;&#43;.<o:p></o:p></li><li class=3D"MsoListParagraph" =
style=3D"margin-left:0in;mso-list:l1 level1 lfo2">libpldmresponder PDR, BIO=
S config structures are defined by PLDM specifications, However, the librar=
y uses Json format, thus making JSON parser mandatory for
<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph">Host/Service management controller firmware.<=
o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"3" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo2">libpldmresponder has DBUS/other OpenBMC implementation dependencies, =
thus making portability harder.
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso=
-list:l1 level1 lfo2">I guess the expectation when we started with the desi=
gn was that there will be one **single** library which will handle all pldm=
 requests/responses and
<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph">upper layer application/Daemon will call the =
APIs provided by PLDM library to implement use cases as they fit.<o:p></o:p=
></p>
<ol style=3D"margin-top:0in" start=3D"5" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l1 level1 =
lfo2">Libpldm also has dependencies on OpenBMC structures/DBUS objects, mak=
ing it a little harder to port.<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Please let me know, how I can help fix some of these=
, so that it is easily portable.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Supreeth<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose,
 or store or copy the information in any medium. Thank you.
</body>
</html>

--_000_VE1PR08MB51659EF13F43D182785C0B81809E0VE1PR08MB5165eurp_--
