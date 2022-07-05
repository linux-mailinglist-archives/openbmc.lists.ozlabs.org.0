Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE972567AAB
	for <lists+openbmc@lfdr.de>; Wed,  6 Jul 2022 01:28:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LczPk44c2z3byW
	for <lists+openbmc@lfdr.de>; Wed,  6 Jul 2022 09:28:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oegjF+fM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_mkurapat@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oegjF+fM;
	dkim-atps=neutral
X-Greylist: delayed 710 seconds by postgrey-1.36 at boromir; Wed, 06 Jul 2022 09:28:00 AEST
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LczPD25hDz2ywN
	for <openbmc@lists.ozlabs.org>; Wed,  6 Jul 2022 09:27:59 +1000 (AEST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265NG7X8031271
	for <openbmc@lists.ozlabs.org>; Tue, 5 Jul 2022 23:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : content-type : mime-version; s=qcppdkim1;
 bh=itWlKauUacZMBV64R2ifk5WGnpsOu06qzxwASwpFPCQ=;
 b=oegjF+fMa6yOawl65Dfr4XYzGYFj7Bnd4nYeLnAZv+FV/AhEvv5mr3pp6esX5s/ZKM+/
 clVQBhfT5Zw80Vvood94WAW1kSPG0SCcigDh1PopS4qVJIyl1muU1pakbbqe6ZdN1TrA
 mLYHKeSdcEXf1uHyv3+pNI4fukFpy3L4C1ojPdSxhTsE4QaOilEtpXWlCbWmapOaFODi
 ZhVDT9M4uM4CHktYTUX2GHzdqQtQGrOzq1CfoT150hmKrKoSOMjUZS3f3fNhln98LhBA
 asSmdMFxTVo9cFxgFYgaqMCme7Sg5DUaotcDgGGGh+quTY++Mlyj4EdgwPZWWfg6xEpv 9w== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3h4ucpg39k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 05 Jul 2022 23:16:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8N0fhCbdCRsosvzboqts//m3ytpVVrytiQ4ib2q2SjL3YX63/xdOywjixq6AwNaSNtbz1lO9A5/nr+gUaRxbJEvVnZxUIBD798RagdPg5ZBn1SXRiI9SI20Ebf+Uyi6sea/1cyoLGkmcR2SD5hQ1zaD0kxJ7bbefzI2WM/yUoEJNUaPg/0XLUdd1rrT9stKiymIiyBE7/uB499T13b+JHqa1XOlf6w2pQiahgZ7Fkqg4hu+qvs5tzPgQa5iyfupyasCkjsGS+6iHGQ6Na+mmTQF9T2m/yigYicAEuhgmJx4ubxg31UxMmwcjaA5KQ1vobsCBmHUodrUZA8Ry5Cvbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itWlKauUacZMBV64R2ifk5WGnpsOu06qzxwASwpFPCQ=;
 b=nAleQe2Bx92J5N1rLYUnmj+vxwNFG5OAiG5+H2E+/u4PTrT8FF4LbcGm96R6cPA3p2RjYojAk/0BTeV+o8w8lb5B2SqtaIshPjMexy5j2RBkHHdpMXKQIpMPeztkY1p/815LftuifQquOl66IiA642kBwIV8BpTvLirqAR9NFh9bUnfqz5ksDyCrMPCxyNXfQKO7n4uhzbg7hz14u+dLe9Zdfh0y5XY2n2mb8ZJpMlLhQWcJF4iDP4sknlWuhRX8iuhWvIl43q5k/9EE7evy+YB9vSqWf4H4AS8QeycjmYE/4qcGWhpdfZ+N0YnPzQIMsTD44Wuu+4uLRCIX0w59xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from MN2PR02MB7104.namprd02.prod.outlook.com (2603:10b6:208:1f5::21)
 by DM5PR02MB3750.namprd02.prod.outlook.com (2603:10b6:4:af::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Tue, 5 Jul
 2022 23:16:02 +0000
Received: from MN2PR02MB7104.namprd02.prod.outlook.com
 ([fe80::81c8:b6d4:5180:d159]) by MN2PR02MB7104.namprd02.prod.outlook.com
 ([fe80::81c8:b6d4:5180:d159%2]) with mapi id 15.20.5395.022; Tue, 5 Jul 2022
 23:16:02 +0000
From: "Maheswara Kurapati (QUIC)" <quic_mkurapat@quicinc.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Add phosphor-fan configuration for the fan which added by dbus-sensor
Thread-Topic: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
Thread-Index: AdiQw7jTlyZgLp5ISCuvfelYhA3WzQ==
Date: Tue, 5 Jul 2022 23:16:02 +0000
Message-ID:  <MN2PR02MB71041CCCF98E562120942620F7819@MN2PR02MB7104.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a9ef247-0bd4-4f35-99d5-08da5edc5458
x-ms-traffictypediagnostic: DM5PR02MB3750:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  QR9Y4V9a0nW7zZmAOUHOXcfOfFoBDatrGV4rm/lD9i5b9zGBqF6LJ8IDR6OEiBSbWx3g963HzSuoXJFKqycIBGZnTQVQQyQIyQ+tDjdVhhVxak1USFQz62Ltfaxr/KSpQ90S7Wl/uZ5BGTdAivJOI5yzzCU9ml3z7EUgklqVbKyr6QN2ugtNsGMMAl4CM4l63qbuihhVmeieZw2brn1B79SUATZAk+Rs6IICLL5xEm4pJ4AuBByPGJcZXMdyqZ69jw6t6WUnh1a657qatEWfcd70Y/wAQJGv6GQTrfzpYI3YLyURPUUoOQx1iAhnF+awSD6mEEXZ4ZKgkr1DB4nCRgXaOw1BnnwNeHOPCACpeGaobV11BJ/Y6pH2Km7+rp7y9TROIsKguxx3h9VZIBeYIPk5hEhk0Rmbsf5XIa5YynQDlympUcZUq1Vr1VQ3fpmj7DkfJvjYHzY23GMuEgfwR4py09qbGeOhjs6bCGs96Myi5IjpuWVp6ltzcYcdhgVLP+d9QiijqUa2yzBcLsaxk8o27KaPf97c7Y4/cZNuoB85o/8caiZKrqmIFk9jOFjOsvR5E6bdnZsE7TsNtJ98C/IxfADNuASQrxnaYlUXABwOU3ue+V9SEBpo4JdnziWqQMRA81LclP7ynAd27qJ5aA7kSwY+0fnv5A1UMuiIeodqwX27rvUvLx1wbsrkmjs5H/YfHVwTwuvxVgKB4MlO9t9HRgY+/3poCxksEj3py32z9UuYeIh8pufbRPsLPHpzKPJfi7mCIomQPSIKshkDQ4vi84wH+yWepOtTtInrsfbY1M3FK/FmCKsFU+qkYqC9BaisW+8S7bzqa9DkGUEFlA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR02MB7104.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(7696005)(6506007)(186003)(166002)(2906002)(38100700002)(41300700001)(33656002)(9686003)(26005)(8936002)(8676002)(478600001)(64756008)(76116006)(66446008)(66946007)(66476007)(66556008)(966005)(71200400001)(316002)(86362001)(6916009)(21615005)(4744005)(52536014)(38070700005)(122000001)(5660300002)(55016003)(9326002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?0ZS7Ljrmm4I9Q12iz0lLbD8pvGsELzkOPMA4QF/sDM4ThLc/mAF/wD4+A75M?=
 =?us-ascii?Q?2CsRYtk+mciN9SOjx7hPNrrw0X33X0CoeTfvb7mRVK6+QtBQaMoIs8Ty7H+Q?=
 =?us-ascii?Q?54BWPdtqP2mJJ7eeLx9VOLLhplOPvGY70K8Pz3dwEofGL6UXGOKuGmwNOz/6?=
 =?us-ascii?Q?hLsAe5eCXqlHR/QVZi5tmsQk0BUwBFYNvz8WzJHX322e5NljJNTxaWQHfMS+?=
 =?us-ascii?Q?AczZzqz+kDd4ot1tf6FTETX3+KRIf0v97kbpRHecGIO5bfB5UoXlEBf8cTju?=
 =?us-ascii?Q?FDuvJ8ArBWXSN0Axln/D8/I4EU36/9LO/a3KOSSdIVfArFwEm8ZFwxIB97n1?=
 =?us-ascii?Q?H7res2vyOLPtYt6VM6fNieYTt2zD1ywKlCVf5XsvNK/298ru5b4pxoM5ZTe0?=
 =?us-ascii?Q?y0zZFiZLqCwtepwZ1khpvHqVPT/1Gbem/n23gyN+i9bYDj3NgpX2mfEui5gS?=
 =?us-ascii?Q?Hm5BUCIY5cBn5hwv/fGmuKUnVsXl4uOTz4qIkSQ82TOFxG1j8HMGHcepwYX5?=
 =?us-ascii?Q?1HnqJ/vb5PV298PJRqJfUtVPpABOCjhRP8oa2KC+GL95st7K0ScNT/rNuKvq?=
 =?us-ascii?Q?EdxoTvRm+y4ZfXSolckMFxMKVUyljE6mkz6KwZThq3wSnjE1eroW2B2+KyPm?=
 =?us-ascii?Q?WVyXGYmFD6rQdnvtACQdcHLtjZ+5DX50ZthCqpmmYBncgYPhgscvrtZ0Ywfu?=
 =?us-ascii?Q?YWaK+VklOBUcvKtbbsRsoUKK4/5S9vQVWvtSbye/WYKhjbKRU3F/2xlirZXJ?=
 =?us-ascii?Q?Xrn0rfjZ5+SURQJi69Bv4OxNJaNJMTiMxmPLAqpsmOdv5OjtgcqKSG1gwd3I?=
 =?us-ascii?Q?NksxMI6+tNo0FBWYT6yY9IUCjKEhvOja6D76eYHUpZBzT7nz43b63njcjVrv?=
 =?us-ascii?Q?YDpGQ3ACo/3rZ6o1UImTvAMUtHnq9UxH92B9vfMAglP0k7QkVXCABB1Pkdbl?=
 =?us-ascii?Q?DFib/iF3CJvAO2q7gu4d8cuW09l+xUpp3HVut/iMoarafIlph47ovVVHY9Qc?=
 =?us-ascii?Q?16XmucrElxdJQvX0aRdE2XWXFBZ23cY7UOjbmeR/gbeFTOzmavAZ9fcB1hWh?=
 =?us-ascii?Q?CXnYydA1Dhs4q3exjCZzDucEOFXAesre+Dt4WG75vQNQdzsLcNlpXryX+Rgc?=
 =?us-ascii?Q?Zy8sxGEzDXPmE64MIN0Asepj3RJVGN+doYdsjFcGpYz79rAhrBwg/4BKUdjj?=
 =?us-ascii?Q?USxd4hix45iX2ROCooXgL6J2uqBisj92M9syFqLqc3iti6sUr6iduxZfZx4Q?=
 =?us-ascii?Q?Nn7lVTKbdMqT7aaC4F8BGbi1dRCdxja+YWTw9Cru4mBcP+WluvFacAhARk4e?=
 =?us-ascii?Q?+YjslCcX4EQvAOVVboORAGxmT551RAB5TwXejjsND5PujT1Os0AfBi/q6J5x?=
 =?us-ascii?Q?TUNcG6YsF5R9gpPQhp7wHePCieY0Kk30fZuPzOJGiCo1hFCmxBLQtZi76wXJ?=
 =?us-ascii?Q?01b0zGRbn3RtYQ/JcYTecNHLbd6sF7+RYF07Nx5s4XtJCC2bOTGRr+n4v9KF?=
 =?us-ascii?Q?NlFNjuIye29202MzEltvMOJm0vz6xSrS06IdKrSB7Zkx8B5TOCF3sYVz+KDX?=
 =?us-ascii?Q?qgk4LqcfDatssepveZFiS2DkoLu3MZW8H8iD3WxW?=
Content-Type: multipart/alternative;
	boundary="_000_MN2PR02MB71041CCCF98E562120942620F7819MN2PR02MB7104namp_"
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB7104.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9ef247-0bd4-4f35-99d5-08da5edc5458
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 23:16:02.6786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7nJTMqVqsoPxdYTD5rrKc2bia24mLFTyR+A/PSrAk0JGYanVKIwdLIeKea5NiBxsQZdCsMbr48qoRX97lWQErW8XkPyI2dIJRpBeKY4NuGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3750
X-Proofpoint-GUID: BvhKg-OVVfMWwNnEX3e_6s9MJh8GtsyG
X-Proofpoint-ORIG-GUID: BvhKg-OVVfMWwNnEX3e_6s9MJh8GtsyG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-05_19,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=749
 clxscore=1011 priorityscore=1501 adultscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207050099
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

--_000_MN2PR02MB71041CCCF98E562120942620F7819MN2PR02MB7104namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I want to monitor a fan based on its tach which is controlled by the pwm.  =
Came across the below earlier discussion on this topic which suggested to a=
dd two more configuration parameters "target_path", and an optional "sensor=
_path".  I did not find this code in the latest phosphor-fan-presence.  Not=
 sure if different tag names are used for this purpose.  Can someone please=
 let me know?
https://lists.ozlabs.org/pipermail/openbmc/2021-May/026253.html

Thank you
Mahesh

--_000_MN2PR02MB71041CCCF98E562120942620F7819MN2PR02MB7104namp_
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
<p class=3D"MsoNormal">Hi, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I want to monitor a fan based on its tach which is c=
ontrolled by the pwm.&nbsp; Came across the below earlier discussion on thi=
s topic which suggested to add two more configuration parameters &#8220;tar=
get_path&#8221;, and an optional &#8220;sensor_path&#8221;.&nbsp; I
 did not find this code in the latest phosphor-fan-presence.&nbsp; Not sure=
 if different tag names are used for this purpose.&nbsp; Can someone please=
 let me know?<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://lists.ozlabs.org/pipermail/openbm=
c/2021-May/026253.html">https://lists.ozlabs.org/pipermail/openbmc/2021-May=
/026253.html</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you<o:p></o:p></p>
<p class=3D"MsoNormal">Mahesh<o:p></o:p></p>
</div>
</body>
</html>

--_000_MN2PR02MB71041CCCF98E562120942620F7819MN2PR02MB7104namp_--
