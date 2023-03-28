Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BFB6CCDA3
	for <lists+openbmc@lfdr.de>; Wed, 29 Mar 2023 00:44:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmPrn2rC3z3f51
	for <lists+openbmc@lfdr.de>; Wed, 29 Mar 2023 09:44:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=jFj1xYDs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=9451cfbfc7=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=jFj1xYDs;
	dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmPr65nlJz3bT7
	for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2023 09:44:21 +1100 (AEDT)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32SKW4UG029923;
	Tue, 28 Mar 2023 22:44:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=N4SoaMHBFdE1GLoGc/lS2XW/g+NjCdQ6Deydyt1SbSM=;
 b=jFj1xYDsRWZMkuW5tTWm6n3a/mnh5mbnOWiim1jVqKZj+8ashK2u06k5HUCro2KMvZnU
 kzZj67D1DFraUz7wtD7wuQa9UCCOqfrEQVCltk57tBUK+pNFSh49WOubkoqU0knEeVlu
 9hjb3s++SSUmFzhbZ1vLXkBNVgllz4nvG68J6UfAUK7FqOpv79PPr5NA5GO0MqnHiMz7
 +UNWmME1C9inrmPhph0rotS+1A+12DNf9jaTILABzd0oedhlDdZesL3xt3VuT5M4SY8L
 E3/FBchnS7P1imsdRsosg1EK380BADyERAz4ACmYZtVFLgiEcaG2r7tJXq+72ZT6ornz 8A== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3pm7bx0bw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Mar 2023 22:44:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CkK3zQ47X+e6Ym3Pe/lws8aoooGZ15PpSFTZ0FaVm2tK99K9rmC873rLVyMGP44xwpLj7+GhxTQoWIyzAm2gz+DnptOK+aJnK5ezgXui/Sjn8bim82yBz5AK8p1s1m17wAno7rLgrY2JX0gFoAn9S//7stqTKDi8XGwc7cULTXakNxwW/VaTexZrmzXu4l2NzYR3A/nLbdP5X7B1WTRnsDW0Qw3v5ogvHKsp7gYKkxhXBNXuUZYhfHpEfhpG7QEMQYwV5zjukJr4AU1TzNxW3jhWPOTML8E1MEgxe5YtDwsJM0IIIHWIHMFETsKG83CkDrkdKBVV+M7RCI2yOEW3Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4SoaMHBFdE1GLoGc/lS2XW/g+NjCdQ6Deydyt1SbSM=;
 b=TO+Cnu2WQh4JccxpAmHc/+Cs4o2pedz6CVcdmhw/Z4hOjeIfQES60KbuGBkh0uRoE/UWMoxdZ1kEr+inPqucUBZBMcLN1vMX20s5ySRDdqvJ+GKeuPVRGD9PmSIwW9QeD/f+cJFczyWBn4JBSn41pgvHMAzq+yspx2yh1Zrg9GmzR305lO7dJiv5L0mvavQah4+3OWPjTyZhY+x0NJtWWh7GKqaT7gsAFAJh6MRRliN/WFOf73QpDRn4R6VPAgBkPVcmBjiW/5M4AVDf+sb7SCDQJV31bnsNlYnJsEPrGcFHZIF2ktW/2wbGcJH4xVsNnGDxu3khWvF96ej+1F1bPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM6PR04MB6988.namprd04.prod.outlook.com (2603:10b6:5:243::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Tue, 28 Mar
 2023 22:44:15 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::55a5:3e38:9971:2659]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::55a5:3e38:9971:2659%4]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 22:44:15 +0000
From: Zev Weiss <zweiss@equinix.com>
To: Satish Yaduvanshi <satishroyal4u@gmail.com>
Subject: Re: Containerization Enablement in OpenBMC firmware
Thread-Topic: Containerization Enablement in OpenBMC firmware
Thread-Index: AQHZYcbSo7FTJD/cSUWrEZtRhc0R1Q==
Date: Tue, 28 Mar 2023 22:44:14 +0000
Message-ID: <20230328224413.GB18848@packtop>
References:  <CAGugOWsUK=2gE6iBiumKukO87b_cgAm2eT+Y=su1PPWow1-S8Q@mail.gmail.com>
In-Reply-To:  <CAGugOWsUK=2gE6iBiumKukO87b_cgAm2eT+Y=su1PPWow1-S8Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8007:EE_|DM6PR04MB6988:EE_
x-ms-office365-filtering-correlation-id: 23186193-ab0f-4aa5-e610-08db2fddf51f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2gG9Ax3NpuG9zXmne28jTTr+b4T23+ol76B24rbFsytc9qI4cIFrstGw4LC877eoQC2YJDWkBjH3kqyuXjdrA7aMEBqTDAQXN1RgainhHCMHL8R5gfjM6KYqyaymy8Sy7B06ftTtxPLyOJAQnddxF3dq4SRQIVdulYPT2kh+ZEZMDOH+gYevlsmBBz2tB7ixlPkALtufSwlWKhEGWTUmU37lZrXtnh1yaXDzLxf0y6Q8rt9Ex7/MDDADPBE2u709o/ulC3RWTMKVvJKAOlc0FlF2yJhpuncy2tPPdL4j6R0xdIjqa2Pd9GAPbuBjkp1Bdg6yOLojI3TpnhrAOqOmvmf605YJVw4YqCXF2+UJgC64tDq+lGXSgPfjsScKTP1jUkYXrAq5L5cgWeXmuWHwX8+yanc8+0jaQclJF0imGER0la2nEybr898e7zqGZUA3oM4ER6sQHlVfbTizj6/2HYVuvkiE7z6cXEHeXIUL+NdOJFbBQi1PRmEBv9UlH8dqcRq3jaMxU5TBLjfWIMuWmN24hufH7m3a3u2eUddzvNpaw9JSdg4nKCVe0iKZOYZ72TUPZwYHcOh4p6jAKV2VOagu3vJqx9uDemNW9gud0sU=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(136003)(396003)(346002)(39860400002)(366004)(451199021)(2906002)(91956017)(8676002)(6916009)(64756008)(66946007)(66556008)(6512007)(4326008)(66476007)(478600001)(76116006)(71200400001)(38070700005)(316002)(1076003)(26005)(9686003)(4744005)(6506007)(186003)(33716001)(38100700002)(86362001)(41300700001)(122000001)(6486002)(33656002)(5660300002)(66446008)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?fPY9ZnlYMDhXFtu42peuF76qLixcfud+Ma9oOXPQYgS5CdB00whnB1YeWJWo?=
 =?us-ascii?Q?D1pq+5cledvCoAUAf0qorOw9LX+3ari7KXJ0PJok+um6iQh72xST4wveJOpA?=
 =?us-ascii?Q?API2Xp0h0/dKoPN+YQAxDEdCSxnCyMTB/LKzuOegzIPBACGVAa+ZzGNEKVIY?=
 =?us-ascii?Q?3X3fyzDbN5LxWL6X1T06mQ/4d1i7LA5UC2OR/jhPp5+Sxa0+hKd2xomnxfAd?=
 =?us-ascii?Q?WmXBH3GvrPhrgN+Hj4otZZErn/EzQAIa8VA4WZnebeYYWuq98JYj3i2P3zNe?=
 =?us-ascii?Q?lzV9lOQMm0cqHtZz8DLSdIQ4p0igBLj/ATQAMrV51OVBiF+3PKImgSJWgLUI?=
 =?us-ascii?Q?jjIxUQ3uK/mLOdSXEe6UZaity1WUYjGiX/YwStYDiLrKugImuiVdHXPqYCVq?=
 =?us-ascii?Q?5tvW6PJFsVTVNRU0akzf7+6F5HQMVaw8Fnweft15lYGJAclwIfT5cc5UNHK3?=
 =?us-ascii?Q?bWv9ljE9/mZkQBk1UD7Mb0uAMQbK2Kuw99cTXo5sb+X8lkFdqh4QyaHYoRge?=
 =?us-ascii?Q?SFzX4JgYEy57aYc+x9uhHS9Z9Mn67LDvfcxP/I8OvbR5d03i9Ua7iBLAD45M?=
 =?us-ascii?Q?tisX4KGxVOhwGzPWAUVqOJKuEOb1Slk7Ujygn0DOyAbkt3PDUGosa+qhmX/6?=
 =?us-ascii?Q?u0una26BRxJfxa1rI1rR7QUWq+IjlyXwGPGvtDOZ8gmzA4WTxBSBMYjN1oNU?=
 =?us-ascii?Q?RBglFioECCZisO2Owm0xzhU8F3T49cLdc3BdfHkOW4Q/wZC/aZCjmWkFZ/Pd?=
 =?us-ascii?Q?yOuFVftL/892wQNdCEgMgMiEFwvgRdsqE5WsGMmLWU39Mg0H5yHyufR75+W1?=
 =?us-ascii?Q?mfdA7rhlHDiLIKOOz2P0PIO/4F7q4LrZgk/JC0yJFymRiGj7w1WZKLRe66Am?=
 =?us-ascii?Q?rJBYQ7kK3z4lUynGBI/fbGfwVwhLJFejXsCLy8pfabCCIq/qjHoKo8eTKA7f?=
 =?us-ascii?Q?XWBoQ7XgyFfuqk3LX1lBWzFg77yhiff5KzckTIQ3As1cWvoWx20b7xSnuODf?=
 =?us-ascii?Q?EU/GnixcUGWPsspfsEHRx98qbGutvAQkznj4oONMcmZ1Xn8Wm4CcGp44z14N?=
 =?us-ascii?Q?TRsaHnlvNn+npVb+FiEH2MHXuVQknhLZZKhoAZ4eZDzk8UbmtmIhJWeoik0g?=
 =?us-ascii?Q?Vd7pvKdZUVGdx05PwBZnSz/M3pqFqHhvalQwd8w8+V8s1+P3QreG1B3UAXA+?=
 =?us-ascii?Q?0zPuJmzDX8XrPhDLmSHTSmcgTXcpIDhi9pKsL+OUXomu7dVinjF7uvKdasnJ?=
 =?us-ascii?Q?KtpbK3Gud0qk8Q+pE7J7CVaD8YA1Pzx56EfqChCwPz111bqFe8Dc9XWdweCp?=
 =?us-ascii?Q?H4BFlbT6Mh9yfIa7/20CdRjAsMA2wclE73h1F/P8UlE1qzwk+xAD3Ywqt2x7?=
 =?us-ascii?Q?+k+pR8MKpjc/1UEvHHAs4OTzSS9GfYJCxIhz7o2653vRiCVC+DJidwuZKNGk?=
 =?us-ascii?Q?Wdj0vzp0sIKhNqOJggqAEiFTiGyJNYBGM/QEa/405wsx1r8kyuLHpN68YZKy?=
 =?us-ascii?Q?QjkKHziSvO+NFGWgsa9QfRshYJULS2ijCuieFeAv/BOv43jX3wuYdIk9Iy9f?=
 =?us-ascii?Q?qU7OvWhsNBqZxTEmqW2iRAO8RJ6m+Y+U95l1vtC7?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0D604EAAA4730F4CA281B6B23ECF9835@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	EmcTEBDeObDQLALspcwaFu5pg/wWgg9B5opP94tvH6VTgQUv9flnoO/QYP6EurZfJtU3YgRyLZ42kqiwF7REiw9z13wsxBWOl5IZOGp2kjHNQcB6wWAXFcdCPTsht4V/mGUatVpMkLDlwMwqQJ3G1SnASOWM+hJTnOqS2S0XFc1gxdXqkuRoo6hq7pcsg7af6nJPy65IG6qTaLmqpIizC763ES9mF9giBUwCcbs3c8Vos8e/Ad2FaoYXjcTTZWf8Nm0QkiT5Jx0AZehS5oJDhQ7OXzjzza/j4ovHbGskGoaqafhXuln9Sre5QgRkPYZlhhkW6gl7G0FRZPrb226zfj/AgEJyPw6BtKPalvnZawWk4vfD4FJIpwMWu05Y3JyrIXkfzzMIlkMpeo5PX1e2KsU2+6aZq55I168vtwcE2RXbggV2ISia1rZr+ElXVSTWf/vJQhAvuMQSZqsDSxQX0VwSAWhkuGfzvZRLzY4D2YBdg+wyyH4xgmp5WEdOdNmS7UfhaKdB/Z3MzbCkHB7AyvHFg6pIUYZNHPPCCj3Tb5KTdSXU1z+elTgkNnKNGAvFKH9cSHnZfJr32f5wwWzHqTTflO2/Z5mIrmu4xVTFHwEPj2Th2ipXEHc8bsbWBgLxGz70sZpyDURhVnHcYWdc7qRcJJWTqAkZf6swKAivMGubNqvIiVapMr9hLb2kyU3wIkfK1Pnjl+aHDNOR8tIOKUSq/lUDlXAbEQqpd/ZROKOv0/bjg/khO/3fkNk8KLd3mfKmRYxix7KFbtRTI2kwqBNVOZOWh78OoP3awN+KllP1AKQ2PyD8Fqi79I+ucmNoZrAyZnWRh2V4MaEPrA83hh6uaGmib2xF0dlY54kwZbs=
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23186193-ab0f-4aa5-e610-08db2fddf51f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 22:44:14.9575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EPzADF8G9rRnT1Xgsn0kP8HzCVO+IByqUAR+lpMzXRm4PxtJKE/bA2/9S0VxTfOa6tsp76ILDpiv8a1DmN4nfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6988
X-Proofpoint-ORIG-GUID: BTo3Kyro6zSa-z1AX8D7RHRjzFU6NnrF
X-Proofpoint-GUID: BTo3Kyro6zSa-z1AX8D7RHRjzFU6NnrF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-24_11,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=812 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1011 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303280176
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

On Tue, Mar 28, 2023 at 09:43:20AM PDT, Satish Yaduvanshi wrote:
>Hi,
>
>I would like to know is there any future plans to containerize the  apps
>and services of OpenBMC firmware
>
>Thanks,
>Satish Kumar

I'm not aware of any efforts in that direction, no.  Is there a
particular benefit that would be achieved by doing so?


Zev
