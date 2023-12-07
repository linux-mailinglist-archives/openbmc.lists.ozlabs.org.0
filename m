Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F9808B8C
	for <lists+openbmc@lfdr.de>; Thu,  7 Dec 2023 16:14:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B7HO6ptI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmHqR3WBSz3vvt
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 02:14:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B7HO6ptI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gkeishin@in.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmHps5CX2z3dXX
	for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2023 02:13:41 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B7Es1XC006836
	for <openbmc@lists.ozlabs.org>; Thu, 7 Dec 2023 15:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 mime-version; s=pp1; bh=PEiemVSF5E7Khge3Z2cW4sxOVukAnODcgTvTseSeiv0=;
 b=B7HO6ptIk7kCc1kAD+hA+TsOuakxbXkw8ZRtbqb6z9Clq16+Q/5WNTjguJwxZfn3JJv2
 BcqTz1BvO5agD0yAgoOKPOTi5CQwTsI9DM8DytDN5B5DlX5fd6qtR6EM+nVZ4/NCRupX
 0vqsUsREYgA6nu1Fi4BLp6gS/ZDNAcuy9LuE5UyG4aGlw/8dlXJsRfKCtj0VDNEfEW8n
 aYaGpR+C7tuV0kp+yawkOTAEbGa4yysMQo9IV/x7kDp1yy3Stvp006T0rLe+0/4XMfSe
 46BDYSkOzNPgdmewgJcMrgG/JWc2XQmofyG/BSjCa/ejVcSahqA+5Vcs4bETgjLLcwNl ew== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uuexn2wxr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2023 15:13:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4VlzRpr+b+5GH7jCCUM2U+0VYhrI+2v6K4GuOCC/zwta8ge/kHYywAW7yBz9lNpB+b+rJmbUD4BcjFJozdUhA2lBzbILItte5XQa8AxMq7iLpAJ0BoHSeYpA+KO09ph2L0L6p+e5DRyWcdUhVnHznwojTnZ1pgX180BsMK5+BF/542+/HrICLBzBpNgqfG59UnAY107CDwH8q3XkPFGWAar5T/oDmtGlZNZ/jUiKib0p3tU13KJfizIDfgiaJAP8yc4TQP3HDiWJ7zxSFy0yNE4wHhYuT3d6HeUZ2+XH9qb9RZdY5D7yz72NhMJBenuvPI/69wTvHjfNisrvhy7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEiemVSF5E7Khge3Z2cW4sxOVukAnODcgTvTseSeiv0=;
 b=jgX16NBcMhad88xxDfrmAX+LnFslJIsx6BqAAISPqHOMtCuGmJldfC8xY1CH6LxU5G5pYBlTRYXn83L+ISGqeSH+rUPf4KVO44lRtNoaI8HVX9H722cNfDRGU5tP/yJL9+99wcgyg9ZIBsOc3+myWefMAEbnDsyIVHQ3WO5URKg5/WvZIP4Bqlue+WrZvK2/qBlpOsrdNv3fvfIyVYrjmXrrI8KHY4EkhmJuWOJgHt7w8ECHDtgxD+ByfKy+4csJlTqBQoauhUhVrkpLYSr6DfOQTorp9YOlEQOlxhYjpE7PuN9+jOV33xlR+L5nk908aYlVpq8wugl6nZ9ZUd0mpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.ibm.com; dmarc=pass action=none header.from=in.ibm.com;
 dkim=pass header.d=in.ibm.com; arc=none
Received: from DM4PR15MB6256.namprd15.prod.outlook.com (2603:10b6:8:189::16)
 by SN7PR15MB6086.namprd15.prod.outlook.com (2603:10b6:806:2ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 15:13:36 +0000
Received: from DM4PR15MB6256.namprd15.prod.outlook.com
 ([fe80::6394:de08:c607:34c]) by DM4PR15MB6256.namprd15.prod.outlook.com
 ([fe80::6394:de08:c607:34c%7]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 15:13:36 +0000
From: GEORGE KEISHING <gkeishin@in.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: OpenBmc Test Repository:  Legacy REST support sunset Year end
Thread-Topic: OpenBmc Test Repository:  Legacy REST support sunset Year end
Thread-Index: AdniJVZAnGe+48ApQ3yqVRGUGUfHMxG936dg
Date: Thu, 7 Dec 2023 15:13:35 +0000
Message-ID:  <DM4PR15MB62561A7561E6085EECD801B8E68BA@DM4PR15MB6256.namprd15.prod.outlook.com>
References:  <DM6PR15MB3676185D31E6DA488FA02ED5E6EDA@DM6PR15MB3676.namprd15.prod.outlook.com>
In-Reply-To:  <DM6PR15MB3676185D31E6DA488FA02ED5E6EDA@DM6PR15MB3676.namprd15.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR15MB6256:EE_|SN7PR15MB6086:EE_
x-ms-office365-filtering-correlation-id: 9bf2e985-dd6d-45dc-9b1d-08dbf737158e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  D8joozQRRnzPGssQevRomL/kJqx0v4RUtyXHuwVZMnj6nQsyjFjGGu1UTBpVBQ5cUo9GHvWa74f6RiBvqBT7/+KTBn+wnAR9fTjAuLmRIl0oo3PEt1Qm28jlb4YkYondrKjLlsblvgFM8wG/7gAv+zSS+ZyEmCXh3p8XwJP/EejeeGPuYBDAHkPYL14FL0YqrpZMA94xUuTjtk1QgUUf5YIghB2Z62rSDjOOlynC7cR0gWtfd8jScZXbmutAiLO+5xrU1SQrR25jpYWGqgc6q9qLA6TZYYMmlURt+SorlypoOwaPyYGi8JyItnxmSm6ARRo24Gce37yU1VvEajZUWysriZaDtXm3duqKGwfevYUcQBAmA1WEn12XzLVyYiA4D2NQU+h4mSM2RX0/VP20acmT3f5x8Kmc9tl0OMuQPhCse33AJohTYd6uZ9s8anSFVBVEE3xJ1ThRv9yTf7k5JxNngkZ3eNapG3zbsOfHYwryv5GCPBX2+Q2ooRX0iCoRqJSr/do8Mb1IPCa6216V150Qswo5jAoxZ6uBkQSebVGEGfA1tm0JL3rUpaCo4BfM4WkaSYN2gz5wd5aczT2VyozocldlYH4YfF8o0XDSsDc=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR15MB6256.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(71200400001)(26005)(9686003)(478600001)(7696005)(55236004)(6506007)(83380400001)(5660300002)(76116006)(8936002)(53546011)(41300700001)(966005)(66946007)(66556008)(316002)(66476007)(66446008)(8676002)(52536014)(6916009)(2906002)(64756008)(38070700009)(122000001)(166002)(38100700002)(86362001)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?d7fcKquuMdQ5phPJS83KybCqMBIipMMiyPZuzn1DKtg3gSMGyW+zv+vKOQRf?=
 =?us-ascii?Q?Bg+u0fdlQJNgMeAuwaUWRUbu4ua+qINQCZjiUt16Xgl4qRgZMKzlhYRhCIzR?=
 =?us-ascii?Q?HITVnR2EnRtgL9lRIIfbxmUO3xFlAcVhRw7LWuMe9/yvf28NbrlmWsjNs8y7?=
 =?us-ascii?Q?UrpUNU/rdet6gJIDVbuqiDGSiGo3TnAplBpYJWmVjF5qS90wNW0C5uAplQPC?=
 =?us-ascii?Q?BpM/Lz5840u+nGF0QhKoEPsctuHtQeqQfIkgpLcdXv2jLz1LhbQ+cD+M5H1k?=
 =?us-ascii?Q?5rMBatEQgApkQfM5xQ8PsozRoHV+28x1yuDJac02AOGsUIvc1YICjjOIgDzz?=
 =?us-ascii?Q?M/mZVq7fT9pGjS/t5Jg+vy9/4LsC50+w97eyuFVAIZODH4YvgGjvHracdWHh?=
 =?us-ascii?Q?NNYWT/38CYlpFTE1ow+hjb6cFJDbuEiSpJoVNR+dnzxNDG7ccuKVce05Arbs?=
 =?us-ascii?Q?mh0QDYiafFAhioqKO+kA3lFUT+E3Cv/atyRDYtcFN9Kaf2irzzIevBF1Ptbu?=
 =?us-ascii?Q?KfZgrWAWB/hdHauRI7+bgzJ3iaMVxXWXZux/cdFRDi2BjzojZcXkf1RxBzvm?=
 =?us-ascii?Q?Ep/mrc4CIpdckaOeMAEANlhRNFMOTJGLsPuilG1AzhD3L/veJk1n8kYtp0Oo?=
 =?us-ascii?Q?v5edCbTIB6irpG648JM3lQUZsZLM+Pgu9MMzHrvHl8nOTqf3QKFFdA2l8Bg1?=
 =?us-ascii?Q?+W+D5kLRUXR5LtPWjXIeY07RRY1jTTwF5zLVGG3CEz8W/SQSgUAp4tqCCxwO?=
 =?us-ascii?Q?sMUfxjGqKcUtXP+QxcUvVHnDXuqN8ygh8KtVKiI2yTDROkUr6tcyhHuXYRA/?=
 =?us-ascii?Q?Yzmba0Sdf1sKiBBoz8CZXayD2b7LuS6xTdV85RrwO5ycOAF4NJFyhWKPpLMt?=
 =?us-ascii?Q?5NPV853934Zyok66k5XEjLueW35mR2AMN+zGLzC3v5ij3YbOz593NwJyqSrz?=
 =?us-ascii?Q?BaUUsyHXt+7MaN1ffiOFZdZAaAXg1NJXeC2WNTBO+ydhlNWMOJmZzp+7N/70?=
 =?us-ascii?Q?Iu4p+BxRXQvuue3Ae4OrvU2KvGdhlR966IO1rbp2EyRl95YJ6T1jbgJt1/nD?=
 =?us-ascii?Q?/ioSwQZiUjPU6eq3T3AwUUF06KkCn/MuwDQLatU5d9J/lQxelXelEq8l4Y1d?=
 =?us-ascii?Q?wM2U/DlXogRF8fXeaixHSH9LrgBMTu6/ZFTFhiMLS/xQ/irBHfmMR4Xy3Hz0?=
 =?us-ascii?Q?XUP0l5pcc143C0FJeHOgSxMgFW5DCqIcWojVVa6XVq6GAtg21DXkQiw0rpsB?=
 =?us-ascii?Q?CTtK/paJAIm3S06Nd566JXyYJgHGsO7EtTj2VVnwEydzwZyJLp7ZlnZaSU1G?=
 =?us-ascii?Q?SkenvfcfTaNMZzVLyKUgvgNby05kZCWU9So7XJWFm3IPI8iXOWlLqt9Ho/kB?=
 =?us-ascii?Q?EBSF0vMGvOAlQnYOBGJJisPFy0c9VuOuxvbXEIXWpSvIWPo0yLrai4JUuAfx?=
 =?us-ascii?Q?/EiG7vcSrsUC+gYQMi5wwReNmBvV1KF1z6NSEWvAc1cf45HfqvODxOly0kGq?=
 =?us-ascii?Q?hOHHdwLnKr5MU2RMceo0/V5E5GCPANNTSWlfnatZl4IqIIbakHrKYP8dh3GE?=
 =?us-ascii?Q?TV5g9YWNlqmD3bMt7PCbtz3vb7aXHui3GP6yXyWD?=
Content-Type: multipart/alternative;
	boundary="_000_DM4PR15MB62561A7561E6085EECD801B8E68BADM4PR15MB6256namp_"
X-OriginatorOrg: in.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR15MB6256.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bf2e985-dd6d-45dc-9b1d-08dbf737158e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 15:13:35.9838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GG++2m3N5pOSJnb1RzqXHWYaJYg9/3TSfNrdYSha5+tu0OAByeAfcpby+yT0YDnTNkau37l/buDUPsytMUPdbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR15MB6086
X-Proofpoint-GUID: kxooYv49VsT105zU8DuKO3Qm2YcprHw9
X-Proofpoint-ORIG-GUID: kxooYv49VsT105zU8DuKO3Qm2YcprHw9
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-07_12,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312070125
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

--_000_DM4PR15MB62561A7561E6085EECD801B8E68BADM4PR15MB6256namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Greetings,

As planned, new branch created https://github.com/openbmc/openbmc-test-auto=
mation/tree/v4.0-stable

Release Note:
https://github.com/openbmc/openbmc-test-automation/releases/tag/v4.0-stable

As communicated earlier, the expected changes on latest master will follow =
starting next year but in phases gracefully.
- Remove tools and codes supports which are no longer relevant (refer above=
 release note if you still need it )
- Update/revisit documentation README and other information as part of the =
activity to maintain the relevant data
- Consolidation / Grouping of test suites/files to minimize clutter test di=
rectories across the repository
- Disable Legacy Rest and default to Redfish ONLY and remove flows which we=
 had to support both in code
- Continue to update codes are per new changes in Robot and Python version =
available.

For more information you can reach us out on OpenBMC discord https://discor=
d.gg/8rvZJQbE      #test-automation (https://discord.gg/4G3vd5rP )

Regards
George Keishing

From: GEORGE KEISHING
Sent: Friday, September 8, 2023 1:15 PM
To: openbmc@lists.ozlabs.org
Subject: OpenBmc Test Repository: Legacy REST support sunset Year end

Hi All,

               We are deprecating legacy REST test codes and to discontinue=
 tools used in OpenBMC test this year end. We will branch out as a checkpoi=
nt if any users still want to use it in their environment.

               Post we branch out; we will start scrubbing off test code an=
d some significant changes in the test layout and consolidate overall the t=
est repository.

               Thank you for your support, feedbacks, and contribution to t=
he test.

Regards
George Keishing


--_000_DM4PR15MB62561A7561E6085EECD801B8E68BADM4PR15MB6256namp_
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
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:691883831;
	mso-list-type:hybrid;
	mso-list-template-ids:1516514520 -882085480 1074331651 1074331653 10743316=
49 1074331651 1074331653 1074331649 1074331651 1074331653;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:54.0pt;
	text-indent:-18.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:90.0pt;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:126.0pt;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:162.0pt;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:198.0pt;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:234.0pt;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:270.0pt;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:306.0pt;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	margin-left:342.0pt;
	text-indent:-18.0pt;
	font-family:Wingdings;}
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
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Greetings,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As planned, new branch created <a href=3D"https://gi=
thub.com/openbmc/openbmc-test-automation/tree/v4.0-stable">
https://github.com/openbmc/openbmc-test-automation/tree/v4.0-stable</a><o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b>Release Note:</b><o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:36.0pt"><i><a href=3D"https://g=
ithub.com/openbmc/openbmc-test-automation/releases/tag/v4.0-stable">https:/=
/github.com/openbmc/openbmc-test-automation/releases/tag/v4.0-stable</a><o:=
p></o:p></i></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As communicated earlier, the expected changes on lat=
est master will follow starting next year but in phases gracefully.<o:p></o=
:p></p>
<p class=3D"MsoNormal">- Remove tools and codes supports which are no longe=
r relevant (refer above release note if you still need it )<o:p></o:p></p>
<p class=3D"MsoNormal">- Update/revisit documentation README and other info=
rmation as part of the activity to maintain the relevant data<o:p></o:p></p=
>
<p class=3D"MsoNormal">- Consolidation / Grouping of test suites/files to m=
inimize clutter test directories across the repository<o:p></o:p></p>
<p class=3D"MsoNormal">- Disable Legacy Rest and default to Redfish ONLY an=
d remove flows which we had to support both in code<o:p></o:p></p>
<p class=3D"MsoNormal">- Continue to update codes are per new changes in Ro=
bot and Python version available.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For more information you can reach us out on <b>Open=
BMC discord</b>
<a href=3D"https://discord.gg/8rvZJQbE">https://discord.gg/8rvZJQbE</a>&nbs=
p;&nbsp;&nbsp;&nbsp; &nbsp;<b>#test-automation</b> (<a href=3D"https://disc=
ord.gg/4G3vd5rP">https://discord.gg/4G3vd5rP</a> )<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards<o:p></o:p></p>
<p class=3D"MsoNormal">George Keishing<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"mso-ligatures:none;=
mso-fareast-language:EN-IN">From:</span></b><span lang=3D"EN-US" style=3D"m=
so-ligatures:none;mso-fareast-language:EN-IN"> GEORGE KEISHING
<br>
<b>Sent:</b> Friday, September 8, 2023 1:15 PM<br>
<b>To:</b> openbmc@lists.ozlabs.org<br>
<b>Subject:</b> OpenBmc Test Repository: Legacy REST support sunset Year en=
d<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; We are deprecating le=
gacy REST test codes and to discontinue tools used in OpenBMC test this yea=
r end. We will branch out as a checkpoint if any users still want to use it=
 in their environment.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Post we branch out; w=
e will start scrubbing off test code and some significant changes in the te=
st layout and consolidate overall the test repository.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thank you for your su=
pport, feedbacks, and contribution to the test. &nbsp;<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Regards<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">George Keishing<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_DM4PR15MB62561A7561E6085EECD801B8E68BADM4PR15MB6256namp_--
