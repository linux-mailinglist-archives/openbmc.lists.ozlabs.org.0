Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFB21824CA
	for <lists+openbmc@lfdr.de>; Wed, 11 Mar 2020 23:25:15 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48d635645RzDqGl
	for <lists+openbmc@lfdr.de>; Thu, 12 Mar 2020 09:25:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=WTp6PmY1; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48d61y4952zDqMk
 for <openbmc@lists.ozlabs.org>; Thu, 12 Mar 2020 09:23:58 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Mar 2020 15:23:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,542,1574150400"; 
 d="scan'208,217";a="261291876"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga002.jf.intel.com with ESMTP; 11 Mar 2020 15:23:51 -0700
Received: from fmsmsx113.amr.corp.intel.com (10.18.116.7) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 11 Mar 2020 15:23:51 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 FMSMSX113.amr.corp.intel.com (10.18.116.7) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 11 Mar 2020 15:23:51 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.58) by
 edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 11 Mar 2020 15:23:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUbozA033fKj8buepZYkfDssbRN128QArdAfbpGKbPlQRRtqLAf31Ukh4ak0/r/XFGDg+6ZFUjLN/gbyp1K0h1xXrTS9vw4+8epcF7Mzqgak4x5/6Dmcs8LrxlvbuZGkiZD1bHEek+J14QKHAwWh8iYTiHFamYmLqSSh/CJdMoMi0tehEr+QRWTZJT4cS9eoOoqOv9EglYQq23dqfDMRLAWGmhLWrdBU9RkrqhDxX8V5FVBtxhOg4iLU2XT/3rev1GlDpSw45TybPns3MMtz7pADAYhWWmYZP5qU0mcMUv8Pygue1ed+aBudM4NciUqAN0hgGSvxegAQfIyVd/nsmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vOxHcFROTuuACeRIgpHrHSYlocw9AA7sH7D8HX3Z2E=;
 b=HUH3gokPCSJY2aXdiMzYh8v3+uIsO6L6cHHfU5nwgG9wH64Hv9X6KkP6YfgKRgREolOKXOnkV/4Kb+6/3OsOffi5iN3WTt+L8ybg8lemHXy4G5tisSFn+w7NaaiZJzIu6Ph+Y0sdhnS9ZC6WQOltKzNk2sAu76Rhk9cbd4f6dOGW4Z5e5nZQOk7howQi+IDAvj5RKi7OiSbAuEzWQcaCZuRJrUcndmmS80g7i57rNurJR4Ngkr4l6GbTec7/BZ/NBI7JnpeReHLGf3CZaAYktbJYJQcmp1x7VuIYVC/3IkORxoS12lxJuR+ZBsGAYKti83dUdNn+uTlUNSu/M3k5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9vOxHcFROTuuACeRIgpHrHSYlocw9AA7sH7D8HX3Z2E=;
 b=WTp6PmY18HehNohqj0J3YaUaUgF0HwksNHBFcvQRSnMof913OEMd2KbJ5dLo87zzETIw6tCKpB0fKZHu+9hPrpJe1dD1uItV10kNuCkM9bs5WXmaBR0e3QcORSQgycSop4ps9MSt8m0I6YoiyBeb56B3zoAPXNMja1oTFhzGZ5c=
Received: from CY4PR11MB1415.namprd11.prod.outlook.com (2603:10b6:903:2c::20)
 by DM6SPR01MB0025.namprd11.prod.outlook.com (2603:10b6:5:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2814.13; Wed, 11 Mar
 2020 22:23:49 +0000
Received: from CY4PR11MB1415.namprd11.prod.outlook.com
 ([fe80::242d:bf41:e936:d7c1]) by CY4PR11MB1415.namprd11.prod.outlook.com
 ([fe80::242d:bf41:e936:d7c1%8]) with mapi id 15.20.2793.013; Wed, 11 Mar 2020
 22:23:49 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: running u-boot with QEMU -M ast2600-evb
Thread-Topic: running u-boot with QEMU -M ast2600-evb
Thread-Index: AdX38uSQpXrYWMMXSTKk5J+Lj7ndZA==
Date: Wed, 11 Mar 2020 22:23:49 +0000
Message-ID: <CY4PR11MB1415CB8FE0E4411188EE595294FC0@CY4PR11MB1415.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=zhikui.ren@intel.com; 
x-originating-ip: [134.134.136.204]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8025f7b7-2ffb-4e75-47b3-08d7c60adf86
x-ms-traffictypediagnostic: DM6SPR01MB0025:
x-microsoft-antispam-prvs: <DM6SPR01MB002598A270AD9AEFE60BFBE094FC0@DM6SPR01MB0025.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 0339F89554
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(396003)(366004)(346002)(376002)(39860400002)(199004)(8676002)(81156014)(8936002)(76116006)(86362001)(52536014)(186003)(478600001)(6916009)(26005)(64756008)(66556008)(81166006)(66476007)(66946007)(66446008)(71200400001)(5660300002)(7696005)(6506007)(55016002)(9686003)(2906002)(558084003)(33656002)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6SPR01MB0025;
 H:CY4PR11MB1415.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3f9lp20FESFEPYDNQnxIHZ9gKuzv5EMplskoqM7VMKCCmQy8sZ1dQdJCI7yCZYKviW8L8iK3QAPvF1f+rntsFddpLyQzFgGLJ8TBgL7/2w24FOAOO4IFWgyE2AwXzevwinQ6HeZYg++1Guwd7eu59Lfh/ZSL2AvwbXagn3LJisygn+FLIzXu/D5SLmshA1nN0EmP56IzRiLQc3599vXRJEiep1V2CpYE/TR9R7TUCS0A4oLc3LjtNypaYhKxNUbwByFeDDy71NQNY9JwKN7wDZLQ5xbZo/oKjjkg3yDU7Sp6G46N9F7G7dlSY/LKKOrXe6FIXyF3FWQLro6pAMZTxwtTzYtHtgcHxww7Z0TqFMP+psyojwdInO2pttPYOIoM08TEO7ITmuDBVTm+vrfwBYzuS5nwXibS3W0xo0jFSOqcJJhRvOhWpA2UbyxPn6h1
x-ms-exchange-antispam-messagedata: e2oTLPP1aCXXn88FSCWBwMZVze+lx4st+HFNWqOEoyHgMvsI69RHFSTHBb5/Nm3Yr450OQV5Ij1l0DbUvHWJljZ3FonoP7KeSCeU5rnhWZuUt6NZVh/2a6B/qR/AD6H4vaQfjUBFczY2YXrTj9uulw==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_CY4PR11MB1415CB8FE0E4411188EE595294FC0CY4PR11MB1415namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8025f7b7-2ffb-4e75-47b3-08d7c60adf86
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2020 22:23:49.7706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tDW84ih1rZSM5BpvYCygsZaljrDSamJCpT/30iDAEPHmm2LMzY9EYoN6yfPosRsi1pZnH3v1GmWVloq5ktL9rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6SPR01MB0025
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_CY4PR11MB1415CB8FE0E4411188EE595294FC0CY4PR11MB1415namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Has anybody been able to run u-boot with QEMU for aspeed ast2600?   What ar=
e the steps?

I saw support for machine ast2600-evb in QEMU.

Thanks,
Zhikui

--_000_CY4PR11MB1415CB8FE0E4411188EE595294FC0CY4PR11MB1415namp_
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
<p class=3D"MsoNormal">Has anybody been able to run u-boot with QEMU for as=
peed ast2600?&nbsp;&nbsp; What are the steps?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I saw support for machine ast2600-evb in QEMU.<o:p><=
/o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Zhikui<o:p></o:p></p>
</div>
</body>
</html>

--_000_CY4PR11MB1415CB8FE0E4411188EE595294FC0CY4PR11MB1415namp_--
