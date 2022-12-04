Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454C7642093
	for <lists+openbmc@lfdr.de>; Mon,  5 Dec 2022 00:46:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NQNbs0bqgz2y84
	for <lists+openbmc@lfdr.de>; Mon,  5 Dec 2022 10:46:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=PPpFHgow;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.148.236; helo=mx0a-00268f01.pphosted.com; envelope-from=prvs=533712ecc9=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=PPpFHgow;
	dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com [148.163.148.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NQNbC1G2Nz308w
	for <openbmc@lists.ozlabs.org>; Mon,  5 Dec 2022 10:45:25 +1100 (AEDT)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B4Gncgt007070;
	Sun, 4 Dec 2022 23:45:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=0D/xViJKXPIbhUv3C7Ot6SggAhEEgVLjJM6f+SfEeh0=;
 b=PPpFHgowvzlqFs9259rayk6gmj0KI3REHq94K9wN2j4S99CrpDkC2NuHzuh8nvyqjdh+
 nfkXZCx9WkgI2qUKIv1V7eBA5YpYOprun2Un5bqn61JBI8kPem3NN3yrWRqxYcKxKTyu
 ZahkIZiU5lA7Zs1PrMF9pWLDcnwLxy39BM8jnqTphuu1n52RWruM7vyIqAuV+LZ/ICBP
 pWEz5GfxibmbGLtvLwNb5WY7jZ95XDkiI5yAj8PHdJX3A+sFY4f6X2NdMNPgaKIMtWV7
 C0+CUrVREllP1wbYUmDphd/TOQTnktaTOhdn/6OwXLcA6l9s69/KF79ygQsCAKxv7zT7 og== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3m8w2a0nta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Dec 2022 23:45:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXr8/aNnsJsaAllJYjVGwTk/P+rgiTD5W8SPGuyouViZjKBUui5gFE9GXikrCm1B4IZLs1e5vIY9t0uxvn6scqWpoVM7/5MOMDVSXfpuBSA2vTeOxIQnLenqTcg/HmfNnmCWW5hQnrUD/yHkVJINy59xDuwF/aESKFj2SECoUWP8IhBm8jbCmm0zy7t7P+k4wA2h0t/phpOiPU9bjdgRLFmHqWm+Ek2Fv0XQHw/y9ObnZHIRJo6nhjR3+xRnJIlycPu0kiRrIhxZa0T9OdPLYdpXXuzZ1EADzn+WjZQSquwzcV/TRkdP/7OeIB3DTnSGa8jIGq3s3U8orgtbH4bmmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0D/xViJKXPIbhUv3C7Ot6SggAhEEgVLjJM6f+SfEeh0=;
 b=RBTLpY0B1wCOVTP+jrdnpYUIVtzMcR7HV6Rp59geotHIJdlLsw1kwn4jAtgY76Gtnh+V9UHJ1ViLblYKvbdDO9QRCPfEr0QdcfC2qX4DfkcSp3zaPfzmTV+rgHRtIL0TIpiflcCRsDlne+qMNqTtdywrBxXOMGfLPcPPPxP67e6k0PlkBijpI0++v4v6W77CP2YTeud0mqenxGLMqIzpGy1+QKi1dFJf4RhAZCilZr5z4gX666quhRn46z4ox2LP++IrIqlOIWH2yaZGNjF78IQpeQ3ocAwUzHegp47tXbSH6fNA1DztrNdWMCUkEyjfiWstghcWRaFRfqXq9rq+5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM6PR04MB5481.namprd04.prod.outlook.com (2603:10b6:5:12c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Sun, 4 Dec
 2022 23:45:16 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::6c87:8da9:d12b:2c94]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::6c87:8da9:d12b:2c94%7]) with mapi id 15.20.5880.013; Sun, 4 Dec 2022
 23:45:16 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Hamid Amirrad <amirradh@gmail.com>
Subject: Re: Changing ethernet port speed
Thread-Topic: Changing ethernet port speed
Thread-Index: AQHZCDp2999SAvD1RUuSieWN/c1S4w==
Date: Sun, 4 Dec 2022 23:45:16 +0000
Message-ID: <20221204234449.GG18848@packtop>
References:  <CACFAz8BpHQUROFcpG3+dG3XyUt0+8=zgcwkU4CTk3uuO0Z2c_w@mail.gmail.com>
In-Reply-To:  <CACFAz8BpHQUROFcpG3+dG3XyUt0+8=zgcwkU4CTk3uuO0Z2c_w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8007:EE_|DM6PR04MB5481:EE_
x-ms-office365-filtering-correlation-id: bdae8839-8f68-47ad-fd77-08dad6519886
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  iPLJnp4grBIgg9e8DzOmLFmHCyhB2UT0aul45TtACA7QOxd8lNfdC6kxBLMWehHTEUY9/bxH1vYRSn7DdbVRSAPX8vJUEvgP4bPVU9aywVB2m2lcn8Tjq7OsZltP1UQZsfHGPa0f3dbtivhbX3N4dA9En1rgJ3rLE+5mLiowXn4JL8w2uF5t7iVXlKl1Ha0WZc4SAwBq3pVcMawT0EOP95gzv6VcQTBQrJ3N2951shJw+Xb4ErwstbHrWt6XY7m5qdzkqsU3CA6k/sp63ctg5r6T5N9xwD13jYWdjLy76Tc788HDyc2bLPVMo0EOSAXwO/2pyCu9kNWrWTL2OkoQe5dOaHjZZF4rlo7QuzjRcEcJK/UnHtK6JEsJdwF1Gplp1Jxlt0Q9TGjcs7OYlo1FELOZyWHwA48o/FViQaXgqPSrZYkNRHQCQ0UP+/i9sIF4sTLbBvP+O0gmWvA+G+FJwzFa+dZ+xeQGVMq9lZwEzhlkOYviLvBEYlMIEIfIjwG1JfDKzaY0wcvs6cA9a6IA8OSl9EaBvQyFvMaaDIPiqrOxwfKDe68WcN+GMZRx0FEA7hWSUJaZCZopbt9FhHyWS9sxvpsOankk3hz8766O2gKrJTBMPBM+CTaX3NdaKreLJo1dXnVG0ou8ugLFvhITJ6sbDElFXVRV5EoTdiPc8ZS4Az9dVywNo7BA2W9hZmOi
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199015)(38070700005)(2906002)(5660300002)(3480700007)(83380400001)(122000001)(38100700002)(86362001)(33656002)(26005)(6512007)(186003)(9686003)(1076003)(6506007)(71200400001)(6916009)(478600001)(6486002)(66476007)(64756008)(91956017)(316002)(66946007)(76116006)(66446008)(41300700001)(4326008)(8676002)(66556008)(8936002)(33716001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?OgBio8n6d6s7xoiIahIgglcdSL+L0SDxmRhflG6l8dv3uDMUB+xi5RTE2HA3?=
 =?us-ascii?Q?/HU5tcAZRebcK7YxD5NWUULp4TDYxzDimNstvEpS5NNxr0m+qx23OlqCDCDY?=
 =?us-ascii?Q?gdpwCTuaCI5j80I0nU5ckjzXO8vS5JvokarZq6E0QKPGiIeSbSzIRl5nN7yv?=
 =?us-ascii?Q?11+QtAAyiXI4BgeZXXRmh7DmePjje09bDGFnUB4juvuD4K43AsDG0Cx0lL6z?=
 =?us-ascii?Q?iih0sP8FwP24V9jYcPlcARkyx2HNCYEUSi/K5+Tap/2MuFJ+iWZXJ4iKT5G3?=
 =?us-ascii?Q?YzKp89Q+Dd+AJRjC3vjA9EvaaDDTz2dlm2X3dbdxYd6qGq16e6UhtPK4rQUY?=
 =?us-ascii?Q?9wnG4La6lB5NigSvA6WXL4ukkk0jCrv7dQpbtBkCHVwkfs74T2A8dMb6IlnJ?=
 =?us-ascii?Q?yTYmv/sGTIrAzxcYQ+pJsCpiA+wYwSB9CDfxX/mGZzAYz+HjOq4M7pp10Z6D?=
 =?us-ascii?Q?XjuLU0S4/ZIAy4s8IbFzu4usMKPkDrG8PgJNOZx08jMCAnY+XSeGnKKsm0ek?=
 =?us-ascii?Q?q/LvrRHg88TIuREujjAKuzXoEtqTYXTuYtoDnhsjJImLTGn9sYEaBrYDBzaw?=
 =?us-ascii?Q?KZ3QYG3g7zNaaI4wmd45GvlqWtEKx+5imOdQ4k5OEaIozrYRD8s3VOI1XFpt?=
 =?us-ascii?Q?oy6zY3PwwtEkqVx8aYeXfy4nqJsdj6+VrUTvEGrkk8v4xGM79qt+essmVUn+?=
 =?us-ascii?Q?+L1gBokzixWvF2iqdl7glUz2JVbBjEzcIEZXkmX+Q/s1D3bGs438oHby7OfE?=
 =?us-ascii?Q?y+SsNllejk7EA6biKvxLdYu1ZBrxeJYvreJa+MYX51XaOtvHXjqk6uJkPLcP?=
 =?us-ascii?Q?XUQJMKjyE9s8IuU42sXAIPIlFWDCmB/cHCqSOvLlEESZy+8cMDs4rYXB2BZ4?=
 =?us-ascii?Q?g7PlH1nV9lQZo1mLP/i5FYLdRFnj97DszV0cEYrHsjqn6cjMxgL/H69HirH2?=
 =?us-ascii?Q?5ZOjxEwGEn0mlc5KqGtXvColTFM/g+OwDuDYbu7TWRE4CbOWsOhrwnlqmHqF?=
 =?us-ascii?Q?fIVGSltraM9HWLzNSBZwJGXowT40so1Rhe+fytXJ3K4aXVbl0YHR/rxfk6fp?=
 =?us-ascii?Q?Rhlz6lgAbHExWzkWaWiM8ebLuUbHbXDOZ2Jj4UWmq5Yc2SprZLOOM8us+XWn?=
 =?us-ascii?Q?t8whRBMyzH/sSB7pS26GgOHu2EzKJNJI3UJmC2IFSBO495WJFblK/Zq73B9G?=
 =?us-ascii?Q?4EYNVQwVuqdyjroFSOGysM2RxDdrLe3/GSp4d7/IlNYEze3Q39cq5XecRUmY?=
 =?us-ascii?Q?+3PoxjDNp3Q1GBjsCLLL1RxGJOutHz6gwuN1zupF67dYc4yc5bNnpEjtMDGR?=
 =?us-ascii?Q?tsDugvYUizhyaoZZVijyw+izTkk5ZvWLm/BFllqHQZFzTa/+uvJcHKl8dCQX?=
 =?us-ascii?Q?IqAl5HVmhiDIZ6olXCBQ6TqWzUQL2s1nPkZTnkt3OCPG2mbw8l5zb4jOpYBZ?=
 =?us-ascii?Q?O4R4cbLaXxVd/vzY85ZbRL9OjqPvRLKYLWJosOK2/4MOhhHiAZNLZqNHt+xq?=
 =?us-ascii?Q?aGPaCMcIpkLRUCk1/wZLKPta8ATPo2dOWRV81XeXAbiyxp8KLZmw6GjkGYwr?=
 =?us-ascii?Q?W+xT7XKt3nORMOyV74nqjctATqVZlF6qnLgN5xur?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0E07FAAC7D108E4491D496CFD2D92271@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	tGAHvvuZHC6oSLwE75n6DA+sISLSISoddM7u/QF26JfmIjE4S3hxlu0nv7xnIX5h/xwz0yD6zqpGqVqb5RqDgbhWPjAgc4ziOMNErk8RD+uGXuDtnaoD1V/VU7lFBGV3qlh4/YN830I5I/Gn720wbkQ4o32kxdI2P8hwaiYrWdoqwOIWQseZORPKkGdod4381dqbHXWkGOM7Op3Gj3cg/VIZOjQmstSW8utFuLfMAk+b8NNersD+u/PPHRzjRVVwvCVW+2LJxGDFPtcH9y5cbxwbmjrhahLEQElkrX3PJzDU58QZ/l9Eu8615X7Rbqs5lxLqOVyCxC+1t/7NAP+yF0pIMn86dy7DF4ItF1GLH5bSfDgp3/InLXLTdhIFfleI3sF2z4F0laZVKIoc+dINp/7E762/4PSOLNgs0Nd9x2uZqgUwcK0JMX8CI1CKje7BIAWyddadpaxWP4KsZgpeSqHbutXLp1dQ2f+skRU6fBIQWVegUbCUBKRHzuW1QX5FgqBJgy8urs0uvmQWd//0LlQI1QaHQI3pRiPeQo4mTrIOiOxPWl7bulSRRgWgjbzxFbUScsPvvgDcx3W0W3B4FGxZvXYvprtdf5EBG4sUpnULuARDV0zh0ULe3J+5Rvi5eJFk9uZl4aBg0mc4ybhWSRUPQGQZbT9vLkZ1cRvxTBYYBMiKootkEn2puGIQTOCuajzi62Q08N2ZyfFCKy9+JDl2XRTFLldwGBzTS9skH06COMIQZdZ7x9KykpFAoN2iubjuf/kQ2q+xCXI/VRAdcwlv04LpaBS02ZBqfMhbafLOXCBy8ZoY/vys3MAfKZn+yED+cKK1Mzq1VgDN6ZsRVBG4gGktM1zA34p2fZd/yPI=
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdae8839-8f68-47ad-fd77-08dad6519886
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2022 23:45:16.5556
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X8e82YK85/loYAVv391o0mA+HRdjvZJf9Hv8MMUl+JKrYJ7NyTM2dEGdcr2RAOvRbI7KakUPd0D+5Ktd0fx4ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB5481
X-Proofpoint-ORIG-GUID: vM1QRkFwDZ2MvelfGVTtXG2RutV9PFM2
X-Proofpoint-GUID: vM1QRkFwDZ2MvelfGVTtXG2RutV9PFM2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-04_16,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212040216
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Dec 01, 2022 at 09:27:44AM PST, Hamid Amirrad wrote:
>Hi,
>
>I am trying to change the Ethernet port speed from 10Mbps to 1Gbps, but I
>can't find a way to do that. Can you please point me in the right directio=
n?
>
>Thanks,
>Hamid
>
>
>ast# version
>U-Boot 2016.07 (Jun 10 2020 - 10:12:49 +0000)
>arm-openbmc-linux-gnueabi-gcc (GCC) 11.2.0
>GNU ld (GNU Binutils) 2.37.20210721
>
>ast# printenv
>SN=3D8513060012
>baudrate=3D115200
>bootargs=3Dconsole=3DttyS4,115200n8 root=3D/dev/ram rw
>bootcmd=3Dbootm 20080000
>bootdelay=3D2
>ethact=3DFTGMAC100#0
>ethaddr=3D00:02:C5:38:1D:DF
>ethaddr1=3D00:02:C5:38:1D:E0
>ipaddr=3D172.16.141.104
>spi_dma=3Dyes
>stderr=3Dserial
>stdin=3Dserial
>stdout=3Dserial
>verify=3Dyes
>
>ast# ping 172.16.141.1
>FTGMAC100#0: link up, *10Mbps half-duplex*
>Using FTGMAC100#0 device
>
>ARP Retry count exceeded; starting again
>ping failed; host 172.16.141.1 is not alive

Given what's pasted here, it looks like it's u-boot where you're seeing
the problem -- does Linux successfully autonegotiate a higher speed?

Also, is this a Broadcom phy by any chance?  I've got a platform with a
Broadcom BMC54616S phy on which Linux autonegotiates a 1Gbps link just
fine, but u-boot would only negotiate slower speeds (I don't remember
offhand if it was 10Mbps or 100Mbps).  I've got a hackish patch I'm
running internally that gets 1Gbps aneg working in u-boot, but at the
cost of breaking 10/100Mbps aneg (and I haven't gotten around to digging
in and fixing that and sending it upstream).


Zev
