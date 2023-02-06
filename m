Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4A668B71E
	for <lists+openbmc@lfdr.de>; Mon,  6 Feb 2023 09:12:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9JsK73X7z3cLX
	for <lists+openbmc@lfdr.de>; Mon,  6 Feb 2023 19:12:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=1esUbjWv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wiwynn.com (client-ip=2a01:111:f400:feab::62e; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=delphine_cc_chiu@wiwynn.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wiwynn.com header.i=@wiwynn.com header.a=rsa-sha256 header.s=selector2 header.b=1esUbjWv;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2062e.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::62e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9Jrh1kL8z30Ky
	for <openbmc@lists.ozlabs.org>; Mon,  6 Feb 2023 19:12:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWmYAL7f2BdRp7l0FFhAUUhmB+mtKZD3vColJIwOPJy7zedom90CG6hqMbs3qOwGPHLaTkC9kH/gHw2Vc7O3AmstZhAhKn6KbpWvWkWQ+EGz7WGCoOsqPPHOhedUE2hgvWR8P5a2ENJSYjqmJkEykA04juSDEaSwo9SAoLTeDHKxgmEW6W3l0sxmTnnDlHvpGbP6KNx2eNuZF2+toJDPDs/rW4Vl/IpYhf4RMSm5gDYEo1+rQEWUvVVKEH6wXC/2Satn2v+qeAvrl7mU+qTJLn3m12emg32yRL+erNGwDPleh4QFxLHgha4u4pFpNFy6eAyi5zUjam30CXTIrh2z2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=relMmPPujahLW2/zfiah/bta4Td96kAMIiAD18KaMSg=;
 b=fsmDtGJYm6Y0YATXjOGnZtWTtvrt41rXqnsVf4IEQGlbzTLj4/469obu9PnV+hhH+0YJo/jIZkjnzn8CpfVFhfUvhX7OojlFDieZUTVgmOAiqEc4wLuSB2sZu14C2/1VPP4uycRgy9kSDoxGu2+/R28At+8mfoeckdo03Y2XpAI4bsNR4G2GDH2cDplmzPghCSSKlUhgXlnPKDw/Rrtq1Glcv/YIo01kFbMbVKoAmpTXKd/UXXYDlZxK7n7UHCNCzr67XeinEBZSxGmu9c8uTA9Kr30mPiO3lHUr4SyXdOy3A480i3LSY8DR/LvqEZ2OWSDCbuP6WVuLIs72O+3K6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wiwynn.com; dmarc=pass action=none header.from=wiwynn.com;
 dkim=pass header.d=wiwynn.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=relMmPPujahLW2/zfiah/bta4Td96kAMIiAD18KaMSg=;
 b=1esUbjWv/2PJBjO7L14IMfrh3XE7EAy52xFGFH+aEoBYa4lSbUUYCkEMxDsStal7oPsSos3ejCMNxE7RNPh2AT11V/IfAKzeAPFCEnpQnjFLa/htXq9sOk4vZTirmiXk4yhhHzB7wiH73n/oV8JgsdaGUqkWf9VMkdnHtwKIgN5Z+XgT7Un3g8wbaHd4AhFXCfHNq48UvpASLVHC5kWoANwJswdtmqBSOjYqOf44vyXTDomj7QWLrFBp2IFMSjFY8G7MTACvtOcerVlclA1ctu/97AaPFDfKLCSX1H8d7oJInCjRHqHxusc0pL+QkEtJpGt+xY+XHyhXzZg4tBOnyQ==
Received: from PSAPR04MB4598.apcprd04.prod.outlook.com (2603:1096:301:69::12)
 by SG2PR04MB3979.apcprd04.prod.outlook.com (2603:1096:0:a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.34; Mon, 6 Feb 2023 08:11:41 +0000
Received: from PSAPR04MB4598.apcprd04.prod.outlook.com
 ([fe80::33d1:d967:395a:409e]) by PSAPR04MB4598.apcprd04.prod.outlook.com
 ([fe80::33d1:d967:395a:409e%5]) with mapi id 15.20.6064.034; Mon, 6 Feb 2023
 08:11:41 +0000
From: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Support hardware watchdog for openbmc
Thread-Topic: Support hardware watchdog for openbmc
Thread-Index: Adk57zPd8bx4nJbfSxy4LKYst82koA==
Date: Mon, 6 Feb 2023 08:11:41 +0000
Message-ID:  <PSAPR04MB45984F24B7B54446B6DCBA78A5DA9@PSAPR04MB4598.apcprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wiwynn.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR04MB4598:EE_|SG2PR04MB3979:EE_
x-ms-office365-filtering-correlation-id: 0c600f08-37b5-43a4-a791-08db0819c73c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  dmi/sSNBh/S0aOFiT26Tvsp4iihXavJcQB6iU461BA+BNebLFwQMUVByzDcca66tnG1faXYJv9pv4bcGXi5zPW+fNxc50vjrgsZ1SSdtGmWmrkU2icSyjprL1fi4CtChFm83S2WWOhKatJtkObs4ssg86LtrwwL407shWSU/lmUmKT09FM63RfQQOPfTYkTgkkZTa3bznShHz96xfVlj3RnHPqv98pCJu2654u3Fyo/uKYMdXOmDewpknDwyWGQNkeZg7eoQcA1J1qv4C04phiXeUbpTSZF6nJL88AIHls789QHWGpoGejS1O6PnHcMHnyFbyrNH/lqxLexaxIhDSCYuQbFjaBGzQzhggv7xAP9PldKvJJC0S60h6T12wso8lyFZuCt1DIonlv3eXY9bE1dwvzCdq1sIEXc1xNaS9LFau8TchcC8I1Z8yABDaazPcmdDv7a6RibNhmGBBEKrLZBcDcxBRzfTPFoQHWWQ1kjFTAqcX1EgZOKm4euTsb9h+rhrFA9kCOOElO9BTf/NJLv//4Oj5dm2VC+CuGH/JkD0qD5ho7tQkoDgdwHPbJDfMdpfIRGGt7I/cPA92tqQwOTrkPw2fBnjrusyMMia1Gb7rAYCzQ8iUPFgKS0s8WmbwAD3gVlCRu/xLm6yin4lX4Zo+Y/GGqPeLAJ79GAcjOyIJOqrYlH+WAqncX+HTWIV2XGbiBxeC1ttXyUIFulBFhLwiMWs7Z37vh8BN/pKrbE=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR04MB4598.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(39850400004)(366004)(396003)(451199018)(66946007)(316002)(8676002)(2906002)(5660300002)(122000001)(4744005)(38070700005)(86362001)(38100700002)(33656002)(64756008)(166002)(6916009)(4326008)(66476007)(66556008)(76116006)(66446008)(83380400001)(41300700001)(55016003)(52536014)(8936002)(26005)(186003)(9686003)(7696005)(478600001)(71200400001)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?WwjUU8oUprb4uBKQHjjL+Q57O8XouWzq+f1tcX9AeF16QlJuybpDQeVyseT3?=
 =?us-ascii?Q?UMGB70+mD8/QnQu24xdAttHHCJeZFDkisJPMFNaTfjjM83Sh5eFlBrPxiHqK?=
 =?us-ascii?Q?EYqPf47/iWK9iEYn3xCqLDgVOBxY/EvHhPKDpYffw7Alj5iKWNxHh7RRRlpw?=
 =?us-ascii?Q?mivJYph+Y5feiIk7HmtSty/ReMtg7aydIl5CPb8pSpC0A0KbJ1M7LwBoMd10?=
 =?us-ascii?Q?6FAoQfgDfhKJXobnEYwg+gW0sW9D7kMuZt2kV5MDa9ORXV09jLXss5bfXs0S?=
 =?us-ascii?Q?Y6qf6yygmW59KfYOVREYHPshWHR8V1iK6pxAX1H23fp7IkZ5UjLMGJEEPWiQ?=
 =?us-ascii?Q?KlGQYdaFWShsK4KkCpgHKcsYHYx3dCadUowGOOx0osPe6GKr5LO7DSu1R58A?=
 =?us-ascii?Q?CKSpJjqFvfJCHAM8ShEBbEx8K/oMXsNQXoL2GFmbRehBr5DudiChXyW7MmQK?=
 =?us-ascii?Q?ZtvmoTTOdWjSzGvFA97SH7Ux56h9g6m2R6oE8EKGI/mo4Zvqq5ICeuTf0NJM?=
 =?us-ascii?Q?WT3F1uocBI5AQuZyUejGN1RrJy6ojnY2a1hNZxf4NyPrBRpSKTuCej1dJEEI?=
 =?us-ascii?Q?rUyPUalFvUjH/bwnYhhWj4pO8BecmnCSSR5P/AlbKjb/oFhWUk7yUyVPOa9i?=
 =?us-ascii?Q?oZAVEqdnzbUSJ0nLoLZ1ftQWPavXnP4Hc1+o0X6iOC3UTsmTHBHb9/bFmrxU?=
 =?us-ascii?Q?C6IT5atOqSibd0+IdbSGGC1SO+1fVhgSnY+IW+C3mPbMET/h42T5HeNrzfDj?=
 =?us-ascii?Q?1phGV653LOePfRejYvB+ziNn2QYymn9asDCcLFu1RIXc+ciYMzAb4UklV4+T?=
 =?us-ascii?Q?iBN7M6jtZLTQCfjAPmCvhVQB5saQ+2Eo07c4HudQBosfJcZ6Eot73eF43F3a?=
 =?us-ascii?Q?rEPEQvxHKmYbYHP+0+ZHobcepmdQ1dGZ9nWlWMexBvirE6EgQksz2urPRC2f?=
 =?us-ascii?Q?TjPgz/JDq3fJ/WvmEqeoC7sfbhUQjl+j2RkSAfRCbAhRXTmXhMPj7GgapJ2t?=
 =?us-ascii?Q?eVOcmWNEIgAr+PhfFLDHQscqk0BARALVF17RuuPzwPzA5wJAKJ0kemrcvPQx?=
 =?us-ascii?Q?XBi2nJ+719HHMxet5wBDiJAFzRKN7UyhljSxbDnufd/FVAKqlJpLv/JR5x5J?=
 =?us-ascii?Q?1KbrZuEG1PSOe8Fd0fbCp966A8BguSJwx/Cvw2j8j/R5w7ODF1/pMt54JT+F?=
 =?us-ascii?Q?3+pe8BxheN0o0LBJemxfDbcyPtV8157YP5YsG5K9p93XDV1IMc237688q8sz?=
 =?us-ascii?Q?JS2OgkHQ02qSg6L3Qqncz+OAT/9eZf12lnS9QMbqvwoukd1QL3DfIrMPOSOr?=
 =?us-ascii?Q?ehTwm4m8ofVPrS/wVLAJZO7pRHFyK1xOrxW6FZ2RVvFK+qO9mru/JLv6ZOMb?=
 =?us-ascii?Q?xc0PmIXacXMRV+TWkIHUeqJRFxOqyulb/CF2u+ohowqEZI7AtFcTAMVD6fA4?=
 =?us-ascii?Q?Pha8icHspVON046Lg7sGThpof94a2kmsWgqjYEQckLoNFKw44IBLhsPaZ5jI?=
 =?us-ascii?Q?qo2Ikfwd4V1CCDcibMYTndlQd3wXp8IIWC3L3q3C9+eXOQhxsjTvvvBBtGGe?=
 =?us-ascii?Q?aQ5MYaQ1eNIBudYSYA7+6wTSCs8jGaDQyB0aqH+1FRPJpaxysUH+CBS+75pq?=
 =?us-ascii?Q?uQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PSAPR04MB45984F24B7B54446B6DCBA78A5DA9PSAPR04MB4598apcp_"
MIME-Version: 1.0
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR04MB4598.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c600f08-37b5-43a4-a791-08db0819c73c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2023 08:11:41.2278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8svdgDRCw2RhnOD5f0OnsmyhQbqpQF/KmEKQVepEZwiFWeYC7Yt5snqa5MivNSs5OGlHn+T+Z+j/M9lRLokGVtgOKRC7/UAmPLWIAIs0UAc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3979
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

--_000_PSAPR04MB45984F24B7B54446B6DCBA78A5DA9PSAPR04MB4598apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear OpenBMC members,

We have implemented hardware watchdog for Facebook platform and we want to =
promote
it to meta-phosphor level. The implementation is adding systemd configurati=
on which will
enable device 'dev/watchdog'. The BMC system will auto reboot when watchdog=
 timeout.

The implementation can be seen at the link: (gerrit number 59881)
meta-phosphor: enable hardware watchdog (Ic46bcd9b) * Gerrit Code Review (o=
penbmc.org)<https://gerrit.openbmc.org/c/openbmc/openbmc/+/59881>

Please leave some comments if you have any opinion, thanks.

Best Regards,
Delphine CC Chiu

--_000_PSAPR04MB45984F24B7B54446B6DCBA78A5DA9PSAPR04MB4598apcp_
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
	{font-family:PMingLiU;
	panose-1:2 2 5 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:PMingLiU;
	panose-1:2 1 6 1 0 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:12.0pt;
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
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-TW" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Dear OpenBMC members,<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">We have implemented hardware wa=
tchdog for Facebook platform and we want to promote<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">it to meta-phosphor level. The =
implementation is adding systemd configuration which will<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">enable device &#8216;dev/watchd=
og&#8217;. The BMC system will auto reboot when watchdog timeout.<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The implementation can be seen =
at the link: (gerrit number 59881)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://gerrit.openb=
mc.org/c/openbmc/openbmc/+/59881">meta-phosphor: enable hardware watchdog (=
Ic46bcd9b) &middot; Gerrit Code Review (openbmc.org)</a><o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please leave some comments if y=
ou have any opinion, thanks.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Best Regards,<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Delp=
hine CC Chiu</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</div>
</body>
</html>

--_000_PSAPR04MB45984F24B7B54446B6DCBA78A5DA9PSAPR04MB4598apcp_--
