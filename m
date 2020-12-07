Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D22D145A
	for <lists+openbmc@lfdr.de>; Mon,  7 Dec 2020 16:05:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CqRSL28dkzDqV5
	for <lists+openbmc@lfdr.de>; Tue,  8 Dec 2020 02:05:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.138; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=priyatharshanp@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=etkTod1s; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=etkTod1s; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320138.outbound.protection.outlook.com [40.107.132.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CqRRF4QkczDqTs
 for <openbmc@lists.ozlabs.org>; Tue,  8 Dec 2020 02:04:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixFmRddWuk4GS8qGItZKBtI/RkrTEA6p9q48XnTTyNE=;
 b=etkTod1s6vIuX64d3nrJ+HkeNhRsAdCBP3o0mX5C//ifjRz5L9IGS3lVSZkW5SQQ8Zm0h/oXXxioF4lRKIQdMLuIfUNG8RAx1xNw1OPj5fXDg6gxBdVFkWVQV9YKmJWJnhw7zQXdjgGJWeRuEZFmm7bsi1Gd+z/Dgiyp1fGQ8/8=
Received: from SL2PR01CA0022.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::34) by KL1PR0401MB4242.apcprd04.prod.outlook.com
 (2603:1096:820:2f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.23; Mon, 7 Dec
 2020 15:03:50 +0000
Received: from PU1APC01FT046.eop-APC01.prod.protection.outlook.com
 (2603:1096:100:41:cafe::56) by SL2PR01CA0022.outlook.office365.com
 (2603:1096:100:41::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Mon, 7 Dec 2020 15:03:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.53)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.53 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.53; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.53) by
 PU1APC01FT046.mail.protection.outlook.com (10.152.253.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Mon, 7 Dec 2020 15:03:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cXI+eql5yBzhWVw2BFT9xIcXG7pGchQWDjtKZm8KTZkKQgx9n+GT2iZDwQkWbCI4sVdWI5m9oa7ozJNsvYmOF55gMWS8RAroVfqUARSMYtS0PuifUnGTffl6mXjAwPHuhPBL0li/7Wj94z90UpRKmCKnlwrSf9riiOZs+iMYSqgekA0w64mx0QnKNHBXeArj4vovR526VQrDxuSREeuFWzruHyGRT5+rsfQbUtsGvNAI9UfaCvFoEhLXAihGmt4u6lUYbIPJ1qjT0hUzoKa/RkSna1555m70APTvtoIKMOCTi7FpbKjksrOgAZjgXHvqE6p/cdmytwyBRkcDZ6GA7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixFmRddWuk4GS8qGItZKBtI/RkrTEA6p9q48XnTTyNE=;
 b=BFRr7AlHMNj/gKz1gZ+PkZPodkWzBTa/Ly52744yaKwX32BYLFrDlMrl45RFYeHD/MdGGBh3fWRVvPawT1OuuHfPZvlZG7hBYnPkEIjj6GU/6EfKtIpyeF+gdFJmrFBi/TirC7hdD1SGSNTVCvSCAk5MaUv5+WOexCL53PmtIn5l3A2gXq0yNAulFnHOYk4v2ti7lak7g+/vt7DaqeuQXBXS+1YcHTSLRext+5PRb8EWYPniBIi7mw+d0Cr8r1/Yqu3/zKGIUU7IoFTiIoncGwmz2w3QbJXq70amby7HoPUaJHvmu5Dp2VAmEN4kjJPqatPAA/cYr/R6D06aDZ/obw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ixFmRddWuk4GS8qGItZKBtI/RkrTEA6p9q48XnTTyNE=;
 b=etkTod1s6vIuX64d3nrJ+HkeNhRsAdCBP3o0mX5C//ifjRz5L9IGS3lVSZkW5SQQ8Zm0h/oXXxioF4lRKIQdMLuIfUNG8RAx1xNw1OPj5fXDg6gxBdVFkWVQV9YKmJWJnhw7zQXdjgGJWeRuEZFmm7bsi1Gd+z/Dgiyp1fGQ8/8=
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com (2603:1096:404:94::9)
 by TYZPR04MB4367.apcprd04.prod.outlook.com (2603:1096:400:6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.19; Mon, 7 Dec
 2020 15:03:45 +0000
Received: from TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::c15e:e813:7302:4d79]) by TY2PR04MB3311.apcprd04.prod.outlook.com
 ([fe80::c15e:e813:7302:4d79%4]) with mapi id 15.20.3632.017; Mon, 7 Dec 2020
 15:03:45 +0000
From: "P. Priyatharshan" <PriyatharshanP@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: NC-SI Asynchronous Event Notification (AEN) Implementation
Thread-Topic: NC-SI Asynchronous Event Notification (AEN) Implementation
Thread-Index: AQHWzKoSK7hrRB4UMEe36HFBz77EtQ==
Date: Mon, 7 Dec 2020 15:03:45 +0000
Message-ID: <TY2PR04MB33113F1C94A2530E8033BEBFCACE0@TY2PR04MB3311.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [117.241.157.72]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: f83f2dea-633a-47ee-bad0-08d89ac14d22
x-ms-traffictypediagnostic: TYZPR04MB4367:|KL1PR0401MB4242:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0401MB4242A620C6DA28E1C8E8988ECACE0@KL1PR0401MB4242.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: JlwkKe82rpJh+vJBBq9tSkASddNQiTmCzm846JAaYuL6Lz43QlvzRQTz+V/6xSEznv7E7adNapMFeIiF26eMnKpt9KniD8ZFGBQ1JVsSdB/vf1r/YFZf7MH4Xh4rPu4MAzP2PUa6L13h7/gKMT18Oa48hua5Pic0eaqZZYRCJnmGJkh8b5BpsMogi1Jx6AZHG8QJAthUmqLiXYe0XMOuwN0Rbi9/+Es0NgIV7Q9ANecfKOXSahHfWV/94DLkWTU8Cs3pKubHMqAVefjFBA4VUWgNgmFPagl0OLoE8OLqmAYe4z26t9zdF4pxUOizGB6h3LBhSu4vBDxt+aZ1xp8m4Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3311.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(5660300002)(83380400001)(76116006)(2906002)(7696005)(15650500001)(91956017)(52536014)(71200400001)(66556008)(55016002)(6506007)(19627405001)(9686003)(33656002)(186003)(66476007)(4326008)(6916009)(478600001)(26005)(64756008)(8676002)(8936002)(66446008)(86362001)(66946007)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?TAc6ChEPDrlJTYIRd89r1I115iNmlcqgKo3sf0jF6M5X/N+GWbqx3NPrMe?=
 =?iso-8859-1?Q?Mlvlb3e1EBE16xTo+O+2GtJRfUeu7WYhX9MxpnXKk+siqAMRndgdyh9bzq?=
 =?iso-8859-1?Q?a4h7ZZS3B1HOzIzBgeiDHidX8UeJiTDZWyW2MipeFNT3wKEWDbu/xEzjxo?=
 =?iso-8859-1?Q?gNsOeyMdssp9UgGS1ODPqaazsRkoRqcI372O6DDdPjEBZVBKZTJAVM0ZXq?=
 =?iso-8859-1?Q?QnfMf8LqUQPBwGWH9J/JWiSTq/0VcJt63XWz6rDi2qifwm8/oBj8P+I73Y?=
 =?iso-8859-1?Q?KFUnrqkqxhTmomexKZGXh2L9cTxv80E8CpcEho+HsXzv8vXkTvhQajy5bk?=
 =?iso-8859-1?Q?JZTViV9a+HyuQT+1QLkQadBXb70URtigBFWND4KJktMcTgUWJQO+rLlg0v?=
 =?iso-8859-1?Q?wQFS8DTCnvjVQAb5WeEjcamNFD6Tz0lWW6tjuoeFeeUZVGycjX+IkcUk2z?=
 =?iso-8859-1?Q?Lh5QuY6RBnhlFpDR2WHzsIve2LVIE3fdU2TV3+IPMoJIm+ddr8wvsphW7g?=
 =?iso-8859-1?Q?FL7xG7TcIBtaqXaZi3RAm/GiqEEiY4ubow1BlKhHPX3d52jRbVeKzZU7HP?=
 =?iso-8859-1?Q?7+j1x7f+m3yUazORwXIE38Rw4QA3COP+bxagk+MD8Ibz+/j5PyiEB8/EUQ?=
 =?iso-8859-1?Q?IAYQNSjNiwWPDc3FPPWjWoP+r8Gb2MCL6Eali0UuHvaratrhdW38KJF+4C?=
 =?iso-8859-1?Q?DxH7NboRHwBMdnPLGeEvqSI7U8lgHzpLpSvgS7jOV6hj5XrHiBAx4SL+1S?=
 =?iso-8859-1?Q?KnpxXn+tsLx5+4Ll5905ci9391urR4IEyTT3+klO57qd0CaPzAlMljaV19?=
 =?iso-8859-1?Q?5B/Ob/7dJZHUH1i3wAzMi4FIRepcD4G0TU+HNAEdGg7Xg7VK4bF0GSZPsr?=
 =?iso-8859-1?Q?MzIUzUfj1y7UQ9I+N3H4tKG7lbt7jhBwcvtYW1ESIOu3sq/Ii3tnCHlE3A?=
 =?iso-8859-1?Q?Mb8MVIQJuHXHX/CKIEliFs8RNCICluQf9SEEwUiclWdQAWbY423G7j5tOV?=
 =?iso-8859-1?Q?4hgoujbgxmp8Ddxnw=3D?=
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB33113F1C94A2530E8033BEBFCACE0TY2PR04MB3311apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4367
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT046.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 55d66967-8345-4ee4-507d-08d89ac14b10
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0nh7tH3Qiyir74rr2FMouoaHO47JfgONFq70TT1sfnu9MTOSZ5Nkem61deeMmvGKyHJFbtEPUi6hYbW9Rk9NHxzqUYXNH4c8M5u8w3jVnecapOPgUwTC4zKF8JACmehqX7r0oOwKEm2mel2ud8w7OPReYVvcw3qzaxC1RRPhJZpqUx6ssx+PPLQiyYgdCkLBX7FxfgOnGJm+ZIuItBX3KoxSSilSNm6uFu3ufFxXieH2vd7QPyJrEgG9BDBrLsrC3QBKv6xxjCRueQ4EcOVvxMVP2+Lb0VwHX4/BitgyH6K0qYIfgwpsvbol0RlH/RIrHQsLqJ/MUTReCU172j14jRWDETm9cpjwJ0+HfoQaPV/LpNkiBwdQFbDFVofPvbxCzkfJ245Nsxh8Sqkdkc7LQA==
X-Forefront-Antispam-Report: CIP:192.8.245.53; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(346002)(376002)(46966005)(8936002)(33656002)(316002)(55016002)(356005)(2906002)(83380400001)(19627405001)(70586007)(70206006)(186003)(6506007)(52536014)(86362001)(5660300002)(336012)(4326008)(6916009)(8676002)(36906005)(15650500001)(82740400003)(478600001)(26005)(7696005)(82310400003)(81166007)(9686003)(47076004);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2020 15:03:47.4683 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f83f2dea-633a-47ee-bad0-08d89ac14d22
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.53];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT046.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0401MB4242
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

--_000_TY2PR04MB33113F1C94A2530E8033BEBFCACE0TY2PR04MB3311apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Is NC-SI Asynchronous Event Notification (AEN) handler is already implement=
ed in OpenBMC?.If yes kindly let me know which daemon is handling that.


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

--_000_TY2PR04MB33113F1C94A2530E8033BEBFCACE0TY2PR04MB3311apcp_
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
Is NC-SI Asynchronous Event Notification (AEN) handler is already implement=
ed in OpenBMC?.If yes kindly let me know which daemon is handling that.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
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

--_000_TY2PR04MB33113F1C94A2530E8033BEBFCACE0TY2PR04MB3311apcp_--
