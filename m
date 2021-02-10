Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1449F315A8C
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 01:04:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db0Pf3fjlzDvZb
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 11:04:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.161.93;
 helo=mx0a-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=mo4IqLyH; 
 dkim-atps=neutral
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com
 [205.220.161.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db0Nj5wR3zDrRd
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2021 11:03:59 +1100 (AEDT)
Received: from pps.filterd (m0187214.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11A03NTt018336
 for <openbmc@lists.ozlabs.org>; Tue, 9 Feb 2021 16:03:55 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
 by mx0b-003cac01.pphosted.com with ESMTP id 36hsa1d21q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 09 Feb 2021 16:03:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SF4bWD1Y6bBH/T5QlaPZaJni6pLXYJ/RmOP4wF2bFrFf3P14cwpzQY3CaMmk3m0uK1yH0t6SRCtiZKhP7rwdM+UhlLef9VmVjre0P2v2m3ALeliNfKdz5HftWkUV8P5mvJSaZedoVuFthckOdB0C4wfW+xyhynOHJVKUTzUwNckgMKc3LxURmnYyS0Z0r/+NHCrIgZrKxRmGAkw4Gy/ylsBnbVM1ZHHcWshkRbm3YP+vTVoMfgjcDExA3mrzCrgAKTC0hf8PpC99a01LnMiRmDofPB7dWpjOR7E9gEL/UbATe7eqiHuYTMhvg+hUpHsRCweeJ++ntGK+Zt7CJ27IAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sAWXaTEvmchl2/U6tMPBh62+OtPnaKfBmaHAoKV+C4=;
 b=fgQi2ZbwAyN9cI1i5N3C6aHHp90qcqn5RRXFo2wFPMFy0+xpANsk8DoPgRz8I4HI6TSsjQjExErXhJW6HgFkB6LBPbTj2cN6jZJMqApjdPUXlnpx+VmuIRDzf6vtAbhXNxw4UsrWg4ChtZBC0lnPU5NlJ9R/o0djQ9LdHGqphTA3x1UD4OK6rH8tzGlPV+4bNHL+/NQ4Dxxsc6jHHdiPOWu9aNV1yoKy+MCfMemwh/bALvbWwyIU6rE4Ta8VCEutgSTqKck2hUhgX4wofQ+08ea0vRScSHycrc5QY7o9tQHqwRZOLOGr8xp79JNa4oV0F3vRitosDDLobyhADC2zVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sAWXaTEvmchl2/U6tMPBh62+OtPnaKfBmaHAoKV+C4=;
 b=mo4IqLyH4elquFNgcpvtrJ1Rjy79EutpXCBMm43uFh2SUt3U1ThSUXyqD138aJOcJExesqw0DPAv2paiXTXYFxdT55CPC9QPRIy4VbzvaaZ9+i0nlMFVpPA2F7F1kb8G0aA54pGA1St0N1da2Rp9JKanz9zRyAKnJgQk5HNtAc4=
Received: from SN6PR17MB2558.namprd17.prod.outlook.com (2603:10b6:805:db::20)
 by SN6PR17MB2640.namprd17.prod.outlook.com (2603:10b6:805:cf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Wed, 10 Feb
 2021 00:03:53 +0000
Received: from SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::91ca:8c7c:8ecc:c813]) by SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::91ca:8c7c:8ecc:c813%2]) with mapi id 15.20.3846.026; Wed, 10 Feb 2021
 00:03:53 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: force upgrade of the BMC. 
Thread-Topic: force upgrade of the BMC. 
Thread-Index: Adb/P1Y35Zz2BTRwSlqB6PjvIoP5rg==
Date: Wed, 10 Feb 2021 00:03:53 +0000
Message-ID: <SN6PR17MB25588FA9E2E47EA410FA668D968D9@SN6PR17MB2558.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=keysight.com;
x-originating-ip: [64.157.241.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 557f95f4-0550-40bb-1e21-08d8cd575a3f
x-ms-traffictypediagnostic: SN6PR17MB2640:
x-microsoft-antispam-prvs: <SN6PR17MB2640B82C258390D33B7B38F2968D9@SN6PR17MB2640.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JNXeS4U8TRD4WeXmwOq/2F1qiUwdrBYbmxTX16WVygcHxLDGVAqL4Di/iRnFgxhSpamxOMCM1sOz2U+VWknNaaipzB1vk/xd1ovKYcUQESpNX/p9t3c5s4bScoOFRw1tqdrKKHwkfG8h2wEDf/luPuAvWB7TqjKaExb+RMmdyDpFcvmTkXLiLOC8Ku/l88yPeo2s73+m0YN6uVdni0cro2BWtcM8ajOdjjdDoyQQPomB6oeuZv/nk+Ejd23jQ6ZRAUGPL1rW3+BDbmJhEr4yFYWwxui+YsCyHp4a6YJSmBph4hv/lRDnFgwOtmAQ1ECHDEM6f9IltrOd5TirpZF9NObBpkHNFJ+lkVIXq2Cp4mNzLZpVc0olAAraXm3dqygyRV12N3M57FqPyCer77vCtsdBpPnVb/ALAcCJf9c8Zg8TiSXAlmo4+LbhlzGj77CP7jFj/7eHteFgyanqPKDIy9cdrHPZW9YCfLvyUk1mqSFQhh1PHelmoZBUfpw2L5ZkiCd8+xvXw5B5BR7P2bF3+g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR17MB2558.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(26005)(76116006)(52536014)(66446008)(66946007)(2906002)(71200400001)(33656002)(8936002)(64756008)(66556008)(66476007)(6916009)(9686003)(55016002)(4743002)(83380400001)(6506007)(86362001)(44832011)(7696005)(5660300002)(498600001)(4744005)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?bsBbQUMOnxUH/y/bTaKcCGrseXvMTvj9rBvx/6y1Bjh2woFd9dncc83M3J3E?=
 =?us-ascii?Q?wQybyYlYcKD/lYejbhvu3iMYIi2AogkpV2YruImwkOhMLzKfGPwlRAmHPdkh?=
 =?us-ascii?Q?YPeIfvl81cD7wQvOFr2DxWs1p9MnH8BWFsNLr4epFYNbj1DeI/MaKI17seoy?=
 =?us-ascii?Q?2h5Lj7k4CK4KlMn9X9pu+qeeOxS/qJO6pF0Iqlb4rBqAI8ZOQb4DsNmUpRbm?=
 =?us-ascii?Q?1yMvxtXBkUal6SpcxgFcKlBvoYrsKbz7ybueH+pfGj2z6eaOOr53poFfB7mk?=
 =?us-ascii?Q?dFpD5zKkeUYkVKgW1ZCOPQxpFPePsRcxG9NWrYqPGHtZpCNMHoTlmLFnL6La?=
 =?us-ascii?Q?kOsYP9t4EXPYSx26dWm0thK67cFsYUnKXcNpOh2VIzT4BRrfmYwBVHcZPdy6?=
 =?us-ascii?Q?yHDUYprb2VekLihsIwcScm5XZdQYAAGiwsHme8gic4U7ISNYbdLznBo/OhAe?=
 =?us-ascii?Q?af73rv6pt/veSK4/EpdxEsY7AaSFB/wEQ42fky6jeO5M9VPgwLH/vq0GvTQ1?=
 =?us-ascii?Q?mYmwmf1kYNYOm83PVije9+dx52gyrSwiI+HTc9/spE6hep1jto61B3VSQFld?=
 =?us-ascii?Q?B3xfXb2SjsFj89/ThI+2ZLV1i6ZFU2+XcuGJg3PbQd4l3TkeqhhO1Wmi3vhn?=
 =?us-ascii?Q?A0Bi7gueniwoZcb0xf3pXls41mMLDiKQ1rG7WTonN3N3EfGc73FilCleVOZk?=
 =?us-ascii?Q?yKZT6DDcF0LL8+p55PR8TRnDtvtMQ0iwjygFX8owZE/A22qEj28f9m8fwabZ?=
 =?us-ascii?Q?0BAsPOIEh1XPjV5NJ8YI0chij29xfu4DDrfW4IZu6aOm1wz5ezRkj2UZPCBm?=
 =?us-ascii?Q?LoxHZE9WFZ+a001vLqw2gEICGWKxxX7pHFG/TZgAt11SbAkOuTiwXUh1r8/J?=
 =?us-ascii?Q?aFAxKgqTPwyuHY3bqJyQzoCNf1kf0T/7Jjt6DigWSmxNHY0TeMjbKHLsr4wQ?=
 =?us-ascii?Q?dlZc2onOkBJkNRFPuAoRwFEMdn1/a2f7sp9Ggn9RR1EjintpkAVt8Y5XWGZe?=
 =?us-ascii?Q?6e0NYjcumGz1IU3cSUFmA46+fqWAfVyKQIxjNyUQ9LRXB2D2ecOegroBRktb?=
 =?us-ascii?Q?GGiNqXipjYRnUpd0REJX0gs5Enll6v+rev4qEzP6pVpHwy8904T+bT0ORfE6?=
 =?us-ascii?Q?xvCkcwF1Q5fgCD+dmynIB99mWbC3cy9rV7Jy/YZQaQ1DbkxeMLLExeWropV7?=
 =?us-ascii?Q?Y/92EJ+ckPQaxY8GS3Jf8a7aOfSlFjly4uIhMxIohB6/oOiG/wnaEUkws/+4?=
 =?us-ascii?Q?c2JEFXEz3QpHthaySFcW1JFu3+q7uBoOnqYvGUC+S9SuQrXS1+hys1mRn+uy?=
 =?us-ascii?Q?AYnQcDyxAVi2L3BDTOhC8CfH?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
 boundary="_000_SN6PR17MB25588FA9E2E47EA410FA668D968D9SN6PR17MB2558namp_"
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR17MB2558.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557f95f4-0550-40bb-1e21-08d8cd575a3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2021 00:03:53.2060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Am+YosCt9ssb08VlQ2MTgl4YAl1B9O1UA2a7L37g3Aw/QPa+D/DmZp2O7w6RnsBBF1J/ph3jYYdLts0tYi8thQIzoB3QldvBhyZA0Fq+p+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR17MB2640
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_08:2021-02-09,
 2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=592
 phishscore=0 adultscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090129
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

--_000_SN6PR17MB25588FA9E2E47EA410FA668D968D9SN6PR17MB2558namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I changed my dts to add more tach channels, and built the new image.   Afte=
r copying the new image to /tmp/images, I see that the same image code is g=
enerated even for the new image.  Not sure why.  How do I force upgrade thi=
s image on to the BMC with dbus command.  I am running the following comman=
d.  But it is not upgrading the BMC.  Can somebody pls help?  I am using 2.=
8.0.

tacuser@fenderbmc:/tmp/images# ls
5cdb4860
tacuser@fenderbmc:/tmp/images#

tacuser@fenderbmc:~# busctl set-property xyz.openbmc_project.Software.BMC.U=
pdater /xyz/openbmc_project/software/5cdb4860 xyz.openbmc_project.Software.=
Activation RequestedActivation s xyz.openbmc_project.Software.Activation.Re=
questedActivations.Active
tacuser@fenderbmc:~# echo $?
0
tacuser@fenderbmc

thank you
Mahesh

--_000_SN6PR17MB25588FA9E2E47EA410FA668D968D9SN6PR17MB2558namp_
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
@font-face
	{font-family:"Lucida Console";
	panose-1:2 11 6 9 4 5 4 2 2 4;}
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
<p class=3D"MsoNormal">I changed my dts to add more tach channels, and buil=
t the new image.&nbsp; &nbsp;After copying the new image to /tmp/images, I =
see that the same image code is generated even for the new image.&nbsp; Not=
 sure why.&nbsp; How do I force upgrade this image on
 to the BMC with dbus command.&nbsp; I am running the following command.&nb=
sp; But it is not upgrading the BMC.&nbsp; Can somebody pls help?&nbsp; I a=
m using 2.8.0.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">tacuser@fenderbmc:/tmp/ima=
ges# ls<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><b><span style=3D"font=
-size:9.0pt;font-family:&quot;Lucida Console&quot;;color:#CAA9FA">5cdb4860<=
o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Luc=
ida Console&quot;">tacuser@fenderbmc:/tmp/images#<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">tacuser@fenderbmc:~# busct=
l set-property xyz.openbmc_project.Software.BMC.Updater /xyz/openbmc_projec=
t/software/5cdb4860 xyz.openbmc_project.Software.Activation
 RequestedActivation s xyz.openbmc_project.Software.Activation.RequestedAct=
ivations.Active<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">tacuser@fenderbmc:~# echo =
$?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-autospace:none"><span style=3D"font-si=
ze:9.0pt;font-family:&quot;Lucida Console&quot;">0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Luc=
ida Console&quot;">tacuser@fenderbmc<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Luc=
ida Console&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Luc=
ida Console&quot;">thank you<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:&quot;Luc=
ida Console&quot;">Mahesh</span><o:p></o:p></p>
</div>
</body>
</html>

--_000_SN6PR17MB25588FA9E2E47EA410FA668D968D9SN6PR17MB2558namp_--
