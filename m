Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82674644F83
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 00:22:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRc075mxSz3bT1
	for <lists+openbmc@lfdr.de>; Wed,  7 Dec 2022 10:22:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s3cUtxG0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s3cUtxG0;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRbzV5M0fz2ybK
	for <openbmc@lists.ozlabs.org>; Wed,  7 Dec 2022 10:22:14 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6LPnWp023142;
	Tue, 6 Dec 2022 23:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=6otABQVXjrBtux5TT5/AwOJvj2qTAE1tUGR8y4eVkjk=;
 b=s3cUtxG0ICUaOLnO8Iv8JwRb9KMCXGceaxO9Bxm4t/PAJu1vdthFxI9SS8+2CsQcFHUP
 vEI6ibuBe4o1rHFpAgHcoRRVwXFujV9asVqN5gPAKxuSEmdwvWNHz9UB0aO5C7DClQcc
 pLg8MYwreF6tDlleD8sqnqlfVrymOu/XPhlXAtbXwQPjtXMQ9V2GRTPIcCM635wdPe0y
 jq815WmqsWkF86mDnFzyl1fhG7CVYNo23XtxOSQQlLw49ccAuIMfksh8yQN/yJvC3jlx
 E108UMsaDeSjjONl+k0OF/giZhkW5xRh0oKvArG4oNC4ececki0AHvsMdHEdowl67bHu HA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3madn6amkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Dec 2022 23:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WACUTbr5SRPSa9MghPqjjrdKAzdtrEmALuMpO5BiL9uPo0+9e2zGhjJXf3QtoI/u+6P6te5oyyePG4KH+3L9laqB/ft9vXa6IJy3HdxIlFXEur1CC9pbjXN8Lh79LcD4fJ3TOWnvDfPSPz+3yLqk4LfiePahtPjnk9X6IdiATFhbYsvQxUMYv4QMIAmPrW8aMk/xFEdsTTVnyhE/OS3Nt+1PjSvk2UN8qZmWOxjGLCNK30R7jlY9aOAEOc8KAh3D8F9s8l8hABeeSTnI35i74FIN30niKcfwFundHZ9SbQMHd0JgqrIHQlZQMZsqoBK+tt65Qo9A3K72ZIvUcqLu1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPsDLJ4wH3xgpNK7GJZKRUCGyM7iSJmcIGWmBFGCetA=;
 b=KEHdKUZyQQoxMdeLvPBJxkfQ2tunO/Jp5I5yOj7r85Ugt/aqj/1SE2jS0m3/2fptjwgLIiYUHmvGBdxeo1G7a/jWfHaytc9KrfQko+u1bSgLr6Z4S1hM3uD6q1oawfNPbIoxWS+6v0DY9ScP62SgecMI00oLE3qstc6pyUfpm+BDie1jtn0G8t5Qa9lbecSRzOg7v5pOPy4gWinYnwtiTEBnsrV8IsPbrbh1j8hvxF6hYnZaUZfawLr65u9TD0BYukPRjWcYzxvbxa3tfNNLLZ4iUVLgmYdu5d8LONqf59LSo5Jm/i7M40gRsHf5dDyK4QGwdsWW/8ZeKDjRC+4myg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=us.ibm.com; dmarc=pass action=none header.from=us.ibm.com;
 dkim=pass header.d=us.ibm.com; arc=none
Received: from DM6PR15MB4121.namprd15.prod.outlook.com (2603:10b6:5:c3::14) by
 BYAPR15MB3416.namprd15.prod.outlook.com (2603:10b6:a03:110::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 6 Dec
 2022 23:22:08 +0000
Received: from DM6PR15MB4121.namprd15.prod.outlook.com
 ([fe80::36b7:fad9:e81b:28be]) by DM6PR15MB4121.namprd15.prod.outlook.com
 ([fe80::36b7:fad9:e81b:28be%4]) with mapi id 15.20.5880.013; Tue, 6 Dec 2022
 23:22:08 +0000
From: Milton Miller II <miltonm@us.ibm.com>
To: Rohit Pai <ropai@nvidia.com>,
        "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: Re: [jffs2] handling flash corruption
Thread-Topic: [jffs2] handling flash corruption
Thread-Index: AdkJqILm4mUCK9dWS6uTwPMluau1bgAHaidN
Date: Tue, 6 Dec 2022 23:22:08 +0000
Message-ID:  <DM6PR15MB41210ADFE04E00AA9635F34D8B1B9@DM6PR15MB4121.namprd15.prod.outlook.com>
References:  <LV2PR12MB6014DB772E0529929A1C3091CD1B9@LV2PR12MB6014.namprd12.prod.outlook.com>
In-Reply-To:  <LV2PR12MB6014DB772E0529929A1C3091CD1B9@LV2PR12MB6014.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Hashtags: #NewslettersPlus
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR15MB4121:EE_|BYAPR15MB3416:EE_
x-ms-office365-filtering-correlation-id: 420aea1f-da5f-44ca-db57-08dad7e0b1dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  aXWCKOcVBItTZls2DcASuEkr0iNUeUa2vgkrAT++XBZH8VMiEG4hYfKKmNlkjnY3julX1UQg4iEEncWB8XvYqWx56VPvSskMzpDnP3yXQuUtN8F3dGhqYfQYY1e9lA4HVdBn6fieBejwHWpiCVzVT4Q2pT78VLjife6WCd1GvHHmRBuRHTI7Thtw68hkRCRt6TF2+1PzQ/dBC+EP8/UKD7pNIEozBTYqXEcQzYaACSv6ylF4KjxeahpbfzmPu1KrUjn9rhQylMHq3Mp14FaV2eMhi/Ko1IPo2gVtIACtavSZzQnp6Tgj/tyWMmEz9s3O8oJiU+leb4FhHj54zHUOYPTRG93I6+hOIqLfxrPJCx0Kwg5z/gI1uydMkVKFG4vn4OJQUTbX/J1rz5GO79imLCOLjlLUSjkF4GDOHWQMyAhR1cEqYGoZDmtNdZiw8nU7RS9y+y72AOmBbSL17m+6M79k7T4Mt8eRYvdiXxn0ykxq6spZzUDKnDeaakuBdh/PJA3Gp3LRNsAVrkxvF40ycmiz6BAHGZhgSEqJN9ivskuMrfPf8LXvVUWeGF3ddSxme+WDl4wbEuK7kakEQS7GY+0FJ16zqgt4nLAXkmP3AjelW7qqqbzSVGqSl6uuWrihlLU0+4HCHG9ypF7Uct+dS78eLskwmSpMBgINzH0+V84LfirCjQsa4vySX3zp0oeJBII5k6HcblZWqirBl0w5kh6rbBIFiU3Nd876bGZApKw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR15MB4121.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199015)(83380400001)(122000001)(33656002)(86362001)(41300700001)(5660300002)(38070700005)(2906002)(8936002)(52536014)(55016003)(8676002)(26005)(6506007)(7696005)(186003)(64756008)(9686003)(966005)(110136005)(66946007)(91956017)(316002)(76116006)(478600001)(66476007)(66446008)(66556008)(71200400001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?Windows-1252?Q?KUQFfl4knGC3Vgf3grD7EPQzi4bYF67GK+WnebWdjeRzHEfAZN/wEQzX?=
 =?Windows-1252?Q?updLiKs/ktnff4Cag++PsunWq9Ynnt3M2GApd+y5eLEfeiIMCMIL7Pn7?=
 =?Windows-1252?Q?IqF+viZDculR01Uqj3Kx0DTULYR6Os+/f0c/dz/ZI1+cxjaf5Gxrezr8?=
 =?Windows-1252?Q?YHisljp3/GhSgPmalzSRh922RojWU8WvHQ/to9pnr18qv6CD0Cw3dWGn?=
 =?Windows-1252?Q?GG4uqd2otb0pDtLqQkomzJzdaSYaKgW/vztpuv/D/ojil905K2URJfQm?=
 =?Windows-1252?Q?hovlefzU6iH/6+EkPlFmV5P2PHh5LiW1yyk5mpFA5ELACVAOQ1hdhGRb?=
 =?Windows-1252?Q?EJpfkGLt5j792B4X7Y5DWYR0zqmeXFbopqFFSzwiTRy+csXm4HTWFJJA?=
 =?Windows-1252?Q?mGhCFPpcGsUYVIkKJ3HY2Z52yI0EfmdUYp4LuvyLcm1iUuTzVuBpZvlN?=
 =?Windows-1252?Q?YgoO5E8AWLrzvCsRMm5O0cqECDjwhIOoCW3esU5tpB+TK7GOZAJC6BOG?=
 =?Windows-1252?Q?QH0wB5Q0Tpny0I1tKGoGMR5ofxynTtwsdHg7hj+VROxPSRatJ9Ogeiqs?=
 =?Windows-1252?Q?Obj/nXNKqjMhKGqQfzKERfoOUVQsdxFsZktHPTFNzvgCuAgIfsRyZfBE?=
 =?Windows-1252?Q?yDHx/FdkGLmovj9t2N5Y8zZe5klduleHQv/P6ZUB6JQuHGFcT3SA4nTi?=
 =?Windows-1252?Q?8SK+nqCoZlAiJ15nNS9txXCDhMvhCqCp8Fl2dg/W53cqatoq9hcYquaY?=
 =?Windows-1252?Q?FGcVHS4o/Tlt6zyk9LwYUsztt7XVWi1FJahmdWwwTC1OykCGJPiwouqD?=
 =?Windows-1252?Q?QiO4D/Dt1vjocIXo4F8h28DATAa780vA3Y1qj61G9vTYxFiTNB+Gm8T2?=
 =?Windows-1252?Q?VZGFzffr/RghqMmKUAWYxMtkjX6uoXipaFvpCK7WdemYtf+/R5J0lxGT?=
 =?Windows-1252?Q?MZ4YsFV9NcLlTKootk/BqEF1xx5wE7coqFjTWzNCUM7LdQBDs1NrGBf4?=
 =?Windows-1252?Q?8opO3TqHOYkRrrGnpiwgCemozxIxSyCM65dbc73X7QCkfePv3MsUo/gp?=
 =?Windows-1252?Q?Ews4Ur0v59wBdzpa1LlzSOx3UxoRggzMzs8hZ7O/yd/qpMHgjfvoLIY3?=
 =?Windows-1252?Q?LseXTwHKcJYTXrWlhLK7RtvdZ7pmZrzqik7TMXGbcOxw8nMD2Zv93uEt?=
 =?Windows-1252?Q?77KSo8EfmKxzMtSt2BIXJgwU4iLy71n2y48HybC3UWgOM2NGxLe/CuuH?=
 =?Windows-1252?Q?JxTMLw4wMa79g6YwkOZeTYqV7ws2ozkjaoYNxG9CROuJBkYm0WmqRE1W?=
 =?Windows-1252?Q?jCczMTDPfLtJKAGKuGYvcQacXtIQX2LL/jv8mRwHOeehdaxubPwhjER7?=
 =?Windows-1252?Q?4cjCQPwD0gBdXLbIyVWglKCZ2JRaQnoaWQeZecSZpSXobQ6zrwTnnyJZ?=
 =?Windows-1252?Q?L3eppjtDh861wbFr4j70c1NHBagUtcQHkqhwSODCG8C74+tYNBi2wBp9?=
 =?Windows-1252?Q?ZpUKeoKOXBujCxxQpyUR2YDt2SQKWNUheLl08pLDaVDpiiXnsKBRdLyG?=
 =?Windows-1252?Q?VHpXTYio8pJTAKOB9ZQX6XcUKmuonSumgir0ZItBCvdgReRYL8xb0Zaq?=
 =?Windows-1252?Q?ABMaOUZiFCnt0qH6CGY3awXKGk0KnoJkz2XClk65mBg5BDF+9I/k0TEj?=
 =?Windows-1252?Q?Zct0vSaTAMU=3D?=
Content-Type: text/plain; charset="Windows-1252"
X-OriginatorOrg: us.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR15MB4121.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420aea1f-da5f-44ca-db57-08dad7e0b1dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2022 23:22:08.2787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J3V0lRK0tYqWB7UdRoI7I3Q7i981gGEmKp9lp4xTvRiNPtrOgCcZX4M+tJ9LSElpQknFf2KwETBxNyvhJO/RLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3416
X-Proofpoint-ORIG-GUID: 8pr0mx5hl71MuEDJASNuf1FAvyLjS_kN
X-Proofpoint-GUID: 8pr0mx5hl71MuEDJASNuf1FAvyLjS_kN
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_12,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212060195
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Rohit

You didn't say which spi controller you are using, but we did see similar e=
rrors when developing=20
the Aspeed spi-nor controller driver.

The arm io_memcopy is aliased to the optimized for memory memcopy and is no=
t suitable for use=20
with fifo io windows that send data to  the flash, as it will stutter and p=
erform overlapping reads or=20
writes depending on the source and destination alignment.=A0 The jffs2 file=
 system definitely triggers=20
such unaligned writes.

The comment in the older driver explains this (here's a link into v5.0 kern=
el

https://github.com/torvalds/linux/blob/1c163f4c7b3f621efff9b28a47abb36f7378=
d783/drivers/mtd/spi-nor/aspeed-smc.c#L204

milton

PS I'm not aware of a fsck for jffs2.   Another symptom was fsck would show=
 names=20
with 4 garbage characters for the old files.

-----------  Apologies for top posting and not quoting the reply to: ------=
------
Dear Team,=20
=A0
We have 256MB of spi nor flash on our platform.=20
Its split into multiple partitions as mentioned in the table below.=20
=A0
Block / size
File system
Usage=20
/dev/mtdblcok5 (0.5MB)
None
Stores copy of uboot env
/dev/mtdblcok6
(16MB)
Jffs2=20
Read write file system=20
This is overlayed with read-only file system from the image and mounter at =
=91/=92
/dev/mtdblock7
(200MB)
Jffs2
Log partition=20
Used for storing logs and bmc dumps=20
=A0
We are seeing flash corruption in few of our shipped products which undergo=
 repeated power cycle test.=20
The continuous power cycle test seems to somehow corrupt the data flash and=
 on the next boot either we end up in kernel panic during init or there is =
recovery tried by the file system which never seem to end successfully, and=
 the application don=92t start well.=20
=A0
When the flash is corrupt, we repeatedly see jffs2 errors as shown below.=20
=A0
[ =A0279.805305] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not f=
ound at 0x06f90020: 0x8504 instead
[ =A0279.805319] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not f=
ound at 0x06f90024: 0x75a3 instead
[ =A0279.805327] jffs2: Further such events for this erase block will not b=
e printed
[ =A0279.817370] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not f=
ound at 0x06fa0000: 0x0b14 instead
[ 279.848078] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not foun=
d at 0x06fa0004: 0x1baa instead
[ =A0279.860240] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not f=
ound at 0x06fa0008: 0xb9c1 instead
[ =A0279.872368] jffs2: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not f=
ound at 0x06fa000c: 0x4d18 instead
=A0
These errors start to come when any file system related commands are execut=
ed from the obmc-init.sh file.=20
=A0
mount -t overlay -o lowerdir=3D$rodir,upperdir=3D$upper,workdir=3D$work cow=
 /root
=A0
So basically, it appears like jffs2 is trying to recover the file system bu=
t because of the type of corruption it could not, and we are starting the o=
verlay in a bad state which can subsequently trigger a kernel panic. The fl=
ash corruption is mainly happening because of repeated power cycle test and=
 some of the application (logging, debug collector, etc) trying to write so=
mething into flash and causing a corruption. The reproduction seems to be v=
ery difficult we saw one failure after 5K loops of test. We also tried to m=
anually corrupt the flash by writing junk data to it, but it did not recrea=
te the same issue.=20
=A0
Has someone seen similar type of issue ?=20
Do you any recommendations to solve issue ?
Is there a way to recreate such corruption manually for testing purpose ?=20
=A0
One solution we have in mind is to check the return status of all commands =
in obmc-init script around rwfs and when these commands fail try to boot wi=
th read-only file system.=20
But we are not sure if it can work in all cases, if the commands work and s=
till jffs2 causes kernel panic in the background sync then we will have the=
 same problem.=20
Any thoughts of how to detect the corrupted flash in obmc-init and avoid us=
ing it ?=20
=A0
I see some reference to fsck. This is not working in our platform because w=
e don=92t have fsck.jffs2. It could be packaging issue which can be solved.=
=20
Can we trust fsck to capture all possible flash corruption ? Could it be po=
ssible that fsck does not detect anything but when jffs2 mounted then it ca=
n start to fail ?
=A0
Thanks=20
Rohit PAI=20
=A0
=A0
=A0
=A0=
