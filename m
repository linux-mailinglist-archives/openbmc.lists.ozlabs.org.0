Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C686348469
	for <lists+openbmc@lfdr.de>; Wed, 24 Mar 2021 23:15:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F5MxZ43hMz30Kq
	for <lists+openbmc@lfdr.de>; Thu, 25 Mar 2021 09:15:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=equinixinc.onmicrosoft.com header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-equinixinc-onmicrosoft-com header.b=DVNPr2me;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.159.192;
 helo=mx0b-00268f01.pphosted.com;
 envelope-from=prvs=471742a9cc=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=equinixinc.onmicrosoft.com
 header.i=@equinixinc.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-equinixinc-onmicrosoft-com header.b=DVNPr2me; 
 dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com
 [148.163.159.192])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F5MxJ3qlSz30Bl
 for <openbmc@lists.ozlabs.org>; Thu, 25 Mar 2021 09:15:14 +1100 (AEDT)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OMD0KB018279; Wed, 24 Mar 2021 22:15:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2103.outbound.protection.outlook.com [104.47.58.103])
 by mx0a-00268f01.pphosted.com with ESMTP id 37d8j7prme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 22:15:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Is2rSJl2vucU/SAEeNWOppOoXnHjjJ8JiG/lirzZbTM08q6JV+S32ezTJv/q9LQ/aZvW5yLrKnV5TRGCQGD4RumWX0jE2Z0scXw5luk11isxl+FS1gbIligXXSepxW3Pk6Kbtmf+YPqXFo8IHNSOP3ATbOe+Zi9NsDRWdBa0+lx7QZ7ORjh6L/DvNAKiodSHzqO2Jpaw0/NmPojaZFPkNJXvujssie+gGfZ9yTKlCzHet+zfC/DxSG0Axj8k4Ia8ecacatKbJFHMvjnfM0vb8/MFevDs1jEu4v8eTFaa527xfc0PCciiMjMxP9+tsa9zGvVtNJP/wbfOB/woXdUF6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSeO5KVvm7b7EIEJVp4ps1P2ZmvtQyCl4EWJJ0kg9AQ=;
 b=npXC5a0oDKmrv3omKklpFpyRBo4vekXGau++Sc4G5N1JT8xeqIosiJvqCIwnVnPdoTP0GVHKi78LrP2U4Jp3Hf3srPBj75M5bIuSz4MA2JQwdpC668MCCZGxmvBWEjCtPDryyfe05meAWqO74JPLlo2kI2HZsz/yACDO3Jb9AFikqTuL4TaqAx4r6PYgjGyMsX0m/Hv7CLkkFwUtdYYXzyjzVq4YGAxU/bJ5bxWaoYwMX2PIDDWi1KLBMehg2PUldY2uHRyutrMdNdLfUxUX/IBoRDE9q9Ba9Ekg6NCbuCS2cim+O+jy7uyyqEAwFKxxJpmLpaimOlKLkqvWMCIxUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=equinixinc.onmicrosoft.com; s=selector2-equinixinc-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSeO5KVvm7b7EIEJVp4ps1P2ZmvtQyCl4EWJJ0kg9AQ=;
 b=DVNPr2meG5A6FKJpV2seNEwm/jHwBOSc/ll/KUsZjU3rtV9OeJh4MLGZUO8r63tOZZdZbgc6Aankjp4kGgfzNtt/9X9v6vPkDHyFS1P8OclFq9ytkzBb9BpI7ZRaukyUuo2ixmpAIQen4e2r1GQsGXT8mgOEaN0q5Z63X7uKalQ=
Received: from DM5PR04MB0762.namprd04.prod.outlook.com (2603:10b6:3:f3::13) by
 DM6PR04MB6281.namprd04.prod.outlook.com (2603:10b6:5:1e8::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25; Wed, 24 Mar 2021 22:15:08 +0000
Received: from DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad]) by DM5PR04MB0762.namprd04.prod.outlook.com
 ([fe80::4c98:aeb:87a8:13ad%5]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 22:15:06 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: RFC: ASRockRack E3C246D4I port
Thread-Topic: RFC: ASRockRack E3C246D4I port
Thread-Index: AQHXIPslhF1rjYgJgUmBZivSy6DePA==
Date: Wed, 24 Mar 2021 22:15:06 +0000
Message-ID: <YFu56TGJQyKRSOt2@packtop>
References: <YErVxrB4afOz1ejt@packtop>
 <CACPK8XfpdF7_Thsg-96nkneoQDYayTEznbR8HDCOePG4=YruVg@mail.gmail.com>
In-Reply-To: <CACPK8XfpdF7_Thsg-96nkneoQDYayTEznbR8HDCOePG4=YruVg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=equinix.com;
x-originating-ip: [24.181.166.149]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: c205f32a-558a-4479-d2e3-08d8ef1247d0
x-ms-traffictypediagnostic: DM6PR04MB6281:
x-microsoft-antispam-prvs: <DM6PR04MB62815C1123B71F9DE63C4347C3639@DM6PR04MB6281.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZwbZcUlPRvpQ4ZNNfgzGdBWdMmLPPDeknPlrEjOmhkeGQ2xnmyA5EcVC+S9d6Or/DGNG6Xim3hrIIjTDOu9xvn70EvIKLKcQKdbRCrGrPP5DtWVSSfo/hikiHEgLZ22OUg6Zel8dqsI2RwwfXgIUSxeYRVH9tjtCbiy8//r5F8m9zoskmH7YqFDsj5NUauW8x58Xzu17gM+igzyzTNYTQl+l80gGhqkZQMrraH7ewF1wkolLsafIj3QNJDiKZfZYcOreFn9AewXfY4iL3NCEyc13v23im9eDZZfun74U7isMfmFH8i0mGzwV+29f/mdf1Ihg///oUAZjYlwtQHE9OrlrfLX9HcEzkbs3NG/LuzVtOXmsuKQZoUNBoC6KCHN1HmPIFORJqtFoNa085xkOItkue32cc5P0Splyjtdg+VxBCia91f18aw2aFyLTq5RprDB2V8iRTHysE4nrgAb0pnvoVTa3olN4KbTmK6E7NBWK/fe3vHtobBtODlukpCpodxjpzsRS4nwmO75iM+fibglKzl+zWxJcDKA623N/HHCiRTolIEgxkWu0plf8AEPWi2GEsymERkkpQmk2bkUOzh6eiVeeypJjuFU8YZrDxj2sKDql/9oMme0rjMxwIEk1+i6WCD8BFeg41c6D8/jfJ2DiEeFkEm4SSzal9+TBoa0UxOHUtz8cWTD5dbh3fvV/nRylCynC6g/8sR668WcRj8I5/wHm+3McVA676u6Cl10=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0762.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(4636009)(396003)(136003)(376002)(346002)(366004)(39860400002)(6916009)(6506007)(66946007)(76116006)(66446008)(64756008)(66556008)(66476007)(478600001)(2906002)(83380400001)(8676002)(966005)(8936002)(26005)(6512007)(9686003)(71200400001)(4326008)(5660300002)(38100700001)(6486002)(86362001)(316002)(33716001)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?sPS+fWUDuIT05Qb3n7OCNPQ/rEAoUxCBQGjlfEX4PXN35DzcQ//QAMVY9VHV?=
 =?us-ascii?Q?D0jwQ526kjyD/RfHIl86PnsUvggxQfpH0XiwElRUk7ntDIpovgZJslBlvDnR?=
 =?us-ascii?Q?Km0GLo3SjcKVzA9rt1DYLlXqTGlAzfhmG1izcQM5zuyDqjSZTub7wGkJ43pX?=
 =?us-ascii?Q?p4ZUw4pfhrLmlORGstHB8o9tjjUGXJP9PAHDvWnB89bMbkDTuDdc1NK4ZFqt?=
 =?us-ascii?Q?p8Qvje7zcxSvIl180iczu+Zn9PrNle+B1PptsYQ1t2FiiuvEC8AO4paNCFt4?=
 =?us-ascii?Q?v7naWy9HYsneOmRWTaJHW1YixlRwHFI40XP0/OmK45k/unG+iba1vPTqYESz?=
 =?us-ascii?Q?ctkFV2jcCzJFpjfP6s6aCRrarmormToKkcvKZmHZI/dRTzrC4wxLVYkfiCaT?=
 =?us-ascii?Q?brBkFDaaXjGvJHzxLGdniI9IIRiUOu69aH/0rbTvQ2DuKc24N18YF8vecHO9?=
 =?us-ascii?Q?viQRxLqWWQ3me1hEsYJwg08yqDUrXPSGMA2+W1ZgavxKWbY9M2z3vH9dr8uR?=
 =?us-ascii?Q?j9JgN+h2j4tvi3U6Im+msq3OHX2X2mhNxtxjiE+R/AEyqX4yOezqAHPpmYoq?=
 =?us-ascii?Q?00tBgMW3dLyaUhP7/9Bz8PqYBYSy+gzW8vkrSHNm4mZXn0KwXEKtTFUZxc8c?=
 =?us-ascii?Q?KnT/QgwI7FKoTNZdnftPq2YUIEJT5Jg10KlUJQjgXsg9DWdFd+JlyG4NbyLj?=
 =?us-ascii?Q?DJ2s1Ki3uGSUcg4Z9Q+7ezmzjUZDg2+hnY9RO4940YeW3zAvZ78AnKLWM2lU?=
 =?us-ascii?Q?1AKYMxpFwMuVoSG5b+IriNwYxToq/IKGMHw0IuFUEB1uPCs1nwr6B9HIbDNm?=
 =?us-ascii?Q?ORUBj8GUwuafdF+EhbfhWwsmExRdC/l2yy7JdQQEwJxlnKaboeU+IChtuID+?=
 =?us-ascii?Q?hwDo9aR3skxtPDuBKmQv52J02sqXYmKQnftU00F89+yRJkyGkjyDN8e6TF2q?=
 =?us-ascii?Q?GQJYHntLCXeuX+lbeFqqRlyAnPZf15mIYJpE5gbA/+SqA7vUyRdi2yQneBWo?=
 =?us-ascii?Q?XeNXTgdEtSHY+ieLy5ewrIt22GBEEncZoYiyf5mJkKicPvqy4u5cZYYWATDV?=
 =?us-ascii?Q?TAkyMmgFhAh2GtkpRgyZa0XHObBx+84OpI2LcAC84yY0ybThAI75mYcV36oh?=
 =?us-ascii?Q?dvq5TR0tu4kvzErbriBGYsQXL9mfxlDlnwOT69JgFfFvHUyhXTtgeWntZKaJ?=
 =?us-ascii?Q?g0GaASE3kjsRwDSVcMiKXasavIYGkELEUNsZkkto/MyeXJUq7sUV4xgQPM3P?=
 =?us-ascii?Q?xw7aGGTTfb0AMn6MWXAP9H8mkp3bBCi+jrrvOcpbKIulUMEM0rbhsTFLvPjK?=
 =?us-ascii?Q?ByFn4QYs3Et88zwnLQ4c/OXm?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F072155A1E30A140A2E198E3125EA445@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0762.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c205f32a-558a-4479-d2e3-08d8ef1247d0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 22:15:06.3983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ox7BVG8FgWEksUTzE2DpY5/CtXnSv1jG6rws/D3ugn6PjXFmw1aocXdVINUmtkVlxiofhaVSzxl8PHKLQUbC3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6281
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_13:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 clxscore=1011 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103240158
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

On Tue, Mar 23, 2021 at 08:50:07PM CDT, Joel Stanley wrote:
>On Tue, 23 Mar 2021 at 22:25, Zev Weiss <zweiss@equinix.com> wrote:
>>
>> Hello all,
>>
>> We (Equinix Metal, formerly known as Packet) having been working on a
>> port of OpenBMC to the ASRockRack E3C246D4I board
>> (https://www.asrockrack.com/general/productdetail.asp?Model=3DE3C246D4I-=
2T,
>> an AST2500-equipped Xeon E-2100 mini-ITX board), and we're now looking t=
o
>> get some feedback from the community and hopefully start the process of
>> getting it merged upstream.
>
>Nice!
>
>>
>> It's currently sitting in a Github branch, since at the moment I'm
>> mostly seeking fairly broad guidance on what sorts of things will need
>> to happen to get it into a mergeable form (not sure if gerrit is the
>> right tool for that).  Anyone who'd like to can take a look at:
>> https://github.com/zevweiss/openbmc/tree/e3c246d4i
>>
>> Known issues, in approximate descending order of significance (by my
>> estimate):
>>
>>   - The kernel situation is...kind of messy.  This mostly stems from
>>     having a dependency on the PECI code, which is why the branch is
>>     based on the 2.9.0 tag (the last one before the PECI patchset was
>>     dropped from the openbmc kernel) instead of something more recent.
>>     We've got some additional PECI patches on top of that to work around
>>     some limitations in the PECI support on the particular CPU we're
>>     working with, some of which is fairly gross hardcoding for that
>>     specific SKU.  There are also a few non-PECI-related kernel patches
>>     that I've posted upstream but not yet incorporated the resulting
>>     review feedback on.
>
>As you point out, it would be great if someone could take on the PECI
>maintainership and get the code merged to mainline.
>
>Out of interest, can you still boot the host without PECI support?
>

Yes, we're using PECI for monitoring CPU thermals but that's about it;
we can boot the host without it.

>I recommend submitting your device tree now, and getting some level of
>support in the openbmc tree. From there you can work to get the other
>fixes into the tree.
>

Alright, I'll start out with getting some baseline bits and pieces in
place and see about the trickier parts when I get to them.


Thanks,
Zev
