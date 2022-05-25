Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E7B534A9E
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 09:03:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7zR83Jtfz3bkD
	for <lists+openbmc@lfdr.de>; Thu, 26 May 2022 17:03:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z4Ha13+M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.115; helo=mga14.intel.com; envelope-from=qianjin.xu@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Z4Ha13+M;
	dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L7TF06HBmz2ypR
	for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 21:22:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653477749; x=1685013749;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=GiPoPjQNrJEdyEe8+KRTtA2FWodZlvZGsxfRflNZSdQ=;
  b=Z4Ha13+MUVYV81cR8XVqDFAIN1ZHnHU1KRM4ouVTekJ/bxCcIhG9SlQq
   uLnY3EGylKWLqgJZgCEDnv+Nkd/kc6tB66ys4BWJuN17b+xAvox18SK+W
   zm6lLrGPC184g3tMokhs03RY4XN9cegQOcigbyZK3DGllKk9C79rq4Z91
   WcEI22GD77dNMxz5TMfY6vbJJYlwxZb7peYkhDBFma1kQE+uYZWMyhxIA
   ujijzpElKFGD62wcxxUg+djuQgKeZgNPSVrdSyuqiYEwSfBzPQObDPsd8
   qXg5wBthY87v7ojNHexL4NKncxWZOG8sjsHnJOvJqHRJAeRjyDnFxqBKG
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="273897607"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208,217";a="273897607"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 04:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208,217";a="578296263"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga007.fm.intel.com with ESMTP; 25 May 2022 04:21:14 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 25 May 2022 04:21:13 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 25 May 2022 04:21:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 25 May 2022 04:21:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 25 May 2022 04:21:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F/jj4zOKbGS5tg7uhxpKugyIpzlst8B2LERMGsXwT/Ebn3O8mY/bykOB2eS0EpABk3Bj7q+zHasCWPmj6Z0XFI04x+DPce9Y9vXs/D0QYm8O8nQP8q5Om1onQ7kixcxBIAFbXFjqIMQh4I2Nlye98XwouiQBjZANe4u5LYJCBLRjUBMUlK4KZdY8FFBIg4BnwDklqltG8J1DF3VzXwHPX7RWQpXchUhVQrlqJgjur8YVVw5ycWZKEJ8BlIyZ4k6dQX41PotsEE01Rx6qr1FJyuFQvId9RArD9DEcAU6CDbJV8hIUFmG3lkdqwpJu5LUlMByOCMO5+KlXoH9NzGGnFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8qzW3vvJKSPEGl9u5mC0ebKT9HSQeyLLeNCBhG742g=;
 b=MhqyVXYZHL5c6b5Z/5wh6B1MKDc/GtQPt2U40UDAzSZTHy52ZzQbJu0AIXFHqon6h2A19LxICDE0qGq+MDodF78mgX90UGxJk8wWxg2SBIoeiN3MnEOY8XPfEDzdiZGprQGRIkTqyVLhfWRftomnf1lygriZkEDiZfxnzbc67eOv3AMWjLuj1HL7KImK7WIt+mnvr+faiSW6eGs1qm3b45XAIhcLyF7mnWergb7U6UzERPxJj/9XOj3e/pJCCPO1+8xqzqzB92A3aVgm9Y1TPSSIDbVTYrMRgYlIHQAutHWEgXoNXVfx4Mmf9ze3r+V6Dr/IWu1gtvEykCubeNoN0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5550.namprd11.prod.outlook.com (2603:10b6:5:38b::24)
 by BN6PR11MB1395.namprd11.prod.outlook.com (2603:10b6:404:46::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16; Wed, 25 May
 2022 11:21:11 +0000
Received: from DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::191e:cb97:9123:b8d5]) by DM4PR11MB5550.namprd11.prod.outlook.com
 ([fe80::191e:cb97:9123:b8d5%8]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 11:21:11 +0000
From: "Xu, Qianjin" <qianjin.xu@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: DVD-ROM support discussion in OpenBmc Usb Gadget
Thread-Topic: DVD-ROM support discussion in OpenBmc Usb Gadget
Thread-Index: AdhwKVqRCEUBiuDvRNePF53XfTKSng==
Date: Wed, 25 May 2022 11:21:11 +0000
Message-ID: <DM4PR11MB555050ED71CC701F97DFF3F496D69@DM4PR11MB5550.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 153fe149-f2f1-4cc7-1eb9-08da3e40ac23
x-ms-traffictypediagnostic: BN6PR11MB1395:EE_
x-microsoft-antispam-prvs: <BN6PR11MB1395908306B30D82D6757D5A96D69@BN6PR11MB1395.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0aH2v9oGjqNEBtGfl6OMLHSxa8C9Ai7uH+kO5YVoxpFq/dvEPN5uiHsjsd7rSwOu9aHaNhjWYaEx4LjD/ftMsWwDD3VvPWMk7DZ7Py0JlgGrXhFmGrBGdT17JLrAj3rukKNsTfkYYKetjyQ2aY0bqRQHuuvUIcfZ7q5UPm60CiEgw5HpgYBXXksZvfQX8pUZuUY0tAC+UyjhyM8IAcfUlykHwDL3s8/5LMvkVuUx/9TU0wHxejfzgp3AxAw3X3IDTskSWWuu9AbRN7IiRLpoKYGExcxmjigR/BqgE9QEY3Vn8+Oma7pMfnxI7CIzsDsOu5FM+8tHn9bV0gWLG6kV+oTw9ieWq5vbHqaa9dKYonwcayq0HZP1wURKX3nwVJI7OjKrrHTMdpifh0AxFeEzGzOU36jYw84fFiXcweVhKDpyyUiw7oJmqWlgEpDTU1w9zT5b0lygFfNPc9s+i5r24diOh87WlBfmjE1TIkoHHp5BkfSXkfGlyeKqJXQO3BrduGFrP5IWh5MpSkGD7cVwMtDYNElZGi2adoQWnZfnh3Xj+7q7uD0OFWb+TeAfIo2HktP/A7XmDz5+yL+tR9hnUVogcwzH3rwEqitruHrB1qrDKKvu/vxUUlaSnSg0GmLXjQRYsnIR/UcRfGNlzBfsdyTn9puSMjVAEHQlFeosQVsnVOVJpshfTseifAzdX0m/aaxAaH20zokY8i9XREnGZw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(54906003)(33656002)(2906002)(8936002)(4744005)(508600001)(5660300002)(55016003)(86362001)(26005)(52536014)(107886003)(7696005)(38070700005)(4326008)(9686003)(38100700002)(316002)(8676002)(122000001)(66476007)(66556008)(66946007)(66446008)(6506007)(82960400001)(76116006)(64756008)(186003)(71200400001)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?23InledQwSYGyLqvKKnKdqvG6M5oPyzDnb6vfschiSFVUMZfPRP3KzxgXxJA?=
 =?us-ascii?Q?oxWOfPn/wZKc5JNVBTZHdMZLh3K7AERWYPNI56AVLpjO49+nrAZyrFs7QI7V?=
 =?us-ascii?Q?UC/Q5EVqsCvXVl6S1nv132G241V/f9puFbrNU7y6HZ1skK0nOj+7p/ytIzBj?=
 =?us-ascii?Q?+SVipPUJXK0cibFic4t5EkPa5C6Ri1v1dzHRBDt5dOQh7pZnlb+SP2U3xRD1?=
 =?us-ascii?Q?MwUDnJuZeqVhmk3jaWdTEwwMjiOx8iRPV7UfUKpY2Hwu2yw9cpp+G/PeC9XL?=
 =?us-ascii?Q?/OpiHBnSYuixYqj5gtCusnTBX7FFdLOwRj4rLPVvRwcrS3L0SmWAi6Yrwv1x?=
 =?us-ascii?Q?v2byHzYlqYZCwDu5xDBxKOipcXAmodMQKxdd93y67F/j9H8cURACUvD6scB1?=
 =?us-ascii?Q?hLgdjRSVysPUL6NbtSdGZsqy9zRHh6KMNShLpQ9Qo7g8O6bzkvdXBoc8s/+o?=
 =?us-ascii?Q?lYaMfSbRZo0DIsd+jxQLDZcS9fZ91J+00nzgC3+Y7XccBnrR+GguXjUjP+n0?=
 =?us-ascii?Q?TPtpmqr45CCTcyLRlUqk8vsy0xZ4MhcUOKYMCuNmwvhph+OzunURqFJ3UBAE?=
 =?us-ascii?Q?Wzv4/rrDqwaLR+y5m/HIDLwrdFlCQq+X0HYBWy16kygki+O1cPiHs3z77a7i?=
 =?us-ascii?Q?TqBK6TwFSA8Ay+VqyntBOWGEcB8MRxnwgaDxZdCycwEaDg+owDgdbiE/GGzR?=
 =?us-ascii?Q?mnsIzNLgWbGXpMY13nkee+6PH8IPaZePufVD5ZGAKUsNlP7oDC5Tx6LmXLir?=
 =?us-ascii?Q?0iNSOKFu113HLQemLJ5SxWCKlqxQo6eMf9P3tUuuHrDUJGNutJfpO6mU1iay?=
 =?us-ascii?Q?hWV5NhbrofhfdSYu0rLk3emBY++FaBarwosM83HNJdM4TnABaDETK/0Wstys?=
 =?us-ascii?Q?K80HEOAv+Rh4R9goQBvCBVR4G+iduQmNHFwgaEmbQEEKH8j3JybU9R9btDo5?=
 =?us-ascii?Q?QE2w7+dIko1yZy74kvIDUXyZgG0S+kqbOPapBM52NV9IgjhhX/H3jmfr3Qmu?=
 =?us-ascii?Q?mu8xOf7fIlpmJWTLHojI6ci/LpTP+c0PMV5Hob3w4s92i4i/UjZbKNyQ67eC?=
 =?us-ascii?Q?FXZoT9iEwzb4orum9tI8+EpbShP6mleE7bzvtHoK+l0mddE6ADZCpiGeqD/9?=
 =?us-ascii?Q?6BJdHBvdSj1Zct8gPopPOM1VPBkcnJC/1sJBWlBvIqNAFf82A9GmCJu9VpR4?=
 =?us-ascii?Q?s+JXXNrPjF+O0dgtU1A7oyEBj3yXUHu9xhk4f3ASxTpmDTPjzvBaH/jD9FJR?=
 =?us-ascii?Q?SOsyH899O5Jz7Naz88ACAgWGfw5MrorThRvDVyW5Vl6BEpM8K/HwX4pbRXio?=
 =?us-ascii?Q?BkEoxtxOwZE0DDDpatlbZ1nq0URTyjNdSICSbaayUiyGBZRlpEOrTUecnRWP?=
 =?us-ascii?Q?TraOYsMcSqtGi82V0xj4rIsk6+4af8TvCZoIeARl3Dsx1dTkUGqs4UwLITXN?=
 =?us-ascii?Q?M6/jJOnWMm+czARxRPC3i4P5ZCKHNv18vV1FexmlARUq8BlGgEqTWKMlZHPw?=
 =?us-ascii?Q?pZKPOM9XSaVJHapr1PmdBmfTkruspC6WPZB3MS8+95iolhLJBdukCGtACvrW?=
 =?us-ascii?Q?ppxOH5x70DYkIMfFWBC+2SNTrYrIWPqBU9kTY4q+snnGrCFVFMni7pSQiQm/?=
 =?us-ascii?Q?8/ddlAuB+XU2TYMlCab635oFVyrGx9i7TkKhicNX8ktVhoFlC1ak+tm3dcD/?=
 =?us-ascii?Q?sifhqDKntYXxGZCrbrw5sKz35wYbunL/etiqavfadvUrFEaXTEvgJ/CJXlYf?=
 =?us-ascii?Q?7MJu7nkw0w=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR11MB555050ED71CC701F97DFF3F496D69DM4PR11MB5550namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153fe149-f2f1-4cc7-1eb9-08da3e40ac23
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 11:21:11.2846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2tui4AO2YM0ylK1LAj/k3vJgULwrABTedjXRcMQo0ChbsV64Ht+V+8swju70ZrOYT0/m2TO/Wgm8WIKZFfqSJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1395
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 26 May 2022 17:02:35 +1000
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
Cc: "Yuan, Joy" <joy.yuan@intel.com>, "Li, Yuan" <yuan.li@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM4PR11MB555050ED71CC701F97DFF3F496D69DM4PR11MB5550namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

                This is qianjin from intel bmc team, I met a problem in ope=
nbmc virtual media and hope to get some help from the community.
                Now  only cd iso can be mounted, dvd iso can not due to the=
 limitation of usb gadget.
                I am trying to implement a dvd-rom simulation in usb gadget=
, but have no idea how to tell a dvd iso from cd iso ?
                Any suggestions maybe ?

Thanks very much,
Qianjin

--_000_DM4PR11MB555050ED71CC701F97DFF3F496D69DM4PR11MB5550namp_
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
	{margin:0cm;
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
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This is qianjin from intel bmc team,=
 I met a problem in openbmc virtual media and hope to get some help from th=
e community.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Now &nbsp;only cd iso can be mounted=
, dvd iso can not due to the limitation of usb gadget.<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I am trying to implement a dvd-rom s=
imulation in usb gadget, but have no idea how to tell a dvd iso from cd iso=
 ?<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Any suggestions maybe ?<o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks very much,<o:p></o:p></p>
<p class=3D"MsoNormal">Qianjin <o:p></o:p></p>
</div>
</body>
</html>

--_000_DM4PR11MB555050ED71CC701F97DFF3F496D69DM4PR11MB5550namp_--
