Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA74286235
	for <lists+openbmc@lfdr.de>; Wed,  7 Oct 2020 17:35:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5z1g1zhqzDqNx
	for <lists+openbmc@lfdr.de>; Thu,  8 Oct 2020 02:35:35 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=kent.thompson@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=LEdnCy2t; dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5z0X0CKfzDqMK
 for <openbmc@lists.ozlabs.org>; Thu,  8 Oct 2020 02:34:33 +1100 (AEDT)
IronPort-SDR: JdkhBfmVb8/GdC8cA4IIze99zSo5if7Db3Gw6vp4JX9wN5b5TxYMG5YZ01FhZsAj6DeND9VX+g
 vz4dYhpmJYdQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9767"; a="229121967"
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; 
 d="scan'208,217";a="229121967"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2020 08:34:31 -0700
IronPort-SDR: Nz4dSG49RT7n3Vk9lq1p7IzCd6UeEYbyM7Aymn7bsDh5OQ7fxZSyQrl5OHW9X0UfRZiSwOXQx4
 fc2xuXC2y/iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,347,1596524400"; 
 d="scan'208,217";a="344329422"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 07 Oct 2020 08:34:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 7 Oct 2020 08:34:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 7 Oct 2020 08:34:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.106)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 7 Oct 2020 08:34:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3L+shhCTpFgVXbA4x02sL6GijF867CwHXAcl/t/r0neOT7vB8/yY/g84qUvX9gQyWYfoRQxt6L1NQ/ujMmgNDDUs7G10rsoZCUN4IQudljyfI+3bfOIEembvNgR/ES/l02osjAKdFsynNuAYAn9JuP6Q/yvPRLPCajRxZIzY9/lN5Z0u5rRoDEKXRavrYzKxFCKvNzFgToekIHSV/wDoriSbBGi6e5Fbj99N1S0DhXj0jVDtyNXAdm71rxL47U10nssqZNj6pO+f1HWf4xx9RpR0nUQDL8DspqrqR0J4zm9XP/y0lOsCUKKYQOLUJGnb/cAjCaNyPiZ8B2BF+IgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONkl2ZQBJUK9w/piIuldHfEsZGM4StvNKZg/d0N9jEs=;
 b=mS9GwSEGuRRUn3OXobZn4UiQwf4Q+ZTC3o0v/QZvK/jvo8dA4K87GcE1PRiTuqYe4PGzCcneddEjUU0h0HI8DH+zVaeLx45Qmjr4EbFJl4A8YmMYvVJNO1ophwV8yc+vfuSwkuQqoEMgPI7qpYmYqnIpPb3d53+47sQB7Z0cQCk8UcORwbQZwjzGyiob2EwXceWsr7jWNGp2PhCBWlF1jtIA88iv/Sk/OMCVFEXsQPTqFF9mRy2YUYJEt0kFlF9xN0b1oulH8jJRiBBh4uQdr/VgaV8c3jR+Um5TP2pxGTnbRXD4ryvpdUg3xTjEHpjfxpAWk8kMn3k10pFyBuvE/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ONkl2ZQBJUK9w/piIuldHfEsZGM4StvNKZg/d0N9jEs=;
 b=LEdnCy2tYcYwB9HzZbPwiWhD+MTgoHbQ+S/GkkpQN7NYk3zR6Jj0AyL0N049/gDwdgNCgnAT9xyeH36VOuJSgmKFPNKOMWHJpjhAx8QTpB5KmyeNYw4cwi47u8n4S6vKDaoUqS+t7dS4ytTP4/HkieyMHCnuwaEoMSfajogZPDg=
Received: from BY5PR11MB3912.namprd11.prod.outlook.com (2603:10b6:a03:190::18)
 by BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.29; Wed, 7 Oct
 2020 15:34:28 +0000
Received: from BY5PR11MB3912.namprd11.prod.outlook.com
 ([fe80::b58d:df3c:e93c:bc41]) by BY5PR11MB3912.namprd11.prod.outlook.com
 ([fe80::b58d:df3c:e93c:bc41%7]) with mapi id 15.20.3455.023; Wed, 7 Oct 2020
 15:34:28 +0000
From: "Thompson, Kent" <kent.thompson@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: unsubscribe
Thread-Topic: unsubscribe
Thread-Index: Adacv1cx4T83uLFbSASjYI18PccWjg==
Date: Wed, 7 Oct 2020 15:34:28 +0000
Message-ID: <BY5PR11MB391264E87A0BDB747A6BAC72E90A0@BY5PR11MB3912.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none; lists.ozlabs.org; dmarc=none action=none header.from=intel.com; 
x-originating-ip: [104.51.68.75]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03b2bc52-1501-4615-3611-08d86ad67ab1
x-ms-traffictypediagnostic: BYAPR11MB2600:
x-microsoft-antispam-prvs: <BYAPR11MB260097F905BF0ABC53E54845E90A0@BYAPR11MB2600.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j3nqVxxQo8NOS1qUaBMuiW/Kdu41ihDyu8SmJVOq9Lm4myss5XqlOil15+yL4GLqJ9kV11r+nv8n0yG7XzfL8ZFCBtcBpWtlT3WD70bdjKARBBLigVkbDNbRQ1wxdPwrQmbIOcvCxqCQX9CaERd8BCIRZQ9g7r1rBjbvviwrEeb0kXkUNMEOAN1/dseqPmFfKqCq5BHyFcXvD7GFmWrcgN8mfbPQqv5lmKBjVhpy5ns+MCIDuJ/XpWtM9fKNtW529jUnGkMj4KHFjznZQIOutA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3912.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(33656002)(55016002)(2906002)(8936002)(71200400001)(316002)(3480700007)(66946007)(4270600006)(73894004)(52536014)(5660300002)(7116003)(76116006)(9686003)(186003)(66556008)(6506007)(7696005)(66476007)(64756008)(8676002)(66446008)(26005)(86362001)(6916009)(478600001)(166393002)(220243001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: kH/pck11cRr9cAuF97uHJhmUVQk+WWBBw4TByOBZctFtfokCjC2SkqConWfH6cMnUEqn/ElXFMLby6odQu/gxbTtdbRagRA80rOUngtytuU7OtOMVAFv+V9ENpXFKDLC3LVCNJZAEldzQiXFSN7MOpDW6CSDUoLU5Y+JxWHxHrpCrV1KVULiRA7ZQVm+KXLjnw7FKKUqDYtIUuzrVgAktaRwGg1b+Tz+K7B4DEuzlq4FQt6BdWop30qOPtOFOlcN43VMtCCe5bTn62lVCR2TLsgUxdpO/5I5bDANM4cCiWy7de4NhKeGks7fiNGKuxkJYU2/RE3chrCxZ5U7h8EkDQFZ6HwhYPqMTzUik/BVoCxrl6tNRZS8NrbUl8OFWvUYsU0k4pAf1Rjs5J08zFVCFNJhG4TeZgkYFk8p8np3zVeQ1D6SoPGW5qP1PyEDtjBh0uS54EAMBVf/BfUZJMS4d1rrbnmCb1gtDTMI3aDHf6HMcAI8EzaaMwK9pWNTsonzIpydglGhO8v8v3mp2k4fFcOcULMO51rinEyizb+wyDT34ltnM3fmBBT4NwO5Hg02z9/pu8yoPS/8rrcau6TqHwK6vViBET9QjNJbYNThGWm0jhaOB3ime939zPaYgOIMY7/2fC9W+7WA7uL1+oQfKg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BY5PR11MB391264E87A0BDB747A6BAC72E90A0BY5PR11MB3912namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3912.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b2bc52-1501-4615-3611-08d86ad67ab1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2020 15:34:28.5285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uSyLCeewC1UBsc1MwLzR8LHDqlfygOjRKdRqSIk+SyiSeaSO/oNLpeDharjo5IywXCsna9Jj59lcFU6rGOGmQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2600
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

--_000_BY5PR11MB391264E87A0BDB747A6BAC72E90A0BY5PR11MB3912namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



--_000_BY5PR11MB391264E87A0BDB747A6BAC72E90A0BY5PR11MB3912namp_
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BY5PR11MB391264E87A0BDB747A6BAC72E90A0BY5PR11MB3912namp_--
