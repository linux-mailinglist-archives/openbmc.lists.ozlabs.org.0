Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3722E9F9F
	for <lists+openbmc@lfdr.de>; Mon,  4 Jan 2021 22:42:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8pxt6cNJzDqSH
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 08:42:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.161.93;
 helo=mx0a-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=keysight.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=AKdleFFm; 
 dkim-atps=neutral
X-Greylist: delayed 1629 seconds by postgrey-1.36 at bilbo;
 Tue, 05 Jan 2021 08:41:38 AEDT
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com
 [205.220.161.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8pwy25sLzDqQk
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2021 08:41:36 +1100 (AEDT)
Received: from pps.filterd (m0187212.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 104L8K97031555
 for <openbmc@lists.ozlabs.org>; Mon, 4 Jan 2021 13:14:23 -0800
Authentication-Results: ppops.net;
 dkim=pass header.s=selector1 header.d=keysight.com
Received: from nam02-bl2-obe.outbound.protection.outlook.com
 (mail-bl2nam02lp2055.outbound.protection.outlook.com [104.47.38.55])
 by mx0b-003cac01.pphosted.com with ESMTP id 35tnqct64n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 04 Jan 2021 13:14:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GFl5jp8Nl/yZowQqcXD9v4CnptF5YtHgrGe6IMNdO8zzCbjzvjoZa+39XA0x24duM+UUQ5Bxn8jtUG2jHStM6gVOJgpWFfFm8MTKAf6AUz27qkj0Gh9SAWChTio9Mdbc0Me6PZwkcOG9Ta2Vr433sWUq3ie8sF8kVV2ORBqesKF+Xnk3lc7wkDpRe9nkU9iKDHcygUwjAULTAaJB43YbDOu22rPa+v6Ioof7YZqudW0gdruQdWp1aCwgD9FfDkSioBpXt0RCT5huKd4RS/LSbFNTNA4zi+i9xOCjSVaNeAiKOXVQKvkpPzn+03V2a0Xj0MWBnPEiP8za16/4nRs4RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3vz8I8sGheqneFax0Oq2cd47Umss6tIBcTD5F8kLqY=;
 b=kCKEFDlKp0kB4yuYJjthwCic0QzCDg7YgOWYPmSw9NLj2skH8dzegiBxuiJX1UKPKWG6y39ukdtBIokZuOoUPpESJEF3T9p2Wb+McW3czDhnggcup3U8DDEgLd0SJfku3ReSsIhLdFeXD8k0o1/pwy6zX7CmK9NAIk5wiEtTO9jF3ymmze3+Vs1VKAttqVk5WXcZA4GPDldEL1cSCcme3nCFo51M84RnKmx21K9FvRjvadEJepr4/VszzlXDyF9mdAjySvnNJ/5MHy865O3uWKIlcALO0sQojG3L6A0tHVkLnqDfbgQtFUqUi5MXvEkhF/+9C1V4lpNIFaOps8iqLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3vz8I8sGheqneFax0Oq2cd47Umss6tIBcTD5F8kLqY=;
 b=AKdleFFmbXF1+lExMAiLCxjGxZq+rs+sGHM+EEaXjkeYOxZ9TtbEwmqeaNoxw5heLIYIpV82o8s1jJBuyMdfyp9CGwWEPzYadZ9DmHGj2DgVRqrYRMPyCN3FGk5GY5TCoGwciT4AR9HwLwd9KF4Ic9t31Yy48Cj+pv9dt2+f89I=
Received: from SN6PR17MB2558.namprd17.prod.outlook.com (2603:10b6:805:db::20)
 by SA0PR17MB4524.namprd17.prod.outlook.com (2603:10b6:806:eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Mon, 4 Jan
 2021 21:14:20 +0000
Received: from SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::70d0:d9b3:e746:ab13]) by SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::70d0:d9b3:e746:ab13%6]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 21:14:20 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: add a new yaml interface definition
Thread-Topic: add a new yaml interface definition
Thread-Index: Adbi09Kn+0NMxZAyTvq9aP/32+RboQ==
Date: Mon, 4 Jan 2021 21:14:19 +0000
Message-ID: <SN6PR17MB255899EA5DB3A379ABEA68E996D20@SN6PR17MB2558.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=keysight.com;
x-originating-ip: [64.157.241.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 65fb8eca-cf07-41c7-7e3f-08d8b0f5b3b6
x-ms-traffictypediagnostic: SA0PR17MB4524:
x-microsoft-antispam-prvs: <SA0PR17MB4524736FB8C927789975B62596D20@SA0PR17MB4524.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3eyQEQY97PBxz017DvqUc/M32Q3i0ypsCU6wvFoUaapJTj9qGhi5pzsuFm9Mcz9LtIgMDQQxdyut0cOKqzhv4XbbxIBd90PZH1DKTXIr4nPGr1IdplZy+WugP/+ggRI1mqkW6PmFkqhVjZJV/iGzGn/jcokoQ/7wn3VzY3R8rGwtt6J3ZpatehwKdGZUHrCaq0/WthLO1hfFitkb200sIbNM+3fncaZyOPb9/zTCnMIVqlVkYlGx1ANyILcfzB2V/5f0e453K70V0aU87KRGf4bdvOUMuZMfylBDwsj2ijZGGzp2WxJvIbJoCCVymTGZdYgLfeckvzdjHP6uxp1chbRdTXoXTBLurKo5RpMATLSNaoIa8JJHAlMCUXSbpFB5KCnXcydnDZYsUFLeezCvWOqChE0uQmhnc+tPEgHyu3BOqLV8cGLx9yT2K+VSMO9cPEt2c3BOz6iuVy42D2bGQQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR17MB2558.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(366004)(346002)(52536014)(166002)(44832011)(8936002)(7696005)(6506007)(186003)(26005)(33656002)(2906002)(9326002)(55016002)(9686003)(316002)(5660300002)(71200400001)(478600001)(4744005)(66446008)(64756008)(66556008)(66476007)(66946007)(76116006)(8676002)(6916009)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?9tbJMVVJbHGYTLQ4fa4RUq1Yx6tFviOsyhom3SMAj6AF1LIpMJqXgqw0I+r8?=
 =?us-ascii?Q?o0GFPu7X7ANVWKhFCcZCAIANfbeVlJyfjXbJbhD/my0ayLfBVTGlNszYASyA?=
 =?us-ascii?Q?AXtLkJ66+7O6WrWjtqRjzE7GLiIn8d/nJ4uMhkVuONjMKHe0gdgjRlgxC4z4?=
 =?us-ascii?Q?RcqZ/xgAXvOi66Iu6oPIlPjZXAD8LFtK0bpytSfNheo/TpoYt382OY+4DF0Y?=
 =?us-ascii?Q?MYgEi7OY8RsMk27G749JYDefJt3lZrcT9LWOJeoAdkP0e+4URN2+rfhQL6E4?=
 =?us-ascii?Q?Wk7kYxVVS9bv22TN8WtuXXqYalkI0S7xefxcCFpF5CSVeE0pj1hPQdL69AGN?=
 =?us-ascii?Q?QSszmYAHFjZ/sqQvCsAXewfpS8WPwe6D9UaK8kXJyNeT5P/mwX3b5q5a5lUy?=
 =?us-ascii?Q?jf3ghXxP6GDv506qnnk6U5C19kbcAHShicJRnjFDBvZGW606GR0qHFqqpfIv?=
 =?us-ascii?Q?VZ8V449bqdP4fVsfz9f01861TObBdHFiTINcwFB0o1W+QsVpj/PPAkhbsvO5?=
 =?us-ascii?Q?MCm2/A3shci92nlhjxG8HS87iNJ/TvOyZLs8K2GDeOjMra6A1kBNSlLnAotW?=
 =?us-ascii?Q?QSlbwfUgAyWQ4brkCKbgOJ92w5cg7YS0lIpKhMPz8Ld7oJdhfKJHkGrJiekX?=
 =?us-ascii?Q?RxP8hcRYPcIf8tb0wkOg1UEw0DsEPIlWpQxPSEOJxfxriZtdxD0nnCVoOiDe?=
 =?us-ascii?Q?IzganktK0rXzOeG9fwDmyrIyTeQCUls8mtiZXFMcDB+FuAEkfuvik69SXFe1?=
 =?us-ascii?Q?ChNXGC01h08kvgGYMlqIWCAZdfLCaoQU0Qis4/dHne5eHxLYV4MhzSoOV2y2?=
 =?us-ascii?Q?L4dNGrW8VuOhZXgFCBWc6dR4/Ngr1yBYdMuU4pRtWmOt/hYnp3dO/cTDMcgP?=
 =?us-ascii?Q?jbFPq7KP6DlHIsuptU8ugpZtkIC2eQopzcIIMatNun7KDfyyzyIQ+VAY5apt?=
 =?us-ascii?Q?x6pwIKdR45+5MyIM1asewka3ZW5DzmZl+rHWSmIHuDE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SN6PR17MB255899EA5DB3A379ABEA68E996D20SN6PR17MB2558namp_"
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR17MB2558.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65fb8eca-cf07-41c7-7e3f-08d8b0f5b3b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2021 21:14:20.0203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xMz+GauCTlrKeTU1wLwYoTJPi7HeVikHfvAhzRcsYXuVTOXvCj0nSFGoZrA4NEM+JDGW2vTW5CJ9kNMPgdABDWSaVWPdL5LiAj2pyzJ42lQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR17MB4524
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_12:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 mlxlogscore=687 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040129
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

--_000_SN6PR17MB255899EA5DB3A379ABEA68E996D20SN6PR17MB2558namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Thank you for the video on the phosphor-dbus-interfaces<https://github.com/=
openbmc/phosphor-dbus-interfaces> architecture.  It clarified the developme=
nt flow.

I am trying to expose some of the discrete GPIO signals, and methods to gen=
erate audio and visual alarms for our management software.  I will define t=
wo new yaml files describing these interfaces.  From the training video I u=
nderstood that I should use the sbus++ to generate the cpp boilerplate code=
 and make it part of the library.  I will extend my daemon code to implemen=
t the actual functionality as explained in the video.  Where I am stuck is =
on how do I add my yaml files to the phosphor-dbus-interfaces infrastructur=
e?  How to do this in my yocto environment?  Please help.

Thank you,
Mahesh

--_000_SN6PR17MB255899EA5DB3A379ABEA68E996D20SN6PR17MB2558namp_
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
	margin-bottom:.0001pt;
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you for the video on the <a href=3D"https://gi=
thub.com/openbmc/phosphor-dbus-interfaces">
<span style=3D"color:windowtext;text-decoration:none">phosphor-dbus-interfa=
ces</span></a> architecture.&nbsp; It clarified the development flow.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying to expose some of the discrete GPIO sign=
als, and methods to generate audio and visual alarms for our management sof=
tware.&nbsp; I will define two new yaml files describing these interfaces.&=
nbsp; From the training video I understood that
 I should use the sbus++ to generate the cpp boilerplate code and make it p=
art of the library.&nbsp; I will extend my daemon code to implement the act=
ual functionality as explained in the video.&nbsp; Where I am stuck is on h=
ow do I add my yaml files to the phosphor-dbus-interfaces
 infrastructure?&nbsp; How to do this in my yocto environment?&nbsp; Please=
 help.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you, <o:p></o:p></p>
<p class=3D"MsoNormal">Mahesh<o:p></o:p></p>
</div>
</body>
</html>

--_000_SN6PR17MB255899EA5DB3A379ABEA68E996D20SN6PR17MB2558namp_--
