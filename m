Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AFE2BC177
	for <lists+openbmc@lfdr.de>; Sat, 21 Nov 2020 19:36:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CdhvZ5P83zDqpK
	for <lists+openbmc@lfdr.de>; Sun, 22 Nov 2020 05:36:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.123; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=T9g5EnPS; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=T9g5EnPS; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320123.outbound.protection.outlook.com [40.107.132.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CdhtK3CMbzDqml
 for <openbmc@lists.ozlabs.org>; Sun, 22 Nov 2020 05:35:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=El43hNjY3ecbOCAiYb16gRBLwb7KsIJ5c1LTy1HhBoM=;
 b=T9g5EnPSlw9tOrejErjktWA/rETwQ/C2hDP6T0/StDySB0rbraHoYynhCLVH9aZhkYIcq/DMfi+p1IC/PCKsW+Fjs9fkUS6ZAmoo2yAFwdhG1M+GRZNurAj444NN0IucbNlA7hNlVUJtI0/BW2eOLlbTYqePuX3tMuSwDwQl7jo=
Received: from SG2PR02CA0097.apcprd02.prod.outlook.com (2603:1096:4:92::13) by
 HK2PR04MB3827.apcprd04.prod.outlook.com (2603:1096:202:2f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.22; Sat, 21 Nov 2020 18:35:01 +0000
Received: from SG2APC01FT026.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:92:cafe::1c) by SG2PR02CA0097.outlook.office365.com
 (2603:1096:4:92::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Sat, 21 Nov 2020 18:35:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.53)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.53; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.53) by
 SG2APC01FT026.mail.protection.outlook.com (10.152.250.190) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Sat, 21 Nov 2020 18:34:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIg53IO6aqyTBZukXrZKZkr6xbAkYLfi3fBQcBp47lnf0FTRnVNluTl4WNaYvUwSP8fjFnOtoul1PuDj+mhK1zjVZYNydnSueQrFa0yp1oT3eAQRw9atkAa/m3NjLj6HtpQADEt2vhnLP6Wkstbo9lTBVyNtjjMIrOJU3xvXyo/HTYeZPpz2ETDzLr6ZbUiEiVtNVAeqX4Z/68dRUjpxk0YQwxxZwbHZEel0yHpoim1FXcPJfSPF9JqzJYN7vAMEO9m1s+EPQHCncrDmixq8tvIVno/LlUd8M4ySjH2+ipXrpE1NAagmEuMAYbYqiFXkeoUwHbxwE/oeF1SPzFbA/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=El43hNjY3ecbOCAiYb16gRBLwb7KsIJ5c1LTy1HhBoM=;
 b=mPHmLtqKDcyzoVaP2mTa8Q7D3GdybTcNhgXDejCDcIuTYkkPiUK7aIxi5HHKI7X2m0hEXeb8YgLuDLozCEb0oeIoe29fPKQK2KXv+qCYGE1BSilc9FTxYOPll1JcPzHGg6XFU0g4K6hgKoLOcZpev7TpCuqQJejVSzUwZi6aV32rpqWPOY44czAZPF3gJYGnjBic8QdK2xQacoaQ3fXPAiS/9fJyN/pilkXPAzEMW6lMHB8oHRiQ20fCqsv7fR3oyetq80CIJLozFfwDim87o8zs70hfJm036WifbEm4VlDiH4oE0DO5RWFei6LtxjM/Wbv/lMIHQvhW8NtHl3pqoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=El43hNjY3ecbOCAiYb16gRBLwb7KsIJ5c1LTy1HhBoM=;
 b=T9g5EnPSlw9tOrejErjktWA/rETwQ/C2hDP6T0/StDySB0rbraHoYynhCLVH9aZhkYIcq/DMfi+p1IC/PCKsW+Fjs9fkUS6ZAmoo2yAFwdhG1M+GRZNurAj444NN0IucbNlA7hNlVUJtI0/BW2eOLlbTYqePuX3tMuSwDwQl7jo=
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB3269.apcprd04.prod.outlook.com (2603:1096:4:75::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.24; Sat, 21 Nov 2020 18:34:55 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::600b:f294:3dde:ba29]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::600b:f294:3dde:ba29%4]) with mapi id 15.20.3589.024; Sat, 21 Nov 2020
 18:34:55 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Boot Order in Redfish and DBUS
Thread-Topic: Boot Order in Redfish and DBUS
Thread-Index: Ada/GHipV90cO13xRsGWrbeHoNjQ3gBDwNbg
Date: Sat, 21 Nov 2020 18:34:54 +0000
Message-ID: <SG2PR04MB30934A3A567C8025C3F72F4FE1FE0@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB309381BFAE06A3462E57E0C6E1FF0@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB309381BFAE06A3462E57E0C6E1FF0@SG2PR04MB3093.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYjU2MmE0NDItNTI5Zi00ZTI1LWIyMGEtMTcxNGY5NDkzMGI0IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiR01GT0lURFwvSkxXT3FFRlluUGtMY1FEWDVDZmpjSVZvR05sQWFlbGhDVTVadEFBUnNGbnRWSEZTcDdSOUZORGMifQ==
x-hclclassification: HCL_Cla5s_1nt3rnal
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:111:c53c:61e4:c303:1533:b4d9]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: bfe141b0-7a70-4787-3592-08d88e4c2744
x-ms-traffictypediagnostic: SG2PR04MB3269:|HK2PR04MB3827:
X-Microsoft-Antispam-PRVS: <HK2PR04MB38275A310172E4023FD2CB4DE1FE0@HK2PR04MB3827.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 5SVbOKSP+KtjlRG5oHeYIsRo2DcvDpA8FkLyUAX/y3LfxxSGVu6Mb+pE3Sez/tj9Xx9n5gtDe+qCPkD+rL6dIoAfdKslA65VtcwbYbeCdROj1TekzKiZTbJWaYKCgMoQJNzrobqKRg9TjUCG4nwyb27vPN5mj/tHZnF2a6JMF9ZVn7M1T2KLo2YyxAZo1kqxBN6ekrt28Grq+JGbbAqHVtbpDS0Zs8c2HAfFBfMXusPqfSfXU/x+FegK5Wqn59kp8egJjJVRlaTfzzctxo4S1IUDczugaYM7u6YKtQo8nE5jTBrDXNV7qpMAMe1x46bKmKX0OmxgtAcfYE1fwsaROg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(83380400001)(55016002)(186003)(8676002)(2906002)(8936002)(316002)(478600001)(33656002)(76116006)(5660300002)(66476007)(66946007)(52536014)(66556008)(64756008)(9686003)(6916009)(6506007)(53546011)(86362001)(66446008)(71200400001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?9B/rnNk+YszgQBGC16X+oex8OdsQsWysy6MDgV8d+sFbhWlI9vb5l2W3cX4f?=
 =?us-ascii?Q?Zik0fgOFVsaPqsc5Y8Tuc2qo0f/R7V0AvmroVq3Vcme6SWcXvFcNS0spyN01?=
 =?us-ascii?Q?QfY9PtuLTG27gnNsDgVgcbzBbsGNFAts2OeX6BXf1/vWEOCrcHbAXEnmNgHx?=
 =?us-ascii?Q?PsMNsmReyrCcTJf7ngvXRc76DhGnW77khQin66AFZkYxTAMhTOxVTkUi2NZK?=
 =?us-ascii?Q?o+NHgjcbaszFrqsa37HRA03lakeY1eAQUdkfknye7to/oMxSU0a3Jndhrbmh?=
 =?us-ascii?Q?FZDNcGuuzTo7bfIP3pj09xrkHCfIy7285dmeCRXiyf1bl2ReqNhscDbgQhZw?=
 =?us-ascii?Q?H0earTn7tfJPorM/6Wd4HHZiuv4hqkUfiVvUqt6cWX8f/NRYJKDSWbgclV8Y?=
 =?us-ascii?Q?rr1BEv+oSI7Aa0YKX3Vv/x4RStFNfjWp0UB2zReZGF4rOVFGk1gh38ZZdRLe?=
 =?us-ascii?Q?J/Gbvn/F50rNj0PUKm89v6an6Qy9jaK0k9QyChypRc7Z91L/NHTXM3jfiWzn?=
 =?us-ascii?Q?c/PrnLmvjFuJgOCtrYpTGFNxMdOfcwxvu/1+FPecWVWPaftiB/Z1qVP/I/vc?=
 =?us-ascii?Q?d921NFDbqAAtI1oZDsZssTBOtTF4Rt6SEJE0yhaUp6zpbtxTAW3YJj2zEEvr?=
 =?us-ascii?Q?9fjzBAft2u5+K3/mUiQ+lqjt2Wn/2sLyA07txn6O6/jxsGNSxgGvlalIqT/a?=
 =?us-ascii?Q?ibr/a8XBGfunk2rlZsm3tiRHl33UAFzdAXun3wTbJDp4USn4wscx1SpZ5cRX?=
 =?us-ascii?Q?RjnJOl0OSJaiuJp2/yXwzTYFPUMOUzNdYrb3M6QG2qe3HNc4xgxNNKlkKkbx?=
 =?us-ascii?Q?YoGCCtvpJQVjIP6Cr6/L9i+9vmZuPAtKE1UjtXqq1pkOjIkZXqNRQyAKsE3D?=
 =?us-ascii?Q?7GQtxY5yJdw6Z9Rbq4S1uyOOecHjzuqFI7SAHv0HkOaF1WFzJA5Tm1sHEA7Z?=
 =?us-ascii?Q?U6KUwrUwfbV3tDO+8wwC/g=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SG2PR04MB30934A3A567C8025C3F72F4FE1FE0SG2PR04MB3093apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3269
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT026.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: b9a690b1-6ac8-4af5-6c5f-08d88e4c244b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3PlKUn3RE7iIrS9AZIcE3BNLBaZ+7REeebQPUaqZovq/XqQWYmF00d/DPiCnJ4C1X0PX1LnlVa7iFI3GduGze5Ft1llC2d6iZjB2XP+nHeuJW/2pytST4sdI0AUjpGvCpQRB/Csuld106Lw6tCNFcOUDcOHmmqhfaniL/Vo0qxrGbHTViOna5V28nK2o0xL2VqI9CpZ5zSSu3EDyalHyYcJOGhSpvrv00PyOGlmhShLivqTvREFigFzsODvocv7h2VqZLBwz2UXIG7YbVpIvQdXOjU6Y+bpWgd4txyvp9EDQF2jaBshgWbhuJtJ1Pp/cVUaJb3rL3Mk48R2/bf2adVVMcgASI7GicM2XAPtmq3aiqun6XKZF05t9AenIHadqh2s1xvrxdNvB58ad7nzGag==
X-Forefront-Antispam-Report: CIP:192.8.245.53; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966005)(7696005)(5660300002)(33656002)(47076004)(83380400001)(81166007)(82740400003)(52536014)(70586007)(356005)(336012)(316002)(36906005)(70206006)(86362001)(26005)(186003)(9686003)(53546011)(6506007)(55016002)(6916009)(478600001)(2906002)(8676002)(82310400003)(8936002);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 18:34:59.5517 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe141b0-7a70-4787-3592-08d88e4c2744
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.53];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT026.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3827
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

--_000_SG2PR04MB30934A3A567C8025C3F72F4FE1FE0SG2PR04MB3093apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Internal
Hi Team,

I am working on BIOS boot order in my environment, to get and set the boot =
order sequence.
How the boot order settings is handled using dbus interfaces and also in re=
dfish ?
Please provide your inputs/suggestions on this.

Thanks,
Jayashree


From: Jayashree D
Sent: Friday, November 20, 2020 2:09 PM
To: openbmc@lists.ozlabs.org
Subject: Boot Order in Redfish and DBUS

Classification: Internal
Hi Team,

I am working on BIOS boot order in my environment, to get and set the boot =
order sequence.
How the boot order settings is handled using dbus interfaces and also in re=
dfish ?
Please provide your inputs/suggestions on this.

Thanks,
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

--_000_SG2PR04MB30934A3A567C8025C3F72F4FE1FE0SG2PR04MB3093apcp_
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#1F497D;}
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#08298A">Internal</span></b><span style=3D"font-size:12.=
0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am working on BIOS boot order in my environment, t=
o get and set the boot order sequence.<o:p></o:p></p>
<p class=3D"MsoNormal">How the boot order settings is handled using dbus in=
terfaces and also in redfish ?<o:p></o:p></p>
<p class=3D"MsoNormal">Please provide your inputs/suggestions on this.<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Jayashree<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><a name=3D"_____replyseparator"></a><b>From:</b> Jay=
ashree D <br>
<b>Sent:</b> Friday, November 20, 2020 2:09 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> Boot Order in Redfish and DBUS<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#08298A">Internal</span></b><span style=3D"font-size:12.=
0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi Team,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am working on BIOS boot order in my environment, t=
o get and set the boot order sequence.<o:p></o:p></p>
<p class=3D"MsoNormal">How the boot order settings is handled using dbus in=
terfaces and also in redfish ?<o:p></o:p></p>
<p class=3D"MsoNormal">Please provide your inputs/suggestions on this.<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Jayashree<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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

--_000_SG2PR04MB30934A3A567C8025C3F72F4FE1FE0SG2PR04MB3093apcp_--
