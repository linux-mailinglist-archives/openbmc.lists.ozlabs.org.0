Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B5628A07E
	for <lists+openbmc@lfdr.de>; Sat, 10 Oct 2020 15:07:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C7lbf3NHtzDqw0
	for <lists+openbmc@lfdr.de>; Sun, 11 Oct 2020 00:07:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=yong.b.li@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=w+cMBlOI; dkim-atps=neutral
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C7lZ829yQzDqlw
 for <openbmc@lists.ozlabs.org>; Sun, 11 Oct 2020 00:06:14 +1100 (AEDT)
IronPort-SDR: 1yHCQ1FSYZkpgG6v5CSIhj4eyyM3Bi6TRcqG/mjfWorDZEzduSiFGyzRgkg5ZDJuMmHVxhRyYL
 SkHQIhJk1SVA==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="153411174"
X-IronPort-AV: E=Sophos;i="5.77,358,1596524400"; 
 d="scan'208,217";a="153411174"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2020 06:06:10 -0700
IronPort-SDR: a6uCjOBDfZciOW66rfd/x5HuO/aUeB5FzflcAWwF/2nBQvaEFYtr1Qu/aWjfGu5hYj51jQvpxq
 bQWYe9OUiCEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,358,1596524400"; 
 d="scan'208,217";a="312856095"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 10 Oct 2020 06:06:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 10 Oct 2020 06:06:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 10 Oct 2020 06:06:09 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sat, 10 Oct 2020 06:06:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4JGcnvQo4QFZVv/YyQN3JWJ+Kiw2yDDAcdD8gEv6Q28XY8hfjUztDJFqOt/eB2sE/PDX/gDaWqxSG+SSbI8Ub71qypNWcuSGg892ZX05NfHpScWTWegoHUzmjVazwy9qiwr4NS/eBJIFVm82mTCYDvC1r7Yw2eDyazV2ZBPdzII53WexxInsUMQxgTDWtofejexMSQD22+c6rXPneBENqnZKXBLi1XPHziqq5PhaLJs76QhHYN0T9JVxzjc6geaZT6IE31V1LHJz3S3mS5OWUHdyVjjaUrk/K1l15uvYFjZotq+amYa4xBpXmahdIJKsUTR1Qc71H3EROXcXDXiww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vr9mBhh7X2CTyN5OGNjZzEgPLNdpcvxVohRF6JrK0SY=;
 b=cCmWb/X6e3rvV6k1NPZXwFAoBuJEb7uIA6V1iIYWVYkhARZH55L9xB0tzy93mEHfPxpiGc70JUPdgFRNXU0SiCf1foaCxYNjzDDLG+si9WLyJdvbyQ+exhZCHY7f2PbRx+gPrIFVq5Db5fv7+tL5JdO7S4Gf/2kybavY0H2shaYzzZsqDEGL+ri1SAJ66zjj07ph9Yn+BDvljuV0MEtycS9yPikNgZFjZdXkslrbvTOleY1Kx0cNFamg5jBOEI8fcWLA/oySFWFcY+cl6dmYt6edU2GcuPi+0AVX/4622Ou86LMO/Ns8IFcTso1cBwOqtr1LXuUOVWJjFT3FRo+ZXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vr9mBhh7X2CTyN5OGNjZzEgPLNdpcvxVohRF6JrK0SY=;
 b=w+cMBlOICB9fIsNSDIEKiEgvKbpzEMdbDj7Swo7a79UJYFqxCNwbXGzvnxhCNiKFnz3RhaQgNh8CxC49DZ0KyLhO2cuU1aTY94bjeJvppLpAEFSoGjm3p6z2HyOeWnQR0gpj1tro8WmpBtTDmN8y4TQLiLUACO8BgIAJBkwvw0A=
Received: from SN6PR11MB2943.namprd11.prod.outlook.com (2603:10b6:805:d3::26)
 by SA2PR11MB4891.namprd11.prod.outlook.com (2603:10b6:806:11e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Sat, 10 Oct
 2020 13:06:08 +0000
Received: from SN6PR11MB2943.namprd11.prod.outlook.com
 ([fe80::29d1:334c:98b3:4566]) by SN6PR11MB2943.namprd11.prod.outlook.com
 ([fe80::29d1:334c:98b3:4566%5]) with mapi id 15.20.3455.028; Sat, 10 Oct 2020
 13:06:08 +0000
From: "Li, Yong B" <yong.b.li@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How to list all sensors through redfish?
Thread-Topic: How to list all sensors through redfish?
Thread-Index: Adae5vuofLXC5NmxTy21mi+Xpir4ZQ==
Date: Sat, 10 Oct 2020 13:06:08 +0000
Message-ID: <SN6PR11MB29437D2F974612BD91DBCEC0B7090@SN6PR11MB2943.namprd11.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none; lists.ozlabs.org; dmarc=none action=none header.from=intel.com; 
x-originating-ip: [192.198.147.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e01cd0d6-d6e7-4de1-7f7c-08d86d1d40f8
x-ms-traffictypediagnostic: SA2PR11MB4891:
x-microsoft-antispam-prvs: <SA2PR11MB4891A138BD37A2050D00BD13B7090@SA2PR11MB4891.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RUKVPTP/PQH5k7mBus9w1gUE7FKam2coGNtO2OEyV4T+h9DGefF+uLra2jFYeIEFioDiRIibRSaTbMiLGhwfOC+fr1sXncajAe9CgjuF0F3MKe9kPVF5zSVY1laaQb0rsL51NWNoje8krhs8eQh33ofDSz1RglGBXEtJfsS8JrsI9kN3jUh/UFpogWQ2mAyLcggIsSO3MTXUJOeGlQhRNZoDZEfd1w8aiC/qbLZ78NB3FffzbQ6X27bMiyaithPtZeyi4A60msd3MxvcbbnVrJutWWmSWEd22X63EnvgMfXNVndcbc+syMT/UpiXBj53cnyV+qlS3G5qFiK+3zDdsUCxm6veTIu9unaHGpym+IGwdXAPRdkyi4T64gUM/IFaFKFIfaUR8X+FSpFTkhkt3w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2943.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(7696005)(6506007)(6916009)(166002)(83080400001)(8676002)(186003)(33656002)(26005)(966005)(54906003)(76116006)(66446008)(66946007)(5660300002)(66556008)(64756008)(66476007)(316002)(9326002)(86362001)(8936002)(52536014)(478600001)(4326008)(71200400001)(2906002)(9686003)(4744005)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: IQXqS2YBWuFIsjdLi5oxchPBoSU54NedBLfzjyWO49YE0+uMb+ZXETBXnjJLKbNYNqnlAKIbIiwEe7xejFXODzl3GtZI+KvFr8SExXTwBRI43mMZlWOfAYRPDPI5QYUVWjjkQiCKGf2vAN9IS9ehg99slPp2G0dwgC9PgyFPBYl6vYvNYPXz/sKa2l6+sgHPPrsY/MnGNQH3nfUx7foxQ7ValVcy01GuF4DWVu/JI8IrBZmfFSUNSMjcHfpuNMWjaV1/2OM5F3HyfGKCvIY/yfc03sCkArhAYffKUITYpJj7XTcwcBVJmtczdZvax5BVUp3HV8RgI18dFz/NBx1Hnor1NdeOmKEznlDPoiUPz6ozUtN7Z0WhCbAqtTDNpVtybFdp4jFJjIywCPYx78KkeYXz6+MFwAMqM/hx/YCKpBkKmROf0u6AYMhRYRmUr2mi8o7/DoNRpZgOZqRbB83UKmYeTuC/+2CBcs65PvOYlANU3AQlhNJGRcWPlsKQfr82nC2FJlCsb5cz/N0IoPWe2+NdqZ56R56lA3DfvHuMVaeTqu7Lr/cpPQDODyGWhhd9pmNUarPFLUJAZXJ8hi8QnCr6AKFvK7x0SvrjwQY6LLLmr1he3yIPSFdSS8dEl1WuGSvtJzKlKESmPJLLnlI0+g==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SN6PR11MB29437D2F974612BD91DBCEC0B7090SN6PR11MB2943namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2943.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e01cd0d6-d6e7-4de1-7f7c-08d86d1d40f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2020 13:06:08.1433 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S/G8w3yWpTuzECj0VWXyI8zl9a5Y/JU+z/RB53rL97YIodOT3cGJbgYB1+ozQ7uUB61u6XOj8IFGggzyap0nsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4891
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
Cc: "feistjj@gmail.com" <feistjj@gmail.com>,
 =?iso-2022-jp?B?GyRCMGpNaxsoQg==?= <yulei.sh@bytedance.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_SN6PR11MB29437D2F974612BD91DBCEC0B7090SN6PR11MB2943namp_
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi All,

Based on the current bmcweb implementation:
https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/sensors.hpp#=
L61

The below URL only list these power/current/utilization sensors:
redfish/v1/Chassis/$chassis/Sensors

Just want to know why not list all running sensors? Is it required by redfi=
sh spec?

Is there any way to  list all sensors through redfish interface? Like the =
=1B$B!H=1B(Bipmitool sensor list=1B$B!I=1B(B command?

Thanks,
Yong

--_000_SN6PR11MB29437D2F974612BD91DBCEC0B7090SN6PR11MB2943namp_
Content-Type: text/html; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-2022-=
jp">
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
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"\@MS PGothic";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:JA;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
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
<p class=3D"MsoNormal">Hi All, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Based on the current bmcweb implementation:<o:p></o:=
p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/bmcweb/blob/ma=
ster/redfish-core/lib/sensors.hpp#L61">https://github.com/openbmc/bmcweb/bl=
ob/master/redfish-core/lib/sensors.hpp#L61</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The below URL only list these power/current/utilizat=
ion sensors:<o:p></o:p></p>
<p class=3D"MsoNormal">redfish/v1/Chassis/$chassis/Sensors<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Just want to know why not list all running sensors? =
Is it required by redfish spec?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there any way to &nbsp;list all sensors through r=
edfish interface? Like the =1B$B!H=1B(Bipmitool sensor list=1B$B!I=1B(B com=
mand?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Yong<o:p></o:p></p>
</div>
</body>
</html>

--_000_SN6PR11MB29437D2F974612BD91DBCEC0B7090SN6PR11MB2943namp_--
