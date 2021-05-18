Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D82386E4B
	for <lists+openbmc@lfdr.de>; Tue, 18 May 2021 02:26:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkcJ30JYxz302V
	for <lists+openbmc@lfdr.de>; Tue, 18 May 2021 10:26:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=BCjAMC8U;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=BCjAMC8U; dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Tue, 18 May 2021 10:26:26 AEST
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkcHk1MYrz2yXq
 for <openbmc@lists.ozlabs.org>; Tue, 18 May 2021 10:26:26 +1000 (AEST)
IronPort-SDR: 5zGQXVAZ6Lk45JHMxMupPasloggzaxWnTSPI6rE5+NekQtF4+SkeCTqhiQTRPqoPBzuCjanCNX
 ulVbr+rg2gvQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180197835"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
 d="scan'208,217";a="180197835"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2021 17:25:16 -0700
IronPort-SDR: GR8gu81TKRT6AYY29j8Pf76uM/Wk/Ge1ktXatKJ+N8e/pMsP1Ly1BXfHwW4wZQD4pR9EYMV1I0
 p3NnRI2jdudw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
 d="scan'208,217";a="394652435"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga006.jf.intel.com with ESMTP; 17 May 2021 17:25:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 17 May 2021 17:25:15 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 17 May 2021 17:25:15 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 17 May 2021 17:25:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=isecDxlt2byXayaCE3ce5smN6MO/224U0l1wGu9CaGEZnI3Tdg2zVyzQdk1bdESSLVB0dMKUlgTcPuh+FSWWp6qq+aPcZJHy0nF0AZ+PHMWg3VBMxiQ6nsBxDGEb7UaeOcY67qpWS5XW7AAJVZpcNaRviFWTIzZwmDRNFIPpka8nUEHsdR1+QXaVdv3TBlRTpi9dTevShYbWhpvwJoufo0OD1h/g71OgXO9ONsMZp1J1ilja32woEV70ZxhXCoaogQ443RhXjXt31ldUjqusemvLeCm045rdVlBVutjgKFJ64IFwRYJ3RdsHlxcQ/jjhC62BGqz6gJkJ0fO5GZoVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/roB9KnYX8uDIyGDsEwt8ac6Z0HNmGMbCO2MLzAYyw=;
 b=KiPX4pCggopG0MaG021jUtom7bv+8Rd9g3TSRBBMyomtdzwZl/KWL8qaA141LoRG4gYP4vpsPV8v5K1x0T734fEJUvObux8WNPLnIMEFc+v9Z65qxythtN8cycK9HMpqiczL/uu/b63hcxwVkM7+vNDz8ZgH5pArA+iKRArDHZC1s47KQDW6kqXKkiE43/t4a1GtxME/79UcpEbBUj8Qmz8dw9lx+R4rpj3sigpMtw4YxiNK5j5DtHz9VlyLYtYI290rMZ9UfYWGwFejJCqhN24HWJMOPbIaEfoNTyx5OJuZu/pQW6AuReIiFNiInKdjF1F8Cjpts+fzsG/VVFnZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/roB9KnYX8uDIyGDsEwt8ac6Z0HNmGMbCO2MLzAYyw=;
 b=BCjAMC8U9gAyqt4BH96PZDwkO4Ux0gLXSpyaat15+jCgOrgLozqVaAeLnhH/UunCzrJCj6Tj0Kzqe60BYgtL5b1S1AQTW519Jht609X1PSMQ0+D/qxqH9cxi5/y3aHcoS9MaMiCT1sbhF8s4FDgv5w4DhzaFpoBJQzEq6T4lggI=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM5PR11MB2025.namprd11.prod.outlook.com (2603:10b6:3:8::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.28; Tue, 18 May 2021 00:25:15 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::c4e3:2a3c:25c4:2c66]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::c4e3:2a3c:25c4:2c66%4]) with mapi id 15.20.4108.038; Tue, 18 May 2021
 00:25:14 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: phosphor-pid-control handle missing input sensor
Thread-Topic: phosphor-pid-control handle missing input sensor
Thread-Index: AddLbpJMwgo0w021Q8OYfNSygi4IQw==
Date: Tue, 18 May 2021 00:25:14 +0000
Message-ID: <DM6PR11MB4410F8929879C9454CD5CBFC942C9@DM6PR11MB4410.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none; lists.ozlabs.org; dmarc=none action=none header.from=intel.com; 
x-originating-ip: [2601:1c0:4f00:7190:31ef:2d61:a663:df4c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 134de639-9737-4c7d-97fe-08d919936845
x-ms-traffictypediagnostic: DM5PR11MB2025:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB202594AC67554D3E46368634942C9@DM5PR11MB2025.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rMxWa0H5qBR5RWpZq0Z6TfI+pnrpKk8042+pNPMcljY2QBWt51GCVJZNbsisIYaUZhJ7crRTGZ3Y11k4HyA9KQGABK9sFKhSavXucvCHe4TxK4laWc1GVBMSLDDlTZA+6HuwI7U+vtNQHITbEEbD+Fj3/MENASsaORfouG7KJYZUlDmxkdbKSzwAqEiaA2nuYKVh1hODRag9lKsQHJuBV69ofWDPg3PJI9EVfgdYEgN8eqjR/9UZXo5w/khKuebR5pworVJueucWkCG84pTw5wLH8r4eINpuadhoP/o9uaEcl5QkVZs55xo/JOqpUzqdxNPPbh0DpNyaKP4OKr//i+KDzXMkvhXxAJ7KoY9hvQwvhHbORHkfHpT2kWXmokaV6bCiS+A/deRyHvy2nOB1H91JwB8s+tK6FARgfaj7Eon344+5QoicZLHgQ4IxFpjrC4X7rK6divEnwx4CKMrXbYMpWEWWfz37MG8uzQq2bLvSLmq5GsnJPQtDBm5YHM2Rxn3V7KAjqME52nRiTJbQzDiyNo8Gfqv+5cjvXMEqu2TURU+JuUABG2VZG/pXDlbSgzSU+EzDS9z0ukrb36hCRJ50OCR81xx7m1TcaQE97Uw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(136003)(376002)(366004)(39860400002)(107886003)(6916009)(9326002)(122000001)(83380400001)(9686003)(4326008)(5660300002)(478600001)(52536014)(55016002)(76116006)(33656002)(186003)(66446008)(66946007)(6506007)(86362001)(71200400001)(316002)(66556008)(64756008)(2906002)(66476007)(38100700002)(8936002)(8676002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?P1UE9bN4TSi0Iv3x2ARALC5aEjQDdoVpO/lpkXJUdATPNP3qamntUmuTA3jc?=
 =?us-ascii?Q?dlYXSNZ1w2DPOxVkprThzM8zXU8cbMZlKSzcqlyZXj/h1Wj9RKk0Zo670gqE?=
 =?us-ascii?Q?TiaOsXwON/DQn14AeV3TSBxVRyup0x1s3O0CtXKJMJmllOE2bSexX1RDBeV4?=
 =?us-ascii?Q?pqjpdt6e5CFv71HnlpioYB0NxMVSlw9gVdhXXsktJYcYmH/ZFkzcVIrG0Bkk?=
 =?us-ascii?Q?I/slWZfisiqpR0SD26dUF11T0DVcGQlxVSpXRh59LuybGZ6alxqhVJ7xxf0S?=
 =?us-ascii?Q?uaFqtV0Hs0QxEy4Ii9t50z92IFKGh73ClBvbPeYHYxI8DdDYBPSKK5heL2oP?=
 =?us-ascii?Q?xVbMQTshWaKUEcn0a7v7kM6CagvTEfKWFFfMijkmZu95NaDhLueXsexng36f?=
 =?us-ascii?Q?9FVM/hfwIhobmblACsCzKgM77kZCg9xvZnXoFwpLdEls9dODhi7mEh+UjUX8?=
 =?us-ascii?Q?dC/VW2uaBBG+Hwz71pUR7yFLL7fgKhrjSOTt6FRKizugdFbkMZuaxmcw75j2?=
 =?us-ascii?Q?njXA3jaBCdFP2RCQqiq8GdwhxIDfMwOh8ho0F/nPB25rjCiZvNynF99ZxDqG?=
 =?us-ascii?Q?XTaNJxcU9+CrvlmaIL0XA8Jc2J4A1COEq4mHvXoBZnnhQp0hkqf24bDy9fiv?=
 =?us-ascii?Q?lm3+7fcuaXPpv9jNIFmyC9lGQgJHKJXYeK4h+ayFGyOFTVinO36Nqma0iRED?=
 =?us-ascii?Q?IrM1UXst9UIZ2M7selocf9ioO9e10MXHKQHs4weT2/EItaG2KWadiu9aGDca?=
 =?us-ascii?Q?rFkhHSMAiUTWYiLvqEVasMVDyrGOitreTp44sRMf8KKXLwnkNtIZS6BHp+Ll?=
 =?us-ascii?Q?nRSiX/fZ2hgrIdzs8w3mj2b8SQULwlJbeO1kkEO16lTg3GHDVoZku1f9Zj5o?=
 =?us-ascii?Q?X592rva8AJPeKpVhNFaAEZgo+iNHGKCQPzq871qLjW7QtegY61Vli8VpELiI?=
 =?us-ascii?Q?NIo9xK0Rr9np17O4tyaLzf9W9eoW/uRgjQoayX+GEWlaepvmC/lGSha6008a?=
 =?us-ascii?Q?OUFRxl3seXLKnmP0tMKJvXjtJLBATg7J4gaUJQTf/FP1FcD4zJWUZCNJMGhS?=
 =?us-ascii?Q?zrA+ghiwezsrX9iFxAdxdWRiUhAd/MZpI3/demXatLbLQHP/V0bULtdnYii8?=
 =?us-ascii?Q?vrNTTG1JRQIytJca/D/7CCam+n7G8Qs03qdwDuMkhPIMN1DiDG43i5aV8y6h?=
 =?us-ascii?Q?+O4x9OgYpVVKCtVjjQ+Y/pMJFbU2Hhn3H6f7l2O8gk4T0f9x+J9GsvIG3E6W?=
 =?us-ascii?Q?1D8luSgFz/PDSqH6oFw0kApKYuxVFTu2Y6GDrE57Rla6qmQyoF3pudggZ70o?=
 =?us-ascii?Q?W3R2/5arGwKqkXu4+17vR8j92Cr/ZcYEitU+IELGU+olizD2tAumv6p7ok7q?=
 =?us-ascii?Q?U+u+vVjh4LFB4dpBqZF1liHE/9R8?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR11MB4410F8929879C9454CD5CBFC942C9DM6PR11MB4410namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 134de639-9737-4c7d-97fe-08d919936845
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2021 00:25:14.9314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gne1tBW1R1VGrjEW4fM6WRlu0KXsJJ8st/qYpTm1O0pM1fgfrQrYLM/6z+G0dSkLpecRQZToQlKfBr5cfUe0XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB2025
X-OriginatorOrg: intel.com
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
Cc: "Ren, Zhikui" <zhikui.ren@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM6PR11MB4410F8929879C9454CD5CBFC942C9DM6PR11MB4410namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

We use EntityManager and dbus-sensors to scan for installed hardware and se=
nsors. Phosphor-pid-control is used to control fans by creating passive sen=
sors that monitors the dbus-sensors objects.
We are looking at adding the ability to detect missing sensors due to some =
hardware failures and boost fans based on the zone config.
The challenges are

  1.  Correctly identify sensors that expected to be present, but are not d=
iscovered.

For example, not all CPUs are populated on a baseboard, so simply adding a =
"required" sensor for CPUs will not work.

A "required" sensor need to be tied into a present detection, which may or =
may not be supported by hardware.

  1.  Notify phosphor-pid-control of missing sensor and/or "stale" sensor a=
t run time
This can be accomplished by dbus-sensors creating the missing sensor object=
 and set it to failed state.
Fan control also needs to detect any sensor that stops updating its value a=
nd treat that as a failed sensor.

I am reaching out to the community to see if anyone has already addressed t=
his issue or has some design that can be leveraged to solve the above issue=
.

Thanks,
Zhikui


--_000_DM6PR11MB4410F8929879C9454CD5CBFC942C9DM6PR11MB4410namp_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
/* List Definitions */
@list l0
	{mso-list-id:489828516;
	mso-list-type:hybrid;
	mso-list-template-ids:1084414310 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1
	{mso-list-id:1288781574;
	mso-list-type:hybrid;
	mso-list-template-ids:300286928 67698703 67698713 67698715 67698703 676987=
13 67698715 67698703 67698713 67698715;}
@list l1:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l1:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l1:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
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
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We use EntityManager and dbus-sensors to scan for in=
stalled hardware and sensors. Phosphor-pid-control is used to control fans =
by creating passive sensors that monitors the dbus-sensors objects.<o:p></o=
:p></p>
<p class=3D"MsoNormal">We are looking at adding the ability to detect missi=
ng sensors due to some hardware failures and boost fans based on the zone c=
onfig.<o:p></o:p></p>
<p class=3D"MsoNormal">The challenges are<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">Correctly identify sensors that expected to be present, but are not d=
iscovered.
<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph">For example, not all CPUs are populated on a =
baseboard, so simply adding a &#8220;required&#8221; sensor for CPUs will n=
ot work.<o:p></o:p></p>
<p class=3D"MsoListParagraph">A &#8220;required&#8221; sensor need to be ti=
ed into a present detection, which may or may not be supported by hardware.=
<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">Notify phosphor-pid-control of missing sensor and/or &#8220;stale&#82=
21; sensor at run time<o:p></o:p></li></ol>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">This can be accomplished =
by dbus-sensors creating the missing sensor object and set it to failed sta=
te.<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">Fan control also needs to=
 detect any sensor that stops updating its value and treat that as a failed=
 sensor.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am reaching out to the community to see if anyone =
has already addressed this issue or has some design that can be leveraged t=
o solve the above issue.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Zhikui<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR11MB4410F8929879C9454CD5CBFC942C9DM6PR11MB4410namp_--
