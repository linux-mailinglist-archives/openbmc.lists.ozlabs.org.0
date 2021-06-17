Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6A53ABD41
	for <lists+openbmc@lfdr.de>; Thu, 17 Jun 2021 22:02:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5XyX2M6Cz3bxV
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 06:02:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256 header.s=selector1 header.b=DCKOwqBF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.173.93;
 helo=mx0b-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=DCKOwqBF; 
 dkim-atps=neutral
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5Xy94s5kz2yXM
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jun 2021 06:01:52 +1000 (AEST)
Received: from pps.filterd (m0187216.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HJtT2X021605
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jun 2021 13:01:47 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by mx0b-003cac01.pphosted.com with ESMTP id 3974efbuac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jun 2021 13:01:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkOTKBbtgVh+jltScl8EJBQox8GzAwJsQuwDFDpQbrwmDFRhkYDOn5+1wsXzde+82wlq9nAVYRYzZ/fGuOazPzrsP8EFY4qauFtOeUUP0Vir/T2WbbYnOrIkWy+vBMcCy5Zgah/bgV8by51VMxX+xpHAGYavAqlt/nEpZJn1i7y+q9hBKeB3f0/kzhRGZ3oMzck4aS20GWT5Hov2Bed4hJmNxyDAqgKJyDgPmQPSzka++nxjd2QHGawOwW1tKLe3z0tie7mMD2ytfu9kvIRqJEzisfynK0oksOHl77f2236cralZdliApa419EmorfWrQJK39xr/bTYUvFB8xBDg/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiIdEfUY+fbl3CwZj35ycCKiSJYaPRvnjxHEW3iRUN0=;
 b=GhXa9MclXc4+Ja0mAubXC5tnkxhPnZbXgw8QmojLQkOBl7ahVzPPQtXuHgeaTVY0BbiDwFzc/q4/MhnbfExXB+T5bzB2Hlcg/N9wl+3cKRusohzmcOBhbZl9yXYhAwO+YPGGVDUCMEj7k4nJ5MFOgM7tjWl7ba/aeNc2VQCZ2T1XNj6Z9O4bCkfLm0L/S33kjSMb2eiylxgcIYQlNAtu3Psa2Zg1a9YllUXsrxUjNAfcl3CQphAsPEvPui6PRP6FRPYSOh3CpY0ub+Sg7r75brFcORJ/edEbmb7ZNBQJCUaerzCSiCg0++nGr072J97VzYpa7cJ0rPnZ/eAS4Qmwsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AiIdEfUY+fbl3CwZj35ycCKiSJYaPRvnjxHEW3iRUN0=;
 b=DCKOwqBFPD549FA7knuXj1Iw6ATgs0KNYYGSOW8c1FLxsppI7jjnELFlcG8WJOUEdd+zEXdonCZ/aabK/rk4a3/NO6Jev4+zRN0UmjkBeY3nnCyS/lx2CX+gL6ReBeXdEMwIsHAum42vJ655zUc4iRGNEoNhx91nfBf4e93AXe8=
Received: from SA1PR17MB4593.namprd17.prod.outlook.com (2603:10b6:806:190::21)
 by SA0PR17MB4128.namprd17.prod.outlook.com (2603:10b6:806:83::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 17 Jun
 2021 20:01:45 +0000
Received: from SA1PR17MB4593.namprd17.prod.outlook.com
 ([fe80::c5d2:afed:5e96:bc94]) by SA1PR17MB4593.namprd17.prod.outlook.com
 ([fe80::c5d2:afed:5e96:bc94%6]) with mapi id 15.20.4242.021; Thu, 17 Jun 2021
 20:01:45 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: phosphor-debug-collector
Thread-Topic: phosphor-debug-collector
Thread-Index: Addjsy0Lfm9muQg+QLCFEERCVonPLA==
Date: Thu, 17 Jun 2021 20:01:45 +0000
Message-ID: <SA1PR17MB4593CE5FBD4D52B203364917960E9@SA1PR17MB4593.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=keysight.com;
x-originating-ip: [64.157.241.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a749b81-c2cc-4358-1759-08d931cabc1a
x-ms-traffictypediagnostic: SA0PR17MB4128:
x-microsoft-antispam-prvs: <SA0PR17MB412862F5637941536D5B62E1960E9@SA0PR17MB4128.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fEyEIx4CpKzcTvBQiQcyVizwj3LtRXxDvH2VBm57UvYv8Z1azvvqVcWYevXOOy9NucwU9DM8Cl253gf5bHZ6/XoaOM47XITEeDCScJ8qpV/IOZOMQzN1uhAPukuw+vlO4YrtojR6BsHNS1OUPae7oB9EYlFH0BQtn3nq1f22m2b355DkaWXCpCPhi9/Hl50yeTg9+aFnOQb1KSx2xYh+ytwT3SYr8aEH+ddcvqX4S0by61ks7ivKsS8Gcdcn6GKCqffCG/YGCi9dQCtagseFK0JGqS8J1qCPZtmx8eQ7RsMrxjSOT39POzjbhyZLVoGcoq8/KJbCnKICX9NVf7v5Uq6R9pTCtL6NmnARjA9grql54cCRNgDmcOZ/d0MGOWJ1FR7zS+GVdwJHS3WwQEUMf87BxoaVz1wkxHfC6cSoNtZn8I5O5Nzo154y9bpafLrIzcDLw+fOd7ajPFJJyZYveBXPjLYJXntLDMCeuVg1wHo2Xk0THSW9P51Wkze4u2LA2ZxBzduuOyY7GdbmIm0xXc5Z0Pzd7b4A9g4bZ1dH/RlePqnK+uBTFx0dmtt837ISTOYCrHVpSGADVUqFLzQA3grm4MnLvtIIZCBpsiz2r5Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR17MB4593.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(7696005)(478600001)(86362001)(66446008)(6916009)(66556008)(8676002)(76116006)(44832011)(9686003)(55016002)(66476007)(64756008)(5660300002)(8936002)(316002)(52536014)(71200400001)(558084003)(6506007)(66946007)(186003)(3480700007)(26005)(38100700002)(9326002)(33656002)(122000001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Gg+NHI6hMMZMAJWxUOmJ7ojoPPD0BAZ+FKMgav2h5dHR+ore8zFcXrskl+0g?=
 =?us-ascii?Q?q5kiIMShA2eGlbbiodNXXoL6z4IOxTaZNcms5Mlcr/+H4NMfFrXeRTJz8HC4?=
 =?us-ascii?Q?cSCwkpgCqtTnnWAvGGN3FHD3Hf/WfHay1kiwgOjaUi0erczeND0qWQkAw6br?=
 =?us-ascii?Q?t59NmCbaowebRL2lstBrcEAS/zcGzWAm5OdDe2pWF/WtnbsnxqvRXvENdxMJ?=
 =?us-ascii?Q?l8LCMHa5sxVM8Snm5rfin6S2r5Yb44GHtANwY5gYIlk8jlPA+mdhX5bkWW34?=
 =?us-ascii?Q?niEVYX7ZUzMYEd+kPr+VMZxvCIlykBx56OmQ5LKiXMLv3JOlQ+4Os2bx+NkM?=
 =?us-ascii?Q?cjuDD06nWYDJ+QG+mOq4JLe7b1NgzImwJjyavkiJEpAHmybjVPP2B9CR+HK2?=
 =?us-ascii?Q?OJOMBNXrSNx/jF5c8Am1JVF24yPcCXuiX1pmN08BsKKkfvre6wI2YGh4EbYd?=
 =?us-ascii?Q?VRVxVGRkcEaQriJsfXeKBIE8hY1PSH08XSEj+6UvSUViPVszc7Of1jaN9jA5?=
 =?us-ascii?Q?/OGrhFwdQXDTmfil3oJfHeQirPlH9wk713/LEHZmOFo1prKRo0nSE+OxYLJU?=
 =?us-ascii?Q?sskoEUSmKo7erzJo+wHq58A6yilzCg+a5M6j3JvlbKPeURQWj6aUI//atEQH?=
 =?us-ascii?Q?1MrRThbXZDRDhPmc6Ws6iMK97n92uWRFR2q/zSjW6VZriPW3rUMF0yMvjcAM?=
 =?us-ascii?Q?sgZKzc4EvbcWtotpadncsDWXB+K3KeuDCuMM9iqs8srLE6YAX4rLc2Zwn/0q?=
 =?us-ascii?Q?95Yu+oZOdV6JGKnzKEmEswGaTdP56hTR/ycQI2khgu41HsOqDCFa7GYpb56m?=
 =?us-ascii?Q?FIdSnFU5zHkaWLEAf4BtlC0Ey2/nSw6bRMtXnhNmjuUFW8rVD8pVp7d43oC9?=
 =?us-ascii?Q?gtlNkqFNpFQk35ssMKLFja+/cDBB8HYXftC4VEV4rtO/meIEixA0yBtlnqcI?=
 =?us-ascii?Q?lIONY7XLe6XlitSzhfAOW2IhCE3+YMZdmZS5YWzE+PRmjlYOm11eAT/aWB4g?=
 =?us-ascii?Q?TRn3Vs+XtBFA9kkp63LF/kptGZR2Vf42em0qGijZ98OKoj46Tc/MIx7ateFD?=
 =?us-ascii?Q?F6HAcF3OkyHxne6pR6wtMfDvMttaKYLjY3OX6sqI6i47aAN2TlCR60vBW1Ne?=
 =?us-ascii?Q?93g+fxPWInhiUxMrBsR1yUhl4Ni76SrbkUpgeNMDr6gyxeRpF/eDbZUkipzF?=
 =?us-ascii?Q?nHu18++jWC23PnkXDvro69yluYAESEJqW2ab3vLgnK+hdAJCojuHebkABxsx?=
 =?us-ascii?Q?FuESwV1tpSdOxwg3r8l9sRfhtwWgdoMSRC/M6dLJDZpTcvT9hWgYJgE0kKAB?=
 =?us-ascii?Q?fGZFMnhMa3tFxOFR2GFW8rm9?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SA1PR17MB4593CE5FBD4D52B203364917960E9SA1PR17MB4593namp_"
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR17MB4593.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a749b81-c2cc-4358-1759-08d931cabc1a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 20:01:45.6974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GP92NM0XP1U+rkUAhF7E9SKYVi5kaUIctrChfihANks9DDgPhmdI6qrJu3FAzMowgIQuBNWut3thP2ztDb5McR6bTbvj7kRGAaU5/U9eLeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR17MB4128
X-Proofpoint-ORIG-GUID: wyg8opL4pCgZxMFVgXsUmn_uZfr0YK-F
X-Proofpoint-GUID: wyg8opL4pCgZxMFVgXsUmn_uZfr0YK-F
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_16:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=449 priorityscore=1501 mlxscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106170122
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

--_000_SA1PR17MB4593CE5FBD4D52B203364917960E9SA1PR17MB4593namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

How to use the services of phosphor-debug-collector? Readme says it can hel=
p retrieve the debug data for debugging.  How to collect this data/trigger =
the log collection?

Thank you,
Mahesh

--_000_SA1PR17MB4593CE5FBD4D52B203364917960E9SA1PR17MB4593namp_
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
<p class=3D"MsoNormal">Hello, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">How to use the services of phosphor-debug-collector?=
 Readme says it can help retrieve the debug data for debugging.&nbsp; How t=
o collect this data/trigger the log collection?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you, <br>
Mahesh<o:p></o:p></p>
</div>
</body>
</html>

--_000_SA1PR17MB4593CE5FBD4D52B203364917960E9SA1PR17MB4593namp_--
