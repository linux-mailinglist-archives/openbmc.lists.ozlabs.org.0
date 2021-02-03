Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBBF30DD6A
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 16:01:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW4dT4NT8zDwsG
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 02:01:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.99; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=PhilccIn; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=PhilccIn; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310099.outbound.protection.outlook.com [40.107.131.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW4bd0GrdzDqbC
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2021 01:59:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idVlvciqrqtua12BbZnWtZKZpLrjjHZqAf9F6soiCoo=;
 b=PhilccInFxiB7jUTjqycWenxQSWBJlAjGKpbDUsqdZrkn17z0J7cn7tfAjsBye2Chq6FhKhomiXhFGhR0ZOEaFHPN2BHrLbHuzpu281AkTj3nTLvhOR2ZZWr2vTmF60mZyFhm3CnJ5UKYkKbNVvlzP1HOn/89aRCjE/phY2XCco=
Received: from PU1PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:803:15::19) by PS1PR04MB2726.apcprd04.prod.outlook.com
 (2603:1096:803:4c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Wed, 3 Feb
 2021 14:59:25 +0000
Received: from PU1APC01FT112.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:15:cafe::29) by PU1PR01CA0007.outlook.office365.com
 (2603:1096:803:15::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Wed, 3 Feb 2021 14:59:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.51) by
 PU1APC01FT112.mail.protection.outlook.com (10.152.252.234) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 3 Feb 2021 14:59:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fu7K+Yw05zfW3xuHrkt5SNlVPOB1FSM7YtI1dEgWyi9x2byjNo/nZ4DX9uWfYm2t/vK5ISmqDAdL/CTvjanukbRYL2g1D8c5PCp4nlEn9c8mCK8MwIAzQhIVb8R8SlGoGiJneOgCHumHSGk8OTmD2jCDHAWzeMajTQradS17b4tNihqzE+P5XtZA9WvKw8grdrey/bAMDjFjGcUSci2f06W1DeigMMsx2Bal5gpACDefxEafQ/1uTVkKf2rpSZrLkX28au1eGGHw4ZxvBmdY8A89ICnOQytXRjthfwmBlrzQK0oK1/lP4icO3RrD2Y3AKn6NL9u9vz5kC1ZMocyHzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idVlvciqrqtua12BbZnWtZKZpLrjjHZqAf9F6soiCoo=;
 b=mQ8KzGM/OhWEpD20JXbJmJgNOetJhEyRl1KtU4XATs74O3oaxqtdtKLCXYvZLRdaYPl4l0qb92r3w1lU/hHzMVdDPeD4Wk/vHGv8HWxLdH4EEBuVEkqVPnEjGeuv0Jm7B15YHaWgMcvDA1Hj3D1phHkzFUDixDim1Ka5qxmm6sqQ+rAuktULu75ahyXKj4ALOYP05QfhZ9y29aVOgyPMC0j/ezDhyZpR9gc0pXgnYBOm3/UUcAEMRn4yk/h08V6W+VEiGHGxdDO8R80X2s+BGbeUz2Ywv/wCYiacJVBFWvLfWt3jwxuQmk7VQYDQIG+4Csnwfdnsm7aF3X2NmOo9dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idVlvciqrqtua12BbZnWtZKZpLrjjHZqAf9F6soiCoo=;
 b=PhilccInFxiB7jUTjqycWenxQSWBJlAjGKpbDUsqdZrkn17z0J7cn7tfAjsBye2Chq6FhKhomiXhFGhR0ZOEaFHPN2BHrLbHuzpu281AkTj3nTLvhOR2ZZWr2vTmF60mZyFhm3CnJ5UKYkKbNVvlzP1HOn/89aRCjE/phY2XCco=
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com (2603:1096:404:94::9)
 by TY2PR04MB3647.apcprd04.prod.outlook.com (2603:1096:404:fe::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Wed, 3 Feb
 2021 14:59:21 +0000
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::309c:6d51:17e0:2e75]) by TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::309c:6d51:17e0:2e75%3]) with mapi id 15.20.3805.026; Wed, 3 Feb 2021
 14:59:20 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Redfish changes for phosphor-software-manager to support updating
 multiple devices:
Thread-Topic: Redfish changes for phosphor-software-manager to support
 updating multiple devices:
Thread-Index: AQHW+j0hRh4cAZXCiEmTCEQBxQdiqw==
Date: Wed, 3 Feb 2021 14:59:20 +0000
Message-ID: <TY2PR04MB331184AB8538CD4D68AF5F5FCAB49@TY2PR04MB3311.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [117.248.23.189]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 3b9a0482-c71c-48b0-a006-08d8c8544bec
x-ms-traffictypediagnostic: TY2PR04MB3647:|PS1PR04MB2726:
X-Microsoft-Antispam-PRVS: <PS1PR04MB2726B90C7911F383CDC461FECAB49@PS1PR04MB2726.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: XoLW0w5+C6vvWkZtVWTGHkYKw4VFoJElfenjpBBpBn0Z0W1ssxH+J2Zbw8FNdvbBV+8zguhmFL4ztw4Bb1mWVK6jBF1irjQPiKhxtQXPZuR4RkWZXynvjpr8yCnJZHDelpGwH9Dj73h05edYyn+9grrmhaNu+k6h1x783cGMgpb5CeiT37U/snDZ31j7DkSUdmVOzKKhkh3jtd3t7jvHiEDATFcXAo3QxChdeRWwENsaVGLjI+jMHoAs/o8LmEplyteYd8FKgDVWkoWCRN1VdeqdStko4u+LOrVRmVidAHD+OzVD7V1YNv4cEfWKQlAL986Z7Pndgm8A+ra82cVj3RGIQSFp0EfBa/GTh7TETomyO2WSpRDzCf/mQKjqHrsICneK0AD11vi9OCpsZ67GhaQP86tfykexZReHqmGw5ZNEtiQJfeh8frnye+zSINgfXILao/UvH6xNTY1PwiPaG5rMJmWhndYfDBjI8QEyevXwcLKHCJ9dm/lWEoZA3zM5KLw+ZlfwdKVAaJ3k+aT90w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3311.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(7696005)(8676002)(6916009)(71200400001)(316002)(66946007)(26005)(6506007)(55016002)(478600001)(66476007)(66446008)(66556008)(91956017)(2906002)(19627405001)(8936002)(83380400001)(76116006)(86362001)(5660300002)(186003)(52536014)(9686003)(33656002)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?iv8Ps7DJ1NdzPoKAYuq5vG8LzqiGykyQDIU++u09YI8KDMwjV0avz5I7Lu?=
 =?iso-8859-1?Q?ihj2Tqp/EeV/g++Fvyreq+Ij7PvMSEPM+vB2sOVe9Nqf6F5mqfAtYdPszu?=
 =?iso-8859-1?Q?Dggi/x+NbJgQC3ppxM0GwfXLV+8BH1PRZHMwPVmjZbamRFHUi2yPMpr/rK?=
 =?iso-8859-1?Q?hTdASRrxQHoqWY67mya21DH4byfX5xryMDjAx4/5lqKlm7ODd4YHGZwGET?=
 =?iso-8859-1?Q?8/YcxIQJbYfopmMx9LvEABLQtpeC0dCEApQStWVREnUCsvYXYK/fg8/DX+?=
 =?iso-8859-1?Q?zYWMVyd1iJLVaiKJafUx/MXPxnWGfeKzTte9W8xghHFjv//QUHfAMq0Mzd?=
 =?iso-8859-1?Q?cvaRmxurEPVnMWC5xk2g+/srMFCoLqCBkAZeQ/+caHB1H+HkkMe2Ui5DZo?=
 =?iso-8859-1?Q?OqEvrzpDtQdD+qbEpfDrgVkGn/tobyoRMEdHKEp6nocEzxfL45K1+MnfJc?=
 =?iso-8859-1?Q?xwEKIw7Z8oZEmkatdE4hGHEvmubSNcFo/EIvGMAPMzoIEqlR32koqbczr9?=
 =?iso-8859-1?Q?djE+GP0IahL7wbZd7r78lfSTLWchzXDqSC+L11PPB3Z4MNqLe9ZFRnFQId?=
 =?iso-8859-1?Q?OMf7CkyuBoSerSX7dFmtpj1H566kq4PAQ3126hfQvT7qao149a9C3Yu98h?=
 =?iso-8859-1?Q?rj0dM9R3FYG2KIApwx8mRFDdEvHGvADaMAfs2jH9wOtTZvnVCynSb+lBVg?=
 =?iso-8859-1?Q?vFQuWCnFpL5wahYjFEelokorbSBM1L8TkOBQ65/A2NUD1FMASoLRiXC7mn?=
 =?iso-8859-1?Q?fL5/QXcg2Rn6ELW3KWOn0SrCK8Ob7jJUCJ5YNXsqaYCmDLu9GF0eO3m8FG?=
 =?iso-8859-1?Q?t3Lm2ArpggKB/W5LlE1MAeR4XMHqgtU3OipmfwwEI6sPeFNmVE3n+ci/yC?=
 =?iso-8859-1?Q?++vElyjUWs0CnNkz14wHvg6JoR12X+NAvc3lHTD3cHhgxzPnaVHP64DV5+?=
 =?iso-8859-1?Q?7e63Ksf383GUZTppYcIEFLNh8+XCKTmOvfSzN4+1dZ1FPsAprzSazciZ+W?=
 =?iso-8859-1?Q?E5Dpf0hddwvBvqJNPhqoAJwMik6qBk2n+UcFbR03sPGoJcYQjFGJeVc8I1?=
 =?iso-8859-1?Q?hJfvmZnOSNkuVgc2cvv02Og2SeddHL2x8rM09Znr8jfT?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB331184AB8538CD4D68AF5F5FCAB49TY2PR04MB3311apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3647
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT112.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: dd9ed47b-8829-4685-2b8c-08d8c854498c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8xGOj71LZBdIiMfOVzcHtADzRz3J2IbJTbcl+8RgymS+KArMYh+Zhn5ECGqnD7QTpfdwEBfEQGtcBYeJuAymUPTZS1Vyrngu1jDjHfA+yCNDAoga8vcktXjlXa0AGlwjS3h2HLPmHVk3NRPFfFYYmutv/LfCV0OAzFcHhOJv05bXWfNuz132qjB1xf8mz9jaePsX1I9XxqyuCgvOSTPEX55v5yufjvbKEaPDWx1k6YvCj3ZdL+FEcKXbrFMVa6Fzh8ys5FWUM3d8zAVdzdS6AdCD73WNzey2IUaDFopfaj0jUFmdr4SmQHZrjsqKzzPf930143uP+uwftgcW/bVvGqL46Up1PjzvjCr5dKEJaT5ySyqBEkY3YBFr01e3QC1lDbcyQq9DEl1FBb45oiIPYunmA8Rnjp+PAY86qsOtxlW7SKi0DIAXmmPuA7GQJkE0FRzm6pqTmFcWfgf6v3s+kaSqCi1vV9GNjNxSgJ+nL6sKOi+cPAnK3FcjRH72G2MfDfoeW6wNQqXUlTFCkd1Dvxv14KqwArc+FLTsanvlCi/FVLIhgZ1/tCwIcIwE82sorFON2UPOqAo5J3dd+jqxt4T5WptpdgATSQtxlwqUHc/e5p9Hn+M8EVn/5xdjcHH9JRpiBRDTB9uGSCGICerE/2KuRUhyYe1LhhoyTeptreccX3KD9tcTjuOR3aCzTr4h
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(36840700001)(46966006)(9686003)(6916009)(6506007)(82740400003)(8676002)(70206006)(82310400003)(81166007)(86362001)(2906002)(186003)(19627405001)(83380400001)(7696005)(5660300002)(8936002)(36860700001)(52536014)(336012)(478600001)(47076005)(55016002)(33656002)(316002)(26005)(36906005)(356005)(70586007)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 14:59:24.1105 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9a0482-c71c-48b0-a006-08d8c8544bec
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT112.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR04MB2726
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

--_000_TY2PR04MB331184AB8538CD4D68AF5F5FCAB49TY2PR04MB3311apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi All,

The current implementation in the phosphor-bmc-code-mgmt supports firmware =
update for single device and currently we are working on a design to provid=
e the support for anytime activation of a software update which could be ap=
plicable for multiple devices.

The current redfish implementation for phosphor-software-manager also suppo=
rt firmware update of single device only. What are all the redfish changes =
might be required to use  phosphor-software-manager for multiple devices fi=
rmware update or do we have proposed design available for this. Kindly guid=
e me on this.

Thanks,
Priyatharshan P
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

--_000_TY2PR04MB331184AB8538CD4D68AF5F5FCAB49TY2PR04MB3311apcp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi All,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
The current implementation in the phosphor-bmc-code-mgmt supports firmware =
update for single device and currently we are working on a design to provid=
e the support for anytime activation of a software update which could be ap=
plicable for multiple devices.
<div><br>
</div>
The current redfish implementation for phosphor-software-manager also suppo=
rt firmware update of single device only. What are all the redfish changes =
might be required to use &nbsp;phosphor-software-manager for multiple devic=
es firmware update or do we have proposed
 design available for this. Kindly guide me on this.<br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
Priyatharshan P</div>
</div>
</div>
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

--_000_TY2PR04MB331184AB8538CD4D68AF5F5FCAB49TY2PR04MB3311apcp_--
