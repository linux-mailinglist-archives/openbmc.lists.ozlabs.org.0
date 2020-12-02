Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA93D2CB4DD
	for <lists+openbmc@lfdr.de>; Wed,  2 Dec 2020 07:09:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm7q30Kq1zDqnc
	for <lists+openbmc@lfdr.de>; Wed,  2 Dec 2020 17:09:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.129.98; helo=kor01-sl2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=MlxBq0GB; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=MlxBq0GB; 
 dkim-atps=neutral
Received: from KOR01-SL2-obe.outbound.protection.outlook.com
 (mail-eopbgr1290098.outbound.protection.outlook.com [40.107.129.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm7nw57M7zDqnT
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2020 17:08:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFmKcyus8t3Pu14BW3D/v9kipmq5B+Hg/tSQyfFO+8w=;
 b=MlxBq0GBL4eOI+tHOx9pfpH8Px/B21/a/hdX5GxpCX2HoL+XSWwI5D3ABbp3XDPNQDvVGC5/gEdom2ZZbC5+PSTBSswYXuek0mIetlP+OGMR8C38DiVKnesDTVDBPpOubF4WB+sDn/wiRyA3l16SYCv5ECTd0WViw8vd+VkpRIQ=
Received: from SG2PR02CA0038.apcprd02.prod.outlook.com (2603:1096:3:18::26) by
 PS2PR04MB3590.apcprd04.prod.outlook.com (2603:1096:300:6e::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.25; Wed, 2 Dec 2020 06:08:32 +0000
Received: from SG2APC01FT033.eop-APC01.prod.protection.outlook.com
 (2603:1096:3:18:cafe::ef) by SG2PR02CA0038.outlook.office365.com
 (2603:1096:3:18::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Wed, 2 Dec 2020 06:08:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-PU1-obe.outbound.protection.outlook.com;
Received: from APC01-PU1-obe.outbound.protection.outlook.com (192.8.195.56) by
 SG2APC01FT033.mail.protection.outlook.com (10.152.250.119) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 06:08:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6w8oB3SH+DxyJudmyLppAqExpJLkG+xgpx3C8zwmOUeHYILFKwkBMevjMXrCt9VLqSDsBffOT7zsD5ggzJWHmNEjO5SLLZb8nPIO1uDrh3/V1os07ItS6kaPyr3e+Gr0ryfHRctNRU56htmnQq/ouoHEV1VWzgpUF3GzodtaDf99Via9SbsUhbLGb6OyvIVt0H7LMA+iL75GZpBVTag9hw3Hg1Rq0q62fCQNBWuP96Tq05AcdMnPi2N9sR7cFDbJOGfJlOtB+xIZoZhCKe8dbxx6fXZ7FxmWj74hJ7Y/bG+8cUWKEUWIADB1WaKsCzPMTTRDPBTppgxVZ1jmOV38Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFmKcyus8t3Pu14BW3D/v9kipmq5B+Hg/tSQyfFO+8w=;
 b=kNVHbsVj/GtFxqonC5iVsePyvDg5FB11q8MGR9XdcB4Vnu/GKD0JPRVX78SE4pWiOdqA9kQYHGlYNmbwsPb0dzEkD9wEEJTrtsDxHkdQZyYpVOsu+uf4SvLIswFnWlPYYw5s4C0lV/UEAf8mVtioJkrUInOFKCvty6985yKfBMpdhSze+L8IeJQ9x4iss6/MidT4hZFlKOYObFREl52HBiAz0rPJW1zmeocIrUyLli9d71OQ3us6GUROpoMl0mpJsNFDe0LyOATK5jPf+IQyNgmWgCg+Sr3GIAVw7iGI7Pk6Bg6qKVcm3rqRutFcTL4F5uS8abnHHcz+aq5hB/OSbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TFmKcyus8t3Pu14BW3D/v9kipmq5B+Hg/tSQyfFO+8w=;
 b=MlxBq0GBL4eOI+tHOx9pfpH8Px/B21/a/hdX5GxpCX2HoL+XSWwI5D3ABbp3XDPNQDvVGC5/gEdom2ZZbC5+PSTBSswYXuek0mIetlP+OGMR8C38DiVKnesDTVDBPpOubF4WB+sDn/wiRyA3l16SYCv5ECTd0WViw8vd+VkpRIQ=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HKAPR04MB3972.apcprd04.prod.outlook.com (2603:1096:203:d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Wed, 2 Dec
 2020 06:08:25 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29%6]) with mapi id 15.20.3589.037; Wed, 2 Dec 2020
 06:08:24 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Add version info in the fan - json config
Thread-Topic: Add version info in the fan - json config
Thread-Index: AdbH8TNPc+j+bLH6SyW0u3W2Zi4qRQ==
Date: Wed, 2 Dec 2020 06:08:24 +0000
Message-ID: <HK0PR04MB29643B6D1550EC772A099250FDF30@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_Publ1c
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiODBmNmU5M2UtZjhhZS00Y2FhLWJkZTQtZTIyYjI5ODVlYTJmIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6Im9RYU9yamxPeWNhM1wvWEMxXC9HQ2Z1c2FwWmdlY2VKdUFXSHFadDJpdlwvV2Q3MHNBS3oraXVmdVY3YlF4XC9qeitDIn0=
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [157.46.84.102]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 11b72a34-ec75-4567-bda2-08d89688b22a
x-ms-traffictypediagnostic: HKAPR04MB3972:|PS2PR04MB3590:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <PS2PR04MB3590DEBC0AE716B166D1A158FDF30@PS2PR04MB3590.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: WVdtCfGseRHxuVUHDS0bWD9ycCRNkkl+wjCquIPe/QZFFvr3cI1fVGPVt1V50P6XkBNwsx+gpwEFJ6Ni1f9YOKT9uws2wJD4jxjZeFNXQuqVB+YR+pLLDHvPPniPDw86vTtfX8ZL2pl8f1PRx5R5F8R8bLLvC3OUt8MwzCs0O3QOkcwbsxSa/sM2l/OBMxuvTYgl7OV40WsctDhnqVp7OsEmb6C5KEEp+Kp2bezt0wb7egUorHUiI3YG09x3buYCkZwsmJs4RXSeFdOdU8eZRQuOhg06dAFmcKtXQhNMneLMD+5sKOVvcVZGeF6aqlXshzH1OxjwdNXwCoWrUs5qww==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(76116006)(7696005)(8936002)(66946007)(6506007)(26005)(54906003)(316002)(86362001)(33656002)(83380400001)(52536014)(66556008)(71200400001)(66476007)(64756008)(66446008)(5660300002)(186003)(9686003)(2906002)(478600001)(6916009)(8676002)(4326008)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?hkRCAv7vSHLqQiWyAiYxGjKaLC1cpgSlFmIJw2orOhC6UixOoDsvFugwGbYF?=
 =?us-ascii?Q?qDd9DrVv1bWLiwNwQI6jZPJM2Rzuw6RiXm3Efok7l2EjWV11kMwA88On4eJW?=
 =?us-ascii?Q?PKByNfbhqMWXxlwkZeQjCvc/oxjl4U1TFF4rWiQFQ0yE+J6mf9qkOS/SmbRd?=
 =?us-ascii?Q?5QT3R+ulUsDINIxmuzzHrU3h3xhxYoUnpbfrRV/iFNcGx5CV+lOexmu7a4Nz?=
 =?us-ascii?Q?zUqfct3NC6mPbxCXzMC51jC4sRZ+M1rPfhfZxn+Lk39bqNA3dy3yKtNJQzhU?=
 =?us-ascii?Q?uJOVrYinNj2XF+qNQ82JMcoLrMVpXJGh9Sk3e0C3rc/SRTuZ8C1VVEiRNpU5?=
 =?us-ascii?Q?UaKPk2c4F84k0a1mgrwnTWYlMxDEr5JcKwTpmoe/iyOStxnCksstVBKV2TMv?=
 =?us-ascii?Q?gABSFv9TFy9wemjHW3zdp9oejVV9eiPdIN7k7mnmgkmjK5gMWfFLB2w9B2gD?=
 =?us-ascii?Q?/c6f9tHbkmJMca0R4fSToJq1tUFQKGOz6n0zm0Z02ePFsC9F1C81ttRI/ccR?=
 =?us-ascii?Q?IQQHKYCI6nrY1yd949rJhHjvgRiCMqQTfSg5w0g4iCeiJ2RBlYpXZAQDckgz?=
 =?us-ascii?Q?uaiiwGB4UxV/O4LgniuQNBPecKysOLZuYWzrDjjQt/ovN3OqpnjWIgZq5jUJ?=
 =?us-ascii?Q?v6bVRZZ9CaDN5Jw0xQj1uV2yZXoPjJHAd8uqRbHDwwvY3spYYrroPQ+CvYOu?=
 =?us-ascii?Q?R1se+uY1u5aREpR8YoivedSSxP1LAS0Yb5vfjpUPdo1BoxwwrNQcrBl5UyiG?=
 =?us-ascii?Q?JoQ6mm+uFcsEG6fKSClVRLitsXf6RrMp93+mxFsSzG25jVNjIfGYuk2rgZQO?=
 =?us-ascii?Q?iSWC6iQm00fu5HrRmCT1oHKNOgpyN6I9BkzQR83k37wORcBDnHfVvHpucaHV?=
 =?us-ascii?Q?CcKYfpr3qnshErOHw3lbWVhFy3UD+IyOSxOTTTBEm0jFmp91toFk24njcwjq?=
 =?us-ascii?Q?Iy6/hieTcF0TsHvQuoX2EXaYhHgvLY7EMccvtte50cQ=3D?=
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB29643B6D1550EC772A099250FDF30HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HKAPR04MB3972
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT033.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: a6261f03-7286-485e-6acf-08d89688add3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bTmhBkEnUEceuv6310r/oBDeUoizuEmN03OP8d6PaGA3v2223OsjFOhreBpCyvxTjG1SxlCZFLMnEq8LL/5S0CV2+xJphuJkwBHHFlmhYDNGZ1rA4ykTUyabNWiXVxh+Yq4oC6v68khXmp9r+Au+DCB8vBEBPufWOIK1OdFvNPGHU/FJg+DY3rTZ2TBcRqnme1tixJ7Ask4pabbLjODalduig9cQZS2atphTP12Z0QNA3HXAlOXPBem1Hfb2TTr34RwthHNr39hrPDkTN+IUPyMoWmSjRl20pwdcaMfr8Lal2j7F629kN6/jc0uYQdzqJcsX81Ht56O8ZCKB64ORe6b7hfHUYOsYGk7FqYu3x9+DuvmHtTvXpMbhobav6ovN8fd1w6hM4X20AyPEXDi2tg==
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-PU1-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966005)(83380400001)(54906003)(2906002)(356005)(7696005)(316002)(82740400003)(82310400003)(36906005)(6506007)(47076004)(26005)(4326008)(8936002)(55016002)(186003)(9686003)(33656002)(5660300002)(70206006)(336012)(6916009)(52536014)(86362001)(8676002)(478600001)(81166007)(70586007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 06:08:31.4312 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b72a34-ec75-4567-bda2-08d89688b22a
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-PU1-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT033.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB3590
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
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, Ed Tanous <ed@tanous.net>,
 "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB29643B6D1550EC772A099250FDF30HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Public
Hi All,

        Shall we have a new field "version" in the fan controller part in t=
he Entity-Manager json file to identify the versions of the each fan contro=
ller updates.

        This will give us the idea about which versions we are using and fa=
n config updates and tracking.

        So, dbus-sensors/FanMain.cpp code should be updated to handle this =
version info for the fan.

        Please let us know if any comments on this.

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

--_000_HK0PR04MB29643B6D1550EC772A099250FDF30HK0PR04MB2964apcp_
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
	{mso-style-type:personal-compose;
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:green">Public</span></b><span style=3D"font-size:12.0pt"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Shall we =
have a new field &#8220;version&#8221; in the fan controller part in the En=
tity-Manager json file to identify the versions of the each fan controller =
updates.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;This will=
 give us the idea about which versions we are using and fan config updates =
and tracking.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So, dbus-=
sensors/FanMain.cpp code should be updated to handle this version info for =
the fan.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please le=
t us know if any comments on this. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kumar.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; <o:p></o:p></p>
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

--_000_HK0PR04MB29643B6D1550EC772A099250FDF30HK0PR04MB2964apcp_--
