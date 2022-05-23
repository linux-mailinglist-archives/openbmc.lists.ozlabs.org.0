Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC561531DC9
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 23:30:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6VqD58SXz3bkk
	for <lists+openbmc@lfdr.de>; Tue, 24 May 2022 07:30:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=gP9eIFZU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=8142ba0894=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=gP9eIFZU; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6Vpk1X60z302D
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 07:29:43 +1000 (AEST)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24NIXrE0030265;
 Mon, 23 May 2022 21:29:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=Jz+CvxxilkTJYZvFTdoMSOljDHZCJMZynJQtwP6yFc8=;
 b=gP9eIFZUsqhkJlFRJSc9RdCtleqkL3R03A1ruytLBv4CxwpEjcIDQy0d3frxB/B6kM/H
 Hwu92mm4vtuVhRiE6/kPxABabt0xuoaDGe4zBXzMujVnGe054dJJ8DQShIZUvfycJJPn
 TWyc4mudJxG5VQ9vgyKjPDrOtqGIJjxTKZPBR73qmVQIF8LV6Ui2cz/1P6jirLuMUUi6
 N+US/pZXHBqhjrcFjFoC1KQwKTY3Iop7y7ukXVBkvRzU6JPa+N61u2relhqDThd1PHq4
 ukSsj9ebagyDuQNGuzJs7V2LswjBt/TyzQbivlFGXHR3lNYWdprojnbE5nKK406FA7W+ gg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3g83sqadmw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 21:29:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eyK6mYkR84nvG9gfS0Jh0wcDl/5m1QHTiS1gxTy/2uyJCRzzo0rTxNDibo4mo3e0YKbFWZazCerB9sOrRUI9RaamEsLLQ8aNX8nNwmTuz4B140cPxNZSmXGtzlttyZzz2FFHLt/FmWtkG4IceEIE2YxR9Uwvn0wl7xEnE12jez9DE1P5mZ9h/X8zWrKaugNmcC66sWl0u1h08q1q8uqXD43WPxVoFxu8bnsng3vn4O4oedLk+429R/be/+d/XTbgr8DJSgIUXSvOERGIM5a9x3ZzKgi2oTuGtOasxEvYvGmSccJBMm3hRrxKscnwZQxbW0QUES6zJuYLwHY5e/1PFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jz+CvxxilkTJYZvFTdoMSOljDHZCJMZynJQtwP6yFc8=;
 b=dY0lkm6dv8wnY3nBVOuYAkwyvt2g0n14Pk1pkiO3MRD96c1DFbxiC7vr9fPUQKEM0oX0WpDaZlpHJpDZQ+7VzVPDM01Yc5QHq6yrEbbkDSEX3qA2RYa4slm4NPnCjh+B/7a+gv4RmrXY2c0d8XAMTTUlcY69oEKy+ew/vfSUuguToCor34NEPjO5oJgzkzlt3vb0JU78PpMPGpVNauO4JImMU6+tZanBVU6ZCm98TT8r9jOK8NyYHtvN+Pi9EE1Ptad5bNdUkRkOfbU6+dHi+BUYNGbhLmrs/9RmrIM2u/RK1zxA6aoqWut9gQ1zY1o/QjBGCoPqQpskrDPWIxwEGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by BYAPR04MB5239.namprd04.prod.outlook.com (2603:10b6:a03:c1::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Mon, 23 May
 2022 21:29:34 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::80d1:a256:cb82:f808]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::80d1:a256:cb82:f808%5]) with mapi id 15.20.5273.022; Mon, 23 May 2022
 21:29:34 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc v4 1/2] arm/dts: Add IBM
 Genesis3 board
Thread-Topic: [PATCH u-boot v2019.04-aspeed-openbmc v4 1/2] arm/dts: Add IBM
 Genesis3 board
Thread-Index: AQHYbuwyLQp5MXs+HkuswXwECAIEIQ==
Date: Mon, 23 May 2022 21:29:34 +0000
Message-ID: <20220523212933.GJ11809@packtop>
References: <20220523134004.469176-1-patrick.rudolph@9elements.com>
 <20220523134004.469176-2-patrick.rudolph@9elements.com>
In-Reply-To: <20220523134004.469176-2-patrick.rudolph@9elements.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab6b05a3-46dd-40b1-e132-08da3d0354bb
x-ms-traffictypediagnostic: BYAPR04MB5239:EE_
x-microsoft-antispam-prvs: <BYAPR04MB523977AD550F99E40DA9F6FEC3D49@BYAPR04MB5239.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cXG2knVXSYiCD1MPKmH2pKYbn6duzqSRwixZv/+y1GKp2Ja2aProuj2Tp36nd7B+SV4P/7LGzJqakkYFWnxjcS47k935HmE2IGq3mJ8iV+C2ZNF1Hsf4PNKumSrj9ClExrxaLNNLBdeLYD8JMi5da52EvVxiKO0WVXlSNghcal3HdFZ2b2QMnfy4gqMP6jKDXUsbCSxM8bZFj6pKEYoKzv7igiu2VlhS23s1YZSx9TmzyKlWGm22a3vYrjac37EELOvOu4QBJP7t1C5Dhy0MuX6Lx8TQwXB6PA1hUMxu5RGOMdkmyeX1hqwGSwNxdr0PdNT4s+D0r9MMUOSARw2ryWTPUvZQZ6g2ikUmPj4sLIZowyL2aFRgMrQGsR/9qvToi/zQt1D2dTD6AYcOJv2XWt4hc59auNzTToi3jHXbSxgfsxcpNVHHDXLMZppV6hWO7cTMarAyaDJM+GhjPRGRJK1AcjzdFlAMwHWArWHFvLBMAMC+R4vZramKtlnXGF5aTLOrRQWdA9SWJEwGpHD8AvypkVRRv/wOIUWnCyrItKTo5C1dwXs5VXyMs3AvlXWgzTPwt/lbSACC7ug+0v90IRq95duyhiQpHuTSX3kliCsHuTHOfgLxcKcmkWvl2lHpPgN0mMrX+Q49C4xXYH2onXRkkPRTuhn+WoF4Qqpl7piKyPW5rc3NHYIhquxWRnpbPAW4i9VpqS4Sbwq5zQNijA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(33656002)(4744005)(5660300002)(6506007)(508600001)(38070700005)(122000001)(38100700002)(8936002)(4326008)(91956017)(76116006)(8676002)(66446008)(66556008)(66476007)(64756008)(66946007)(86362001)(1076003)(186003)(71200400001)(26005)(6512007)(9686003)(2906002)(6486002)(316002)(54906003)(33716001)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iioigsZwIHov6Xe8WnIAoy9pQxTEuCDfdg//mcTYZ8aThrK3e0Od3KHFcpNv?=
 =?us-ascii?Q?TyktPzAFTYzUNE+8wDHPxIDRNMwFYlaCjEevDq9subkMQvIeE89JhoMX6Nfd?=
 =?us-ascii?Q?z8GyItfCGVv7e51h9dSoNQ6N/6K/ri8hyJaM2QZo69v6AX2+IW/0QtPDPDwA?=
 =?us-ascii?Q?Y/DGEqPAOLqznoxx85Sim/SZNMi/dnwWiSsIxv9Klp0eCgfHag0cxSaRhOyC?=
 =?us-ascii?Q?GrJ+DrxSLO8nbR65ETaSyA0n60pfpUr/3HckHxgW1hQVNJXOuH7t3nrioaRp?=
 =?us-ascii?Q?XYZW0bMuWV66jJypAbTnwv6gC/JHuml5ySgsjGGugMEgoWA5a2U3n+B0BSiA?=
 =?us-ascii?Q?frLzMOUAD3OO+wvubqMSBkhtQLKesYDYgUuIo6EGiVhRG/Eq+NyJkYZxSaBu?=
 =?us-ascii?Q?XGNdiW7GCXD+QTSAh7+IyPIgiy254xr7RsKuqjqIDC5jK7pB3mRNyqXuxCLU?=
 =?us-ascii?Q?eAilNLeDVarqzcAmKcKkTss1ySjcmMO/J5AW4WtZcrWPIn0yFPpwaC0BCSq6?=
 =?us-ascii?Q?VE2T50+xH/fJe2/DAIvjdza4LUyh42dbV+D0zwPMJAPkz5JS35MppFhT5MNJ?=
 =?us-ascii?Q?5xWypsYgzb7sxc+Kw5x9SQhwQ4pEsWfkjunF9eWueM2993BPTJL+qAlZWR9U?=
 =?us-ascii?Q?gqLNZCI9AuSvwFClo5zcpQCWZ8BEDTFZMLeSKdQ2vX5y3FyK1zCvU2pkNSKz?=
 =?us-ascii?Q?rsTk29UhaVi/Z/JJQ2A7MAZ8/kRwiFrbnItXmx/s+QGMKulqeBTzplxf0NjX?=
 =?us-ascii?Q?Qcb2HvB84L9UQPugO7jx+mciuJr9ZIWES+PqnYYszND9US0BGyMO0NkUzvNS?=
 =?us-ascii?Q?5iT5iGK/JrQWx5kqptQioNuxM0JpokSBzeJgf3ixXY7iZjPTK5QLzHXCUP/C?=
 =?us-ascii?Q?6UrLJvuNyha1sHPmHExJMzBLkTKz4kJWYS+N66TrA0GbuK3sQP+4J6Adq86/?=
 =?us-ascii?Q?qeJPG6VXVEbwDmE6FIl4VEBb/x1fMzIoWsJMkY1a1rZxps5r89EbFHMCQJPG?=
 =?us-ascii?Q?FuBVNEtBmX+HuDyiajlXWfCl7CkYcuJ7AW00dbXfyzdYtECJ/lxlD/9mezyO?=
 =?us-ascii?Q?nubiz2nf5AscBOU+tj5dy1Fzp7/ArXc/M0yCLDZSE/CBmEmKWQtHBCk1b9wK?=
 =?us-ascii?Q?tsjlX78XlkLAR3mbcNd4N3vFtMIVc8cvXcWRs7Xgr/J1LLiHrfGJv5994xML?=
 =?us-ascii?Q?R8vLihQyS6wK8DhsuVhUqCf9MFoQ3AyX+HlVBa/eLXMkfngJNZAglP80W11t?=
 =?us-ascii?Q?QRQ0+9qAb3Gb2YgVq+jUda2mExi1fP8PGFXBBAwQBiII5J+9ylqMeOvJpGI3?=
 =?us-ascii?Q?gXdp1Q8WlTvNMyuaUCLJh/9KAVcibzFGzdJBkvlFRgPSwoYohydFYEvvwve9?=
 =?us-ascii?Q?yO00J/c8WG5zvZbubHvhXN+6ca9JG2uCi1YuBYSnIdloQywmU4y2J5oGd/dy?=
 =?us-ascii?Q?lZaL7sg+vTF9iag/e2qRqSszqPl/1WbG5orn2mzNelwpI4W35F/KCN2OF4/G?=
 =?us-ascii?Q?L15fV2uMUcx1m3UxAbSTmqBfCF3ppLBV9TXIPmTiLtrdp6INZ3z6qxn1cWcB?=
 =?us-ascii?Q?eQtWb5x+1CnRN36hWS2HIyTlOQW1ycy6EbEIA7IyxHD7ZcYvSkW3CDAp8nff?=
 =?us-ascii?Q?OUtDIdp6KAFkFDn1ogQNcPaV/NqLZ2Ly/hsXyCnWFGkHuv2anDP9gPSnPLgM?=
 =?us-ascii?Q?3Q6HwBZOlTdP9PF5sUTUtkxHn2Tn7kRQuhhnV+JmtnZWXgNAi3aQMUhsD6sd?=
 =?us-ascii?Q?GbU1UWgtPw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <87D3F07E5F7D8D46A26190653D4DF69B@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab6b05a3-46dd-40b1-e132-08da3d0354bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2022 21:29:34.1829 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+NOuW2FDjRIUR1FJKjZ7+MZU5b9X4jRdoRxz38xRzuqXVj9B+N5tAQSJHsf4YiQikIo1fKdyLuQ82w/Gluf2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5239
X-Proofpoint-GUID: LkNTR3f6NBjFtVo8vOPwnRU0Yz_V9UPM
X-Proofpoint-ORIG-GUID: LkNTR3f6NBjFtVo8vOPwnRU0Yz_V9UPM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_09,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 suspectscore=0 phishscore=0 clxscore=1011 impostorscore=0
 mlxscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=821
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205230111
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
Cc: "christian.walter@9elements.com" <christian.walter@9elements.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "takken@us.ibm.com" <takken@us.ibm.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "zev@bewilderbeest.net" <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, May 23, 2022 at 06:40:03AM PDT, Patrick Rudolph wrote:
>Add devicetree source file. It uses the evb-ast2500 board files.
>
>Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
>---
> arch/arm/dts/Makefile             |  1 +
> arch/arm/dts/ast2500-genesis3.dts | 28 ++++++++++++++++++++++++++++
> 2 files changed, 29 insertions(+)
> create mode 100644 arch/arm/dts/ast2500-genesis3.dts
>

Reviewed-by: Zev Weiss <zweiss@equinix.com>
