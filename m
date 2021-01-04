Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F96A2EA086
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 00:13:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8ryT0TXrzDqMM
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 10:13:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.173.93;
 helo=mx0b-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=keysight.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=sAU5tCiw; 
 dkim-atps=neutral
X-Greylist: delayed 405 seconds by postgrey-1.36 at bilbo;
 Tue, 05 Jan 2021 10:12:12 AEDT
Received: from mx0b-003cac01.pphosted.com (mx0b-003cac01.pphosted.com
 [205.220.173.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8rxS1JLzzDqRR
 for <openbmc@lists.ozlabs.org>; Tue,  5 Jan 2021 10:12:10 +1100 (AEDT)
Received: from pps.filterd (m0187217.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 104N5LFA030687; Mon, 4 Jan 2021 15:05:21 -0800
Authentication-Results: ppops.net;
 dkim=pass header.s=selector1 header.d=keysight.com
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by mx0b-003cac01.pphosted.com with ESMTP id 35ts4jt70g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 15:05:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dG6AUmkMK41UK9YOO0aia3aZV0RtPsPGWEX1KqTdzAiDE2LYbAkA16T/PwxChVj7p3HvibpbCGMRtp7mwAnBecMmUSMu8fSCKCv74ritfJas04BrQerfYHIL0EEQgSu1v5rG6vhCaX8WGgJCAQDN0QTI8r0rl2kB1tDvtWfmMLCTHjN7YMUh95O/a3aVOniaftrd3ieFCerdwRQrzLhWXuaKQ9FNMzIij3GnVAJ5ioahZ8h0Im19Mar+kK9zjA0KcsRhJP4pkb4k0vlM0uc8RTlwFhM5wGbDzCnoT9PAnsfgs/PeH3dz6ZHqin7HfLksSNaqKr182sZWoo64ftXrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjQR8vd5B0iFMjYOhrYfgl313ZfzMG4Ibkv03gTk7f8=;
 b=BaYQBD2UgP9PnbRGPReObDYmHrUO9Z+YlrMyIruMCp0FWXKfDY/MLRR0fYT/WOrqQbYnRa6nYG313Fi1RKnzx1EloCt85CpeR677J84HBDoeQCsgiOUDlW/XD0UeiglmamwahZvFdkOBp0VBzz3vILsKJsI1Yq0Y+dmQnBQz4SQwg+rsidRW+27MxZJ6Mk64CNrza4tZw3VEpCyUmPOXU/MmeCOdD1aPuJDi7J7JOAbz3NH36VAbjjki9unYXvkewNIdnZTXsVgriv2HJi+nmXy1jyIymNCFYQ0792VdqLgpgUqnSnyIqkt7+s8rotqlsHG24GpxXwsXckuiionFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QjQR8vd5B0iFMjYOhrYfgl313ZfzMG4Ibkv03gTk7f8=;
 b=sAU5tCiw3lU/gIr0AKIZy9C4TADOpCRJT4aHpQOdpi9RkB8PIYgTxcxbqp6GYgg4oeSXf7+qqfp3VnLiI3akPpf/WD6z9S6yl4tll2BDewnr/LhHvaJG82Lb6aUv3U54ZLi/yaxWTEjHSg09Fw4oK5gnMxVAveye/V+AVTs0Tac=
Received: from SN6PR17MB2558.namprd17.prod.outlook.com (2603:10b6:805:db::20)
 by SN6PR17MB2637.namprd17.prod.outlook.com (2603:10b6:805:cd::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Mon, 4 Jan
 2021 23:05:18 +0000
Received: from SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::70d0:d9b3:e746:ab13]) by SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::70d0:d9b3:e746:ab13%6]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 23:05:18 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: add a new yaml interface definition
Thread-Topic: add a new yaml interface definition
Thread-Index: Adbi09Kn+0NMxZAyTvq9aP/32+RboQAFDtmAAAFspyA=
Date: Mon, 4 Jan 2021 23:05:18 +0000
Message-ID: <SN6PR17MB2558F662101C2B4AE4A09F5096D20@SN6PR17MB2558.namprd17.prod.outlook.com>
References: <SN6PR17MB255899EA5DB3A379ABEA68E996D20@SN6PR17MB2558.namprd17.prod.outlook.com>
 <X/OVFwJ9589BhkXb@heinlein>
In-Reply-To: <X/OVFwJ9589BhkXb@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=keysight.com;
x-originating-ip: [64.157.241.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c0ab757-b5f1-45c2-4f3d-08d8b1053491
x-ms-traffictypediagnostic: SN6PR17MB2637:
x-microsoft-antispam-prvs: <SN6PR17MB2637A57689CA1E5BFBA956DA96D20@SN6PR17MB2637.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xlvvOMpn28Kc6I92VkDi33BO/1/3NDUjWffvAmA58iuL7GwJ/N6OSLg15cqJURcrHpsJ0HordlTBBVJ3puYjjXpgfToT0J80aABYtrUnUDbNfzRXygCI86cCJwJS6Z62WAzE88kyR31LHX8qzcQRwG9Y8MKgfsqgkuBJ2iLmM2QLjKNqM5ZtL/KTxdKytoZUYqHjUTD4itkAldgcHWfwFyb370Ecyl7LVBmLpP05NYvb07R54Vesz98ksQslbad8YXIcSyAnloj/T26hTKR0L3JPZ14BQXvOJFbdyQ+yoF/61DzLihD0yB1PiMDfqSe7Fp+Q0pAR/thwNRem1MWeanNO+6nrAqLhF01ohhWr7yfD1B6XQ1ior202FSjmME5CAzr9rl2eMAZRgVSU25NQFQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR17MB2558.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(6916009)(9686003)(4744005)(83380400001)(7696005)(53546011)(6506007)(55016002)(52536014)(478600001)(5660300002)(4326008)(26005)(76116006)(44832011)(186003)(2906002)(316002)(66446008)(8676002)(66556008)(66476007)(8936002)(66946007)(64756008)(33656002)(86362001)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?nTS5KAYh8V1pyHkkAGhEcmZySq290uzQHICvqeVFuRQD830wfT5aXof+qrem?=
 =?us-ascii?Q?xiHn2VpcW9XTRkkp9lOap/vFcauWCnoxmXCFbwEJWx/l6/2WtUcpSl9OKtFO?=
 =?us-ascii?Q?DimXemcHzY1U9qBx6jSVhHmYTUpWiLrmwsqL9x1pVNHH/fIs06SefGpcyRGm?=
 =?us-ascii?Q?rSjfYrxteVefs78Z0yWO51NGsF0A1SE+reJgqEYaoKGId1/Qxq8t4bID1AS9?=
 =?us-ascii?Q?V21KOTv+cVouinfD64vnhNkXKzexfSkIr9Ac3UzwiEfzBg46WpZ+kv4CFmb5?=
 =?us-ascii?Q?hBFUT8BhgFOBPOu9wp52g7y0fitgpKUxhmACSsxLP0zHF0/YNTkt45cEBkuN?=
 =?us-ascii?Q?SYWwg8512HdTFfvJMFJY3a3C+wzg2OCwaagtSNep9e4paneISkFyCRjS1LYN?=
 =?us-ascii?Q?WGnt2zFaVQ7e3SvPVV21IGzX8gVSmI/gLFyIepadpSzD/Ujenee4lzm6Ua5v?=
 =?us-ascii?Q?r5eEXSzSYoXDnh1kQHVNCUAZmESa9rF406cEDu0KX6V2Yvp2NF9blGQdjGu1?=
 =?us-ascii?Q?EX7Sop/sVWiQNBSYFBMxE9FgFjPi8MavGCAFLwy2h/6IE1Is0QGNqIKX8ClH?=
 =?us-ascii?Q?i86uswP9gmhEhoK4wZCE/psXELvPndWPsvL09IrChUVzpscVu3+8lpnKL5vD?=
 =?us-ascii?Q?ByMHTifQmqA3/Meobvhiax7q1S6r8IO0TSkiVbvVIMGVMLfJ3dVOGjP4h5IP?=
 =?us-ascii?Q?h1CFNG46oDolihGup1KbAm/JQjaefVbWyRVMxm0GeILpPCZ947XVeVkEMlyB?=
 =?us-ascii?Q?pBgD0THfQ1NT+6fQIrY47uUvA79n1qPr1P2+iuf9JAI9bmRqTwCdgiyU0RB1?=
 =?us-ascii?Q?JrPXGtpH0ixSXPSH2puasKCvcl4LwD4o5L6jP4qKcu29W0ZsW07IH2kcp+sb?=
 =?us-ascii?Q?1ltf41G9Vq9r31x2UarVfS0C9KPom41HuOgQATtqhskjrVLvc7qI0qm1qAt0?=
 =?us-ascii?Q?y9r2cjZ6ujt04iNI8xI4dk+ZXgcvO8IL3POlAQVZ6jY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR17MB2558.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c0ab757-b5f1-45c2-4f3d-08d8b1053491
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2021 23:05:18.7186 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jRnHJQVwAgoZzMeC78+Mj+9nXz2b2FjAFszxKdZ3Zym0eWB3vsz3tCoPQlA/85/j78w3g4f/W+Lc7RycukjpG1Hb/fSnV21WhGApzCutcN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR17MB2637
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_16:2021-01-04,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 phishscore=0 mlxscore=0
 clxscore=1011 suspectscore=0 adultscore=0 mlxlogscore=654
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101040139
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

Hello Patrick,=20

Thank you for the quick reply.  Step 3 fails.=20

   3. `meson subprojects download`

ixia@ubuntu:~/git/development/openbmc/build/fender/workspace/sources/phosph=
or-dbus-interfaces$ meson subprojects download
Error during basic setup:

[Errno 2] No such file or directory: '/home/ixia/git/development/openbmc/bu=
ild/fender/workspace/sources/phosphor-dbus-interfaces/download'
ixia@ubuntu:~/git/development/openbmc/build/fender/workspace/sources/phosph=
or-dbus-interfaces$ ls
com  gen  LICENSE  MAINTAINERS  meson.build  meson_options.txt  org  README=
.md  subprojects  xyz

thank you,=20
Mahesh

-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>=20
Sent: Monday, January 4, 2021 4:22 PM
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: add a new yaml interface definition

[EXTERNAL]
