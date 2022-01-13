Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BBA48E120
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 00:48:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZh2K0tXRz30LD
	for <lists+openbmc@lfdr.de>; Fri, 14 Jan 2022 10:48:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=InventecCorp.onmicrosoft.com header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-InventecCorp-onmicrosoft-com header.b=JPSRpT7D;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=2a01:111:f400:feab::718;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=udupa.ashwini@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=JPSRpT7D; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20718.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::718])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZh1p2tgFz2yQw
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jan 2022 10:47:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WdPYVnK6pNf3ecW3QFbnqlAHBunoQ9EgttRdpDiC7SaOw2/o7WcnTcy67fRdy1OLwU7oeBPzKFMBM+giqwfUbpaxutvPT9UFvIfCy7VxQBraUSm7iMLoh02URdnfGDBcMKnNJFKBXjz8qjWHyDpy1DaKliA5hqj7tOM5WPHtyXxw37uUo3fW/HZoyw43vAAkW2VBV+94fbwLsyv4MgpGkOXBnb7w17sZsyS87MC7EignASlLAJt9wuP5QNAs5UPjRbXjpxvbID9ZoMvYSgnj3xjXQ/2rseKYV71KDxno47WoQ7anvyVI8c1il1HgBrN5cYxKrweEpybfiBeZSQ7/lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkH3u7vbRVIO/MiIV5BJqSQCs6Tmag1hiGN1wEf/ze0=;
 b=J0mJXwjXyElYxV0CCXH7eAE9i8vnwCeb02NFC00bwyhdnNil4J1XaNdRzNwXUkvwQ9d1zOUGCz5LbTvvWPb5ZzBXTDjRNDi/rKVMRohBU9uHkx3stUfg0tsRwguJNaePaq6eW7NEQWkvJph+HlmPQ1vBcEHvX65peawmTJCg/EufNXaEdR3OmfVNBo+xilPF/rld6fpoX4v5Ct1lN/uiaSIdguo+aE6FMkNR4wH8xi40z8/j62jkcn2Fg5KRDG8Ibm6ow4Vy6D/fuGYmilowD8i/fJd+4e7km+gVl28HJ1iPodJSJs/NhcJ/jmkVNs9lS0p8O26rIa0E9HF1yG/Q9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkH3u7vbRVIO/MiIV5BJqSQCs6Tmag1hiGN1wEf/ze0=;
 b=JPSRpT7DBY1RHnp3KC3/j98lmzKOYi48eysOQNTT+HaOTSf9BUxaTNKb7T4Pv1nW+gJvCKZuu+zWnSWyZMGgHJrl5acp7cyQzxdOXPb1r04TgtcjrvA/Zl7Qx7Kz56tAG98Jqa+o8GbhOooL/QxIk3qc/WvD2tduXCH++zMApMo=
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com (2603:1096:4:59::20) by
 SG2PR02MB2666.apcprd02.prod.outlook.com (2603:1096:4:5f::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4888.11; Thu, 13 Jan 2022 23:47:11 +0000
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::380a:d799:d1e4:9f78]) by SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::380a:d799:d1e4:9f78%3]) with mapi id 15.20.4867.012; Thu, 13 Jan 2022
 23:47:11 +0000
From: Udupa.Ashwini ISV <udupa.ashwini@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Redfish collection capabilities
Thread-Topic: Redfish collection capabilities
Thread-Index: AdgI14zJNjq++54tRPG5Sh3X9hEQ7g==
Date: Thu, 13 Jan 2022 23:47:11 +0000
Message-ID: <SG2PR02MB27962E46AE874F41055B5F3785539@SG2PR02MB2796.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inventec.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0cdd3488-7222-4c32-af99-08d9d6ef04c0
x-ms-traffictypediagnostic: SG2PR02MB2666:EE_
x-microsoft-antispam-prvs: <SG2PR02MB2666D2AFCBC7BF85DCDD64C185539@SG2PR02MB2666.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qeSuTGpt5iygj0h61zPXli++9F+cdL9At9KbQGH13ho+cV4LlLR/kdbLvzkUcCmwHAS2Z5HLs/muMdfUNvlu0LiHg75FUIVvvz2HyFSI8tV1K61zO5FAOvyc3q3pScTsIMRQq3YzLRfCBn73moy4BJH5RpWi33jh9hVoO8iBWUBWJMd08PchMxHb2kddwaPT7JNaP7bFGs8KMJCu5NEOos0NIsHN7bJnjoCRpqBKvsoXo7/npzxB2daxi+meEyBhyBArRtkBwRWmrDmJBYW/DAWdVs9hGYo9Me0KkSKuRB0s/h+0nCTLS0YgEVSrFZtGRIgq/t8N9rzYRYVWnRbVLWvvbB89hrteNJ2hfYFOKMAipySVKV3qC0WHLYstyeg70HD75AJHydKLIkBZWmkPVIyp9iKYDFL5QzGSU8SXaUfzDkEWSETOF2gmQPpQc4E7aS90muMws8u98IlpXfMFJ9mT+CAYzlRJ+TNct62fJ5yE5PeQbx3lqbQ3KPnCr7AlX6uyt2w3NehdpnN5LH0e92016lPXTwYl8ycwP+WZ37nSh+7pnL+0YRSsXdc+3dTgcbZk8AqE8/VMFtQhdBjEA/L3fcpqAOb/L+1aqo+ZRyl9eiqKyQ8znvUhhUhSrDbLW+XCRdECZawGocDvAtNuRdwV2THeUlGSISH+nQASbpOs0GqV0pYXd+Y4F8KHo2eUSDrBk+2oi+FCgjE0+AHwmLtZk4/I3JYbT6vIbpHYAQKmNDyd1++BtfaLCM6JFqpOSO063P+LMX6y9LwaYHmhR3uk0WF/czXSJenhtI3bZdw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR02MB2796.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(166002)(9326002)(8676002)(558084003)(3480700007)(9686003)(7116003)(8936002)(6506007)(2906002)(38070700005)(7696005)(33656002)(186003)(5660300002)(52536014)(71200400001)(64756008)(66446008)(76116006)(66476007)(6916009)(66946007)(66556008)(38100700002)(316002)(122000001)(55016003)(508600001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?T2s/gH/FpOB3DFxan4igpAyWaEymjfpz6IQep98fxeGUk1/cFVFoiavoVrGE?=
 =?us-ascii?Q?37yOvWzuCAbZJS+DyNzLrvOmp74fdjYlxhGa9cJhmiPbepe686czFY1ZSloC?=
 =?us-ascii?Q?10VSRz1lYpJy7viALPQzcd1VA+j8J0eV7BaOUKQgwWCe6l32PGFhatIi39/f?=
 =?us-ascii?Q?0ERF1BeDjmx9JjBMApVfASXdro68L9ztyKgvtZNaxTGI5GLh8zSALF1juMtA?=
 =?us-ascii?Q?Pyt/DWMMvED8cXIdoed4iZ5/M1YGbkLNNHjmiOjj47z+tqlyuDhJE9f79qQ2?=
 =?us-ascii?Q?+qy/9Qu3x3MH1aMZKGX+zUPGv5L078+WyGbiS5lGWWYE0yM/s05zT+tRLV33?=
 =?us-ascii?Q?9ZXxfcQ9G94KwL9wSSa00yE42y+vO44Nd0sl9lzclG3NGKph/S1VHda2cRV8?=
 =?us-ascii?Q?abT5X1mmUMs7xnL/uaaFqCrQCDwHO43nXihLWa8WBi8xfJqAav6sQ40+shWo?=
 =?us-ascii?Q?M1w9Leyl+bb1towTu8t9qKFql2dYbrMRApLS7/NpdM7Df0sZ5DaBKxfz5BXN?=
 =?us-ascii?Q?DMmmQoLYLr30GLDfXyEhDbf44dTVSCsusNOYx+8HDTx4LUMtEhwVYcFtNlVN?=
 =?us-ascii?Q?PRnat6yjHk7guEpwn2VfL9XDCkgvwbrQvCStgcMr937zjZoE0t0AXEb9W9cJ?=
 =?us-ascii?Q?sQlIOVbuJzeJhYIdr5k8I0ivKny/nMkW707TEkSpE22QhrGYE6DipWfyKHLG?=
 =?us-ascii?Q?CV+g+ceI5bTBu+uS9d/RIAnppUgJbyOLRyKALNrLLfB3fAaGSuPhuwSDbA52?=
 =?us-ascii?Q?m8UL+S73OvW4+igqOhKNqa03ntHzJ5eI+JnPyFEs2/hSuJW3SIkMdRRn62KU?=
 =?us-ascii?Q?LJ/Zgc1y0kqWtbNbfM4x3KcKnGwl16dqbGjAU8BS/eM/BL/s4+2MaBjFIDLf?=
 =?us-ascii?Q?03L3y9FcXXEa/8WteOnpOxnuTa4Z0d6nxEN96ZV8wTGKj7X/QEGtfIX6UyUs?=
 =?us-ascii?Q?epP8mxh9ZrokaeM9Rr3TbHL90203r7VqTKWlsDYnIC4v6y9Mu2vNoox0uUyZ?=
 =?us-ascii?Q?EXhD+uI8do/UX277AlSrU/6i83KJgr7FbqKKq6kJR067CYypoi9utbWOfAkj?=
 =?us-ascii?Q?gX3OVsn/KYjKz+vxRl6gtpV45XVHADhThmyPAWiBorztoI2IqsVZc9dES4yd?=
 =?us-ascii?Q?0KVGin+rsOkGZ68dnVhA7q1DxMmI5vwOc+qCUMVG6ctiPVbvDcnnAtwFoiPj?=
 =?us-ascii?Q?v8rlG6aNO68HHrU4XVaIA8CTfzC1edrkfesnw692iFqGiZDl/9rnsBupiTYJ?=
 =?us-ascii?Q?IF4X2inqRMZfXtr6B9TY0isC04B3+epqeHR4UdYCh3yUinq1MrefmpdthVqI?=
 =?us-ascii?Q?NT3K3fcC4tHV/YiQmsxUGOMUW4CtmhtrUYmq7N0kKWwuRtO05cK3NnWWGRvd?=
 =?us-ascii?Q?cz6sCkaZVQ7dW8HbSYn2Ltrk6gzyzcnzmE1MXkGYJzqpq6cFC4EXh3k01WwA?=
 =?us-ascii?Q?W4YqsuOxfPY7NPg92Fw0lHozI33noja+lm1ME851btFwJ5QwDv/EdtRRLL8D?=
 =?us-ascii?Q?w/No/y9mDCU3HRmuCuqCxYDywrsI2MBLckvqnsA/8cYx8JeyAdlOijMNudZZ?=
 =?us-ascii?Q?J9RFGvsvmIgFN1ZeVwSDaEReuifX6+8p4YRtbpqNn+zQigVRS3uhNhWOopTn?=
 =?us-ascii?Q?Gf8oeLaXaiPSKUpMgM7AmepckN97MNMLsGgFSvDufwpmICvPIqK7n6Xm0YW9?=
 =?us-ascii?Q?r4JUqHMfVCo+7S1tNjliOB0Y0sDobKLzMKdQOAkZX3QSOTNHUZTW+WOdnfsq?=
 =?us-ascii?Q?gIt4mfIi4g=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SG2PR02MB27962E46AE874F41055B5F3785539SG2PR02MB2796apcp_"
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB2796.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cdd3488-7222-4c32-af99-08d9d6ef04c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2022 23:47:11.2869 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: beGbey6cFAEggwOzstrg7OFyym4uCX5iJVgQoDx2j74erDqrGMpvYWYrgqWFG8sA9ofQ90VHQuj7h/g6P2q5iLp4R6oedAUK4h7y6E+GZfQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB2666
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

--_000_SG2PR02MB27962E46AE874F41055B5F3785539SG2PR02MB2796apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Is Redfish collection capabilities (https://redfish.dmtf.org/schemas/v1/Col=
lectionCapabilities.v1_3_0.json) supported in OpenBMC?

Regards,
Ashwini


--_000_SG2PR02MB27962E46AE874F41055B5F3785539SG2PR02MB2796apcp_
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal">Is Redfish collection capabilities (<a href=3D"https=
://redfish.dmtf.org/schemas/v1/CollectionCapabilities.v1_3_0.json">https://=
redfish.dmtf.org/schemas/v1/CollectionCapabilities.v1_3_0.json</a>) support=
ed in OpenBMC?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Ashwini<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SG2PR02MB27962E46AE874F41055B5F3785539SG2PR02MB2796apcp_--
