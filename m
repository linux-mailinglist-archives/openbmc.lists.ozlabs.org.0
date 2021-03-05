Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD64F32E063
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 05:09:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsDlR62yWz3d4F
	for <lists+openbmc@lfdr.de>; Fri,  5 Mar 2021 15:09:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=MunbsG8u;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=0698e54762=mike.garrett@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=MunbsG8u; dkim-atps=neutral
X-Greylist: delayed 1753 seconds by postgrey-1.36 at boromir;
 Fri, 05 Mar 2021 15:09:22 AEDT
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsDl66kYmz3cXX
 for <openbmc@lists.ozlabs.org>; Fri,  5 Mar 2021 15:09:20 +1100 (AEDT)
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1253XIQZ003868
 for <openbmc@lists.ozlabs.org>; Fri, 5 Mar 2021 03:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=pps0720;
 bh=bzZGDWLVIfJXS7Ycxbcq5Qvsdtb8hP53+yAbTtPpZN8=;
 b=MunbsG8u23FVNfBYuc9a/u2w0nOpSZZdXJp3dg49TBNBWP9s7pwYCyrI6nMgrWuxcchO
 7E/xY3sSEsmloas1L7XUDc/w1Sc5mITr+4dqAHmi47rNSeRrPQsFfjbK1viZC3hiZJLY
 ya1ggz5my8qq13KLFyh5vSmaZ7VPdgSR6UVuUA3fymioUa1LAoN26F4xcZjhV8VvVbu7
 rnwleqDjnvKPQ6d2XpyGrfRn4FsK7UazhDk81O+1d8MpwGuQhdZWjUeevL2bB4lEda91
 nZl84L+8xXTXJYw6RZZ/W3T2wTsvsOoN42TGBUh+KF8wU5jDhL4PkvpGebsK5BjnE1rb Yw== 
Received: from g4t3425.houston.hpe.com (g4t3425.houston.hpe.com
 [15.241.140.78])
 by mx0b-002e3701.pphosted.com with ESMTP id 373829hysx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 05 Mar 2021 03:40:03 +0000
Received: from G4W9119.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net
 [16.210.20.214])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3425.houston.hpe.com (Postfix) with ESMTPS id 257F89D
 for <openbmc@lists.ozlabs.org>; Fri,  5 Mar 2021 03:40:03 +0000 (UTC)
Received: from G1W8108.americas.hpqcorp.net (2002:10c1:483c::10c1:483c) by
 G4W9119.americas.hpqcorp.net (2002:10d2:14d6::10d2:14d6) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Fri, 5 Mar 2021 03:38:51 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (15.241.52.10) by
 G1W8108.americas.hpqcorp.net (16.193.72.60) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Fri, 5 Mar 2021 03:38:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ahRWzHjR9j/kEbwQmUEsEaqEyZT+5zVzWUhzAx6JIho9fW02N7/9mF9LsnDO2B/OVSRCSviuDUvcNeDfLAzt2+pi0LG+DVpq2NrGDPFGqOS8WuRrHEFbWJceIlWF8wgKhXa9lu39mHOB0tuE6iL8+I5Hc8QqlBO67AVbssyRBT1vWxvrBl+4Bdk0/WxbcxtaturQDRVgd3aBhcg3wZB0Gpd9yLBBbtOd0amRCTCGeZHt22g/0/zujNlQTAP2hterCdM5UA0HOkfRolQBXzvOzh3cyjWOZBPIN9rKYTjFbFRue/OioVv1He7Wkp6Z/ihIbzph3DqkpQ8eOUQCOKAAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bzZGDWLVIfJXS7Ycxbcq5Qvsdtb8hP53+yAbTtPpZN8=;
 b=bRfuuLGV4zJrPvm6Mcq6r2348mOqfQN44VUDzKVPRohc3jTqBS0sK+8Tw7A1rotFDAiMym1Ta7TDDIHFvA6FO1X4xqNEM6yBfW7LZBCgMhzxzhz0QyzIcynxkdu4tAa1VZmoM+eqgBwWtspx9KDYicrGMIRdK7LOjl3vL76wlYby28Vq2U8ZETMLbNHwTLJBSbBYnSiNgwz/SqtlvO+R/yO4QUpFBhK4qVNQFgHJmROVMBggvHHREXr6M40LlzNYQGTNrluvOVMn7wPItIUjC7OkBDhZKPwBtU/HCUP8DwbcCccIKLi0bai8Ls1MO1NaL04T/A2oQIa+IWw1yKThuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760b::12) by DF4PR8401MB0412.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7606::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Fri, 5 Mar
 2021 03:38:50 +0000
Received: from DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::496c:9cd3:2309:9fda]) by DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::496c:9cd3:2309:9fda%8]) with mapi id 15.20.3890.033; Fri, 5 Mar 2021
 03:38:50 +0000
From: "Garrett, Mike (HPE Server Firmware)" <mike.garrett@hpe.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: BIOS/UEFI host firmware interfaces into OpenBMC (x86)
Thread-Topic: BIOS/UEFI host firmware interfaces into OpenBMC (x86)
Thread-Index: AdcRcJogYGGLXpyjS86cT1Na4cijRg==
Date: Fri, 5 Mar 2021 03:38:50 +0000
Message-ID: <DF4PR8401MB06346506DB2E0B65A9B5EC1B8F969@DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [165.225.217.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 372e8e51-a467-4e52-0acb-08d8df8830ed
x-ms-traffictypediagnostic: DF4PR8401MB0412:
x-microsoft-antispam-prvs: <DF4PR8401MB0412235E7A35DB1C532BEDC68F969@DF4PR8401MB0412.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CEcuUorXMZmeBmBPMcSD6/8dy0BkPqGrwM5BrvFqvmhJnPO0n4jQ2Fumsm3mogeYhPwYoerpMqCYtq5+hL/Y0yBT9UDz8InQmiWFQb6Fd/EY1JnxcZJbk+Apm3xN3L7tswYRs779NaxScXgrNL1UpRDKLsdPNOag7UKF38NzROaN7jA8V3ktgS7wPVvc94NDypMXNaa9GtPaa7ePyYrNBjWSypqnnDQHwDftRzbPay9JY/VrJgaveZdFcPXuvYNnKP2ncdPUjPAn6cjo7vaJw2cIN7hyMdPYEOQDzCDh+olX/ss6ZFgzcy9/8w+lik/CNpB1e/YHK/BYuRGkioPcMo/ZgmmZ6ueylVwASIiOnCNNf9i6DxIBEf1Fk2bVxbjeCuvebBB3/tJi3ZngMPDA/E+qrLMiof0je/O+nvPRJKUaNPre630jtmQmrOoCYrcqeRyerVDpeURqQPv7nhjlle56IFXO7EOBhzqmMjrYGd7zmlF4gM2hQw7pZFfKLhZ+nJkXrlNC1tjN1fKz0Xx6gw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(396003)(136003)(366004)(376002)(186003)(55236004)(26005)(83380400001)(86362001)(2906002)(76116006)(66946007)(66556008)(64756008)(8676002)(66446008)(33656002)(7696005)(55016002)(66476007)(52536014)(478600001)(71200400001)(9686003)(6506007)(8936002)(6916009)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?SjZz+NH7e2XTNKAZ8cYHS0elUqQHnkx/U4p3OvRe+33mVAmo+PZeYxxcyrVp?=
 =?us-ascii?Q?u+lQklTdskHV0aAIhJ6JWtO3nviv2px+0t2vrTNDzp7swYhIoEKgpa7Yfv49?=
 =?us-ascii?Q?MTF4souTrfFy3lmgjX1A087gvKSf9jSXYG/LgW499rrdf0cOniFCp4K/MquK?=
 =?us-ascii?Q?+cCUnz8FUyv7Xu3vyDxj/MWy475Tqx+b5i99Nqdm+QZ8Ns76vfiHmDY5Ov0W?=
 =?us-ascii?Q?lxW029CTtoCbqdr4zGQo2zxb7ExTyJhv5Tms8ONZTrVpsqoSWMVNrdkYBKfu?=
 =?us-ascii?Q?+z7MkffDcQ15QUXlSVTOZqJuVHQWrk8t96h1tb9I8oTjuST+DJYUsBjJvuSf?=
 =?us-ascii?Q?2j2uubuPhC0XM2k90Y/Zxv5ahJXyV5HBNPw2oGVDad6YKopb9vuvrmDcpKWM?=
 =?us-ascii?Q?Mm9yDnq2kb7GNzc53Q64CAMqRJLgkqoMe9UY4aGyrZUYUSLAPbhqlwJYpsf6?=
 =?us-ascii?Q?AfZi+roNiXQJp+ijN2RWC2pE0Xm65hOmg3h/TUY6QavF/Zaz5YeZQCpZOJBG?=
 =?us-ascii?Q?Cg/tgPW+y8B/bLJ0IDPZgb3gl5vNJ/nvFmlX44SBOSYgUmBEuTsnP3pAZ8rm?=
 =?us-ascii?Q?KpIPcAFJI/ax4nC4WwZCakF3hRgkqOFJ9oglGfCdNCQ/mTb+54YsPim+b97/?=
 =?us-ascii?Q?/z4392jPXxQ6ezLWesaKdEhSz0lX6gvRNR8yYK4F1KLXG2A7uyRS9n23xlfi?=
 =?us-ascii?Q?iRrHkM1oM30k9+JZMfD+BHn9OwxJa/U4OpfdEElWILQlYeFVc7QGvXZPTUKQ?=
 =?us-ascii?Q?+Mw25me1MRxXq6H7ikPnxNEBWEeN7vJpUC0wiyJju+VfossXfuxdFmMGzeYl?=
 =?us-ascii?Q?m9XsO0BVrxR+28V0ZZJdg6Nv/OdiHAC9iFJcCbotZD5M1cnF+4Wo8QJXIFUe?=
 =?us-ascii?Q?Yq/taVR7wulagQumWUV/qWQd8+G9VMRRY74EciiuJEsu2ds0ZJF5erq37qpj?=
 =?us-ascii?Q?VrmWxvVclXylMxkz4+hZpuxZ1ZQmZAZn0QsYJBNqmOwtDjzcT324d2H1A6B0?=
 =?us-ascii?Q?8kRSibxv9xqsQF+oPLPcMdpxBR3pNBVANtBFHdYhmkaOE0NbLr0gSWjaiB99?=
 =?us-ascii?Q?abNttR/XH/vhNLELxRhs2G1c/AqvDPNaK/x3ZJOlH9nhH+Ij4TihfRYXM0T6?=
 =?us-ascii?Q?qvasMBpEeXa/o5LxXMk3Vh/zarWpOtB96Jtup0pRvChyN0gWlMQdoq3ROBr8?=
 =?us-ascii?Q?ogWx/BNkOqSMqCBVN9OvSOPNVtpiVWMvPleiURpDA5u+k84Yd1cEdOCnu03E?=
 =?us-ascii?Q?zZDaehsoIiiTb5pACOC/M9KoJWLR9gdXximfvecCSzPBMaFgWTwJwE6D4Ns1?=
 =?us-ascii?Q?S9gavaoz1NUheJltQx8y+7R9?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_DF4PR8401MB06346506DB2E0B65A9B5EC1B8F969DF4PR8401MB0634_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DF4PR8401MB0634.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 372e8e51-a467-4e52-0acb-08d8df8830ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2021 03:38:50.1602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 53xFeO2uZb/2pasn5cnlHxu1bNXdAbmcSNTcjzn6b1PK6EC5QTZTFKE3aiS4/Oo6pBqetVvGOdgwS3knknW+AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0412
X-OriginatorOrg: hpe.com
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-05_03:2021-03-03,
 2021-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1011 spamscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103050016
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

--_000_DF4PR8401MB06346506DB2E0B65A9B5EC1B8F969DF4PR8401MB0634_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello all,



I'm interested in BIOS/UEFI host firmware interfaces into OpenBMC (x86) for=
 POST-time data transfer.  I've been searching the email list archives and =
Discord for any discussion of this and haven't found much.



In the vendor-proprietary firmware world, the BMC firmware is often coupled=
 closely with the vendor's host UEFI firmware using a non-standard but high=
-performance interface instead of the slow and primitive IPMI over KCS.  Op=
enBMC doesn't have natural BIOS partner, and as best I can tell, this means=
 that POST time data transfer is least-common denominator KCS.  We could ad=
d the vendor specific support we need into our OpenBMC port to handle our U=
EFI firmware's POST-time data transfers, but would prefer to first understa=
nd if there's an emerging consensus on what replaces IPMI over KCS for x86.=
  This will become even more important when open source host firmware (Core=
Boot or Min Platform or other) is running and all of the vendor specific wa=
ys of doing this disappear.  I'm interested in something standard (even de-=
facto) to transfer the big data items like SMBIOS and Remote BIOS Configura=
tion data.



From what I can tell from reading, the Open Power folks are going with PLDM=
 over MCTP over some interface (KCS or BT?) to enable host firmware to BMC =
comms.  I am just curious if there is a consensus on a successor to IPMI/KC=
S for x86.  If there is a lode of rich info on this topic, can someone poin=
t me to it?  I'm interested in the community's thoughts.



Thanks,



Mike


--_000_DF4PR8401MB06346506DB2E0B65A9B5EC1B8F969DF4PR8401MB0634_
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri",sans-serif;}
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
<p class=3D"MsoPlainText">Hello all,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">I&#8217;m interested in BIOS/UEFI host firmware i=
nterfaces into OpenBMC (x86) for POST-time data transfer.&nbsp; I&#8217;ve =
been searching the email list archives and Discord for any discussion of th=
is and haven&#8217;t found much.&nbsp;
<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">In the vendor-proprietary firmware world, the BMC=
 firmware is often coupled closely with the vendor&#8217;s host UEFI firmwa=
re using a non-standard but high-performance interface instead of the slow =
and primitive IPMI over KCS.&nbsp; OpenBMC doesn&#8217;t
 have natural BIOS partner, and as best I can tell, this means that POST ti=
me data transfer is least-common denominator KCS.&nbsp; We could add the ve=
ndor specific support we need into our OpenBMC port to handle our UEFI firm=
ware&#8217;s POST-time data transfers, but
 would prefer to first understand if there&#8217;s an emerging consensus on=
 what replaces IPMI over KCS for x86.&nbsp; This will become even more impo=
rtant when open source host firmware (CoreBoot or Min Platform or other) is=
 running and all of the vendor specific ways
 of doing this disappear.&nbsp; I&#8217;m interested in something standard =
(even de-facto) to transfer the big data items like SMBIOS and Remote BIOS =
Configuration data.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">From what I can tell from reading, the Open Power=
 folks are going with PLDM over MCTP over some interface (KCS or BT?) to en=
able host firmware to BMC comms.&nbsp; I am just curious if there is a cons=
ensus on a successor to IPMI/KCS for x86.&nbsp;
 If there is a lode of rich info on this topic, can someone point me to it?=
&nbsp; I&#8217;m interested in the community&#8217;s thoughts.<o:p></o:p></=
p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Thanks,<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Mike<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DF4PR8401MB06346506DB2E0B65A9B5EC1B8F969DF4PR8401MB0634_--
