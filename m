Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D470C6E0DE4
	for <lists+openbmc@lfdr.de>; Thu, 13 Apr 2023 15:00:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py06z4W3Fz3fFr
	for <lists+openbmc@lfdr.de>; Thu, 13 Apr 2023 23:00:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=M65XpGAC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::614; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=aishwaryj@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=M65XpGAC;
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py06M4gZ8z3cBX
	for <openbmc@lists.ozlabs.org>; Thu, 13 Apr 2023 22:59:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkeBmbOy2P+U6BGMzHzpNkZzBQcbiCxVWelw22u0eufAjHhek13l2whMelkkUGZRELotzmoqvnx8DlVzU+rcXeiinDWSUYU90E1C9GppkWWCCRUrYV8N6ahuDsAUaXVkaj41Wu3WPtIMxn1hr73+p+0SIyPEMZndzoEQdbVqvq4QTIjR+16skAEiODk/RV4d0eJNpnbiwHcuRbSsd+HsV4DcOWSkNmDubu2h/dDtx9WVm2OEVTlk7ubpjBx8CzAAP/SpGWRCLBF9duTG0S+mz2W5J6WtRBRL0ib7YiSmOCzmQb4a7FQgveJvqz81mB4EARojqRKUKJUUhj1BzZMvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D1IRx03Chy0L00e5DcHuxgicM3k4eHe4fY9l2Nw894w=;
 b=erD/AbAmzjkzWM+4zWEp/LfmDywkAOtbh+6sSnC4Qi5c+zKhWCRv7zGIpt++yVJom7q9VP4hhgHAVG1AFWN5IGwP5cm7D8H9CsNjtVuRn6wVV8Y2HZ24IiZmlKhK5fYmK5ajyNYH5A4eyTNMKJxAEbqLQ0mGRvVaNrTqOw4R6bHgv8Px57K8f88ES62VI8SngWTTplKDSPPvTf0RsILxQetYj2BZuyphlIYuVPJiL5JWEENDEL55Ku0lvX+7llTE3hmUKocTTn5w4qRCNBybg1/sk4pL/8rY1Qr5GydaVQPE87PkFwvNyKlkjVa3rw64j/nhmjCaOdaUATSsGrJDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D1IRx03Chy0L00e5DcHuxgicM3k4eHe4fY9l2Nw894w=;
 b=M65XpGACHYJh5JvuJHzC5sGBRLEIqxeIvoYO7Iug5Nc25/m/PhN0ExxMLakm0mPIzPFseOEXW9SXTPekNbN5U6DwdvIf6bGTd80pjKs3wBi2cUaDhUpaIAYmJoIUcvgD70fEI9SpcJAIi6m40gXzrI/GJ0OUD0BgfOxULZuuCdUKwUnfUIOc8WU+Ke196LMu822YXZGKW+QNJ8xGaNCJ+8A/S2pGahReLpKb/OpYZbyh1iol6ZHv7qJqwuQA0Pi+bG9YcjeLLKFf7zPKADZN28bb8BYXrwB2TTAEIu+Zv6KqKjEYaxG867GDsDdQXH6mFJOUuPhKhMbt/Lqgh20UWw==
Received: from CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12)
 by PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 12:59:29 +0000
Received: from CY5PR12MB6083.namprd12.prod.outlook.com
 ([fe80::a20f:1068:dc78:27e]) by CY5PR12MB6083.namprd12.prod.outlook.com
 ([fe80::a20f:1068:dc78:27e%3]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 12:59:29 +0000
From: Aishwary Joshi <aishwaryj@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [Help Required]Unsupported routes and properties present on Redfish
 Interface 
Thread-Topic: [Help Required]Unsupported routes and properties present on
 Redfish Interface 
Thread-Index: AdluB8JN48w9eTSVSjOwnFd9pfEikA==
Date: Thu, 13 Apr 2023 12:59:28 +0000
Message-ID:  <CY5PR12MB60833AEB2F2FA388F05E4AD8CC989@CY5PR12MB6083.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6083:EE_|PH7PR12MB8426:EE_
x-ms-office365-filtering-correlation-id: da9bb8bd-aa01-4a78-4fc3-08db3c1eeada
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  u+OfKZBNNuQJE7bEWDdElf5+38PkhIqKBROpebrF/63vot3Ctxt4NxClYo/04UXqrj/Oe+8IYehptanUny3gUcda9AhOq4vGtHtiU4/xBtRHlPZrsB94mZtWvVhLlDEkINKI1O1c9shnpjqNmW1YINQZ/heEDCjCdOfhocHjQVUOmPNLd1uNDOVH25E+wNDX7iZgk/RPgBplv5HdX8sSpRAMmfbhY6KENI7oziX4O8jOPoJsI/+XXoAXrAig1gv9dwuWgJs497uFXpqhyZtRkStxgmjgqHa8LEJakXzuHyS9oA68YsrlBlmO7cUlfKRxd7PWW2HNsM4O/gbxPi+vlMKGio/HrlE50PrOjBGI6+Qveq611YySiRgFPspa2PLJhyoDDIpa51G1wNIiR6zhLyZxbOFqoO+8SC2tVDK7RizaCE4bAG6mC9ZmcWqW8WkB2QehDJVmamSsWUWcdFkxks17eKVfLpkC4wl4j9GBVVvM8pHP0peZXDml923R2hLhu1BZkrg+VcHxqF8qqr6h1aJluVQVLmt/+ayppxeherwc/VNE5964ytTbfhLKkGNdoc9djKR6EY5ef4tWSFLy6fMrkcCIAlsDNPWWUt3Co0Ibk81EFi5CL4jLF9Nszqp8e4pGGfwFMFsNO2mAYzVDpCdVm97PxqFPhXydVBX79nE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6083.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199021)(71200400001)(7696005)(966005)(6916009)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(166002)(2906002)(38070700005)(86362001)(122000001)(41300700001)(33656002)(5660300002)(52536014)(8676002)(8936002)(316002)(38100700002)(478600001)(55016003)(9686003)(6506007)(26005)(186003)(4743002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Mpwhe8Y9x4jRPUSRACbMlrLdiOO8iTvxHQPMy0k398Zq6tEw3IedkuPGU1m5?=
 =?us-ascii?Q?h+P9nhtpnckMAzL8kFITtdtVfPM0buJ9sBBgW0VgR2ZZbaMSKz9OE7TGjyiS?=
 =?us-ascii?Q?uQoQW833i7SQxh5+Ej2Jee+aIiMhkw0l88mWhGWk95qzOSls+tqZ0s5HcU1g?=
 =?us-ascii?Q?JzfKRpufy1GlgevVVrmH8wfKCpUpZeyGu3YIS0d5WGnyjNoI/H/lJQKSrV0l?=
 =?us-ascii?Q?nXKQCXghCbYmvuOFagyjs7h1DOOontPM3xrNEYgekmWzfijkugmlPOoNlVTv?=
 =?us-ascii?Q?XIjuqLcsFFAgoK+jXckIWvoftcJV3liRretADCmOrQaol20aZ3awT35nk+zq?=
 =?us-ascii?Q?Es85fZOOu7uaNaAHrISXDcY0IwBK/2b38xGxfgSycqVdFFddOEt7qzm3BtlS?=
 =?us-ascii?Q?G2R/lBoe5j7Rs+uyC+7cCOCnp56cn279+WA0SPP+ofAgfqgGAJnd9jwEGBFU?=
 =?us-ascii?Q?fgOsFOBxpxXzxejhabByf6BzjBjs9V0FWXbmxyWlhM1AUECRpYh+WEXCFBOn?=
 =?us-ascii?Q?6HEpqXURivFtfnsecuMVPrOylK9nSat+dwi+50n6FpWTVwcuCNTC9+3qmZxZ?=
 =?us-ascii?Q?TPuQIMBgH3ptKBBetev5R7OXSzU8ypwmCVj8XgMYvF69nqSjYfoEvUFSxOIo?=
 =?us-ascii?Q?ZlDFlbDjUh1qDg1JsFEBQFZulJkSnZWoLsQ8P5zc77CZxBPVDTW2fE92GHFj?=
 =?us-ascii?Q?i55U9X+pv2ORprm4FwM+SS8bRMNDtKz/wKLWwD0sCQEMeE/CSJ/gg7Zs8kPJ?=
 =?us-ascii?Q?N169OGbABSaoRKGLXMCg9SdQEjPlq0tN2fjG1l+/FO9AfJhXQTKtZerfsN82?=
 =?us-ascii?Q?weSkSW9AHlO8KW40eL8jBnOTj5W75id7ec8RVXAOP8UflAGy+16hPrVrUnGA?=
 =?us-ascii?Q?aTuZsZZrtdlS2s7QhmwPfsfImU2tfbuWb7NRPS4ts4+uGkuJt0nUhSjWh19A?=
 =?us-ascii?Q?gfR6VOyWy4K/Jr0aAQBJS70gSTFIEDIE0alaEsT5qsI8CG0FNLlHYKoSJ7ev?=
 =?us-ascii?Q?JWMrrTyFn9mtuW0q1kthaLHPiklCIIEHslIyb4Vf1857EqS8pb1NUCTKMfGS?=
 =?us-ascii?Q?6muKt0IUVBcjoOKVB9+u3yTL09La7GfHVMlPj16I5cA+s0Sejdj2sAwRsFuQ?=
 =?us-ascii?Q?Mr/uRpPIaMgqWq51pEmRLLMBdIvv0AKL/Ek0RqWboPw+yWUPrgige4wniIKQ?=
 =?us-ascii?Q?tX94Kg8gvTJJkk7DAHo6eMNiZTb3XQzuIfXsIaoPFvcy48n2tEmVyoWoxoc2?=
 =?us-ascii?Q?Y3gg8y1JnJhpyeumogS8yCnX2mBywvoVMts2pOaVucC81yNGRNWrjwvWUgSA?=
 =?us-ascii?Q?wzw+HEnuAZeE0BWHpvL+SrTN7JOaNgPyjp5oGqTNlhjJ7erlaqQ/+CXoAsJc?=
 =?us-ascii?Q?ipXaLuqbajXa7ocNuhwK1TiSYJFZh10wHtZZS+221zgEjT4o+my/Eo6w9b4f?=
 =?us-ascii?Q?btheu85AR8bETpi5xJUDU9kMdmn00aRISx8cS5zIcaTxM3iSJrq9746wwxd5?=
 =?us-ascii?Q?iLIFzf48lRF10j/sdgf8CBCt9TVQUF75JCUJ0atg14tuZi1MRH2GXP5yBtod?=
 =?us-ascii?Q?Zmn062jM0AH9f6kKpM1TD+UkUVRhKpuIht2mrMTZ?=
Content-Type: multipart/alternative;
	boundary="_000_CY5PR12MB60833AEB2F2FA388F05E4AD8CC989CY5PR12MB6083namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6083.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da9bb8bd-aa01-4a78-4fc3-08db3c1eeada
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2023 12:59:28.9475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gXmj6LiZB2vOsPBMexd0L/8bjpfr+l3X98ierGxT3upg+sXgEoo7Ew00KFPk+eHEebqrz8GQV+Ad3CJyHbt65Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8426
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

--_000_CY5PR12MB60833AEB2F2FA388F05E4AD8CC989CY5PR12MB6083namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Problem Statement

1. Unsupported routes getting activated on the platform

2. Redfish resources contain properties  which are initialized with default=
 values which causes misleading info present on redfish interface.





For problem #1,

We have seen that in the current bmcweb implementation, certain collection =
routes are enabled by default

Eg requestRoutesTriggerCollection, requestRoutesCableCollection etc. which =
are not must have routes on our platforms but gets enabled by default. We k=
now that when redfish api for the collection will not return any member on =
platform where backend support is absent  but since /redfish/v1 has links t=
o these collection routes. It creates an impression about feature is being =
supported and when actually its not.



Suggestion 1: Feature Flag(already present for some of the routes)

Enable/disable such routes through compile time flags for given platform.



But this could make bmcweb code difficult to manage especially to support m=
ultiple platforms with varied configurations





For problem #2

We have a use case where certain platform supports multiple redfish Chassis=
 resource and only on few of redfish Chassis resource we want to populate L=
inks.ComputerSystems . As per redfish schema Links.ComputerSystems is not m=
andatory property as for Chassis resource these are the only required field=
s which we are adhering to.

      - ChassisType

      - '@odata.id'

      - '@odata.type'

      - Id

      - Name

Code Ref: https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/ch=
assis.hpp#L456

DONOT want to tie this problem statement to just Chassis resource. The exam=
ple mentioned above is just one code block where we have observed the issue=
 but exist for few of the redfish properties in other redfish resources als=
o.



Suggestion 2: To use d-bus based discovery checks to populate such Links/Pr=
operties instead of having any default value in the bmcweb

Dbus based discovery can be through following checks (but not limited to):

- dbus property checks on an interface

- Association checks

- dbus interface checks

This would ensure that on any redfish resource there are no default values =
and Links/Properties are populated only when backend service actually suppo=
rts it.



Reaching out to get the feedback on two suggestions that we have provided.

Also like to understand if there is/are any other solution already exist or=
 being worked upon to mitigate these problems.

Thanks,
Aishwary


--_000_CY5PR12MB60833AEB2F2FA388F05E4AD8CC989CY5PR12MB6083namp_
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
@font-face
	{font-family:"Abadi Extra Light";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
p.xmsonormal, li.xmsonormal, div.xmsonormal
	{mso-style-name:x_msonormal;
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
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
<p class=3D"xmsonormal">Problem Statement<o:p></o:p></p>
<p class=3D"xmsonormal">1. Unsupported routes getting activated on the plat=
form<o:p></o:p></p>
<p class=3D"xmsonormal">2. Redfish resources contain properties &nbsp;which=
 are initialized with default values which causes misleading info present o=
n redfish interface.<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal"><b>For problem #1,</b><o:p></o:p></p>
<p class=3D"xmsonormal">We have seen that in the current bmcweb implementat=
ion, certain collection routes are enabled by default<o:p></o:p></p>
<p class=3D"xmsonormal">Eg requestRoutesTriggerCollection, requestRoutesCab=
leCollection etc. which are not must have routes on our platforms but gets =
enabled by default. We know that when redfish api for the collection will n=
ot return any member on platform where
 backend support is absent &nbsp;but since /redfish/v1 has links to these c=
ollection routes. It creates an impression about feature is being supported=
 and when actually its not.<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal"><b>Suggestion 1: Feature Flag(already present for s=
ome of the routes)</b><o:p></o:p></p>
<p class=3D"xmsonormal">Enable/disable such routes through compile time fla=
gs for given platform.
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">But this could make bmcweb code difficult to manage=
 especially to support multiple platforms with varied configurations<o:p></=
o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal"><b>For problem #2</b><o:p></o:p></p>
<p class=3D"xmsonormal">We have a use case where certain platform supports =
multiple redfish Chassis resource and only on few of redfish Chassis resour=
ce we want to populate Links.ComputerSystems . As per redfish schema
<span style=3D"font-family:&quot;Abadi Extra Light&quot;,sans-serif">Links.=
ComputerSystems</span> is not mandatory property as for Chassis resource th=
ese are the only required fields which we are adhering to.<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - ChassisType<o:p></=
o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - '@odata.id'<o:p></=
o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - '@odata.type'<o:p>=
</o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Id<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - Name<o:p></o:p></p=
>
<p class=3D"xmsonormal">Code Ref: <a href=3D"https://github.com/openbmc/bmc=
web/blob/master/redfish-core/lib/chassis.hpp#L456">
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/chassis.hpp#=
L456</a><o:p></o:p></p>
<p class=3D"xmsonormal">DONOT want to tie this problem statement to just Ch=
assis resource. The example mentioned above is just one code block where we=
 have observed the issue but exist for few of the redfish properties in oth=
er redfish resources also.
<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal"><b>Suggestion 2: To use d-bus based discovery check=
s to populate such Links/Properties instead of having any default value in =
the bmcweb</b><o:p></o:p></p>
<p class=3D"xmsonormal">Dbus based discovery can be through following check=
s (but not limited to):<o:p></o:p></p>
<p class=3D"xmsonormal">- dbus property checks on an interface <o:p></o:p><=
/p>
<p class=3D"xmsonormal">- Association checks<o:p></o:p></p>
<p class=3D"xmsonormal">- dbus interface checks<o:p></o:p></p>
<p class=3D"xmsonormal">This would ensure that on any redfish resource ther=
e are no default values and Links/Properties are populated only when backen=
d service actually supports it.<o:p></o:p></p>
<p class=3D"xmsonormal">&nbsp;<o:p></o:p></p>
<p class=3D"xmsonormal">Reaching out to get the feedback on two suggestions=
 that we have provided.
<o:p></o:p></p>
<p class=3D"xmsonormal">Also like to understand if there is/are any other s=
olution already exist or being worked upon to mitigate these problems.
<br>
<br>
Thanks,<br>
Aishwary<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_CY5PR12MB60833AEB2F2FA388F05E4AD8CC989CY5PR12MB6083namp_--
