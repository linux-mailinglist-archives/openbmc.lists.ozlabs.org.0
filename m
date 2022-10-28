Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE52E611293
	for <lists+openbmc@lfdr.de>; Fri, 28 Oct 2022 15:24:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzNZB4klHz3cFQ
	for <lists+openbmc@lfdr.de>; Sat, 29 Oct 2022 00:24:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=Zud0YHTb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.148.236; helo=mx0a-00268f01.pphosted.com; envelope-from=prvs=430077004c=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=Zud0YHTb;
	dkim-atps=neutral
X-Greylist: delayed 5794 seconds by postgrey-1.36 at boromir; Sat, 29 Oct 2022 00:24:17 AEDT
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com [148.163.148.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzNYY42Ftz3cBv
	for <openbmc@lists.ozlabs.org>; Sat, 29 Oct 2022 00:24:16 +1100 (AEDT)
Received: from pps.filterd (m0165118.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29S4RkM7023084;
	Fri, 28 Oct 2022 11:47:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=BS9aaSnYfiM1OnYF7WNxyaZHcAKwgDqieO939MSqUjE=;
 b=Zud0YHTbB5q17OcZUarB1LkeZ7sawyBPKbpo4gBckXAizk2ZtAL70ZmHG5vtawUT8DIv
 HAXodzmmVKt8J7o50kP2LL854aLkKZazGsTETo7Q4aQSyzGjXMqQQQSJEEuoyVZMDsUR
 PAJzBhN4Tfhfk/2kfjBFHcOH4bCZ5GvakzGI+WMp7KpOSlEc9V4IfL2fTScYV0jmIjpq
 fQM5zypXe/kb1FagvPijgnxnsuIZfF5vdEc7QlDxuZnjJaUEdQ6gnxS61EvhRZdOGoXR
 IcbZZRRd2gAV8jCtUveVpaH0cD4XpSIm/ENw4lTQ4aG6MjFRfAsTmSxgITS+LVa6nk2f tw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3kg82v91b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Oct 2022 11:47:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nj2NE7QZYBp9AEylQ+JkWZxVMC1Wb/jGppD3gFFM8glUandPKzdw0C7gzWUcI+UjoiyGRD9tdXppDzt5pKVO/C77CFXt2Heds19QLScMAUW76PjCyln9DJVtNHaW6EacDg3afDwrnrz5D4X3cC081Vsaisg/tNIc20hUuAZEk1vIo4NGi4kSia+KtUzzHuxvFTbdtPJx6SVHY8YQG1hhqwwqEf2L7lZ5R5ii/P0lJwXEPZ3TcC3aZdXWR44yUjLevIwWqT5hpC1FpApnVhBpR97Gqk5WOusdzpXI+s8WqrOcBCclT5gY3W25CvtIPcsVaLU7wmGCH1TgODQ9PpUYlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BS9aaSnYfiM1OnYF7WNxyaZHcAKwgDqieO939MSqUjE=;
 b=WYcY7H7Q9hJLl2CPKrpvwW9mMbDhWr8L1JkpCPwqFse7DhcSu/8WTlITvyLx+FEzapcG5ft4ugJ4kJhgVQ1C1iRQlMKv0fkYzA/G5c3J4yc2L1g6kEhZSJv13KFzeUeqyIcyJDF25hz8KVtc9Pj27V/mcFr8DdJ/DI+kOn0HO0njLAKsIy+4L4HdjWD2a+QnZMePG06nhuriQQvBUubgSdjDiEvELKtpv1tj0lAn3eVD4UVzaGoYYBUED4RNhIfN4lswujaWSW1XsnQApCGBwav8QEosG/cRZGE4Enz7tv0sim/3kQ3IRGtE6qvSIov7WD9HwBAwdE9Gvo/HjukX9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by BYAPR04MB5223.namprd04.prod.outlook.com (2603:10b6:a03:c5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 28 Oct
 2022 11:47:33 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::db6:5b31:1480:6e13]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::db6:5b31:1480:6e13%6]) with mapi id 15.20.5746.028; Fri, 28 Oct 2022
 11:47:33 +0000
From: Zev Weiss <zweiss@equinix.com>
To: AKASH G J <akashgj91@gmail.com>
Subject: Re: RISC-V Support in OpenBMC
Thread-Topic: RISC-V Support in OpenBMC
Thread-Index: AQHY6sMQtOmoM6qSqEywOzRzddlIrA==
Date: Fri, 28 Oct 2022 11:47:32 +0000
Message-ID: <20221028114732.GC18848@packtop>
References:  <CAE33tLG4oOjTmNJ=a0jNEEdTj_501offkYUFcEVwk6rAnZYKSw@mail.gmail.com>
In-Reply-To:  <CAE33tLG4oOjTmNJ=a0jNEEdTj_501offkYUFcEVwk6rAnZYKSw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8007:EE_|BYAPR04MB5223:EE_
x-ms-office365-filtering-correlation-id: b13a938b-2625-43b2-d62a-08dab8da3362
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2ibEReH2IKF2T/CPU8A9Qx1q46HX8T4MLnxj3hsQDFHLBR6AJFrxGCancfdsF6QEQAmudWEWj6eCnXGFEwXIT+WAo/IA5hWHGgjTHsPlRXKFjaUZTbewYloCghGpUodH+lTvmQPoxx95J4JngiVGPyX7w31NmbT/GVEGAhff0hKpI2J6ljO31IJf1HyaKYpAolDQdOQLz/gJgM8MC56uL+jj+OxAnquSBXrB9yTrx/QNZa8DoDfr3VH0WNw4swUOEJvs12kMrugAIGr9IIpI0EF+mxooLio3Na5waY1hk8qwoc/CfMt+ejXMPuUc6pt6wLaRpM1VVRdx1DCwiTqD4EiHLG/1QGiAKR5zG35AfhdMN/nbod+DeBNHLjzFypte5gLvyQNUzOjYr6SxtAOHw/9lKCwVA8XUYfDBJrGqOGYWfnt1xzxW5ixZ+s3gx/1huHWWfxgBYsIKom45C9gJDYjIze4qnlZVgcL18A3zgwoXKBpQ2FwBxci6YOvtYWSaPq16Nx9FQCk2FfHYpCPjoCt/fJxVUgxjYAeYMQElwrUkOKcy/2TiiZXz+d9cVwEwbCRSXDAQshqhJwzOz824314Valtvo4H07ejO7jT4vabFMG/AqN9uHyUBNJI+p8vwo2+UlZlR4p5ROP4B3vMBM13vX9P394sg+aLPvvpqFRZTFsibfUsXWviGLLgToufSNPKwha5XG+UgTCZU3woJZ/aW6DYFtInnk89Uv2fyHvcW44I8NLl/aDT5jP7sVXJB1H1HNx78gFYjk6hpRhYSOKy10cvtCZljU5TrCpVv8yw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(136003)(39860400002)(396003)(376002)(346002)(366004)(451199015)(66946007)(316002)(91956017)(8936002)(3480700007)(6916009)(6506007)(66446008)(64756008)(6512007)(38100700002)(38070700005)(66556008)(66476007)(8676002)(33716001)(86362001)(71200400001)(26005)(4326008)(83380400001)(33656002)(4744005)(76116006)(1076003)(186003)(9686003)(122000001)(478600001)(41300700001)(5660300002)(6486002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?DnrVq6o1jjuS2R4mi3n4Dnb1yxc91plM7w4yD5Okm+R3vrpw/8zP5zS5zKc1?=
 =?us-ascii?Q?smaJFRRp81+zNPfJEJhYVHug5eAbGuCpGaYoTNKiNRjfEo5gzoIEDdc32RuV?=
 =?us-ascii?Q?bU01kLWDkVVKoSmH5OlI1Ai/kPZQgg5yRSOg4Ug3YNpy25XCTKbItGbJlhQT?=
 =?us-ascii?Q?Q3FRXQhWBxuq3w4A0C7M6p0kAOBZUXVUJFFUBV+0TP4tzmM6yN83ZMLJqvoR?=
 =?us-ascii?Q?4d9I32iM8IJHxMkOiGANxMPuu7fYin1YLTduRu5sKZlCNp/wJx2QoU/nZhyP?=
 =?us-ascii?Q?aJceVCsB+7ACJsKwACABvLBkMEuECOgE9dmVjyvbA2FAj9ADX2eNtz8pF2EP?=
 =?us-ascii?Q?cg823ZcskkASgcuv1GOrmgPRyEjh7/7m4ubTEGk3Kyu1QUS2xJIDc7FkOqzp?=
 =?us-ascii?Q?YWU4mPIp4hf4GZgS75b1simhM5wrvc+nP/7SRp5Z/jhuycmf7f2IfebnSVCW?=
 =?us-ascii?Q?iYbc0S/daxMzUwJXUVNIk/uQcYw9N5a8qINGWX5neVRgqz1T/Jvi4/jfUQnV?=
 =?us-ascii?Q?NRDcClzBADeb2vyrjO7neP3uU1TrFatuNaGWuUyyZ496qNTGTFtJuOpYMnag?=
 =?us-ascii?Q?W6IKPpEWETZ+tEWSVj7gmYTOnM2akXNi1rx87kkc+6HpQNMD9inlBzqM6cH7?=
 =?us-ascii?Q?zVOWJxIT3Omp/gTvNAB4W2kx3Wf4Hi+ZgJQ5YUAGtUMucnaJydQH2XzbL1Cj?=
 =?us-ascii?Q?LswKOoZf0gqsTjPfUfMklsX1GjUvzuNgmPQf6V0Ay0irxudQZKD2Swpm3RLM?=
 =?us-ascii?Q?L3N2hW4QVHjUpXDo8bsntot/o+ARH7GB/U2UE84nYW42iVeBPR4x7xyuTrkM?=
 =?us-ascii?Q?y/0Kaphr1r13Q9UlfAN+k1LAXhdEBVbZnbjNEI5jQHvrbnkdr2YhGo7Rw7aQ?=
 =?us-ascii?Q?lzaOZjL75/NiVCRW8mDp15hV4bVr/yrpvNATnXV3tbaxjDx4Pwj/4+O5cezS?=
 =?us-ascii?Q?v8hJh+Iqw96uNy7mNcunZsnQRWZOq9B8QqeY68oqWFLZao1A6cabdLdrsA/z?=
 =?us-ascii?Q?rR2017rPhEVHZ4pBmKNx0WDfeiM049X7GmfBeKs3I6BQ7xLuT33ySkB/4fdu?=
 =?us-ascii?Q?dYyH1j/oRN+oZhZrNKyGzc34OzNg+ioSON7lRMXcudr0JBkONpdUQxMy1U+V?=
 =?us-ascii?Q?uy89KiE2CFC3qW3/kMly4roVUMYm0Gcr6a7m14qay9o+qnv2vwXFV2N/isj8?=
 =?us-ascii?Q?8OnN5r6jcbUQznyr3wfaB4Pz9hSp86w/zBMOW7rw3NqQ+0RS/tbLC041zY7V?=
 =?us-ascii?Q?vCMG7yUVYRrhFXD5ycXiovntmZzZ4OVLYjidef2CD/gQAUCOmgebbKaSQwUb?=
 =?us-ascii?Q?EdUGFc3VlkYE5X5+br8rVn3wMDUyaigydnP1ZoVHdAUGGHEGC1x2J4q1iK4a?=
 =?us-ascii?Q?V6r6dSNtQeO08UjUOt4H9D5w+CO+onB9oDJz8zBV44EaSwPhyHxCqyLwCpv/?=
 =?us-ascii?Q?U83dPko5hMZdUe/w/BfqO1Ln2I0ev9t1hVAt9z/sKDtiq7c9PWFG54c2FZMx?=
 =?us-ascii?Q?1P4y+z1viV8OvF5kwquPBGRZaDTmAyK7CdRUc6UlpAwlE4n3YPYwvWDeRSqv?=
 =?us-ascii?Q?sEbSNCfRgZsm659IO7zLLKiMI+vk2BLFfNIqidyv?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <64B075904C3CB547914D4EC2E2544F77@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b13a938b-2625-43b2-d62a-08dab8da3362
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2022 11:47:33.0450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XODWRQh40hnp/lq7jnuSMpfNSJeHB8oOs9+v6GmPOwt8GVw4hKQkNrIIM3VNu29Oxxru6w9mPlP2EOugvGEe5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5223
X-Proofpoint-GUID: UufIofrcOWwN9gGBvM9HWUzi0Oq5tHhs
X-Proofpoint-ORIG-GUID: UufIofrcOWwN9gGBvM9HWUzi0Oq5tHhs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-28_06,2022-10-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1011
 mlxlogscore=933 priorityscore=1501 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210280072
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

On Fri, Oct 28, 2022 at 07:00:00AM PDT, AKASH G J wrote:
>Hi Team,
>
>Whether OpenBMC supports BMC controller with RISC-V architecture? If so,
>how we can generate BMC firmware image for the BMC controller with RISC-V
>architecture.
>

Currently I believe the only BMC SOCs supported in mainline OpenBMC are
the Aspeed AST2x00, Nuvoton NPCM, and HP GXP chips, all of which are ARM
based.

A project with OpenBMC running on a PowerPC-based BMC was also announced
recently (https://codeconstruct.com.au/docs/dcscm-openbmc/), though I
don't think any of that work has made its way upstream so far.

I don't know of any RISC-V based efforts though.

>Are there any BMC SoC available in market with RISC-V architecture?
>

Not that I've heard of at this point.


Zev
