Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 602014C18F6
	for <lists+openbmc@lfdr.de>; Wed, 23 Feb 2022 17:46:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3hl24qYQz3bdF
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 03:46:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=microsoft.com header.i=@microsoft.com header.a=rsa-sha256 header.s=selector2 header.b=KLgAft3f;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=microsoft.com (client-ip=2a01:111:f403:c110::1;
 helo=na01-obe.outbound.protection.outlook.com;
 envelope-from=rahulkapoor@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.a=rsa-sha256 header.s=selector2 header.b=KLgAft3f; 
 dkim-atps=neutral
Received: from na01-obe.outbound.protection.outlook.com
 (mail-eus2azlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c110::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3hkW1YnYz3bSh
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 03:46:09 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icFD66GOWrB1Lk0Np2JB/FvE4QfE997NQjDOXUVNPMPbgq/1df1Gvziq46jdmm/j+1j69oG6W/MkmDQpWIzrE/sSJntq4yLZK2thlGLMQtn6HWdhWpPk7XqjvmJRQLp49rogIu8rwynyEPDfmffr54jjQBhJcrQej9bhE6H9vemsMevnbSUNpHf+OZO60NFwdNAgdaSSKp4K+2YFGuu8Jhms9e1YGdUkiewyc1xeAsq5FpdPT2Pr9/BFJUHvPCp6H/X0O5csHuiD/4MjF0lpJB+VhvvRAnw/Ipf94V2eNITKtZFK8BpLrXkalX2Wt+mkdYgTzdkzw3mmbzEf5HiseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8T/TEkAHRHSJgp7CHte+4+uuEdt+giyxMGvVWpzOAPU=;
 b=PDv9jdIAWOoPiD3AH7WUC5/dF1EIBtUTO0hydmdt0Q0/mqqXeo7aPgAAniOLW31gxstNV0lp1dhFHg7M1h3DhJ0S3JcJ8ufr90Y7/cL+POJYzoz2NC8HkipStUyeqXKbmu/WWwH0RlCCcyk4cJsRE8VVm/21AJfm6ME8L2W9IkFizIopj00qbrvN/JXjVBfmpWfOSGCL8gYo1ZWlymO9SkZsvWH21vGOd/gOPDjc7LVfwR57wSABKgZ+yjhSy8m3Xxra8sJkFjE3LHumWGO8pz6ZXP7Qm50WqS8LH1ca96HGdxOj8SGR061z61OFJgPHgCtmYd88OIH8VLM08fQcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8T/TEkAHRHSJgp7CHte+4+uuEdt+giyxMGvVWpzOAPU=;
 b=KLgAft3ffML4Ud7TpuQeKl1YowuvloAxiGiX50PAo2hnVrPBJQ3mGZSAiNdwKhGXixSsQ5lnwvoSEkTVROIqlgXfeDmQ3emFkHU4Bvmcn4rQ8wFlHK4WtYJdIr+Fiu9M70IYbzxViE9hsXT/9yvhEhzW2lpVwQo/IypwDZIWc2c=
Received: from DM6PR21MB1722.namprd21.prod.outlook.com (2603:10b6:5:cd::27) by
 MWHPR2101MB0809.namprd21.prod.outlook.com (2603:10b6:301:76::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.7; Wed, 23 Feb
 2022 16:45:45 +0000
Received: from DM6PR21MB1722.namprd21.prod.outlook.com
 ([fe80::8899:cd92:cb29:5754]) by DM6PR21MB1722.namprd21.prod.outlook.com
 ([fe80::8899:cd92:cb29:5754%4]) with mapi id 15.20.5038.009; Wed, 23 Feb 2022
 16:45:45 +0000
From: Rahul Kapoor <rahulkapoor@microsoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: I3C Binding DSP0233
Thread-Topic: I3C Binding DSP0233
Thread-Index: Adgo0u5GHHX20IV6Qi6Q0cdb/IgmlQ==
Date: Wed, 23 Feb 2022 16:45:45 +0000
Message-ID: <DM6PR21MB17227F1F70FD8443DB09F9DDAB3C9@DM6PR21MB1722.namprd21.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=3cf8e56c-f40e-41f4-b498-03c21a3d32cc;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2022-02-23T16:31:54Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microsoft.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 942e450f-a496-46fb-8e68-08d9f6ebefe1
x-ms-traffictypediagnostic: MWHPR2101MB0809:EE_
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <MWHPR2101MB080929B7B952BC8398EA49E1AB3C9@MWHPR2101MB0809.namprd21.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IdIsDFqRBGgz5iPTqHKHnRYfnt/+v8eLCvATFNWuUPxSM0xvHAezjyHkQso2QrBGueWjUKSd318VS7wJiSyXTPUz6gqiT0Allk7TOMH8rdMbSdaNIhWGrOKBv+miOyT/Bhxzz677gtPRs7QzhJuNmD5CRf78s/hv6Pdv3+m60qaixLsZo5Oe3gTn8hvX96sMzoZhye8bapU5WKV0oBogvWBLkniNkpVGlVxtUTL2bODBYToftVbtFwas6MdYiold3rleRQHaz4CVJ5208jQ7Tz4Q4yDONK8XLkO7FxH/c1Vj9FLlDsbNj31N3sgAaWwS8LIyQfJKGJYmLE1HLE2ACSDiE2lEYb+YED7qCUkLTDmq3Okwihq9djSlHw9S1PuAly/eT0bNRfjdvPuiFSI+HXvivJ9JoiyEawTearwQ3+jIrM9KxSNH2asYp/1YXR+KIrOykmC3O3qjvbZjUso5N/DZO352M/hmEaX5zMlBWs+FJJxecCzHGGTv3LaaNaY1W4NU8t4rYcYaZotmgjRJhR4vzbm2du3FlMfNCUI4IFKO5kdKw3VBRc2NPiLeeam169ykU0txKD2MxMdZbdqkO3vZ5CKAkGzKbvntF/vtsFlFMAgGgpdGO4vE0RwuZVwfgNrJTwDAOmaYE88b7Q/BlrW2xQMTasIsnhcRf5cMwoUyMFSYhaxtjcpwtXEwXhwxeGUMCv5bamDcjJfM4lgMbzoF1DEvYW134nRzhKBXQIROINdKDRnFNti8L4sBZJH/gVGSx/7XXS/jkkpcByA60oir+hzqD5rD6cxYBUWaocmlXBDJfP0nfz7q0UxAmeSQOkVbMRUQowTHH0FK68YwxA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR21MB1722.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66556008)(2906002)(55016003)(66476007)(66946007)(66446008)(64756008)(6916009)(8676002)(9326002)(316002)(52536014)(76116006)(8990500004)(5660300002)(8936002)(7116003)(82950400001)(82960400001)(4744005)(33656002)(7696005)(186003)(122000001)(38100700002)(71200400001)(6506007)(166002)(966005)(508600001)(10290500003)(9686003)(86362001)(26005)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Bdo0n8ItOqsCo6WKQB9l02WMzGEJVMure7aOOnReuwH6vIrwnKtoozceNSZH?=
 =?us-ascii?Q?K990A+8OOd/1yKSJM2xRcl6u2S53mb0gK2oeSA3o8dSybOywzi1/BAKnaS/8?=
 =?us-ascii?Q?5OM0QP59Y4C5y4znH8eHORVrmE4AJjMPIrdx6TuoAwn2LTBt5R/73QNJ3pxk?=
 =?us-ascii?Q?SXoHMMLjnGR6Xv1RJShgUNTg/vJAuuebgWPEL6JX0KWcHaJLr4n7MkJ0QtsO?=
 =?us-ascii?Q?+YZmUkRYN7XgNiTtJ4pYAim86/LZ6zZQf+BKKzxyqut014Z8UGPhknsp6mkq?=
 =?us-ascii?Q?YdPD3wCYGOR1/jMP6TktONzgZwXQ1hhjr1a7bh9VB7KcKzFNUoTYGjrOulVe?=
 =?us-ascii?Q?lBereuf7H4Ob9ashCxxvM+r2LRsRq7SBYAwCKoTRajDn9U67+SjOgKbRGSvg?=
 =?us-ascii?Q?Zq9WfagyOs0ZD1wIRrYGDR28mPQKGGPRNpOKHxJT4oqvWY8UC14sx1x4bg0O?=
 =?us-ascii?Q?S5wZc0MOxHEyhGF2cmYBm+M5VICKpI5qYni7nsWUtlGl6WrYgXqw3pBFcw7A?=
 =?us-ascii?Q?FIZ+4H+KRW2qVGCXwM6vPOIUZsHvJcdwvyLSLCBhH/OcaKM0GCsuZ8hJVFU8?=
 =?us-ascii?Q?esuy9K+kfIzQQI1/HqBsQRj2dYz/jSxsO91bIUw7AbThOm7Z4iFDotdj9sMD?=
 =?us-ascii?Q?jvo04TfjHd4heafcS29E1HIQ5KTMCdr/RsxEYV/WlazYCcr9H2FuJDxto4Id?=
 =?us-ascii?Q?nDzwwez60oChdPy1pzWRUu6j0e9CF+akxGrUwZVv5wcMD6ZKHnIHzvoTONyM?=
 =?us-ascii?Q?6fPsYUXjXwzi37Pik4rpt9OCGYUCWtBj5dbc6O793b0S6Ta6HyALiPd2AKVw?=
 =?us-ascii?Q?Lt/jqhw+X2ewM4ZbnuIQeu8e80IaoTSzqsQWAJmHypJMc/4WaAcQASwHWFve?=
 =?us-ascii?Q?IDPjFM8W3+xByrUflE0Bv3m99fe9OmhO1yBZMJo4BgzJOKI4cF6pnn/InOV2?=
 =?us-ascii?Q?0JK7lmGOG9GHNLNOA2W1K89F09uVweB5LY9bnnP50/I/eYUAtNM0sBjVuJbO?=
 =?us-ascii?Q?qQFw7vcWGTLNAsQdjsnYttFNxSGpcWp/4OJottBVH2PqqKJXbgH0CqfWsvLJ?=
 =?us-ascii?Q?3rkTrKy4MdYbnOiPos9HjEtqj/jdDWoTn0o8+/4Qn7GXtElURNKqwZ8mve31?=
 =?us-ascii?Q?cQUTPqADeBezNGnF0taaUchuo4UYxIqWD/1Wd/+8dfDadMyYvgUfY1qQBHvR?=
 =?us-ascii?Q?lQHIFGUM0vKIVnkJ5EpOT/xmFZHo4jcnVMos77Z+qKTzVBzRxD4kNKRDNDZZ?=
 =?us-ascii?Q?EJzA6xBphn+RJs1I3xhE0yQB5M33KhlXij5KWkAg05OJWNPdWZqWW7W9AU5b?=
 =?us-ascii?Q?pZpvrnyHIu1u8ZrDPy3lOfRwL6NA9Q7KkeQQSmCgJ+4Jd+fI7M16Zou/U9NN?=
 =?us-ascii?Q?gxkZMTeAE5xeig37mRPJseM+Unqcw89olpMiY78LRpA8mOou36b75yNOB0+h?=
 =?us-ascii?Q?lPkTOAkgd9cvr5qtdCF+e95YlgcqDOk7+k/Oq/T/YlHuQA2bM8vbGx/H+8Bw?=
 =?us-ascii?Q?5OBu1xUMQTIXvGXKUFE1W5V8M4CKn8bpEcKLLZvB/d+dWQDABVOk6Yd3POYG?=
 =?us-ascii?Q?Qo78q1WWK0VGUkrlhGoNjjmjKBEV8t2zmzHGKtSzV+edDoaNuqQzg9KuonIE?=
 =?us-ascii?Q?vg=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM6PR21MB17227F1F70FD8443DB09F9DDAB3C9DM6PR21MB1722namp_"
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR21MB1722.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 942e450f-a496-46fb-8e68-08d9f6ebefe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2022 16:45:45.1270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sLSrAgoPbrefEPCDryrto53qko4PN2BlrHfcVey00espaCYywYwCpE87W9QQfMzXEETKAmUiICF6bASD3dp8w/OQM9jNH0i4YHnOE3kcphk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2101MB0809
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

--_000_DM6PR21MB17227F1F70FD8443DB09F9DDAB3C9DM6PR21MB1722namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I would like to understand if OpenBMC project currently supports MCTP over =
I3C https://www.dmtf.org/sites/default/files/standards/documents/DSP0233_1.=
0.0.pdf? If not, are there plans to support it going forward? We are curren=
tly using Intel-BMC/libmctp for SMBus binding and plan to transition to in-=
kernel MCTP in future.

-Rahul

--_000_DM6PR21MB17227F1F70FD8443DB09F9DDAB3C9DM6PR21MB1722namp_
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
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I would like to understand if OpenBMC project curren=
tly supports MCTP over I3C
<a href=3D"https://www.dmtf.org/sites/default/files/standards/documents/DSP=
0233_1.0.0.pdf">
https://www.dmtf.org/sites/default/files/standards/documents/DSP0233_1.0.0.=
pdf</a>? If not, are there plans to support it going forward? We are curren=
tly using Intel-BMC/libmctp for SMBus binding and plan to transition to in-=
kernel MCTP in future.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Rahul<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM6PR21MB17227F1F70FD8443DB09F9DDAB3C9DM6PR21MB1722namp_--
