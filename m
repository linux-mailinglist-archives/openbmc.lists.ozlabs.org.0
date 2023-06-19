Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 463F4735FE8
	for <lists+openbmc@lfdr.de>; Tue, 20 Jun 2023 00:41:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=dpzGjYWr;
	dkim=pass (1024-bit key; unprotected) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=ZijRyFZ6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QlPrB1KsJz2xq7
	for <lists+openbmc@lfdr.de>; Tue, 20 Jun 2023 08:41:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=dpzGjYWr;
	dkim=pass (1024-bit key; unprotected) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-microchiptechnology-onmicrosoft-com header.b=ZijRyFZ6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.153.233; helo=esa.microchip.iphmx.com; envelope-from=mitul.patel@microchip.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Mon, 19 Jun 2023 23:36:44 AEST
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ql9lw717Jz30FG
	for <openbmc@lists.ozlabs.org>; Mon, 19 Jun 2023 23:36:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687181805; x=1718717805;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=yuNl6vko4U4KqwCBHRwiNIrQC3DxxRbUtOBaDOaYQdk=;
  b=dpzGjYWrDQb15PakixEPh/mbyW91vJOBLVzS0IypVbXex8Qwz+5/II/s
   oaon/fKhvPYYw89kQOoK8ixjDmAKqUySRd3ZnzqqsJvq00M+pSRXgEcZ6
   Zu32EMt0rQ7au2ONkPbDCt0b7AvPPKcZHvB78P6PDf2qV1dudFY7EsSLL
   uFefN0GM8ZWbKYUDgslDdeILqvW29sIf0Axrfk/UfrotUYLWljL6+EDta
   WsVdxrZEUk/6hPC293g7aMX+G4MslASUOHbjAAOXgR9IU4pif2P7b6S6S
   xPSt9GNmza38tFQ263Qu8OSga1y2BPEMzjAXvrHWS/Ljecjf60H62y0zO
   A==;
X-IronPort-AV: E=Sophos;i="6.00,254,1681196400"; 
   d="scan'208,217";a="218639451"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Jun 2023 06:35:35 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 19 Jun 2023 06:35:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 19 Jun 2023 06:35:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oa9oh4oz+bgsmPC+wAtWJeyp04IQlNKHwmBnnYsvlQk0tvkG9Vgo8lxSyxz3htzIXTTsg3Q5MdDdc8FYKSpQ+1K13D4RRJCYolJjmwm+YeeS2BaFoP10evwLiZ+kKi7DtvjZYT28/Kj52BsGYC7cZ3BZnbPYDknnk7WA5ZwZNIbX3TCf9srJa7YIdYv7y7mI9HHHq+0qqnMsgpqzifpvfuT/ElqJOZ8/V4Jx+mXrXNV4K2ecCnXPtLtge5Ua/oG5VNwkAH9ixbA4tln2b6phYnckkwPf+26OmM1O/l1ko+/sMKaXEfsTCmI3DDZIRZj2EBagfYUrk7yx4o439fDEqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7l2fAcoyiGrMBa6JN2YHkoTg1Oe7lcN73rOyvmHOTx0=;
 b=XRPm/syv/zaEsUCz8wVKq+TmG9kGUq8QC4Ve9XP4Dc2QnxMBJAlYsGUWBZOQQxp4R3vCPvgy+j/rm/jQGw8DaeJ7nOQjX2cFXnCflQ/NemYQaH3wrRqN974fCTtFXY58hQHAhf4qK0vaLJPFPF/0YZIKQwlNlWk4SbCc5uPw0LH18FhXKvdvjf/p+NrbG3BZ660dL53YQrxFINYf9OPg7knJSIyQ9ucuDsJ9Sb3ZybbN5kuvw3GwZtDLZJEC7wqwTjGk7vZ7C3lezoZtfwKltu/r1x5Zv/AQ+t4RKuj2qzH7ws1dvH7z3j/HyqawACd/mzLk5pRR+MYGMlqHLKZswA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7l2fAcoyiGrMBa6JN2YHkoTg1Oe7lcN73rOyvmHOTx0=;
 b=ZijRyFZ6NzBVhuKWP9KsBEtMFkGD977ZXy4+k0Um/0uKItOsOyM8kyDQ96NlTCi6THXTo0poOanojwYWwuyEcBBnJpbt/40GuHI8Gx/S0sM5cS62QQsq9ZDq6LtqNOuEihS+A+YKDJ7uj5UeJzwdPlqU8sQETU19AWcYN5JbzUo=
Received: from PH0PR11MB4904.namprd11.prod.outlook.com (2603:10b6:510:40::10)
 by SJ0PR11MB4863.namprd11.prod.outlook.com (2603:10b6:a03:2ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Mon, 19 Jun
 2023 13:35:32 +0000
Received: from PH0PR11MB4904.namprd11.prod.outlook.com
 ([fe80::4f6e:4860:28c0:a69]) by PH0PR11MB4904.namprd11.prod.outlook.com
 ([fe80::4f6e:4860:28c0:a69%6]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 13:35:32 +0000
From: <Mitul.Patel@microchip.com>
To: <openbmc@lists.ozlabs.org>
Subject: Development option on openBMC 
Thread-Topic: Development option on openBMC 
Thread-Index: Admisul2dfQTxObpSTa+q4YpXClUnQ==
Date: Mon, 19 Jun 2023 13:35:31 +0000
Message-ID: <PH0PR11MB4904A57D256641144FB4134BF65FA@PH0PR11MB4904.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4904:EE_|SJ0PR11MB4863:EE_
x-ms-office365-filtering-correlation-id: 67d95ace-99cb-41be-6cfc-08db70ca0db7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cz7y4o7zDWwO3rpuY0pv3APqMilNvQenrfI4gnALtiywcE4zoOoBHw6g8lSpgd+qxPxdGvLTtrMoObZFuF2NHUSp3LiT9ULZmWMy844trcrQdRX57EUgoTtgxkNsEQauXVsz1okOMFstfccq78PovsUw/043CTMVK0bWYzlnnh+hchvkxZU09DbJP2OqJGQ8SPK09u3EAWKzqnJFO9X9S9DtwSE+bQgzLIsUqrdP2Ij2791cpC3jIGI1ZwmmrFWMb0G2+i9IjpTSMgrYnctP979uXG/JOEu20MPq+DHQ6ZQZSm6mqNwgBwU+ywUniXEu6ZJ47yZ6+o3+tVx7lMW3m2Hub+rRGMatvvwnJzVNfV1X/fZ7VuQzLyHid6yv5up9uHezwpZ5NsI/Daxbj8dTVQYFMjA6PCf45+ZHtpucIxa9HC6GJggiwDKSOfc/Akphref45KJ2GGm4GpXXKLwRlki3NG3H/bBvkm7DLeKZfkPzoKRWUebgv3jWapWzb702/9uGw9vMyhER+jlTktH+anaTyR14bin2cGbTGZLMBXGSs+QwDdIQqS6Uehzny+TubOgr4mZZ9Fyt+eX/8565RNm/qgHpLriy24DgGUuhEHVauSzOr9vQ1aTpvwo8jko4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4904.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39860400002)(396003)(376002)(136003)(451199021)(52536014)(5660300002)(33656002)(8676002)(8936002)(9326002)(76116006)(66446008)(4326008)(64756008)(66556008)(66946007)(6916009)(316002)(38100700002)(66476007)(41300700001)(55016003)(86362001)(38070700005)(4744005)(2906002)(7696005)(71200400001)(4743002)(186003)(9686003)(6506007)(3480700007)(26005)(107886003)(122000001)(478600001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a8XU/vVNZ7qKcQiLFJEQtH8l78N/meAvOojDDbvBr/+2UKuxS8qKG82AhSCc?=
 =?us-ascii?Q?L9Gs1IPMjqC4ddg4FxAQrUI5Vo02RwatTNe9WOIVu9KeyM+XH+L5cNqVprQr?=
 =?us-ascii?Q?aOuMzb9eFDEvDC+XL/gA0w2n7jI4bV9VpnHHNu8dzRVDfNHpUxN96z1y4b7H?=
 =?us-ascii?Q?Hl+zPBoY0pmthTt4KK8u1n9TvStGLIVsSxEkyYI5KPvkXBBxIpF3WJAydVtZ?=
 =?us-ascii?Q?lboN9ExBSlLvvNHmFzJuBgswTg8qgLYIUEp5ALVyU+af5W+Se/cqVXx/8WVh?=
 =?us-ascii?Q?fsKjkYkn+oihd5N7+DbPc3hXZ+LqEBvOM8Er0X5aC3XxFFcd4Q5dfOU7Il8d?=
 =?us-ascii?Q?tjlhonEDG2q0EcRc8kvy0fVapy97pF2kn1grf/XzjrMG0gUMXgmvg7CyKnWr?=
 =?us-ascii?Q?RMpoUv7MInI5Jkj3zX250oYbnvRf543Eqllf0NRoezzK0r2kPAycA1S9qzu+?=
 =?us-ascii?Q?qhr0z5D56eO4oAGwpKgbr3wjfDTL5HWD5IoMsolBEaxdbU2+5XrF9kLEIrLM?=
 =?us-ascii?Q?SaEtQ00ugdqjOeGFyqM/mKEfHQfsOQnMibq9CIPoz7l8HwYxhT1CGDtzsZS8?=
 =?us-ascii?Q?6ZzRBGB9ZWM1yQO5X8n82jWaktnetHZFXtg7V946VxvtykG1KMNi5M2nq62p?=
 =?us-ascii?Q?nWt72WE9PfQclMDyhd2s4Moj1PwZYd+PhHHhi+sic3yJdY0cfZ/a7CezEzfW?=
 =?us-ascii?Q?TVep4wZr8zmRz4nsz6PPGqHaOfGvBIwPSysz63HbwxGubJhsW4LRkT/lxRmG?=
 =?us-ascii?Q?mUGs6DKc5U0gEYEdxv3I2n/SH6V4STotJsZI0frKzq0yic+VqjZz/DY+OWi2?=
 =?us-ascii?Q?9w85LA2VCSvwm4WySgzmL1yQJrmBWQX/lzhDWzIZq889Nk0QniZ2xss7FsYZ?=
 =?us-ascii?Q?7/bS/3qFtzzAaFB0n5UREcS4j3pw4BAKkCyFREg6K/XY3f1IqWFGKxXyA6Cy?=
 =?us-ascii?Q?1wU/MeQXCtoSewBHqF1crmJBMO4imHrxeiSrle00e807AdLdN+WUQf/yJ860?=
 =?us-ascii?Q?8649L2c9ct+L8INIbWUHGp4lTjcAqc/P54J1HdRcb02eUzwca3ELk+RI0Ga2?=
 =?us-ascii?Q?UZvwMPig221X+cTsUAzgDzeMjRIiZxm2CnJ4HDEONs+ZbPLI52xvr3tDrVU9?=
 =?us-ascii?Q?3RwKF2RPoCB30AEtrvxWn8XLHCeZedZYimlN4WAD/RVpHBG+Eiep3wWKHU9T?=
 =?us-ascii?Q?VODJULUxu/WUmjgeSztVfMlGYcf12s12bAHmDQZdxgce9ZkZPi/Rb4v+6fdn?=
 =?us-ascii?Q?YlrdXqzE19a62K3VqIn0x7+fd6itRtmAHw5vt1A+lxgqaM+V301dAzL5C5YU?=
 =?us-ascii?Q?iSbPaP5MjBM8s+/Jry06sk+plSirqnbUpOVH3mnATQMwNgZNybawdlwwFOT3?=
 =?us-ascii?Q?uP3mWjYVuqAEZyJ1oDyRUjsJIWvQhszMHfze90sF8Vxn89LGzGFZc9t3sa43?=
 =?us-ascii?Q?cXHG6cHKAxHPd0VZOWrnqkQztxRAd3Ym4MOA2OJQ8dslQ3Fu0XEAdd7k5hIx?=
 =?us-ascii?Q?AVaWfOtH09czFaNV+Rbl9dLmXSIl+Ky7hcyybH/CzbdeEKrmzDdun6p6E0MN?=
 =?us-ascii?Q?v226ORShReC8ESvGLlG19FRn5Xu3oL2PzkJJGIZb?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB4904A57D256641144FB4134BF65FAPH0PR11MB4904namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d95ace-99cb-41be-6cfc-08db70ca0db7
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2023 13:35:31.8573
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GfU3vQIqJkPphtrpGgG2cjgtrTpPTQYxyuW8qwUuTCnTK9mFHNnLVdJrrazLjsTG2qoobY4rVG2XCAIh9ZlsmZ12mDxwROZ8kCv6OU+YWIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4863
X-Mailman-Approved-At: Tue, 20 Jun 2023 08:40:44 +1000
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
Cc: Kandula.UdayanadhBabu@microchip.com, Prajwal.MallikarjunSP@microchip.com, Balaji.Marimuthu@microchip.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_PH0PR11MB4904A57D256641144FB4134BF65FAPH0PR11MB4904namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

We are exploring the development option on openBMC with x11spi and daytonax=
 hardware target.

As part of that, we have compiled the binary for the x11spi-TF and daytona_=
x hardware.

But while flashing x11spi we got an error as "cannot downgrade the firmware=
", and for daytonax "Unspecified error for updating the firmware".

Could you guide us through flashing the openBMC firmware in one of the setu=
p?

Thanks,
Mitul Patel

--_000_PH0PR11MB4904A57D256641144FB4134BF65FAPH0PR11MB4904namp_
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
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
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
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We are exploring the development option on openBMC w=
ith x11spi and daytonax hardware target.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">As part of that, we have compiled the binary for the=
 x11spi-TF and daytona_x hardware.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">But while flashing x11spi we got an error as &#8220;=
cannot downgrade the firmware&#8221;, and for daytonax &#8220;Unspecified e=
rror for updating the firmware&#8221;.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Could you guide us through flashing the openBMC firm=
ware in one of the setup?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Mitul Patel<o:p></o:p></p>
</div>
</body>
</html>

--_000_PH0PR11MB4904A57D256641144FB4134BF65FAPH0PR11MB4904namp_--
