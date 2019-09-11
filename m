Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4D1AF570
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 07:28:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Sr6C564lzF20J
	for <lists+openbmc@lfdr.de>; Wed, 11 Sep 2019 15:28:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.77.115; helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="ksqk/rlv"; dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770115.outbound.protection.outlook.com [40.107.77.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Sr5S5QtjzF1xP
 for <openbmc@lists.ozlabs.org>; Wed, 11 Sep 2019 15:27:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Epu+XZQKES9gUWsWJFlPOvtJ7IR8MtCKd/p7NKOWnnr0fxy3qJhfbq/NAtHE0e7HH8jN0C0dtHQxvNDTvjiuOhcsqkELUNmk5i3BO3W9+EX1uADFeDuAhNUZatynClaRS1APbibafVhd9o7uy5WIzhYs9vh+Tuz6qlQ3/ItKDMBYC/rbbKZEIOCexZ08bGEgcO99BIoFUO7u/6EUx2aKZIbR3Zgi3xHHkXcXywNh326lcWxZgKi6sK5fq+/JxAWcMyCF18qyzKljTsfUoUbC/lqnndzkWXBS6jFncAbKcr9QZJYfQO9YifqH/Ekd/FOST8K5CZNvM4cKGF+XXOBt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+lCuTRfcPiu/fQC9+EgpMLyYIxeJExoZtLjO6EU+64=;
 b=n+YtjmxWGLOl7MPGsvQWWvPfZhoAI56nn0H6qdnvQYzrylTsPKQsxsSgqICwMjy/bl/7D/fpHFU3yI1iGq03lM1/AHtfXNggkxdb2pJU8vhr27yWHBDc0F34kDUmowXAk1EGH3Utn/d58Z8HIcR1GVvEz5twhEIdP0QqzSeH14Oc89W4hEC5yzA6VMr1xeONl83yKV2F4qwxlvYavv5/sMXj7Rpjis3INjQO5fXeuN2ZlZhe8rzK7EUFCfjk0lEDOTb80vMa03Wrd70VmhHtgCtVJHCGTE7TtIm5ZVq7jIO0xFOttjKFlV+nKokBF9Sstu3acQe/lbKZ2LpmJcLYQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+lCuTRfcPiu/fQC9+EgpMLyYIxeJExoZtLjO6EU+64=;
 b=ksqk/rlvH+RvioI1wRIYQbq3UBSs8jtG8dEiznKN21nqUWRLwGTxzmotiJk53cXS6kgtcY7eTc8WVJF9XLHeSFf4cwKRR2g7pmtBQJYbeJG7x3pmUIowUuy2MetYf18TQWk3sSrD5zrRuLVBNl+0IDQut1aVsPkJJksePNAWYe8=
Received: from BYAPR21MB1191.namprd21.prod.outlook.com (20.179.56.209) by
 BYAPR21MB1318.namprd21.prod.outlook.com (20.179.60.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.6; Wed, 11 Sep 2019 05:27:48 +0000
Received: from BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e805:a5bc:9f69:771b]) by BYAPR21MB1191.namprd21.prod.outlook.com
 ([fe80::e805:a5bc:9f69:771b%8]) with mapi id 15.20.2263.005; Wed, 11 Sep 2019
 05:27:48 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RMCP support 
Thread-Topic: RMCP support 
Thread-Index: AQHVaGGM00PZ7ioWAE24KBCBG6hbvg==
Date: Wed, 11 Sep 2019 05:27:48 +0000
Message-ID: <BYAPR21MB119102ED346FC31306D07911C8B10@BYAPR21MB1191.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.47.142.85]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07d71082-ef30-4877-3a83-08d73678c8a5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR21MB1318; 
x-ms-traffictypediagnostic: BYAPR21MB1318:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR21MB13182DEB161E9869C4E98100C8B10@BYAPR21MB1318.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1227;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(91956017)(76116006)(256004)(7116003)(2501003)(66946007)(66476007)(4743002)(33656002)(52536014)(2351001)(102836004)(86362001)(5660300002)(25786009)(66446008)(55016002)(64756008)(66556008)(6916009)(10090500001)(6506007)(26005)(22452003)(53936002)(186003)(316002)(9686003)(6306002)(54896002)(5640700003)(236005)(10290500003)(3846002)(8676002)(1730700003)(6116002)(81156014)(486006)(3480700005)(7736002)(81166006)(66066001)(7696005)(71190400001)(476003)(71200400001)(8990500004)(99286004)(478600001)(74316002)(558084003)(2906002)(6436002)(606006)(8936002)(14454004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR21MB1318;
 H:BYAPR21MB1191.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8UX+DPO97BqIEuwrh9xKFeEg/CL1n8/BBRDHaLv/9flHzvhsGLEpnJBJXIUTui7dab9h1n/tPiwKtweoudusDyqBgP3IIKlyvmHn+rhccP57dPBDAZ1Buk6VLFRJIlQKhTPxHwcE4fNEWqLPBBMPIFVU4jU9Ei37uFX/OlYpCBQaYYuJsSjR8Jn4rU+7CpvuP4+qoIa4IzKOFRP/LZqWQkxftj5S3teUbx+6kYHdW78aRd592KFH9gmdQgcCZ6VpPuI2nGW/n4X7h8aTzjp8Ir6T+4NgSlhFgB2ZdFJVyyHVak6Cuujfa5d6/L9d5B9wxYGdifUokclrkrrE08tKUeWCgyB/gjseFMRPuvPnaRIvFjUwtEakPXuvpVMobsEnK97zljgQ+Ki5S0avT8zb+OX8gR7EmDBYeTpVtaHSP7U=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR21MB119102ED346FC31306D07911C8B10BYAPR21MB1191namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07d71082-ef30-4877-3a83-08d73678c8a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 05:27:48.5492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8J11xJ/TPM1hhv5fsbYTtpr73LfoGFyy+zjEAPOtVsFm9ZgkkfWxMr+Acm5qiGSC8LNNEIyjd4LM4k9ol9Ra1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR21MB1318
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

--_000_BYAPR21MB119102ED346FC31306D07911C8B10BYAPR21MB1191namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Is there any plan to add RMCP support in IPMI LAN stack ?



Get Outlook for iOS<https://aka.ms/o0ukef>

--_000_BYAPR21MB119102ED346FC31306D07911C8B10BYAPR21MB1191namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style id=3D"ms-outlook-ios-style" type=3D"text/css">html {
background-color: transparent !important;
}

body {
background-color: transparent !important;
color: #333;
line-height: 150%;
font-family: "-apple-system", "HelveticaNeue";
margin: 0;
}

.ms-outlook-ios-reference-expand {
display: block;
color: #999;
padding: 20px 0px;
text-decoration: none;
}

.ms-outlook-ios-availability-container {
max-width: 500px;
margin: auto;
padding: 12px 15px 15px 15px;
border: 1px solid #C7E0F4;
border-radius: 4px;
}

.ms-outlook-ios-availability-container > .ms-outlook-ios-availability-delet=
e-button {
width: 25px;
height: 25px;
right: -12px;
top: -12px;
background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAA=
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3D");
background-size: 25px 25px;
background-position: center;
}

#ms-outlook-ios-main-container {
margin: 0 0 0 0;
margin-top: 120;
padding: 8;
}

#ms-outlook-ios-content-container {
padding: 0;
padding-top: 12;
padding-bottom: 20;
}

.ms-outlook-ios-mention {
color: #333;
background-color: #f1f1f1;
border-radius: 4px;
padding: 0 2px 0 2px;
pointer-events: none;
text-decoration: none;
}

.ms-outlook-ios-mention-external {
color: #ba8f0d;
background-color: #fdf7e7;
}

.ms-outlook-ios-mention-external-clear-design {
color: #ba8f0d;
background-color: #f1f1f1;
}</style><style id=3D"ms-outlook-ios-dark-mode-style" type=3D"text/css">.ms=
-outlook-ios-dark-mode {
color: #E1E1E1 !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-reference-expand {
color: #777777 !important;
}

.ms-outlook-ios-dark-mode a:not([class]) {
color: #0086F0;
}

.ms-outlook-ios-dark-mode font[color=3D"#000000"] {
color: #E1E1E1 !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-availability-container {
border-color: #303030 !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-availability-container > table > =
tbody > tr > td:nth-child(1) > table:nth-child(1) > tbody > tr:nth-child(1)=
 > td:nth-child(2) {
color: #0086F0;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-availability-container .ms-outloo=
k-ios-availability-timeslot-container {
background-color: #0086F0 !important;
color: #000000 !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-availability-container .ms-outloo=
k-ios-availability-border {
border-top: 1px solid #0086F0 !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-availability-container > .ms-outl=
ook-ios-availability-delete-button {
background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEgAAA=
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
AAABJRU5ErkJggg=3D=3D") !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-availability-container > table > =
tbody > tr > td:nth-child(1) > table:nth-child(4) > tbody > tr:nth-child(2)=
 > td > a {
color: #0086F0 !important;
}

.ms-outlook-ios-dark-mode .ms-outlook-ios-mention {
color: #ACACAC !important;
background-color: #292929 !important;
}</style>
<meta name=3D"viewport" content=3D"width=3Ddevice-width, user-scalable=3Dno=
, initial-scale=3D1.0, minimum-scale=3D1.0, maximum-scale=3D1.0">
</head>
<body style=3D"-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
<div style=3D"direction: ltr;">
<div>Is there any plan to add RMCP support in IPMI LAN stack ?&nbsp;</div>
<div><br>
</div>
<div><br>
</div>
<div><br>
</div>
<div class=3D"ms-outlook-ios-signature">Get <a href=3D"https://aka.ms/o0uke=
f">Outlook for iOS</a></div>
</div>
</body>
</html>

--_000_BYAPR21MB119102ED346FC31306D07911C8B10BYAPR21MB1191namp_--
