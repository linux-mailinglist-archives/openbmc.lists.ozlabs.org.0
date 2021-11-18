Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7818456772
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 02:28:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwJw05Gtyz305V
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 12:28:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=jabil.com header.i=@jabil.com header.a=rsa-sha256 header.s=selector1 header.b=ipXn9skx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=jabil.com (client-ip=40.107.220.120;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=alice_hsu@jabil.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=jabil.com header.i=@jabil.com header.a=rsa-sha256
 header.s=selector1 header.b=ipXn9skx; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2120.outbound.protection.outlook.com [40.107.220.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvhYT0Jjbz2xt5
 for <openbmc@lists.ozlabs.org>; Thu, 18 Nov 2021 12:10:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hd1XMfQ4NWV7ZIsyKKQcKRRDFL/HUlFeveO4b9mwlDp7GK95I2P/U9Q8FclSJOHoCA09pwZazPmoMZC+GkwAF2T0usY1xHyBiLFWZUb9+aOiEsUMt0ojoKfQFPjcMN9ygKsI5WNMOTHXo0UnNAeZJ7CYiaiue22Ztl1/fM5jWcJSDy8SmBN3g8nGF0kTHaLS9SWV4uuS4AiOE2ml5jPQVNj477FPQwjdKQ9aBLUjBzBlOR5HB2Tbm7mEim9AYSH/Erjewb676eqnG5rV7WFWZHdRynQP2NJlE0OkypMxuQTp+Xd8SHXr71pL22cRKe03IRvjO5yxwqb1ZDmGukuMZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kdN870GSD87rQWpt01bSryr9CZHLu2HS8B+9P56okI=;
 b=LBoksNItJGMuprHFZwqg9e+xs8NPFjmRON5Dw1BH948G1F7v5/c9QQw8BlD8fXKXv/HYab79SBhYIslLVAK8xOaRNSY5JMmA3lq6L40iyDN6tapyQ7n/kQtajxoD54NJ2swwlqbj+1sr7A43M+PTX+IwrprpL7nRphycSu+9avlByd5GPMUWnnCciFo9HhEPx1AjlajbZS0oPqNh82DxY2DjXBejtMnCMFBHN2AixcPKBlZDJIeD2t6Nb3RX1rr1XYRQvKuiqtsQVS1CvVJzM4Z/VTyuqEghnDIfzUmcRaqerSllGO52vQLsiGgMRZXuwTZGHLBY55O+TzyahBz7vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=jabil.com; dmarc=pass action=none header.from=jabil.com;
 dkim=pass header.d=jabil.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jabil.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kdN870GSD87rQWpt01bSryr9CZHLu2HS8B+9P56okI=;
 b=ipXn9skxuTfAMjCMU/DDw/YEZ9N/+RkO3M5TNBURglrT8+Dh/VGBNAmsq1SuExKkDc9cIrQrA3pbvsaRU7EbJEcKf9h3Qlc/Al4qZrFyqJZWABxYYNjv4QMwaWNgSUzlqq/ghKDE0EXvwiBlTKe2B2Ssn1P/ZEbRm2KR7dKkb/A=
Received: from DM8PR02MB8172.namprd02.prod.outlook.com (2603:10b6:8:1d::16) by
 DM6PR02MB5163.namprd02.prod.outlook.com (2603:10b6:5:46::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.26; Thu, 18 Nov 2021 01:10:00 +0000
Received: from DM8PR02MB8172.namprd02.prod.outlook.com
 ([fe80::5d47:e9df:b11b:5692]) by DM8PR02MB8172.namprd02.prod.outlook.com
 ([fe80::5d47:e9df:b11b:5692%5]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 01:10:00 +0000
From: Alice Hsu <Alice_Hsu@jabil.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: How to implement dual rotor FAN in Entity Manager & PID control
Thread-Topic: How to implement dual rotor FAN in Entity Manager & PID control
Thread-Index: AdfcF71iSNX+1AhATSeITnP9uarZFQ==
Date: Thu, 18 Nov 2021 01:10:00 +0000
Message-ID: <DM8PR02MB817219EA19150F26938B4D098A9B9@DM8PR02MB8172.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5Lmh0bWwiIHA9ImM6XHVzZXJzXDMxMDA2NzBcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRiYTI5ZTM1Ylxtc2dzXG1zZy0zZTcyYjg0Ni00ODBjLTExZWMtYjZhZS0yY2RiMDc5NmNhYTJcYW1lLXRlc3RcM2U3MmI4NDctNDgwYy0xMWVjLWI2YWUtMmNkYjA3OTZjYWEyYm9keS5odG1sIiBzej0iNjE0MCIgdD0iMTMyODE2NzEzOTc2NTM4MDEzIiBoPSIwdDJnL2dNaml6Q3Z4QVQ3UkhxSHdEK1A0bDQ9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=jabil.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66f978a7-3551-4435-57bf-08d9aa302514
x-ms-traffictypediagnostic: DM6PR02MB5163:
x-microsoft-antispam-prvs: <DM6PR02MB5163346DBA89CAB8D1502BBB8A9B9@DM6PR02MB5163.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mjfF+gENvCg5xfZAnd/yA0InBNHKEOKpctZk292IxMOH/yXiTqbXW7vfSMxDiHi3g6Y0g1f4e/KcJsOBnOxH70n5dKen+H8YgD9bLaIhqU6RBCtMoTC73Dlb+oEb71t28DXzwDiRvEARdEg7j3jBFIKo3Jrd9KT2L5y5fSipk9VoDJd3NKRbXUwdBMoMJvq+BMzr/faYTfCJM+RuPbRRfUby/Xn0UvqTl1VTwNBuLMeqZPJkp/VshH6vPSw4qyZZW4AmpB0bpotIGX8Qygg7gkPlaeB+Bdot8oJeVjI5meowDshJJA6bWSidWC0Kw18lzRyJ1M6Ya5C0yKKWGK2MZ+/4sWX1GBSYWevV7M9KTPDoUuj9u9SQZy0UTdX/UU1Pui30aV7RB8m5ePrMdm4UjsTV5nRLiCZOblb8YgeJ5WA/nGHW5h3Nwd81flvY+JdC169tHerDfhj/zvGzK49Cxm1zynMJhfuns+cT/w66eJMgr1mDxqAjGMDoJz1drjmGEI0v9C4H6NA7GBPONdEVBPfRYPQ1aGyK1M9+wdT3lngys7wH9l0W7hY84rH3bwJoiEJfNwlLloPwaqYsW1baaYa1hz8YwH/I7Br3VPISH/ON8hBpnR5AYgtwlxkBMIy6TWkK81I2eN23vcuquR9TTZHGvSnCNSIIo63gbssazgrVJGFfy0nbP2SqThWSaeB+Jw5pSjeaodlH8CgTZWu2+O9V/ZQ6OydBK24iKr3vAjJAkbUYCT31BxJ15OffgEbTt/QFdMovSc76kZxVghajnPzu9FNeowB6hUrZwRIsZUiX7AvjodpNrUq910lGqOYiGmAuofvoBMmUJVe971vsrA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR02MB8172.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(508600001)(8676002)(26005)(2906002)(71200400001)(38070700005)(54906003)(6916009)(82960400001)(316002)(52536014)(166002)(7696005)(9686003)(38100700002)(76116006)(33656002)(66476007)(86362001)(55016002)(66556008)(122000001)(55236004)(6506007)(66446008)(66946007)(4744005)(64756008)(966005)(107886003)(186003)(5660300002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vrI2Y36dcavWCP1K1+KYSw2/47XdMBKMTOEbSloMehQJXDhDxlUqnFJpmdzM?=
 =?us-ascii?Q?tBGIGh/KehQMf1runVLquTwXreuFNyyiffKe79muT1TK8+lm1kVPgQXpMXm7?=
 =?us-ascii?Q?qVs1y5pwQTry/dOAK1A1GupS90xF0jUIFWAQ51l/WmC3QKiCqVsTbl11EMyq?=
 =?us-ascii?Q?e21/9a5xQsMXcSEqB7XOtH1UztVhdThK2eBQDY3gtOV6nh38mzPLV3J3ry3k?=
 =?us-ascii?Q?5myek44IasIqaZMLqVMUfiHs4btNpMRlCps9JPteBylpT9wcyk/saDAgzEC+?=
 =?us-ascii?Q?FPip5lce+C0VcrSfsrSwZJ7YxICfJt7XEeb7L0tSWJEcsnLgRd0OwVWZywYb?=
 =?us-ascii?Q?Iv5+tjR1Qkczio4dsyEsOMDb3FnS8lUkrbqqFCzb0prVfeM8efmYqaZQlean?=
 =?us-ascii?Q?kd/dN9xsRHushnvu3njPCr1+AdiCcbr7XdhXNsVrPQAJ//wY43mb6sCK1p1N?=
 =?us-ascii?Q?530NFERvpl+VCdoszvPBEX7X4xQIHKflPQcKpXi3BpCAyooxe0qTIsCq4mN/?=
 =?us-ascii?Q?bhHbbGcXQhQIMVg3AAExtwwR41MMBwO5ta5mccR2SvlsVeZtGxLJitvxLwC3?=
 =?us-ascii?Q?RWFWMtsR51DCiFuY+t6kyj7Mnu7+K/FeZygZRlJRf0T9D/oN0lAjGU2xU35B?=
 =?us-ascii?Q?GidmgNQvSDWkPDhhI5Gz9Z9jsItb7zWcmgkzNRFS3D27jKjSueU1jqRxptUl?=
 =?us-ascii?Q?pmNsnsuBYm3E/epNs0kKKUdDIFnR5e+9zFGgp+pydSzSAa5jRY1vreJgE+eA?=
 =?us-ascii?Q?/GOkHcI2b1dt72wyRo8tSqbhaIiPLuTqYj1qrvTAROWLWXTr5lQGKQfKF84q?=
 =?us-ascii?Q?CwN29pH1H4u31NwqwuyX55Lc19HrWEknTuOhoq9T66HVoY5/dgb8zK8Hkwps?=
 =?us-ascii?Q?0PSOQzRkBVL2RQTaM6PP80OFG0Tkl6AV35DTeym5qfCcVo4xuLdHUO/Qdtqt?=
 =?us-ascii?Q?OafXvJT2lhj5N4TxvzZEDM+7Q0KScImItZLUV2B7EL3TtdJYzcB9Iar9IBWz?=
 =?us-ascii?Q?jCOsHWSiHX1UdqLqU7SET86/7JpasTn4r8LOcZeEh+/m66Y+SIcdIbm4j+sU?=
 =?us-ascii?Q?nAEozfAhUumuYHWBu569oggvw9SeP9+5E899SliijPlJ8AaT4H71GweDYjNr?=
 =?us-ascii?Q?nJWcYSKmMguMbMtdZLm+wz13JkoKTmSZsv8ezhlGzF/zmsFj+JEteh5olLoc?=
 =?us-ascii?Q?D+ufNqFRwX6Uiy/y2+Yc4TCA0D0rBYLGGfWbSdKlGzyqCRhHfN/RcG5ohXTn?=
 =?us-ascii?Q?1YLT+LKIyd6aRbYWjLNv2h/NKNv3OPNnwdCYjKI7sy+O1N9zhU2q3qa6wUQW?=
 =?us-ascii?Q?EVtHZoYwhR4H8L3bAnum6AFUWxqPjiaozFJQBJzIOPDriZLZmh8yu9btgMnu?=
 =?us-ascii?Q?b4y4OvRvHguAqFb3Uu1GjNdNIPGsCKX8C3OzByHFGcdHDa/F6yKg9e3yQdNS?=
 =?us-ascii?Q?9VzH5AKLCMiybeyUXS8i6SqKIQLBXX8dbnP6l66LBDXrxHPjhX+Ebe/hnoQe?=
 =?us-ascii?Q?YWREr+kSJNEZbzPEE1PBzERwEpkBgfjzweXG4ruBxMCi76wfhyLeL703Vp3h?=
 =?us-ascii?Q?IR2Qqm2sDOR9X5J8xbM7N1JOLJjbGESOw/JGWy+ymnWd19C/cMVfG5X8GC8q?=
 =?us-ascii?Q?MqeTU0y8CHO8iuVcJVkFF2A=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM8PR02MB817219EA19150F26938B4D098A9B9DM8PR02MB8172namp_"
MIME-Version: 1.0
X-OriginatorOrg: jabil.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8172.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f978a7-3551-4435-57bf-08d9aa302514
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 01:10:00.5623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bc876b21-f134-4c12-a265-8ed26b7f0f3b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pfDTIYE3kjpXRs/LEj2avfUX5UT/GyTZSuIgvoU3b7kgV3ug1X5NI2EJqSoYOv1Egkx9rMkZ99XOfhkrVc8URQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5163
X-Mailman-Approved-At: Fri, 19 Nov 2021 12:28:09 +1100
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
Cc: Ian Chang <Ian_Chang@jabil.com>, Alice Hsu <Alice_Hsu@jabil.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM8PR02MB817219EA19150F26938B4D098A9B9DM8PR02MB8172namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi team,

I would like to post dual rotor FAN in my BMC, but I have some problems in =
EntityManager/Fan sensor and PID control.

  1.  Entity Manager:

Per present pin could only corresponding to one fan tach, do it support the=
 dual rotor condition , if it could how to configure the setting ?

  1.  PID Control: https://github.com/openbmc/phosphor-pid-control/blob/000=
1ee0224eea058e8bf0a71bd019e74f8b1738d/dbus/dbusconfiguration.cpp#L663

The referenced mentioned PID only support one pwm per one tach , we would l=
ike to know how to support dual rotor FAN?

Also post more details here.
https://github.com/openbmc/phosphor-pid-control/issues/18
https://github.com/openbmc/entity-manager/issues/17


Sincerely,
Alice Hsu


--_000_DM8PR02MB817219EA19150F26938B4D098A9B9DM8PR02MB8172namp_
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:24.0pt;
	mso-para-margin-top:0cm;
	mso-para-margin-right:0cm;
	mso-para-margin-bottom:0cm;
	mso-para-margin-left:2.0gd;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
.MsoPapDefault
	{mso-style-type:export-only;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1656959004;
	mso-list-type:hybrid;
	mso-list-template-ids:1068931456 1133289730 67698713 67698715 67698703 676=
98713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:18.0pt;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%2\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:48.0pt;
	text-indent:-24.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:72.0pt;
	text-indent:-24.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:96.0pt;
	text-indent:-24.0pt;}
@list l0:level5
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%5\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:120.0pt;
	text-indent:-24.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:144.0pt;
	text-indent:-24.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:168.0pt;
	text-indent:-24.0pt;}
@list l0:level8
	{mso-level-number-format:ideograph-traditional;
	mso-level-text:%8\3001;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:192.0pt;
	text-indent:-24.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	margin-left:216.0pt;
	text-indent:-24.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
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
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi team,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I would like to post dual rotor=
 FAN in my BMC, but I have some problems in EntityManager/Fan sensor and PI=
D control.<o:p></o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:-18.0pt;mso-para-margin=
-left:0gd;mso-list:l0 level1 lfo1">
<span lang=3D"EN-US">Entity Manager:<o:p></o:p></span></li></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">Per present pin could only corresponding to o=
ne fan tach, do it support the dual rotor condition , if it could how to co=
nfigure the setting ?<o:p></o:p></span></p>
<ol style=3D"margin-top:0cm" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:-18.0pt;mso-para-margin=
-left:0gd;mso-list:l0 level1 lfo1">
<span lang=3D"EN-US">PID Control: <a href=3D"https://github.com/openbmc/pho=
sphor-pid-control/blob/0001ee0224eea058e8bf0a71bd019e74f8b1738d/dbus/dbusco=
nfiguration.cpp#L663">
https://github.com/openbmc/phosphor-pid-control/blob/0001ee0224eea058e8bf0a=
71bd019e74f8b1738d/dbus/dbusconfiguration.cpp#L663</a><o:p></o:p></span></l=
i></ol>
<p class=3D"MsoListParagraph" style=3D"margin-left:18.0pt;mso-para-margin-l=
eft:0gd"><span lang=3D"EN-US">The referenced mentioned PID only support one=
 pwm per one tach , we would like to know how to support dual rotor FAN?<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Also post more details here.<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/phosphor-pid-control/issues/18">https://github.com/openbmc/phosphor-=
pid-control/issues/18</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/entity-manager/issues/17">https://github.com/openbmc/entity-manager/=
issues/17</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Sincerely,<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Alice Hsu<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_DM8PR02MB817219EA19150F26938B4D098A9B9DM8PR02MB8172namp_--
