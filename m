Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF6C582215
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 10:28:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt6PB4p3Zz3c41
	for <lists+openbmc@lfdr.de>; Wed, 27 Jul 2022 18:28:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=ad+CZpfl;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=02071bd63e=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=ad+CZpfl;
	dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt6Nd6mhrz3bgC
	for <openbmc@lists.ozlabs.org>; Wed, 27 Jul 2022 18:27:58 +1000 (AEST)
Received: from pps.filterd (m0165121.ppops.net [127.0.0.1])
	by mx0b-00268f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26R1UjbV026092;
	Wed, 27 Jul 2022 08:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=jBg277Kq00rfkhz9NZiQ5sMU8+x48DUm1UO7Jt5MH6A=;
 b=ad+CZpfl/navLMktJmFeuTGVeixGJCI08ysCUr+eUHklWlvEMh7cTYGTe8XHphGlGpGa
 8Apbot5CqfLrwizKvE53F3MS1flqkltcxzLDXnEuifgPpiYPzzdoq9g7dXxwOQmxnf5Z
 WOk+6pvK4ek+ei3c6piOWUMgNTi1uh5AYDLMhVdZFHR6eQwTkGjm43DLBvOT6bXfxKJl
 hW0hLuEU4iDQpo/OBsXoE/VuEhRlZhjjOQKoeBRNLb8LWw0mdMnz7Cy1BER9qzbzSNIc
 ZANSbB8ZdFqRrf4OAt9uwQx5rX3tQI+uYkEvYn096D8+wCNo93upwICT/fosp5+HvVZN Xg== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0b-00268f01.pphosted.com (PPS) with ESMTPS id 3hjurw8v7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Jul 2022 08:27:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAKpuJ+qxHrhwCk/O3idEW8iQUXhkx9ZbNw9bJsd3dNwSwKSARQrVJqkb+4qjXPvqoZYWDpLtxC7xWfgBpiqS7qAxoV/mITSnB1kCVSx8Wj3p/jB//fSMQRk5xKrkU+C1g3tQR79M0/kqoLqClzUXqBNlTtgtSnB4/B2IsMIDj11FIlFZqnsudJRhGcgXr8nZklTbTzLYh3PfP37nV4DtBxe5NrHCLxZXOUgEa2q2B9vdaUja99bgOds/ERU6uvGTYTRpHH2AluKKspW1xu88tNwxLwRFBfMTccJWEoTFkN3Xc8RQfSmcbz606qU5c6EABA1Re47mTqlQQTzP424fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jBg277Kq00rfkhz9NZiQ5sMU8+x48DUm1UO7Jt5MH6A=;
 b=cEep0grICNKsrCimQCc2igIzreQLWpJUXCLUqdnl4qPRhfa1lV7Hum3mo/lBivPJMtQIDBgsobvzHNtDJi/ggoUUaqCUMtmdxufqF6zblXtHM2z04+L9fkgS8rKqVN0kTvT1ZIFPLY4geYvgHdJw/CdRYkaNFeDJ285IcG7y7ZbCgmz+lHgAFKEqv2C5Ul2AmHaSVvjF4ZWHUHqM84ICKuZiaBEcPaSMnG+k+JsH86Vy75JjqfElFOUrpY0qFwMuoYhJs/01gN+EA7EnxMnBRCyYx0QEMBgaFRZ8db8UviHUaF9BuR6pqpQwDZHBWfWzY2aUC98aplZyAlSynWm0DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM6PR04MB4747.namprd04.prod.outlook.com (2603:10b6:5:1f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 08:27:53 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::9890:b657:c8a:cffe]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::9890:b657:c8a:cffe%9]) with mapi id 15.20.5458.025; Wed, 27 Jul 2022
 08:27:53 +0000
From: Zev Weiss <zweiss@equinix.com>
To: "M. D. Truong" <truongmd@gmail.com>
Subject: Re: 2022H2 TOF Elections
Thread-Topic: 2022H2 TOF Elections
Thread-Index: AQHYoZLDdZQNvHGV1kWFkFMcVl6IIQ==
Date: Wed, 27 Jul 2022 08:27:53 +0000
Message-ID: <20220727082752.GB30806@packtop>
References: <YtcdwFSsS2vsWVoU@heinlein.stwcx.org.github.beta.tailscale.net>
 <CAEx7e2RMyyq0X2hFCuqq0dPFFm=ndKi7G2ozAY54q=VNCfuQCg@mail.gmail.com>
In-Reply-To:  <CAEx7e2RMyyq0X2hFCuqq0dPFFm=ndKi7G2ozAY54q=VNCfuQCg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc4fed21-cfa9-411a-a6a5-08da6fa9e668
x-ms-traffictypediagnostic: DM6PR04MB4747:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  WTz5thFo0q8aMtrQUUkcWWX+WCWLfDaJkJLvylPtvcMcYNs3GQIAnir+Iu4GmLLTOIRUg6Fmc6O/ncIphNd1NiYkHndjdHXNK+gzQdKTdQjOjl+nnbbnGvKjbwipq7pLs2srX728FMFuhKcq4sw1o7qjYPgKubqyQ3edFD9WtDMoskLr8L/NT34qiWPGcUjTdJg1D+DPhi1E8vpch/BpH8kiHiSYLcIQ0vHzNBVnRHwVfg6WAqO7AIdWAD3FnSS5BxhM/oijwTnBvuM3RbVT+wTIrJEF33mcjcfVSSs43RLvgw3BUanyaUZ5m1FGZP7Fh2Gp3T+FRtdWViD2b1Fk7a28OCUECOSOe+liGeyXsfTdvQd06oi3+3GyI2UWgurimiDMHd8tr5eOiFZglRSPEtquUr/3jYACQpDyxzdM00SLPPVXRw7TG+DmlDvBHb6Mm9YCBg1J2/MJ0Z6VyZC4BjmEi4YZPJ4L40hcwVQ+7/+LtdVyxa1X59VR7P8a9Kj2cXjofOk4xFxx00ignnCPlVotAlLdCtTuz1hF7iqZBnBG8TiHLw5+UvfMr4Q8YlVP0yy9AOvKzdjZx/6/+dITwk6Vfznejc5uTVMksdX2ACsChbEkrOn0rK9IQNKqsvDPjN+fRgHOSx0RUXdFQ/wRLEi4k30Y538HyZRKfXdbNW2OFOPIehCsDtPG+XyhLsWmESqxX89J5Qm9GuU6XvSVkEl8ooUTs7qdP9Ux9uk5q2duMEtw2fo34GsCchssOgRL87CmCrFdPoNOQ6PwR0sa332F6/oAg7YNc+ip6V+94lQ=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(66556008)(86362001)(41300700001)(6506007)(6512007)(478600001)(26005)(186003)(1076003)(558084003)(9686003)(71200400001)(54906003)(6916009)(4326008)(91956017)(76116006)(66446008)(66946007)(33716001)(8676002)(64756008)(38070700005)(38100700002)(6486002)(316002)(2906002)(66476007)(5660300002)(8936002)(33656002)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?h7ruH8KkwIRhaXhhC4dE+y3i6v0JwZUdC8/4cpIbWNxZNv9NMXKL+/cCC0T2?=
 =?us-ascii?Q?rwQAO8V4TKzz+urgHDkURej0gGeYgdpuxsqScJmSOkTnQq/xLOLnjIFkRKLS?=
 =?us-ascii?Q?+unBGJhh41qmbtJ6w17+D7C2djqP0dfQ44/Q39T6IceBxUc3zNUFs6viFjtq?=
 =?us-ascii?Q?v7Vt148n24n7juW6Fm2mnD3m+da9FUNaSLEu18pugOpz+PJ15+y5p5gtARfk?=
 =?us-ascii?Q?xru4KRyrDeWLjEj87ssM5jDRbr8eXVCDyvvYlFe+d/yc0hTiwZTepDgTHJtN?=
 =?us-ascii?Q?8xq94zhQUWA0wZ3gDzrQsiN5HoW2zwrUQbDpXHBmkkx4wRaYjEMEu7gBpvR5?=
 =?us-ascii?Q?JYSIMegQU5GRhiAMfx3gH7Qj/rvL7hh/L2hDV86ht83jbx1hfqs7CqsGioNK?=
 =?us-ascii?Q?9i7aPYBLQtl1gYgp9UrhhLtgMCUdCmtpeoFULyye4LZwgXsL1SC/n0QUeyYY?=
 =?us-ascii?Q?vv2cH0IBDDt0HedBwFBpkduFP6S9l4ZPyCXqPEzVwxBPVhLSGJSXWAAkVpBO?=
 =?us-ascii?Q?bddcuN/93YLrTVObTMIrQSk1DJozpLTVwqPyCX7Z2VUdd7sS89UX9Usj+z0o?=
 =?us-ascii?Q?LKJJWeLZjp7WfNnmu2ijbbPE1QiEbRiN50IYDUsj6MYNMRVMfKJN65VZ6MH6?=
 =?us-ascii?Q?QVlNgshkROBEj4tTCJwNnVnCpvc5/wXflc4CEq8vwEqEiOT0vvrvqjCGIeXi?=
 =?us-ascii?Q?InvKyOs3qLu7Ga26cOJWcjzAcFQvoLHkMVvrdJO7Evm+pgzDKas7IDQZpe1q?=
 =?us-ascii?Q?DCOQX1375h4nxDkdsVXR4XbzyA6gqGWFcUE6BWyD9m0vHRPSI7K8k/SFK8Tj?=
 =?us-ascii?Q?3/TCyndKKkhmbWayrgDJD9VRRTtjYMTJwWMG4ECPf3lBwnW21CMp2QWVmJGP?=
 =?us-ascii?Q?n+lkq9xldDXBWPkN+6k4VmxS1vPVhgV21aqGFMLn5Jq2f1difUx5wy3a4ana?=
 =?us-ascii?Q?qEJNfsKrkeL6iL5lVWaraCBt0rzwmAOOzaUDrea4qpeB+6nunn4aUUdAAaD4?=
 =?us-ascii?Q?CpB/+alCkmLofbAp4ORq7kVJB/B6lJwtPyvXoNPb+hJ1QSbdxFsxuHIyZczg?=
 =?us-ascii?Q?1eqjbrsOAvwNhMWgKq5726PEVwF6ynNv+dtloeZfh2Mo7LRrYtG0nK/rHPui?=
 =?us-ascii?Q?GpPEbZ8QiHmNTwjwugw5dgEUnEoskPWIGfmzt17gQOIANgJVQZ2U2FS+xEHA?=
 =?us-ascii?Q?0IJ/o+MWdZ06I09H7Vv6IJU8X6pFCw2nlzn5Qlxs60kfPWYisOtL2wxZu4UE?=
 =?us-ascii?Q?Ct8WlcFiVlLCkPDWgkuZxKo6/kJ2i/dg6IM69GiL2XxC4OOE84j6CsLji6DW?=
 =?us-ascii?Q?CypPe3ExppCuLHMyuG96gDeb8oC9OZQBShl/6KJ5MryxmKxGEhtzayBJFGti?=
 =?us-ascii?Q?5F/ksj8CLx7y/Ax7zKPMwQiqzPdOvMm5B6ruAHSK6fF+5RsC2/ovOwDsXZlK?=
 =?us-ascii?Q?8i3ItZacgiwL0Ir7C57KYK+c3BEY/pPDYKXvxEAOv0Pvl1rmdmWP5x+J/tTr?=
 =?us-ascii?Q?AxNTatNgba0P2IlKBqQjkHFTX5RfLAIonecrMatoFpXEfzW42Y1uWwXfuJmV?=
 =?us-ascii?Q?dBTK5BUoSrUtxSOjigfRQtkOo9xeRegREo1TfKB7?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <380D9F5087798248967B7767FCF51414@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4fed21-cfa9-411a-a6a5-08da6fa9e668
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2022 08:27:53.1652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RWEi0ytfwRVXgnun7gITV82lwT4J/6fFImMUoF60Cu39dyaupWfKsoMXmGriQUzQRdocmUu24ymsM6IeOSzp6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4747
X-Proofpoint-ORIG-GUID: 4ZGCEOOhSSJLu9YEMhbWY8pTDHLqqRfU
X-Proofpoint-GUID: 4ZGCEOOhSSJLu9YEMhbWY8pTDHLqqRfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-26_07,2022-07-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 spamscore=0 mlxlogscore=838 lowpriorityscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207270032
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jul 19, 2022 at 04:11:45PM PDT, M. D. Truong wrote:
>Hi Patrick, all,
>
>I'd like to nominate Zev Weiss to join the TOF.
>
>
>Cheers,
>My
>

And I accept the nomination -- thanks My.


Zev
