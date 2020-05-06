Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F230C1C7DA7
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 01:02:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HXDB3RC1zDqvR
	for <lists+openbmc@lfdr.de>; Thu,  7 May 2020 09:02:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.140.134; helo=jpn01-ty1-obe.outbound.protection.outlook.com;
 envelope-from=manikandan.e@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=PAFlqE15; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=PAFlqE15; 
 dkim-atps=neutral
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
 (mail-eopbgr1400134.outbound.protection.outlook.com [40.107.140.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HRm03MzKzDqBr
 for <openbmc@lists.ozlabs.org>; Thu,  7 May 2020 05:41:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Gou0323UY49sni9UBv6e6yAYAPOq2Ayi7YhLsap7GY=;
 b=PAFlqE15ZLGzDzKkF/CSMAxX08dn4EpdnnwcAaePjLz2TuHjua+5OwKs7CpQRdiWyUnB9EOanqJu9qipwYXClLKVyvrZoOkGkoYiT/BWgyH5mskIwomF4+0Y7a7qqEEF3lzpdUkDbGrPtIDUhXpw2U2j+qtvF9uqKYXFAo39yMI=
Received: from PU1PR04CA0004.apcprd04.prod.outlook.com (2603:1096:803:29::16)
 by TYAPR04MB2525.apcprd04.prod.outlook.com (2603:1096:404:16::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Wed, 6 May
 2020 19:40:56 +0000
Received: from PU1APC01FT015.eop-APC01.prod.protection.outlook.com
 (2603:1096:803:29:cafe::9b) by PU1PR04CA0004.outlook.office365.com
 (2603:1096:803:29::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Wed, 6 May 2020 19:40:56 +0000
Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.245.51) by
 PU1APC01FT015.mail.protection.outlook.com (10.152.252.227) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.27 via Frontend Transport; Wed, 6 May 2020 19:40:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ORKHnAsp0KOEJPSEfat9W27LxDKDJgu0lcZVKCI/buDhsYT2Hz1iwuVotxaWhwCGAvGHRiWJpREPGMFNgSSDgTkzVS/f1u6jvi8muuq9QvcNghOQVwpBDnU6gfiJPDaiIgJmjcers8TzVCqEYx+zf0JKG96ZiPu6a79NQ2S5kUyXKVsPVkVhxgpPXXNInVGQvLlKYqj0cO3jwXKEYfHDAQms9YwCiLI83W1trKxokDI3BrQ82ikcExlMIavnwKHFxzenvGmZboW/4+hBFWAQdTAJVtlWUMNRyQA8n8VtVsZzPx4U5vSkxk9l0KKXhognrsRiy+u9XVTB0W6wEn794Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Gou0323UY49sni9UBv6e6yAYAPOq2Ayi7YhLsap7GY=;
 b=jS+ATYizTJJQAE60RQzVZUVNu1sImB16vZe5guz/OYm9eVuJD+yu58VG3vfXb31JmN9ePH4DgnsTb46Fbohs1b3Lvslifc2xHQE5ZP2EZ6u74WmXyEJA1on83FJztADRkEfuhEQhlnspCrUNEuLmj4U+bNeCIacGn/E7i2Zsru5xJJgk6xbLSan2MUDu4iIvy8M57Oz0fDWk2wK77+BLzlv6QymbvJ1uwQZcHhMOORL6BJw6lqS/0djGwp6IFWoJxNV5PDVukgrQ6cr+yGAkUR95Ivg4T00+LNMTKLsgkKKHQUSOwGjgYDuKV6DcnwlgynaiuXNjsTtTJoyt+h1tZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Gou0323UY49sni9UBv6e6yAYAPOq2Ayi7YhLsap7GY=;
 b=PAFlqE15ZLGzDzKkF/CSMAxX08dn4EpdnnwcAaePjLz2TuHjua+5OwKs7CpQRdiWyUnB9EOanqJu9qipwYXClLKVyvrZoOkGkoYiT/BWgyH5mskIwomF4+0Y7a7qqEEF3lzpdUkDbGrPtIDUhXpw2U2j+qtvF9uqKYXFAo39yMI=
Received: from TY2PR04MB3038.apcprd04.prod.outlook.com (2603:1096:404:a4::20)
 by TY2PR04MB3742.apcprd04.prod.outlook.com (2603:1096:404:fa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28; Wed, 6 May
 2020 19:40:51 +0000
Received: from TY2PR04MB3038.apcprd04.prod.outlook.com
 ([fe80::612d:f62e:181a:9adf]) by TY2PR04MB3038.apcprd04.prod.outlook.com
 ([fe80::612d:f62e:181a:9adf%2]) with mapi id 15.20.2958.030; Wed, 6 May 2020
 19:40:51 +0000
From: Manikandan E <manikandan.e@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: sysfs entries not created for temperature in adm1278 
Thread-Topic: sysfs entries not created for temperature in adm1278 
Thread-Index: AQHWI946dGqjx9blPE2Bm1iELlVbHQ==
Date: Wed, 6 May 2020 19:40:51 +0000
Message-ID: <TY2PR04MB3038B868F17436186E36E5559DA40@TY2PR04MB3038.apcprd04.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2401:4900:234c:c49c:ccdc:226e:d1dd:c4bb]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: b2a5c7e6-7f63-4e5d-f4fd-08d7f1f56454
x-ms-traffictypediagnostic: TY2PR04MB3742:|TYAPR04MB2525:
X-Microsoft-Antispam-PRVS: <TYAPR04MB25252322649F9828B7616E3A9DA40@TYAPR04MB2525.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;OLM:6108;
x-forefront-prvs: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: qCduAg3Zq3jWG8AYzl1OobKuLC8O2ezA7O3Kab5i318J+MARu28Tf7t3pR2bsy1jseGzLVX5x77ZWRwELOi3WBAS8HFjrethhnbSoJEcs7sOHDYDswyfg6ksZhqZUW2oN0xzclwXTzTRjjzgcs6xA3jz89jLNCx09myon+Ewkm+yQiANoCP70N9HRz0nA4GZjcQ1cJZHf/accUtmK+K8b3aobDWYi7g4gEcPL7kuDlPjrqHZV5X3+Y8f9bl50IbsEci8Qg5FdABfRfSUDAZ1U0qC4BhFQtEkw28m1RkcWRBFt1UfsJ44HrSZ7BVwRXhQaGtHAaWbwAm7yOhcGHtmR/Tua0hPIGuWpgI7APjSvVLQ6DrXW7/o2feqmk93wmCaEdQmHl6r0d24u+I4uclyrL8FaU9sMzfii0VPYwDzQriPec9hyIobCNm6oIBBeSzS/+IjPlmqxkKdrmdjXjth6Ll0eEWqD/z7DO+zc40Bcu4NELzI/8r+00wkMDF3mzbV2N0djjA/We7tC8vPoV4P+w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3038.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(33430700001)(478600001)(71200400001)(5660300002)(4743002)(66946007)(9686003)(33440700001)(8676002)(186003)(55016002)(66446008)(66476007)(64756008)(66556008)(316002)(76116006)(8936002)(86362001)(19627405001)(33656002)(6916009)(6506007)(52536014)(7696005)(2906002)(91956017);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Sz/6GdCBtuN904NqqHe8cnksOPEeATKIqlTZV024hTFty8mzOqCdhPB2nWRbiLRYxxp5ByLrCfpGgAqX+XCMwzO7BOT4vtVjwPw7IDyk35TdWcNq6Q2p4bSITMWhD+KDvy8f+pOpVXl1aLBZqVVisTAMcjeLmhx2YFlDc+qf5PcLVW/CpBPCyOBFX21EsuqwiNPWb7loLNCoF6XPwnZ+W4VWcwrhIOs6xMpuE33pWO9McxicEcQEe43ek+NRH0MchZVaE3J/xCpb4C5S3PiuO9ppnDgsadMDhgvZoF9xlY1Lo6Ucvr8zrVw8x8hyOI+A9GeSgmW5Ji4/Pr3zmCU5GL1+m//MVgO4GlnuBEbVvUFZHyT8aH/bQfXVkz06DabWK+JrA6dsDt6VGKT1W0k1CyOQkBT2+ckFxlE78jD7fUqsEV/NXIfAIYi8+PIAO0JdyDc8qlC+IUfR8CQ4DT2fzXBXUI9p2Wm2kEWiRagVE1mUFWYZbiwzUgH1atY9JOygX9ta2g611MpeqZIATUm4U1v7G4HN4ShcfJBn17jnjFuXOBCzbceKktMat4PL1CiW1Mvp5hXKmVZPmIExgNXRgMnG8u5xKESTkvc/KSrQ6XAUZw5QPY7HajvuheXXlCS2bPAdTkXsEv6VDmURy1aUOoY/uq/KDf5tZK7t4A79sP+2J+urH4ra7moVnEEIibYJEQsxfCzLd5uc4CWQOenwtK8WQvCirKL6WJKNATDgxIjQ2TVCHD2Sl0i7a7jLNdNAmn2VkzTDBh5Fxduy0+Zy2P92mULAS3RCu/yMtJ1lNqn0jE4obKqrphZaHWSC6v8kGmmTOjL/BHhANhuo+02tDjsGjQoL86Su2/Q/M4ND65WsWGpSd1QFE7QpID2XClbf
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_TY2PR04MB3038B868F17436186E36E5559DA40TY2PR04MB3038apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB3742
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT015.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966005)(33430700001)(86362001)(82310400002)(81166007)(356005)(70206006)(186003)(52536014)(70586007)(33656002)(4743002)(33440700001)(336012)(478600001)(6506007)(26005)(7696005)(8676002)(6916009)(2906002)(55016002)(8936002)(9686003)(47076004)(19627405001)(5660300002)(82740400003)(316002)(36906005);
 DIR:OUT; SFP:1102; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7b8698e1-3585-43b6-3012-08d7f1f5625a
X-Forefront-PRVS: 03950F25EC
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z4zh6GfksoHtQzqRB/HZGry8uNCiE6zV1h/00xSTYxTwaOza0k9qGyU+mnSiuibgzDC323GqNKB99F3rVfrb01Ck4jbCl95WOn4t/41ifC7UOIerqq3dGNw6ekfyY9sviWnL1JzlK3gGaQyR/fI4utoPmTJqFG89EHCdCqXwnNGRxMP5sZH//pnYgWLIGCE3kiKaJjKIg4fnQSoK6d6EFnIF9B2Y/SNs+fcWCg+TiFAzuTry3EZ//4T0m7d8Hw8mfnwR6ovdlR6kA+AwYtakffVoOr++MkJaXNEO/Atp1IJhhixZmDAJ6Mj/OruFF0nRIJNTtAxGkUXJFDb5Z6WeNx6fRzX+d4UvqH6X0rixpOheYvu6eTIi5/V3nKDl2diilVQhYoBsjT4Ur6qz6wKicMdpzc4sIFS5oWkv4gpKnyoffAxn2NDSjDdY1qud8vuuUuIpwWuk6dXHlE5p0ZhkiqWRymxOgj46NBo9XPuj8+qLvkuvWgQ+kOV3pSUYGtw9247NO0ZZKc9k9ah1sej4ZabwqqVBDlb9bO+kutgRhLKh7SERtHSC9+/MY/2frJU9ncA0np4vXPjFxTrfxjJmWA==
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 19:40:54.0529 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a5c7e6-7f63-4e5d-f4fd-08d7f1f56454
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR04MB2525
X-Mailman-Approved-At: Thu, 07 May 2020 09:01:33 +1000
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

--_000_TY2PR04MB3038B868F17436186E36E5559DA40TY2PR04MB3038apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,


The adm1278 hwmon sysfs entries not created for temperature.

 root@yosemitev2:~# ls -l /sys/class/hwmon/hwmon4/
curr1_highest         curr_samples          in1_max_alarm         in2_label=
             in_samples            power1_label
curr1_input           device/               in1_min               in2_max  =
             name                  power1_max
curr1_label           in1_highest           in1_min_alarm         in2_max_a=
larm         of_node/              power1_reset_history
curr1_max             in1_input             in1_reset_history     in2_min  =
             power1_alarm          power_samples
curr1_max_alarm       in1_label             in2_highest           in2_min_a=
larm         power1_input          subsystem/
curr1_reset_history   in1_max               in2_input             in2_reset=
_history     power1_input_highest  uevent



Thanks
Mani.E
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

--_000_TY2PR04MB3038B868F17436186E36E5559DA40TY2PR04MB3038apcp_
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
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
</div>
<pre>The adm1278 hwmon sysfs entries not created for temperature.</pre>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;<span>root@yosemitev2:~# ls -l /sys/class/hwmon/hwmon4/<br>
</span>
<div>curr1_highest &nbsp; &nbsp; &nbsp; &nbsp; curr_samples &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;in1_max_alarm &nbsp; &nbsp; &nbsp; &nbsp; in2_label &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in_samples &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;power1_label<br>
</div>
<div>curr1_input &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; device/ &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in1_min &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; in2_max &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; na=
me &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;power1_max=
<br>
</div>
<div>curr1_label &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in1_highest &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; in1_min_alarm &nbsp; &nbsp; &nbsp; &nbsp; in2_max_a=
larm &nbsp; &nbsp; &nbsp; &nbsp; of_node/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;power1_reset_history<br>
</div>
<div>curr1_max &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in1_input &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in1_reset_history &nbsp; &nbsp; in2_min &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; power1_alarm &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;power_samples<br>
</div>
<div>curr1_max_alarm &nbsp; &nbsp; &nbsp; in1_label &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; in2_highest &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in2_min_a=
larm &nbsp; &nbsp; &nbsp; &nbsp; power1_input &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;subsystem/<br>
</div>
<div>curr1_reset_history &nbsp; in1_max &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; in2_input &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; in2_reset=
_history &nbsp; &nbsp; power1_input_highest &nbsp;uevent<br>
</div>
<span></span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Mani.E<br>
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

--_000_TY2PR04MB3038B868F17436186E36E5559DA40TY2PR04MB3038apcp_--
