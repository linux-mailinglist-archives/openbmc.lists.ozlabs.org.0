Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C9D332D83
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 18:45:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw2g270tbz3cPp
	for <lists+openbmc@lfdr.de>; Wed, 10 Mar 2021 04:45:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=InventecCorp.onmicrosoft.com header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-InventecCorp-onmicrosoft-com header.b=ROJSw+hn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inventec.com (client-ip=40.107.131.102;
 helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=udupa.ashwini@inventec.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=InventecCorp.onmicrosoft.com
 header.i=@InventecCorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-InventecCorp-onmicrosoft-com header.b=ROJSw+hn; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310102.outbound.protection.outlook.com [40.107.131.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dw2fn5Cz0z30KF
 for <openbmc@lists.ozlabs.org>; Wed, 10 Mar 2021 04:45:19 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fuL+iFac4RFe7yr+MnqY3J4sdn8iJ4rS0URRDDxdSbsXK9e9V6wsYxgI209Gro7PKr8kEIdQuOFYlA16uXE/VYI0W8Odbf5ha/44uo810fzrrwLUY/nEvQbga4PiZ8tEduneV1/MTGMm/YyASicQM6GFuMxkvJnUlrLx8o2PPyz6o9P+t04DjBdwQfRVHjGTLVxpWfS9XZHKjBq0DPaBsplU4/wAMdEl+deVwjroGqzvQvLrIAfbXUWws1wIqdQ301coNOiMu8k8dgDEjiFH+hSI3QV86ahMANQfw02Q8E2dNnJg+2kTYdJfwuInNff9+B8igT7cIgl+wdCy8Wzcpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Jj+vIXYRm4w0rr62RbYfrYelaORPPhPfpVaEy817kA=;
 b=odYRL/Yj/1baf2l8I/zKzPWtOqK+J4SqJMl42RLVjANYeOid2oN4si/6M6Iaw91FKnHYcwXw4kRhpah2NRRyBEhqT4wUDSd+RN4tz16vOndo04I9CyYafYKul3OK/bwmP72Eu9XCbX02z2RvqE1nN2B/Nnu0U//NFMSPAZCVGO8D16X+eUnaKlZXPMcqOrrsgf3xCWJXN6gQzzfB0JXoArFXz2ylAiPAIZF/16o7GbH98bnkRBTfez1uQ/zeqzelSuJ2DWAv6jI3XRLIKM+0gamMU7z4uSkhHgpQApaKbmZumTC903rfT3u5A4McmJg7nle+oeMNrDR5DHL5+LBdOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inventec.com; dmarc=pass action=none header.from=inventec.com;
 dkim=pass header.d=inventec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=InventecCorp.onmicrosoft.com; s=selector2-InventecCorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Jj+vIXYRm4w0rr62RbYfrYelaORPPhPfpVaEy817kA=;
 b=ROJSw+hnxSyJnILk40dgfF3Gltgktzc19rRsB0AttJ+ixd+qC/gmPIM1b6w5hiaOPdFoF2eK5d7AeqXgqJHvX/hmsdlJMhVGTkREr8tMNwRdEGplBlLiFxCnV6U/2lvR6mWfpsep2ZFOgXa+KTpxHBoswe5NJjroLemW2u+c4VU=
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com (2603:1096:4:59::20) by
 SG2PR02MB2397.apcprd02.prod.outlook.com (2603:1096:3:27::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26; Tue, 9 Mar 2021 17:43:12 +0000
Received: from SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::740c:c7c0:872f:1ccc]) by SG2PR02MB2796.apcprd02.prod.outlook.com
 ([fe80::740c:c7c0:872f:1ccc%7]) with mapi id 15.20.3912.030; Tue, 9 Mar 2021
 17:43:11 +0000
From: Udupa.Ashwini ISV <udupa.ashwini@inventec.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Redfish Event Service not working
Thread-Topic: Redfish Event Service not working
Thread-Index: AdcUwpQiVL+73feETgSuM3tmbHff2Q==
Date: Tue, 9 Mar 2021 17:43:11 +0000
Message-ID: <SG2PR02MB2796E924068DCCEE90ACD28585929@SG2PR02MB2796.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=inventec.com;
x-originating-ip: [24.6.83.119]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4d74770d-d3ff-43a3-faa0-08d8e322cf5c
x-ms-traffictypediagnostic: SG2PR02MB2397:
x-microsoft-antispam-prvs: <SG2PR02MB2397B94737A92890CA2F10E885929@SG2PR02MB2397.apcprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2BWnF3ekXTNFEP1ARQEwb09kAtj62oBHsqoJSRxGIQ3LL1YAZoreGcXzZsouBCKzRRBo05igVrx5IwcwygEUiZ3cEYUbsfowRh7spmhYai9XHJE01IA2ZXTmbq45XpMq+AmGwmuu6PBCRcSHkI1T/aqA/ft2lJmYfpBaU9FeiLooGGj349oKl9EZD8uJcmvzvJiEUzjtV0BtJ0AKfU8SsmokxGys0fFmSCLOawUxOk59Y/sXdbK+t6Oq5PbeO7ZcW+rnHMHv5pc8BOKKNBdP4ndhKvadIAzi8hYeRdJwCuZsdbe/0AttsA9Sjh+uMmzEC+CuMbJXnKuS9kCNx7UpyJf7w2XRtAHfOoTtp+ogbLP25nk/wspBbm1HLgNHyQm2+GMQyiFBSfYZOrf3xJrd//i7cYJUxMfa4Owl/1zBS+n/BuI4PHTgC/+TBKAeItgbRsdB2LejwonVsB3ymdWxvmE0rXsT6abfdtOqezj3Y/BWmT6LIZD33dlDETRT4HxB0mIDa1sVoa2AJdQ5HF4Cng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR02MB2796.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39850400004)(5660300002)(186003)(6916009)(8676002)(83380400001)(55016002)(8936002)(9686003)(99936003)(316002)(4744005)(52536014)(478600001)(26005)(9326002)(66616009)(2906002)(7696005)(66556008)(66446008)(71200400001)(66946007)(64756008)(66476007)(76116006)(33656002)(86362001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?arAzCaygY7CFC0N6r7FSRwzQ9DF/gCbGzSF54+t/UHnsFEB+IT3960h+Fvyf?=
 =?us-ascii?Q?PEEDk7Ftb5jXkmX0IujfHXX6pNyFNSkn5Qo19huhz0TjJCVgmUjeJGPhvNxT?=
 =?us-ascii?Q?/Zl1IsYz7qm3sV3iYapSnz0xmIXl4bcrHL844HXw+bMRbW0a/U1XYAUBq6/u?=
 =?us-ascii?Q?/0DfOEWxMvrzQb/IZkh0Hu5eQFKrU0sRKBfvI1vQrTUOEG66NwqamrNIQcaU?=
 =?us-ascii?Q?gdzmOEIYVkt6QXj/OeA0y1d3K/zyeVFCZ5RMRILWzHyAZGlV1VA+zCH/9WkL?=
 =?us-ascii?Q?WrvESfVUm6iGYlMO2AEpZTTCFbY/GBX8J0fNyj5tEwskeq20vvcPuZOBGd5G?=
 =?us-ascii?Q?qktLCgYO5J/N/U3v1nfD5PdQQ4Ch7XpIqZJmMiaUw8X0qRKgFtV8MODmXrmW?=
 =?us-ascii?Q?+lSEpbdlFSgRXfo79oeGUbXT6tt79jcGzPzAx4RzO9mpq0ymfasPRueIRIay?=
 =?us-ascii?Q?+VYBw415nhte0RB6d2UO815tfFss3U74bOFaRcH6CNQTmNb2Sa6z1zil1S7N?=
 =?us-ascii?Q?gCFtlmYIerbjleMicBTJ0B/T5PYAv5LgMTKxAC4tnpw0J+Dz8zmIDjYwpjYp?=
 =?us-ascii?Q?xpOkMRvbm4RDiqTDTo0F82VssmwTj6996V8C4MgvbZag1kITeXQlePcFXnhH?=
 =?us-ascii?Q?0YS4633ZrLfe5opDbEqnQHJj4Z3mkNQ+R/Pujwb1oVC0WPgtJ+FR6BeHE1+T?=
 =?us-ascii?Q?5NiTqCRSjqb/wz1ChMU01IPKSUKqR8gn/JdZEy6VIZnWXUC6ejmvWCNmIaqY?=
 =?us-ascii?Q?ANU+uT+n8z6VY5cr3vK/mAJitfa8obWVP2xMbz1E8rdpQHIa+o+bzo3iKWlk?=
 =?us-ascii?Q?uPhw9782l6/ZRRELpv0ZZe6dVspNXAb+EaWlznyysBE5aXN9WLS6IPwXhe5e?=
 =?us-ascii?Q?E4Tsyww46gsZlYzM2CBlXGNRlSIGogEsQKIPmsyGU3DAkkFfnWsx0SqAnmI7?=
 =?us-ascii?Q?hhJ79wix0B/z8KIT4gx/k6HO+HyROgNu5fL2VxigWqEF8GDFWyItSfJc615X?=
 =?us-ascii?Q?V64Y693g/wQgOIlkN4d1uZKiiYmawmPG5QGdpEM53l2KYnIN1DvpzX15MUSu?=
 =?us-ascii?Q?qAWj8p/0U3E1HmRIjaA1tGUyeW0s3HQ7FN65L7DeXUYp1TLYESYwEm2lFKLG?=
 =?us-ascii?Q?QdjFNx1gXJtVDhyXXzwi+4xciZXbv3KdY/pOSg/RjGi2sLhC4LOFIZuytH4k?=
 =?us-ascii?Q?rQ90aIYn6S0CcMG5nYJtuXRuQlE2KQMOhcGAX2ebV1hDEC++GHFVsd8NAgCC?=
 =?us-ascii?Q?F4VRPsN2XFnCEV2gtGJmj5HSdYltPcl3PtfD1FmOSbUaKdl1rN8MWrmm+8L6?=
 =?us-ascii?Q?ccY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_004_SG2PR02MB2796E924068DCCEE90ACD28585929SG2PR02MB2796apcp_"
MIME-Version: 1.0
X-OriginatorOrg: inventec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR02MB2796.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d74770d-d3ff-43a3-faa0-08d8e322cf5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2021 17:43:11.7171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2ae41f0c-acca-40f1-9c63-49475ff38512
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sTxDBw+jrNJYirwQtCCRascGFjjAtKCrCAhhhheAsDgKXjOp46FNxuU9fzuBhurwBCzk10BzhWPfjaSe6UCF+mYVxQ3J4jO4KGsn+QwneGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB2397
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

--_004_SG2PR02MB2796E924068DCCEE90ACD28585929SG2PR02MB2796apcp_
Content-Type: multipart/alternative;
	boundary="_000_SG2PR02MB2796E924068DCCEE90ACD28585929SG2PR02MB2796apcp_"

--_000_SG2PR02MB2796E924068DCCEE90ACD28585929SG2PR02MB2796apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
I am trying to test redfish event service in OpenBmc.
I am running the Redfish Event Listener with config.ini as attached. I am t=
rying with http connection.

I have "-Dinsecure-push-style-notification=3Denabled" in my bmcweb_%.bbappe=
nd to have http push style notification enabled.
But, I don't see event logs in the console of my Redfish event listener. I =
also don't see Events_.txt.
If I send test event through redfish, I see the event in my listener.

Can you please let me know what's wrong in my config.ini?
What kind of logs are captured in event listener? Do all redfish systems ev=
ent log entries ( /redfish/v1/Systems/system/LogServices/EventLog/Entries) =
are seen?

Regards,
Ashwini


--_000_SG2PR02MB2796E924068DCCEE90ACD28585929SG2PR02MB2796apcp_
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
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
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
<p class=3D"MsoNormal">I am trying to test redfish event service in OpenBmc=
.<o:p></o:p></p>
<p class=3D"MsoNormal">I am running the Redfish Event Listener with config.=
ini as attached. I am trying with http connection.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have &#8220;-Dinsecure-push-style-notification=3De=
nabled&quot; in my bmcweb_%.bbappend to have http push style notification e=
nabled.<o:p></o:p></p>
<p class=3D"MsoNormal">But, I don&#8217;t see event logs in the console of =
my Redfish event listener. I also don&#8217;t see Events_.txt.<o:p></o:p></=
p>
<p class=3D"MsoNormal">If I send test event through redfish, I see the even=
t in my listener.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can you please let me know what&#8217;s wrong in my =
config.ini?<o:p></o:p></p>
<p class=3D"MsoNormal">What kind of logs are captured in event listener? Do=
 all redfish systems event log entries ( /redfish/v1/Systems/system/LogServ=
ices/EventLog/Entries) are seen?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Ashwini<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SG2PR02MB2796E924068DCCEE90ACD28585929SG2PR02MB2796apcp_--

--_004_SG2PR02MB2796E924068DCCEE90ACD28585929SG2PR02MB2796apcp_
Content-Type: application/octet-stream; name="config.ini"
Content-Description: config.ini
Content-Disposition: attachment; filename="config.ini"; size=540;
	creation-date="Tue, 09 Mar 2021 08:52:21 GMT";
	modification-date="Tue, 09 Mar 2021 08:51:44 GMT"
Content-Transfer-Encoding: base64

W0luZm9ybWF0aW9uXQ0KVXBkYXRlZCA9IEFwcmlsIDI0LCAyMDE3DQpEZXNjcmlwdGlvbiA9IFJl
ZGZpc2ggRXZlbnQgTGlzdGVuZXIgVG9vbA0KDQpbU3lzdGVtSW5mb3JtYXRpb25dDQpMaXN0ZW5l
cklQID0gMC4wLjAuMA0KTGlzdGVuZXJQb3J0ID0gODANClVzZVNTTCA9IG9mZg0KDQpbQ2VydGlm
aWNhdGVEZXRhaWxzXQ0KY2VydGZpbGUgPSBjZXJ0LnBlbQ0Ka2V5ZmlsZSA9IHNlcnZlci5rZXkN
Cg0KW1N1YnNjaXB0aW9uRGV0YWlsc10NCkRlc3RpbmF0aW9uID0gaHR0cDovLzEwLjQxLjguMTYw
OjgwL2hvbWUvYXNod2luaS9yZWRmaXNoLw0KI0V2ZW50VHlwZXMgPSBBbGVydA0KQ29udGV4dCA9
IFB1YmxpYw0KUHJvdG9jb2wgPSBSZWRmaXNoDQpTdWJzY3JpcHRpb25VUkkgPSAvcmVkZmlzaC92
MS9FdmVudFNlcnZpY2UvU3Vic2NyaXB0aW9ucw0KDQpbU2VydmVySW5mb3JtYXRpb25dDQpTZXJ2
ZXJJUHMgPSBodHRwczovLzEwLjQxLjguMzENClVzZXJOYW1lcyA9IHJvb3QNClBhc3N3b3JkcyA9
IDBwZW5CbWMNCmNlcnRjaGVjayA9IG9mZg0K

--_004_SG2PR02MB2796E924068DCCEE90ACD28585929SG2PR02MB2796apcp_--
