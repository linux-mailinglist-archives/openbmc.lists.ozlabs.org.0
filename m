Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F2A47690A
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 05:28:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDzcw4XnFz3bWT
	for <lists+openbmc@lfdr.de>; Thu, 16 Dec 2021 15:28:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=YVD3R75p;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=3984bdcbe5=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=YVD3R75p; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDzcP1XWvz2yP5
 for <openbmc@lists.ozlabs.org>; Thu, 16 Dec 2021 15:27:46 +1100 (AEDT)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BG4CkuA031522;
 Thu, 16 Dec 2021 04:27:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=EFIg9FBuZ6JkMwHLjJoWhKGx6D+NEdsHJ6o3DMqLyNw=;
 b=YVD3R75pUmwFyTu3P+74uye1p0EooZPc+gYCppQXbeM+QH4OflGT4zIZ5faszXaBOrC6
 OxR7iJu35qKlouvuMVKZHB2Cp4jUP2lfX2dmMf0cf8d4FSMg1CV9Z3dSYrexRAuGA1eM
 m1nEuuZyXVUqOg1xDYvy+IRgTlfAjlsGijRcO+nueSntIcTgrREXFEMEuu8+yWZEglr9
 sxXV3uQrkvLSvWvewMGCIqDCfYDHLcGJFGoTZtrq1+e1jbSLmho+Wam5gOq0TfY/iKB3
 ODqMXz1WfiFCCYv6N5ho/QxegfGl3zc8OBPnWXCl2F68VgMKFp9w2dZkz16bgSexr49Q wQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
 by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3cyrmvh0v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 04:27:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aunqhJqRy+rJ0Ijd/c3XyJjGakMGSZ5lY54ddq21N1a+DS3tJcRcu2/QOOjKVXpZlFXvOwOfeUmokPYcewKUeCGnFp/NG2Nz9uT36Nm6D5BwgRVzPeO/X0vBhQgRP+CLUzlKNlfaOa3jjLm1PVrtfSvU/24Lz4O1hvGNTRLtMDLnSks5q8dUr+fjM/UaklahVWr4I4zBzlOWz+MiztB9QJxw0faAGkhMikkiGRBA7yjJs+rlw9//PtN/h5jegrzsuTRIk6UWTGBxIZAp5GGaPr/xcUWuCr+cwMGxoCbYxhFyK7pzKK13jI8ZqAKunWSiZ+4/hlcIq8hTBjIdTTnqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFIg9FBuZ6JkMwHLjJoWhKGx6D+NEdsHJ6o3DMqLyNw=;
 b=ciaH0k8HSlNQib9zt8dB3XaEQ7L7su9710umYloVwXKDxcLQdx5LEqAQ5VsCa9I4f0O2BxwDOoiZ0+dTv4LVg4Ff6X1PoQRq2rBoPzZqDyJOtMh6oYZGuG/LhrQQUYO0xV3hSdoah/XjQuzAXkkItk/W21S7GvonDhN/0+Vmjtxe+cHZdkIkb/ZUPPLDlL6Gmy33cwilqcX2AK8719/kN8rMYBmb1Lq/iXtEGEr0d2nId6CWnzFG31xAWz+uE/6lqAtAPZ9A13c8uIyW2A+2HvHqawAZyABmiKBMJzEkpuIPinH7A88/A5+LnZcU1PMhqa5AKRDNLxvD530ueBEXWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (20.182.49.20) by
 DM8PR04MB7863.namprd04.prod.outlook.com (10.242.166.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14; Thu, 16 Dec 2021 04:27:31 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::7c94:793b:ee8b:f4f8]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::7c94:793b:ee8b:f4f8%3]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 04:27:31 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Oskar Senft <osk@google.com>
Subject: Re: Slow performance of VUART on AST2500 with 5.15.5
Thread-Topic: Slow performance of VUART on AST2500 with 5.15.5
Thread-Index: AQHX8jU9oJAP48eT6U+a2wqQ3eXeNg==
Date: Thu, 16 Dec 2021 04:27:30 +0000
Message-ID: <20211216042729.GJ25091@packtop>
References: <CABoTLcTACbnnPZ8dfc_oFwgoT5JikYBHgfTjzknJbqC98rLMQQ@mail.gmail.com>
In-Reply-To: <CABoTLcTACbnnPZ8dfc_oFwgoT5JikYBHgfTjzknJbqC98rLMQQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1254df8d-c5d4-4bb0-8f87-08d9c04c6006
x-ms-traffictypediagnostic: DM8PR04MB7863:EE_
x-microsoft-antispam-prvs: <DM8PR04MB78635C2736F654E32E248867C3779@DM8PR04MB7863.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kkq390HTtF4pX0rtnEUZfprc6rQTzbuJ2zs8h1ASDQxTkfW06Tgsbk5Dp28popZ2FQjHK59CO9aN2c/40xznUkJeAGNbC0ChYrX+h2luMLuGOhcXLftox+KIAqB5qonmRpU5LM/P1O39ojQRi6Z1/mLRGbZ7uR5UFCXXExj/u2gEz0B1EO5c5IoNnJx/5WoBPf3JF5rfXlq21hFEstarbEAleXZmjc5Pft9ZqkynjobZEOPl2IMDpFN69CXbNE/xKfh839N2GG0DgVxMiSR4aM28YqBZqJJNrzrGdZakE25GS6ajhQ8FCYNTdTzd7IztY+ZESX+i2Z1+TOhEHjji+eKaMdWf0ywMux5b8Ut0PaHEt4MsDrvOGmKn/bN7F42Ew5KfG9NGN+M0UdoX8I/2q8c9K2ymYw8brtKFqqD8jasdiHG1YZCmh4hPbl1FQ5d5lySecfCjGLCN1cdZY50dKuJk1woAIzAP6O2KVQiLddBbmhHY+lNip8H38+09XzLlf/xdacaUsEvm+M+r+7AFHfqe8G5dQr6aMQJ5rK77BguiuBuGyKY5gB+x3yL+EdT+keB8XRBsbKSZO9n9LD446qseeT+gdb9a0ZhHHkDSEqu7+QnSNfzsTRJTi2ziynx7q1zcLB1sV5qjnxdsbBTKoyJpPRZ4s9oIyV0b24W9kz0m12Uk2vrMF0njdWilnTcotEAs6hou4dTsnaOib1kBQ/YmqiX4gZbF6j8H9TC4QZcmfacq8Q0eRijsOAwVrLjMpnv7cDCdYZd+PSEdj+nCpc7HSq20iyhhJ/zUmBCqDgU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(366004)(508600001)(6506007)(186003)(26005)(6486002)(38100700002)(5660300002)(33656002)(122000001)(71200400001)(38070700005)(33716001)(1076003)(8676002)(76116006)(9686003)(8936002)(6916009)(83380400001)(2906002)(316002)(64756008)(66556008)(66446008)(66476007)(86362001)(91956017)(66946007)(4326008)(54906003)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9nnc7DfdbFz2Gs4oqAExA0upDOi6SWBrOZaC1EU0h2k8qpYW+Cn+8qmwsSzw?=
 =?us-ascii?Q?wUgwyf0wCY41EIFOSluvyz7O7CxVicq+fGA2FDlIXGvtiaQ+Tf4a+O4OW+ZL?=
 =?us-ascii?Q?Pq6xo/+Y9eIUazNWrnqa7gnF1ABFaqBF1HF5ZZpUPRal9TNdGo1K+Q7tWdGh?=
 =?us-ascii?Q?/70hcEZ4NqLCdWijfE03bQgSfr0/UHVLkL5plwaJK11SL0fE2Du13X++NVpz?=
 =?us-ascii?Q?zJTPV3jLKQoYs1xtEKbitOg67nRH9OE1FTesCt22FiuTZVy0mbuxgcNpG4AE?=
 =?us-ascii?Q?t4gl9pFscD8AgIsVGSg0wgz1iCtqZ0SaAgEgyBX6io4UTQ8IXaQhueK36EQZ?=
 =?us-ascii?Q?8XO3XDfHxk1jYiFLGK7QkcdHIiJsWAUHpF1hEOWgdyDx/Lwijgm39uNuPVGj?=
 =?us-ascii?Q?dWddF4BZPeuiqDWbUPCnYlSkyY7R6/Bym8D99i4fbRhzY6QN6cD8hh9gWK2j?=
 =?us-ascii?Q?xL53LK35lhjQQWMGIb2oB0W/aft60UQ6ibeXlnVNnnsY3JPZU3eSyYgnM4Ih?=
 =?us-ascii?Q?vA9fcjfQjexRR8F8PHzsbYBM/SWb+dxZ93B6/QnSgi9MeRA9lhsgZEzvZr2j?=
 =?us-ascii?Q?PBSRK//9d3YD1FQczxSlGeuRc1I5/Bgzmftg47BuE8OdPtseaNCIVaAlXDdZ?=
 =?us-ascii?Q?bQeSho+AV/gUH3lWQU0+Ct+4SpAkHESHz1YbVijj3iykGIAWwtB5AVySfM5r?=
 =?us-ascii?Q?r+k7wClUhd7co/y5L3t2Pp2LFztr6ydtuoL2R08Rcqy0wGRWFJORkEsaBeDK?=
 =?us-ascii?Q?PPbdm1ruR6svj2Y4tgFDbag0zQASMVXQx26YxmUlQUcGWmxTY32Dh0iyW4Sn?=
 =?us-ascii?Q?7anfGTbmw0SY22Sr3MFO/78Y/auQqhSsyMXuIZ6VC+3jh3XA26vtyCJfJAfx?=
 =?us-ascii?Q?sDUxc/KC+mG97iJxgnwi3E76DiUTHMq3rUGpGLK5vRhMtNVESCFrl/GhZ//o?=
 =?us-ascii?Q?/lbBg1pDae/GdcTbJ36pit66Cex0fNIU/UrYItFv8xUYKarMJi2AQ4hK+HUm?=
 =?us-ascii?Q?DzQjEUYOjGKc4QSFDv3U2tmrCcZMwGml3gmlsSas8Otpt/u9vpHr8U/loIqp?=
 =?us-ascii?Q?4ZVVhOD2J5P+qi3ivaNRtQRsA34hj6gtOeeqXUVaP4Xx7y31AeZQghxDVAQW?=
 =?us-ascii?Q?XYZUpZ1D8XjWJ8P6DEnBIpBbF1c5bcaTcEUJaRLOsHen4j+s5k+qB8Lfu/ns?=
 =?us-ascii?Q?H+j3kySbGW93lvCzO2B2LIzxwhJKHexiFBkMVeoLo9HEIyuFFsxurQ+o/3xi?=
 =?us-ascii?Q?+lDTZXl6Y7oYotc8q2KgosJeXYV70V53znE2OG77BEuz5djR4pORXt5mk+S/?=
 =?us-ascii?Q?o/vQATV62VNNDaoE2ZIaMTObPF3z9wADFReM/MZZIynDuELp5b9qYkQVJ0Hn?=
 =?us-ascii?Q?y3sY/TlBukQYj3nqLo5Y+DMvAoN4L9ZyGYfLGG1rOSBsutKS3lcV90cLmtgC?=
 =?us-ascii?Q?1a3hFWmB+q87uqCs5NjawIg0Qbl/7MGO4Z/E60U1PZOyYP8G2G5EqR++TsXj?=
 =?us-ascii?Q?RzbH/o7dw1Bz60rYXk3ohBtuMJuVfNKrH788ymqRM/wBMtymq1gFc2LSexuK?=
 =?us-ascii?Q?r6NBZZ+8M2jgbirZQKUMtLSCvhADX415jXv3EHqbX63qVwxmqmmnoJwRkuoL?=
 =?us-ascii?Q?LCTK4JfslJ8v84VNFEa+kFg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B9A15EB4E00D3144B46E7FEC873B8F18@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1254df8d-c5d4-4bb0-8f87-08d9c04c6006
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 04:27:30.9945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 46tI5k+S2dbmG/Fn6rjQWLzBRErBFZ1KkshiW+XLpFZrLry62jDrQsUSijNrgkCIKSn/oMdcgN5Sr4+B75GqMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB7863
X-Proofpoint-ORIG-GUID: oIqOeHqwn0f-BhT1Q1VeL7AimHG5oc__
X-Proofpoint-GUID: oIqOeHqwn0f-BhT1Q1VeL7AimHG5oc__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_01,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=999
 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160024
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
Cc: Jeremy Kerr <jk@codeconstruct.com.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 15, 2021 at 07:38:36PM PST, Oskar Senft wrote:
>Hi everyone
>
>I'm doing some more validation work with meta-tyan
>(https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/*/49181 ) on the
>current 5.15.5 kernel. I noticed that when using ttyS0 from the host
>(being the VUART in the AST2500), that the transfer host->BMC is
>really slow (like 300 baud slow). This is true even after stopping
>obmc-console-server and just doing `cat /dev/ttyVUART0`, so I figured
>it must be a kernel problem. When I then tried kernel 5.2.11 (with the
>DTS from 5.15.5 minus the uart_routing node), then VUART behaved
>normally. After having done this comparison, I think that 5.15.5 is
>generally just much slower.
>
>Is anyone aware of AST2500 VUART (or something else that would affect
>performance on an AST2500) having gotten broken somewhere between
>5.2.11 and 5.15.5?
>
>Thanks
>Oskar.

Yes, this is a known issue.

Prior to commit 54da3e381c2 ("serial: 8250_aspeed_vuart: use UPF_IOREMAP
to set up register mapping"), a long-standing bug in the aspeed-vuart
driver had a side-effect of unintentionally leaving the VUART's FIFOs
disabled.  With that patch applied to fix the bug, the FIFOs get enabled
as they were originally intended to be, but that in turn seems to expose
another bug with the host-side THRE bit not getting set when it should,
so the host-side driver's write routine ends up waiting for a timeout to
expire on every character (when it would otherwise continue on to the
next character upon seeing THRE asserted).  I think this may be a VUART
hardware problem, though that hasn't been officially confirmed thus far.

I'm hoping we can land on a better solution, but as a temporary
band-aid, hacking the driver to treat the device as an 8250 instead of a
16550A (effectively just re-disabling the FIFOs) should speed things
back up:

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/seri=
al/8250/8250_aspeed_vuart.c
index 2350fb3bb5e4..c335f2b482bd 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -487,7 +487,7 @@ static int aspeed_vuart_probe(struct platform_device *p=
dev)
 	port.port.irq =3D irq_of_parse_and_map(np, 0);
 	port.port.handle_irq =3D aspeed_vuart_handle_irq;
 	port.port.iotype =3D UPIO_MEM;
-	port.port.type =3D PORT_16550A;
+	port.port.type =3D PORT_8250;
 	port.port.uartclk =3D clk;
 	port.port.flags =3D UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF | UPF_IOREMAP
 		| UPF_FIXED_PORT | UPF_FIXED_TYPE | UPF_NO_THRE_TEST;

--

Zev
