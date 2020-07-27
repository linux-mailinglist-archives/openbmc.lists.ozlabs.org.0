Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0700022F3B6
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 17:20:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFk5c5lQVzDr1f
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 01:20:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=047783edc7=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
X-Greylist: delayed 813 seconds by postgrey-1.36 at bilbo;
 Tue, 28 Jul 2020 01:17:01 AEST
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFk1T6RtdzDrdc
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 01:17:00 +1000 (AEST)
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06REtjoe030644
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 15:03:24 GMT
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
 by mx0b-002e3701.pphosted.com with ESMTP id 32ge1nq353-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 15:03:24 +0000
Received: from G9W8456.americas.hpqcorp.net (g9w8456.houston.hp.com
 [16.216.161.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2354.austin.hpe.com (Postfix) with ESMTPS id B2B9EAC
 for <openbmc@lists.ozlabs.org>; Mon, 27 Jul 2020 15:03:23 +0000 (UTC)
Received: from G4W9120.americas.hpqcorp.net (2002:10d2:150f::10d2:150f) by
 G9W8456.americas.hpqcorp.net (2002:10d8:a15f::10d8:a15f) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 27 Jul 2020 15:03:23 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.241.52.11) by
 G4W9120.americas.hpqcorp.net (16.210.21.15) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Mon, 27 Jul 2020 15:03:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jXx7xNIRtvY0KQajzBs4z623vSocaGIBQwQrlbdiwcFtVa9ES2Z2fiyT2vdonecU3q8m7lUm1v0Hj+UZLIJh8XkWepToVFIxr7V0gbV+1RFgrImejzb05E9XuX33lTMJ4YrVZTO6fnht+b3qetk+b6WsM98li3jMdXqNIcdUZez7/o+tpTFKqfBgloj4+vZBHynFs3Q1qi1VWdCF6bvHzWAltWXbx/cftt1BisHNOwY2B5RW2bAtnIGXzAb9DpjiJMg/Bl7VzI2oreG2oFhqqvto5QQkW1kd7Al2leO3P8taiX0HFrg8YlnaGpp2JKa51SjA5JjUyvHaYsz4+pV9sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nE/vSg63jdIkHjIbkyx09oD81m3VFzCMOXQIDPFrX7s=;
 b=SzhJIXtxCOkFUwIRanCueaWi44q9grUacSsdqxUqfIztwFZN3oMQOvYnvmMf3pRR4gjIPlSR6YCNINJZUgF1wgPNRm7sB3DlNjpVuJS5wTvJ2vCxhFgYjO6BA7qkwP71rlAPkKppXiLzeN3cuWVWV3AjkjppVGC72JDQrpx+vfhMt4suCLgfk0FJ3g1rVYWoWlzm/LeNq6T69ZqB/+5q//XazrQX5SJNGQ3BGHS7Eb9VSn6VWsq1QKvBfoDt8OVmGPkd+Vdrn1twA9MG3hlvZXN6AWTpGfKvnVaeb3yHsX5ONPGbh2lz8sF4CBoy3//QA+FROWe9BRpusfMYkNGaog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7421::16) by AT5PR8401MB1025.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7429::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Mon, 27 Jul
 2020 15:03:22 +0000
Received: from AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::fdaa:51cd:528c:f6c3]) by AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::fdaa:51cd:528c:f6c3%10]) with mapi id 15.20.3216.033; Mon, 27 Jul
 2020 15:03:22 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: 2.9 planning/progress docs?
Thread-Topic: 2.9 planning/progress docs?
Thread-Index: AdZkJbvWnjJk2LgpSgqzmxj9m7NxPg==
Date: Mon, 27 Jul 2020 15:03:21 +0000
Message-ID: <AT5PR8401MB06263771D26D0EE53D41A5818F720@AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [73.76.19.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f89cd28b-5146-45ef-a4c8-08d8323e345c
x-ms-traffictypediagnostic: AT5PR8401MB1025:
x-microsoft-antispam-prvs: <AT5PR8401MB102534331C765FB7F0D954388F720@AT5PR8401MB1025.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e3f3Y5DJct8O6rweT2LYU5PVd9/ShNOJwq2xTjv0+Szm2akyIgeAdsTVPMzqVDpjQyrtUcbcmKMZt9LPBG2TIDcMgrJ/x5RLOevkI3GvRFgpXMxK/NrOvm065+17qEz8yWMQCmdQNaMj64WBKGCrMJboGbov4WUZ/qshDhlp/roF9CCOggJA7C9mxVUDaY63SUCqitZuBOmadCJOGhQebDdb+9cjhOl6tl8hgT9REC4Ogi8cDNbAlCbqMg3uCe0PSiOcFRHIteEa7KLqGwkIyhcP+UZ2MGnj7lvKiKvsZ6LLxAZiOn6jnQOgutWiM0lFBLcdaZUVtKqpizrILBsAPA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(346002)(39860400002)(396003)(376002)(136003)(66946007)(64756008)(66476007)(66556008)(66446008)(5660300002)(52536014)(8676002)(86362001)(6506007)(9686003)(76116006)(7696005)(4744005)(478600001)(55016002)(316002)(186003)(71200400001)(26005)(8936002)(83380400001)(2906002)(9326002)(6916009)(33656002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: cbB7qlXRnw40bxvhIv4e7yB0ZJxfM1HNo2pFowStX955NTzzHdpb9y4yyzBpfF+PHYyWgNolSCpHkVbg3dx/+0V7xySHuTxVEB+fHT7YBxpqjFxK++u3reQJIXyc32d6O+Kc/nZA/mO2TXxGJ6O3oDbSZAv+fft2uBRjQV6YQcPlsowzSomWnD1R2LWN+kve5DXZvc5iBKa1j4lNK/isxLQ/5kyHgmJvTjlbhYSlUsOUZL7Xd85daakh8z6bWZJYAIU8ts25L+F4qdMhLYpoeDYn8AzPtKvq+L3kPrqkgN75aIn5vAkKXT3LJFzfTNJgUzUDXPgqwTfFsUlRtK1bJzKWAxkHYP8Ea6zLgnCW8uMlYSERYH1Dt+/OLe6j7PoubyJuOOI1Wb2HZdR6v4+Fn+i1Xe6uBPwcHMgpn/vGyV13pQl34yh3oIll8g1n4UwR8Ewlx0q2OSXYymlwR52yntJ1br/RorG59B9JDBtsdKo=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_AT5PR8401MB06263771D26D0EE53D41A5818F720AT5PR8401MB0626_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AT5PR8401MB0626.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f89cd28b-5146-45ef-a4c8-08d8323e345c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 15:03:21.9243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FVfJ/+xJO3cL2SmgpY280LyUyMxOzy6pmGeXid7BCWY/x/Q011ICliThnXOQ1yuUwwK1vumaefHjTFpftxRxoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT5PR8401MB1025
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_08:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=836 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007270105
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

--_000_AT5PR8401MB06263771D26D0EE53D41A5818F720AT5PR8401MB0626_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Is there a good place to find the 2.9 change list, both in progress and pla=
nned?  For instance, I noticed a lot of change occurring in the dbus-sensor=
s repo, but I'd like to see what master plan is guiding these commits and w=
hen they are "done" for 2.9.  I know things might be more fluid than that, =
but if there is a doc, I'd like to keep an eye on it.

We have some patches for dbus-sensors specific to our platforms that are fr=
equently being invalidated by updates upstream, and instead of constantly r=
egenerating our patches, it would be nice to know when the upstream has acc=
omplished its goals for 2.9 and we can regenerate our patches once.  We are=
 still getting acquainted with the processes here.

Thanks,

Mike

--_000_AT5PR8401MB06263771D26D0EE53D41A5818F720AT5PR8401MB0626_
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
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is there a good place to find the 2.9 change list, b=
oth in progress and planned?&nbsp; For instance, I noticed a lot of change =
occurring in the dbus-sensors repo, but I&#8217;d like to see what master p=
lan is guiding these commits and when they are
 &#8220;done&#8221; for 2.9.&nbsp; I know things might be more fluid than t=
hat, but if there is a doc, I&#8217;d like to keep an eye on it.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">We have some patches for dbus-sensors specific to ou=
r platforms that are frequently being invalidated by updates upstream, and =
instead of constantly regenerating our patches, it would be nice to know wh=
en the upstream has accomplished its
 goals for 2.9 and we can regenerate our patches once.&nbsp; We are still g=
etting acquainted with the processes here.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Mike<o:p></o:p></p>
</div>
</body>
</html>

--_000_AT5PR8401MB06263771D26D0EE53D41A5818F720AT5PR8401MB0626_--
