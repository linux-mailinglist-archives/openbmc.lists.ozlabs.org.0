Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A65823BCBF
	for <lists+openbmc@lfdr.de>; Tue,  4 Aug 2020 16:56:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLdBH6GGczDqZb
	for <lists+openbmc@lfdr.de>; Wed,  5 Aug 2020 00:56:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.114; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=E0iXR64/; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=E0iXR64/; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310114.outbound.protection.outlook.com [40.107.131.114])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLd7Z1fgBzDqYM
 for <openbmc@lists.ozlabs.org>; Wed,  5 Aug 2020 00:54:13 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQA11Ik8uUELHq8wVhSei82Lqo9LQEXKJP9SzlxOTb8=;
 b=E0iXR64/0Q11fPqwI3k3TfASXUO8K6pHlkYdQZWtsamKsvA9+cy2L9zar9llhCIl5CQs+j2nDBKscZDE8lTsMDu8mUWCW570hR9vaa2l0rDiARS9O6IVEOCEuv+d9H32t2Vu1MRES2nOwnWGMTI/P06IAUxjR5ZWJaIuBh3p5Mw=
Received: from SG2PR06CA0094.apcprd06.prod.outlook.com (2603:1096:3:14::20) by
 HK0PR04MB3298.apcprd04.prod.outlook.com (2603:1096:203:80::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.18; Tue, 4 Aug 2020 14:54:08 +0000
Received: from HK2APC01FT014.eop-APC01.prod.protection.outlook.com
 (2603:1096:3:14:cafe::bb) by SG2PR06CA0094.outlook.office365.com
 (2603:1096:3:14::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Tue, 4 Aug 2020 14:54:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=permerror action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.56) by
 HK2APC01FT014.mail.protection.outlook.com (10.152.248.103) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Tue, 4 Aug 2020 14:54:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFwVOqiXNplOhowCxJCvK81PADCs4FKN7fO1qi37HESgp6h3mkYnmLg2lS7KJAMq10pcGQSYQFuh9xW9e9kVhGS0n/HorSPArhR023CfNHvSa/KGZpqOUCzb0HXW7JxIvYk2K/fSqHHKbkyloZ9GrPfYPQHMnhaM9/ZSOJqB3d13GwdzbmS1EChJ+U3A3Vydm56XEcIRPXI7OyjhELtjfHv3fndu4eQjxhRCOW/SvsBaAAq2vWk1eQeXL+8pfgnoZyw8zIYEsCdQP/qmreptFXoFt17JdtQD9Gsua28VraoQXsq44gW9Ed0wOTjSEKeRA5Yto1CV+jrd9BMzsf+Cqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQA11Ik8uUELHq8wVhSei82Lqo9LQEXKJP9SzlxOTb8=;
 b=Hw1CbE0LwVLTCrQx0iJRmCQmYqsVPeXynb5d/IvA3BUR/2T3MhYZxj54cLa3aVj1Tj7dh4Lf0wpDcDJ5UJq0eXy6R8pMUk6a1muCRM2MqKipgpOiIepnHvubg9VajErQ8FPKdKmBezV3uGAI2BrHagv2X4Ep1yfe2cRsExCu+BOuY9B4jVxe8wvKD5mPCU7o9FzcMaSirnUJpUQN0l8eIG++7+UgSA+eft6WOz0OoEefl787HM3eSLXDzc/wmUZw6oSyNnQ+/pGwn4S1+F8mDI+vFOTnijLERybmpbUD866R/oUg/0NUkVQrVotqNU+x6YZ1QFqqU08r1UVBT2qG7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQA11Ik8uUELHq8wVhSei82Lqo9LQEXKJP9SzlxOTb8=;
 b=E0iXR64/0Q11fPqwI3k3TfASXUO8K6pHlkYdQZWtsamKsvA9+cy2L9zar9llhCIl5CQs+j2nDBKscZDE8lTsMDu8mUWCW570hR9vaa2l0rDiARS9O6IVEOCEuv+d9H32t2Vu1MRES2nOwnWGMTI/P06IAUxjR5ZWJaIuBh3p5Mw=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3900.apcprd04.prod.outlook.com (2603:1096:4:a3::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.20; Tue, 4 Aug 2020 14:53:58 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::41e0:35f:a74a:e1cf]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::41e0:35f:a74a:e1cf%7]) with mapi id 15.20.3239.022; Tue, 4 Aug 2020
 14:53:57 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Redfish Mapped Commands
Thread-Topic: Redfish Mapped Commands
Thread-Index: AdZqbpDa9Xh4Aof8S1qw+YL6JLitoA==
Date: Tue, 4 Aug 2020 14:53:57 +0000
Message-ID: <SG2PR04MB30935D495AA522C5C4742004E14A0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYzA4MWJjYTUtOGEzNC00MzMxLWE5YTctM2E4YzgzNzJiZmFiIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6InJGSWdibmdLUEVueFNcL3B5WEsrU3k3eFROUWVqOHdsY3NvUVRMaGxEaTNjRzVYVnlVNWRYVDZRdlV6NlwvY0ZNSCJ9
x-hclclassification: null
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:10a:ba0e:15e:3b2c:c3ff:5c97]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 45aa1ed2-9f18-454c-44e1-08d838863d50
x-ms-traffictypediagnostic: SG2PR04MB3900:|HK0PR04MB3298:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HK0PR04MB3298B670C501D5E16EDEFE9CE14A0@HK0PR04MB3298.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: HUL1lLaLw5JTXib/2gFcHSu6X8NQ1TT0OpYcskHWosxAulhTRdAvp/KzH+729JR3HuX+QUOHxxY9lCPOLsLiTUwn1sUzyHija5E40LJ+px90BQCIR9evyBoLniuRF6QoTjlTJpSQg4KuFvd0XeCd4CvQF3zcLahLzOk7My28i4coB2/8G0am9Un10YAQhdhizpvwFPdtPLIMBCUDv/m1IVdnDDhuQIZ7gwjCqAZgylrrRIqB+eYa4jS0ttZOCIgwtxRylFnBS/1HPemM0ES4XyEI+IVv27GmWkDL0TKT8s9ac8ady9XT5zOfYGg6Qwrn9wbr+LKu0xtNm/aDF51XGg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(76116006)(52536014)(66476007)(66446008)(316002)(33656002)(66556008)(64756008)(71200400001)(6506007)(186003)(86362001)(7696005)(5660300002)(66946007)(9326002)(6916009)(83380400001)(7116003)(8676002)(9686003)(8936002)(478600001)(55016002)(4326008)(2906002)(3480700007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: E/1TDcHo24nFi7El8uXcTMOHZ1vxNqPXT00phrZCz9U1E1jhr9uYVADVNIIsCIIvhTAk7Egizf/D9oJSTxxZzSd3Oo6Vo6yF1Halk80R8eO84GLUpzyZvpUprYR5ZHpF3KNznTwX6Ey905bIWp0rcGQkinYiYsqMGxk7zj50arDh67Iyb013B2K2hRGAbsrEiSP0Q04TGhr7bhaSn3iItq5t1gKbz+DyWSdE+vySsxDyIU0lKgovL0iw110YfXVaQV8OAA25h1Pqb9EgMU2DE4S4sCUvzJHqd3DifQJ0369lBjmI1C8OLdaRI+H3cW56gj3t0UDyNXtNmYDI1j3HcN9v84ypeMbYzqOAydPxEJSSvqziT/MK3p52w+gwcMcTMGKRcEMU0OYihJycXtUKuy6SZpfLy4uQUsMdqEif8oUN37mFLDlhUdxYIovCXyxCRvOw2qWkenlpALd+9XSXnPTCbp+ZxUvWN3rzb/Hoi2TDSOzywwiwkXz2c6b2zOaFMEeIoRkR4on3syDu6Gq/XoPA7ewkTX6qyvuwmPSC+ldUgXNkswNNh8eogt9CxQdSzKQxoFsUBkRqChtB11muUC0s8HVQXR2yMmJBuZRveHdhvm3DD4dehJfhShZNZEoN/r0U/958bgV0JFs8AezhtO2SlLyf9mbBR9UHFa6l80T4aI3uuqHIAossClozFHM0EAdjFbF8eqta1pZN8J9wuw==
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB30935D495AA522C5C4742004E14A0SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3900
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT014.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ce23c0ce-903d-4ca0-2f7a-08d838863773
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DdMUewm3WBa50yam77aMux0sEKl0TSKNCW7Wf+P1pfrAhVTaPSdhzFwHUH1Ol0Q1SrDb8758T0zk8CxWEwqgMeWYwhKsuzPBzTh7E1BER2kQPnC0PpZVaM9NWLpZaDlr3ZTepoFcWl7yar3yox/Bjjb0dkxvFsthkHEXTy8SG3uYmVWwx5MlzgdkzZFr7UUjBUYgFCBH9oEfEmGqeuHX7Ed8kX24t/E71UJwb5UnpBrlrIrmBcbSJkITFUItHL0213yCAdZfCkZ+hXv4QpenMXw4tp5UKhKNce0G3M51jf3q2G2CPcfJUvwvDHJ6pCu2JUif4+N05Qk14sWtdWOSde4o9dJeWBpdOKiKTZHXqr7TLDfMFXYecRu13s+D3tFiNv3sdZVHR1v69VlFmvZUTA==
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966005)(4326008)(6916009)(47076004)(6506007)(26005)(86362001)(55016002)(3480700007)(33656002)(336012)(52536014)(83380400001)(9686003)(82740400003)(82310400002)(2906002)(5660300002)(8676002)(70586007)(7696005)(36906005)(9326002)(186003)(316002)(7116003)(8936002)(81166007)(478600001)(356005)(70206006);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2020 14:54:06.4605 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45aa1ed2-9f18-454c-44e1-08d838863d50
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT014.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3298
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SG2PR04MB30935D495AA522C5C4742004E14A0SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I am about to test redfish commands for the following features.
Can anyone point me the related redfish commands for those features?

1. We are using X86 power control, is there any compatible commands in redf=
ish to test?
2. FRU information.
3. obmc-console-client to connect the host.
4. To set, start and stop the fan speed controller.
5. Host Logger.
6. LED
7. BIOS Upgrade
8. Settings Manager

Thanks,
Regards,
Jayashree
::DISCLAIMER::
________________________________
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or incomplete, or may contain viruses in tran=
smission. The e mail and its contents (with or without referred errors) sha=
ll therefore not attach any liability on the originator or HCL or its affil=
iates. Views or opinions, if any, presented in this email are solely those =
of the author and may not necessarily reflect the views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, distribution and / or publication of this message witho=
ut the prior written consent of authorized representative of HCL is strictl=
y prohibited. If you have received this email in error please delete it and=
 notify the sender immediately. Before opening any email and/or attachments=
, please check them for viruses and other defects.
________________________________

--_000_SG2PR04MB30935D495AA522C5C4742004E14A0SG2PR04MB3093apcp_
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
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am about to test redfish commands for the followin=
g features.<o:p></o:p></p>
<p class=3D"MsoNormal">Can anyone point me the related redfish commands for=
 those features?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1. We are using X86 power control, is there any comp=
atible commands in redfish to test?<o:p></o:p></p>
<p class=3D"MsoNormal">2. FRU information.<o:p></o:p></p>
<p class=3D"MsoNormal">3. obmc-console-client to connect the host.<o:p></o:=
p></p>
<p class=3D"MsoNormal">4. To set, start and stop the fan speed controller.<=
o:p></o:p></p>
<p class=3D"MsoNormal">5. Host Logger.<o:p></o:p></p>
<p class=3D"MsoNormal">6. LED<o:p></o:p></p>
<p class=3D"MsoNormal">7. BIOS Upgrade <o:p></o:p></p>
<p class=3D"MsoNormal">8. Settings Manager<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Jayashree<o:p></o:p></p>
</div>
<font face=3D"Arial" color=3D"Gray" size=3D"1">::DISCLAIMER::<br>
<hr>
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or
 incomplete, or may contain viruses in transmission. The e mail and its con=
tents (with or without referred errors) shall therefore not attach any liab=
ility on the originator or HCL or its affiliates. Views or opinions, if any=
, presented in this email are solely
 those of the author and may not necessarily reflect the views or opinions =
of HCL or its affiliates. Any form of reproduction, dissemination, copying,=
 disclosure, modification, distribution and / or publication of this messag=
e without the prior written consent
 of authorized representative of HCL is strictly prohibited. If you have re=
ceived this email in error please delete it and notify the sender immediate=
ly. Before opening any email and/or attachments, please check them for viru=
ses and other defects.<br>
<hr>
</font>
</body>
</html>

--_000_SG2PR04MB30935D495AA522C5C4742004E14A0SG2PR04MB3093apcp_--
