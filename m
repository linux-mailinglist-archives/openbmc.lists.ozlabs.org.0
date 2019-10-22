Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2EBE6C03
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 06:37:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 471k4P243RzDqf5
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 16:37:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com;
 envelope-from=prvs=01982f51da=matt.muggeridge2@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
X-Greylist: delayed 1370 seconds by postgrey-1.36 at bilbo;
 Wed, 23 Oct 2019 10:24:02 AEDT
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com
 [148.163.143.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yV2B6GM3zDqKH
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 10:24:00 +1100 (AEDT)
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9MMtowP010907; Tue, 22 Oct 2019 23:00:00 GMT
Received: from g2t2353.austin.hpe.com (g2t2353.austin.hpe.com [15.233.44.26])
 by mx0b-002e3701.pphosted.com with ESMTP id 2vt9sh8h3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 22 Oct 2019 23:00:00 +0000
Received: from G1W8106.americas.hpqcorp.net (g1w8106.austin.hp.com
 [16.193.72.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g2t2353.austin.hpe.com (Postfix) with ESMTPS id B6BB386;
 Tue, 22 Oct 2019 22:59:59 +0000 (UTC)
Received: from G4W9326.americas.hpqcorp.net (16.208.32.96) by
 G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 22 Oct 2019 22:59:51 +0000
Received: from G1W8106.americas.hpqcorp.net (16.193.72.61) by
 G4W9326.americas.hpqcorp.net (16.208.32.96) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 22 Oct 2019 22:59:51 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.241.52.13) by
 G1W8106.americas.hpqcorp.net (16.193.72.61) with Microsoft SMTP
 Server (TLS)
 id 15.0.1367.3 via Frontend Transport; Tue, 22 Oct 2019 22:59:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOrWPb4OcP0pk0f+rmWqMM7uUdTxw6sVPxDypXtwXW3LksCQGLx2Z0goO6TuR8/sZtj1koDyeHMi96onNsNxNlczT+uBfp7SgA45tuC0eV/sAXVe8VlEvFU9XkHtbFrX4SZzHr3RWGwsu/XYHXDUuMxagjL+aRK6wVOG0YDJCzaYgKrFLHff0tZLe9yuZBG1PBbvyNABM6olGtsnoPANJZtpEDFnjTFhaYqtovfaW3Kx/fnk1B0X0XC9mCsSPSID5mnZKgOWmJFmMA3bYmJlceo/k19Q2JBfkLwVi82chfIV5I7lab879DoE8pZQrGeGBAwKUXE8pQTdU0ymoXlXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rk3MQizwiFVWak/twm4vhLtKZ2GsKxR/L6B4CmS4vBc=;
 b=MV9EaPs6nqupiSCtoswqhf2PMJcA3qri0/T4OKLltcVU35umCpVf4Ax7Z5ccw/re4ctI9L9Fl0UE9QJKr6U3cmzNdjH99P9oKKyeA4/ELiwf1j1oJhxSot/zEgV2/0tzvQWAwUGGWLSF9Fns3aQfywMG8wzN26I3D/8pC1xb2uG+itpbr6gFAaPs2baPt2Co31gEkscMh1s0UXpNScJnRPNRMwyJQ8YSpgp5o/SZaNtYM/xQNDDX6MDGMBEAex0/y6ilw1Qn3H17WIlaSmj0Ukd9cx9E8ggT9aP3Qg/LonfYF7bMU3c3symLyeiumo4cNPZR00UuIA5ilbKAQN+lQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM (10.169.92.136) by
 DF4PR8401MB0938.NAMPRD84.PROD.OUTLOOK.COM (10.169.87.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Tue, 22 Oct 2019 22:59:50 +0000
Received: from DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::549c:5769:d777:bb3a]) by DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::549c:5769:d777:bb3a%6]) with mapi id 15.20.2347.029; Tue, 22 Oct 2019
 22:59:50 +0000
From: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
To: James Feist <james.feist@linux.intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Searching the openbmc mail archives
Thread-Topic: Searching the openbmc mail archives
Thread-Index: AdWIhVKKBrQWkDx7So2Yph7TvCsesAAo0dOAAADTAfA=
Date: Tue, 22 Oct 2019 22:59:50 +0000
Message-ID: <DF4PR8401MB10841C76873D7211A47A4905D8680@DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB10848A550EA75ADAB33B0B29D8680@DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM>
 <d61da6e5-4bd7-5449-e75a-3eb109645de0@linux.intel.com>
In-Reply-To: <d61da6e5-4bd7-5449-e75a-3eb109645de0@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [60.226.189.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 806ed286-a1d4-43e1-392b-08d757438b0e
x-ms-traffictypediagnostic: DF4PR8401MB0938:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DF4PR8401MB093852AD43F0538407317095D8680@DF4PR8401MB0938.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:499;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(346002)(396003)(376002)(136003)(366004)(501694002)(13464003)(199004)(189003)(6436002)(7736002)(229853002)(55016002)(53546011)(3846002)(14454004)(305945005)(6506007)(6306002)(966005)(26005)(99286004)(6116002)(102836004)(9686003)(186003)(66476007)(81166006)(76116006)(52536014)(8676002)(66946007)(446003)(86362001)(81156014)(66556008)(5660300002)(64756008)(74316002)(476003)(486006)(8936002)(478600001)(66446008)(11346002)(33656002)(256004)(316002)(25786009)(110136005)(19627235002)(2906002)(71190400001)(71200400001)(7696005)(6246003)(2501003)(76176011)(66066001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DF4PR8401MB0938;
 H:DF4PR8401MB1084.NAMPRD84.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hpe.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zg7hNx+Hb+mSets0M6i6ZD7mI1KUhXoBhsUwhwARD+gZUthdslyLUuPyQytXbh/yop8dkmerxdnIJAo8Jje3Ydw3s6exsQc/tRNGgtmsIZz4luxGjj+W2hvZjU1mELLL0Z4TeMnm6nMv4DzavOnv6C4/Jryf5R/sYi0qiu827tBogY3qaKXIVphw43/2hWxniLnfru+7AsWfmUnkdN1W1Et43hH40ig29y71xblBHH79PIjxvfsekQXR5gu9Ip6tarGnOXUpxnddW6JR25+BlRJ182RyUj294IKvp6zR2j4h2LuKiKR2q+X3P8pgKf1s2oiYsFKyg6XYsBU8HaC9c5wkR2H+TlZtZIYQ62TWrFlvURbwiCKWPmzcrxz51dDIqffvwf7LF+bjywFOcJ557VYYeuLHavgVOqP1+guMNsZLUOarzkCuxWYWWkyAX9UUW6FysnSy1C+r/+fE+/vLJQYeQGjrRkezcvH0m2/kyT8llGa1THeO8kjkvr0ST14w
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
X-MS-Exchange-CrossTenant-Network-Message-Id: 806ed286-a1d4-43e1-392b-08d757438b0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 22:59:50.2565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f+ECrQwSV7kagSG0pGylO6MdkKe6ovr2YQ+mHQZhZrdEaUa0a3t1DzZ649eaX2trBl6Iqt9CaeX+7IECc2h6gnmGuUxkQnxC4lUJoUDRCzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB0938
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-22_06:2019-10-22,2019-10-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=856
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1908290000
 definitions=main-1910220198
X-Mailman-Approved-At: Mon, 28 Oct 2019 16:36:40 +1100
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

Thanks James.  Google's "site:" keyword does the job nicely.

FWIW, it would be nice if the lists.ozlabs.org site had a "search this site=
" input element on their archive page... so casual observers can readily se=
arch the archives.

Cheers,
Matt.

> -----Original Message-----
> From: James Feist <james.feist@linux.intel.com>
> Sent: Wednesday, 23 October 2019 8:33 AM
> To: Muggeridge, Matt <matt.muggeridge2@hpe.com>;
> openbmc@lists.ozlabs.org
> Subject: Re: Searching the openbmc mail archives
>=20
> On 10/21/19 8:06 PM, Muggeridge, Matt wrote:
> > Hello OpenBMC community,
> >
> > I'm a new member to the list.
> >
> > After some searching, I'm yet to discover how or if I can search the
> > openbmc mail archives
> > <INVALID URI REMOVED
> 3A__lists.ozlabs.org_pipermail_openbmc_&d=3DDwID-
> g&c=3DC5b8zRQO1miGmBeVZ2LFWg&r=3DXhm647cJDeqUETccV2yvBRCeNJXBtz6
> 14MxJzMR9PZk&m=3D2MQBMMO2tVUFcmTyrsLp5Fb-
> AXZQLR8StAjeq5oD1OM&s=3D9sS-
> _AJA9Gotu5YxLg7DoOJUDjFhXxF51HEw5bufDpU&e=3D >.=A0 Is there a way to do
> that?
>=20
> I normally just used google advanced search, something like:
>=20
> sensors site:INVALID URI REMOVED
> 3A__lists.ozlabs.org_pipermail_openbmc&d=3DDwID-
> g&c=3DC5b8zRQO1miGmBeVZ2LFWg&r=3DXhm647cJDeqUETccV2yvBRCeNJXBtz6
> 14MxJzMR9PZk&m=3D2MQBMMO2tVUFcmTyrsLp5Fb-
> AXZQLR8StAjeq5oD1OM&s=3DdG6OJknRc7cuMAeNnO1hjVGEupTGFXvmj6co6
> GiqJyI&e=3D
>=20
> INVALID URI REMOVED
> 3A__www.google.com_search-3Fas-5Fq-3Dsensors-26as-5Fepq-3D-26as-
> 5Foq-3D-26as-5Feq-3D-26as-5Fnlo-3D-26as-5Fnhi-3D-26lr-3D-26cr-3D-26as-
> 5Fqdr-3Dall-26as-5Fsitesearch-3Dhttps-253A-252F-252Flists.ozlabs.org-
> 252Fpipermail-252Fopenbmc-26as-5Focct-3Dany-26safe-3Dimages-26as-
> 5Ffiletype-3D-26as-5Frights-3D&d=3DDwID-
> g&c=3DC5b8zRQO1miGmBeVZ2LFWg&r=3DXhm647cJDeqUETccV2yvBRCeNJXBtz6
> 14MxJzMR9PZk&m=3D2MQBMMO2tVUFcmTyrsLp5Fb-
> AXZQLR8StAjeq5oD1OM&s=3Dx_wKPcIIYf62INP3YC3I5Hxlre0HYiWoZ6GZfOBes
> vA&e=3D
>=20
>=20
> >
> > Matt.
> >
