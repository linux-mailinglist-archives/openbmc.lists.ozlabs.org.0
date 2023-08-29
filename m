Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0671A78CD20
	for <lists+openbmc@lfdr.de>; Tue, 29 Aug 2023 21:43:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=EHyU6t7W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZyWw663rz3bwj
	for <lists+openbmc@lfdr.de>; Wed, 30 Aug 2023 05:43:08 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=EHyU6t7W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=46054ce3f5=zweiss@equinix.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 4668 seconds by postgrey-1.37 at boromir; Wed, 30 Aug 2023 05:42:36 AEST
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZyWJ1DTDz30Q4
	for <openbmc@lists.ozlabs.org>; Wed, 30 Aug 2023 05:42:34 +1000 (AEST)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37TFobxM009393;
	Tue, 29 Aug 2023 18:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=H5EaVIqjOfcypgE+YWWj1D7utrgj0v+xkLugVH//gME=;
 b=EHyU6t7Wc3sGfm7Ps3WwxZ7rlXnykusG3Yhkm9GQYBSSPqx1dGVeX/1V/VgpF97qB9JR
 HXBzT5+aDmSScSkpiuGuh0OChWjuheZw4P0F3WIPuSl9GUA13G/tbBu052bZZnTZhFB/
 pE5ITazfkRWKOTTv0Qwmp9Mdx1UPPo5UPniO0s+vdwyRYNmGBJY9CQJf35KRK2wwL6v4
 H1WQfPK2u5hxQ14rZyaJ0vapr3xa7CNDEjXxBzAHSRY/pLPM4+L9xWFqf3vZ1v2r9LCV
 jDafWFG8W6gnqVTecKJxbQQ7YnOtcJ1Xzdo2pr7Uo++2jKlPmXhSNJWbqaAJABtqdgvI lg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3ssfn5hvaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Aug 2023 18:24:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyJNSEg2DZfScog4Kk24dwoJ1OHSKEqjgRLJ/I5PFY/akz1YNCwKBkiOIotAhJe3G60C3/P5Ckf7/iKhUpzEXsBwaLrnicNK4z8Qd2It4Vmid3OhdfRXE74BTyLVKKW4AhY+EUUylazxLedkc8ytppLNFuH4FqDudkA22qB3fLUtFHfxYKsCRVdWzBcsXitP3Hr/e/H+0ijTtcRgYEUkF0PhVD/P02tgrEWpMFz+r0niAqDPWhTCsZtUWF96+mnRdvZqHWtjja34vEk+2sLPE8Rbf4P9YaW0S007cQ6hf8Q/przO8tWm4LB/RVfrKPIjhtQB63nErVRM324mXUa6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H5EaVIqjOfcypgE+YWWj1D7utrgj0v+xkLugVH//gME=;
 b=bjzqPRoeDkq9NfYon8YKuv4Jq7cW/741xxlRIx2G5gATLkSsnuqyDk19BPnjJSDCvoL3KLQfhpwukLzpBdJovzHMqz96C5yoTePbV+wlCBzwiX0bjc2/qWG11v5UyRJ5YqWDE7jmj4sV2YN1Z82r+Jjn5U/nNpD/saK5RKQNPWMrIrwhFIQL2c2b9A3yYeDsiyp4G2QySaZvtwZn4oitGJmPex8CEUxz4xY9KVGBgJG1vKVmczyw7Ed3wr5EhgEaL4lHtHSc05syp7XuStBWMB9irJ5qU0sp5Tb5d1UI3UK56683MTkvYL9JRUQVdEVe3AegC5ZyL9hS5KvkGXqaPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from CO6PR04MB7843.namprd04.prod.outlook.com (2603:10b6:5:35f::22)
 by BY1PR04MB8726.namprd04.prod.outlook.com (2603:10b6:a03:528::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Tue, 29 Aug
 2023 18:24:34 +0000
Received: from CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::97ed:a6ad:42f1:9559]) by CO6PR04MB7843.namprd04.prod.outlook.com
 ([fe80::97ed:a6ad:42f1:9559%4]) with mapi id 15.20.6745.015; Tue, 29 Aug 2023
 18:24:34 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: TOF elections for 2023H2
Thread-Topic: TOF elections for 2023H2
Thread-Index: AQHZ2qYPS5MHF0RrqUuTaVvUDlWf/w==
Date: Tue, 29 Aug 2023 18:24:34 +0000
Message-ID: <20230829182433.GD19997@packtop>
References: <ZNvDQ9xTbV-Ynk6T@heinlein.vulture-banana.ts.net>
In-Reply-To: <ZNvDQ9xTbV-Ynk6T@heinlein.vulture-banana.ts.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR04MB7843:EE_|BY1PR04MB8726:EE_
x-ms-office365-filtering-correlation-id: c27c26cf-9c6d-4ebe-bbaf-08dba8bd323f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ZcylzVbqMj+Y88CD0vu19sFi9t4vgCajF4UaiaXJXs3GsPq6Fj5L5/kSI22TMvZC7ghn2+lrQ5K2fVPSsyhM8eAckhdnJf1uGxBtQbjoRbMjDgWivU79Sbz7tnk3z85j2/xMfy82Otz1uKjGiHNc4Wv8ma2HItG/l069OP7eSk993aZNyfdOuk9a+j0mUk9IvmdO5TylnW9lw1CHuxQK1A8Kq8827PK2MndoyR2MOH2oekjG+U13NrQ19zqlSRwct3XLRYqQcEdQNpAXZus7o6erb4CFd/yIXePjYAVjMCwNvq7zJf3QmVndiHorW5zuLOrZnPdkGEEVzkX6zSrKicXIuMkdBjnp2/75u2eVp/N1ax59ke3TftRzjpwq0wXinZ7gFs9YPpRFMg9m8ceO6Gfr6BanQpu0t1FuhdLdNwXGrXrJrT0hL7oV/HPG+YR56/cdxBh7Dfk2d3HQsUJZ8ozejp2+O03HOZCV4FFY6vs5cUNmkHgf1f4AfkGGHuuPP4QdMZKetUZz91T8CCuoKDxY9rUjM1IVBjhDZU8m8C/PNbnTz3ai3ve5HlCFg7OBCZmD4aDyIWUmaaN4HQGa8hQYnlFmhlBhlAFApadlB4k=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR04MB7843.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(1800799009)(186009)(451199024)(8936002)(122000001)(76116006)(508600001)(6506007)(71200400001)(66556008)(66946007)(66476007)(66446008)(64756008)(6486002)(966005)(6916009)(38070700005)(38100700002)(9686003)(6512007)(26005)(5660300002)(8676002)(1076003)(83380400001)(2906002)(33716001)(86362001)(33656002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Aob+UPoJKjouLE1432nTIR5a2KxwIV45LOnJITZ2gE/Rxxj6WUKMHN/QwRxn?=
 =?us-ascii?Q?NcPsg9iSWbk9jixRwRlbPaoo8tIt/50xOqGtCF9ghD/AzqoRzD9fLelIn7cP?=
 =?us-ascii?Q?zpa5fAuiIB5ZuTgoMxRdxoWuMh7Ci+zS1Hjb7WApkowYxsBaJS7HA8wMr+fc?=
 =?us-ascii?Q?RkdDGI0OK0ABlhxhbkJeXR0mpVe/LOhkfemeK7Qj4OhnUJyGMyN8AG0vpx3l?=
 =?us-ascii?Q?saKKt5RVIlBomduxLp3QXWqDYvF62Scw9uVE+rXdzHRPGlfEr1gHNACHb6pu?=
 =?us-ascii?Q?8OPWNLyMU3gzzXYUjSx9Jp5umwA7nDEu1XrjNk0c/A4Kdny/b806oSk0SOlu?=
 =?us-ascii?Q?0BGPEkLvBICKI7RzIh0UWGdZANqCN07imNZzYBnfblnnRYhRrq9PGvonFpAO?=
 =?us-ascii?Q?/H49+id95mLIME8MK/0PMtb4d6r16NFdw2QBrQhBGeG2GO+zBWGioAhw0rRK?=
 =?us-ascii?Q?lx/OGfL976iPmixF/hg3UCW6u93/cZ4EZsHGRJTFNsoeLC+HT0e6NW+3VO5q?=
 =?us-ascii?Q?XQXmzQVM8N7TwdvkDl1FuaOV030nNqqBQ8tsytHt3B+zkym9CDHfxHo05pot?=
 =?us-ascii?Q?MtQ9VIrSPtshbSbOpsLwyA0pIRp/+ob5ZuFt9u/QXkzBVxrXVMDiz4aJAQcA?=
 =?us-ascii?Q?gnh34IbfTZGOZ3/uKcK6FQ0g6uGwj9C0UEp31197Wrknwj0gSwATOrKS1J9V?=
 =?us-ascii?Q?W6OUlhj3BKQgisvvIDoJbuVTuDyAjVgtaQ2ZlRcV2OP/9wPLjOxoaGn19ewE?=
 =?us-ascii?Q?tvt0L5nveyeeiAn5w4yRzFyd6iTWsxGy+6Wd5fW2D2s6g8hVNmCxBUu0o199?=
 =?us-ascii?Q?oEa6oBJr3zMUevFtjdp+6If9mPd7zS9vXTphCGO+eP281Btg+Ph3YUQvi0H4?=
 =?us-ascii?Q?aoOrwUASQjZTB3LS9U/BdIHw4YJ2bhx3UjFBt2Ko+dg5WvLp2vFTxH4V48pM?=
 =?us-ascii?Q?5KQ9eDZ4/D2/OO6vFF6I1wA/U90MBPuvYk9JiNlCd8uF1u9KjcdUqSqOSVta?=
 =?us-ascii?Q?UIqUrdis4PzOAXExW0qRMXWxti6vhin4lBolRHec8Hv1Fo3JFGunrtj915Ze?=
 =?us-ascii?Q?/jRJBO/R+VKGmZ5ZxwsaZJ3lEM+mN+jFx7jDhSSHoAgQiBHjH5+t3XWEf+lf?=
 =?us-ascii?Q?N4OFRviRv2tjsoCDY09xNy/qHFcv1oJK+ajTOolAsQMQdv6OSnIHEHn9bnyn?=
 =?us-ascii?Q?yXN+4Vg2br+tt7UMeyWO4B314LSs1WpuIpxPL/CZeN5IrCnjDglGD/oZ1Ea2?=
 =?us-ascii?Q?lbKsg7lmo35zMYjiN9QG/kHu4RL4+cAYjC37XXzDYtchYxvBh5SOGM7bl7Ap?=
 =?us-ascii?Q?bH4O0msrR3pRgdc5/EvUkucci58U+KhYvcu22xGkgAAHf+KjkYljHibxiySl?=
 =?us-ascii?Q?fUAQYj5xKxzW5KTMzJjllNbUHHFweMc5x3e0o0UdR4q9DTy9Mz0c10ggS9fn?=
 =?us-ascii?Q?QPxDJP6PBIrrMDUWBxMjF6V1y6eHYAoCJAKWDxdMPCrlZMjDsc4L1TTgKPom?=
 =?us-ascii?Q?8t6RQPZphYZBC4HLa9UtNk0wTDSXusn04XPEmbPshaPL4cesig7QcWNuzBY4?=
 =?us-ascii?Q?YsYeoNVYGR7qxMZFT/lbuq3kNj5v57FFV1mhLOgO?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <65C3ED9C866A844E9BAC01A77308A509@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	wEGnBUhjac75WIPdEtqN+z99XvUAEGF3VPsiiFL4rLC/5qDjYJyrufJEKdEAUHVEKDG298MQEx4Z2VaJ5pCpnAd8EGq9lwq6RgXjnCn3xuzyF3S+R85D2UGZngv1sQtq9MHGzG1pGpeNdplITi2VozNlS42etaRPmhsUIh4UX+sNNw/zL4/5NJ0GgLI5zQsFCc4lKUrsLbhZxPMCWGmiVnkWuzhzegS8gRdALqd0mn+cs5590scM8obNyyjV+J0mnwX8vOLK6SZOc2kEsoFP16fQs1VdOFdatzLQMqSEgxIgEoc/X8juJAlLe3vzQ8tIE5AMCP/LmIqkJoR3MxU37fnWO4YSeGKVFzbvd+DmqTdVN2xBIIj2nTktniKpWqnzUggvlS/yhJYHhp7FVxDeuG/U6SXs0MytbFolUeh1EySAWpIXJ+gR0CdqUGFax/Q4fS7rbXCtKUp4OkruDl6P3htnx/cZaiH1/sMM+puu+zMEK73mDVurwiRgrWbcjuTKIkmY5HWrSvIMvEWQ0E9DQatu2v++/RwNFE+J/rqh83Avj6UqfqdKADYKsfGPn0esQIa25uDbv1sjbFfBCH3QvnKl2eFv5OK66UCApvVN6e3Hvic6tKo/APF4pPObiQNstaAaCOsWgi/ExiXz73bifkfDqNQFvDC4CI55+RlZQzZ3Ry3s/+dtYQXDUmAhNSDHbMsq65ZLme5EU53f1dud5g3NaefISPasHQURxAPCKs6raxrzR9zvIQl8Srh2fwPY7S8z7FqIdfxZirg+AMNMNRZyP/wVIs+KCBuC/S/46l/aQqL5MKqUamq/MzOSE74z0R3dUeB/BPOeAbZ6UsQmglWfxRvXWURBYb3l28MRh1g=
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR04MB7843.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c27c26cf-9c6d-4ebe-bbaf-08dba8bd323f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 18:24:34.7842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +SgLDjh0I+3+Qqmnof4zbiSgPWwr8Cb6w9icnFpMIsdBc8P6bPSs6R/dlZIAwj0ftzni2qbM6X9PRTntFhRnaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR04MB8726
X-Proofpoint-ORIG-GUID: dNGEA-Hd65Ag_GZDOqPx9Vs760iQyW34
X-Proofpoint-GUID: dNGEA-Hd65Ag_GZDOqPx9Vs760iQyW34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_13,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=999 clxscore=1011
 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290159
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

On Tue, Aug 15, 2023 at 11:26:11AM PDT, Patrick Williams wrote:
>Hello everyone,
>
>Like last half[1], I have also run behind schedule in sending out the
>data for the TOF elections this half.
>
>The schedule will be as follows:
>
>   * Aug 15th - Current TOF must publish a list of eligible voting
>                members.
>   * Sept 1st - Nominations (self or peer) for TOF seats must be sent to
>                the mailing list.
>   * Sept 1st - Developers disputing membership eligibility must submit
>                a pettion request to the current TOF.
>   * Sept 7th - Election Begins
>   * Sept 15th - Election concludes
>   * Sept 22nd - TOF will publish election results.
>
>The current election roll-call is available at:
>   https://github.com/openbmc/tof-election/blob/main/2023H2/rollcall.json
>
>For this half, we have 3 seats up for election.  Currently those are
>held by Brad, Ed, and Zev.
>
>Nominations for those 3 seats may be sent to the mailing list by
>replying to this email.  Only those eligible to vote may be nominated.
>

I'd be happy to have another term, so I'll self-nominate.


Thanks,
Zev
