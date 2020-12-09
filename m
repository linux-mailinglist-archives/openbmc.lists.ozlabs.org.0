Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB0B2D45CC
	for <lists+openbmc@lfdr.de>; Wed,  9 Dec 2020 16:51:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrhNr4K5TzDqbx
	for <lists+openbmc@lfdr.de>; Thu, 10 Dec 2020 02:51:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.103; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=WFxPxSva; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=WFxPxSva; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310103.outbound.protection.outlook.com [40.107.131.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrhMb5sZJzDqWQ
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2020 02:50:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxWzn2toFjFnIxUS1EOjSvU+Ydwpt7MU9JwExUniVpY=;
 b=WFxPxSvaHm4kn+8MUftcaWmWVdUcek0j8LwKztU+zdovKZb859HdyMhJosSy3TF87GB3zdmKyxdBV6nZ+Qa9iW8gdk1M4FBH+t1nU0VH91taTIC3hwnWrdXGM9P0Pn2M2sWklJ9sjRkr3F9/U8FtUqFeVrTLts/9TAH7dz0ZkaY=
Received: from HK2PR06CA0023.apcprd06.prod.outlook.com (2603:1096:202:2e::35)
 by HK2PR0401MB2068.apcprd04.prod.outlook.com (2603:1096:202:5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Wed, 9 Dec
 2020 15:50:12 +0000
Received: from HK2APC01FT031.eop-APC01.prod.protection.outlook.com
 (2603:1096:202:2e:cafe::d7) by HK2PR06CA0023.outlook.office365.com
 (2603:1096:202:2e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 9 Dec 2020 15:50:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.54)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.54; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.54) by
 HK2APC01FT031.mail.protection.outlook.com (10.152.248.189) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 9 Dec 2020 15:50:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATtA4ZqxIHAfd5dULnTRlqe8tDvEqBjsntSsxHZGMDbCj95xB8FqjlyOpgypQfcK2d2gBsMkTxRt8id/eX3iVMw2T5RcF4N4yihZh2+NgFmkMt8epnwKm8yX7g4cqlC1GqVls5cVKeb3sv2GCFY7JH6kbdQPoqmaMVxhmrKMWm909pi1/KVcB4DDM7B1cprYpE9cGnwbaGASj8VzzYwIQVRbwRDcVTkx/CAa9x37YVk5wEaDtwL4jolhuNxZOFFwXVoAoXm+/y4HI90as3djUY1pAXDx/dNWjHutqxqYLZRjyBTx8sGujdTAR1tBi/TvLLICXMajse5s3pszhHDE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxWzn2toFjFnIxUS1EOjSvU+Ydwpt7MU9JwExUniVpY=;
 b=gouhUg/L5dpazMjrq9yC/lldYHuRzditOHkoRHKU5rB87ogkkRenkniCqkerWv99YXCQ0wVgbUhMoW3431xVCqhRUPiN6Lwo+oJ4y309Ebad6r/Gel3DMAk3ubjKbRhdflwxp6GOkdmeeUJ/N9i81aEOD9cCJ0BtHYGSgew0jWatCOcVNrwJImn8hVI7EBZKhTHsJgeZwkpNeU7aDecheFQKeOu4uxPechO5okMtFqOB6f/M4eFNJdVD/1Pk5Ua3fANfVL8xlUWxxq/dM12LFBfFtoA5r9MT3pUTrFi+naRDeawV5KxQVMjRkrT2pGOSv4H06J9JYxUuJ7J2vgynig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxWzn2toFjFnIxUS1EOjSvU+Ydwpt7MU9JwExUniVpY=;
 b=WFxPxSvaHm4kn+8MUftcaWmWVdUcek0j8LwKztU+zdovKZb859HdyMhJosSy3TF87GB3zdmKyxdBV6nZ+Qa9iW8gdk1M4FBH+t1nU0VH91taTIC3hwnWrdXGM9P0Pn2M2sWklJ9sjRkr3F9/U8FtUqFeVrTLts/9TAH7dz0ZkaY=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK0PR04MB2627.apcprd04.prod.outlook.com (2603:1096:203:65::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Wed, 9 Dec
 2020 15:50:08 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::1199:48c0:a788:18ec]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::1199:48c0:a788:18ec%5]) with mapi id 15.20.3632.021; Wed, 9 Dec 2020
 15:50:07 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Add firmware implementation in pldm 
Thread-Topic: Add firmware implementation in pldm 
Thread-Index: AdbOPE3oPF0lIoFJQfKCQ2E6Pk/MoQ==
Date: Wed, 9 Dec 2020 15:50:07 +0000
Message-ID: <HK0PR04MB2964D0B4027D7B3AE80A3E9EFDCC0@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_1nt3rnal
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiYjE3N2I2ZDgtMWE1OS00YzhkLTk0ZDEtZDNmNThlOTg0YzMxIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiU1dNc29Rc0hPNllyOE53bFVXVW9ueUhqMVJpMnRYb3ZCbE8xUG9ydjVCXC8zZGZWbUk1TXZcL3FPT3VENXNlckVpIn0=
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [157.51.29.184]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f60ed593-9a95-461b-0ff2-08d89c5a1c5a
x-ms-traffictypediagnostic: HK0PR04MB2627:|HK2PR0401MB2068:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <HK2PR0401MB20687A46A6AFCB004FDAC779FDCC0@HK2PR0401MB2068.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: FR9bxoscjPfDNeFrAaDopI5YaIF7ZJ5md1du/Tv0L41xoS4lpjQsOd7yti16Knb4nrWxFy83HcIXUD1yXBrH2dGHvZXTmmUzZ7FwQEpINcc/HUgFi82tYHFxfXqkxKKUVnIbA7JE3Vzmn0TIZdGFtv/kb6j0oZVmaMNKnA+1kGJmyU4Ca7lKxJx/cQDYaMlXNhAtGR7lkFoFIBo2G92VNDoNwyTBH82au4nqd/KAkyuAMj/FCOqlLjq1PfxzF1ELnsvsZ7uPg+KWtkyQS6mXo8KX0c3Wvce4t5Kc2oGwrS/utWIrJljGfke0O+F4FZrMYjsY5H51KtTTp8mM0IKn4Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(366004)(33656002)(186003)(66556008)(71200400001)(4743002)(8676002)(8936002)(54906003)(76116006)(66946007)(52536014)(83380400001)(64756008)(55016002)(2906002)(86362001)(5660300002)(26005)(6506007)(66446008)(7696005)(66476007)(508600001)(9686003)(6916009)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?FyO6k7ek8xaxARN+QxpipFt4WKXzl9iRhdTEEOFHSzly0TN6h6vQlmtvjgf5?=
 =?us-ascii?Q?/zC/ctG2Z+gc85ezbJh/EJ3RqSbA6xVKpmF1MUA05dTG8yjgtGju6Fanjywu?=
 =?us-ascii?Q?/q02q563SmD3JahFU5fVW5g3agJYoUeWqdaTfDCWYOuBeHGXetUivMLF67Fv?=
 =?us-ascii?Q?1dd4XRegsyb2xjtyV/hrD6MmVX94ErYya0akz+6Q/xgaJ/kAatltyxeS8+7Y?=
 =?us-ascii?Q?Xu2hSGneVJdUhbztBZ5VzWksuGhwQ+RTTnHhpQl1WmucChG9Rigg72O887j2?=
 =?us-ascii?Q?dnLqiZYo8W8zsQjcAkv226qFIHjY/SeOfIwmyRkPTiU5rIQyTbHabsw9iicf?=
 =?us-ascii?Q?TmhWEn45bEmHNvN8aP5+QXJnTXjBwLO1NwJB734SeSGCMbOQWM5yxMbnu+Ts?=
 =?us-ascii?Q?a8YoRIlVZcMdUaHGJIeJfnuyyPEEjpuoWdMdK9+sdveAVxrckqwcgW62pL3f?=
 =?us-ascii?Q?rubd8+EAYfVx301oxxu1LCnpozS6qbD3WynB2SRo6y05kNH+qen5egq91gLa?=
 =?us-ascii?Q?HlH1/AxydjTM3fYoVJPrkFc4HhLISS279cnIYcMe9Eq01z+G6M5Zs2MJwQ1I?=
 =?us-ascii?Q?jFX0yJqhjzjGcQY8MwvruF5CoVJSPjK88ast5knNzDD16DNbiv+5ts7hwtE5?=
 =?us-ascii?Q?jpbomQTgzARh/7jS4TzEUbfLmNS8Mh6RO4qqIPWcjmxBbdR+AGzRqZWlOuNg?=
 =?us-ascii?Q?jRc4o1J3Y58VHxB8s1NUlnRW0hlRpk+yzoTIj9Kc+5tMdkn6BnTHuV9/69J4?=
 =?us-ascii?Q?jtTlf2XvQPF1IBS87ArREr2H3K0MPiax28vPw5MbJbBnDqFz0P9ZY9hmo/8Y?=
 =?us-ascii?Q?/wmeoiA6XDwo06cV8w1yZvAvxanjlwxQSekR9ly27CbeG5QwLsyZ1fYrEAgr?=
 =?us-ascii?Q?phWcBWaP4BbDkT3B9ldgQRDJp+IeNqnWzLt1W0gfsOK7N270WQUnDfNyiymN?=
 =?us-ascii?Q?xx0+h6b38cgeIp4VHs7xYkIyeCWiqM3jhJ+ferdQuBk=3D?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB2964D0B4027D7B3AE80A3E9EFDCC0HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2627
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT031.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5b412cc9-d4d6-475f-9936-08d89c5a1a87
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tStQ3W8D9/5sJ1ugn9jMrc/4CNP7bUKwbkk7OF5mjtLbX4RJGRfuJLqrBys4I3W9FLC8xT7NOow6Gl+04JCC7DOd+bgcjnujQF6BW7P3H6qnirAkgXychaasiSzGdm3GZcBSfKT9/72SuL/aesK2MnGgZs66Wky5asfefnxqrD72l/HeHPlovY761MK8blDwtPPzyzzSg0yl+kU3cZDlISyt8wdriKJGRR5u7lMnLtVe9y9QQVXvWdSd7dAZ+NDgHfAU0TGsM+P3MD9KHd0L9MLTmDbqhQ7aNuIp6jAnXLiuVt5RT4doHuxKyksXUtYcXOX3mKzz5uU7N0g3UM4juDVkrcfsvjamp3tlWiqGIDSFkmthyCbVuINQyxjTMnkxjRY/Nfp50Mpn450ih/uZYQ==
X-Forefront-Antispam-Report: CIP:192.8.245.54; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(46966005)(36906005)(70206006)(9686003)(82310400003)(70586007)(54906003)(6916009)(5660300002)(4743002)(33656002)(86362001)(508600001)(4326008)(52536014)(8936002)(7696005)(26005)(83380400001)(336012)(6506007)(55016002)(8676002)(81166007)(2906002)(186003)(47076004)(356005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2020 15:50:10.4471 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f60ed593-9a95-461b-0ff2-08d89c5a1c5a
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.54];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT031.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0401MB2068
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
Cc: "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Patrick Williams <patrickw3@fb.com>,
 "deepak.kodihalli.83@gmail.com" <deepak.kodihalli.83@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB2964D0B4027D7B3AE80A3E9EFDCC0HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Internal
Hi All,

         We planning to do NIC firmware update for our system pldm base.

         So, We would like to add implementation support for pldm base firm=
ware update. This should be generic for all to use firmware update for any =
devices.

         Do we need to create files "firmwareupdate.cpp/.hpp files" under p=
ldm deamon as generic to handle firmware base pldm commands?

         Also, please suggest to repo add the BMC applications to send and =
recv the command handling.

         Could Please provide your comments/suggestions on this implementat=
ion.

Thanks,
Kumar.
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

--_000_HK0PR04MB2964D0B4027D7B3AE80A3E9EFDCC0HK0PR04MB2964apcp_
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
	{font-family:Latha;
	panose-1:2 0 4 0 0 0 0 0 0 0;}
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#08298A">Internal</span></b><span style=3D"font-size:12.=
0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;We =
planning to do NIC firmware update for our system pldm base.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So,=
 We would like to add implementation support for pldm base firmware update.=
 This should be generic for all to use firmware update for any devices.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Do =
we need to create files &#8220;firmwareupdate.cpp/.hpp files&#8221; under p=
ldm deamon as generic to handle firmware base pldm commands?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Als=
o, please suggest to repo add the BMC applications to send and recv the com=
mand handling.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cou=
ld Please provide your comments/suggestions on this implementation.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kumar.<o:p></o:p></p>
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

--_000_HK0PR04MB2964D0B4027D7B3AE80A3E9EFDCC0HK0PR04MB2964apcp_--
