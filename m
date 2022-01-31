Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8869B4A3DC8
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 07:42:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnJR30Wzbz30Nd
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 17:42:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=NEGQH6Ct;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=003070eca2=matt.muggeridge2@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=NEGQH6Ct; dkim-atps=neutral
X-Greylist: delayed 1956 seconds by postgrey-1.36 at boromir;
 Mon, 31 Jan 2022 16:23:26 AEDT
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnGgL6BLDz2xsr
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 16:23:25 +1100 (AEDT)
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20V1FtKq027651
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 04:50:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : subject :
 date : message-id : content-type : mime-version; s=pps0720;
 bh=Uak7yXoNseYQ8aEMC3hKj2ZXOS1m3SSVALfh8tPoffU=;
 b=NEGQH6CtQl4I+fJbHCPPZxiZ2880hkfnN6ZSZ/rxHibkHmkMtmrbUEzFfSmDf89zf4hf
 5l7bSvR3/yqTZW5/TeHSlxD5phKgfQhyi7c8OGjB2Mlhr+HX9eg31W5pEPqMl4y5JiMZ
 ttp71cff/ievWtoqF/0AWrN48gEfd+9wx46lGvn9bNVThjFQEt9O3P/BeoLc5qobH8SI
 LL/WFiKrmcMwp1GbVZwDGYoYMOORTid7yk1sedb2ApXAqofssRD2/thyiB5K70QxIm6q
 qdGoQ+p3HAwfRDIweutPbHSM3ZuK+L+hHjoyeMXo4+SUNpiHW79PMRmkqHrVF35ggFnO xQ== 
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
 by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3dw0129xu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 04:50:43 +0000
Received: from G1W8106.americas.hpqcorp.net (g1w8106.austin.hp.com
 [16.193.72.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2354.austin.hpe.com (Postfix) with ESMTPS id 725CCA8
 for <openbmc@lists.ozlabs.org>; Mon, 31 Jan 2022 04:50:42 +0000 (UTC)
Received: from G4W9332.americas.hpqcorp.net (16.208.32.118) by
 G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP Server (TLS)
 id 15.0.1497.23; Mon, 31 Jan 2022 04:50:42 +0000
Received: from G9W9210.americas.hpqcorp.net (2002:10dc:429b::10dc:429b) by
 G4W9332.americas.hpqcorp.net (2002:10d0:2076::10d0:2076) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Mon, 31 Jan 2022 04:50:42 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.241.52.12) by
 G9W9210.americas.hpqcorp.net (16.220.66.155) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.23 via Frontend Transport; Mon, 31 Jan 2022 04:50:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3NJ0LBPxAKiktC8bRjyG0NjVakssEpi0M9SilGn20hmtT6OWfNowrKOJpKQjdzGQy/0Ja6YzQF26njw02oifQ1GcchuiHKzInSdPNxRuPXDymDFiZoE5w/O0ZMlyRv/rgX4S+K1/wRph1lBCHHDWKll84HHpDzaRXq1vTGXZl6Kec2pqR2E7kveDjEVEgKLzz3e9vzIWj30hthL74/4gaDFRumI1nGyBDTp5Slcch9gKaV6F9tfCZP2AZpGsks7rJCHnUU/tMFnzza41sgZgdG1399jBsPTR3b0/3d8N6iDePWF0GZlSyzTNRmWKg/0i/FZnGqH/5q4ZsHi5yqn3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yj2Vd6IIif4xgEzwMCbZk3i+IephHBoTsJ2dZ7PGuXw=;
 b=JDWgaTNefNUkrEZZzrZ2xpPfS69lgCqRHUxitD1/5KmlG2kIfjyf8vHHz0G75hol1soE07cP8VSjRhu9w98o535ZTHh4q7lwhcQ6mtxh4QLL1nZS5tYFIXUQnfme+c4GblSeFaiTh2/9QgTqfMDnpbJ/o/2hPNrw0MuyBQh7zIEn6tHt+tn+UJlBtERjayje8TrPEudmBui0+Y1xrAGqUBLcoJpcz9QtGS5RlMM/0gND6eP5K7HJ5m5qLZdSD+LBqQnz7UdjPYiWgoBPs5MVVOl3niUyzP9BJ+vzrIgPCbMpp6lKzTCI4bgt0bsHj6ykhbPxWV/O3vAzcF4oOvWL5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::15) by
 MW4PR84MB1828.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1b3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.21; Mon, 31 Jan
 2022 04:50:40 +0000
Received: from DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::85e9:f9c7:b56f:cdb4]) by DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::85e9:f9c7:b56f:cdb4%4]) with mapi id 15.20.4930.020; Mon, 31 Jan 2022
 04:50:40 +0000
From: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC v2.10/Hardknott status please
Thread-Topic: OpenBMC v2.10/Hardknott status please
Thread-Index: AdgWXbcymuo4TS1MSrmNNiFwvQzB+Q==
Date: Mon, 31 Jan 2022 04:50:40 +0000
Message-ID: <DM4PR84MB1855478F75965FD5275971E6D8259@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 171b1635-cb13-4e46-b70e-08d9e4753b28
x-ms-traffictypediagnostic: MW4PR84MB1828:EE_
x-microsoft-antispam-prvs: <MW4PR84MB1828C9654B6F0E0DEB9C7BF0D8259@MW4PR84MB1828.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4bkW9xjVHXWCwFpXpUb+hBtkxv7EdfEI39r0Igi4f8xyt6Mbz10fBXnfruNKFjw9t1opyJSCiSbWRGMLRt+nIdQvEy8r4b9ULVSmtojR2v5FDUMJcO8aZxALaxeDAU6BODXQ2lUhIoBdOuyTOtuO+xIvVI+/vth5g/3GhzPN6amEPHIaWDMszYHQ62oji3kCLPOYdKU0yPTeL22fI6g6XKLL6hQ86OpWKhga8HwC0BgMTy/mYwMLOgUlzIZNBk6kp3JgOeHWK4E9Z+WbcnHpGxgeJc0wTH5CsQCyp+wQFj1GmF6KU69aaaSeocIbbZrJNR7fTdHBYJTm6n0Q5uXoA64GN4zD9Dw+50+F7tyn5jvlOHWcsAS+a8auuLUARDwt0cDxNVNpiePuYPd+1XT+YMraxUB+zdCjs4WImOVy1jLK7NgdEiao7CPmKHEE1zPjOEspLpNO8aFscm6YYZnyOEU6/loSMHjeZCfIexDGmoxRyHhp7/Eli9zM+Tmwajf2HLYKWxzBYin3SduxFqkvGEzVh3SAMOKZvj2cyqaQQ42sA/U5aO4Sx+BwBDyU7FgaLj7xhVIjqlYgulK10TBxalOHVHbhg5sGqEs4Ms3eFO+vMKLQ6qZBDGDAKGOgq06sJd5Fq32FTmhiAllJc4hfwiXMRtcNdvBp8WTjz0d0UryS6GfhRgISkk95EAUDQfD/pWqUCpuM5R1lJ39zT3ilD/2Uyg8XjaWAaPTVf78LDfvE2GRV2uYphfgt5U+PGSZMLO3d7dRQeUtpeXEHUKuYgN3xZ2afOpZ5fX553zsE1rqexMQ0mqLMtVX89YF3INTz+rIEDooEnXdI70ZBit2cgg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(166002)(66946007)(66556008)(66446008)(76116006)(83380400001)(64756008)(66476007)(508600001)(82960400001)(38100700002)(316002)(6916009)(9686003)(122000001)(53546011)(6506007)(7696005)(9326002)(86362001)(33656002)(38070700005)(71200400001)(186003)(8676002)(5660300002)(8936002)(55016003)(52536014)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?II7Gc0pYySu1+szv68Vf+MOSBhuWCPIUUHBT6vcC5vZaL42qd1TajjZPhmqf?=
 =?us-ascii?Q?eCkNbPSfFeRqu8Pff6G7pVdkfoDJhlhNAvW/018O3ZJrFp6Us9kns4o7HxhK?=
 =?us-ascii?Q?jO4kdhLS95xCGmM/2fu7hKaBIA6siFSWzR1hBE7iW29siB8Es40YVrp2+Bs+?=
 =?us-ascii?Q?DaRZNHICUtIyapkl6bTN0NYSxRrJEiZ6oUTQvgngHGWVBwFONpyjN6s255Y5?=
 =?us-ascii?Q?VKI0wezwpudnwm0BFfr2yb29CvElEbW4RP4pFJ6Semh9J0nWBr5MOBYWsel8?=
 =?us-ascii?Q?Fmx2/QEWn0vDJVyMRl9bwz7JnM1wz2WqajKvi7ZuCefCR6TNZnftQB3p3L0c?=
 =?us-ascii?Q?qDtSz3+9YvADl0wRGl9eZBWFaMLQLTFNw/M/Hbl8XE3GrFVxrnPmQkcwxro4?=
 =?us-ascii?Q?mKCRbRBS+701ySS0xAREcXoxzPJgDdjZOihXUy/8Du5Pr9nS1QvRKM7FiaI4?=
 =?us-ascii?Q?GPfnvUZ+EAHtdLeCftiGHa6omZ0z3K4ZHfIzLIlLD7HQhXiUhH0zpiizfYR5?=
 =?us-ascii?Q?4bVIHk/SxSfhmUESj6C+dB4XKnM8bYRJbDm34Kz8m9NxtXbGNK1GhlstXE2M?=
 =?us-ascii?Q?2wfTKTJJS7inCJx3kFbioPCFT+4ebXfBTcXqoUmLOD3OVA1wywenLu8EPBgn?=
 =?us-ascii?Q?ArWMj96K4qKUtnFODxSjf/iE9VuJsqfz/Wvx2iettMhX+ReltX1zXMsEAlP/?=
 =?us-ascii?Q?NozAZIgKWME4M1iJJAOq9JuIcAe9zaUqy0Do3FOK7l+kHtt7FPZX42y3NpuU?=
 =?us-ascii?Q?rQyW/jlPq1pS67WjU7alga/FqWHC2XrGdKaV6UbvFM9OwRqAB6krZTNTnvvM?=
 =?us-ascii?Q?js4iMcQe8VK0mOnQvj3G/R9DZdJCHyo8s08h7alIwLG4LBfKTUwovD5agdOj?=
 =?us-ascii?Q?HenlUnUoD1xiDw64G4Dcazk2mJ28BRucPaVwXb2U6b/YFDjVObx+EFt+i8iR?=
 =?us-ascii?Q?6iyeuWwZmiJLrpIq/K5cu6G+e72YQpU6bsLXPsIfIbvLa6Tb1hGjtf30DmrY?=
 =?us-ascii?Q?28yM4bBSa1zmnzpP851hZgiJ4GiMKds+He8i99ybzqVhkDiBbwD3ZZCW+jzJ?=
 =?us-ascii?Q?nI7g6O3d+qA4qlfacqaCMccA1hyoAkZ2QOimIaTwfa6Ifsar93vDVBGkMIGm?=
 =?us-ascii?Q?tY8sgk5VfmsZFa5hKtDZh9HVXZ6OeQHREMILyN7T/6yPqBLrKtMpF1MsIGQz?=
 =?us-ascii?Q?JNRSqJknDKTXglKcxOg7PMBMElMx+Ds2iYek8Y+4xTcSDOAnVm1f7M6IsvPe?=
 =?us-ascii?Q?WU8REAqC3k2qeR/od77UIIO2YnXM4ZAtViVjpNKPjYxiRksaBZRoDWH/mIqT?=
 =?us-ascii?Q?OOHeMxtAx9LPiXMugK7E+JuMHGO5p0Ev7sjzlsrppn7Q+8IK/oN+0rxsc3QQ?=
 =?us-ascii?Q?fZk9402alq+NxdM+eSo1MsFqjixmwoMbhku3+al5GJXE+BmhAjA0cdura8Nt?=
 =?us-ascii?Q?8KZRfmt9zBJ6q56Qum7iSOvLHh7sVmqhn8CQBT2IyiCFJ+p66Ece53Ld8r7p?=
 =?us-ascii?Q?Fnt3hxA/1pQk5zx6e/kEsDD3Gm1MuEnzDU8ondxnuPxYEz7mA4Yzokumgsq2?=
 =?us-ascii?Q?mOaGJtAUuF6b3Ih1L9/b0/Sd+2Dk+QouJKimbuBBdlPlvxRLL1onYYR/ySPh?=
 =?us-ascii?Q?k8OSRBIXa++Me6MgGu2uZl0u+E5LnEo8jUvwFaDgnw/0t3JLDNUJAyzqe7QO?=
 =?us-ascii?Q?/+JZBJUW8NbkdtPYsGOSL+noUoyepdgOAfBMH82AGOIk7jo1rvn/iH9PlFpo?=
 =?us-ascii?Q?YokVLDu9vw=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM4PR84MB1855478F75965FD5275971E6D8259DM4PR84MB1855NAMP_"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 171b1635-cb13-4e46-b70e-08d9e4753b28
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 04:50:40.3841 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EAKDPaccG2b4HZRajHcalsLI/xYwuRIHsNTpPnNgSjvVYG8+yQWv2VFuLYDvmrgrDGJLqTZ7LcEfA/KLdDNwE/mQ2Gjd83GpbGq4YxiMcAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR84MB1828
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: 03lKSoWraJAjTtaMEyhmC79onnaf9p0x
X-Proofpoint-ORIG-GUID: 03lKSoWraJAjTtaMEyhmC79onnaf9p0x
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_01,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 impostorscore=0 clxscore=1011 phishscore=0 malwarescore=0
 mlxlogscore=745 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310034
X-Mailman-Approved-At: Mon, 31 Jan 2022 17:42:31 +1100
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

--_000_DM4PR84MB1855478F75965FD5275971E6D8259DM4PR84MB1855NAMP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

OpenBMC v2.10 is desirable because it has the 5.10 kernel, with an LTS of D=
ec 2026. Though, I need some clarification, please.

I see a few pieces of information that cause me to question if there will b=
e an OpenBMC 2.10 release.

In a message from Patrick Williams (appended) he states 2.9 was the last re=
lease and the plan is to target January 14th, 2022 for a 2.11 release. What=
 about 2.10?

Meanwhile, at the time of this message, there are no release notes<https://=
github.com/openbmc/docs/blob/master/release/release-notes.md> reported for =
2.10.  Though, the Current Release Content<https://github.com/openbmc/openb=
mc/wiki/Current-Release-Content/b8934b1382409fdecf996fed6c56339e76717f2c> s=
uggests 2.10 has been released.  If so, when was it released?

Can someone clarify the status of v2.10?

Thanks,
Matt.


From patrick at stwcx.xyz<http://localhost:8080/source/s?path=3Dstwcx.xyz&p=
roject=3Dopenbmc_mail>  Thu Dec 16 09:14:10 2021

From: patrick at stwcx.xyz<http://localhost:8080/source/s?path=3Dstwcx.xyz&=
project=3Dopenbmc_mail> (Patrick Williams)

Date: Wed, 15 Dec 2021 16:14:10 -0600

Subject: Upcoming OpenBMC release 2.11

Message-ID: <YbposjOPwc1puNvR@heinlein>



Hello,



It has been almost a year since our last release (2.9).  We created a tag f=
or

2.10.0-rc1 but it was never completed.  We recently created a branch for the

upstream Yocto Honister release and primed it with everything that was in o=
ur

`master` plus an update of Yocto to the Honister release branch.



What I'd like to do is target January 14th, 2022 for our 2.11 release.  If =
you

are interested in your systems working on that release branch, please test =
the

'honister' branch and let me know of any issues you see either here or in

#release-planning.



Since there has typically not been tons of demand on release branches and

support of them, this is going to be a low-effort process.  If anyone is

interested in better defining (and executing) a release process going forwa=
rd,

we are certainly interested in volunteers.


--_000_DM4PR84MB1855478F75965FD5275971E6D8259DM4PR84MB1855NAMP_
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
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.0pt;
	font-family:"Courier New";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";
	mso-fareast-language:EN-AU;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-AU" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">OpenBMC v2.10 is desirable because it has the 5.10 k=
ernel, with an LTS of Dec 2026. Though, I need some clarification, please.<=
o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I see a few pieces of information that cause me to q=
uestion if there will be an OpenBMC 2.10 release.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In a message from Patrick Williams (appended) he sta=
tes 2.9 was the last release and the plan is to target January 14<sup>th</s=
up>, 2022 for a 2.11 release. What about 2.10?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Meanwhile, at the time of this message, there are no=
 <a href=3D"https://github.com/openbmc/docs/blob/master/release/release-not=
es.md">
release notes</a> reported for 2.10.&nbsp; Though, the <a href=3D"https://g=
ithub.com/openbmc/openbmc/wiki/Current-Release-Content/b8934b1382409fdecf99=
6fed6c56339e76717f2c">
Current Release Content</a> suggests 2.10 has been released.&nbsp; If so, w=
hen was it released?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Can someone clarify the status of v2.10?<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Matt.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<pre style=3D"background:white"><span style=3D"color:black">From patrick at=
 <a href=3D"http://localhost:8080/source/s?path=3Dstwcx.xyz&amp;project=3Do=
penbmc_mail"><span style=3D"color:#2030A2">stwcx.xyz</span></a>&nbsp; Thu D=
ec 16 09:14:10 2021<o:p></o:p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black">From: patrick a=
t <a href=3D"http://localhost:8080/source/s?path=3Dstwcx.xyz&amp;project=3D=
openbmc_mail"><span style=3D"color:#2030A2">stwcx.xyz</span></a> (Patrick W=
illiams)<o:p></o:p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black">Date: Wed, 15 D=
ec 2021 16:14:10 -0600<o:p></o:p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black">Subject: Upcomi=
ng OpenBMC release 2.11<o:p></o:p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black">Message-ID: &lt=
;YbposjOPwc1puNvR@heinlein&gt;<o:p></o:p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black"><o:p>&nbsp;</o:=
p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black">Hello,<o:p></o:=
p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black"><o:p>&nbsp;</o:=
p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black">It has been alm=
ost a year since our last release (2.9).&nbsp; We created a tag for<o:p></o=
:p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black">2.10.0-rc1 but =
it was never completed.&nbsp; We recently created a branch for the<o:p></o:=
p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black">upstream Yocto =
Honister release and primed it with everything that was in our<o:p></o:p></=
span></pre>
<pre style=3D"background:white"><span style=3D"color:black">`master` plus a=
n update of Yocto to the Honister release branch.<o:p></o:p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black"><o:p>&nbsp;</o:=
p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black">What I'd like t=
o do is target January 14th, 2022 for our 2.11 release.&nbsp; If you<o:p></=
o:p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black">are interested =
in your systems working on that release branch, please test the<o:p></o:p><=
/span></pre>
<pre style=3D"background:white"><span style=3D"color:black">'honister' bran=
ch and let me know of any issues you see either here or in<o:p></o:p></span=
></pre>
<pre style=3D"background:white"><span style=3D"color:black">#release-planni=
ng.<o:p></o:p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black"><o:p>&nbsp;</o:=
p></span></pre>
<pre style=3D"background:white"><span style=3D"color:black">Since there has=
 typically not been tons of demand on release branches and<o:p></o:p></span=
></pre>
<pre style=3D"background:white"><span style=3D"color:black">support of them=
, this is going to be a low-effort process.&nbsp; If anyone is<o:p></o:p></=
span></pre>
<pre style=3D"background:white"><span style=3D"color:black">interested in b=
etter defining (and executing) a release process going forward,<o:p></o:p><=
/span></pre>
<pre style=3D"background:white"><span style=3D"color:black">we are certainl=
y interested in volunteers.<o:p></o:p></span></pre>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM4PR84MB1855478F75965FD5275971E6D8259DM4PR84MB1855NAMP_--
