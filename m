Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F0EB06A5
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 03:56:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TMML53jczF3w7
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 11:56:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=41587c9769=wilfredsmith@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="WNQbXF9E"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=fb.onmicrosoft.com header.i=@fb.onmicrosoft.com
 header.b="cw3KLtay"; dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TMLp6wckzF3q6
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 11:56:14 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
 by m0089730.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x8C1tAHs015401;
 Wed, 11 Sep 2019 18:56:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=+HO/feIbVMp3cLwZMHRU8TObDQUCcTgaF+nKs1dVet4=;
 b=WNQbXF9ESLw+IXUrvBEjqzqqGyuT2u35xvPKCAkhUjSjb6/7X0tS/i6QXIqHCxqWHypQ
 gl6JKqD5/XpQu1y5IBMU4koc0kJTgFnj6YcoZasgHZSXCI0iGvvJ9hVbmSUwmiiBbTZN
 GGfc2dQFGwCLm/p2cMON1IfsXo0r//q+Nmg= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by m0089730.ppops.net with ESMTP id 2uy315tshe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
 Wed, 11 Sep 2019 18:56:11 -0700
Received: from prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) by
 prn-hub01.TheFacebook.com (2620:10d:c081:35::125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 11 Sep 2019 18:56:10 -0700
Received: from prn-hub06.TheFacebook.com (2620:10d:c081:35::130) by
 prn-mbx01.TheFacebook.com (2620:10d:c081:6::15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.1.1713.5; Wed, 11 Sep 2019 18:56:10 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (192.168.54.28)
 by o365-in.thefacebook.com (192.168.16.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.1.1713.5
 via Frontend Transport; Wed, 11 Sep 2019 18:56:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/sLrkZEL3fMezuRhc5AYGMbmvevwhufzNvieknMSxNm1lX9hXn1Luf+JKcUmK11pqFpdHK2btCrBN+WgjVeJ4nsl2HnwCfSu+bC1KySSn+EHTIpn5MqK2Mog0XBVYJ3G7E5FPMo9YC1xA4SAA6gU2av/49SScSbZ1Mv2GnXvgKhvFSn1tiDQ/kq3hq7tt6x7BpxyAa37d1Umu6tHdrtdjNO1b/bp25smBtPx48+2dzY9nSwc/85c/LewDIlaDF2bCaTvTEOAKZlgSY8gEny/i58/hoR2s12HzV6jM0KR8etQnt6nyKX2KmZ8eOcvUPS67/Wag/JW/rptgq+3drzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HO/feIbVMp3cLwZMHRU8TObDQUCcTgaF+nKs1dVet4=;
 b=VRdVlG8ZaCmbL6kszjT133Ex4qTD2vEvE22I7lz2bpG3jZo751ZTOt6K4abEhNnIAhzeEYX5cNJkR8C3ypKVXa860MeNPIA9xMCzjzR68Fq09HGnQb9IQR/tnznQ7p918f1A/QFIi4RIw4vTOM7IfZ8dGBpDhxyNx01KLg4gQ3ZlALeZxwH/Zz0BVn4vIYY8g1f8CCxgKqRyRPI21pEuBZzzUB+wp/G7aa3d09K/LDmTiSxgZ4nAXamFSyK9cLFG/nz/GAiWYbdyQUXViKY8ToFRpq/42dOoNfBGGiYvj9yXAX2gTVvhXs0coekexD1/jbg6cejqPXfjZpCA4YbK4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.onmicrosoft.com;
 s=selector2-fb-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HO/feIbVMp3cLwZMHRU8TObDQUCcTgaF+nKs1dVet4=;
 b=cw3KLtaynUt2e++x6okwqTRQbegGeq8txRWv4QY3YcqAFxQRkhIDvdhi64tMSNhjb+3axQrp/9AolIe4FnMoaapElfrY9Ql/yURkbJ2QtUePqcPNhHeqPLcgoZVJd2XidBrR08tEpZtEaLXHe7Wa/YHqt0TR2ZByayX1mbo4bnQ=
Received: from MWHPR15MB1823.namprd15.prod.outlook.com (10.174.254.147) by
 MWHPR15MB1165.namprd15.prod.outlook.com (10.175.3.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Thu, 12 Sep 2019 01:56:09 +0000
Received: from MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::58a4:cdb7:e5d1:ce7b]) by MWHPR15MB1823.namprd15.prod.outlook.com
 ([fe80::58a4:cdb7:e5d1:ce7b%12]) with mapi id 15.20.2241.022; Thu, 12 Sep
 2019 01:56:09 +0000
From: Wilfred Smith <wilfredsmith@fb.com>
To: CS20 CHLi30 <CHLI30@nuvoton.com>
Subject: Re: Port 80H Snoop
Thread-Topic: Port 80H Snoop
Thread-Index: AQHVaPdAEVclyzGJokWgrvvsee++JqcnR2sAgAABIwA=
Date: Thu, 12 Sep 2019 01:56:09 +0000
Message-ID: <F87104B2-56AC-479E-BEF0-8B764355D6AF@fb.com>
References: <A9898780-E998-4D00-98D6-70DD8BD4C69E@fb.com>
 <HK0PR03MB466066F3FD37BB68F833E638CFB00@HK0PR03MB4660.apcprd03.prod.outlook.com>
In-Reply-To: <HK0PR03MB466066F3FD37BB68F833E638CFB00@HK0PR03MB4660.apcprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2620:10d:c090:200::2:c910]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6927f36f-84cb-4d6c-f3c9-08d73724619b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MWHPR15MB1165; 
x-ms-traffictypediagnostic: MWHPR15MB1165:
x-microsoft-antispam-prvs: <MWHPR15MB1165478A0A40C09FC4BD53DABDB00@MWHPR15MB1165.namprd15.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(136003)(39860400002)(376002)(396003)(199004)(189003)(8936002)(5024004)(256004)(486006)(476003)(316002)(229853002)(6486002)(86362001)(81156014)(33656002)(81166006)(36756003)(2906002)(478600001)(4326008)(25786009)(8676002)(6916009)(14454004)(6512007)(6246003)(6436002)(6116002)(7736002)(71200400001)(99286004)(71190400001)(76176011)(305945005)(186003)(46003)(2616005)(446003)(5660300002)(53546011)(102836004)(11346002)(66446008)(66476007)(64756008)(6506007)(76116006)(66556008)(66574012)(66946007)(4744005)(53936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR15MB1165;
 H:MWHPR15MB1823.namprd15.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: fb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: E+Do5rYy1ZJsUBYNNSvZIlzfAwR9aXLRzQpd1tRCop0qAn6IP9AgvcWcpZstLoKzTLR4WMMhk3ablHJzGMTyAfmlD2gghd4DJNDP7WR5OO29LOGHVPklRCYyqjnZ8rkK902Rdf5z/2un5Lc41jyLUNCe0eZauIis3VUUQGcpGAfoWPzTNC4T6A1hVQHASX3K73MAFYVO08HQZqbat42W1MnD/LqcBz6CsJoEBJset6eaRuRX2Um5RUg9AqCSGQwDvVePHJVSL6La7NsM7qnXjWyhCNHuaQC216h80rArSjQwNvLE3YnD+Lr2vfV2h612c2tceTft9Qe8uWGkPWwtCzsN44cYMy7OHAqc29ZRX+cJxjzwP6diBTEOXz5FG3iK3UqTeKIV+pO2NxFQbWUydg6upbGHY1fNWcG5/p1hpn8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B027533DEE9D0743A633C88873CFCCA3@namprd15.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6927f36f-84cb-4d6c-f3c9-08d73724619b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 01:56:09.0366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UWzTJuzf8cFMjJVMSL74aVfDYw8VEes9mJkHmU/FaEcmhV+21kyXVZcjDt8EDquucD25rgbZ8SM5n3gSTHNiEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1165
X-OriginatorOrg: fb.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.70,1.0.8
 definitions=2019-09-11_11:2019-09-11,2019-09-11 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 clxscore=1011 mlxscore=0 mlxlogscore=678
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1906280000 definitions=main-1909120019
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Tim, Many thanks. Are you also providing the ability to track the history o=
f the port 80h snoop values? If not, are you aware of someone else having d=
one so?

Wilfred

> On Sep 11, 2019, at 6:52 PM, CS20 CHLi30 <CHLI30@nuvoton.com> wrote:
>=20
> Hello Wilfred Smith,
>=20
> You can refer the module phosphor-host-postd and add file recipes-phospho=
r/host/phosphor-host-postd_%.bbappend for changing your snoop device.
> (ex: SNOOP_DEVICE =3D "npcm7xx-lpc-bpc0")
>=20
> Then, you can execute "snooper" program in shell prompt and you will see =
the POST code be printed on console.
> You can refer the attach file about screenshot for the result of snooper.=
 Thanks.
>=20
> Best regards,
> Tim

