Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9454A76A07C
	for <lists+openbmc@lfdr.de>; Mon, 31 Jul 2023 20:35:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=marvell.onmicrosoft.com header.i=@marvell.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-marvell-onmicrosoft-com header.b=GmapNLJM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RF6PJ3dRFz3072
	for <lists+openbmc@lfdr.de>; Tue,  1 Aug 2023 04:35:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=marvell.onmicrosoft.com header.i=@marvell.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-marvell-onmicrosoft-com header.b=GmapNLJM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=marvell.com (client-ip=67.231.156.173; helo=mx0b-0016f401.pphosted.com; envelope-from=sheshas@marvell.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1189 seconds by postgrey-1.37 at boromir; Tue, 01 Aug 2023 04:34:57 AEST
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RF6Nd322gz2yVg
	for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2023 04:34:55 +1000 (AEST)
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36VI4gZc005319
	for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2023 11:15:03 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 3s529k5w8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Mon, 31 Jul 2023 11:15:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAbSKOaAgwEWDSY2k9F3hrgS7eNyutogBojwkFbrOdgSCgCyYXUMqIaD1UHQBT1gNIZfmzsYJcPCnrTU9XM75P1GvfCZdZ2JATGnG/MsZjhLA0CXqbkQ4TyIu26Tj8yPquF4Y4xt6qntDcvFnudz+TzJ3qpeloCE05+AWwPJ2WQtje6FSZi4U5eVHxq7m0piyak7ZI/ARJMeldS35VScaZUlb5fwemXx151C/EosuPzJrqjGPxkmC6UnKBo6AihqJStqC871OpsVZlZxt7IXOnxoiApfCi9B7YO1QpeewNVP5NPD59urzJp+7Oo8QEt198Hy39UFw62jssPx8wzAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+6NlLPQfWN4OjrF9LAfpt7ra1ffFb9oJpQBgPZmYEXA=;
 b=iojjPUo82S8lWEsYen36dBIoRQ1MwqWgUzwBxUZMEzbPL7EL4qu5IcMM4uE/QpcEsS5I8NC5/7TANnw0IHHEq219aj0oWyjwU5A1NnP+d0BBd0mvP4KxTvGhAix3TA2hoDJ+qmPmuxENRMVlJCSmxE1pETUbkL4Zc21IfjlCxQSiOO7in2qMuLQTtVmioYU6Vd6k+7ST8eUOOnSVbL/crW+Pgkde1SoVUvZXsojX9atiIjkludFSkOeOW7HJsgU+aJVu1ZDNpYhbAo2ZW9dVTH9W62m2XaDCd9mu2gfDaL6lHNm7dJqNCBvYAKC56o7m+W8aoKLwT0C0OawibngIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6NlLPQfWN4OjrF9LAfpt7ra1ffFb9oJpQBgPZmYEXA=;
 b=GmapNLJM2wHGqxoXC9S7J1sWUJyWMJA3yYnbbK/ZWZ5SATtdyLsUlzj7S9oofF66PwOWeMFlYYTjS7sNLXC2U5i6LsvFsih2iTGzoJstXDImHTbO2ESQP1HrL2Kr0WUfO4uhV/Xj+u/JRf8hVK55QbnsB/b7b+zKgzsFCvtvnBk=
Received: from DM6PR18MB2844.namprd18.prod.outlook.com (2603:10b6:5:16f::29)
 by IA1PR18MB5516.namprd18.prod.outlook.com (2603:10b6:208:451::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 18:14:56 +0000
Received: from DM6PR18MB2844.namprd18.prod.outlook.com
 ([fe80::5a43:d689:50cb:1689]) by DM6PR18MB2844.namprd18.prod.outlook.com
 ([fe80::5a43:d689:50cb:1689%4]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 18:14:56 +0000
From: Shesha Bhushan Sreenivasamurthy <sheshas@marvell.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: MCTP over i3c
Thread-Topic: MCTP over i3c
Thread-Index: AQHZw9ogr967AnDKOEG64/3c7mVJ8w==
Date: Mon, 31 Jul 2023 18:14:56 +0000
Message-ID:  <DM6PR18MB28447289EC30EEB56B81D1B6AF05A@DM6PR18MB2844.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR18MB2844:EE_|IA1PR18MB5516:EE_
x-ms-office365-filtering-correlation-id: f908a304-12b5-4269-9872-08db91f20b76
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  CLvpPItu2Ak+VP2IiYxGkkSZWYabML35FPN3oi9BJY96wrz1UsNMspd3dXIyMWf7VLLAT9LMUOO7xAQipBWY7GjTB1n8ioTVLNyeX0lsNOMjUlxOrWq2wbe7951U3g5DP9p7pgVy5NwOD9yEusnKjXs6vhVxbpFMZdgghE58ilMHqAfll4QjLaC80hvHqGz8t7eV6EqHnw+1oBhhHq2hqTSmilTlh/LydWWyW91/qKss/9ioCVxLG5jxSwFNVFShVUWwk88nkR8XVLsYpQRgTgczomUXhABu4dKgl9ukbzwQoDZdcooIkal0d7uEh7pqsEBslXCN0CwZwN/DDDPuvGai9MrPe3MwP7W0qQtouE54LN5BVr8j62eEoBhjaV5NKDppwc0800fL16kUq7emjhfLKPsH/77S9Gqv0e6Ux/4LoJDOmduMnHgDPOrynLfXGleZeb1ccBimJHRs4KWKUdH+DiZvzUN7vy36mxP8BW5I4ftEpVGnQDP9bxZ/sei8w4f/h5g5poFnnXH3swzrimtB1fz5t1w5zGEFKkt4kpG4D8k1MgRIdnu0fSAdVXbV1ple3TOrfwhPbfyjn8DBAkvGHtqfFvXdR7Oa/4tDNoBsOqAGMDc4PiRWrAOkmYdX
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR18MB2844.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(7116003)(52536014)(76116006)(2906002)(66476007)(66946007)(6916009)(64756008)(66556008)(66446008)(5660300002)(41300700001)(316002)(7696005)(71200400001)(8936002)(6506007)(8676002)(26005)(9326002)(186003)(122000001)(478600001)(38100700002)(33656002)(38070700005)(558084003)(9686003)(55016003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?GrB9ThzLn81ZJNmDyrnmpvTQ8aYRt5AT4qTpEzgsfsbjgaanEBxoic/CAL5E?=
 =?us-ascii?Q?QiO3699mOObketfnneZvC7Ww2UXA70gKhvWr9SyJne/OKnpkQj/Oes1YozX8?=
 =?us-ascii?Q?YRGmqul+xswIJUZ+Yh4ILWqlGEU7lgrEnbf39shLP78sgO2x3PeB6i0WTk3O?=
 =?us-ascii?Q?JxD83Whn22yoyp5j9/lMoX+oRsM7vEbUkNF8CkgG4EDSig03jD6azHRfiNXw?=
 =?us-ascii?Q?A4qECVcQ6WRMqoIcUMqA+q/UC8AYi3uHqRjAYTvBzOPaFnC9IHrwqw2ZdJS4?=
 =?us-ascii?Q?d3+I112DhUogfX8Yy5yY0MPGxEesWoc6shXyVD5sdH9IVzVI1l8B1CG1bk4a?=
 =?us-ascii?Q?R8IyL9xWr+SSJXwXgB/ZtnxY8S+uXi4TrD86mwGJQrusfNupuICDrKCJiXAA?=
 =?us-ascii?Q?qmfUjhqbAPf9hHhWujEHoGimNxxvGA7tCGJfbQel/8z7dasDpG1EUz8AAybX?=
 =?us-ascii?Q?eCyrs5Q1Ml+Ip5zzD0SdE3WTPHhQ0UhEqwI53/cohA0hA0SQOoy6iw46C9pg?=
 =?us-ascii?Q?FKtJSXX6Q1fOXysrOJkuwjhR1bYY0XVf1+PhuV/XLQrCLt6r9HZH2j6DHS1w?=
 =?us-ascii?Q?1wKfB//GahY+hnJdREePGUUGwG05EQ2tWexuYCldNtQGQh8soQAvQ4gIGq9q?=
 =?us-ascii?Q?EuXpoldt2onCb2Z0eA1dtHleaejkDGtV2hKcbbquUXNjw0UPNryGrhYsZXPU?=
 =?us-ascii?Q?APowkGbb00/Ckz+LotdKviO0Bokonq5k06zeUFjSlqfU/NS+N/MVGbhReEnf?=
 =?us-ascii?Q?ENNUy9k+i61MEZFmLs+EzonoM0Z2yWYoHhyAisHqhmsRa1riviPmgDkCEABR?=
 =?us-ascii?Q?Y1Xsum5AC/hLMYen3XSFH7EEuldq882/E2VMe5zhTuTbLoYx/H6SIYnFiVVq?=
 =?us-ascii?Q?FP8O0Xrv3N9eG/9TpjdrANsamS6iF19kFgvaWxFcEcWADeN2IdSRH52vjECb?=
 =?us-ascii?Q?iOzpDzKwOLDf/Ka2acleeUF5CZsCWzId8kOo928+FIJdgbPkS+1mxM3Sxtlt?=
 =?us-ascii?Q?+9Uxg/+BuSRm9Sfiq9KydIFWc3c/Ozd+ta0XHLUg/OoKaR8/p+v7osh5r9h4?=
 =?us-ascii?Q?4whjCdEVEsuDi62IXA1kw39laCvJBqBClhljELP9B5iQu6VL8eFKQmTscPRM?=
 =?us-ascii?Q?WaY0bN++TqA75FpR3zK8CpjivVRThllgWb4ZSuzPYuiY1kZjFqcPGVsITCFZ?=
 =?us-ascii?Q?IUnUszIecUObNB1dHZjzPFmSuz+nnen/3VIUQ6uUTwztO6+tsuJqJdAGOslA?=
 =?us-ascii?Q?bpwUTCrMQr9vc26fNhHiZ8QsrTX+n8RlLU526QUlQ46xnnYLOTECS+rEw2fc?=
 =?us-ascii?Q?05KlRF6f1w2758/a4Z2abF51foSLrYfxZMEHV206+FNl+JQByckxqYcitqX4?=
 =?us-ascii?Q?4cSnYqYpPh32Dbc62YZW1D9RbxvGxqtnZtaY4LG5Y5Q+RJHnezQEAUAmgUff?=
 =?us-ascii?Q?CTEX7C1teBRewkNjUIk9LWpg59wQ6pgmpxnAWtX0qfPk2IHLkYzUMcbHh1Uv?=
 =?us-ascii?Q?ZwWNoH8Ry1bPAnTFENF28l0Rk9+c1bk2g5dirGxvdrRSA+1VAkcs8wzgRHIH?=
 =?us-ascii?Q?7eYStjKXhsB74oUmTSlL5bljDsDqIkrnH+g74rkw/edeisCNB2/fIxFusyTv?=
 =?us-ascii?Q?wg=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM6PR18MB28447289EC30EEB56B81D1B6AF05ADM6PR18MB2844namp_"
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR18MB2844.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f908a304-12b5-4269-9872-08db91f20b76
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2023 18:14:56.3128
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: olkChT6W3NdGUOr1OLV9SfrlK3ZM8957zDCHhxlPQbyN/sUw7hwL8DarK39lMWQav/I8JEqxyEoCjBB+NwkUFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR18MB5516
X-Proofpoint-GUID: lreMUUVGdVBs1PjHhnXuHICDoNi8aGjj
X-Proofpoint-ORIG-GUID: lreMUUVGdVBs1PjHhnXuHICDoNi8aGjj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_12,2023-07-31_02,2023-05-22_02
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

--_000_DM6PR18MB28447289EC30EEB56B81D1B6AF05ADM6PR18MB2844namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,
  Is there any effort to support MCTP over I3C in the openBMC, particularly=
 on aspeed HW?

Thanks,
Shesha.

--_000_DM6PR18MB28447289EC30EEB56B81D1B6AF05ADM6PR18MB2844namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
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
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All, </p>
<p class=3D"MsoNormal">&nbsp;&nbsp;Is there any effort to support MCTP over=
 I3C in the openBMC, particularly on aspeed HW?</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,</p>
<p class=3D"MsoNormal">Shesha.</p>
</div>
</body>
</html>

--_000_DM6PR18MB28447289EC30EEB56B81D1B6AF05ADM6PR18MB2844namp_--
