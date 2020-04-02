Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 076C319EEF8
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 02:56:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wXDX1VwhzDqQt
	for <lists+openbmc@lfdr.de>; Mon,  6 Apr 2020 10:56:44 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=0361987b65=jonathan.hilliard@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hpe.com
X-Greylist: delayed 2042 seconds by postgrey-1.36 at bilbo;
 Fri, 03 Apr 2020 03:35:01 AEDT
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tTF14HmJzDqv6
 for <openbmc@lists.ozlabs.org>; Fri,  3 Apr 2020 03:34:57 +1100 (AEDT)
Received: from pps.filterd (m0134420.ppops.net [127.0.0.1])
 by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032FxvH3012701; Thu, 2 Apr 2020 16:00:55 GMT
Received: from g4t3426.houston.hpe.com (g4t3426.houston.hpe.com
 [15.241.140.75])
 by mx0b-002e3701.pphosted.com with ESMTP id 305jh40d75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Apr 2020 16:00:54 +0000
Received: from G2W6310.americas.hpqcorp.net (g2w6310.austin.hp.com
 [16.197.64.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3426.houston.hpe.com (Postfix) with ESMTPS id D914D67;
 Thu,  2 Apr 2020 16:00:53 +0000 (UTC)
Received: from G1W8108.americas.hpqcorp.net (2002:10c1:483c::10c1:483c) by
 G2W6310.americas.hpqcorp.net (2002:10c5:4034::10c5:4034) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Thu, 2 Apr 2020 16:00:35 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (15.241.52.11) by
 G1W8108.americas.hpqcorp.net (16.193.72.60) with Microsoft SMTP
 Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 2 Apr 2020 16:00:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3N4G1oq1GNRYiAHjXKC43qda8U+mdE8PF5N9K9rzs2cGJaBEXlU2GIrlnlawsJbKcdFnwmZBwtDzWyI6Bi9bnC4XUIdVAz6LzP0Lsv2smJmbTIfs+hATO0tNT98rsMTyGE1Megq5XXLG7QsKIY9Z6skaJyTrptRXsk6zF5O72gbAesiCyym+0LhH3AQb9ce0Vp1DZjZr3X4Yrs0e5EIGLNoHPdRroWX7JtN06g8vXYiktLQs/xMsX197u36O3e05hkaUPeTFezS0fLVO8Qtqim+Q+T+dG8qZoG1HQE60EsGhxHH1VSWwbX3bhgB+zH82GDq5Nq5oU1OtRLIgzjjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b7A8+FKNWqLFWejJ3M5aD46hFsBCnatDi2COICYWVbg=;
 b=aiPs8/ayorUH3ZmK29t2RMhvK2E6Ttyr6+trH+bSiUQ1QROPK9ljNMQw1ZEZyiOI9ccI4BAjIgsFcMQPogP071l2Dq2kCHaOKA/MWU2o0l2O7EzkQD2O82q8Eeml3UKCmVhLLIQKuoaZYZ1CfkSNHCUxBZrPZgz6YqwH0jbg0EZeNQmQdOWenU5UzSsY2PQZnuUGEqt9eZUjTlbrcSnt8MIzxERtguKgNEK2KCfII2QehXbQQHoeXH5tKeda4Nj2mc1Z/CSLYqvXBpgOwvbppLXfrq3mY4nmT6jjzctF9VdkLNu/da7NgpbRW5/FuGNUPmZQNYahXn90YA1HkWH3qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DF4PR8401MB1177.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7610::17) by DF4PR8401MB1017.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:760f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16; Thu, 2 Apr
 2020 16:00:33 +0000
Received: from DF4PR8401MB1177.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::c187:2fb7:3ffb:2281]) by DF4PR8401MB1177.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::c187:2fb7:3ffb:2281%3]) with mapi id 15.20.2856.019; Thu, 2 Apr 2020
 16:00:33 +0000
From: "Hilliard, Jonathan Blake" <jonathan.hilliard@hpe.com>
To: =?iso-8859-2?Q?Adrian_Ambro=BFewicz?= <adrian.ambrozewicz@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: Redfish events?
Thread-Topic: Redfish events?
Thread-Index: AdYIWczd/g4PtFD6RCGTifuCN8tASAAZuaCAABHEgwA=
Date: Thu, 2 Apr 2020 16:00:33 +0000
Message-ID: <DF4PR8401MB1177EE5A5955E3C343757918E0C60@DF4PR8401MB1177.NAMPRD84.PROD.OUTLOOK.COM>
References: <DF4PR8401MB1177ED2C2AA795CF251570EAE0C90@DF4PR8401MB1177.NAMPRD84.PROD.OUTLOOK.COM>
 <c866c2b0-cc27-c5c3-3ff1-3d467ee5b8a0@linux.intel.com>
In-Reply-To: <c866c2b0-cc27-c5c3-3ff1-3d467ee5b8a0@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [76.186.127.143]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a515fb59-5bfe-447e-d0c4-08d7d71ef99f
x-ms-traffictypediagnostic: DF4PR8401MB1017:
x-microsoft-antispam-prvs: <DF4PR8401MB10171A479B347F712915441EE0C60@DF4PR8401MB1017.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0361212EA8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DF4PR8401MB1177.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10019020)(366004)(376002)(346002)(396003)(39860400002)(136003)(52536014)(7696005)(6506007)(966005)(5660300002)(19627235002)(8676002)(8936002)(81166006)(4744005)(86362001)(7116003)(2906002)(316002)(71200400001)(53546011)(33656002)(110136005)(66946007)(66556008)(76116006)(186003)(66446008)(64756008)(66476007)(81156014)(478600001)(55016002)(9686003)(3480700007)(26005);
 DIR:OUT; SFP:1102; 
received-spf: None (protection.outlook.com: hpe.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yl47p/k5oDce+zGyMHbO5e5H0y98RVsM/+6B2JC4VDqHzGclapIqHGgnx42Nerif8dhEFRZ9SlenVHh0QAkbkwET6FzyAlIH8YnqgLy7nRq7AIZiFjyK2rT9cuOMWVREDzV8lKC3a9AG9fDAcEUCFXLg9XkJO5q71BVoUdjbqlI0aE20eo4ZEbasEL4k8WJ7WDa2WdenKzN3/C0Yu55WrM763o3fM887vZba9cusr8Ifym6masLlWPCr9XMtsJ7ZTdbVA3Y3Fco6nc+V+JP4xiGHhcWYQvf2ZXsWqViHUCS/wylRlWs/wUYHQDW/NBLmwvGR5+phrFzwj7rMvCPkXXFPznSlJpI9vNfaru6OD0cyAaQSmqwKYBzeKx5N4bj5/H4AsTbfVayxVfKfXm9QQzeM0iHIln0++PSDkN9GaMgN5xSCZ+lq8wS5ubI4PfKDhWxcD0y2ihqRYXnNz4GjAvDeerp2+sTbUv8g1ertO3mRQZI4+wwgjUsLRl+wDyumwXMEBgsc8mmQHL5ug1edNA==
x-ms-exchange-antispam-messagedata: eJgmMgKfkEYjtA+Lb6LBhXNGwJg3Z+aG3iBybKUuVYatSsDemNR83mSl9o5XGkOzp1x5s1YtVH7mV+1QjyjuhjkU6a4oBZ7qBgP0jSAXXTPTriepsBqlZQm8WkYTMq1cOxJqvfpcuCrHXqDS3dSoZg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-2"
X-MS-Exchange-CrossTenant-Network-Message-Id: a515fb59-5bfe-447e-d0c4-08d7d71ef99f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2020 16:00:33.1896 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OQSvYFZnxOwGIHEtZOKzMeV0OrGZFts77xs2emdnyzK4E5AWbyqMRBb6MfxcbGJ2agFJT65bAWFmmaPrVlO6rNMHkspabOOU5f/dTxLC2xY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DF4PR8401MB1017
X-OriginatorOrg: hpe.com
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 1 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_06:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=689
 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004020131
X-Mailman-Approved-At: Mon, 06 Apr 2020 10:53:32 +1000
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

EventService is what I was looking for. Thanks!

-----Original Message-----
From: Adrian Ambro=BFewicz [mailto:adrian.ambrozewicz@linux.intel.com]=20
Sent: Thursday, April 2, 2020 2:31 AM
To: Hilliard, Jonathan Blake <jonathan.hilliard@hpe.com>; openbmc@lists.ozl=
abs.org
Subject: Re: Redfish events?

What exact events do you mean?

EventService is currently in the review https://gerrit.openbmc-project.xyz/=
c/openbmc/bmcweb/+/24889=20

/redfish/v1/Systems/system/LogServices/EventLog is already implemented and =
supports proper proper MessageRegistry files.=20
https://github.com/openbmc/docs/blob/master/architecture/redfish-logging-in=
-bmcweb.md

Regards,
Adrian


W dniu 4/1/2020 o=A021:16, Hilliard, Jonathan Blake pisze:
> Are there any plans to support redfish events in openbmc? And if so,=20
> is there a rough ETA?
>=20
