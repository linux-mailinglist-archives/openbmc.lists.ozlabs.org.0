Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 098894EB8C0
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 05:25:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSsJ561D6z2xsm
	for <lists+openbmc@lfdr.de>; Wed, 30 Mar 2022 14:25:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oOcvnzDP;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=shantappa.teekappanavar@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oOcvnzDP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KS5xy1X2Qz2xSN
 for <openbmc@lists.ozlabs.org>; Tue, 29 Mar 2022 08:51:49 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22SLbY9j000849; 
 Mon, 28 Mar 2022 21:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=pp1; bh=fAf5uVUP8zngK738DuJt7Zf3ikwKZ+P5efYv+4uhqeY=;
 b=oOcvnzDP4TzJoAkBj5ITIFXgjezJ1eVsVJ99bGWJffICCkOkj3NRVA+tO24g9TZcw/sI
 Ls25G/GyI3RZh1WNrdyQNww3nmNFZ/jND1pE65X6suvv9x5X6kjHPzdTtqXr/XcWoOF8
 UkXBoceiZVboAC0rhTuQUMfZEceSqYAC+z56i8LZed8v7oIm1U1pKOJc9bJLCxBTgAG8
 yI3Su9GAWh/1pIpddP2zjYXAL+ciWvrNQqS3DOEUZ7bw6R824ZjnTnxJrbtkF5tafsym
 jAV6u5xHBWKKDbr8NkR5txehsKzndxJr1x0fPZu1pyoMi90J4pNhtUhGdrcvpXpUxIdR bQ== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f3jkx2sy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Mar 2022 21:51:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRlc6Zx5wgAzSApRjLH41odgmA6Lx+WU5w2SPSxMWyJUBz4aC1rWrG9agHJKBC/p6F52Hb4RxGAGm5tiRK198QgmXTYE7aDcIhWfrpXph//EUX6DB3WVLCYKfpKhF/SD9MGlU0iwn74+LyhVpl6Mg6ui8jA9oDyKooZgf+kuD5ePkvp4bWdizMRYBJBYn92SojVVhXnpReP7YjPxsAsbQ4wy0NVW3k6xaBTP5su85cVgeZBiebAW7/G4RGNWu3CTPZfnbxlCnfCylGZhh6jNSp8uO/Ug/nqAi2RC87imMgqo+RU7IL6M7I1JRSPpEHadP67x97bedxnpD8coySPZJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAf5uVUP8zngK738DuJt7Zf3ikwKZ+P5efYv+4uhqeY=;
 b=eLk7PiSZsi4Qd0Y4wg5TDAxY5ckOSyrFeW7v1lMxQsMeWOV3q5kRaax2+s4rdR+bGYnzuls1OCvTvY5g549I+exiult9Vlmw1p433uWJ+BEmboZOW+AIqkcdZJyrvP6M3W6pGpzX7K5X7RIyozHi8MRJ4tEnWXQ5D7jzIRo0pZCrcV96s47qbIQ7yD7KtJptM2uZvHRXO+sTL4WlFT3Y+iHm5SEO8bPqdwrXWqSlwEnNfJtQebAW7IyOIOmZHLtllHs+blqi5fmDf3H0uRrcN/ogzMrXnWhAxEjhzn+T8qYBeHqRsRMlpl+xmZ1Sx+bBk56yZQoOTUTnazTSico2HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SJ0PR15MB4203.namprd15.prod.outlook.com (2603:10b6:a03:2e8::18)
 by BN6PR15MB1441.namprd15.prod.outlook.com (2603:10b6:404:c4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Mon, 28 Mar
 2022 21:51:41 +0000
Received: from SJ0PR15MB4203.namprd15.prod.outlook.com
 ([fe80::d0d5:b015:962:9c7b]) by SJ0PR15MB4203.namprd15.prod.outlook.com
 ([fe80::d0d5:b015:962:9c7b%9]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 21:51:41 +0000
From: Shantappa Teekappanavar <Shantappa.Teekappanavar@ibm.com>
To: "yulei.sh@bytedance.com" <yulei.sh@bytedance.com>
Subject: FW: Missed interfacesRemoved signal callbacks in object-mapper
 results in invalidated DBus objects
Thread-Topic: Missed interfacesRemoved signal callbacks in object-mapper
 results in invalidated DBus objects
Thread-Index: AQHYQuyirbkH8cu14UyKE4/o07RAPKzVVGpw
Date: Mon, 28 Mar 2022 21:51:41 +0000
Message-ID: <SJ0PR15MB4203E9DBC4747F99D019A2E2E81D9@SJ0PR15MB4203.namprd15.prod.outlook.com>
References: <CAGm54UHMED4Np0MThLfp4H-i8R24o8pCns2-6MEzy1Me-9XJmA@mail.gmail.com>
 <ED8098DE-8D59-437E-8088-FE7062CDEE15@linux.ibm.com>
In-Reply-To: <ED8098DE-8D59-437E-8088-FE7062CDEE15@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ec647e9a-1197-4a52-8e94-08da110524a8
x-ms-traffictypediagnostic: BN6PR15MB1441:EE_
x-microsoft-antispam-prvs: <BN6PR15MB1441D46FDAEBA0C4CFFE699EE81D9@BN6PR15MB1441.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5D7sbMmpLfxT6ymzIBSSKAajI3Ph/7KABkwKm3XTcs+75KvJoXGKqq8lIjVpvFer7uuNWjvhhEwydCKzW5ZMu5NZSzVkGZknOhh41ZNo7W/97Msii42AHMFrkpLIsI5AGtb//6xJEMhkpJZUU5deMXrL8gBZVGs/MQ3cGzhQ9gAUQnuysGz53PX17LUFQutzlNO7EwJDDboOMZH4G3r8Frf+FtRPldT0QK8tOKOc8SXFMAIW31LvcFFBxzAO/MFNS76yPOEfLjxaL9ZqWtqw06LsI33QqZ2/jkMdFCxrKAJSCAaa6YcvRH+lJtMMgGb3XSV7Ro3UpbKNbXe7FCe7RIZHlVdMvPl2xVn4M+s1sPhB00PakJ+IS28v88TAW9ONmpjw7KcPCaZfriww+qnV2yAsOIv1MFvRYhMoZuTtUe6VgJlM+iKv3epn9t1H4bUKB0l1o9X21ugCrXa1SbOXcghr/+vhnYxgEjJuAmhQsyatPfH9tNvwGNHVq4wov6CXnjQquQcCZj7pcn6xNy2IYbHpmYihondh1/3seU231afNXlUe7Dou9i32iyTVJWg0sSQ0iZRfZ27vQnPcm22RLpPBHxGNeBT9Z0TfLN2s+54mGgUT649MWz3JPTaOuScOh+qW7Hk4bw5R6O7W8BZhlTQY385r2cFlM3DRA3OFtpJQqQj2cy0wJmaL+ZyA3mHjt6wYtzdTNUVBEgSzl3o47w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR15MB4203.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6916009)(122000001)(316002)(508600001)(8676002)(4326008)(55016003)(66446008)(66556008)(66476007)(38100700002)(33656002)(76116006)(66946007)(64756008)(26005)(86362001)(6506007)(7696005)(53546011)(71200400001)(9686003)(2906002)(186003)(5660300002)(52536014)(83380400001)(8936002)(9326002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5Y9+6BebiAhTJ1Scb9aChrF9+xP5BCOaiZa5vpmFOKQexgxaXKDPff6tf1n9?=
 =?us-ascii?Q?gUoQFsyAmnmFgHlRGp5++nBsSczwk/puuxMcrRNbvwJtCh2nPdzMldqk8oVn?=
 =?us-ascii?Q?o0jbSKiN+uXr4uklnxhFH0NG/tJUgsuRhhVtTn4Q1LQlw6NHH3mIZ8+tDX1L?=
 =?us-ascii?Q?Au3Ikovp4b9h161//g8BUFbnaK1aylM9cGH89p62iIxF/d3X37ldd9q2HK7J?=
 =?us-ascii?Q?2Q+m0rq5nijm1tof4Sgz5INZb7B4dGDYRuqIu3nrZBFtxFytJhtGPCMIOz/K?=
 =?us-ascii?Q?o1UsMzWJfC4hiXyweTt5AsGI/ynsvHFXkBsL9aX3WqBGHocthlwcEnjU2x4z?=
 =?us-ascii?Q?nFfWA6jHuEkXfwYqxZJwoUTLtsfw6fgD+b3gyr+1/ccAyXhAMCwstyD5aFKo?=
 =?us-ascii?Q?ngF9mgrw33H7dZ+Q48CenzYgr2eTdVJamAWfz0VPYumAG54P0EeufQqPnDfS?=
 =?us-ascii?Q?9AsiGm2Ixwx4W8jt6oieBZERXPe14Y9G/Adx/JxOP6oLDJwwwEE/103Skrs1?=
 =?us-ascii?Q?phoeEFI4HgEtIYibmEP+HoQhwideJsjY112g4j4zodvIbg2hEYWr6Ag6HjBb?=
 =?us-ascii?Q?M14pjxO3J5LjrcgOBMvbqP7IHHcD4UZNsMh530ctVCsd9bhgfenM8lFx1mMQ?=
 =?us-ascii?Q?2mkBb3igGULTDHqD+FS3n2XnaiI6f9lKcNyGvaQBisZSIyRVSQX5JvqTBqWs?=
 =?us-ascii?Q?HZJL05UKj6B58dkKNYLw7ZIUUlV8/xtRL6q405Lu52GrtJaMn//x5L7Q19/l?=
 =?us-ascii?Q?OYVx9E6iOiYuJKitiWUdmb14NTv4FVL0A+L48TqOAZthDeKq/a4U1s8zJdHj?=
 =?us-ascii?Q?+SaFr3Gh6Bwdt43FfOspmoTDlX89SP8gawx/lzEjekYMmBxr+0spLf43H2BX?=
 =?us-ascii?Q?70mcUz8FCs42RX4o3Ve2KoW66/55iwGcXrSi8cKqBreZkBPK6IciEJR7PoD7?=
 =?us-ascii?Q?tNL2+xBJtmNzJbcVNhjJMigFCh6FxJmMzsa2Yd1SwKj7LnBwokTKVXltPUnL?=
 =?us-ascii?Q?LB6MSlT/WGhh7uaIS/atk0UVv8E6drFyTjytYiV1rHT5XfkoJ9xYZPT/eCRA?=
 =?us-ascii?Q?n1dE7mTHIEGryR8E4HZ484D32ngCZThKkkZoGhyOP2f0hR6tD/TXRK9HXvfM?=
 =?us-ascii?Q?Ziz9S5XHO22YPVbMOJC4JXnH3jyOoaIr3ZCarjwqEL+l6eRYozP6gUwPMP4C?=
 =?us-ascii?Q?/EjkiwkpTZ1KdlzFY/NPkRq9cDwM/MsNvDlokB7x7Y0Ll2NKQpoRpoSEhnbC?=
 =?us-ascii?Q?SqU4Hr8YQ6IzzuSYaLaC1bnqAldPlFz2esfFJU49x12wVxKyUHVnVuedaIk9?=
 =?us-ascii?Q?9VG2veRKUVI4IyxAcWinKgIhFqaNfCG3m7HLJj1P5h3wycOlSDheAWpo4dOA?=
 =?us-ascii?Q?/NYTDeybO014T6Ks4oiaTM0gX/UGDaKsZDwR679CjKinbGT7P6LBXUwC5nx5?=
 =?us-ascii?Q?V85f2Gm8VWRTq+dzcSi8FRG8toMV6n2ftJKCane1KYnN29FqPN6b6ZhURQ5X?=
 =?us-ascii?Q?EYFreCnOrWiKaSPG3U/XAEmmmeWiybwPzi/G+/Tffu23UnTnKZzqC1SqWnkv?=
 =?us-ascii?Q?2qPxoEjzFyxd4quESFK9RBY6iBTBHLMOzDKipU7XgmIdyTMCBOzR5QDDNvDr?=
 =?us-ascii?Q?1weKGB0csePk/cw2TNGh+hDm58esdgmdbBr6GrftfTJBF/nAnd9a7i2Y9OUs?=
 =?us-ascii?Q?i9Ftb5nNB1Qgqz19b8lPKT7j9yxZz/DQJzn81tfOpnr19yi8X+Ex7hwfCjd+?=
 =?us-ascii?Q?yn4BErfzFCJBAa89mLJHmniwNqUVRWQ=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SJ0PR15MB4203E9DBC4747F99D019A2E2E81D9SJ0PR15MB4203namp_"
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4203.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec647e9a-1197-4a52-8e94-08da110524a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2022 21:51:41.3256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aq+BFW9nlb30yKQ4GJ+cGT+itwHOuaUqQzKnbwpQop0FEuaBucIAlzFUGPzGCTctcUVG4Vumf0OPoIjogA5T8RCxAgxAjSAGP2ZMXCWZzTk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR15MB1441
X-Proofpoint-GUID: N_gkrPN5HrzoeMO2RPUNIK8Q_34iT5Lz
X-Proofpoint-ORIG-GUID: N_gkrPN5HrzoeMO2RPUNIK8Q_34iT5Lz
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_10,2022-03-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 spamscore=0 mlxscore=0 clxscore=1011 bulkscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203280116
X-Mailman-Approved-At: Wed, 30 Mar 2022 14:24:48 +1100
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

--_000_SJ0PR15MB4203E9DBC4747F99D019A2E2E81D9SJ0PR15MB4203namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Lei,

I've hit this same exact issue on few of our platforms. Like as you said, I=
 agree it is not 100% reproducible . But once the issue is hit, it is kind =
of persistent on that system.

I tried adding entries, deleting one at a time or Delete All, with the hope=
 of flushing out the paths. But so far no success.

I agree that there is some sort of fundamental issue...

-Teeks

From: Adriana Kobylak <anoo@linux.ibm.com>
Sent: Monday, March 28, 2022 2:42 PM
To: Shantappa Teekappanavar <Shantappa.Teekappanavar@ibm.com>
Subject: Fwd: Missed interfacesRemoved signal callbacks in object-mapper re=
sults in invalidated DBus objects




Begin forwarded message:

From: Lei Yu <yulei.sh@bytedance.com<mailto:yulei.sh@bytedance.com>>
Subject: Missed interfacesRemoved signal callbacks in object-mapper results=
 in invalidated DBus objects
Date: March 28, 2022 at 8:19:40 AM CDT
To: openbmc <openbmc@lists.ozlabs.org<mailto:openbmc@lists.ozlabs.org>>

An issue that is related to missed match callbacks is noticed and it
causes the inconsistency between object-mapper and the dbus objects.

Steps to reproduce on g220a QEMU (it is not 100% reproducible and when
it occurs it likely occurs on the first try when BMC boots)

1. Generate several logging entries
2. Call logging service's DeleteAll
3. Check the objects of logging service, all entries are deleted
```
# busctl tree xyz.openbmc_project.Logging
`-/xyz
  `-/xyz/openbmc_project
    `-/xyz/openbmc_project/logging
      `-/xyz/openbmc_project/logging/internal
        `-/xyz/openbmc_project/logging/internal/manager
```
4. Check the entries via object-mapper, it gets the entries
```
# busctl call xyz.openbmc_project.ObjectMapper
/xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper
GetObject sas /xyz/openbmc_project/logging/entry/1 0
a{sas} 1 "xyz.openbmc_project.Logging" 8
"org.freedesktop.DBus.Introspectable" "org.freedesktop.DBus.Peer"
"org.freedesktop.DBus.Properties"
"xyz.openbmc_project.Association.Definitions" "xyz.open
bmc_project.Common.FilePath" "xyz.openbmc_project.Logging.Entry"
"xyz.openbmc_project.Object.Delete"
"xyz.openbmc_project.Software.Version"
```
5. I could verify that the DBus object does not really exist:
```
# busctl introspect "xyz.openbmc_project.Logging"
/xyz/openbmc_project/logging/entry/1
Failed to introspect object /xyz/openbmc_project/logging/entry/1 of
service xyz.openbmc_project.Logging: Unknown object
'/xyz/openbmc_project/logging/entry/1'.
```

I also added some logs in my service to get callbacks of the
interfacesRemoved signal, and it shows that I really do not get the
callbacks for some objects.
For example, in one test I have 41 logging entries, and my service
only gets `interfacesRemoved` callback for entry 18~41, this causes
the object-mapper to show the remaining 1~17 entries while they do not
really exist on DBus.

This looks like some fundamental issue in dbus-broker or sdbusplus.
Is there anyone who hits the similar issue?

--
BRs,
Lei YU


--_000_SJ0PR15MB4203E9DBC4747F99D019A2E2E81D9SJ0PR15MB4203namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:2 11 6 4 2 2 2 2 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Lei,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I've hit this same exact issue on few of our platfor=
ms. Like as you said, I agree it is not 100% reproducible . But once the is=
sue is hit, it is kind of persistent on that system.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I tried adding entries, deleting one at a time or De=
lete All, with the hope of flushing out the paths. But so far no success.<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I agree that there is some sort of fundamental issue=
...<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">-Teeks<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Adriana Kobylak &lt;anoo@linux.ibm.com&=
gt; <br>
<b>Sent:</b> Monday, March 28, 2022 2:42 PM<br>
<b>To:</b> Shantappa Teekappanavar &lt;Shantappa.Teekappanavar@ibm.com&gt;<=
br>
<b>Subject:</b> Fwd: Missed interfacesRemoved signal callbacks in object-ma=
pper results in invalidated DBus objects<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><br>
<br>
<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<div>
<p class=3D"MsoNormal">Begin forwarded message:<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Helvetica&quot;,=
sans-serif">From: </span>
</b><span style=3D"font-family:&quot;Helvetica&quot;,sans-serif">Lei Yu &lt=
;<a href=3D"mailto:yulei.sh@bytedance.com">yulei.sh@bytedance.com</a>&gt;</=
span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Helvetica&quot;,=
sans-serif">Subject: Missed interfacesRemoved signal callbacks in object-ma=
pper results in invalidated DBus objects</span></b><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Helvetica&quot;,=
sans-serif">Date: </span>
</b><span style=3D"font-family:&quot;Helvetica&quot;,sans-serif">March 28, =
2022 at 8:19:40 AM CDT</span><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-family:&quot;Helvetica&quot;,=
sans-serif">To: </span>
</b><span style=3D"font-family:&quot;Helvetica&quot;,sans-serif">openbmc &l=
t;<a href=3D"mailto:openbmc@lists.ozlabs.org">openbmc@lists.ozlabs.org</a>&=
gt;</span><o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">An issue that is related to missed match callbacks i=
s noticed and it<br>
causes the inconsistency between object-mapper and the dbus objects.<br>
<br>
Steps to reproduce on g220a QEMU (it is not 100% reproducible and when<br>
it occurs it likely occurs on the first try when BMC boots)<br>
<br>
1. Generate several logging entries<br>
2. Call logging service's DeleteAll<br>
3. Check the objects of logging service, all entries are deleted<br>
```<br>
# busctl tree xyz.openbmc_project.Logging<br>
`-/xyz<br>
&nbsp;&nbsp;`-/xyz/openbmc_project<br>
&nbsp;&nbsp;&nbsp;&nbsp;`-/xyz/openbmc_project/logging<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`-/xyz/openbmc_project/logging/internal=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`-/xyz/openbmc_project/logg=
ing/internal/manager<br>
```<br>
4. Check the entries via object-mapper, it gets the entries<br>
```<br>
# busctl call xyz.openbmc_project.ObjectMapper<br>
/xyz/openbmc_project/object_mapper xyz.openbmc_project.ObjectMapper<br>
GetObject sas /xyz/openbmc_project/logging/entry/1 0<br>
a{sas} 1 &quot;xyz.openbmc_project.Logging&quot; 8<br>
&quot;org.freedesktop.DBus.Introspectable&quot; &quot;org.freedesktop.DBus.=
Peer&quot;<br>
&quot;org.freedesktop.DBus.Properties&quot;<br>
&quot;xyz.openbmc_project.Association.Definitions&quot; &quot;xyz.open<br>
bmc_project.Common.FilePath&quot; &quot;xyz.openbmc_project.Logging.Entry&q=
uot;<br>
&quot;xyz.openbmc_project.Object.Delete&quot;<br>
&quot;xyz.openbmc_project.Software.Version&quot;<br>
```<br>
5. I could verify that the DBus object does not really exist:<br>
```<br>
# busctl introspect &quot;xyz.openbmc_project.Logging&quot;<br>
/xyz/openbmc_project/logging/entry/1<br>
Failed to introspect object /xyz/openbmc_project/logging/entry/1 of<br>
service xyz.openbmc_project.Logging: Unknown object<br>
'/xyz/openbmc_project/logging/entry/1'.<br>
```<br>
<br>
I also added some logs in my service to get callbacks of the<br>
interfacesRemoved signal, and it shows that I really do not get the<br>
callbacks for some objects.<br>
For example, in one test I have 41 logging entries, and my service<br>
only gets `interfacesRemoved` callback for entry 18~41, this causes<br>
the object-mapper to show the remaining 1~17 entries while they do not<br>
really exist on DBus.<br>
<br>
This looks like some fundamental issue in dbus-broker or sdbusplus.<br>
Is there anyone who hits the similar issue?<br>
<br>
-- <br>
BRs,<br>
Lei YU<o:p></o:p></p>
</div>
</div>
</blockquote>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ0PR15MB4203E9DBC4747F99D019A2E2E81D9SJ0PR15MB4203namp_--
