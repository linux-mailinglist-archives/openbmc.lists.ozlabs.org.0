Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DE5453AEF
	for <lists+openbmc@lfdr.de>; Tue, 16 Nov 2021 21:27:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtyKL6WP2z2yZv
	for <lists+openbmc@lfdr.de>; Wed, 17 Nov 2021 07:27:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Xd/gAFFC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.94.69;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=christianc@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=Xd/gAFFC; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtyJq1hprz2yPW
 for <openbmc@lists.ozlabs.org>; Wed, 17 Nov 2021 07:26:47 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXUG8prG2/vv+kKZ6D+wLus5H46QQo738ITayLlfxUYRTa+UnzqHvlqcOPU9p0jpAcUj+fJZER3cOqt10ScS+akgAvJdAgiQtez1GJTawWyn4snskQLAXnuoxLPfRXzAOlG4eMyQQBRkZwjgnyGh4xjxmN+kHWULLVDhTmqQmJI+LL2yqnJ5UDh3yr3MsQaBO8nRwu+l385UTs2WkJxxGamwZEksz8tEMJouMzkd2Mh0igd24+nJOEWvCBa+Tv8r4sCajA+VRyReLBIJkQLGm3z3cPFuESTc1wrP+FaYob4LCAOydJ4fzqT9nm0YfdY+epceT/xk7sDReyEQ0QGXeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U4Z7qkVlxBdLL2pCLfZLzHTTLu3wFVnqiMhjmcXILKs=;
 b=Dy6PpTSvcPS+PxKyUA5IzZdJwdm/L4gonwTqGY9dmoI0B8HtEXxelepnRjjIbntluxMbFvW7+D/YY3M7fLFFKnTXYScEYF2fcfHBXZ6clQKvBmu9rfHnWptpOGoGJqZc6gbvNnUS7lNrXLcwHl9UTXRU6gQXg2p/Rvni2whVOuapQ+JoUaxY1ce0TXgOYQU7CwEWTiju7yVRJqs8ZT9IQXtTdaXfvQmtlLgwmRE3f2PptIK629L4vyZy3tA9G0yHExAF3e8QrNRyteaeUrl00/RNrCI+50l0IDCW4faghbOaL5lIcB64iCJsbOJqJbAPkIfvbvYBP6Qamxs39iuGTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U4Z7qkVlxBdLL2pCLfZLzHTTLu3wFVnqiMhjmcXILKs=;
 b=Xd/gAFFCRHaby4DXoANJh5mQFaFla+qqLI+6ve/AZM5p8cpFVlpQu1cY+Ohj7kRSr8pge2ax9Jg4KNyyzReeT8XQAubIUcox1Wp3qFvL+Os3+uBh0mx+XI+kLOr4e0fHJIMYjl4/Vw06KIGBpE8yaipWPeQg3zWotnxkqW6243B4kEQNmvCwbLgjqYkhtkPKvrqb4dgZkZFc63Crf4RLY90E/cPkwP7LbfxNZ60vkmflD6FSceLKENlxhwQ+6mdRwrK357HJvUhD4OH3SXm4z1S0r1/CYGMSMR3f6nVwx/Z3Avu5VKHFcqhyZRzi9ERvac0evu1BCj38NGx7+f36Yg==
Received: from BYAPR12MB2983.namprd12.prod.outlook.com (2603:10b6:a03:d6::20)
 by BYAPR12MB3606.namprd12.prod.outlook.com (2603:10b6:a03:d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Tue, 16 Nov
 2021 20:26:26 +0000
Received: from BYAPR12MB2983.namprd12.prod.outlook.com
 ([fe80::554b:7d7:bfb4:8131]) by BYAPR12MB2983.namprd12.prod.outlook.com
 ([fe80::554b:7d7:bfb4:8131%7]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 20:26:26 +0000
From: Christian Choi <christianc@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [phosphor-logging] Entry Class Methods Mapping
Thread-Topic: [phosphor-logging] Entry Class Methods Mapping
Thread-Index: AQHX2yeZXP4XEj0qdUitOa7p9WPDDA==
Date: Tue, 16 Nov 2021 20:26:26 +0000
Message-ID: <BYAPR12MB2983BE2EFA7A4AFEE875631ABA999@BYAPR12MB2983.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a3dc31f0-693e-4db1-fdff-08d9a93f5d4b
x-ms-traffictypediagnostic: BYAPR12MB3606:
x-microsoft-antispam-prvs: <BYAPR12MB3606CA6C72A0420A2313264BBA999@BYAPR12MB3606.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iXJdwe6ySbuKi8ArGheYA+3F4/SuWztw8r8TiC4sJ5z69vxwqMxhcgY7ArL1J7oyytTFuSXI/ylCjGnl/CY1GIdAES46T3a5H/nvRIuEPX4xJBTw4rQ6SPtqP81Y5sCCAEhBYU4W8vU7FyOIp4ApuHZ+bIiDURLu2HRuSN9L6MOxZQsEwH7v6f59I1spNuJ8r97vJntvgbnVt0gUgrrSlWm0sbKK18/UkORbBs9SQ0zBrxht0DqVZ7Gvy4FAbkRIno4ro6BEzclh7kPwAnG3Mr2QbLyxyNIrg/im5186JnMJ7UJDI9s9nOO1uvfRPJeyMnAZ9ez5IDCYZGWvGArlYQnF/eoK5EE/6LZd/Nck+3Piw7ex3NnBeMn5UdBVpIPixPUa5uVe9gwz8iWCvXLDWwxltuttkzM5d6yXtvvolmKT/9UPPgE+orbSdWcdLhCiKo+HI5uZtx/hLYB2jBrzc37GwfPmadfachsJro/f399Rrwxqvqe8jdb1tCzbhkXk9ihJrP3vZOeYvpXH+iNJeG+kKpviyYJHIoVO3HE30vimNubsQaSe1BjgUQ+vG36sQt3AH+5ylGjnxeWQg5g76AmvIA1hlIvl+k6bq/+FvOqF7qGyJRC3mQnrUg2FMFtPyY6hpEmd4c6WaYq+1/CsZaN0DoLS1vocFep2XQhrh+ts+fbgW4DYZQMIVEXyhATp3QQ3uHgXz9SCMSHox5dhRg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB2983.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(8676002)(9326002)(71200400001)(316002)(6506007)(8936002)(4744005)(6916009)(186003)(66556008)(55016002)(66946007)(86362001)(26005)(64756008)(66446008)(66476007)(508600001)(9686003)(33656002)(76116006)(7696005)(38100700002)(52536014)(38070700005)(122000001)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?2xi4esmvtKmWcx9Q0RP+s1ffKtXDFwW/zZ2Jtebjnprn7EoJL148BqUc?=
 =?Windows-1252?Q?hJulHGnPnjChfhfXT3e2GnC1Gt79jEP4osVWZOj/0G7/HFh71p4LNgJg?=
 =?Windows-1252?Q?u8ysrb3LlJzzmHAtiih+8vG1M2RCQ9FiCxon50TDWSAf8gOaOdDkQKYA?=
 =?Windows-1252?Q?IfWKRPVEEDb7FLRQc1KMxY0+lCDm7tOjRhn9ZgmC5pO7uUpyalgO6Lut?=
 =?Windows-1252?Q?9rEvJvSboQ5ZaJY6Ikar/V79ZFs1ol7E+blV1I4jDcOIFCAX15C3DHfv?=
 =?Windows-1252?Q?P04C2z6iBgzyrfi3D4zZb6HvTppS0rly3I5udqClxoZanhGHY1W4Yay0?=
 =?Windows-1252?Q?E0VdlPlOtKFnlwGB8CyNJWOrfRjTyd4cAZcFlTF0N9YBByHBgv3Icfe4?=
 =?Windows-1252?Q?tOyQgBLhZk0QbBrK8D2Dm4lybTF5RuyGWsz1EdSCqcFwmCDVUrEtVn5F?=
 =?Windows-1252?Q?lZf9aVuGzDA+KVB+4wFYUCTeLK/6hPydvUFymeoO6MAThE8cCPJ5hGrA?=
 =?Windows-1252?Q?tT8ykACdd9/5tW1ba6VkRFuk0SX5QEEsl7eQebW6AAt1vZjC+ZkaIYwF?=
 =?Windows-1252?Q?i/XFxrM+9NtlZNb93YvntPKN62ptTOdIBgPueTrzXLKete4FhCC3FUTD?=
 =?Windows-1252?Q?mk3g1Mo18FO9NW3E5+LjOqWhZn2WHcU5WWEjVSf9ZH3qLxvw6hwM0wge?=
 =?Windows-1252?Q?5oKOc+E9jPzAV7E4um1FtSix2vH8Ay+rxiCrXz/U3NLw2dVNAWhwiheD?=
 =?Windows-1252?Q?eF5vmKSbeiHLYSYHbZfsBxiM+qpJ8dNFszYumUfjhQ87XaTs7vfXcEMT?=
 =?Windows-1252?Q?RMEyxfpZ68eDKfMu9beMe3TPOZEHmXXYx4RGyzyqxjUgfUJgHu1sehWe?=
 =?Windows-1252?Q?VCPJjiIg/BKCMZybPxBWENMqNTssm5RqE3kk5noTSh5UC/elXYczJnO4?=
 =?Windows-1252?Q?zhtnLn6d1wvazqYDQ/VAnAsMDJX/Nkvr2eWecg+6YNT3NbXpYYlxdsh1?=
 =?Windows-1252?Q?/v6iIBpvlh9bOIIQhOdm8NJTT/LasCWTZmCK4L8bPY1jvH2wvKe0At0U?=
 =?Windows-1252?Q?ubpMQhHkBd7U+KYT7K31Vl7Sq2HHBb86/Eut4zi0S2VjFqYUwjTS+RGh?=
 =?Windows-1252?Q?9eAVfkwXIUQriirvuqPh+t9rLD30V+fOKVaIO5O7JSP7GsdShwUSI2Jf?=
 =?Windows-1252?Q?u8JPwdayp92x21mABCdl7otFlUGVpcwBgzAow4EStyOrTFRXqyzFP03u?=
 =?Windows-1252?Q?kfG9ApHVXlV7l6SwEfJSLaYKR+3AcEa4hU/Z9D9K1je5i0e2KQOOdq6E?=
 =?Windows-1252?Q?TozdTnjE4O0siYmUQ8gFt4rEejMd+wBDNZmcVMDveO6UQtTyqW46gKiF?=
 =?Windows-1252?Q?H82pV4E2MayLh5Z8wmtSd3eiPTbwNUMPgqLmNH/nrj9vB7WFphXSyfz6?=
 =?Windows-1252?Q?Hby5uUGylEe1uNgzgOnt9U8Bj6deVX+W5BdjDKY5wN14GdVNkKFbXyqF?=
 =?Windows-1252?Q?N/eGGEmhDZB03uYKTvcRGJ5wxNmXtvMXroandLTCSy5SfZu5RK0NS4AJ?=
 =?Windows-1252?Q?0mSu7L2pGbkcKQIe3aJIhl/YUfQPdTeqO7nstFA7oSAyCvun8WOXpcB2?=
 =?Windows-1252?Q?5G/bONyVX0cOg5B6RsShuay5RAtjyoGztwtxAFyR6oQqn5jmRzVtxsbN?=
 =?Windows-1252?Q?oCXQ2ST5ToT8ZdrkiMmkOFr/QzIguw5EyznaaY9ILK4DCH95NqhmEv35?=
 =?Windows-1252?Q?8pB/WGVtaON4/47ow6pEzpKJskoC4JqLVgmOvmRE?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR12MB2983BE2EFA7A4AFEE875631ABA999BYAPR12MB2983namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2983.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3dc31f0-693e-4db1-fdff-08d9a93f5d4b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 20:26:26.1221 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i/C1j2g4cYaUGw5A2NzVX6xzhsnBaLbP3Nly4Za0sgJ0kY3uVWmV7tu9YjmUDznepAu7kqjnDGfnvuVwGfv/AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3606
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

--_000_BYAPR12MB2983BE2EFA7A4AFEE875631ABA999BYAPR12MB2983namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello,

I need a way to map the string representation of methods in the Entry class=
 to the actual method itself. Right now, I am hard-coding my own map as fol=
lows:

// create mapping of function name to actual function of Entry class
typedef std::string (Entry::*entry_method_t)(std::string);
std::map<std::string, entry_method_t> fnMap;
fnMap["resolution"] =3D &Entry::resolution;
fnMap["eventid"] =3D &Entry::eventId;

I was wondering if there already exists some mechanism in the code that acc=
omplishes this so I don=92t have to write the code myself like I did above.=
 I was told by someone that sdbusplus may provide a mapping like this.

Any thoughts and insights would be appreciated.

Regards,
Christian

--_000_BYAPR12MB2983BE2EFA7A4AFEE875631ABA999BYAPR12MB2983namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
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
	{font-family:Menlo;
	panose-1:2 11 6 9 3 8 4 2 2 4;}
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
--></style>
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I need a way to map the string representation of met=
hods in the Entry class to the actual method itself. Right now, I am hard-c=
oding my own map as follows:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"background:#ECFDF0;vertical-align:top"><i><=
span style=3D"font-size:9.5pt;font-family:Menlo;color:#999988">// create ma=
pping of function name to actual function of Entry class</span></i><span st=
yle=3D"font-size:9.5pt;font-family:Menlo;color:#303030">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:#ECFDF0;vertical-align:top"><b><=
span style=3D"font-size:9.5pt;font-family:Menlo;color:#303030">typedef</spa=
n></b><span style=3D"font-size:9.5pt;font-family:Menlo;color:#303030">
</span><span style=3D"font-size:9.5pt;font-family:Menlo;color:#333333">std<=
/span><b><span style=3D"font-size:9.5pt;font-family:Menlo;color:#303030">::=
</span></b><span style=3D"font-size:9.5pt;font-family:Menlo;color:#333333">=
string</span><span style=3D"font-size:9.5pt;font-family:Menlo;color:#303030=
">
 (</span><span style=3D"font-size:9.5pt;font-family:Menlo;color:#333333">En=
try</span><b><span style=3D"font-size:9.5pt;font-family:Menlo;color:#303030=
">::*</span></b><span style=3D"font-size:9.5pt;font-family:Menlo;color:#333=
333">entry_method_t</span><span style=3D"font-size:9.5pt;font-family:Menlo;=
color:#303030">)(</span><span style=3D"font-size:9.5pt;font-family:Menlo;co=
lor:#333333">std</span><b><span style=3D"font-size:9.5pt;font-family:Menlo;=
color:#303030">::</span></b><span style=3D"font-size:9.5pt;font-family:Menl=
o;color:#333333">string</span><span style=3D"font-size:9.5pt;font-family:Me=
nlo;color:#303030">);
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:#ECFDF0;vertical-align:top"><spa=
n style=3D"font-size:9.5pt;font-family:Menlo;color:#333333">std</span><b><s=
pan style=3D"font-size:9.5pt;font-family:Menlo;color:#303030">::</span></b>=
<span style=3D"font-size:9.5pt;font-family:Menlo;color:#333333">map</span><=
b><span style=3D"font-size:9.5pt;font-family:Menlo;color:#303030">&lt;</spa=
n></b><span style=3D"font-size:9.5pt;font-family:Menlo;color:#333333">std</=
span><b><span style=3D"font-size:9.5pt;font-family:Menlo;color:#303030">::<=
/span></b><span style=3D"font-size:9.5pt;font-family:Menlo;color:#333333">s=
tring</span><span style=3D"font-size:9.5pt;font-family:Menlo;color:#303030"=
>,
</span><span style=3D"font-size:9.5pt;font-family:Menlo;color:#333333">entr=
y_method_t</span><b><span style=3D"font-size:9.5pt;font-family:Menlo;color:=
#303030">&gt;</span></b><span style=3D"font-size:9.5pt;font-family:Menlo;co=
lor:#303030">
</span><span style=3D"font-size:9.5pt;font-family:Menlo;color:#333333">fnMa=
p</span><span style=3D"font-size:9.5pt;font-family:Menlo;color:#303030">;
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:#ECFDF0;vertical-align:top"><spa=
n style=3D"font-size:9.5pt;font-family:Menlo;color:#333333">fnMap</span><sp=
an style=3D"font-size:9.5pt;font-family:Menlo;color:#303030">[</span><span =
style=3D"font-size:9.5pt;font-family:Menlo;color:#DD1144">&quot;resolution&=
quot;</span><span style=3D"font-size:9.5pt;font-family:Menlo;color:#303030"=
>]
<b>=3D</b> <b>&amp;</b></span><span style=3D"font-size:9.5pt;font-family:Me=
nlo;color:#333333">Entry</span><b><span style=3D"font-size:9.5pt;font-famil=
y:Menlo;color:#303030">::</span></b><span style=3D"font-size:9.5pt;font-fam=
ily:Menlo;color:#333333">resolution</span><span style=3D"font-size:9.5pt;fo=
nt-family:Menlo;color:#303030">;
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"background:#ECFDF0;vertical-align:top"><spa=
n style=3D"font-size:9.5pt;font-family:Menlo;color:#333333">fnMap</span><sp=
an style=3D"font-size:9.5pt;font-family:Menlo;color:#303030">[</span><span =
style=3D"font-size:9.5pt;font-family:Menlo;color:#DD1144">&quot;eventid&quo=
t;</span><span style=3D"font-size:9.5pt;font-family:Menlo;color:#303030">]
<b>=3D</b> <b>&amp;</b></span><span style=3D"font-size:9.5pt;font-family:Me=
nlo;color:#333333">Entry</span><b><span style=3D"font-size:9.5pt;font-famil=
y:Menlo;color:#303030">::</span></b><span style=3D"font-size:9.5pt;font-fam=
ily:Menlo;color:#333333">eventId</span><span style=3D"font-size:9.5pt;font-=
family:Menlo;color:#303030">;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I was wondering if there already exists some mechani=
sm in the code that accomplishes this so I don=92t have to write the code m=
yself like I did above. I was told by someone that sdbusplus may provide a =
mapping like this.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any thoughts and insights would be appreciated.<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Christian<o:p></o:p></p>
</div>
</body>
</html>

--_000_BYAPR12MB2983BE2EFA7A4AFEE875631ABA999BYAPR12MB2983namp_--
