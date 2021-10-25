Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1ED439490
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 13:12:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdC3Z1WCsz2yHL
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 22:12:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=i6SHJy9B;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=4932245081=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=i6SHJy9B; dkim-atps=neutral
X-Greylist: delayed 555 seconds by postgrey-1.36 at boromir;
 Mon, 25 Oct 2021 22:12:16 AEDT
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdC340FG9z2xXV
 for <openbmc@lists.ozlabs.org>; Mon, 25 Oct 2021 22:12:15 +1100 (AEDT)
Received: from pps.filterd (m0211474.ppops.net [127.0.0.1])
 by mx08-002d6701.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19P1RKhC008976
 for <openbmc@lists.ozlabs.org>; Mon, 25 Oct 2021 11:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=dkim;
 bh=zTtr2fgCS24cm+bhjYimhY6MHzeQrfM5YvzWhiRzfLQ=;
 b=i6SHJy9BQYk2gdN5wN+cBGYzofXhlLvVzzuXCTVukDMdYldG/GaXBDOs+fB4Vu38CKup
 rzozQy1f6D+5Am8P+A8gAw7hXX33jUKFHiRIfx/N+nj+3x16bZYHaO8w3CmF6IGeR5dd
 YBTJeEnboW9RXqV4JeSd47qKDa74wu1QCbsPetbxYPduqH6CnKeVX+QV0JKmcpzdYQfz
 txYtErI1c/u8AcbT3MPiu1qfyGUUrEz/xty7wGaVSugOGTeyWbxuusTa+PEM8APdfLjh
 GImK5hWBi22+wdJKm+ygdJHqH2PPgUlgSS5aUovuae3KvyO/slQFey7NIxb/eExxBFqo mQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by mx08-002d6701.pphosted.com with ESMTP id 3bwjx8as23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 25 Oct 2021 11:02:57 +0000
Received: from DS7PR03CA0037.namprd03.prod.outlook.com (2603:10b6:5:3b5::12)
 by BL0PR08MB5284.namprd08.prod.outlook.com (2603:10b6:208:53::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Mon, 25 Oct
 2021 11:02:53 +0000
Received: from DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::8c) by DS7PR03CA0037.outlook.office365.com
 (2603:10b6:5:3b5::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20 via Frontend
 Transport; Mon, 25 Oct 2021 11:02:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.87)
 smtp.mailfrom=flex.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=fail action=oreject
 header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.87 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.87; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.87) by
 DM6NAM11FT045.mail.protection.outlook.com (10.13.173.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Mon, 25 Oct 2021 11:02:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sc1EA0wZ/oENwykThiNkKYrf3VyFJC4lY/iiPPt54KB4etQs9WltlXNiOKl+WgPIue8qS0q0BUh/3DwFTeIlcikkjfiU1MpNtGBpRf26Uf2WTVL99MpSN+llg4sUcEA6at1yK4HP/W5R+NTSFhEkFgTweWoFkUd4a5e+Qy1uquYWhMpb1kb1oESJNzLdpdZixGQNBC2i1OLTq/5vfQsWqLFRLpWiWJBG4AXwYuCsu0SaeNKcXP4w+Zlss9Z/RZ2UnC0bdSyjqfBhbZB8+F8F3SNI4VM9uT8qduohHTjrqVmW7ggpaSqkZuDjEPKY1Kor4Rdo+fAqIKECw533zTXgfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toVatzKlw5yBMMS6v47SqimHPlphz7ukL6R1w8qGlvM=;
 b=HrmiagQFTVJYpNoVQzKugdFsflZR5oGzfMPfOvUVdnGfm3OKDI3zmSWIYXr6ERl8W9dA8mFJdzWbLJljc3DVg2/S2LbQ7FYwciinxkMfCBF+G3cmDoNRegoE1E6W3hPWOhX12Zg6FDG1RKBSdh2zRaeL10OrBS7B064yW/WURgkc0JwgtsjqlmpjGTEPyt1HeBN0HZl5L4f5u07JCW4CO4XxW+a+GrD2G17IqZUPzfNPPcPSR7cnb2C1IpY12rZ+xwBlhKEjqvNbMz0wB+sUpzJp0DenQrptJ9JRDdpNAt5vZRhM+vwDyLgEN4n6SrNHdkQr7wVo8gegAOb9iAfZtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM6PR08MB5513.namprd08.prod.outlook.com (2603:10b6:5:103::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Mon, 25 Oct
 2021 11:02:49 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac%3]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 11:02:49 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [phosphor-sel-logger] How to add a journal entry manually
Thread-Topic: [phosphor-sel-logger] How to add a journal entry manually
Thread-Index: AdfJj9dxnWWV0JDhS1CKjHs8M84D5g==
Date: Mon, 25 Oct 2021 11:02:49 +0000
Message-ID: <DM6PR08MB5514939D6512525765C3EE23DC839@DM6PR08MB5514.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 39d84a15-c4ad-4500-4801-08d997a6fd4a
x-ms-traffictypediagnostic: DM6PR08MB5513:|BL0PR08MB5284:
X-Microsoft-Antispam-PRVS: <BL0PR08MB5284FFE148F6B8074EECD707DC839@BL0PR08MB5284.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: wL0khpSc1PhAIF9fCLdDBvD/t0Xkme/2KVWvaBVm+xzAiY8dCkt5XBrbCYoI/38BHg9U6vGNm6898T34pzPS4nmySf86ml1OpdJCAbc6+2rA92WXfGZPaxCPPdUWw8dwKVEf4Yj+e3Jx1+1qiC7wPWku1k/p0VXQt62GHtbkACHwLusxdoXs0TC3TSusbLwceN8Gnukjy4hX6KsMle8Om08fEc9L40v9T3zBFQxzBFFV6xvuedZnHYpa2EFQIYngQgO1/koSXW0N5Z47H1yLAcoIe/tIofR/V+0yF/T0KYA6/I16aRa32Coz67LSS1pP1zjwZXOJwtR8UJCiun3HbrwBJgRpgTLGYbWmn0tKMSTrYJ/nPlrV/SL7Er7M/jSNQ/NgYl+OKt0dOt8UPlGYBxV6sXcP/5e31lTtY4kDYHcNXAjO8LtBXzU6q1bPuI+HuWEZXxg1NFcmCDrzjAqjelGdq6ahwPrjGILKblYHz1gg8urmpUnNKvKNHrs+Ex4qSFwFs3YrA1socNRRRDmEkHfkdfsJ3HD5Ku1IIUXNL6SZCHwQ6NXSt3nfv0YpuGvXXaK9GbRJeGLwAELcxoUtKpFzlIymBEEEA7CT8BpOVP84/X9fSQt+gHFszdydDZEoh3KSGz1Riv7Cd/xC8N05YGN83FCsoQ4go4vChs/p6eTGokZgq14Wjy1bJEFQdJzi55Yl5WXTgxKIzj7vTSdGO+FGO/YeFofGqz9K1MeMREA4+esN07qUZLKjo/jFYS0muNnwNWOalcjFdl1rQ7mP2gomHlM4Jf/LohFinXWmSPbcOkvg7z3/eoivQQnilbHY
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(71200400001)(8936002)(52536014)(6916009)(166002)(508600001)(86362001)(2906002)(9686003)(21615005)(66556008)(66476007)(66946007)(186003)(5660300002)(316002)(55016002)(26005)(4744005)(8676002)(64756008)(33656002)(83380400001)(122000001)(7696005)(38100700002)(76116006)(966005)(38070700005)(66446008)(6506007)(21314003);
 DIR:OUT; SFP:1102; 
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB5514939D6512525765C3EE23DC839DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB5513
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e22bb1de-0aca-4b0f-d53d-08d997a6fc19
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+FN56L8uqub6PiOPPw8YwHi8WyD4i4KMfJJR4ZM75TXxmncWA806cEq4BTzaHuNWDHc/Q+xmJj/ZqpOtKzruJ+996Z4ztlyR44NxDbsub8vRj7mL+A2bC9g4csugxvDw9fdmKsko0bqFfCitY7hXZS/Ap6/zbRg/PW7vd6VSbEzPkaodNA3BL1T2D+Kh2uOblMXZbAk5LXdGzrzmlkeX6B+kW4dVGB10D4GMHTbawWIsAgB6GhxhcSkwWqLht2+3FJrNoU3Ev1uwtyPba8e1YVh62TQrgYqvqmq/SpeIzwE0R4L5ad6vojgRGsJC9BpuVFELzQQK2zeiojHJ8tZQ1qKERW8PxJeM0tGMVb1xBrEVsue3tWR6MFuEWgGq8XPjgwUZw9i3TVTGqxM65arnJbqByWjQfvBypaiZBoMh+gVN+5AY1MeNZsUU4TH5pGja8gvYYyL263yQwuPzNpf9KLVdR40qgOOiG6HjKiMalGLEMafBqZmW/WIKjbGxYERBTdCmhvjNFqaKS26bXJWpYUaMj+53pDqyj2uiwtLLSMf5xEP90JePZXArPvEICAEF/rO6xzG7cspWJVNHbEBezUbcyz2BpUcQRZG6QgEdPzIJmGoolzvK6tEEhsBMrFgSf+nTN4CoTPWEo5dDbxBhDMwAUZJVBD7piPejQAqiud8GFUlbgQIm5uOWFHtX4x9tofhqMfit/y0hlpDPR0eCwBvLjvx9hzc0HiaHrZk8RBB5ffH6wdXuCwdAg6DT4ca7IxpF1vzRrGnk2rCOpElkNeeGnf+SeBPeBKquXHuIlkKFuGtUC6XHM26NuZF8yQJDsZ8di+9yBjcbb+MVLxTNQ==
X-Forefront-Antispam-Report: CIP:144.49.247.87; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(46966006)(36840700001)(966005)(336012)(82310400003)(9686003)(55016002)(316002)(21615005)(6916009)(81166007)(7696005)(508600001)(186003)(166002)(8676002)(26005)(6506007)(2906002)(356005)(5660300002)(47076005)(33656002)(4186021)(70586007)(70206006)(83380400001)(86362001)(52536014)(36860700001)(8936002)(21314003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 11:02:51.7915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d84a15-c4ad-4500-4801-08d997a6fd4a
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.87];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR08MB5284
X-Proofpoint-GUID: hz-IXRh8J8FPyOKJbn6uce7qxzXklvO1
X-Proofpoint-ORIG-GUID: hz-IXRh8J8FPyOKJbn6uce7qxzXklvO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_04,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1011 phishscore=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110250068
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

--_000_DM6PR08MB5514939D6512525765C3EE23DC839DM6PR08MB5514namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I for now have added rsyslog and phosphor-sel-logger packages to build the =
image, then I could see the xyz.openbmc_project.Logging.IPMI through the bu=
sctl command after the system runs up.

From this link, https://lists.ozlabs.org/pipermail/openbmc/2019-October/018=
640.html, I understand that I should be able to add a journal entry that ha=
s the IPMI SEL MESSAGE_ID: "b370836ccf2f4850ac5bee185b77893a" to test the f=
eature, but I don't know to give the correct parameters to the method call,=
 IpmiSelAdd, as below,

~# busctl call xyz.openbmc_project.Logging.IPMI /xyz/openbmc_project/Loggin=
g/IPMI xyz.openbmc_project.Logging.IPMI IpmiSelAdd xxx

Could someone help me out on this? Thank you.

Regards,
Chris Chen.

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

--_000_DM6PR08MB5514939D6512525765C3EE23DC839DM6PR08MB5514namp_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"PMingLiU",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Hi all,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">I for now have added rsyslog and phosphor-sel-logger pac=
kages to build the image, then I could see the xyz.openbmc_project.Logging.=
IPMI through the busctl command after the system
 runs up.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">From this link,&nbsp;<a href=3D"https://lists.ozlabs.org=
/pipermail/openbmc/2019-October/018640.html">https://lists.ozlabs.org/piper=
mail/openbmc/2019-October/018640.html</a>, I understand
 that I should be able to add a journal entry that has the IPMI SEL MESSAGE=
_ID:&nbsp;&quot;b370836ccf2f4850ac5bee185b77893a&quot; to test the feature,=
 but I don't know to give the correct parameters to the method call,
<span style=3D"background:white">IpmiSelAdd, as below,</span><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">~# busctl call xyz.openbmc_project.Logging.IPMI /xyz/ope=
nbmc_project/Logging/IPMI xyz.openbmc_project.Logging.IPMI IpmiSelAdd xxx<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Could someone help me out on this? Thank you.<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri&quot;,sans-=
serif;color:black">Chris Chen.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
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

--_000_DM6PR08MB5514939D6512525765C3EE23DC839DM6PR08MB5514namp_--
