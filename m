Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD501E7962
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 11:25:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YK1Z4d49zDqgj
	for <lists+openbmc@lfdr.de>; Fri, 29 May 2020 19:25:54 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vertiv.com (client-ip=40.107.94.65;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=troy.lee@vertiv.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vertiv.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vertivco.onmicrosoft.com
 header.i=@vertivco.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-vertivco-onmicrosoft-com header.b=Si+ljN+5; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YK0j4BSfzDqc4
 for <openbmc@lists.ozlabs.org>; Fri, 29 May 2020 19:25:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DfvasZr5GvJpXLbVgH2Z7zfUf3BPCzznbjJEIczd/9hSeV9s8jTMMIrQrXqklawcnt8WEDozq/LHINHkHfUhbADbD+Xn9W18bZBAcs280fyxN18+IVZf1/pFkgB8AlXb9jt0VXI2BGkRA6+qnOgImk00+XSWSShRaCM/ppmOR0p+s0QBVlLpP7Z2/N/h4tGsT7qumbFnxue/w/CD09m0w5YIve2XKHT3uf2cjrzMfvY7mF3cpv0ch30UFcAkA8++ft0bPVvIIz4xbWum5J0IswyPKAL3q3wOVIpKiRLPiMmU4wYG1CWmrBEUPcKCKP0YqSrh34cRAYRPNleaHuwGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVlbXjmLpNiiHEg7sgVJTJwVqld+lvZIvWpdsKUMGi4=;
 b=HiR4+dRVkXsTRoZMiBd2apppC5USWOvdO40aV5soP4nOiZYFGKEWMieuHV3r6cj9dxYz6IBH305lUrsLyrclnLu23YwFmS0x5Qnr4ISnmmUgSfscuTfu4ufLccDN57jdiXWjBxaO/qe22D2aUrjSsoeaSUqOxYN264JDDxFjjNjhYbL70YDsXsKef8YrSLwdXanELWFe6Ow5A3+1LrxaWYulfV54t5H44lGt9tTeQDNuxnDCH5DYwRJrWFeWvWVt7m1pCxlDnoKWMwXbWczc78RDtY3hy1+zQUGRMtQYnUxVft8js2SYUx/aW0YlsWsSiv3Ot+mjfI/UOERgkMNtAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vertiv.com; dmarc=pass action=none header.from=vertiv.com;
 dkim=pass header.d=vertiv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vertivco.onmicrosoft.com; s=selector2-vertivco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVlbXjmLpNiiHEg7sgVJTJwVqld+lvZIvWpdsKUMGi4=;
 b=Si+ljN+5PKMbAJBhdrK0MGuODTck3e4MvnKtuFPvW7V7COqOpuNYTryXumEXXsVlbMjdv49EVZITMFHl8lojiEeptIA28GIAZsqPdUvvhqFicnsEWtAD7DMa5Crmjz94xctInPyvUlM6WpOOzzB8A0vBPRgbvkL32oOkLlt7VvA=
Received: from BYAPR13MB2469.namprd13.prod.outlook.com (2603:10b6:a02:ca::28)
 by BYAPR13MB2888.namprd13.prod.outlook.com (2603:10b6:a03:f5::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.7; Fri, 29 May
 2020 09:24:58 +0000
Received: from BYAPR13MB2469.namprd13.prod.outlook.com
 ([fe80::44b8:d3a4:d1aa:e7b6]) by BYAPR13MB2469.namprd13.prod.outlook.com
 ([fe80::44b8:d3a4:d1aa:e7b6%7]) with mapi id 15.20.3066.007; Fri, 29 May 2020
 09:24:57 +0000
From: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Duplicated SEL record in phosphor-sel-logger/rsyslog
Thread-Topic: Duplicated SEL record in phosphor-sel-logger/rsyslog
Thread-Index: AdY1munFIoCQABqmRAav95wkbyFzaQ==
Date: Fri, 29 May 2020 09:24:57 +0000
Message-ID: <BYAPR13MB2469979A315F956A0036BBF6ED8F0@BYAPR13MB2469.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=vertiv.com;
x-originating-ip: [103.83.160.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1687787a-9564-4d57-a7ff-08d803b227ce
x-ms-traffictypediagnostic: BYAPR13MB2888:
x-microsoft-antispam-prvs: <BYAPR13MB28884A1C333F7B5FA776D1F4ED8F0@BYAPR13MB2888.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 04180B6720
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8w9abizqZXZPc5ulKLluejR6BdXpIigs0Xm5vtLruLelOzLGgj+10IkarWxG6+QNMXdkcIsrsVRSCvC5602YcNY1w6D7kIue2agnwaZ1PF/mi+1cB2pJADDKtxyfVyfdQO7U9zex4cNj4BxHd+71lhcTtlqmWeOd0NuGokzlm2IqaqB8Fw9DQrhByOzxUhp8RVbNwFhXTm+kjJCxSF/0VVOW2kelzRTq32mfRATnk9l5ohR0pmRfcMBfWLKfArh1Sf7Rbw+RFUT+i1Aa0eN1yTt59oiXmtcWF/VJm45Tghl7Arn03wPPdTVxlm65ERdQOT86zyxwnjpCAqVPHgudnOBeFd3TZUZsU3WAvocqaaECZt3xjwAiU5JPTUmUUC4nbDpDfZ/97L08/M5MpcS+6g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR13MB2469.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(366004)(396003)(346002)(7696005)(52536014)(5660300002)(8676002)(71200400001)(6916009)(9686003)(55016002)(478600001)(966005)(86362001)(316002)(186003)(26005)(33656002)(8936002)(6506007)(64756008)(2906002)(66476007)(66946007)(76116006)(66446008)(83380400001)(66556008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: d2JZ2RIsbW0js0tH1BAAl9muF0wVAYA/7fhvOpznOMfAf2rSdgapuWvcoBksDLGFiSXXhxKAPA+KXgCR9ACksV7BjmU+Kw0hrpliskBOnJWQ8AQOwBpz2iKqZNsSHdj/4JVwfnpckjUT/ZufSBI8fUADRWQevxJNb5EPNsgBkyKitlvxie2gqVVezOrfBZFCQ7NeoQN+kOwRRInc43e5+mp6EVHVB5YSvtkgm/5HQvhoBHlJxLIRoxDwsdvCNbFLLl0pW9qL8Gn8lCG7EWxrV3WJ5I1HZLI2smnS8FV4WZ58Xo/0LmtAZlow4zv4zXfbkuAzNa870m8FtM3UQhdogOEit1qsxqfyWOUR4NEb+rq8TmrdVcf8mvnfHCJaZtfc8ITO5uqW0VDbFjy8/LKdsBAZal4ni4789/tBkIlrc0BRwUnpCrMqPoSw75t+nOs6LgLVVxa7vJLOqoQiqLgCxhKGozflJM47iYPiCObUmQY=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_BYAPR13MB2469979A315F956A0036BBF6ED8F0BYAPR13MB2469namp_"
MIME-Version: 1.0
X-OriginatorOrg: vertiv.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1687787a-9564-4d57-a7ff-08d803b227ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2020 09:24:57.7583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 74fe92c5-ef57-4d1a-a0e7-9451117d9272
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I4xfSIefgmLo+Zf6nn8OrAtf0rmkXU+sqDiXxeq+3v4DdmAnnXzp40kl/0rd/Lvqn1LjFHxEIKDPyCvQKZr7qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR13MB2888
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

--_000_BYAPR13MB2469979A315F956A0036BBF6ED8F0BYAPR13MB2469namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Team,

We're using phosphor-sel-logger with rsyslog to store IPMI SEL. Sometimes w=
e get duplicated SEL records in /var/log/ipmi_sel.

For example:
1970-01-01T18:27:27.752917+00:00 63944,de,20000407A06F020001,,,
1970-01-01T18:27:28.772865+00:00 63945,de,20000407A06F020001,,,
1970-01-01T18:27:29.793016+00:00 63946,de,20000407A06F020001,,,
1970-01-01T18:27:30.813187+00:00 63947,de,20000407A06F020001,,,
1970-01-01T18:27:30.813187+00:00 63947,de,20000407A06F020001,,, <- Duplicat=
ed
1970-01-01T18:27:31.833018+00:00 63948,de,20000407A06F020001,,,
1970-01-01T18:27:32.853137+00:00 63949,de,20000407A06F020001,,,

This issue always happens when imjournal reloaded at the same time, so the =
journal log will shows:
Jan 01 18:27:31 evb rsyslogd[288]: imjournal: journal reloaded... [v8.1904.=
0 try https://www.rsyslog.com/e/0 ]

Does anyone meet this issue before or do you have any suggestion on the con=
figuration?

Thanks,
Troy Lee
CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are i=
ntended solely for the use of the individual or entity to whom they are add=
ressed and may contain confidential and privileged information protected by=
 law. If you received this e-mail in error, any review, use, dissemination,=
 distribution, or copying of the e-mail is strictly prohibited. Please noti=
fy the sender immediately by return e-mail and delete all copies from your =
system.

--_000_BYAPR13MB2469979A315F956A0036BBF6ED8F0BYAPR13MB2469namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
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
	panose-1:2 2 5 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;
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
<body lang=3D"ZH-TW" link=3D"blue" vlink=3D"purple" style=3D"text-justify-t=
rim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Hi T=
eam,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">We'r=
e using phosphor-sel-logger with rsyslog to store IPMI SEL. Sometimes we ge=
t duplicated SEL records in /var/log/ipmi_sel.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">For =
example:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">1970=
-01-01T18:27:27.752917&#43;00:00 63944,de,20000407A06F020001,,,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">1970=
-01-01T18:27:28.772865&#43;00:00 63945,de,20000407A06F020001,,,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">1970=
-01-01T18:27:29.793016&#43;00:00 63946,de,20000407A06F020001,,,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">1970=
-01-01T18:27:30.813187&#43;00:00 63947,de,20000407A06F020001,,,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">1970=
-01-01T18:27:30.813187&#43;00:00 63947,de,20000407A06F020001,,, &lt;- Dupli=
cated<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">1970=
-01-01T18:27:31.833018&#43;00:00 63948,de,20000407A06F020001,,,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">1970=
-01-01T18:27:32.853137&#43;00:00 63949,de,20000407A06F020001,,,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">This=
 issue always happens when imjournal reloaded at the same time, so the jour=
nal log will shows:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Jan =
01 18:27:31 evb rsyslogd[288]: imjournal: journal reloaded... [v8.1904.0 tr=
y https://www.rsyslog.com/e/0 ]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Does=
 anyone meet this issue before or do you have any suggestion on the configu=
ration?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Than=
ks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt">Troy=
 Lee<o:p></o:p></span></p>
</div>
CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are i=
ntended solely for the use of the individual or entity to whom they are add=
ressed and may contain confidential and privileged information protected by=
 law. If you received this e-mail
 in error, any review, use, dissemination, distribution, or copying of the =
e-mail is strictly prohibited. Please notify the sender immediately by retu=
rn e-mail and delete all copies from your system.
</body>
</html>

--_000_BYAPR13MB2469979A315F956A0036BBF6ED8F0BYAPR13MB2469namp_--
