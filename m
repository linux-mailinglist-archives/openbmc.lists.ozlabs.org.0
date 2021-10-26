Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F360343B8E2
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 20:01:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf05K5zvyz2yRX
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 05:01:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256 header.s=selector1 header.b=SFMlYYx1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.173.93;
 helo=mx0b-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=SFMlYYx1; 
 dkim-atps=neutral
X-Greylist: delayed 492 seconds by postgrey-1.36 at boromir;
 Wed, 27 Oct 2021 05:01:31 AEDT
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf04q6ZYSz2xth
 for <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 05:01:30 +1100 (AEDT)
Received: from pps.filterd (m0187216.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QHX2XF017997
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 10:53:12 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by mx0b-003cac01.pphosted.com with ESMTP id 3bx4j59qdj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 10:53:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibeGOWVdkjznJKH2N9LX5wJCpXVbs2Q33SaxuivnQl3UPGDYLbRMIL9FIdLhBcE7xpbW94qeZmM7z1iU0VVp+UllUuGmHQJAISHXOwJyrYUk+YGzf2iEJv3q8O/PLGa+oxeT+BMTSCW5jzUD1e9x540/34Qg35Ck9mag//xk9w2anSAUS6SAsXe2CepBBYNSqouZ0NI8fxIhImTIoOw6y1ENuPSatNmhaGKAL1OX4dEO6M5cCsHtYzwMX7xpE/bLnsVuoBfw++G/As7IufIpzdVzwgaXE03Y34tuIGwa2nu6WzOjFWJrNtDLYJHll99qvdiliFeuNNQ1Zf7GWjnFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SzoRVTMn9Ms/rn1NDya7Y22+8DrkdHHxam4/c27AJPI=;
 b=XtM03XeJqGi7HvuVje5j5LJInyEFYqDTd0RsTrBNNWv+/1VAkDIT9KFuXdpr+8AJridUXeseMq/7qLxfwXL8NXwgyGD5sN9jZyZv3FDlgA13EUu0lmWO9DaGhp3Ga9R7S06fb4FvXXsp3uRMxY5m4bdNVnMd3ahZLlbhNSnUS7ZN5Baf7zLhLoxn2X5mUIj44Xc0RB1T6Wy2ahQwPTIUbehPtpUtvGhje3Ncrwmsknr/rFevrG9uaG7KikisM+d1HgO3f/M9w1SLHTTrS8GmIcu3130maV/NDrVQ+J0xNHy1PNA83CXFB43hG4Hl4fvd7K3kOe3zv0WiN9EGP06eMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SzoRVTMn9Ms/rn1NDya7Y22+8DrkdHHxam4/c27AJPI=;
 b=SFMlYYx1Nkyc4BgB69Cut62bEDy4ybgNSSSNWOG+LfTM7tak1KJx8Kzugl+Tg9rIT3oHukxyQGWY2p7rGKC1/Pz1sckVvcuL+fIj71asHinM9LZOfqcoWjl79QW+xhLKJ41tnaemZJ0Wm2DGS5mnX6lETOzyCJuIOpzjwu9jttc=
Received: from SA1PR17MB4593.namprd17.prod.outlook.com (2603:10b6:806:190::21)
 by SA0PR17MB4158.namprd17.prod.outlook.com (2603:10b6:806:83::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 17:53:10 +0000
Received: from SA1PR17MB4593.namprd17.prod.outlook.com
 ([fe80::d16f:d0e2:fb2d:110f]) by SA1PR17MB4593.namprd17.prod.outlook.com
 ([fe80::d16f:d0e2:fb2d:110f%8]) with mapi id 15.20.4649.014; Tue, 26 Oct 2021
 17:53:10 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: cannot ping serverip from u-boot. 
Thread-Topic: cannot ping serverip from u-boot. 
Thread-Index: AdfKkQp1VQW4pwYHStSRPWC98tcSAg==
Date: Tue, 26 Oct 2021 17:53:10 +0000
Message-ID: <SA1PR17MB4593DE25C67A9229F65DEF4196849@SA1PR17MB4593.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=keysight.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a4981c03-70f6-485d-d4ec-08d998a9799d
x-ms-traffictypediagnostic: SA0PR17MB4158:
x-microsoft-antispam-prvs: <SA0PR17MB41581DFD7D7295CE881C798896849@SA0PR17MB4158.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j5KZy17R6v1hGziwjYqZJyZW0X/2tqYZxfwA5/WUIu32N/RmdfbQ13elYPappoBzkHkhizZeH80Ps7mQq9DPXlV/7MY+7rPQ9dzC7R00yymO1Vd6QcSnYB/+AZ/4uVxsUxOOYx6vKctQmt5rKr7sjMgmCsmmX6UnJMQ1SWXgmm8VmqQPsPRVgse2BaPC0tYYwuUXf29yuUR1gCWWIegVsD+kgwNsaKTb57E5Co93FDlTko0CLfBD9q1RfXhHt7gbplEMT+tcIoHmmfc4cFYaPwJdqPpujuMg0weRL+/+Rqz4r8OS5/f4zLO11xAgse3YJ43bj53Pe9nc44jrMOCGD7PbAvL/avbv8tpz9S7ATwV7Neqvf6hBqFY/+jNSqjBzxwxiWWPIuInKadA4c9hyW7WFjq3xgu5tlfzFlENAm83vcWkxGEE+9Iex3mUMkZN3DAESdcid12nqCJHOm2XxsdDfizqOCBs6yyR3gGtRC4DUdYi6Ucws3A2ubs5KHmsVp3b7iEdgnBcJhRr41SArewve3jY4hmHuwsJeEdyBWCw5XnlLph7GxeAO5WonYLugMeffe0NmLLv0IY2eqAzLsqLVjenlmOKGi6NBee1uRyxtlaloVcyT4P/yyGKU+VlxFsnwH8TwMLQ3GYFu76zXYK7BHLPIm7FAhixl2KAKV6YxJZo1Op9EcWfpJHyg1iStE+LsPhS+mnkg6bHyct8mtw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR17MB4593.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(8936002)(55016002)(2906002)(76116006)(5660300002)(66556008)(8676002)(86362001)(4743002)(64756008)(186003)(6506007)(7696005)(52536014)(33656002)(44832011)(66946007)(508600001)(38070700005)(38100700002)(122000001)(9686003)(71200400001)(83380400001)(6916009)(66476007)(66446008)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yemUyX1s5isXMixUYtNvwD8gBvsGLOizXcRSqVaep6lPrfb4bUn9ptuq8Ibc?=
 =?us-ascii?Q?S0xdHmH3jRtsqrtMOlSWjShcKBc1cZb3EIbwtwv9/5a1NMEDL/fFXsMA0fz/?=
 =?us-ascii?Q?ytFzgdvq9xHtrVwbol4Gn1ZRN5W6GGv4KCIXnAP0/yQ2O27xTKh34MTIpjLe?=
 =?us-ascii?Q?mLtanT1c2ZX3DJBacMjvy5jkmA71nj2cR4LlMNvDXhvpIlxSkmtcMR2Uho1k?=
 =?us-ascii?Q?zDJwTZ5nPFfQDHz9zJCRfOmAVpM5yAh8y24dVCt0XGnjW18GtW5izhQC45tg?=
 =?us-ascii?Q?oFd8CW822PrEaOE1BEc1ooiWu/wm/iFhtZmzHh88euwUhzK2kEGpImt4KB4Q?=
 =?us-ascii?Q?gPH8mPIl2/g/dXwRplGDTp1G/uH98oMT5yM3vGM1yc023fmRAW3WS+ATfknP?=
 =?us-ascii?Q?l5992senvmNEyQXHlbnv4dFZVVeexTp3QJBdifnog2XLNUgGWU5wWSH6uurF?=
 =?us-ascii?Q?jUu5IlhH8JjoZ/ghV1ksH1RFXZrybtKEeKdnPqhX8CRtuyg/coZ14mEwsCEe?=
 =?us-ascii?Q?1zE2MtGDrKQNoBp25Ta3PmYOt7wciMvbrcV00+dzP5t1tjThfvSjtrs5nVfH?=
 =?us-ascii?Q?0EKMmQysvTrUg/ueGR9b7Jxnis8/H2CL9a7fNdPBcz+xlwNNPzbHdcVQNSI+?=
 =?us-ascii?Q?UcInWY6/BJBkqDQxhJ11E5IUHm32/k67SdkZ8lA28d7h5UBmV0RE50cfde54?=
 =?us-ascii?Q?K4nBrB4EhKSEuxs+TLMBAeb6e5gXOy4vwLr4WJcpbdhXxVz6XQVgRZsCFf/m?=
 =?us-ascii?Q?fQ3Noe+ipvB/8pdY3YkgdrayzSMI3vumHJrP0bjXp2haU7BZ0QR3TT0g5pWe?=
 =?us-ascii?Q?KGof+ppRm5H8mGx31XAWkw7JisFQ13EG/HAZtzq1LaIft1YbY4eOA5YDFYQG?=
 =?us-ascii?Q?RPjrAwmQpFT4pL7zFzarHsfvGJJ/Nq5u795h4kEMMF4FUQ/JsZLTD8f13upH?=
 =?us-ascii?Q?biZdaJAWiOTS7N3KIlo8AseRazgYIbJCXraTy7p49h8wm+rjVzJvuoIbE0Ap?=
 =?us-ascii?Q?HkXblSvHd51tIcCaaXXglHyr6LcQYDoa61bOZE0gW76sE5linvZWRce3OvvK?=
 =?us-ascii?Q?02cvhetdR8AbUApNMYzfEYXR0TVjC3ECznCBshnEp812YTPPE3+KCBcgaxIr?=
 =?us-ascii?Q?kKPIUO1rYZZyKw4fujy75FB5P+Q8dJw9JTs62fyFREoySDxbMW02ApadpNxx?=
 =?us-ascii?Q?x3E64ZEDzXvKsBgqHSiHw3FzCSyihAgEwE0y/jXZKAKA4kpJyG7B05IocVfl?=
 =?us-ascii?Q?UfxZDjk+O1KCaEgI95v0JZdVPa63lQ6S37pssxEmkOE+paeKp82V92XrTTss?=
 =?us-ascii?Q?IA5WzbHZGnsBzv9O3xs7Z9B066h0YpIKaDgFHOMVOOVL9R+xGSmUocJlvri1?=
 =?us-ascii?Q?9fxiRmSlV88588vqwN8+vldJ8gga6/lrh1pkNSyyShtcKHKeEms9fYeLpjJ7?=
 =?us-ascii?Q?Bp8OpSw6aeaoGDrB8p09VJY9MdcSD3ZAoXKgDIfrjWxR03tbDUFRP61O98I+?=
 =?us-ascii?Q?c95PlHyBo6NxAYs96Y+nj3CdrZvIj9vlCY3tebDqcQjcB3v8D5nxj8UbtJT0?=
 =?us-ascii?Q?wxz2lsImy/WSItfV1OM8GVX7ZczyKq5W6hTb5JZV3IneMxGMop8Th/RHPUwl?=
 =?us-ascii?Q?Ypuc1/TZKpPxLeYHIpVclTZ7i0nP9irgo+0+J5BOX1mljVZaRCCbCoCWJhU3?=
 =?us-ascii?Q?Uv8L1A=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SA1PR17MB4593DE25C67A9229F65DEF4196849SA1PR17MB4593namp_"
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR17MB4593.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4981c03-70f6-485d-d4ec-08d998a9799d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2021 17:53:10.6001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LWrxNWUKRmVGYoJ+A2MkC9A3EENI47ctK+aTzqlodKXHW15rfj7sryO5Ky+UANQZFxRF9+Gwz9uvqvm0L9zEYi0nGIIiRgNrP6rAgOZ1hVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR17MB4158
X-Proofpoint-ORIG-GUID: snFIxMQtMAdoaJoh5inCz-qimuK7e48P
X-Proofpoint-GUID: snFIxMQtMAdoaJoh5inCz-qimuK7e48P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_05,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxlogscore=873 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260099
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

--_000_SA1PR17MB4593DE25C67A9229F65DEF4196849SA1PR17MB4593namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I am using openbmc-2.9.0 on AST2500 BMC.  From the u-boot, I could not ping=
 to any external node be it on the same network, or a different network.  I=
 configured static ip 192.168.0.81 for my laptop and attached wireshark to =
the same interface.  I don't see any ARP requests when I issued ping comman=
d from BMC to the laptop.  I see that link status is up from the debug prin=
ts, and also the MDIO status registers.  Don't see anything wrong.  Not sur=
e what/where to look for to debug the issue further.  Appreciate any sugges=
tions.  We are using Marvel Alaska 88 series Phy.  If this works, I want to=
 tftpboot the board, and flash the eMMC.  That is my goal.

ast# printenv
baudrate=3D115200
bootargs=3Dconsole=3DttyS4,115200n8 root=3D/dev/ram rw
bootcmd=3Dbootm 20080000
bootdelay=3D2
bootfile=3Dall.bin
eth1addr=3Dc2:d1:29:f8:1b:e3
ethact=3Dethernet@1e680000
ethaddr=3Dbe:f3:fa:8c:cd:e8
fdtcontroladdr=3Dbcf82138
gatewayip=3D192.168.0.1
ipaddr=3D192.168.0.45
netmask=3D255.255.255.0
serverip=3D192.168.0.81
stderr=3Dserial@1e784000
stdin=3Dserial@1e784000
stdout=3Dserial@1e784000
verify=3Dyes
ast#

ast# ping $serverip
Trying ethernet@1e680000
ethernet@1e680000: link up, 1000 Mbps full-duplex mac:c2:d1:29:f8:1b:e3
Using ethernet@1e680000 device
ARP broadcast 1
ARP broadcast 2
ARP broadcast 3
ARP broadcast 4

ARP Retry count exceeded; starting again
ping failed; host 192.168.0.81 is not alive
ast#

ast# mdio read  1.0-60
Reading from bus eth1
PHY at address 1:
1.0 - 0x1000
1.1 - 0x796d  =3D=3D=3D>link is up
1.2 - 0x141
1.3 - 0xdd4
1.4 - 0x21e1
1.5 - 0xc5e1
1.6 - 0xd
1.7 - 0x2001
1.8 - 0x4a38
1.9 - 0x300
1.10 - 0x3800
1.11 - 0x0
1.12 - 0x0
1.13 - 0x3
1.14 - 0x0
1.15 - 0x3000
1.16 - 0x3070
1.17 - 0xac08
1.18 - 0x0
1.19 - 0x0
1.20 - 0x20
1.21 - 0x0
1.22 - 0x0
1.23 - 0x0
1.24 - 0x0
1.25 - 0x0
1.26 - 0x40
1.27 - 0x0
1.28 - 0x0
1.29 - 0x0
1.30 - 0x0

Thank you,
Mahesh


--_000_SA1PR17MB4593DE25C67A9229F65DEF4196849SA1PR17MB4593namp_
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
<p class=3D"MsoNormal">Hi all, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am using openbmc-2.9.0 on AST2500 BMC.&nbsp; From =
the u-boot, I could not ping to any external node be it on the same network=
, or a different network.&nbsp; I configured static ip 192.168.0.81 for my =
laptop and attached wireshark to the same interface.&nbsp;
 I don&#8217;t see any ARP requests when I issued ping command from BMC to =
the laptop.&nbsp; I see that link status is up from the debug prints, and a=
lso the MDIO status registers.&nbsp; Don&#8217;t see anything wrong.&nbsp; =
Not sure what/where to look for to debug the issue further.&nbsp;
 Appreciate any suggestions.&nbsp; We are using Marvel Alaska 88 series Phy=
. &nbsp;If this works, I want to tftpboot the board, and flash the eMMC.&nb=
sp; That is my goal.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ast# printenv<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
baudrate=3D115200<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
bootargs=3Dconsole=3DttyS4,115200n8 root=3D/dev/ram rw<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
bootcmd=3Dbootm 20080000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
bootdelay=3D2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
bootfile=3Dall.bin<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
eth1addr=3Dc2:d1:29:f8:1b:e3<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ethact=3Dethernet@1e680000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ethaddr=3Dbe:f3:fa:8c:cd:e8<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
fdtcontroladdr=3Dbcf82138<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
gatewayip=3D192.168.0.1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ipaddr=3D192.168.0.45<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
netmask=3D255.255.255.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
serverip=3D192.168.0.81<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
stderr=3Dserial@1e784000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
stdin=3Dserial@1e784000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
stdout=3Dserial@1e784000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
verify=3Dyes<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ast#<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ast# ping $serverip<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Trying ethernet@1e680000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ethernet@1e680000: link up, 1000 Mbps full-duplex mac:c2:d1:29:f8:1b:e3<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Using ethernet@1e680000 device<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ARP broadcast 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ARP broadcast 2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ARP broadcast 3<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ARP broadcast 4<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
<o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ARP Retry count exceeded; starting again<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ping failed; host 192.168.0.81 is not alive<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ast#<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
ast# mdio read&nbsp; 1.0-60<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Reading from bus eth1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
PHY at address 1:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.0 - 0x1000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.1 - 0x796d&nbsp; =3D</span><span style=3D"font-family:Wingdings">&egrave;=
</span><span style=3D"font-family:&quot;Courier New&quot;">link is up<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.2 - 0x141<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.3 - 0xdd4<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.4 - 0x21e1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.5 - 0xc5e1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.6 - 0xd<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.7 - 0x2001<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.8 - 0x4a38<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.9 - 0x300<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.10 - 0x3800<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.11 - 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.12 - 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.13 - 0x3<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.14 - 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.15 - 0x3000<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.16 - 0x3070<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.17 - 0xac08<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.18 - 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.19 - 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.20 - 0x20<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.21 - 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.22 - 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.23 - 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.24 - 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.25 - 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.26 - 0x40<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.27 - 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.28 - 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.29 - 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
1.30 - 0x0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you, <o:p></o:p></p>
<p class=3D"MsoNormal">Mahesh<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SA1PR17MB4593DE25C67A9229F65DEF4196849SA1PR17MB4593namp_--
