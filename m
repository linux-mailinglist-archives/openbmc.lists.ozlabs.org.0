Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C362B207D
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 17:32:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXkWl5mNkzDr5h
	for <lists+openbmc@lfdr.de>; Sat, 14 Nov 2020 03:32:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.90; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=ZRlrpsNB; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=ZRlrpsNB; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300090.outbound.protection.outlook.com [40.107.130.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXkVj61xPzDr0P
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2020 03:31:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B96BPt4L6k3zH7OIdtQnNRoPRivuDhKsDtZRbWOYMf4=;
 b=ZRlrpsNBzpCUaFtOYWXPJ4zIQouqoPJLU0JHdk4UiZ6heVXzd/OXT0HKQHdZGO6Mqrx342pV0whaNdOiREbMTLtsgpJd09gw0RRGG8LPq+6zBXZUxbBI+LFKA4wMQASGXFav+5MOYEkTCQZNABtDN4nwlamLI3u23qaHiV9CrU4=
Received: from SG2PR02CA0018.apcprd02.prod.outlook.com (2603:1096:3:17::30) by
 TYZPR04MB4382.apcprd04.prod.outlook.com (2603:1096:400:6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Fri, 13 Nov 2020 16:30:54 +0000
Received: from HK2APC01FT021.eop-APC01.prod.protection.outlook.com
 (2603:1096:3:17:cafe::9b) by SG2PR02CA0018.outlook.office365.com
 (2603:1096:3:17::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend
 Transport; Fri, 13 Nov 2020 16:30:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.57) by
 HK2APC01FT021.mail.protection.outlook.com (10.152.248.181) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.22 via Frontend Transport; Fri, 13 Nov 2020 16:30:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyOrXzfzQBP3zon5WdDZmizeEFKF3j63rWub6gmYNzE/7rTEUCRxTlNi2k8Q3ZTaJkQFAhGIY7KX853EmMHv3PJKuXo7/wIrg9Ukul66Ng6UAYCX+8bbncWUhcX4kxWrGql6oTe5S7RyCgW/DS2xE9fezDH53XDBIiuJLf6IsIlgcCNWvAF98CQsr6guPi9yWzAJ8XHZL8A9DB4WWgwLqUkFSwh06cmGCjn0imt0iRgu/mh+5QZKXuXv8J0CG/3ox7Rdjt2oCzOww15ceaHAjU5OMumthcEMLRPUjZ0ExiO3mhRftM76R6C4NSurkdv97J48NEcUu2Ca37GisX/j9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B96BPt4L6k3zH7OIdtQnNRoPRivuDhKsDtZRbWOYMf4=;
 b=G+Dm253qv7iS4QMKJ53qGC/JSEZ3F/OmgZP0n/6gvTTUTmfNL51sK2c/iP769dujEbglgc1quqtogCfHirBj0GhaHsaiI3ceToEXojU09+G2gDe1d46O/rp6t0ZkjMuIi5u20X6dEiL463m22M/bAJ+rUKLyAKu6h2vaQ6lJII5oY6Mifb6JyjHAJHOTYzFogbAZtVuWa6V4sNaY1Y1CvzhbqhkqwZVCXpHyXfXKFrbT1DukjGVYPSqnITVqlNtFn8Lka2IrvnLrGg0zxlJ3rxGnawI1pX480ZkFYjBu3eJD4iNemtQvqNOyGj7DNpeSDGNjEYuqIeOSQTfg+sJBUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B96BPt4L6k3zH7OIdtQnNRoPRivuDhKsDtZRbWOYMf4=;
 b=ZRlrpsNBzpCUaFtOYWXPJ4zIQouqoPJLU0JHdk4UiZ6heVXzd/OXT0HKQHdZGO6Mqrx342pV0whaNdOiREbMTLtsgpJd09gw0RRGG8LPq+6zBXZUxbBI+LFKA4wMQASGXFav+5MOYEkTCQZNABtDN4nwlamLI3u23qaHiV9CrU4=
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com (2603:1096:203:5d::15)
 by HK0PR04MB3089.apcprd04.prod.outlook.com (2603:1096:203:86::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.24; Fri, 13 Nov
 2020 16:30:43 +0000
Received: from HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29]) by HK0PR04MB2964.apcprd04.prod.outlook.com
 ([fe80::e52f:5fdf:e09d:fa29%7]) with mapi id 15.20.3564.025; Fri, 13 Nov 2020
 16:30:43 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Fault handling(Threshold exceeds/low) in Fan and NIC sensors
Thread-Topic: Fault handling(Threshold exceeds/low) in Fan and NIC sensors
Thread-Index: Ada5zVYwkmx4kfozTTWK3HwWcCL1fA==
Date: Fri, 13 Nov 2020 16:30:43 +0000
Message-ID: <HK0PR04MB2964AA77874471609F0B25BEFDE60@HK0PR04MB2964.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-hclclassification: HCL_Cla5s_1nt3rnal
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNzhkNWI3ZWQtMWYxYi00ZTdiLThmOTEtZDAzM2Y5NDY2ZmNlIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzXzFudDNybmFsIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE4LjQuMTg0My4xMjMiLCJUcnVzdGVkTGFiZWxIYXNoIjoiTGNwVTRyNGFUOWE0ZHp0eFZIanlcL04rZE5nZ1h2a1pUOVpsdWJHTnBteUw3MmUrWVhETUE4ZFpZaEZka25rOFkifQ==
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [2409:4072:620d:471a:589a:3511:edac:9e41]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 9b582f8c-61cd-44e3-666a-08d887f17d57
x-ms-traffictypediagnostic: HK0PR04MB3089:|TYZPR04MB4382:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TYZPR04MB438275E4A0C924747FBCE233FDE60@TYZPR04MB4382.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: iuAYcI5Q1DkOXAxFSe5TYFVyKveMYDHNptGBoxKtNG1WQ7E7/4Fyb6wik931DHNpV/kLz6yOqm8rhcxRXcvSJ4ZrJr0XGC/lUJZqpE0cKqY+d4krQBio+JzC8qJGKWTFGBYPBn5BWGag8hj1t77WbrCZOVl1zqZvvpPhWPyv3a3GQ3uMlJ3+6ZbdYlFPyh/AGqbmuSFCN1YueOoxbqOAjnkU8t+3rErN7BZyYwzMDpX4cgBNOKfk3NMkPw8YO/vF4nMe7iW4WaT+WSsE7c+lvRI7mFrpXHJLeqgb4JPCb8YKD2XlCH0ENM9a8C8pZCN4
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB2964.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(396003)(366004)(136003)(39860400002)(55016002)(83380400001)(7696005)(186003)(6506007)(66946007)(66476007)(71200400001)(4326008)(5660300002)(66556008)(76116006)(64756008)(66446008)(33656002)(52536014)(8936002)(86362001)(2906002)(54906003)(8676002)(9686003)(316002)(6916009)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 8Pe2gWrD4z8jciAApGafYWhJ0wrTRUBRiw8bJuPwYiXpZ6oEDyKIJlXKXnwNXgwDgTbHNbdhZ8YbJyOoW9WXqx+XfAH0kZYR1pwzbQEqC+d5SuL2NmspWIPlKoJnz8Kd2ZNqwUuLu9DWKgtXidbl7mRNHztNBWyo4EOboWukzB2xZQ/Rbbbp3sAnbGXa0O+MBkGmHQ/gRvSRXd7JqD/cMdu+x6Z0UFYv2Tax6hDhaooPrVOQQP7rEf5GU6cC2vEXINTravnUC0JYykyxZWGdvk0JGigg5z676hOyiH/5Xzg0ObL0IjEkOTY1LUTO7TGI5TG2Jx+68ruXIZev5tA95S+V2Bcv2Kguhdwrm0UZj1e6t+jBBjyIidjbipXVYfRuCKs2z7xIrZurqGHLe4xty8Vr5U7DF6tyUIDguEPXm9aoHea/zy8JVkrCump4nS0LaLlbrKe+3zwfoPXAQzpp+bCg3cUeWGxWZ6za8zU25IQ4zH+EEpwMMDu2NER2m6BZd7O4ZrOHsUrIfcNQ7ywDTwiDBBEDKAdUahOExJ9ASnqOVj8xbgpqUn6zCPYA355Y82waMMhbQPV1s/F/g9ajfnrmyLsalEHYKZgCkjK5nRmfA/X2ikCVKHs8QvOWcXKb+R6uBzepYyfq/rIjNcr4Jd2DIrpWi/uAqWYlLD2r+VuWxZOLTUXWsLC8MSNbivdc/6J2myLW3d7SYgbzLzoj3g==
Content-Type: multipart/alternative;
 boundary="_000_HK0PR04MB2964AA77874471609F0B25BEFDE60HK0PR04MB2964apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB3089
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT021.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: e58f4de4-3dc1-4383-b9fb-08d887f177a8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LNSsMuWaZTikmuCo4S4Qb4rfciQxOnXSIuDDykgBsHRQxsc7kwm6a+xOpAKAhavRecyE5yv1PndLI5wdqWKkj0NEcl4FN9qnWmOqy2dOelww1k8UgFkUTs6Ou1+LiMdE/FvC26G1Lbm21I3NM7kYChTcS9QzQiBevUA8Wzc3sMKPqOXk0i3DjHJx2onrNR7QKCn1MoKIzWCYFPHfiZGwamN+7NbKrWyr9mYwLwIEUq5g+gWIZ7UH/trdHqFSZNqoFuDAfjX+fu8sIurYGNhqV4OmKi7IvFvhnj4ZQSuE9b5r6pSP0OruMg1OsPcDFW1LZFAhHfpPuMO08gYkhB9aQB3KrXizk4MB6PJuJ76T6btcfjbljEEfaueXNmPVwWEGQ1fUSBz+GKD0I1YEx6h92A==
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966005)(6506007)(52536014)(9686003)(8936002)(36906005)(6916009)(55016002)(83380400001)(478600001)(186003)(82740400003)(82310400003)(54906003)(70586007)(7696005)(2906002)(86362001)(336012)(4326008)(26005)(47076004)(5660300002)(356005)(8676002)(316002)(70206006)(33656002)(81166007);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2020 16:30:52.5535 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b582f8c-61cd-44e3-666a-08d887f17d57
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT021.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR04MB4382
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Patrick Venture <venture@google.com>, Ed Tanous <ed@tanous.net>,
 Vernon Mauery <vernon.mauery@linux.intel.com>, "Velumani T-ERS,
 HCLTech" <velumanit@hcl.com>, Patrick Williams <patrickw3@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_HK0PR04MB2964AA77874471609F0B25BEFDE60HK0PR04MB2964apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Classification: Internal
Hi All,

         We wanted to power-off 12 V of the hosts/BMC, if the Fan and NIC s=
ensors crossed the threshold level. It would be platform specific.

        In dbus-sensors, most of the sensor handles the threshold checks an=
d throws error if it crossed.

         So, we are planning to add a new field in entity manager to identi=
fy the particular sensors to handle this fault condition.  Planning to add =
default script in the dbus-sensor to handle this fault condition and this w=
ould be overwritten from the machine layer.

         Could you please provide your suggestions on this.

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

--_000_HK0PR04MB2964AA77874471609F0B25BEFDE60HK0PR04MB2964apcp_
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Classification: <b><s=
pan style=3D"color:#08298A">Internal</span></b><span style=3D"font-size:12.=
0pt"><o:p></o:p></span></p>
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We =
wanted to power-off 12 V of the hosts/BMC, if the Fan and NIC sensors cross=
ed the threshold level. It would be platform specific.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In d=
bus-sensors, most of the sensor handles the threshold checks and throws err=
or if it crossed.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; So,=
 we are planning to add a new field in entity manager to identify the parti=
cular sensors to handle this fault condition.&nbsp; Planning to add default=
 script in the dbus-sensor to handle this fault condition and this would be=
 overwritten
 from the machine layer.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cou=
ld you please provide your suggestions on this. <o:p>
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kumar.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
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

--_000_HK0PR04MB2964AA77874471609F0B25BEFDE60HK0PR04MB2964apcp_--
