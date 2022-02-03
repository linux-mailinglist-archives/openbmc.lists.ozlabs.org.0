Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB61C4A8080
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 09:39:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqBsp461Kz3bb2
	for <lists+openbmc@lfdr.de>; Thu,  3 Feb 2022 19:39:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=PPFxxfaR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=50331d0dc5=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=PPFxxfaR; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqBrB67yKz3bY3
 for <openbmc@lists.ozlabs.org>; Thu,  3 Feb 2022 19:37:46 +1100 (AEDT)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
 by mx0b-00268f01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2130r96d009740;
 Thu, 3 Feb 2022 08:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=+hfMNQVmUTPktZXNGXu3PRMjcAKV0YhtixK+OcSXW7Q=;
 b=PPFxxfaRJVCcEXBeIb+uq+pB8ZJMZbSkBlHntKHTWkVFYuGGyKHANkTwYcI0ggD9mDkb
 2uYATv4tMvLd4JOKyhiAZ+kx3OlB6tQL/Ii2F5HNY0gAzv9qAo+twHJWx/sMImWVUkwJ
 i1Icnt2yVEK3m/8GE2KIRxkBjQu0q8yGeF3MddSnh3rzIBuzwkUllKNMB/1vvzlLlsgk
 AjQNaveq0lTVRpvcvuV9JsjcLed2Sl7o0XAWeNJgcC9buueFA0wvMRY+UjKar9jKAaX8
 PuIkdKeAsSIJiC0XFFRN4rsYmzn90VNYyW6iBwmCggJ2HXxs9NZqyGQcBkqoGP/hpZsB aw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3e04wagy6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 08:37:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFBMx/WtKcbgCaTNiUA5Mp/QvIZZBFJL1jZiVeZnB8MV/Y7QihD2RoI8W9HHQSOJp/GKVRw8O0YJ01gC7enuqp/7zDwQCvlv34p+D95mvc1iOO7IfvLbL6yD8wgoUkzMndvpTRSV4ANs3zCe5OHCynF8v0zMDybFMvVT7oCm9UKk/P43YwiZwjekP0uudXtdnt1H0IQItvu8rmPCv8IK9TP7xKJEOOg63LNFoHeRnwk3aBrpO1cjrDRfyCc2bIQPWA25eZCO4eeT5zlZXZSGZz0/F1fW5Is7RAcDyvNEoc3eFDllX5DMB2312eqX0VDxlaiSyqOh0AE8kEaA0YUBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+hfMNQVmUTPktZXNGXu3PRMjcAKV0YhtixK+OcSXW7Q=;
 b=G59NlpPMEK/HNfwVBv0TH4ibrHDUOrS9NpOAVIBwKI2KPobLCKumb77hx+XCV4GimKiBQ+BvCRZAXNXTUpQ6cYj97YQCIL6Jj29E9boDX8Gr6IMb5f0ogigzIJj/GMY0ybMaKyx70wzz6B7nScskn6QURWPOhivA6594WC9AB07hRln24eSeBsLdn1ptfIsXo0/knJP64tMeilTvH+rFqREjV0kfwKJ+x4xIJB6fH+gTDsGe3hhtB8PBlFdx135HfAStPiDtZogrP3oHggBYhtQFUuig5IOt0CJa9/bVA3+687V8CV4ha1orEBEXiHeEryRvVjanRabOV/IQnrhgwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by MW4PR04MB7188.namprd04.prod.outlook.com (2603:10b6:303:79::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Thu, 3 Feb
 2022 08:37:38 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::1541:1248:d298:24d5]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::1541:1248:d298:24d5%6]) with mapi id 15.20.4951.014; Thu, 3 Feb 2022
 08:37:38 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [libgpiod PATCH 4/7] tools: gpioget: Add by-name support
Thread-Topic: [libgpiod PATCH 4/7] tools: gpioget: Add by-name support
Thread-Index: AQHYGNlMHNYwN6+snUewSjyG8gidRg==
Date: Thu, 3 Feb 2022 08:37:38 +0000
Message-ID: <20220203083738.GO5754@packtop>
References: <20220203042134.68425-1-joel@jms.id.au>
 <20220203042134.68425-5-joel@jms.id.au>
In-Reply-To: <20220203042134.68425-5-joel@jms.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: deac707f-da42-4f00-7275-08d9e6f06f66
x-ms-traffictypediagnostic: MW4PR04MB7188:EE_
x-microsoft-antispam-prvs: <MW4PR04MB71881471477FC8BBAA61ADA1C3289@MW4PR04MB7188.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3mFTX32h/CV2Y5XCh/x1GZlhdIT2iN7CtCX/WaaS8acFMgHHQZisq1tmTf7vN/sy2t2JHcPrQLvmqiwsOZEknOWSKkw+uiQz+Uv6/ujGZhIhGar+N3R6VushRX+JdTCDsZYOeWcTepPG6yFiMFUvnl7gd6f0gf5mDL9SvoLsnYsb49VCqTkAntxaWYxspdur59tyrpHTuh676Tf8J0rouKfDUEjw85GEhmhwu4O2d+cuj8d2Fu8sNUjwSYYEdhYocGd/b0pwOGGXfjCUceU09Vis6v4L/nUHyg+O4jqqKxyBI/X5xXOTB6eupJbcuQ7OgWI0pWLkKiICX1mv16hcG2o7wg1TOXm8gGQTGKt6VeaJR8L92hPikY8JiTpwZFhmtb+CI1cu2Bc+TnKH6lYDtyqFfTIPhcpFfNEWnf7TnLYr7z9PpERYNqbN4Ka+3Umt951LU2EvDE8EA7vMdrHiM5YYXgqLkn5x1LJ9k/kqxPHUviCi20LNKmoDVlnS08y7TXLmVifWHA+T9agp1/nLD5d/UuZbbvnZfROSZKluUFw4yBoiJozKZUC/bdMho07uKMyDmCi3yhQyO3jPm88yg9Za6+r66aHKkh83SukC4eX0qIgF11wsuvdiHqpCZ+HvxcuPRaNCuP4bfWr7BZEsDfwbKTz+mWRl/Tt6zDcRh37KMIJhvCUV3HM5wsjs0Tqnz/W9h3rGDvtaNHNdgQB5Tg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(7916004)(366004)(2906002)(66556008)(66946007)(76116006)(6486002)(8936002)(66446008)(8676002)(66476007)(26005)(64756008)(33716001)(1076003)(71200400001)(186003)(4326008)(122000001)(33656002)(38070700005)(38100700002)(86362001)(508600001)(54906003)(5660300002)(83380400001)(6512007)(6506007)(9686003)(91956017)(6916009)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j3Nwdh4DltmIhOjVNG8mYimXweszwDZZVuXKe1q6AjstlrxGY6rwpDr4yWWV?=
 =?us-ascii?Q?Vb0c7uOofMojtlHYsKmAF/n1eoVo34bJoPmYhjzvr0qRvBgs2R+uzhphHWSN?=
 =?us-ascii?Q?gE2zow5tXyubY1EK3dKo/KAdM02uvA4KtQDFSZbReNU8xiaRCA0+r6hJ3i20?=
 =?us-ascii?Q?lpAtNg3z7FVukQstlaaAAwIVuwnF1tXS+g+E5XEDybrB2f7wtgxWUh+NKeCu?=
 =?us-ascii?Q?7STJMRrYmDmCOBJeNpDNH/LUTdt3/8USmksq+nhUCz38n2hT5K51Iqx0Ke7A?=
 =?us-ascii?Q?OkETa1pc6iTYXOUn2Ymhngpbpf35ZgL6M14h1A0RkoatfgZkT1dg2iJ6CGXd?=
 =?us-ascii?Q?/37OX2ia5olawjcK325YsrXUITaATHtWx4it5L06EjOtfhvhA5ALdvDDAT60?=
 =?us-ascii?Q?NOoVN+OFOB4qKgAHeWnY9Hub9qTb3CtjhOCW8Bf2/Yih3uchIWofBddRew+m?=
 =?us-ascii?Q?0dxoJedT2t5hruMaLAqixMGULNLRHGAepcAXWU/LpGzJiXi30F9NSxpc2Nk7?=
 =?us-ascii?Q?Bdh+daoc9dV6UU/niGwtaQhLwG6H6CJdUlL484h9EMrpipwlCwtTUT7ymP3b?=
 =?us-ascii?Q?syoGJ7jW0126PxzHW6aE1Z3t2l6zbFhfKgzKqAakFTVN0j9xqyeX/Iw5Sc8D?=
 =?us-ascii?Q?8nzbDThr+rDVfS4jDqH87jmevLcdz502rdxmnNUW7yhNddUw83Uxxlc2CLQB?=
 =?us-ascii?Q?OhyrSs6YiMc+0jVuazLR5XNKcu7dT/cVn0+M1u+aI4pPWyRLW6Nz0YjD7A5R?=
 =?us-ascii?Q?jZ2XeXP5WNnT96D051pbt+qLqazbAr+C2s4D1nhJRno/io5pM1u8ZJeyUXJ8?=
 =?us-ascii?Q?sdA031odUIooRI1rnREkNYkMX+fXtcqyPGIU4wSTNBzLcoMsjKpKDtO02U8W?=
 =?us-ascii?Q?fpj1MCZr9M8iWGVGouKt7tuF0Ad10iEevXxapG8DLaSUNFpIlUs1bHP5nvO1?=
 =?us-ascii?Q?L0T331hLeLSKCEeL8LvE8i+TxyNymCUB8NLTXnolaebMtOQrhyFE9I02ipRu?=
 =?us-ascii?Q?Oj2NaRTVe9sRiO6dHuNTlOOeMXlV4Ka5vLyBFLsx4t7J8026LD3V7Ca1mi8W?=
 =?us-ascii?Q?IkhZorsZIK1FV9YKD8fzY/dwkBZlIaPN4NvvUyD/vXGrUrakR2R19wvn8K81?=
 =?us-ascii?Q?NzUtI5fIM7P3QVZuhH1jJ0kmkVIaZWXNxgONWRNUHXr9ZUzMg9mN1odocjOS?=
 =?us-ascii?Q?uUdBhgRPcTLvsnGsXNhKRzxIJJCtXCUnqFIG7Dbdm6ZfJPLO7J3RfmFsSOJd?=
 =?us-ascii?Q?5MYgZMBl4upTwXlU9dXcWwzMwZpnqxgC6Q8uIDHmQJSfySZ4mGGtsDz9Phwg?=
 =?us-ascii?Q?b+wkD0yc6phvct9SpqwbsU3Ztu3w0IJRZqjQ+YvD3m9In+zQxcAT7YP+6pr5?=
 =?us-ascii?Q?9b2IzMeDQ6lABOmKQSmzTB09qDo7OmnJ3iBotZDwUjpItaIfRxvUrP4E7XE1?=
 =?us-ascii?Q?GDVj3P1nwdzPWv6k1v/C8BIwdl1DAg5MGRJk7YimFb3mk8oLd8zTBJXKOJN1?=
 =?us-ascii?Q?dJX920YMo8nc7omv9TwM0nnMYkq8kDtkbtIctrVXYGwXqmk3hifKmc9jMkPi?=
 =?us-ascii?Q?AGohMF1Onv9+D7+NZ281w0upE9+6p/+3oMiAw78jaswcQg9+OHR+iicHVG43?=
 =?us-ascii?Q?JIRySCIX/15/Q8I6bTkGeWg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <60018C5E9AD359478983F37A592115B9@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deac707f-da42-4f00-7275-08d9e6f06f66
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 08:37:38.4223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EHTAKnMSSaDAOZwyMhC1PLn/+j1Z7rc36cSlEA7GcrTFDMI4/UvNgHkWTd64BDhA8gdgbLt0905ZQaPMSCSiUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR04MB7188
X-Proofpoint-GUID: gnl1RGeCYDzLEXqtz6MCHaVlEW6xiAjp
X-Proofpoint-ORIG-GUID: gnl1RGeCYDzLEXqtz6MCHaVlEW6xiAjp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_02,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

On Wed, Feb 02, 2022 at 08:21:31PM PST, Joel Stanley wrote:
>Allow users to get the values of gpios by passing the gpio name. The
>gpipchip is not specified, instead it is discovered using the same
>method as gpiofind.
>
> $ gpioget --by-name switch-state
> 1
>
> $ gpioget --by-name led-fault led-identify led-attention
> 1 0 1
>
>Signed-off-by: Joel Stanley <joel@jms.id.au>
>---
> tools/gpioget.c | 57 +++++++++++++++++++++++++++++++++++--------------
> 1 file changed, 41 insertions(+), 16 deletions(-)
>
>diff --git a/tools/gpioget.c b/tools/gpioget.c
>index 51cecb6a18a9..9d2c82b0d64b 100644
>--- a/tools/gpioget.c
>+++ b/tools/gpioget.c
>@@ -15,15 +15,18 @@ static const struct option longopts[] =3D {
> 	{ "active-low",	no_argument,		NULL,	'l' },
> 	{ "dir-as-is",	no_argument,		NULL,	'n' },
> 	{ "bias",	required_argument,	NULL,	'B' },
>+	{ "by-name",	no_argument,		NULL,	'N' },
> 	{ GETOPT_NULL_LONGOPT },
> };
>
>-static const char *const shortopts =3D "+hvlnB:";
>+static const char *const shortopts =3D "+hvlnB:N";
>
> static void print_help(void)
> {
> 	printf("Usage: %s [OPTIONS] <chip name/number> <offset 1> <offset 2> ...=
\n",
> 	       get_progname());
>+	printf("       %s [OPTIONS] -L <line name1> <line name2> ...\n",

I'm guessing this -L was supposed to be -N?

>+	       get_progname());
> 	printf("\n");
> 	printf("Read line value(s) from a GPIO chip\n");
> 	printf("\n");
>@@ -34,6 +37,7 @@ static void print_help(void)
> 	printf("  -n, --dir-as-is:\tdon't force-reconfigure line direction\n");
> 	printf("  -B, --bias=3D[as-is|disable|pull-down|pull-up] (defaults to 'a=
s-is'):\n");
> 	printf("		set the line bias\n");
>+	printf("  -N, --by-name:\tget line by name. All lines must be from the s=
ame gpiochip\n");
> 	printf("\n");
> 	print_bias_help();
> }
>@@ -46,7 +50,8 @@ int main(int argc, char **argv)
> 	unsigned int *offsets, i, num_lines;
> 	struct gpiod_line_bulk *lines;
> 	struct gpiod_chip *chip;
>-	char *device, *end;
>+	bool by_name =3D false;
>+	char *end;
>
> 	for (;;) {
> 		optc =3D getopt_long(argc, argv, shortopts, longopts, &opti);
>@@ -69,6 +74,9 @@ int main(int argc, char **argv)
> 		case 'B':
> 			flags |=3D bias_flags(optarg);
> 			break;
>+		case 'N':
>+			by_name =3D true;
>+			break;
> 		case '?':
> 			die("try %s --help", get_progname());
> 		default:
>@@ -79,30 +87,47 @@ int main(int argc, char **argv)
> 	argc -=3D optind;
> 	argv +=3D optind;
>
>-	if (argc < 1)
>-		die("gpiochip must be specified");
>+	if (by_name) {
>+		if (argc < 1)
>+			die("at least one line name must be specified");
>+
>+		/* line0 line1 ... lineN */
>+		num_lines =3D argc;
>
>-	if (argc < 2)
>-		die("at least one GPIO line offset must be specified");
>+		chip =3D chip_by_line_name(argv[0]);
>+		if (!chip)
>+			die("unable to find gpiochip");

The next patch has a slightly more informative corresponding error
message for gpioset; might be nice to make this match that.

>+	} else {
>+		/* gpiochip offset0 offset1 ... offsetN */
>+		if (argc < 1)
>+			die("gpiochip must be specified");
>
>-	device =3D argv[0];
>-	num_lines =3D argc - 1;
>+		if (argc < 2)
>+			die("at least one GPIO line offset must be specified");
>+
>+		chip =3D chip_open_lookup(argv[0]);
>+		if (!chip)
>+			die_perror("unable to open %s", argv[0]);
>+
>+		argv++;
>+		num_lines =3D argc - 1;
>+	}
>
> 	values =3D malloc(sizeof(*values) * num_lines);
> 	offsets =3D malloc(sizeof(*offsets) * num_lines);
> 	if (!values || !offsets)
> 		die("out of memory");
>
>-	for (i =3D 0; i < num_lines; i++) {
>-		offsets[i] =3D strtoul(argv[i + 1], &end, 10);
>-		if (*end !=3D '\0' || offsets[i] > INT_MAX)
>-			die("invalid GPIO offset: %s", argv[i + 1]);
>+	if (by_name) {
>+		line_names_to_offsets(chip, argv, offsets, NULL, num_lines);
>+	} else {
>+		for (i =3D 0; i < num_lines; i++) {
>+			offsets[i] =3D strtoul(argv[i], &end, 10);
>+			if (*end !=3D '\0' || offsets[i] > INT_MAX)
>+				die("invalid GPIO offset: %s", argv[i]);
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
