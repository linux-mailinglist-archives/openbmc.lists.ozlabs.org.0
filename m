Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C2B31563E
	for <lists+openbmc@lfdr.de>; Tue,  9 Feb 2021 19:46:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZsLc0ngFzDqMk
	for <lists+openbmc@lfdr.de>; Wed, 10 Feb 2021 05:46:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=16748fab14=benwei@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=c1xnYYGQ; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-fb-onmicrosoft-com header.b=Pw6gpRsD; 
 dkim-atps=neutral
X-Greylist: delayed 476 seconds by postgrey-1.36 at bilbo;
 Wed, 10 Feb 2021 05:26:31 AEDT
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZrvC2KbnzDsn3
 for <openbmc@lists.ozlabs.org>; Wed, 10 Feb 2021 05:26:29 +1100 (AEDT)
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 119I9eY2007084; Tue, 9 Feb 2021 10:18:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=h7cJefw54/rAY6ESgc53Mh/VeMYC3Kh5gLr4u3Ig65g=;
 b=c1xnYYGQTdyWc4S9tLeNu+r7iqeem/vWbp6NoIO+rXHTdvdG6JcrlSO6sH8oVc5m1U0T
 IGSqnHfbRx1V9HliBPHcMiUOBh6hwoL5SQTsh5XnaUs8/DwdPLmCtx9/O2lS+iU6Fe5t
 YgZzetgIs3ebInImT8bLDGeDxeMmz/JARL8= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 36jy96su51-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 09 Feb 2021 10:18:22 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.36.103) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Tue, 9 Feb 2021 10:18:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvXhxMVvq9rNbKjrx9RLykm+Mb/SJp4EzFV/v9Vdiv+QOpashlDyQInpZVJX5F/XQz07BPfEKOZkdIjVd7HFkWTj4YslL0ih2NF8yYmYP1NMecIpV1lXRjofmoKHbVDiGKYr+JQJ3AEHmOWlsMuajLuDm56S2X/CMsTy/uevrjEqUqOPpJ+NAnvSF+U7fVXd/ixhvwNoaE2rkE3GI+CF8kkPAKxlX7awJDYQUSpwxxxX1gjrOgOLeRiUWz+tc2xqTPKJKhzjilJKWyWzea2susiOW+DSl0pWEqmeKWK4YyHD6xRc1qHl74hYgniB3LnilubBrnSZ/rD73CGw3zJgzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7cJefw54/rAY6ESgc53Mh/VeMYC3Kh5gLr4u3Ig65g=;
 b=e64FwLp+bI0CY/y7lce0ipP4Zo5fF/1kHU+IO6pIFcse6QdGNOYR6zkkFruQISsvgK8uufkr039pNZw+s3EAGH38c8rDKhn57uxZULFaDeIOcbzBmwHCTulfZxKdN+g46jPtPayI9C+nSJN9fZYNpvkZLDrOhG/CIKr2NUYAX0BP+JRFGvIXEGT3tR1KkOSm7McU+G+PmQWv7Oe1DrBXNOiaXSVRnjENdVgksudfCpIbqspJ1FLz38MjMhUbJu65Tk2Cuymw5VgIGYUOWw3BSUMRuNIsV1mZR4gFJSNoi3A0jPO4xqS54A3ZCDovrZEfLY3IoacPm6E65g+NfVLZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7cJefw54/rAY6ESgc53Mh/VeMYC3Kh5gLr4u3Ig65g=;
 b=Pw6gpRsDZKNqPSlIywyArbu/Mi7sz+AwrdCiTRYnDCOm5EqTY522h+YtJtGdy39D+Unpi0e1y9eIJxKpjRNhGCPvP4/KxxFx+IqLKU3L3G6jwsOuHDz2TQRLWL91jTA0J2qpL73qY7Bjhnh5swJ1pDHw6MBWQum0bwKAAvbZr+c=
Received: from BYAPR15MB2263.namprd15.prod.outlook.com (2603:10b6:a02:87::27)
 by BY5PR15MB3569.namprd15.prod.outlook.com (2603:10b6:a03:1ff::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Tue, 9 Feb
 2021 18:18:20 +0000
Received: from BYAPR15MB2263.namprd15.prod.outlook.com
 ([fe80::fa:d1c7:ba0d:f53b]) by BYAPR15MB2263.namprd15.prod.outlook.com
 ([fe80::fa:d1c7:ba0d:f53b%7]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 18:18:20 +0000
From: Ben Wei <benwei@fb.com>
To: Patrick Williams <patrick@stwcx.xyz>, Andrew Jeffery <andrew@aj.id.au>
Subject: RE: Does openbmc implement NC-SI over MCTP over SMBus to obtain
 information?
Thread-Topic: Does openbmc implement NC-SI over MCTP over SMBus to obtain
 information?
Thread-Index: AQHW/n82zeaWiv+k/0aQUvtLIacKQapPMI5w
Date: Tue, 9 Feb 2021 18:18:19 +0000
Message-ID: <BYAPR15MB22631F0F108BAC2248894C75A38E9@BYAPR15MB2263.namprd15.prod.outlook.com>
References: <380419ba.ece.1777679c335.Coremail.ouyangxuan10@163.com>
 <12175d11-f353-4926-a125-f01e59135113@www.fastmail.com>
 <YCHfCQP72MmgNQSg@heinlein>
In-Reply-To: <YCHfCQP72MmgNQSg@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c090:400::5:c0af]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 208a0648-abf7-418e-8905-08d8cd27146e
x-ms-traffictypediagnostic: BY5PR15MB3569:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR15MB356946DA2D7B980FF2153763A38E9@BY5PR15MB3569.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bQ6ptW5c3UEQsU7MeAbAXM+NRiejsELO5kOVqi4Zl04NM3+igVNN/Imdr3te76MeWjFlj6AfRO0us9m1FKON90zB7tIvn/gB+p1i7AShiBSRuoev5YUY2gy2Alv9JJJph5/bcLXOb9LSPn/nnrY3EdmuznNu783C7Q5ZA0SzGjjKUL0zI7TlB9skHEMnR3yFmVncJEc7oGKukE+TbMiTwVWhxk00IZ15/ZPqAQlfkl5UsyQc17y+z5ICrYtfmnMj0n/q8CzTBtJPu73KxnqwW8nnoVhcqTp1tfoMcYPOW8jMYcZp53oRAQP0yBfJBoGZN9z96AdiWIbgAa/5oPZEMCv27bMOJv13RJIiGAHs01hijUCHy5iJbuh5iRA0Dgb9EeQFAvRg4L5Au21QLF+SNhZhmwen3Ep0LgS68zaB08kuoENgSKLeDNQeGu9YxR216mSy/2W2rph1IOqtMJEr/9mZ1O5aY393rKStnPNR6l10ESw/AG+Hl62XgrDsrLFwD0Du4F+chyp/E9wAvWZthA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB2263.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39860400002)(366004)(346002)(136003)(8936002)(33656002)(186003)(66556008)(66946007)(76116006)(71200400001)(64756008)(83380400001)(6506007)(316002)(7696005)(66446008)(478600001)(86362001)(54906003)(4744005)(55016002)(52536014)(110136005)(4326008)(9686003)(8676002)(2906002)(5660300002)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?J1J3Wdzi1F0ERqmBpIsmNVjqq5B6mnscG6Qc1EurDxLXefusE4GSaI2ixaHN?=
 =?us-ascii?Q?nifpdmVnysHd02M7FRjbDH1NTKE6cdLFmzTphgfY52K8lE9ON1YldxaW3A2L?=
 =?us-ascii?Q?qKjOYdaXmX+xg02+2H5bTg0LJ6W66FMAVq6Cg4fxf63EHDSp0Vt3ScRye7Md?=
 =?us-ascii?Q?Fwqdqs99dkIwpZERQCteUnT1464HCyzD8HUh+7jAP6UY5PI0xTJGAHAuXpb5?=
 =?us-ascii?Q?lIDfWmWwuhE2grED4S+GHkB1VY+7roMJEKFg9Usl6gKvgs6S10aecRhu8LXg?=
 =?us-ascii?Q?C1CBWIET9sizpzaPT4a/mUTK3LS8WeOETPbxdRH5iaqUwmUnd2h6D3Af7+Hn?=
 =?us-ascii?Q?D1uveW2OgnXxdFgurCJS+iuA9Ff/7w+oVwTO1vowS0DWmWeMVFSvbdlGqu20?=
 =?us-ascii?Q?IGDyagW58jEzUkLNCrxBD0IWgddFONubJB2Kgg0or0n3d853Q9DPS+2C7kq+?=
 =?us-ascii?Q?HwoUdUe5/6Cq0j9kNs9BI/U8kJZIxiyAbxVEK4RQx4BkxSkcnYWOG2+sdaAk?=
 =?us-ascii?Q?YJ104RdIDtFRzvP9TvqAYNZLapQloBCFcVTCT7OauTnAdrhwDIgLAG/MuiAA?=
 =?us-ascii?Q?CymrILCvDeXuos6qR6bgtk7aH7kOZfA7W48rP6hBxuVJ/5F65V1Nuk6NE9cp?=
 =?us-ascii?Q?S/cWx5hYrIatfCsBDWeVHNPHK/gsAsAcGFsG/WmSmB/hOIzC36xlZ/wMnFVj?=
 =?us-ascii?Q?y+gLJw5rHd+d+1otk7TXh6ZvGVfPXegYbHT1M42iN3BZ0giqABJD/WUvX6sd?=
 =?us-ascii?Q?l3S/2AQLoi+vsBH39FNA8lVazeNCHF0vP1++VfxfaLg+EdrkfRuWTue5QJd7?=
 =?us-ascii?Q?d+Pk8/xzSk7T/hjqQ2k+AUAgzgZPGqRpk+Kp+QbJv0hUZZqCDb8ZSfUUfyBI?=
 =?us-ascii?Q?KR2CYusWVwkSiTD/99MiBbDvGOvffFPBmPfQS8tgEd9Os/q5Vjh/rf1j09D9?=
 =?us-ascii?Q?2FJaf4vMvzyreKYhKT9weDVHiEy6XleqnppZu0YRBurZ5txGHCIckOEFhyxF?=
 =?us-ascii?Q?lGH1wHj/Sw3+x/15gweMvG1YZ1eqDNKBnBm1UeyN6j0OnQu4kfvLjF2MbbJ9?=
 =?us-ascii?Q?NvGsmP/ob5HBlsMCrWBjHEyYqna8NrLEVqg2rPxdxYl/EmpG10/TRqjmgUTO?=
 =?us-ascii?Q?uWbHOZD303u2VuxL/1g4LzE1aqKoPTT3lhZxbWPGW7HzegAC91pQ2JGXel75?=
 =?us-ascii?Q?ZCiYya+FunbqI2CEt245eFYTPQMnpTCRvP/XAZJXa71LrsJ/zF0IIBmeE3yL?=
 =?us-ascii?Q?ovWR365jLRy9DpzKhy6JOTwTh+Q/q79K6XW8jaqn7yPwYB7JhQUcmD8nkG5O?=
 =?us-ascii?Q?ZIsgDILcICS/GgMkK26VD42FApFrj1xs4mc3gKcwSBhvwA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB2263.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208a0648-abf7-418e-8905-08d8cd27146e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2021 18:18:20.1663 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /KSTpma96bEB/lBFqrT670tZh2j5G2wJGyD1CzjEU7xEWoyTShtRHD5KYYSqkfmk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR15MB3569
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-09_05:2021-02-09,
 2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 mlxscore=0 phishscore=0 mlxlogscore=999 clxscore=1011
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090087
X-FB-Internal: deliver
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
Cc: www <ouyangxuan10@163.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Amithash Prasad <amithash@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> On Tue, Feb 09, 2021 at 11:11:57AM +1030, Andrew Jeffery wrote:
> >=20
> >=20
> > On Sat, 6 Feb 2021, at 19:03, www wrote:
> > > Dear all,
> > >=20
> > > Does openbmc implement NC-SI over MCTP over SMBus to obtain informati=
on?=20
> >=20
> > Unfortunately not. There is an out-of-tree implementation of the SMBus =
MCTP=20
> > binding, but that needs some effort put into it for it to go anywhere. =
We're=20
> > likely to see a socket-based AF_MCTP implementation before SMBus suppor=
t is=20
> > merged in libmctp for the purposes of OpenBMC.
> >=20
> > I haven't yet heard of anyone running NC-SI over MCTP so you might be b=
reaking=20
> > new ground on that front too :)
>
> CCing Ben and Amithash.  I think we added some code recently on top of
> the Intel-BMC/libmctp to talk to an NC-SI NIC.

We're using Intel-BMC/libmctp stack to enable PLDM firmware update over MCT=
P so we can support out-of-band firmware update.
We currently don't have any use cases for NC-SI traffic over MCTP so we hav=
en't try to enable this.

-Ben
