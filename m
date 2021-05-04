Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A473731BE
	for <lists+openbmc@lfdr.de>; Tue,  4 May 2021 23:06:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZXTP2Lymz301v
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 07:06:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cornelisnetworks.com header.i=@cornelisnetworks.com header.a=rsa-sha256 header.s=selector1 header.b=Fb//oGbH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cornelisnetworks.com (client-ip=40.107.244.100;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=usha.srinivasan@cornelisnetworks.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=cornelisnetworks.com header.i=@cornelisnetworks.com
 header.a=rsa-sha256 header.s=selector1 header.b=Fb//oGbH; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2100.outbound.protection.outlook.com [40.107.244.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZXT34kTgz2y07
 for <openbmc@lists.ozlabs.org>; Wed,  5 May 2021 07:06:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKvLm90lNB5tJNNBFx4M+km9d+hJLTAFScc4u/QIRPe/Zl1pGPReO2Y+OncG9mTHcDF1g9XZpXg78acHnfvdgs65n1sdF5xFs+RvCGSOC0jj6hpaswehbpncG/suj+x0LM3fO4WU7P06YcoXQN+PSgpvzjtxDv6ME61Nmf+Wum/dKvtRRLV10MlAmAHfxDL1PbMj8raGOS1Xud9dvebdXUUQjqzezp9Oy+3MYbhvnvCGcsoraqoJTEQ5JtFsSZkfV4fD/6naz/f5aKfR0IzL0TG5K9194YrCY1UIOKP86AZEwt3SofajkmUTij0lq5E644DoXkyJnWPbqTrjBil2Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSsXgnCIT1Lbi9TjuLbhNhcL6OlMn9ObPbSVRQmOL3E=;
 b=USq+CVwu1LaZI1U5R0UnxzKhOfGVgI8aZGYNsdqLqZX8J5PDzqT+SPaiM/dTRBP9RVuDEmRJjDGePl70iG8IrJuXKNqMcyXjmEeO7Luvgr1vn7xzrBRMe+cqvCazImj0AWSgeA985cwFGVy5qEsR+oQUZO4b/LsnAGl7mae24YpT4Sk/dNYWalVSGF1PRFvIaPRZzV+llDpFXbHOqMoYlV5WeDZqQ+ELQgwXCzQdi7pe5EjCSTulRXnHGuuq9WNut6Qm8xAVMbUpE0VnObOoITyROhXHvVnBAUkFf03X8JdC0xQqJEs0jqX7rG7FPu+oz2Qxj0CAHpItFuR7edMrnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cornelisnetworks.com; dmarc=pass action=none
 header.from=cornelisnetworks.com; dkim=pass header.d=cornelisnetworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cornelisnetworks.com; 
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSsXgnCIT1Lbi9TjuLbhNhcL6OlMn9ObPbSVRQmOL3E=;
 b=Fb//oGbH3UJJ2O43jFkZmAEGlsLKr8hsSrTm2lBjIWg2peT0xyRW61GgmpGiSQOA2wKwvkgYiJL7E757p7wlNwsndDyYe+lDVKfwsIyi9tTVNMDAw8/nQirx6vvZ7mtYAGHMpeu8Dyo/JOi1N+Cl/7ALKA0r0SSeFjTewZxlXAvQ3ntjvgaE/nAMw262zx5UHh+UJdxvIi3lqFI1naZ5upI5vInXNYPALyUiZyldQONoePT+Z5y/sblXyi/MS2lJXdwG96DJkt5L2Q4ND8vRKOyikU+NnNPUzer70rDkw9GTfQCbFsfKPZVdFutB5q4OTAl8NFk0xUEWm+q8c3JTsw==
Received: from BYAPR01MB4758.prod.exchangelabs.com (2603:10b6:a03:8b::17) by
 BY3PR01MB6689.prod.exchangelabs.com (2603:10b6:a03:36d::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.40; Tue, 4 May 2021 21:06:15 +0000
Received: from BYAPR01MB4758.prod.exchangelabs.com
 ([fe80::89fb:cc6d:2044:c3d3]) by BYAPR01MB4758.prod.exchangelabs.com
 ([fe80::89fb:cc6d:2044:c3d3%5]) with mapi id 15.20.4087.044; Tue, 4 May 2021
 21:06:15 +0000
From: "Srinivasan, Usha" <usha.srinivasan@cornelisnetworks.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Entity Manager questions
Thread-Topic: Entity Manager questions
Thread-Index: AddBJXncTkuO62M+TUmdtpTvU+WqVA==
Date: Tue, 4 May 2021 21:06:15 +0000
Message-ID: <BYAPR01MB47581EC3A2AA6E3BFE2BB6D39E5A9@BYAPR01MB4758.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=cornelisnetworks.com;
x-originating-ip: [72.94.82.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 377c4a01-5109-4bb1-bfb0-08d90f407459
x-ms-traffictypediagnostic: BY3PR01MB6689:
x-microsoft-antispam-prvs: <BY3PR01MB66892E97D8B0C28B6D74B9E79E5A9@BY3PR01MB6689.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J9bnLTwoEgv0OVm2vfy53GrOBucxEykSY/uX2kJYDOd7g/JKUF/qeumU53ULsZFDh2s9IkrwqZ5pKjMaK6moq/R4qMu1V3iZD7+XaO6rOcl9kfLLYayEsIdE+ZPahFyJ5QjQtrZQO1e4Nonx3RTEgHQvmyhs52lFmU/gy79tWNyNEPl78mrpFWg3gk2tyaE9X8ne50bovshcCeySB6BtuCq0e5GEhej0wbfT5rQIRSGjp9OrE/tqa/Uy2tZ5CaOya8CjsmQpkhyUAwoH7k0HcPZzdYtDobLcxykhunZw2mbm1rz2PYKCuY7Aa8sKgqHjJPiLlruxqGCoD918GgrizCfWZbyf33twksse0Z2D4e/OgVt3EPS7Ixazm9xhPD2jH1T3XyqtIH30lXmH7pHi8OUWux7HTaWTG2L/iEi+230YQ6A8CukdGFYvMoCvknnWYGUPx4s7mwEzVaLGT91S3awLhcBvYvK6Vcdne7Qdtjw2AeMgr2j5YvW5vNOddJC8r1Ylif/YWJveqyayzRyMQpW1uNRGk3UvmzKPZX7Vi8kP6b6RZ4c0RfzQY+w5UigAUiK5YCyj2xCt0060nB2D2GCFXRPpjk06dMd0GnmGRtggAps2FH3xxP+ylSD4IaCuDtIUj4vb7U+3KfggTQVwgTnvVJdO3lLQtXsYyW5G/8s2WCxzxy92C4kvXSnN7VJD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR01MB4758.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(39840400004)(396003)(66946007)(478600001)(38100700002)(64756008)(33656002)(66446008)(66476007)(6506007)(6916009)(66556008)(186003)(7116003)(7696005)(52536014)(76116006)(122000001)(166002)(5660300002)(8936002)(9326002)(71200400001)(316002)(2906002)(9686003)(26005)(55016002)(966005)(3480700007)(86362001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5sxUKZ/VDiu4kxpfTR3R+OT03w6e4Y/yv2UoVMBqt/FzPBvV2YQLzWNVzI2w?=
 =?us-ascii?Q?fFWJm1jMCsusopMyPS8Quj1w4HaEZE9rBj2Yh3NpwHxyryn0j8Gy6Yx5ppMb?=
 =?us-ascii?Q?ggBldySGQIDIODrOM+syTeOBweHCfL3OUNDlPqtOoPmhmkXisrZUHGTCDhfb?=
 =?us-ascii?Q?oEd17GSrms+nInelEtDWNuVK5MKchVDqdYljKPoBFqona9HpJ8yEdLmHLMuh?=
 =?us-ascii?Q?iMIHXeJYutrTrjflZ8xtGAiQI3NMlX9KF4cuiEeod86WzRyzLBm7y3wTb0+M?=
 =?us-ascii?Q?u7z9kOvStIwM0qpqENvvzfCIZT30bicnDGsHOvyJspCFi8CSLfNlZ8oKpLzL?=
 =?us-ascii?Q?nfvX8pQERhYdAGh9GmzOG6E/WPZnyHt8RKoUw0iDHqVAtBm/nZ3NfNAVcOk8?=
 =?us-ascii?Q?v9Erg/75TtCgMC5LuY029S8jFTveNcWQfa6Is9mF1mKpIjvS6G1YL6OH/81A?=
 =?us-ascii?Q?m6JlN3scSI0ixYHokxBGfWT4rjsgUo16vvm6Bid15LJzB6lQnzfCANeMnMZK?=
 =?us-ascii?Q?1ZzHpTd1D8NRybXVplN7ZPpZ+mEt4JE9dqW8lNTbfBW+F/cy8WLtAYhjcXdb?=
 =?us-ascii?Q?+Px9jlheul0BWWD+Z4Q6UCLOZT/OXqmeLI3Gp+PYteebY3WCEykuwuA0gC2s?=
 =?us-ascii?Q?BIQa/Amk92xNkzil2LeLgopcyDCjA+0G+/xk0OTbdx3AAPQd61SXkxGEQ88F?=
 =?us-ascii?Q?jubIyG530n/VTOreWRiWLF70vPDEnfYutDWyP543NvaeUt6f1XgUL+Sp++Vx?=
 =?us-ascii?Q?uoMdHye3Ztcunqt+1gqmWaSbftGWZqg229ut0OD17LMC2BeeiKJ874itIUiy?=
 =?us-ascii?Q?c5n0d/2sSJkJS7Y0T4hT75mM1Na6ysD+UA55ufCpP6i9Git45CZFRqMTME0i?=
 =?us-ascii?Q?I0TLyLsQhHVzgEHzzyTUzaxxhUwnHRzu8X8CJV0Uy/mJp6XPYvAKntqS7TNF?=
 =?us-ascii?Q?lZ6lvZ0dm4DvxUNb66IYb41I0DiFNGRRf9TyebmdsGLD0TUl19eiLp7kjMRQ?=
 =?us-ascii?Q?xH2JW2u61ZvPY8U1v+L4WWIG+JXDo1Jit0k2iCrLubASjWnEixioOXdlkVtn?=
 =?us-ascii?Q?d6VyBhbVitZWIfU+cftAq4N9VZ+axhNWjR7oFKUL+xYiKFEZrGxuNaj1mkAw?=
 =?us-ascii?Q?ftjoCHaOzE65fOuM7DHSwsES306xuQbXNNd89Tkr0a9vfDUnc0xZL6pt9rUY?=
 =?us-ascii?Q?gg6Egq1Wniozx1BWxuri9dsdoJpgNs1+w2LCZhKVr74y6Kwuuc313b8A+zBZ?=
 =?us-ascii?Q?3Ue0QyV9Btpy6ZY8HiclFBaJDWaiLDnLuceRBJZC4urK1NiCtZ/TG8mk9cDt?=
 =?us-ascii?Q?v0g=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR01MB47581EC3A2AA6E3BFE2BB6D39E5A9BYAPR01MB4758prod_"
MIME-Version: 1.0
X-OriginatorOrg: cornelisnetworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR01MB4758.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 377c4a01-5109-4bb1-bfb0-08d90f407459
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2021 21:06:15.3078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4dbdb7da-74ee-4b45-8747-ef5ce5ebe68a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bZMz3LerEldWol2LPTWeSuCP6QiUMx5dO5arxy1dd5UKKsXcR6G/Y6yyiPAN/X5s6GnYNoWtag7f5Y8+d275fglhKCDrgzDLSkZXLu9WATQpTMRqpO+3irXX3NWCfVJP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR01MB6689
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

--_000_BYAPR01MB47581EC3A2AA6E3BFE2BB6D39E5A9BYAPR01MB4758prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,
I'm working on my first full OpenBMC project.   I watched James' Entity Man=
ager presentation on YouTube and it explained quite a lot.  However, I stil=
l have questions that I'm hoping someone can answer.


1) In my setup, FruDevice fails looking for /etc/fru/baseboard.fru.bin.
Q:  I am guessing that a baseboard eeprom is one at i2c bus 0.  What if you=
r platform doesn't have such an eeprom?

Q: Who is responsible for creating the /etc/fru/baseboard.fru.bin file and =
what are its contents?



2) Q: My understanding is when using FruDevice with EntityManager, during p=
latform setup/manufacturing all the FRU eeproms will have to be initialized=
 with data formatted as described by this Intel document.  Is this correct?
https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs=
/platform-management-fru-document-rev-1-2-feb-2013.pdf
Q:  Is there a python script and/or application that can be used to initial=
ize an eeprom using textual data provided as input?


3) Q: My understand is this: by using Entity Manager & JSON configuration f=
iles, I no longer need these kinds of YAML files:
https://github.com/openbmc/openbmc/tree/master/meta-lenovo/meta-hr855xg2/re=
cipes-phosphor/configuration/hr855xg2-yaml-config

4) Q: However, I assume I will still need to create fans, gpios, leds, powe=
r & sensor conf files like these. Is this correct?
https://github.com/openbmc/openbmc/tree/master/meta-ibm/recipes-phosphor/fa=
ns
https://github.com/openbmc/openbmc/tree/master/meta-ibm/recipes-phosphor/gp=
io
https://github.com/openbmc/openbmc/tree/master/meta-lenovo/meta-hr630/recip=
es-phosphor/leds
https://github.com/openbmc/openbmc/tree/master/meta-ibm/recipes-phosphor/po=
wer
https://github.com/openbmc/openbmc/tree/master/meta-lenovo/meta-hr630/recip=
es-phosphor/sensors
Q: I ask the previous question because, I see these errors. What am I missi=
ng?
Failed to introspect object / of service xyz.openbmc_project.Hwmon.external=
: Unknown object '/'.
Failed to introspect object / of service xyz.openbmc_project.State.FanCtrl:=
 Unknown object '/'.
5) Q: I see a createHwSensor field in devices.hpp in Entity Manager but I w=
as not able to figure out what effect it has.  For example, TMP421 has crea=
teHwSensor set to true while an eeprom doesn't.

6) Q: Overall, all I am monitoring on my platform are power supplies, fans,=
 temp sensors, voltage regulators.  If the drivers for the devices on my pl=
atform are already exist in linux and the devices adhere to standards such =
as PMBus, I am assuming there will be little need to develop new drivers an=
d/or monitoring daemons.  Is this correct?  I ask this question because in =
a very much older version of OpenBmc the vendor developed their own fand to=
 monitor temperatures & adjust fan speeds.

Thanks.

Usha


__________________________
Usha Srinivasan
Embedded Software Engineer
Cornelis Networks
1500 Liberty Ridge Dr
Chesterbrook, PA, 19087
484-498-8425
610-703-8475 (cell)


--_000_BYAPR01MB47581EC3A2AA6E3BFE2BB6D39E5A9BYAPR01MB4758prod_
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
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoNormal">Hello,<br>
I&#8217;m working on my first full OpenBMC project.&nbsp;&nbsp; I watched J=
ames&#8217; Entity Manager presentation on YouTube and it explained quite a=
 lot.&nbsp; However, I still have questions that I&#8217;m hoping someone c=
an answer.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">1) In my setup, FruDevice fails looking for /etc/=
fru/baseboard.fru.bin.&nbsp;&nbsp;&nbsp;
<br>
<b>Q:</b>&nbsp; I am guessing that a baseboard eeprom is one at i2c bus 0.&=
nbsp; What if your platform doesn&#8217;t have such an eeprom?&nbsp;
<o:p></o:p></p>
<p class=3D"MsoPlainText"><b>Q:</b> Who is responsible for creating the <b>=
/etc/fru/baseboard.fru.bin</b> file and what are its contents?
<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">2) <b>Q: </b>My understanding is when using FruDe=
vice with EntityManager, during platform setup/manufacturing all the FRU ee=
proms will have to be initialized with data formatted as described by this =
Intel document.&nbsp; Is this correct?<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://www.intel.com/content/dam/www/pub=
lic/us/en/documents/product-briefs/platform-management-fru-document-rev-1-2=
-feb-2013.pdf">https://www.intel.com/content/dam/www/public/us/en/documents=
/product-briefs/platform-management-fru-document-rev-1-2-feb-2013.pdf</a><o=
:p></o:p></p>
<p class=3D"MsoNormal"><b>Q: &nbsp;</b>Is there a python script and/or appl=
ication that can be used to initialize an eeprom using textual data provide=
d as input?<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">3)<b> Q</b>: My understand is this: by using Entity =
Manager &amp; JSON configuration files, I no longer need these kinds of YAM=
L files:<br>
<a href=3D"https://github.com/openbmc/openbmc/tree/master/meta-lenovo/meta-=
hr855xg2/recipes-phosphor/configuration/hr855xg2-yaml-config">https://githu=
b.com/openbmc/openbmc/tree/master/meta-lenovo/meta-hr855xg2/recipes-phospho=
r/configuration/hr855xg2-yaml-config</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">4) <b>Q</b>: However, I assume I will still need to =
create fans, gpios, leds, power &amp; sensor conf files like these. Is this=
 correct?<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/openbmc/tree/m=
aster/meta-ibm/recipes-phosphor/fans">https://github.com/openbmc/openbmc/tr=
ee/master/meta-ibm/recipes-phosphor/fans</a><o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/openbmc/tree/m=
aster/meta-ibm/recipes-phosphor/gpio">https://github.com/openbmc/openbmc/tr=
ee/master/meta-ibm/recipes-phosphor/gpio</a><o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/openbmc/tree/m=
aster/meta-lenovo/meta-hr630/recipes-phosphor/leds">https://github.com/open=
bmc/openbmc/tree/master/meta-lenovo/meta-hr630/recipes-phosphor/leds</a><o:=
p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/openbmc/openbmc/tree/m=
aster/meta-ibm/recipes-phosphor/power">https://github.com/openbmc/openbmc/t=
ree/master/meta-ibm/recipes-phosphor/power</a><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><a href=3D"https://gi=
thub.com/openbmc/openbmc/tree/master/meta-lenovo/meta-hr630/recipes-phospho=
r/sensors">https://github.com/openbmc/openbmc/tree/master/meta-lenovo/meta-=
hr630/recipes-phosphor/sensors</a><br>
<b>Q</b>: I ask the previous question because, I see these errors. What am =
I missing?<br>
Failed to introspect object / of service xyz.openbmc_project.Hwmon.external=
: Unknown object '/'.<br>
Failed to introspect object / of service xyz.openbmc_project.State.FanCtrl:=
 Unknown object '/'.<o:p></o:p></p>
<p class=3D"MsoNormal">5) <b>Q:</b> I see a createHwSensor field in devices=
.hpp in Entity Manager but I was not able to figure out what effect it has.=
&nbsp; For example, TMP421 has createHwSensor set to true while an eeprom d=
oesn&#8217;t.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">6) <b>Q:</b> Overall, all I am monitoring on my plat=
form are power supplies, fans, temp sensors, voltage regulators. &nbsp;If t=
he drivers for the devices on my platform are already exist in linux and th=
e devices adhere to standards such as PMBus,
 I am assuming there will be little need to develop new drivers and/or moni=
toring daemons.&nbsp; Is this correct? &nbsp;I ask this question because in=
 a very much older version of OpenBmc the vendor developed their own fand t=
o monitor temperatures &amp; adjust fan speeds.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Usha<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">__________________________&nbsp;&nbsp; <o:p></o:p></=
p>
<p class=3D"MsoNormal">Usha Srinivasan<br>
Embedded Software Engineer<br>
Cornelis Networks<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">1500 Liberty Ridge Dr<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">Chesterbrook, PA, 19087<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">484-498-8425<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">610-703-8475 (cell)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BYAPR01MB47581EC3A2AA6E3BFE2BB6D39E5A9BYAPR01MB4758prod_--
