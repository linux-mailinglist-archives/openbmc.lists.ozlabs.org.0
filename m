Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 829D547FBFD
	for <lists+openbmc@lfdr.de>; Mon, 27 Dec 2021 11:54:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMvgs2wvQz2yxL
	for <lists+openbmc@lfdr.de>; Mon, 27 Dec 2021 21:54:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KFyyzAHp;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=shuox.zhang@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KFyyzAHp; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMvgJ0bWWz2xsW
 for <openbmc@lists.ozlabs.org>; Mon, 27 Dec 2021 21:54:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640602460; x=1672138460;
 h=from:to:subject:date:message-id:mime-version;
 bh=3iIvcpHYV/pUPSd3sIrjteOJobJtvsJIKiNMjbz91Ew=;
 b=KFyyzAHp0gMV2lTiJnYvAZCS5sZxGCqm/PgwpNK6V0LzagKuU3qke2aN
 HXZ52GZykDi6vr7DbllmEGD2941lw3xEQikaEDsCeUA9GreZl+JkPI42y
 yNkW8vre9ZcOux2E9y8kO1V1SVZDYsi47pQq6ZEN3oBZ9vdvFv7rf2e3R
 JGIc7HY7E7bR7kziHrGmaPpaDHUz2ijTz/IMX1gKWRsJw99O0nEO2cLJ2
 CZFLhbmIMgKucjSzu5xy+q2tpS5vc6OuYKL25HKKVgVkNMfoe6uB9BNLs
 yspQzgdEHsrSMxxJeOwgI+Dr/nFNtW3vTcFcXFJcEQ4oHPLKLfdQUaCho Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10209"; a="228498507"
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
 d="scan'208,217";a="228498507"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2021 02:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,239,1635231600"; 
 d="scan'208,217";a="523245487"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga008.jf.intel.com with ESMTP; 27 Dec 2021 02:53:08 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 02:53:08 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 27 Dec 2021 02:53:07 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Mon, 27 Dec 2021 02:53:07 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Mon, 27 Dec 2021 02:53:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7y+1TsBzMVXVtijn+y5L3Zd9Mz4dDYMjezzZzKrhRA7A+v9rHUrezZPd2dWpEq2I0CQION1wve7MjjVPBwmxbWjtAjShbtn6XYB+QYNAA72w/LPV4BpaOM5RxIWmAG319YwXvR42sxHIL0l+9ljyPrizqk0jIkQQaQrMJMinK7HMRoOQHtYtSFYIRM3l//gaCyPd0BpDHjvjUiFxkRFAWW/wcagVp+ARDHVC5WdDGhq0rXj93RCmPaHi8Ir32a975swSLHrSKopnG70FTTMLtDMfOt6RfXz/6Xr+D92mPh9N74d0W0yK/ZWrtWVg1O1Ydbdmw0XGA3hsQzwzG20bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KNuCWeONyPaikIjnkPt22Ic7MTWKY3O7pQKO9ooyZIo=;
 b=YesP0/k7aV3GJwy2JNmrmoBxvKl8hF1jb5ZlD2OjmyyTDhIj8CVNaxg/DfKQ1zzfis1FvRo4k7n9c5UkMCIVDoJeF1cc/ZJvq5GFLbt8MkVJvdYxh25rvlUMMkNFiZVmivRN26A+fbGWHHy6NUoEdtg/Zrcf27wqbkMeUupKkLlWpl1Gbl8KCDkdLdxXgUNW+ySzPBUHIoc/T/2W1t0o37b6IGTZlsT90Hrk6N4kZQUcWolhsg1JvNoYBxtYK5JSOdJWkW/X0mk5DtdMZ+M535sEmxCBcS4L5Yf2my5VwTu392oB7Hkc0HHTy0Sb++eXo/bcARwivZgBl9ucvGdx2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3349.namprd11.prod.outlook.com (2603:10b6:a03:1c::21)
 by BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Mon, 27 Dec
 2021 10:53:05 +0000
Received: from BYAPR11MB3349.namprd11.prod.outlook.com
 ([fe80::8864:1d:ed75:55f8]) by BYAPR11MB3349.namprd11.prod.outlook.com
 ([fe80::8864:1d:ed75:55f8%6]) with mapi id 15.20.4823.022; Mon, 27 Dec 2021
 10:53:05 +0000
From: "Zhang, ShuoX" <shuox.zhang@intel.com>
To: "ed@tanous.net" <ed@tanous.net>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Sometimes https certificate installation fails
Thread-Topic: Sometimes https certificate installation fails
Thread-Index: Adf7Duea4mE1vLKrThKwAfaAk2sl4A==
Date: Mon, 27 Dec 2021 10:53:05 +0000
Message-ID: <BYAPR11MB3349652B688B83BFF5CD0B28E2429@BYAPR11MB3349.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1b052a0f-72e2-492f-be2a-08d9c9270f91
x-ms-traffictypediagnostic: BY5PR11MB3909:EE_
x-microsoft-antispam-prvs: <BY5PR11MB3909A886459A32B6BD24459BE2429@BY5PR11MB3909.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hhwZ7PaoabK2AnS22BgJkSATn1LhSRUh7IEMV7cdiLzUrVjwfsha7RyKuFf6slNCICCJTxk76xwx6g/AArj2uUBHpZKpxLQlowJ6Jio8KgJKuPSR4UuANzUf89Dpg+o+VxG52W5PHSvavdgzKbAR074P8LOvHpJ4lxptDZ2rGm5TxGuOE+QqIJA2Z5Lu88VbeuO/FCa3e11mY4LwOpFBhLEPaBO0kuzCdygTSeK7eY/GmnpdJisLxsteyFxFZh6iX6DSo66ACzu8/c+lxslzie1MCnQ0Lj0nqPK89pIgnETvTmiz7Zz1ZXWlfZdSNazWfj9d4cHMBZJs9QEJudqPN2zrphnyID/8rrSoHIpMOk8jC3LEwy7IMcTiYdlPQcfGfSfFFZIhnXLCLdn24QbPG8HsSJ4t9B9aikhMeUX2nLvzav6VW5VNhmKqetazOMx8YFNzRcE0xvzTi/mQ7FR8NSuptPFt7DPngBcrPkPL8+ybEAcnjSMYItVgjCj3JtxnNqq8ozmeyQzGK7rVojJip3joV77e19nsReEcodd3/2JEOlc7d/NN5zj0FGVBu6vK8mfAXKA7c6U1O+kYDSrg/4y4hZujlcu4m/52o842Mppmlajl7XCyGf7sWf6yWRR0V2KJSQyKez1ElvqgTsNxYt1QW9pjAFP9lycYfO+L2P3MkqRcU5SXbeflJMgou/+Am41bhn4qCZddnk6EAbC7+w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3349.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(55016003)(7696005)(86362001)(508600001)(186003)(38070700005)(82960400001)(6506007)(26005)(2906002)(316002)(110136005)(38100700002)(9686003)(122000001)(83380400001)(5660300002)(64756008)(8676002)(76116006)(33656002)(66446008)(66476007)(52536014)(66556008)(4744005)(71200400001)(66946007)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?koi8-r?Q?R5fHk3WaqNzo8mvEoVauQrpDhX/KsSWrPPwn/jMFmRL9Wo2TSAUYGUg1b14uEA?=
 =?koi8-r?Q?8atF3X5J8pqpD42U7wSn4WQi5qGqgtixzdCTNmqVGqBoJDB/fjKV3JDv2w+PMN?=
 =?koi8-r?Q?ubaIv++9DDgFLjSy1AHHuzDlJOE8MpARPK+2Gw3m/YmDE7bMS0inL2y8X0XN/P?=
 =?koi8-r?Q?ABldqW28OBwhxqnMjjPKyoToUAACT0/Ilpb5bdxRTz2qsm3t+5pHakGw+86kdJ?=
 =?koi8-r?Q?jwQyR9YIQH26HASwZWV3L0CpDxJsb7Vgbd5mpf5BH0nj+DMgLLRH1ukuqZnPYd?=
 =?koi8-r?Q?iqwIwK54g2gA5KtewEefT7Wca1QBd4EzUeQHXsufWtb+sZAlbAqcUK+HGUKqwK?=
 =?koi8-r?Q?Lqq/4wcr1TgrC2G0CwBlGyEqwZ8txcDVjzm4qOfKliVkw/dj4/LFkJ73/y4zNs?=
 =?koi8-r?Q?j3xI9q8HfV8mI2TCdGtKqCGJ7/gcxIVXePIGInaxS1RZ6KpcqBdiDDArIfeLFq?=
 =?koi8-r?Q?ht7DPDSJcIgRs5gGgXbAIiT0nYsiwMGKvZ53DFdIzRGfCDwUoH2WC5jNPBW2rD?=
 =?koi8-r?Q?zQSA9dg/XHWcPH3b4iAn37I3ziS+BATNrA2cmBoFvaOJR9gTNkehy+N1Z2Nktc?=
 =?koi8-r?Q?zsexhIXbGaQ5TJj2zRaeqv5Ldc7FXGE4V2is32fSX86qXZTvIk/nfU/eH+otwT?=
 =?koi8-r?Q?62EUHpTLhP+dVomaZm/zVf9orpu9F6CFAWSA8RSgVfa5LicZoKEAiWd3f13L8Z?=
 =?koi8-r?Q?K06SWn6cYpe8pzU88PoEElsOjnAqka7AGlXmq+jYUjZgGgMGTk1NJSb5zBAuiX?=
 =?koi8-r?Q?TrQPTaHA5fE33kcsWAdSvQaXbMMHCanpWt3yRHq25v36qmN8QMLjbYZRg8vR9z?=
 =?koi8-r?Q?xJwti4JH0+2vwmKRrVtLcvx325YvdAfYc7eC4rEBU4KU3s1nOLBSxZHDmwLdhf?=
 =?koi8-r?Q?SGCeDVT/O40R++Gh4QOFKVCRhZDsEdSEhLs0h8ngMQ4WD1dscnkN/L82k54fi4?=
 =?koi8-r?Q?lgJ3PSGVatPc22fGftm1NA83u0FWqIETmRyDeBHPk6abak84zOeAvS7cz3v5eG?=
 =?koi8-r?Q?IboW14JHHL0ethsXJCKc0mzqPWEbRfTbee5peAbjQPRbZ59qktNVCJZ+i6ayyj?=
 =?koi8-r?Q?B+eazo/+2AHNrKwIO+HDNdE9tgN8VFWMOgq4JfP4ZI4liOpDIgP2XplZV3a6Xk?=
 =?koi8-r?Q?0LiXxHyJJggf55bqQHNx9N74/yE9pzUEvqus1ec54SYEw7s8eBTET/fOGzZSnP?=
 =?koi8-r?Q?d9FbaXD3SN7SMPKZ3E3MzITut3O62ntSJ/HsI5Bhgdjusola0cPKugHuZeqaOs?=
 =?koi8-r?Q?PWmBaRTzrjbeKkpcim8YvbdhOjNGtpE5l5E8WT4EtwfQaMfqd8sjelLVNvuKN2?=
 =?koi8-r?Q?KjK4u++4hZq7pl7TpDx4ZMy8pSlpTlHzN6DNYYnijv1BdNy49LiFMDIaKNnv6y?=
 =?koi8-r?Q?dpDwXzC72DLweS7QI4YgXb/ms+Iaa67oYO2W5cIEy8TIFILRW/W4P2g/iw7JI5?=
 =?koi8-r?Q?b0rKuFaIhSp/OUq5xNSE4xn9jVBMHzNsNQB9iJGO/4fW7mqSWgYvqKw3QT7Xn4?=
 =?koi8-r?Q?Ap7v0lOf3IaDAvDuB9HPebE7herjLEkCwZedUkIuhwceNv144KjYG2wVXR8IfW?=
 =?koi8-r?Q?q7Ji5CqZ76Nt1k7ohzcFx0eIwGHRKew=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB3349652B688B83BFF5CD0B28E2429BYAPR11MB3349namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3349.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b052a0f-72e2-492f-be2a-08d9c9270f91
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2021 10:53:05.0763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hf+hWppso66a0OfFMyOxPbSBurXuFkh7kf9Of/5yvFN6Gj80I9IR8fSDiM1IKtbH39/SLcPk47P+rzf8oB2Olw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3909
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

--_000_BYAPR11MB3349652B688B83BFF5CD0B28E2429BYAPR11MB3349namp_
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

Hi all,
       Sometimes the https certificate is not displayed on redfish , but /e=
tc/ssl/certs/https/server.pem exists, and other URLs can be accessed.
       It can't find its path under dbus .
       Is the default https certificate called by bmcweb, and then phosphor=
-certificate-manager is generated ?

=84=80/xyz
  =84=80/xyz/openbmc_project
    =84=80/xyz/openbmc_project/certs
      =84=80/xyz/openbmc_project/certs/server
        =84=80/xyz/openbmc_project/certs/server/https

--_000_BYAPR11MB3349652B688B83BFF5CD0B28E2429BYAPR11MB3349namp_
Content-Type: text/html; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dkoi8-r">
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
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Sometimes the h=
ttps certificate is not displayed on redfish , but /etc/ssl/certs/https/ser=
ver.pem exists, and other URLs can be accessed.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; It can&#8217;t =
find its path under dbus . &nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Is the def=
ault https certificate called by bmcweb, and then phosphor-certificate-mana=
ger is generated ?<o:p></o:p></p>
<p class=3D"MsoNormal"><b><o:p>&nbsp;</o:p></b></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span lang=3D"ZH-CN" styl=
e=3D"font-family:DengXian">=84=80</span>/xyz<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp; <span lang=3D"ZH-C=
N" style=3D"font-family:DengXian">
=84=80</span>/xyz/openbmc_project<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp; <span =
lang=3D"ZH-CN" style=3D"font-family:DengXian">
=84=80</span>/xyz/openbmc_project/certs<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; <span lang=3D"ZH-CN" style=3D"font-family:DengXian">
=84=80</span>/xyz/openbmc_project/certs/server<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in">&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; <span lang=3D"ZH-CN" style=3D"font-family:DengXian">
=84=80</span>/xyz/openbmc_project/certs/server/https<o:p></o:p></p>
</div>
</body>
</html>

--_000_BYAPR11MB3349652B688B83BFF5CD0B28E2429BYAPR11MB3349namp_--
