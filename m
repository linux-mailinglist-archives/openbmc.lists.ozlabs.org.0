Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 945A02EB6E1
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 01:29:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9Vbk6JbnzDqW5
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 11:29:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.161.93;
 helo=mx0a-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=keysight.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=R9yJRQL6; 
 dkim-atps=neutral
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com
 [205.220.161.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9VZk0XnSzDqNK
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 11:28:12 +1100 (AEDT)
Received: from pps.filterd (m0187211.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1060S98E009984; Tue, 5 Jan 2021 16:28:09 -0800
Authentication-Results: ppops.net;
 dkim=pass header.d=keysight.com header.s=selector1
Received: from nam04-bn3-obe.outbound.protection.outlook.com
 (mail-bn3nam04lp2056.outbound.protection.outlook.com [104.47.46.56])
 by mx0b-003cac01.pphosted.com with ESMTP id 35tq77bwb3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Jan 2021 16:28:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBG5beN45ht3XfB7moPhVW/AZuhsiWhMgJWGIj3bVQcP4T18ReyTAyZ+5vkwq0Y0MEE3tZSWnmPnO85tsLgDv0hKYP0ckRuT5CIo2dXWA0H9oLDLvWF4eEWgTG0R3mobGPtSax0CaDBKGoMy7NJM9pygmUIqW22Y6y1GpkzScKtEQ/YlTBuqg4JfPWv+ugdp0RgoMghFloHbeu0AA1IaWmsImmcAfpfrgFdgeCJfeW/r0TZ+08yI/0PyJeyR7wgvmZ+zJ29AglYlBz8/v7f2HzIb9vjx5SPl3jMEq81v3GMcmXxyyo6pm5XGKdsGXEliZYbe3VtoDpJ1AtvZsBBlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7YLA7huigsgKSnUDHBZBY76h8bIQGemCOnBdLaBjsA=;
 b=VTHMsI1DKf9ZkXdS46Zjd/uqAtvOfV6VItn+HvkZi1mR5iMvKJ0iCzEQ0Tya6i/hpu9n+iIuUGL2tkuvd8sRS0ma6A6m0pfT76dJ+BRQOwu/IROlM9EcSmOYis7RwKJQ6WETcdN0oRCq3F4hT5Y8Q8J0f9hmFgur59XUCK+Cs43suUe85HwNO4reX/POGW7rY4O3Ib6SqFpl2943lZuZ+LNc49F7UgItiNWZr7G5YTfypLroVbfFL06zeA3IR4oe96YOY5ny2TUKgFTbvhPWjVqhQMQ1EqgZ7t7/JHLDJVHF6IhKdfhi930zZqbgTkDIC2sCHU9vEF89R/KJTpajHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7YLA7huigsgKSnUDHBZBY76h8bIQGemCOnBdLaBjsA=;
 b=R9yJRQL6pfAr8rSMaq7e8uBEHLGD5dUicT3SyO6e6Vea5KOegi50MSeWgjjR8QUdnXkZOreK0B9fnu8VwzoBPzo1SU2mdGl4YhLKEygHx/wLbu4vVqILFfRs91Lgxju0Hn+KAxfHWyWvxWJ53Dpqw1Huvh/9R8qnVjCSMqz++Hk=
Received: from SN6PR17MB2558.namprd17.prod.outlook.com (2603:10b6:805:db::20)
 by SN6PR17MB2271.namprd17.prod.outlook.com (2603:10b6:805:41::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Wed, 6 Jan
 2021 00:28:01 +0000
Received: from SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::70d0:d9b3:e746:ab13]) by SN6PR17MB2558.namprd17.prod.outlook.com
 ([fe80::70d0:d9b3:e746:ab13%6]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 00:28:01 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: add a new yaml interface definition
Thread-Topic: add a new yaml interface definition
Thread-Index: Adbi09Kn+0NMxZAyTvq9aP/32+RboQAFDtmAAAFspyAAAGwDgAACo0XgAByjuYAAFWL58A==
Date: Wed, 6 Jan 2021 00:28:01 +0000
Message-ID: <SN6PR17MB2558D355A43905F91659B98896D00@SN6PR17MB2558.namprd17.prod.outlook.com>
References: <SN6PR17MB255899EA5DB3A379ABEA68E996D20@SN6PR17MB2558.namprd17.prod.outlook.com>
 <X/OVFwJ9589BhkXb@heinlein>
 <SN6PR17MB2558F662101C2B4AE4A09F5096D20@SN6PR17MB2558.namprd17.prod.outlook.com>
 <X/OhexuWrZFhy+v6@heinlein>
 <SN6PR17MB255875944AB6F6884DE94FA296D10@SN6PR17MB2558.namprd17.prod.outlook.com>
 <X/RzYa7/QqlVUIMT@heinlein>
In-Reply-To: <X/RzYa7/QqlVUIMT@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=keysight.com;
x-originating-ip: [23.114.58.132]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ab63d49-2e11-430e-0415-08d8b1d9ed35
x-ms-traffictypediagnostic: SN6PR17MB2271:
x-microsoft-antispam-prvs: <SN6PR17MB2271CC57324A80D0AD0B67B696D00@SN6PR17MB2271.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mJyVkv2xvGktWv9aZIriNTp6SLmA4AXfpvO8PqP2/ExwKyDO7/qCompzVyzJdwy1XpFobiYVX7s1z3vzUJvwTuynFHeD0S2WZzE3oDVu9F5xAtUbHfLu+WmWd68/yeTuy1iWAFcRiNrDIbT8T4yLBY9oI10NcIVqEj60HkpDlqb9u/kTnCACMgXxmlQ4z9qbQau6mq4XExA7JhGTnJf6sPVHMcnXzeRaL3kYvhN/PrT8EZMJ++jSFCTWoB9ilZ9ATqjbqo+jKLClYSEuQGxNA2CY/BR5B+bkw6pn5CmUbSgT4l3MXiP31oStwoFhePOho4J4/cXAPESORYt0wwpIl40CV+SzdyZqQu4XBNTqrjDNQtm2CGciMB8eZugyrfYns3klQDVWIIgaxUfmZgyAtQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR17MB2558.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(55016002)(33656002)(76116006)(7696005)(44832011)(6916009)(64756008)(66946007)(52536014)(4326008)(9686003)(478600001)(86362001)(186003)(8936002)(26005)(83380400001)(66476007)(5660300002)(2906002)(53546011)(6506007)(71200400001)(66446008)(8676002)(66556008)(4744005)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?3gWJyxVd8kMzNZ+K0/Qbp4TfhDwLXrNNgJu+k1di95/4WTsKIWJj3IjkaJ+Z?=
 =?us-ascii?Q?3zk2mzZKyCLDfs97lU2aXj4HZqzvkpSbAytxiZoFE5rcgEvqIAHle1uiLrNT?=
 =?us-ascii?Q?002KCZFcToU5ramehLs+og4FwNHirQI7Tntl8facy3EMYLUFUBZOa3/96LZf?=
 =?us-ascii?Q?rCa5uQ7/jVrj+KfYBkF1wWoi0SStCe1AAhloKlW8LoE6LN8C1Wxg3GfLLOIx?=
 =?us-ascii?Q?FitVn8Pc/PqAmgICw3/uGueyyprdHyee/u4rBB9LUXdQFy/1Hq6+ROzV4rLH?=
 =?us-ascii?Q?wtzJFsJKS3UbInxIphBVNaCW9/GRb9shkH+sh+v7dZHlS1GvYBwBsOlE7FfU?=
 =?us-ascii?Q?20TAK0Vx9ec4+lRZ5Fxx0zCGK1B0f1Kqv03nV3XNpxXvbJvBr+LeQ3MLJbHT?=
 =?us-ascii?Q?7URIXgvjmDKu43hs4GCiHcSoCqE1hjwKMb4z1RacVR2ddBaWMIAjSeKBt40r?=
 =?us-ascii?Q?3LbzWXVx+vuJ0otTzZZN4URtRS1rihL+bwYhbcFEX2t+pEUGZ03QMNceQVv0?=
 =?us-ascii?Q?QhKhNuF01C2VTckChQAS7OxJV0IsgPhHcZdkZRMH0NTJ7o5EL4C3Q2jUtPnm?=
 =?us-ascii?Q?8/RgmQBhV6nmf8a6dTSooyxDhoZtejWu8E7pYev4poJ8b3lXOOrUyY2pCNux?=
 =?us-ascii?Q?ln8Zi/deMVQGc5GejDb9zw8vytB77M9aj1jRmbfPWBC6K++imLNMk+7S6uzY?=
 =?us-ascii?Q?9Nvva+dNNcjeVyKcx41AJ05J64Nywd3Oztc+eBE48Cn710z/fEWjW3Z6IrIx?=
 =?us-ascii?Q?NGe1qZ2RfF8WwG/z13jOPoDgX66NuH+pcxNfZlBD3rdR7101cvdUmbqL5uKb?=
 =?us-ascii?Q?NDNey/dsUR2X533JQGqk24INQI/aMguiepsJxThGIHJMfpjsNZEtBpGdm6BX?=
 =?us-ascii?Q?Ki6TYDwf9KL40n136+HIBAvJu2SnhZ8AtYTSpwsUDUUBgHkMu8JFdfHGhx5/?=
 =?us-ascii?Q?Bh7Aeja5H7dCSNM2vxDURcBdPv9fwqVcmo4JNOxqOGc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR17MB2558.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab63d49-2e11-430e-0415-08d8b1d9ed35
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2021 00:28:01.6920 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9VuPcKkHw17zpf8H6RYN8Vp6j1VdRy88FzLNgszRJ58YWaEIVJ9EAqhm8XM987bmK9kIzVkmWFStDM/2k43OLXMEAXiFQVeX4l4weOecsNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR17MB2271
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-05_09:2021-01-05,
 2021-01-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 adultscore=0 mlxlogscore=950 malwarescore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101060000
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

Thank you.  I could implement the methods, and could test them with dbusctl=
, and also over http/REST/POST.=20

Thank you for your timely response.  It made so much of difference in movin=
g forward. Only one thing I need to figure out is how to automate all of th=
is as part of my complete yocto build, so that it is taken care of in every=
 build.=20

Thank you,=20
Mahesh

-----Original Message-----
From: Patrick Williams <patrick@stwcx.xyz>=20
Sent: Tuesday, January 5, 2021 8:11 AM
To: Mahesh Kurapati <mahesh.kurapati@keysight.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: add a new yaml interface definition

[EXTERNAL]
