Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C173FF4B9
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 22:17:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0sf869WGz2yLq
	for <lists+openbmc@lfdr.de>; Fri,  3 Sep 2021 06:17:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com header.b=qbHkgXmT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=zhikui.ren@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=intel.onmicrosoft.com header.i=@intel.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-intel-onmicrosoft-com
 header.b=qbHkgXmT; dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0sdZ69zJz2yHS
 for <openbmc@lists.ozlabs.org>; Fri,  3 Sep 2021 06:16:28 +1000 (AEST)
X-IronPort-AV: E=McAfee;i="6200,9189,10095"; a="206454827"
X-IronPort-AV: E=Sophos;i="5.85,263,1624345200"; 
 d="scan'208,217";a="206454827"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2021 13:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,263,1624345200"; 
 d="scan'208,217";a="467591909"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 02 Sep 2021 13:15:25 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 2 Sep 2021 13:15:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 2 Sep 2021 13:15:24 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Thu, 2 Sep 2021 13:15:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=juEA3eH7wes1YPrNuM/xHgZ9ywf9MRl8Qsy7lsfNzQIO2OnSOpXn2KUKF/6f+bzMa8iJMgeXwoCbStNyy50RavwJH98Hg/1qBVqpKc0HSp0Lj9h8Px3tSK+ewU1WlA9YuBMBvSVQl1nMAvWtOLsyITPc6mok9RDrrL4BngEaNjEn9sV3RtLf7AKEFuL4/FebAJjRLJLXTW97M52ALluGQpyv678EHYdlzF3hCv8WBYRloZdfIKX302scPz/HbUT3yH2xPdDZ48emoua/gG4PaFHthxJRoW/rBOGiaZmq3VGdIRtgNKMf1qTOHe+hriN/hZou/sujJGWgBq/835ZsFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=hksxF7WzBM01Y0hLzN6vWvU8AhnAL4a4rFau7dTj9Fs=;
 b=ebCW2U5XSfOwuEfJ2kSU+pFIuALzYyJQocGTo9HFx8/jLlHy57Uqyp6oubwgkNLVEQrQtfGt8/st8uM+WqG1nLBGhIYshgBOYmXLFGv+sLOdgcLYnMBVaOAiV3wzZf77gRKlhMDvV8wHCOtJXJHspvEvH1gQfCaGR+nYSToTmcv4Vp8dyGjBWwiJFF4sR2BAQ2SxO/Hv1HoVlKcf9Z8hk52ZLoRDMvbw0YylWQdFN3f329SQiBkN9MmK2PXGw8bPQMp3J7b1+SKZDA7+93K5EWx02sBB/X9nP5gs9qC4em4BZ+NkO//6AflI9yNTHBIlFzMbE+VM1/2X3B+NV9q+8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hksxF7WzBM01Y0hLzN6vWvU8AhnAL4a4rFau7dTj9Fs=;
 b=qbHkgXmTEbOPCa1nerDtfhyEK0gzVL+g5SedtZWvWYrHZzEcgobFHHlLriKl3/UhdBpmgspHc9Fuml3D6R5XzbPqEQQ6Sy79MpJM3VdYvwKGKhW8OYoqlj6EiNytXDwa4f21UTA46aG2fhRMuUAJAmYying+GO7PB8dhpN6F758=
Received: from DM6PR11MB4410.namprd11.prod.outlook.com (2603:10b6:5:1d9::11)
 by DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Thu, 2 Sep
 2021 20:15:21 +0000
Received: from DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::b0bd:9d01:a28c:6367]) by DM6PR11MB4410.namprd11.prod.outlook.com
 ([fe80::b0bd:9d01:a28c:6367%7]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 20:15:21 +0000
From: "Ren, Zhikui" <zhikui.ren@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
Subject: beep code manager  for openbmc 
Thread-Topic: beep code manager  for openbmc 
Thread-Index: AdegNz4ix6KDZmesSHKifuGcFpVNkQ==
Date: Thu, 2 Sep 2021 20:15:21 +0000
Message-ID: <DM6PR11MB4410B40F9D7DC46B72B0C87594CE9@DM6PR11MB4410.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none; lists.ozlabs.org; dmarc=none action=none header.from=intel.com; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38485d55-53ac-469c-1bd8-08d96e4e6407
x-ms-traffictypediagnostic: DM6PR11MB4316:
x-microsoft-antispam-prvs: <DM6PR11MB43162AC207FCA6971D07CC9A94CE9@DM6PR11MB4316.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0Ysi0vZcvwDBgrOv+GNrB86RBgugU9RP6RPhnt4Ayqia0O5ZfHYweBrSeAYADNu0quKlIrMjnAJJpZkOe4oqAsU3H38Jo4IPr7j49m62A2hCcyUm6tugvzkIMCJ13Ux1351XVJjlLZscsSagZbzvlNv9RfGkyraOyshnDLXJZ07irivr9lMvRl1K2pzVpD9ELtCSO0nGWxUHL0OPgX46i1/AyN/Gr/150OFHq9vjkWtRs6Z2YKq9W2/3tSbLt636dnGQL/ch12zrZUAI0Jr8XU3Glf0PKgsHws8zG7ypv+FJMME3rsqTOEynpw0C6GaG1PwJQg9nU4T2ZZNuUDIUVGRfCtCzFvo04wn6UJYhuF1Sqmz35QmuL7aZl1Yj2fRTnowRNVRUbp8Y6y9/p5Yeh2MsOa/hcf2cq5XdtDENDbsQlFgnGeJozVPcfmYHYlikWMPpyS+78XK61DH9lAyd1HjAqda/+KON8xEvsUYqhVMZhtxtCzeC3Qer0egZycgt2s7IBx3AYlSMWXovEXxRcIViYmXHsmGApBMj6FrTng769pAS0DyhkqusNRn5C68ELcM5nMFIulqT1zdVV83SDU0AfLbeRP9HmUZJs2resu5S5/4DIt6ODjyurefL8L0HES2Jd8I3zUzGejLe0byszDoJDgkNGyf9wxkfd29wducBdZ/c4sIF3Wzlggx/oyd1rriUSCKCanOKLC35/Veu1WNWORpUSTFHa5wKR2/sdw5p1cDwNnPBhonRU4N2rvj0ZHI/3iYDXCDCc2Ae+nPB0HdNKyrMXUhB0p9zv3b1YcI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9686003)(83380400001)(76116006)(66556008)(66946007)(64756008)(166002)(186003)(66476007)(66446008)(7696005)(8676002)(122000001)(8936002)(38070700005)(86362001)(4743002)(71200400001)(6506007)(9326002)(38100700002)(316002)(508600001)(966005)(110136005)(33656002)(5660300002)(2906002)(52536014)(55016002)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yAlMEKEmiHIbGdgZWTrZdJ7JmEAo85HH5S0lU9N4E/OyLvc6iowc1K4QNvVY?=
 =?us-ascii?Q?wqy2yumwSv85fx1gpSSuZMG4z6bbuvWxqqtyG5QmxC25unCEaOA/nJH8On5U?=
 =?us-ascii?Q?byuEZZSGTeb0EkWKXmHKWiBOTljClQLgPjI2vcO7mDjB0QQ/s+vPbcjY3zpk?=
 =?us-ascii?Q?theNTrSp006FyAyfwyGaZTjKcl3eSO3L6T3H8JDLhyv7anZpYvQLwSMiic9l?=
 =?us-ascii?Q?gtKCx5lxBDkai8Ha3MGMHC1ahV+mo7qw8Z7NFK84GjOOkO+Y7+Kui2IbIY6l?=
 =?us-ascii?Q?qX4GYcSV60/d4K/aTECsBTHFzflFe2nodnNlo6ykpRiY7UpzxDXzgW0IihRx?=
 =?us-ascii?Q?usIlMfLIPBW6veFMoH4ViqBkEBQn89EzMrD7lXD1yQB4uLCjlAQ70PxP1qg6?=
 =?us-ascii?Q?FyyHa4GzuvzbpMSbi9xENa1Qgc44Xxq9wu3AJ5CLR97MRiPem3WjFwNEngh+?=
 =?us-ascii?Q?rb9bCSxpWfKI3+HsTQnPzVtroId3KVxOS7gYmgGb1azvaRHeJd47qvtbr72L?=
 =?us-ascii?Q?irOiBSG1dh/MKN6xX6CJfFOV7nRbP+I+Mb6i5/8Ihr8Syzcbv5Zl6jusyT20?=
 =?us-ascii?Q?0KNh0qVij0JQBPdYVgHylZUontFGlfXlrgokJRYpVSDUws+/LB6ziphyNC4q?=
 =?us-ascii?Q?NrXuLx//AtQ+oLCRgG0qURXmIURsd3NVqUz+CGApHBn/jGAc7NdSyb8bOTe4?=
 =?us-ascii?Q?zSHpKPK0fO3cQ9i+X9OMHlllvp+62CLFcaSfWI5Fudp2PSVqYiUPevT+2hJx?=
 =?us-ascii?Q?9yWsFJUvoreECcFW0/D1U03LJRxDZR4/rrkDmWYjqoOytsTT7iKTk60zdoJF?=
 =?us-ascii?Q?Wxf4Cm+PLBt8/PYThY4JAwpvb2g4iizagH5fw1U1sR6n/NNcO55WnuvNfdb+?=
 =?us-ascii?Q?KsBih3/OfcNe6k3w8zgM7ajJlJ1hgkdWWf9M3myrVmnvnP/RfrB57I+dAXQ8?=
 =?us-ascii?Q?YKIgXcv8ea2rdvkDXwfuz6x2scIgRCkhsLoVZR1IOXL+2m0ZZ10jnFXV2O7Z?=
 =?us-ascii?Q?8MpY8/GVxEovGePJ2MyI2LpLWtwz1sfzhrgW35pxU4tIp6FCsDjL1wtADuu1?=
 =?us-ascii?Q?Q4NooudVUO0F8JC+V2YDooVncV6gAtnHntzdz0WJnq+l3yKud70tKZrtoWI7?=
 =?us-ascii?Q?PetLM71IIxQYyzCkZyieEbCulkeT5dORBkLNJ7kah/wyy3aSXAAlVJJo1xbC?=
 =?us-ascii?Q?TnoHRZ+o1joLqAr5kUowXQ9goWPrFy7IGM+keFS42bxY7ivZOSo3golDPWH2?=
 =?us-ascii?Q?/PyZ33h+TS9KX/yydESDCtWpGyIJGAjRXyJM5lPpTmceIOpFeJDemRFXG1TC?=
 =?us-ascii?Q?k9meNdpxZFUzBeUfs+BO8RIO90XxYHmDJ0xmiTIViog79plqfFQXH1GbjQTH?=
 =?us-ascii?Q?eLL6KMcrhZrUgPqfUzUaEX9ohjCZ?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DM6PR11MB4410B40F9D7DC46B72B0C87594CE9DM6PR11MB4410namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38485d55-53ac-469c-1bd8-08d96e4e6407
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2021 20:15:21.3508 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5tXjcWCYotn07b1ucH/EwgFWU7K4nrlToYUA5O63s/6YpCdtX+soJlCh5HFzEdbjC6KwhNnPF5+s6qEWwYMqWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4316
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

--_000_DM6PR11MB4410B40F9D7DC46B72B0C87594CE9DM6PR11MB4410namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

Beepcode manager is a stand-alone beep code service should be created to ma=
nage the beeper hardware, and provide D-Bus methods to expose the beeper fu=
nction globally, all other services can use the beeper hardware by calling =
the beep methods.

This package has been included in our distribution. Now we would like  to u=
pstream it and make it available to the community.
https://github.com/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-comm=
on/recipes-phosphor/beepcode-mgr

Since it is now a very light service that only have one source file and a s=
ervice file. I am wondering whether this service can go to an existing repo=
sitory.
If not, we would like to request a new repository for it.

Thanks,
Zhikui


--_000_DM6PR11MB4410B40F9D7DC46B72B0C87594CE9DM6PR11MB4410namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
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
	{font-family:"Calibri Light";
	panose-1:2 15 3 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
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
<p class=3D"MsoNormal">Hi All, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri Light&quot;=
,sans-serif">Beepcode manager is
<span style=3D"color:#404040;background:#FCFCFC">a stand-alon</span><span s=
tyle=3D"color:black">e</span><span style=3D"color:#404040;background:#FCFCF=
C"> beep code service should be created to manage the beeper hardware, and =
provide D-Bus methods to expose the beeper
 function globally, all other services can use the beeper hardware by calli=
ng the beep methods.<o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri Light&quot;=
,sans-serif;color:#404040;background:#FCFCFC"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri Light&quot;=
,sans-serif;color:#404040;background:#FCFCFC">This package has been include=
d in our distribution. Now we would like &nbsp;</span><span style=3D"font-f=
amily:&quot;Calibri Light&quot;,sans-serif">to upstream it and
 make it available to the community.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri Light&quot;=
,sans-serif"><a href=3D"https://github.com/Intel-BMC/openbmc/tree/intel/met=
a-openbmc-mods/meta-common/recipes-phosphor/beepcode-mgr">https://github.co=
m/Intel-BMC/openbmc/tree/intel/meta-openbmc-mods/meta-common/recipes-phosph=
or/beepcode-mgr</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri Light&quot;=
,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri Light&quot;=
,sans-serif">Since it is now a very light service that only have one source=
 file and a service file. I am wondering whether this service can go to an =
existing repository.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri Light&quot;=
,sans-serif">If not, we would like to request a new repository for it.<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri Light&quot;=
,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri Light&quot;=
,sans-serif">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Calibri Light&quot;=
,sans-serif">Zhikui<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM6PR11MB4410B40F9D7DC46B72B0C87594CE9DM6PR11MB4410namp_--
