Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E59276448
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 01:02:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxYbP3V7szDqcG
	for <lists+openbmc@lfdr.de>; Thu, 24 Sep 2020 09:02:09 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=kent.thompson@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=dGu+oudD; dkim-atps=neutral
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxLmQ3NsszDqVQ
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2020 00:54:05 +1000 (AEST)
IronPort-SDR: qc6hIq9ZmV2vtCBSxkfmuHhE0pHRCTSNYCJkp6Iber43/skpDt6mt+FFrx77Pl6dmVr6Kl9sPE
 Z93nXd5DOUfQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="222481746"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; 
 d="scan'208,217";a="222481746"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 07:54:03 -0700
IronPort-SDR: ihGV5wxEf6oaz2pUAzISyHFXy0KZkoi3OnGTptiyoXuDshticBwfJonxYOoC9oSIRmvkNZkmsa
 diBUwMkcREqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; 
 d="scan'208,217";a="413013748"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2020 07:54:03 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 23 Sep 2020 07:54:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 23 Sep 2020 07:54:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 23 Sep 2020 07:54:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k+ZOHaurJG8WIKJ+S1WVs9M6uq7D92GiOpPjzOpcL34fODkPokllSKRDdXHCfjNgpBPQccSVj0/deVy1mwr2DgZnfFQk5pEvPd6r/YQ3JnJDGKUr790p/XrHr4YnKGg1kHeGp99wFIdFyPVSLC2pYIP0CMEIr8ueeJBHMTc1kMfeXkvMxfVowBHyki9oSnRtYluHHjjNe74rfXIekwNZh9bD2rz13kNg8qtu+KysjSCeXh+CecB6lEZqljiRjmSFzxjVae8nI3Ql6NREZxSl1MfQ6GrEtpFhuXXzepST061UcG2ZRJHjZjeGWvMmJcjkWtqKolE1g7BP9u4JZciZRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6nDYHNLe0Ybx65GKvjBGL4nHXetN4GQzaTte24B4NE=;
 b=eZZ9KgAWCtvBkEaFeVpYoLiLeA7ntrIZDq25CZ+pQ313QxtvbbdFHTfRrZI4p7CWFQCTPOmOsJ7du4LNMkfPn6+k5iIHG25vBck5OZkpr5A/B0RY0BsExuEnjAaEFt4ZOxVYyCZH4NNfbmvOLkT06DiBS4wkxH5RqpKucC6x7g7pxsKcy9SsikYOnie8WIO+bNLDC5SgUGb8Q0VGNPdz5L/LUdFnPQTAjebptRJejSTNCT8Qiu7F1l/alYVqx4gqcezBByh7eiINzW3BvmTQtCzbLHKdtCGCzRMq2exWm8XLnuUYRePYZ70V+2M/r3Zn8RVEZpfExL+d78HMX2RUOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6nDYHNLe0Ybx65GKvjBGL4nHXetN4GQzaTte24B4NE=;
 b=dGu+oudDSdT4d7jw3oq8HVVCEUISU4/aL8OdersA9UnM2uqa/NdS/f38fLMyM/Y6kZk3/TPLs0MiIbsaBBtfskegaGrG9ldHTlpRw319C6ACeLjYD7PD30cM9c+nXxaAmP11zvlK/jSuY/Q6apRKDO7pOx6LvF9vQdTfyJZ5lOs=
Received: from BY5PR11MB3912.namprd11.prod.outlook.com (2603:10b6:a03:190::18)
 by BYAPR11MB2600.namprd11.prod.outlook.com (2603:10b6:a02:c8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.19; Wed, 23 Sep
 2020 14:54:00 +0000
Received: from BY5PR11MB3912.namprd11.prod.outlook.com
 ([fe80::b58d:df3c:e93c:bc41]) by BY5PR11MB3912.namprd11.prod.outlook.com
 ([fe80::b58d:df3c:e93c:bc41%7]) with mapi id 15.20.3391.025; Wed, 23 Sep 2020
 14:54:00 +0000
From: "Thompson, Kent" <kent.thompson@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: recipes-tpm on qemu
Thread-Topic: recipes-tpm on qemu
Thread-Index: AdaRuR1QU7KVba8fSAu/QfZH6HgjkA==
Date: Wed, 23 Sep 2020 14:54:00 +0000
Message-ID: <BY5PR11MB3912CEF62A96635A64D096B6E9380@BY5PR11MB3912.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: ffb14e9d-9ef2-4b5c-f678-08d85fd0818a
x-ms-traffictypediagnostic: BYAPR11MB2600:
x-microsoft-antispam-prvs: <BYAPR11MB2600FD28D36D966879F71DA8E9380@BYAPR11MB2600.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ra3rx7WjUMjDA05fHdAtP9DwB/eoJDiWF+OFfz5xcr40qrAKutuxbrxSBHgxNKv6fMlhNaPgBIwLTWJMf6+nbvCcGBrjbWmZmdZdqb9QxNiBfBoF50UPOW2P+CDXbpcjZxyL3jZKKRkFrR9an7I2UkO9LgMeVZiLiU67zWTTcZ+j4uHN7gLUSPYq6KjM39AtC6MWFODSQffCL/aLz5YIQ2TyIHJX5r6JIEvc9OMU+vWU6DV/sd0w0rWE5FVezUZGF6gNSzgtBh6hECXbxlMs2GrW19H/h7umTpOX2uXooBRHjjZpc6u3yGMexzxOEoaY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3912.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(186003)(558084003)(86362001)(66446008)(64756008)(66556008)(76116006)(66476007)(66946007)(3480700007)(9686003)(6916009)(55016002)(6506007)(7696005)(26005)(316002)(2906002)(52536014)(5660300002)(8676002)(71200400001)(33656002)(478600001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: r2t9Wb5O6g7G/tjwPe70hfjMblHnWXggBSpAaWdow8zI8fKo1HGeUds6BiCHMSo2aRKAp3Y8fWq6FTK7unLSZDojc08GhfAJlta/RP7a+dgK4QS+XqXlITvj/dewPsoGvux9YjxLEpvdnDxf6cWLvvJvhyHFxiGW3GXaVQZ8CVhNhufw9X5SHtTLEIUU8omeASTuDXy0lglbchN7PtS5vWawKVwhqlOZKFelivjKHSQ7QLjHi0mL4v7Doqyznl/+YhZ8W2GoDt0bmSJ9gF28syyJ+7KAhpPDQTbDF+ue+aS2exWTr5YLoTloYQlg9luOUvD4RZA8Miclxj6qhQPgvKJdGIFz+/krTjifX5kMhwsGKq26jv94ZjUGjpLzUI9pmgsHUhpGIuwfM7b32FlwOsmPMSpYmlM3M9oedzYtblpsSXKAWcw9+zo5UlUcE1KWg/rLbfJOXqlBUwyMT2RsbV+lIyrjowE+8bbg9xlhSTHFLefX4KLRKxsFZXEwy3b6eWbV5brXGLgigXkhI1V8RspMTR7pT7Fah2lON+Vi63Rj5sDLHPiD5hxoEr9VHFdjQptbo9Etsmzz3JTQtgvoFssJb0mQtCRU6itbVvrsNJh6eiN8DXH9r5e1ANjACMZp7cevOwHgXy7KbLw4v1wvsg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BY5PR11MB3912CEF62A96635A64D096B6E9380BY5PR11MB3912namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3912.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb14e9d-9ef2-4b5c-f678-08d85fd0818a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2020 14:54:00.2620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LQ5/WXyNhzCNa1elKwDC6CMJH5wMACoF3X9Snf+pOPuXe3aCa6vXVsQmMxzQpiDUoOo0vEkViVunX6ePSjEmyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2600
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 24 Sep 2020 09:01:18 +1000
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

--_000_BY5PR11MB3912CEF62A96635A64D096B6E9380BY5PR11MB3912namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Are there any instructions for building/running 'swtpm' and the tpm related=
 recipes on qemu?

Thanks,
Kent

--_000_BY5PR11MB3912CEF62A96635A64D096B6E9380BY5PR11MB3912namp_
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
<p class=3D"MsoNormal">Are there any instructions for building/running &#82=
16;swtpm&#8217; and the tpm related recipes on qemu?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Kent<o:p></o:p></p>
</div>
</body>
</html>

--_000_BY5PR11MB3912CEF62A96635A64D096B6E9380BY5PR11MB3912namp_--
