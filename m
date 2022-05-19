Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AB652CD4C
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 09:40:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3hbY4Ttbz2xKw
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 17:40:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=S1ZFtNhD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=equinix.com (client-ip=148.163.148.236;
 helo=mx0a-00268f01.pphosted.com;
 envelope-from=prvs=8138c4ff6b=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256
 header.s=pps202002 header.b=S1ZFtNhD; 
 dkim-atps=neutral
Received: from mx0a-00268f01.pphosted.com (mx0a-00268f01.pphosted.com
 [148.163.148.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3hZt3GQpz3073
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 17:39:49 +1000 (AEST)
Received: from pps.filterd (m0105196.ppops.net [127.0.0.1])
 by mx0a-00268f01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J1V6n9006674;
 Thu, 19 May 2022 07:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-id :
 content-transfer-encoding : mime-version; s=pps202002;
 bh=JOz0eSAcjVQF68KTdhv8j9eO6jNyeYFIRojdLFbONDo=;
 b=S1ZFtNhD4xZTopdhD+Q34PjfJUUllUMkUCLEY7yseVnUd0bFJpvZ7FSFlHlpy+U3sZNF
 QQ474t90jxD6A+l8G1DtX0j2TS5ZGS0mohmwXxjZTpjrUd9XhIa20Sd2S1gmQUaefr9i
 mSKCr9Iqw/KU3aAu48gs5pWJIIj1VwxGfKPkpLHNFGvQ1Fo6nOJ/QEV30l7w/fjPdsj5
 r89XaA/EOCL2dOcjqv9cGwkdzIMgEH3f1XEKFNFDSPx/f//9iCyQTeRDAR8nlonI7ESx
 Z4fJFKfaDWMxPNtq4y3NxpMt6FJKene8F+flCg5e/de0IGn11vAQ9Mr3mNiuifMRWX+N 6Q== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3g564m23s4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 May 2022 07:39:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RY8/5JKHxt15EB43CWQwGuGLOzjvT2G4UPEryqywheY52xR5Wi9E3acnZOKtqFE1MLFjaDpX1Qu6UXlCih+vk/83+gMh4VX2dyf09Om7n9WMtlHA6oGa2aEIX6WGTzwJLwNgSqZ1FuD8YTK50h9KoPLYtDY3BHpvsKd62ZUbtTye4E3MMHw20QrsODItkmZyQSoOBDKg+aaE0O51fMaGAQmqmtgOcnHsYgSMe9MfXLUaQhaU3MAsHWHbofa7EWuu599uXJuniPEytyeuzEx1s4Bc0JqFJ6MwwoJYkNe5KvDzQW1sxUTmOPDaa6bgCPpUzHGMuEzlD3M3cvRifHfLtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JOz0eSAcjVQF68KTdhv8j9eO6jNyeYFIRojdLFbONDo=;
 b=ScCkH9C0khITlqWdEYyzce9MLFJ/Oi1tcFI8c31VhTigv0ozqfNAw6uWJwMvG9TnHJbeyWuXpSSgvmPrpeSW26Qu7Djtwt2DaZCT11xS57BNwncBYwrj2X3E7Wj2hbmKQaSnFoeXrJlY4hvz5SHMZSipeBaxt7H+m8K6SosOpqyj/+J9fsOWqduf2vsK+WWVNCBf0WC//hFoPXhZ9w+vGqlx3SFAeuGy/OrL7Rrb58+f4dzReLzHpghbCtCuaPT+N9b5URxL9rJUzue0OU9c7ooI+mm85dXtAOF9ElUiAL9nXGMlu16M8ArVrginCTuhPQeeMm20NVAXIAoogmNWhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM6PR04MB3788.namprd04.prod.outlook.com (2603:10b6:5:b1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 19 May
 2022 07:39:41 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::80d1:a256:cb82:f808]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::80d1:a256:cb82:f808%5]) with mapi id 15.20.5273.016; Thu, 19 May 2022
 07:39:41 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Backporting approach for nct6775 kernel patches
Thread-Topic: Backporting approach for nct6775 kernel patches
Thread-Index: AQHYa1OZkwacuivl/0Co2xDqL8qbvQ==
Date: Thu, 19 May 2022 07:39:41 +0000
Message-ID: <20220519073940.GH11809@packtop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a93cf0fb-0bbd-4a0b-41df-08da396abc23
x-ms-traffictypediagnostic: DM6PR04MB3788:EE_
x-microsoft-antispam-prvs: <DM6PR04MB37880C2228CC93B89CBAB64FC3D09@DM6PR04MB3788.namprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hAj1QdbX98MeWCq/DQb2cvKTq0T8lwNXwfH1weYWCQcUQ4BgFEMtzVPVRlOOcrb6W1gxUiSEsQ6pgZtoSDexQxZIcq1q0Uc8I+v/kDNE2vrVDy2XHKUDNdOTdB/4RhGcEGopo2F+DTMvgvAm8lE0DmX5stP1ex0P7MJbLWkC9NFo+TNGRWd7FFABjf7CTg0/Ij8igs++4SH1Zu2ACap8oSTAozn0o3XtF3RTXiBpmwJ+O9eeumHAzSi0vrnPcFp7bGSA5vvczx7njDW4hRfBIlUaW9ehjMPk4g1gmJWOw4gZgQULfpKGN3Y9NbCG6jEklSbtNBEMSN15tuAcFNQa++R6dMSiajYs+pJ+vZyGl9qMrbWCe7besSIBmR9afAnlW0K2OxnQwsXZ+xaIGRH1kkfFxvXOaU2ZEjJZhY8t8WkTxZFqgWgsDyFZ1JYLGfx19+7A8UfjTcNH531PV7/muoUk1VixCXL1juWHCdNrxjSv/0/m0DR0bKvsYuyoW9UHbUZRE10u5L2hounyxsA93EYLRIofOmhlWT4UxypL7D4SRCB8iWYRBl3l6qKctAiqJ/f176BJkqBlZywkFh5KD3GgsstBYNEIgJvNJyvv7T4gFn9J95sgJUH2YgrD6dhLpZQ+CJrDPdHySJ0AbmKIzDDQ31JamCgPbaWRJdXmCQhK84jBjvUFv6v3XMjEV+pP2yor0gJwCtTRYnO8eD+ZAqD+TGqetOvLtV9IbDHHoQaFgP50nijlXFbKs19gdaAw0oot6oIOaOeliFrizuMbyll7jKbF/W9stzziFUfpzPw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR04MB8007.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(4636009)(366004)(91956017)(186003)(66556008)(38100700002)(6512007)(26005)(9686003)(71200400001)(66446008)(6506007)(122000001)(76116006)(316002)(1076003)(8936002)(508600001)(966005)(6486002)(54906003)(5660300002)(66476007)(6916009)(33716001)(33656002)(38070700005)(2906002)(66946007)(4326008)(8676002)(86362001)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?255kmXttxVoJQRMAXgvqaYMWEQrSM2rHyamT1ejihF7i7B+pVv+JHsfuP/PJ?=
 =?us-ascii?Q?sPx5KHw8ktohy8uBSWquMYJVnXIjdDHxRRNEUdaBUlvmEiHCOGWBpS8HX/lN?=
 =?us-ascii?Q?Rlbt6273E3lRHRJbLufGbefJ5W6C4N7WUmYIFbZmoUtMYqQByEf5a6TekDOh?=
 =?us-ascii?Q?O5OXl8C452mTGX4svmbAEaZKNra4FDgRhiXwN8p7cqyynv7k4uAHjlUPFUDn?=
 =?us-ascii?Q?6ybIXgUT4nAfQSVQH7Q9D0ySMVocu51JcKF9YCcNQr9LUxrY+V5/6vmXNhHB?=
 =?us-ascii?Q?vVfo44rxjzEB4523N5TY/4G/Rgc/br2uxpjEQzwu1hAq6x1Io4l07EOfvnAm?=
 =?us-ascii?Q?1Ew5fOONu01lHcoRbUGcodGaOoQMKaanyj/254G1G7OFr5aj5aaxABW9/TQF?=
 =?us-ascii?Q?/iy+vNEHJ6x3/dhfUkd8wbZqSOK87h64TjSwKg3NGJbhmO+xL92TkF9Athum?=
 =?us-ascii?Q?kX8xJAVMJeMK/bnLcYy4mIqdSehSoaPI2F1nc0xg+3NA4T83Pd3qexlBgLay?=
 =?us-ascii?Q?FfJjH29HBWyFCFaUvKPgKMWTyaVAZyX0ZENq4GIohn4mIsCaOQ2VpjQZzhnH?=
 =?us-ascii?Q?t4jd4G5aVeYeV4ZHdlDdMCdE+qEk+/LF/UV3hlPPaVfdSdLPw2KIpCkJQc9R?=
 =?us-ascii?Q?M+iE0zgLm8UQZ6T4HyB+2/FcM0QAJwih6Ekg7ZGuTJt33P5Z01Y/6Z7Ivez/?=
 =?us-ascii?Q?aHXPR/Gda7YXlueLupVUthxaYSWEMB4LWPqnBG8ptPL4tLqOJpCliVG13kKM?=
 =?us-ascii?Q?uJknso5oA3AOZ4hZjUGewGVTDvuik5Drmqe2Ip7aKrLdih55rJgy43GFce/t?=
 =?us-ascii?Q?8T62uELPb7YeQvfsXYGRnZXErK67/UvFYuYKtnI9Tm2d6ElL4xJNYohFabZq?=
 =?us-ascii?Q?DITo4lXHbeQ01MXwOBiypKUVhWpmZC2gHCyg0iHfNEoimnr4Jqe3Ufph8e5x?=
 =?us-ascii?Q?/uJrK8XFf2fbcnAn7P9jzLNz6bf2vFPwEiVPPUe7yCDdU+dHTttbyZ+qxCwI?=
 =?us-ascii?Q?fBGrm8qGExKTLRVEau/0fjKGbJHiYItfHiGbqUULfJSBoDRpX05rGL8TQFvQ?=
 =?us-ascii?Q?unJENLkMsZ7ntLGvK9JViUTRzJ4DpwWoPlflM06zFeEusTgV9rn+1QuPLj7V?=
 =?us-ascii?Q?WzDE/MPhRAiGGZdSUUBs8/aCfzEOfb2ldAGDzRy8SuI4HmjaFwjM6i37YRL9?=
 =?us-ascii?Q?j2q2uKNwRJOVW9Ddn+KtVfDuyMbGsKlM4Qfbj3TdNF/WgE41pjGeEYy1DDb7?=
 =?us-ascii?Q?v/I7cq+OSKGDItvab38qzFgNU21Rv63CLpTPayKQndLjP2cPa7XAvuwedVDa?=
 =?us-ascii?Q?veVVQoIKfuZa1Blth5dOaHXUCVjhJAePvtK2QJJURxM0hmRgMSlYc6MOVBdW?=
 =?us-ascii?Q?CJQ7PVBrFbbW7cfHKd6jUAOzQXP9PQiDfrnX0XjZQu+KTA9UwpAbFGgOGnO3?=
 =?us-ascii?Q?qEuVBEfzWDBwWa3DGjCn3pwSL5icyJEFaadKglaIp77f0SnhMFHf+SjtsHs2?=
 =?us-ascii?Q?Cy/9J/QK4AW3w1CCqjJJVvwpQa0inE6OuRac+h+COP5grDRmA9sQ6PCMSwah?=
 =?us-ascii?Q?uts3X0HTyatDUjXfpCh6MW/vqu71FoZq1fCMwA5ngIXm04Ri5gN3hyGWRY8b?=
 =?us-ascii?Q?4s0QeRdyKO7WmF0+ZtHqs/lZyGU/i4UxyA0xMNYaau48B4DEEvvN1gSSYIIQ?=
 =?us-ascii?Q?IjLEqDoLb8S2O7i3mLiRrv2LsDQKQi4R++tOhfENK42U2EAL776T6CHqRh7L?=
 =?us-ascii?Q?MvCHGB53LYuQyb7YoslEvjeI/GanOEU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D6D05723FD86F5479B7D2B14E220A8B4@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a93cf0fb-0bbd-4a0b-41df-08da396abc23
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2022 07:39:41.1934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j3O9QT9oLKt9rDbv9KBTsmjNFmt9+DVRnnF1XuXwc41le1wQ5RgQ9NXS5PvGdBFEIisy66BM5O6kaxCZZa14AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB3788
X-Proofpoint-GUID: FvkH89UXDXsTNHHG9xKQfrawW3ECvaUE
X-Proofpoint-ORIG-GUID: FvkH89UXDXsTNHHG9xKQfrawW3ECvaUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-19_01,2022-05-17_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 mlxlogscore=361
 priorityscore=1501 spamscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205190046
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Joel,

My patches adding i2c support to the nct6775 hwmon driver are now in
Guenter's hwmon-next tree, and so presumably will be included in the
upcoming v5.19 merge window.  I'd like to get that functionality into
the OpenBMC kernel so as to support my ASRock romed8hm3 port (the
initial meta-layer patches are now on gerrit [1]), but it's a sizeable
series, with a fair amount of intermediate changes to the same driver
(between the current OpenBMC kernel and the start of my series)
preceding it -- enough that rebasing just my changes back onto the
dev-5.15 branch would be a bit of a headache.

What do you think would be the best/easiest way to go about the
backporting process?  I could just send the entire 22-patch series
(including all the other preceding stuff) as is, though it seems like
that might be a bit unwieldy (if you want to take a glance, I've pushed
that to a branch based on the current dev-5.15 branch on github [2]).

Alternately, if you happen to be planning on bumping the OpenBMC kernel
to a newer mainline release in the near-ish future that would reduce the
amount of intermediate patches quite a bit, so I could just hold off and
wait for that if so.


Thanks,
Zev

[1] https://gerrit.openbmc-project.xyz/q/topic:romed8hm3
[2] https://github.com/zevweiss/linux/tree/obmc-dev-5.15-nct6775-i2c
