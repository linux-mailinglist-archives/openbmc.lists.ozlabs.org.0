Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9E7576D30
	for <lists+openbmc@lfdr.de>; Sat, 16 Jul 2022 11:48:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlNhJ5BfJz3bkr
	for <lists+openbmc@lfdr.de>; Sat, 16 Jul 2022 19:48:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=fHLeT3tU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=0196a270f4=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=fHLeT3tU;
	dkim-atps=neutral
X-Greylist: delayed 2316 seconds by postgrey-1.36 at boromir; Sat, 16 Jul 2022 19:47:48 AEST
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LlNgm4Jrzz3bdM
	for <openbmc@lists.ozlabs.org>; Sat, 16 Jul 2022 19:47:41 +1000 (AEST)
Received: from pps.filterd (m0165120.ppops.net [127.0.0.1])
	by mx0b-00268f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26G7HwL7004315;
	Sat, 16 Jul 2022 09:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=Xxn/9qL7qLru3zA2Y8jgz2IsmaDLhQF0H01TTfgLS5g=;
 b=fHLeT3tUF6mgEIJ5KMFRhpznIX9d9Wejlslz+XK7ldzN9bt3xyixLw5sZTAH3OsUMq+G
 8jX+VPM23CLYtYPXshMwISpxUXLDBG47Jl1okhKadfO10ugFvu5fgYhJz3Ql0FM0cvGY
 XHMZqRbXDbwtC4BAB1oFaEbTb8WK6MXPS4exmi6vL6UcCDU9uWhXUanpRiUfSdvqdkVm
 xNeiK1MfktfC6AFRH7+hJwQTOyKs3FASXtA5yOm54TvH0mzvKzkz6C96w4zBti/IgOc4
 ZmugiwX1cs9TuU2trxJxOSEXVPuA31sPn5Qo3LT54v5OzTKvj6WOXFE6FR1r38xE72zv jA== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3hbrtq03hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Jul 2022 09:08:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnUVg3sn7FS82lZEcY55jOjZN4k947Oo67/h3+y4CflvwiQZDFUHzDjj3O9IkLmmyR7wPtYOut+Fh6wBxqg4cJyEBruig7bQj+12hlh5TwCXsaZmA17zzUgwC7T8didn27alcZsAwlxLJHbOZKun4rTyzYqsRGjVdyYSKbdinv92vAVLnEWE9NBbxYQp6TuJYOo8vnm3smFdlNkCBasEfUFIjbuBVJ+3IK/5UTOZoiTt4Z36L0UcufnF5oqx9LvtqazzCOXdoG4KFpJ4epHZaS2LU8Refm101ZLgB5M1E8iI72UeK0PeqQlWL9wAF4eP1yRLJHbqmNsy71qPFrt7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xxn/9qL7qLru3zA2Y8jgz2IsmaDLhQF0H01TTfgLS5g=;
 b=EAlOowhvjTGF2nJZiSkvS7URrTMMeLBl6ldLYD4HxbItO8pNAkovVZzywDGMTfdCrEJGGPqxbKKH0lLq808tN0vtUgieZwn1cTu6L4qehTgV92lcE7o6Bhc7nMMwLXv2+guXDt86vTVWCR9aG5p7Oam+p2LluJAyxaRu+m22ZfexsJUYgOXNqB5ndnJ8i8JoNSzWFaFUE07T7G8AY8EeZIazmbTWfJ1y04hjBDKnvqssXwzsRkecVaL2T+JDGMhKbr8gMHeKpA0QZPVrkGzDKwV8VeoEWpd9yAVSHXXYrc+kgyf2LdQlLATTKQlIXyn1NO6ldfpzD+poziHUwMejqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by PH0PR04MB7191.namprd04.prod.outlook.com (2603:10b6:510:1c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Sat, 16 Jul
 2022 09:08:47 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::9890:b657:c8a:cffe]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::9890:b657:c8a:cffe%7]) with mapi id 15.20.5438.020; Sat, 16 Jul 2022
 09:08:47 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] otp: Reduce size of struct
 otpkey
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc] otp: Reduce size of
 struct otpkey
Thread-Index: AQHYmPOoAenLh4/HD0+f/fGQiXiXgg==
Date: Sat, 16 Jul 2022 09:08:47 +0000
Message-ID: <20220716090847.GC9659@packtop>
References: <20220714074552.818306-1-joel@jms.id.au>
In-Reply-To: <20220714074552.818306-1-joel@jms.id.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 35a7af96-4855-4b13-8c72-08da670acaeb
x-ms-traffictypediagnostic: PH0PR04MB7191:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Wd6nvDupRrJkZ3WiBWRSw58/IAEtmbORz0WDjOS7L999t7bLtFARa2nO3B1C/171j08H/aaGHIbOcyuimRRG9u0McRL+1rxfzXtpTbCdCeQyl8tK0k0wsCHuG1enxY5aq1o2ngdF1oDCUAym+BSlw9IBIF5udEcsic7jfdW3IxNJixL6M+37fpDO18tPSZacHmyO8zXBA76vQ3fcTbytiQemlfnOQmKRSZCCjCg0sKsWoabutv/sz/C9RvKpt/gWpwy99xmqWUHYS5O3E31fcCLvlHCSaQs4kDFJNDcDTQDYzjaOEt2SZmW4o68KMBnIPat0Ps3FK6w4uteCfXKARBfI/ZzyXHz4ybK/DXbYIAA9KdSwDydvROEWLdtfpQv4QmcO4L3q4DbbfWbg5MsPCRckJwbz5BDEMKUFRKAZhLPk5CXOkr3CbZNYlhULsZazonTfLwaZ+pT6rLON3QDmYjJ9LUHL3eQwpYi5a+3dXv0z4YunAkevGCbav2SnaocKKZSryteBY4UewY4hv5XwssUXMye7sC3BB5aNg/gkVEKIllstDwwDUl7UDE3s/xTx1uQm2aiRr6C1pmponKwIWSSL0PHBfHmNW1ljKlJoGGs633BcmNbvMlMizzEXCdJ3rtx5s57Vd1L0FKs7RimmmOBIoajM84fOJsij4l2EFB0mxMqmf4WW94hFqeKlxYVMNNIzjwRhhOjoPy0VjH2XamigfRZMvvXBoobULS358AXcY+1doe7gabjXLUh3NWJn6sUDWXmHuLtcrmpN9aRlG68bsMCUHnwnYrGNyJ+YBpgCwt691NDH04zQO2k4Xram
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(7916004)(376002)(346002)(39860400002)(136003)(396003)(366004)(2906002)(26005)(478600001)(91956017)(76116006)(5660300002)(33716001)(41300700001)(8936002)(6512007)(6486002)(6506007)(66446008)(9686003)(83380400001)(33656002)(186003)(38100700002)(316002)(66476007)(54906003)(86362001)(4326008)(1076003)(71200400001)(8676002)(64756008)(66556008)(66946007)(6916009)(122000001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?Ux5jbPqzQMQNbHjeWHQgbSTsj2CwR/bVkicAsFTukPdgW6Xt0lPLPqw1d5?=
 =?iso-8859-1?Q?rSulNBDuZecg8+psspJKw8Wv38cq2mHHAL2fEvs0OLM0ea49JqQA1RT7MI?=
 =?iso-8859-1?Q?Bbb8gW5MKraNnNmGeiAB6Ot/cw0yXSxoUkh2HJrc6gnG1U+aehfasRtjG2?=
 =?iso-8859-1?Q?bbVRENEl4FJFssidlpF8hWtfgL3Z+8E0vpbPfi1eCyK/DjukQHV49VGn16?=
 =?iso-8859-1?Q?j+8JTCFScOHOFdmrf36jzBXskOB8tmZI+jOchhYh3jR4JBK2Q0p3ZwRPu+?=
 =?iso-8859-1?Q?FwXgWIOD0FuP3ayEildpU98p8l/7A+9gG5ZDGlT3NJ/FrzBSR91UOjsQop?=
 =?iso-8859-1?Q?vOriKiIltQQHp1lxcm1jgBORfzZhbDG3q/gM7/ztMNcdX/ERo20PUsNYBi?=
 =?iso-8859-1?Q?J47OnBan4yM69/BwE9ROG+M2Rsrc+QyzNMH38bKKnirIGMvB/Gw77hpSEv?=
 =?iso-8859-1?Q?YweSSXMcy/KCRg2bphXQRiLHyQHwakBZ3Si/U8i735wLQNsglTZyobe8aN?=
 =?iso-8859-1?Q?thYrly8gKaIZQwtPs3mC67hjYSpw63kd/KfzsAgWMZbbwWd201DIZ1iC5O?=
 =?iso-8859-1?Q?jvSrtF3E7CI8IsCT5sIDZjVByjTOuKJBHgKPPSOCUprcOJLfTeUelCYUHJ?=
 =?iso-8859-1?Q?0AVhQEhib6UhpPteaMungM/TK1PVz3B6l4qeO7cH8RVjlw4FRYDzT5BEu+?=
 =?iso-8859-1?Q?QdYh2WrHacq1blhnozxsnZeH8YmUBZLJp3pFR4V4jk1mJpnUE8H9GkQncm?=
 =?iso-8859-1?Q?mnjwBqk1/BzVAaE7YVJCcxYUa58FHsCJie4l2cqvCJEX8QweQNa+CCBA4n?=
 =?iso-8859-1?Q?61HU+Bpl7kO/w6Ck65Nkv2iX+MbNiXQ7vSBegcJw4umgddHGfLEfTlOde7?=
 =?iso-8859-1?Q?TB9h+4VeU5F73JpVxMhU+KRgiB6Zx+QTkI2wtll0JlorVt2B/sB27xIvR8?=
 =?iso-8859-1?Q?kYWc8VKPukVOFjaSYG746EFy0gh+tu1HPWwZBIngiW2BlCnv0CRmNA0M6Q?=
 =?iso-8859-1?Q?/qDcEm6ZCnhr2ngU0eXhbPfETjDU/zTCnb102amFuHJnSN2B2PsgnRLzwR?=
 =?iso-8859-1?Q?Nexun9nB1+0ePO5GYICkaZFo53Nui558q5WOhVBOreUd89EI+xOHIRVray?=
 =?iso-8859-1?Q?jvLFL2VJi9WvwSz9joUHGxxiRkfpotE27VAM+GyDuTtEo+1y4K5+wn2weT?=
 =?iso-8859-1?Q?gADu+oPcuP/u0TIO6TH7oLRqeGr2XmJyLAazlE6dMs3g91Io8aLvq5KzW4?=
 =?iso-8859-1?Q?9A/+YTRaFUg9TJOBZjem6kNgh6TWFLKmfQUgQ7abLsa4mwlvAfCXTxPjSe?=
 =?iso-8859-1?Q?Z1Mp36V4+POan73o/aIZlBk69Ro9Ad+VVaTCGGmRL3HgiWpngTVfZF7CXd?=
 =?iso-8859-1?Q?hP1GIg2ptjPmvAE7gr5rH6uPi+6DaovsNksrhbWajIkW8h+pGyi7XVrNhJ?=
 =?iso-8859-1?Q?jgmQFq3k39ilRcQCFEmciPh2aQE3hWL/zcD3jhOfh5IhTfaAn+fEK997X1?=
 =?iso-8859-1?Q?dy64Gw/KrSqgJj4T6tP93T+qmwGqVjKgFXFP8rXdqzUFE37ch5rtI5w1Xa?=
 =?iso-8859-1?Q?5Afd6dY6p/JBx3fCHe4MZ5G9QSU4Bgq31ReW7ynX6oWo/YlHV4sr+j3lCU?=
 =?iso-8859-1?Q?HQJ+F0nISgilVNmFXbj48blV0twDpPW/yZnGkQqHP0FraXOda5cLuLRA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <4D801536D7E19046A03D369D167AAEDA@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a7af96-4855-4b13-8c72-08da670acaeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2022 09:08:47.7490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LXvlQh/T+pfxjD2ZwUrSwgXERZ4TdEnc4MRhncMaA3BRKpQTYX+tSlmteyF5ctsi548+xO/NZ3IQufPIF6+APA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB7191
X-Proofpoint-ORIG-GUID: GlBtWLDzVKs5YCkzguVqmxJcZOtykSoi
X-Proofpoint-GUID: GlBtWLDzVKs5YCkzguVqmxJcZOtykSoi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-16_06,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1011 adultscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=961 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207160035
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, =?iso-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jul 14, 2022 at 12:45:52AM PDT, Joel Stanley wrote:
>Don't store more information than is used.
>
>  Function                                     old     new   delta
>  _otp_print_key                               540     580     +40
>  otp_verify_boot_image                       1336    1328      -8
>  a2_key_type                                  640      40    -600
>  a1_key_type                                  640      40    -600
>  a3_key_type                                 1024      64    -960
>  a0_key_type                                 1024      64    -960
>  Total: Before=3D279318, After=3D276230, chg -1.11%
>
>Signed-off-by: Joel Stanley <joel@jms.id.au>
>---
> cmd/otp.c | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/cmd/otp.c b/cmd/otp.c
>index 049c217d6048..6dd2d2bdfb17 100644
>--- a/cmd/otp.c
>+++ b/cmd/otp.c
>@@ -133,11 +133,11 @@ struct otpstrap_status {
> };
>
> struct otpkey_type {
>-	int value;
>-	int key_type;
>-	int order;
>-	int need_id;
>-	char information[110];
>+	int value: 4;
>+	int key_type: 4;
>+	int order: 1;
>+	int need_id: 1;

I'm not sure if there's any chance it could lead to any actual problems
here, but I think some static analyzers get unhappy about single-bit
signed bitfields...perhaps these (maybe all four?) should be unsigned
instead?

>+	char *information;
> };
>
> struct otp_pro_sts {
>--=20
>2.35.1
>=
