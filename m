Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9F84A8085
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 09:39:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqBtf0CV1z3bZL
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 19:39:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=hHPEGLP1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=50331d0dc5=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=hHPEGLP1; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqBrX60rNz3bct
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 19:38:04 +1100 (AEDT)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212NKbWK000766;
 Thu, 3 Feb 2022 08:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=m/CfyAh70E//DSScjArv1CP0EmiMFFgzOo1FU1dYcFk=;
 b=hHPEGLP1KwhwPVQ87bRf9p594o7bME2DcFff/XEjxwzLsk3IfALFT/rqIzOVZ8zApLaL
 NB+y9ZIlC4g+/gnUE36EwJbKSkUPU4v1/80BZjWZYQLwQwZWhenhYUL5e38SBY2qth9f
 WaRWbO9zxeGgLbXArUMQF0UqKnujZ3Fs080NyRMNX7fPr63c9154aZrTSkiLL97vroJW
 Gdic/tX7pMlGbO6QqqOA5w+/GJTai6tfyGlf5qz8YgZ9Eg4gqQ+ijvtLFogK+tWzNTB7
 sucosXNHjjGorDaDXxy42kHry3Fb1YF7GZfZoJGw8nrYlLxy2aaHAd3ELRtOd+ZId+3H SQ== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3e03hys57u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 08:37:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKSfylx585NgTiLl7EG3O4o+PRoToQ3maEZu71KuVYTJqDPGo/3Z7Alo+VImdZOt9qkTpQmRveWouNKGasr5Onfwb1u6NtbmYpfODvFUnl+nw+GsLkp37oqSxIHmCRbKc1P6cVim8bGuEGeBnDvyrRKPVI3UP1waMx7C3mklxneBmYW2IeCUszmiFqscffdMK4nu7Nupq/Nf7rs7nOukPK/ej7+yhikL/R6ZLNqZQqomvK9RA1hON8mKHSfmMTIT6AQCyM+1n/y54OQeJXj/+WS3fW2LDWA8rWod/otoFrGRycRm4ALOlqirZJ/VKsUaP4Z1e/loWmZwT07au0EBww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/CfyAh70E//DSScjArv1CP0EmiMFFgzOo1FU1dYcFk=;
 b=dBEsmAMSgjoPyL+wLAwkySftwAoKqJ2V/AW1n8/M+pflch/uNn2n4LgF4NWy+rCbpSAv3deFLCkImVJjFiS8v/FZ98xDk1h98PRLs76ZtU62CYBwJUWBXaPhSbkqXhsujNcR4+zhlwFTS98SpcAj7ja73UOpZ/29MFZ75v+ARu8dxOkEpcnSbdi49+yMlK4y8joBG8HcK4HoCkksMJwy0kFfKtEg36oABfCxf+pGbt0Y1kVAzdzwih6zqDVp2OOfFf5o61jAscqr8c1mZHZRkvAGjayPxpiJhVOQFj+T4WhXk1MTv/INMAEDu8ScvEjJSYJXJSY8Aalvj0b2YB/64Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by MW4PR04MB7188.namprd04.prod.outlook.com (2603:10b6:303:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Thu, 3 Feb
 2022 08:37:55 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::1541:1248:d298:24d5]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::1541:1248:d298:24d5%6]) with mapi id 15.20.4951.014; Thu, 3 Feb 2022
 08:37:55 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [libgpiod PATCH 5/7] tools: gpioset: Add by-name support
Thread-Topic: [libgpiod PATCH 5/7] tools: gpioset: Add by-name support
Thread-Index: AQHYGNlW1+ZlNbIB9UOAc/4cWIQOtQ==
Date: Thu, 3 Feb 2022 08:37:55 +0000
Message-ID: <20220203083755.GP5754@packtop>
References: <20220203042134.68425-1-joel@jms.id.au>
 <20220203042134.68425-6-joel@jms.id.au>
In-Reply-To: <20220203042134.68425-6-joel@jms.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ae655cc-d379-4a28-851e-08d9e6f07982
x-ms-traffictypediagnostic: MW4PR04MB7188:EE_
x-microsoft-antispam-prvs: <MW4PR04MB71882538F95B537F2D1FD859C3289@MW4PR04MB7188.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8v2faLtXctNHyKfahu9WRNUS+rcSf+lzazrBkU+RvmORycWSo6mYOnT4xdh7//FYivdcvtAOKfeZ2xHHrsfiTyO5D5m5k0U6kZEuYHAYNbh/LvwGhpd7JF1s2ETLbbIVqwWOmRpnvrL5+3EAI0QV/FimM431C5MvDJL21Gm86vAnpG78jBmXt5wiQ/AjI0lh7wEZ0tVQam18oq319mAVxVJf529FfcuhVLTtBxNEfMMaA4hqIvNwclWBKVWXEyQgbXa2t3RiW9ZUWo9QFqiNphuYbuOJgmwoqNrMN3jCBNnRew5uy0UnWwuOnP7v+4tkwAwc8spVYAr6pcW3wnrrEEPh9OMgj2TTiafvIwJP1y6PpmzX2czkqkyNA0/Y31mOPJHjY9vLNFaAHPyyGv/wkAcP8iyzIOHQ09I6Ikm/ZSikWhY+3DTeXiUb80nnKAM9AKlhGlyQu0LTVUAZCpy/HWQ3Mf6LkvIoFWqTKqi1bN/6VbCUpb2z6N+yKaHR0/JQFtgEB27r7uglJOxSL8LwpFy67rRA3U3eh0t8soml0E1xnwxc/D0PaCDnsEYXXPqz+MBjXBFkTvR3YTNlCBUegNRwPNWTtaJ1iGlq1kUcVcFa6RLj6Nu3KtSOpwgRyBJLelian+wSx1MJXBkm9F5isXbKbYA7mHHmtawt1agYVXapKuTdBJVFpJ6TFngqoSCmrq9okcgP48YLRag9tJQThA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(366004)(2906002)(66556008)(66946007)(76116006)(6486002)(8936002)(66446008)(8676002)(66476007)(26005)(64756008)(33716001)(1076003)(71200400001)(186003)(4326008)(122000001)(33656002)(38070700005)(38100700002)(86362001)(508600001)(54906003)(5660300002)(83380400001)(6512007)(6506007)(9686003)(91956017)(6916009)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?94k2sG5xWUoHdIAfB62Mcg2xlGAmmuRgARpG/X94ptv6VW0DjiqTPUplMg2u?=
 =?us-ascii?Q?uAwxBawOpuJE2wSR2jDJ7yyG5icKbH2x2T0GI+v8xtNBVmq5+6I9pUj6xnVL?=
 =?us-ascii?Q?DWX96dKup6yFqngYppZsa6bssCILjT19EDSvx8ek8Pm64NaY9igeCuqSO5XF?=
 =?us-ascii?Q?BRM8SF0zfxBQqxww1HW7T4x+5AeV54W/JrPsODI/WvPSNpLWCqZN8MmTV+Lp?=
 =?us-ascii?Q?owmDiAZ4cemoocBmmWlKdkP0/vkkwm1eJVbtVa0BPiMUnYdcxcnC96XZJKA8?=
 =?us-ascii?Q?lr4FsODTdb0i0KziTsOV6jBZdrtd7glHofMW2b/miHLKfxLCkoKEm8wbVXzs?=
 =?us-ascii?Q?IHul1HiNJV2RP5yGCf+1lKnYYP4v6dBbRwirsg6f0KfoVQki1HrlZDY8yAjy?=
 =?us-ascii?Q?7yhSRB8bvivsHocoismWiKOqZ05hcso1mURRY+LJrO4rOfY1aLKyQCgLrliJ?=
 =?us-ascii?Q?tBzhyhwy1hhLlghZsjsLw5w25La2T+yDszkQu/bHlsZWYF5e1AejSQLX7rpm?=
 =?us-ascii?Q?8okiJuASpm9LbJbK1QrDG+HMATWS2I5mMQmE3YQk3QhcFXrnPT1lwHKuW5eT?=
 =?us-ascii?Q?jt5NLCh91eWKPQz4d742V8i/2Q0eUPcMVs8PmWgvhgVxT9TOuW9dGfqzvdKp?=
 =?us-ascii?Q?3oWAM5d8gbXkL2Y8KBV4jkY0Ag8+m6qzYYc3KdLu+cCJuAsijROG77GRUYWj?=
 =?us-ascii?Q?rCCDNQChNAqjAOfyfw+YIJMgwWvD5WSa3UIwyL8FKxR8FhU9iIDjd5Ii3IiK?=
 =?us-ascii?Q?xABqJmisA8yxIqcViGRa+Ukcyr+0O8LY0myPx7PhdcgNcC3ILu8ixyNO9SU+?=
 =?us-ascii?Q?eK0JfQJxicxMIKLPZgn0G9Z3qyov3tJQIGYRmvNZ59AZiobSJWFm3h6FZ6K/?=
 =?us-ascii?Q?bGMSr6RPaoNs6UtEmyKQtShle92IUUbsV0X7waeTJPved2puVSSsiTEolTuE?=
 =?us-ascii?Q?VbxowFjVjWsVmSUI/7WloWoWBa5LpZifOjKJtX4d9j91s73RKvASJXuUvjdS?=
 =?us-ascii?Q?xW3/lFVq9d2vLXyXS2MIafgGIytEVsUePxMaWmTP9WxjBYA7TIUJK/+RwhQy?=
 =?us-ascii?Q?GN37RTGdXkndMoDFFTOaxTcZ6hZbv+FEfDl3tjloHcFUZSEjerqifbrA1oQL?=
 =?us-ascii?Q?MYnX/6/yaDNdu6lx8I244/Eg6M4rNA7rDHYmZv0scOhcQohLvxJ9UgmN5K4y?=
 =?us-ascii?Q?D+BL+ElB5aUr2+npnPLYbtIoHSXZ3W6mq6TBenVz4XZsQ8gSwNA5spMugvrm?=
 =?us-ascii?Q?7F5TrBZDWHIZEfzNO0s6nCmZ27t5aFIIivZkdT2mnuGw6sFw5GKdq16lOLAN?=
 =?us-ascii?Q?198RyLHhhnpfXpXGKogxKNlhRwsGDvh9uC0VEpUoWHHudT7JLaswkEEyVSYa?=
 =?us-ascii?Q?xIgfliq1ijslvPKWa9m4AdWOoE/z74f3/RYFX/xMgBgeyThdouly0U5jpPHm?=
 =?us-ascii?Q?tfCILV+prugqjPXnp2RnN9cwoxt7nDriZnVyb6QazLA03O9rU+gOLtmn5Zct?=
 =?us-ascii?Q?oD7lgMB3+AUBxVeZjKdPaf/KZfT+AorqKGD1L7MhvuXJ+bTGgztMFHKken2F?=
 =?us-ascii?Q?v2AfWUyy1rLbVnp0QpC5Fo44k7hGGN8rr9Sp0ciFk/5W7NuOqZvPuWJ87H0y?=
 =?us-ascii?Q?ZAulkyzUpb0Ocer4JOmY0GE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3E29DCBCCBAAEC4B9DEC62576B204674@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae655cc-d379-4a28-851e-08d9e6f07982
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 08:37:55.3521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Eers1Bhl/JLIOu/wCrh+bVjjwdlQv3g8mWNuVbsSlsZxJqPBIVDBLkPti/niQgsvLu3O/qfq8cVHwWiGrD1/qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7188
X-Proofpoint-ORIG-GUID: CnzWjZnAlGIv0sHbWw6i0Hzfejg2rU__
X-Proofpoint-GUID: CnzWjZnAlGIv0sHbWw6i0Hzfejg2rU__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_02,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030053
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Feb 02, 2022 at 08:21:32PM PST, Joel Stanley wrote:
>Allow users to set the values of gpios by passing the gpio name. The
>gpipchip is not specified, instead it is discovered using the same
>method as gpiofind.
>
> $ gpioset  --mode=3Dwait --by-name cfam-reset=3D1
>
>Signed-off-by: Joel Stanley <joel@jms.id.au>
>---
> tools/gpioset.c | 68 ++++++++++++++++++++++++++++++++++---------------
> 1 file changed, 48 insertions(+), 20 deletions(-)
>
>diff --git a/tools/gpioset.c b/tools/gpioset.c
>index 7882b53bab41..fe3e1c246c89 100644
>--- a/tools/gpioset.c
>+++ b/tools/gpioset.c
>@@ -23,15 +23,18 @@ static const struct option longopts[] =3D {
> 	{ "sec",		required_argument,	NULL,	's' },
> 	{ "usec",		required_argument,	NULL,	'u' },
> 	{ "background",		no_argument,		NULL,	'b' },
>+	{ "by-name",		no_argument,		NULL,	'N' },
> 	{ GETOPT_NULL_LONGOPT },
> };
>
>-static const char *const shortopts =3D "+hvlB:D:m:s:u:b";
>+static const char *const shortopts =3D "+hvlB:D:m:s:u:bN";
>
> static void print_help(void)
> {
> 	printf("Usage: %s [OPTIONS] <chip name/number> <offset1>=3D<value1> <off=
set2>=3D<value2> ...\n",
> 	       get_progname());
>+	printf("       %s [OPTIONS] -L <line name1> <line name2> ...\n",

s/-L/-N/ here again, I think...

>+	       get_progname());
> 	printf("\n");
> 	printf("Set GPIO line values of a GPIO chip and maintain the state until=
 the process exits\n");
> 	printf("\n");
>@@ -48,6 +51,7 @@ static void print_help(void)
> 	printf("  -s, --sec=3DSEC:\tspecify the number of seconds to wait (only =
valid for --mode=3Dtime)\n");
> 	printf("  -u, --usec=3DUSEC:\tspecify the number of microseconds to wait=
 (only valid for --mode=3Dtime)\n");
> 	printf("  -b, --background:\tafter setting values: detach from the contr=
olling terminal\n");
>+	printf("  -N, --by-name:\tset line by name. All lines must be from the s=
ame gpiochip\n");
> 	printf("\n");
> 	print_bias_help();
> 	printf("\n");
>@@ -195,7 +199,8 @@ int main(int argc, char **argv)
> 	struct gpiod_line_bulk *lines;
> 	struct callback_data cbdata;
> 	struct gpiod_chip *chip;
>-	char *device, *end;
>+	bool by_name =3D false;
>+	char *end;
>
> 	memset(&cbdata, 0, sizeof(cbdata));
>
>@@ -239,6 +244,9 @@ int main(int argc, char **argv)
> 		case 'b':
> 			cbdata.daemonize =3D true;
> 			break;
>+		case 'N':
>+			by_name =3D true;
>+			break;
> 		case '?':
> 			die("try %s --help", get_progname());
> 		default:
>@@ -257,37 +265,57 @@ int main(int argc, char **argv)
> 	    cbdata.daemonize)
> 		die("can't daemonize in this mode");
>
>-	if (argc < 1)
>-		die("gpiochip must be specified");
>+	if (by_name) {
>+		char *line_name;
>+
>+		if (argc < 1)
>+			die("at least one line name must be specified");
>+
>+		line_name =3D split_line(argv[0]);
>+		chip =3D chip_by_line_name(line_name);
>+		if (!chip)
>+			die("unable to find '%s' on a gpiochip", line_name);
>+
>+		free(line_name);
>
>-	if (argc < 2)
>-		die("at least one GPIO line offset to value mapping must be specified")=
;
>+		num_lines =3D argc;
>+	} else {
>+		if (argc < 1)
>+			die("gpiochip must be specified");
>
>-	device =3D argv[0];
>+		if (argc < 2)
>+			die("at least one GPIO line offset to value mapping must be specified"=
);
>
>-	num_lines =3D argc - 1;
>+
>+		chip =3D chip_open_lookup(argv[0]);
>+		if (!chip)
>+			die_perror("unable to open %s", argv[0]);
>+
>+		num_lines =3D argc - 1;
>+		argv++;
>+	}
>
> 	offsets =3D malloc(sizeof(*offsets) * num_lines);
> 	values =3D malloc(sizeof(*values) * num_lines);
> 	if (!values || !offsets)
> 		die("out of memory");
>
>-	for (i =3D 0; i < num_lines; i++) {
>-		rv =3D sscanf(argv[i + 1], "%u=3D%d", &offsets[i], &values[i]);
>-		if (rv !=3D 2)
>-			die("invalid offset<->value mapping: %s", argv[i + 1]);
>+	if (by_name) {
>+		line_names_to_offsets(chip, argv, offsets, values, num_lines);
>+	} else {
>+		for (i =3D 0; i < num_lines; i++) {
>+			rv =3D sscanf(argv[i], "%u=3D%d", &offsets[i], &values[i]);
>+			if (rv !=3D 2)
>+				die("invalid offset<->value mapping: %s", argv[i + 1]);
>
>-		if (values[i] !=3D 0 && values[i] !=3D 1)
>-			die("value must be 0 or 1: %s", argv[i + 1]);
>+			if (values[i] !=3D 0 && values[i] !=3D 1)
>+				die("value must be 0 or 1: %s", argv[i]);
>
>-		if (offsets[i] > INT_MAX)
>-			die("invalid offset: %s", argv[i + 1]);
>+			if (offsets[i] > INT_MAX)
>+				die("invalid offset: %s", argv[i]);
>+		}
> 	}
>
>-	chip =3D chip_open_lookup(device);
>-	if (!chip)
>-		die_perror("unable to open %s", device);
>-
> 	lines =3D gpiod_chip_get_lines(chip, offsets, num_lines);
> 	if (!lines)
> 		die_perror("unable to retrieve GPIO lines from chip");
>--=20
>2.34.1
>=
