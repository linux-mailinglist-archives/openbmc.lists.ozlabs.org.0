Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC74246911
	for <lists+openbmc@lfdr.de>; Mon, 17 Aug 2020 17:08:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVcr03gB8zDqVP
	for <lists+openbmc@lfdr.de>; Tue, 18 Aug 2020 01:08:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.173.93;
 helo=mx0b-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=keysight.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=Iurq+HGp; 
 dkim-atps=neutral
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVclx6NCTzDqVN
 for <openbmc@lists.ozlabs.org>; Tue, 18 Aug 2020 01:04:55 +1000 (AEST)
Received: from pps.filterd (m0187215.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HF0v6l012889
 for <openbmc@lists.ozlabs.org>; Mon, 17 Aug 2020 08:04:51 -0700
Authentication-Results: ppops.net;
 dkim=pass header.d=keysight.com header.s=selector1
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by mx0b-003cac01.pphosted.com with ESMTP id 32xf0ntf37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 17 Aug 2020 08:04:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GvULNjS8h50NmRH3v8JDoeFpXhpcmU0hTya25eSlnq+76obO7I+lR2DSvjZyU4L83j7xc4+hyniUhb2j/P65BhxJK2d0xal23GO/GMhw/dI5H8QKB72sK+5+7/Qti0WZfFPde5BWKB7IpHr3RA3hKZT+4GEvcpfSfrNgQa/X1KVz2OAXKBJahtLlYfhWbzdIL2oAbNwlTLhyqlVcZY+fC2AtFAIvqC+NrsvinBxccv7VmcPXAkYcypdBfIzY5YpT7FoWnBsc8MNkCozUg5gYV4OlQtufG2WGEUf5qd7FH23a/HVlbU4H8jSN1MFXE53VoK2D7KS1fJ2HPuH1vKdaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxFgwvGQ+jLmtCro1Bfb70XDbTFQEG3MT432qHSqoAM=;
 b=Nys2ETxaqFMjaMH/Yv0OMO2xTadlaYyAiQYqz8/jADNZujcO23ifi8mB0UtrSnd6yM+2L3JA21VdDQ5rA6QshhKUF+AkS6UQeUf24OKV7fAgVbDKUkPB85ySq1kknccQkhYvyNP9nVF5iWPfnoSEXgV8dvR+8S34yFbM5T560kqNQo8eR+sC4Zd0vLUeT7VITxzXueSSbGHTkHap+O4L5oC8ZtgWbP/hr24utvqm4Td222SDN+v9lDDZc0ZNi593ZGVExD0lHpUhOW/Q7GpSHPli2KmB+3R7CMp7q4aN0lGNQoVPXqi4yDGaRUWSeT7BbT9zo5ebnWFRVxa3JTwqaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WxFgwvGQ+jLmtCro1Bfb70XDbTFQEG3MT432qHSqoAM=;
 b=Iurq+HGpPC/1pd3E4Y78X5oZc2bL8rwJ/QKe0B+P5kiwkhanktP971uD0SDg2LushY49zuwOHdBIF8D/pspaIP2FaHFIVBITEag12QJNnVnCVWbKett81izFZ/MaqS8u9pqZ7ybUI+9WABX9CYJOAkzBMfD9s2oKRlDsQhEsNHs=
Received: from SN6PR17MB2558.namprd17.prod.outlook.com (2603:10b6:805:db::20)
 by SA0PR17MB4175.namprd17.prod.outlook.com (2603:10b6:806:82::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Mon, 17 Aug
 2020 15:04:49 +0000
Received: from SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::b570:201a:5e7f:6e6f]) by SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::b570:201a:5e7f:6e6f%4]) with mapi id 15.20.3283.027; Mon, 17 Aug 2020
 15:04:49 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: eSPI in the OpenBMC
Thread-Topic: eSPI in the OpenBMC
Thread-Index: AdZ0pyS5J81qiwAURd6KW8rHFyPfDA==
Date: Mon, 17 Aug 2020 15:04:49 +0000
Message-ID: <SN6PR17MB2558E77674E7ABC72B0970D8965F0@SN6PR17MB2558.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=keysight.com;
x-originating-ip: [68.203.28.127]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a192e3e-5e09-4657-263b-08d842bee364
x-ms-traffictypediagnostic: SA0PR17MB4175:
x-microsoft-antispam-prvs: <SA0PR17MB41759BBA7BA42FC4415C385E965F0@SA0PR17MB4175.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FzqncWMEr6arODqaIxmmw0rzBMzGxbfY1xcoBwCToAwXQ5Bsf9AHyKvzDlBKjJr1vf+7kBF/m7joze5zR7C4XvAZhXDMRPBBhBBFg11OIiIOmCTgk2gd7AeGw9AvpHFUjtTUGlKZFlIPIN7TUBL8QmDKedv3mUebecYqpysfM9gEsUH3C/gvHCzl7iQAIqieJbbJByckTH2EhHE6W3czV+06uwSBGM8wtzuDS4SOQrXJKPCrhw8mRv3vRJpzweDjn6xRL37QafJA+KQZM2cMF11/GM+6PUPZMpiK6m52N2DCn6LxOcMOuvj0DKoVI6gG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR17MB2558.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(4744005)(3480700007)(55016002)(5660300002)(9686003)(52536014)(76116006)(64756008)(66446008)(66476007)(66946007)(66556008)(33656002)(7696005)(9326002)(478600001)(86362001)(44832011)(26005)(186003)(316002)(6506007)(2906002)(71200400001)(6916009)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: tb5diXParAgAFISrp+gV3t25XLPn2EiWvTEftTwNwocGmMA0JDi+wPwGkLuKzoxkk+2n5peQLr4qF3Zs/kt57E6p5BkekXa23AP81UVYoaG7J4dlkz10DYi4Sch7JlB0RIjDQB4xbbUoza2FjjlWBFM2vecyyABaycOD2ltd+d2w5vVyl72RTTf7wYbWtbMX7pF0JNUaPY6WeSQAaE/SqTqCZoByK4jvl8enTBWs9WR8dhU4dPezqKzp9y95yQMbPjt3XKKhUMRbR3ALZkVis38zT0iw6CTIIdQBfkkRAtiv+mYZZQC+njItQB46Ofxjcrc7vQkqkpVlxeOMwaJRFBb6xp6nbrBpslEVTmVkbAYssAfY4AhjmTlLBin8e/CQKnVXKWAY0wLqfdpk88J+8wUJVjIq1Ek9MfQOwP1Qwp67EFIisMJ2QRnJtNkhRUDj3DeVLx6bTYq1KqaEBmL79QsBZrsHqMFNrLAzpEXpWKly6YsrRFovRfdfKZCBr6KSbOjsyxc0v/cQe0tTm5HT3oxTwRUQW+wbB7FcfAta30QLnladzFaHsDeCEcycdIsVine9uaNiF0GpcjFCPKZR6N7Rm/2kXEgYs4qsS+5Qn2pxWGJUyfOwJNtd2PJbFC+BR4HfcBUnodP8mqNqIAvUkg==
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SN6PR17MB2558E77674E7ABC72B0970D8965F0SN6PR17MB2558namp_"
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR17MB2558.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a192e3e-5e09-4657-263b-08d842bee364
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2020 15:04:49.8646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2rZj0eXsYguN3VtImqU3CBP8SKnoIbHCI34FG8+kwSi/TxwuGOCckY6nM7jXdLi1sb3uVnW12I898IJ1FIcgKcpViskJUDjLTcVDu2ZPWdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR17MB4175
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_10:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=487 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170115
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

--_000_SN6PR17MB2558E77674E7ABC72B0970D8965F0SN6PR17MB2558namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Do we have the eSPI support in the BMC kernel? We are using ASPEED2500 as t=
he BMC.  How do I check?  On the web I found a discussion in the year 2018 =
on the eSPI patch, but I could not find the final decision on whether it is=
 included in the OpenBMC or not.  I am using the master branch a month old.=
  Could not find any traces of aspeed/espi related source code/patch.  Can =
somebody please help?

mahesh

--_000_SN6PR17MB2558E77674E7ABC72B0970D8965F0SN6PR17MB2558namp_
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
<p class=3D"MsoNormal">Do we have the eSPI support in the BMC kernel? We ar=
e using ASPEED2500 as the BMC.&nbsp; How do I check?&nbsp; On the web I fou=
nd a discussion in the year 2018 on the eSPI patch, but I could not find th=
e final decision on whether it is included in
 the OpenBMC or not. &nbsp;I am using the master branch a month old.&nbsp; =
Could not find any traces of aspeed/espi related source code/patch.&nbsp; C=
an somebody please help?
<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
mahesh<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p></o:p></p>
</div>
</body>
</html>

--_000_SN6PR17MB2558E77674E7ABC72B0970D8965F0SN6PR17MB2558namp_--
