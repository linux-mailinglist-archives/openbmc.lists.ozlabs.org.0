Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C1B621084
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 13:26:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N66lz60Kdz3dtl
	for <lists+openbmc@lfdr.de>; Tue,  8 Nov 2022 23:26:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=dO4rxZbi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com (client-ip=219.64.33.120; helo=inmumg03.tcs.com; envelope-from=prvs=304623afd=sandeep.pkumar@tcs.com; receiver=<UNKNOWN>)
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir; Tue, 08 Nov 2022 23:25:44 AEDT
Received: from inmumg03.tcs.com (inmumg03.tcs.com [219.64.33.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N66kw2pvlz2xl6
	for <openbmc@lists.ozlabs.org>; Tue,  8 Nov 2022 23:25:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
  t=1667910343; x=1699446343;
  h=from:to:subject:date:message-id:mime-version;
  bh=kjG1yieps2EP/wHFPnm8gfEvCsP1eXPTkchyh7pvd0s=;
  b=dO4rxZbiksQxxr6I/7Orx4F9/84FaKgCK/P8B9daLEFMDRnWk3E1DoEt
   Ko2VMNjKsQPzMT8ZiKGD4l0WvAR72Xf2j9P9sD4K3hVIfwJtVLBp3SXng
   1/gIYPcvn6JFGeNQsn+gUuqVfuP0hTAuQSLDDEv0ymaZ+LEYHjwQzwg57
   Lz/HmY4jarg5y5zXPm1LOn7C2Q6rfm3mArMecFvWclJJnumHXzM+LjZ3g
   HTihmROILHjrTfEAYdNHm32biXkc9GMIIA26d82LTwiXeA++B4+EfwHHd
   tS6rNCQznM4+49rXxy7qzwvY+YmD3wSx0/rAeUhlhrXrmSyQ37iscF3TU
   w==;
X-IronPort-AV: E=Sophos;i="5.96,147,1665426600"; 
   d="scan'208,217";a="843922815"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1JeQRAXw/3EYwPVoSb8XKCA/uRQN51OQ7nAlvBgQh/43pKztKyZ1XGxq6vH/DjYhqzPTt620Pii95oXsrYxdfmYJzeO1xzxhOYX/qSpeJ+iz8Hyk9TuuRUQo1Rr9Dh4gB6Cch15nGlAlxvS762vH8E4zwhTlCyPN8AxzGpytOJZckVml1SUaeS+tDs1uyYEmDfFDSeVZPKbW9UbB45voRUCL26a79oW1MMCmsqGhn/3ODT+n771sflXzDxG7VChQagryGL6kUCw85IhQAfTdLLlt9QMe7lVJd/yN5ni9eVyKqeN7YWK4leivVJwlxxUSw1YTT7iHH2N82mBpLXK/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onJgdGhenetTWwwE9EIaq8X3wmT+Sq192wgHwaX9BO8=;
 b=XNf5DXoVK/ZU6HeZvq37pRM3cFVbx2yklB7+QbmOTX1+EqHBLwtzJb3Kt7Wj2XS/d/doUsg+kYzcs6fiDHP0KVUW3WtCmP8/DME8K+5Yryp2/8icIe+vmTk9Y1CEYrs9YFeDt+ixa/vjGURya1CCmsbFw+P9ZYa+tZ3I6ToKfKSDuvR6x0/GCOj2U9umd9sQWZxiMJd669ovv0vrc0lik82SpCjXq2WHpq0d77Fd/rudo7Quhe3k3Fqkn3pOwERYdF8nWxW2zEacwCDbM4nyxfgfm9O0RSG79fKKQ8HPM57nyA9BFptJi2Vc+7VaJMvc9mB1ER9uEF41J9q+Qaw7eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Sandeep Kumar <sandeep.pkumar@tcs.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBmc contribution
Thread-Topic: OpenBmc contribution
Thread-Index: AdjzZ2DKboFkgVuORM+0XUP0p9nbFQ==
Date: Tue, 8 Nov 2022 11:59:31 +0000
Message-ID: <MA1PR01MB4129305D091FE3210BA8A26F873F9@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Enabled=true;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SetDate=2022-11-08T11:59:30Z;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Method=Standard;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Name=IRM_test_300622002_ul;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SiteId=404b1967-6507-45ab-8a6d-7374a3f478be;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ActionId=77a3e1cb-1f31-4a14-bfb6-11808d131959;
 MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ContentBits=3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4129:EE_|MAZPR01MB8293:EE_
x-ms-office365-filtering-correlation-id: 4964b3ab-9599-48fb-1361-08dac180b21b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LFLzfA52rslu/RJYlqfyJWENmGJcyRhQS/arRjArGRcBa7a7KJOLA2g+YtsfGvvN67cirCouAse3Hn9pDr+R+9I626PJvTsxqOkFyX8CdWq+/b6Z9L963YlWZiXyoZqxwkxP0xvQIftNWS3Np0vFhd9vqW7co+p6XqE5oF2RfTtNmJWQQxqFKsO7JHDjBbHqTVsEHtMTfG79mgR/A4GJQstrL7uGpcUKsg1Jn8HV4u6TCK5GuDw2HVVwFPR2gVcsJCJ8tfFCjWlXHzS9jXlrZQva+r2buXm6/4AmTgdMgFAQIxQz0vK9C4rCqoQZPiGe+sMokJngrhBFwWevQcJ3SJz5QBSowd1Gq6Nr7zcak+NB03cHeKyL7OWeXO/SHmwgsnicUncqIjXmLoAJqeRVvwhurmLUTkziQUW/XkmPJI1XgbHoN41gO46/KUujK+dj12BH4oOU+lNC4LsojyzTgi6P8X4lggM7iSfmO91chiDTICXpNfIXs0kEjWhvC0A6/53QTLvJNwNhskgvIkh87cHXqsIER6MkEzFkkOh2fr1HbUMy0Ng1SkW6V5d3NHgeRXg6GLYptpXr/I15hDI9HE9tzl2estGY6AZY8ZGXpwaWTQukkQ5cB/KNa+dti2sXgxngCcqtCE4agyGRmovIEQRRpidCZvnsCqF4HfPOQBHWrw7A2pZRr6TJ0/mt8eKZDi5lgiqEGn4HwQkAGnAL8caO3nwBkVoXBDrl0bXLjNdyBIh2MeO619DQXYEt5S7+JDTok4vOEQnvAISonmmDWw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(39860400002)(396003)(366004)(136003)(451199015)(6916009)(7696005)(55236004)(316002)(6506007)(52536014)(122000001)(7116003)(5660300002)(33656002)(2906002)(186003)(8936002)(558084003)(3480700007)(55016003)(38070700005)(9686003)(8676002)(26005)(76116006)(66446008)(64756008)(66946007)(66556008)(66476007)(86362001)(41300700001)(71200400001)(478600001)(82960400001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UlqbmRhmsjruCepYEfjrrf1eE0gYatCl9ehWv6MDdnrr7IGECdVmU5MxHLPz?=
 =?us-ascii?Q?yHQ9w/2VG5BCkIPcjGj9D118ki1wZeiQXAujknOpJ+ChAaovAFPU2XLSNTDu?=
 =?us-ascii?Q?Xb6amxp9z6lClNMMYwLghfpOnSOwGIsqpga2Gp9GXczDB0Nphc+45U42ziJF?=
 =?us-ascii?Q?OjeB7cbO3vXj7a9vQmvmKvEXK6Ao1+m7HdM4hWl5wD/63odMGk+91vP+3pDA?=
 =?us-ascii?Q?olIBc/EFqr+QpccMNpYXl05aaCnhlhuGjsWjD/UKFhobGgFhfkzbgR52vA3j?=
 =?us-ascii?Q?Zv3Kas0SphIA5c4ucU3VsuIGHGl9l0r4YoU852jX0qfKX8Xh1G/2vhWpl0m7?=
 =?us-ascii?Q?NCbJ9Pg+S5M7T38ERG08LpQOB8J1OW39ChtX+C0VZkEf0EGBW6uRNgbRxHMW?=
 =?us-ascii?Q?akMvypvVsTwYKzMqbLIhfJYVVE3DYGYGHrsh3KfglAr+kXkDLwwq+nn1eZe+?=
 =?us-ascii?Q?5AolLyWf3T7ZgbdLaCXSKUDRrN5QySs5VbHSnUzOj/fVDWd3WcXbcaPZyx6D?=
 =?us-ascii?Q?ASaI0xUbugxmkkT7sQLRnj+HTmHNIniRXnQ7wNkBVl4EBtChGUnMV0a3NSoJ?=
 =?us-ascii?Q?BwFhYVEDo5r1iTbzDJ8LWGfCZSK1OBN1C/7izNMfyj4gHqvx4jy/ZyyAkwrj?=
 =?us-ascii?Q?PnpcpM4pfou1V8JVyyX6RZaWKbwIxooC4VHgxU44o5IxpIi+KntUpXbbtNu2?=
 =?us-ascii?Q?/zprl813VnnK8JD1gBuoe2rG7mgZbTfEMkb4MXGtyzLYPz6yeW0PO2kfEORk?=
 =?us-ascii?Q?PS2A/rLYO5QM777HLiZ45VKRrgI7l5jD57fsb/n7oPt7Rx7NfTvuJqv2NvXj?=
 =?us-ascii?Q?auzrgt2KIRum0uTIbTdih2y5pXRV+MdP+K3saY8BmxdTlS9iSRbSUGf3EIEw?=
 =?us-ascii?Q?9C+eZohWBQiCOIbwMoivVFuPrUNSXT27muSRCwdvIPDCquvxwX4L6h2METN+?=
 =?us-ascii?Q?aKphnW6PxIhyetUsuvBLQdtZqTglnaiFLcZDkJw0plv+kolZMTa6Cd5wjsqX?=
 =?us-ascii?Q?smXOGy64k1k2d9zia8ofaqPv/OlbndQoYl+UsFLuGaamhGeVdLwKCYq/M8ub?=
 =?us-ascii?Q?By7Y9vjqv3djwUJSkImW3qBtxjfw1eZJ//XnDddk/ldqTVjDF3EkCGIIAKZ5?=
 =?us-ascii?Q?HQTEZZu/J4DYCjfJnR9TTAmAy4zmReIRQaf8sFGTVau4nKoLZ/GrDDwBDFNx?=
 =?us-ascii?Q?PoCUzDgHm2GkXbO3G/P3fnKmDK8FPoWilR6O0w/xVv0Bfss1SW39llaUUHw5?=
 =?us-ascii?Q?7oqzEgSwOWsqp/34+m3RyF0be9YYlJ/gqaDS+tiW2SS4DGWF9Q5Z9kI/hELO?=
 =?us-ascii?Q?lafFteulTOSegmrn3LUvpbb++nbGSMMv9sL/MZN1/0hnuhL+D7OjD1NOi8dt?=
 =?us-ascii?Q?ZJEA2vhj/TuGyX/f8EGIXA0SzUGeT05MWngSVxayjVEWP9g/5YD75IbANR8B?=
 =?us-ascii?Q?/aWIMQ4Ph0eRhIpUkA8t3HelWuKiXHcB624Ac3UFSXb15CRAonYkWE+17Lfu?=
 =?us-ascii?Q?SklNsPnUTrE5CbMhDwgNWQzcamEEsrjJu8YNk90+EGPEudAi4cjdVkX3143y?=
 =?us-ascii?Q?T958N4YATMdVxh4oitA=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB4129305D091FE3210BA8A26F873F9MA1PR01MB4129INDP_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4964b3ab-9599-48fb-1361-08dac180b21b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Nov 2022 11:59:31.3814
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HewzmymdTUfL27lsfvvwj05GI3Y6FMr652yT05yDaHMi+eWwaW++U90o560+z0Be
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8293
X-OriginatorOrg: TCS.COM
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

--_000_MA1PR01MB4129305D091FE3210BA8A26F873F9MA1PR01MB4129INDP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TCS Confidential

Hi All,

Is it okay to submit our changes with testing done on a qemu?

Thanks,
Sandeep.


TCS Confidential
=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D
Notice: The information contained in this e-mail
message and/or attachments to it may contain =

confidential or privileged information. If you are =

not the intended recipient, any dissemination, use, =

review, distribution, printing or copying of the =

information contained in this e-mail message =

and/or attachments to it are strictly prohibited. If =

you have received this communication in error, =

please notify us by reply e-mail or telephone and =

immediately and permanently delete the message =

and any attachments. Thank you



--_000_MA1PR01MB4129305D091FE3210BA8A26F873F9MA1PR01MB4129INDP_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
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
<p class=3D"msipheaderd4f7db42" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:10.0pt;font-family:Calibri;color:#000000">TCS Confidential<=
/span></p>
<br>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi All,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is it okay to submit our changes with testing done o=
n a qemu?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Sandeep. <o:p></o:p></p>
<br>
<p class=3D"msipfooterd6682aa3" align=3D"Left" style=3D"margin:0"><span sty=
le=3D"font-size:10.0pt;font-family:Calibri;color:#000000">TCS Confidential<=
/span></p>
</div>
<p>=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D<br>
Notice: The information contained in this e-mail<br>
message and/or attachments to it may contain <br>
confidential or privileged information. If you are <br>
not the intended recipient, any dissemination, use, <br>
review, distribution, printing or copying of the <br>
information contained in this e-mail message <br>
and/or attachments to it are strictly prohibited. If <br>
you have received this communication in error, <br>
please notify us by reply e-mail or telephone and <br>
immediately and permanently delete the message <br>
and any attachments. Thank you</p>

<p></p></body>
</html>

--_000_MA1PR01MB4129305D091FE3210BA8A26F873F9MA1PR01MB4129INDP_--

