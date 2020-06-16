Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F4F1FC048
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 22:55:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mgSh0xHlzDqwm
	for <lists+openbmc@lfdr.de>; Wed, 17 Jun 2020 06:55:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=203.18.50.4; helo=nat-hk.nvidia.com;
 envelope-from=vasantp@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=cadZcPlm; dkim-atps=neutral
X-Greylist: delayed 304 seconds by postgrey-1.36 at bilbo;
 Wed, 17 Jun 2020 06:54:22 AEST
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mgRf57f1zDqvK
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jun 2020 06:54:22 +1000 (AEST)
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ee930460000>; Wed, 17 Jun 2020 04:49:10 +0800
Received: from HKMAIL102.nvidia.com ([10.18.16.11])
 by hkpgpgate102.nvidia.com (PGP Universal service);
 Tue, 16 Jun 2020 13:49:10 -0700
X-PGP-Universal: processed;
 by hkpgpgate102.nvidia.com on Tue, 16 Jun 2020 13:49:10 -0700
Received: from HKMAIL101.nvidia.com (10.18.16.10) by HKMAIL102.nvidia.com
 (10.18.16.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Jun
 2020 20:49:10 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by HKMAIL101.nvidia.com (10.18.16.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 16 Jun 2020 20:49:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GamI1dce3zwd+kJAobWefj8pugPrJDkcKNv3I1rK7EFL2U2GaM1MwP4FyVV4zmRfmyfeOSgeiaHOqqgVVawqzz796ONrOVcQmKJrckiH3EH6qzsJvoqGR2YhxL0y9JJg0WSMiyzJe2nq09UnWF+sYMocsMeA5v9RbbHK8zx/xRKsL7rQ9rpgj96ymdoxXerXJK8neoHGMbevAH779SCNZTN2ESUH3vqAZhvOQNaf9zixoSlx5YQ0lx5s9lb5bCmRlg9xFy4tY/4BuBb5vTPfH18XJyfr8u7PiIq2j1a74MzGF9y/nm/QK+s5kFWEZOrqTUaR3kWnkYaOvTEjCq2LNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TeF79am52KH9Vt4F9SPqM+SzRTcodpbScf8pjeqYk4=;
 b=MKqaMgTpEO/olDTIU9VwENd6+5Fz5jq9AEqdHtrDMOsAgMIVaqZCyH13Lcsl9oq3UP8FAIcDVV13a427iyhMa0as2B7yb+2W1lkrU4bs3A+reBiBAP+3NP+dUaMeT5W9eqfYW3fZ6u0TmEwDIJJg3b+RrODkHbA5Z2MZUCRPiVVTMP1VbuXC4lnJ/IELKCobM4ZV8Y+ZM8lMtE6c+LSFB5ak35j3nVWiBFEeknxQV0klPlPLENk2mrTX7LLHRaj5mMV3KOzN8twdiQ4EUI5gGL3t/4t/vXslalLjPbr0Kzh/pPcbv58XJXHDapWzDMlCJR/N1cmH4mQQ90g/+02kug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BN8PR12MB3282.namprd12.prod.outlook.com (2603:10b6:408:9e::27)
 by BN8PR12MB3604.namprd12.prod.outlook.com (2603:10b6:408:45::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Tue, 16 Jun
 2020 20:49:06 +0000
Received: from BN8PR12MB3282.namprd12.prod.outlook.com
 ([fe80::7892:2d85:21b0:770a]) by BN8PR12MB3282.namprd12.prod.outlook.com
 ([fe80::7892:2d85:21b0:770a%3]) with mapi id 15.20.3088.028; Tue, 16 Jun 2020
 20:49:05 +0000
From: Vasant Patil <vasantp@nvidia.com>
To: Patrick Williams <patrick@stwcx.xyz>, vasant patil <vasantpatil2@gmail.com>
Subject: RE: Redfish Support
Thread-Topic: Redfish Support
Thread-Index: AQHWQ/NHeqMlay8pnU+ocy8mNH7E7Kjbtz0w
Date: Tue, 16 Jun 2020 20:49:05 +0000
Message-ID: <BN8PR12MB32825446B51E1A606C243744C79D0@BN8PR12MB3282.namprd12.prod.outlook.com>
References: <CAERBOQ+x3aUmFu+pZUPjn4DOJ_iXKWpgG1Cq-Mza7F5hCS47mw@mail.gmail.com>
 <20200616153201.GB4618@heinlein>
In-Reply-To: <20200616153201.GB4618@heinlein>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: stwcx.xyz; dkim=none (message not signed)
 header.d=none;stwcx.xyz; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [12.22.141.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d76f7d77-2d5b-40b5-350d-08d81236b5c7
x-ms-traffictypediagnostic: BN8PR12MB3604:
x-microsoft-antispam-prvs: <BN8PR12MB36047A1CA979A66F3EEEB3F4C79D0@BN8PR12MB3604.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 04362AC73B
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /5Pvqc4LiuiYy9ZAS3qjhfhZElEdDMbkZSHfMZXMqKO1dd20PEqtZdhKSgIA+skwcCQh9ZItmNx3VDR6wkWlab82k1+VPlK4S/r6hO6U4ZfBOVxznQqb96ZmZQxXGtKT0tX5vurLvzmuVbArHCQTA498Y7gWWtp3kf+OCOfqlP6B1PEnZnNZeMJhmKWVe4tULoFBPC55XYchQq+m3vciVsvWflU0cumSQV+i5KJFGo/SuiNiPdQUKxijoQVp2OZn6Q6qxOBgeL3DgXnnsnWpyRGoiHTnu5LXxB+mTszB17x6Q2yysz1lURqaxgHofFWO6w3+rRz4qD/M9KbF8l+Nhj6rSWbtF7523qbRPYGhKvVGuTnjphz35+7VDSIAAMxdPlDl2N0a0xxWUitMQxwa7w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3282.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(366004)(39860400002)(136003)(376002)(346002)(396003)(83380400001)(186003)(7696005)(53546011)(6506007)(55016002)(478600001)(26005)(86362001)(9686003)(76116006)(33656002)(66946007)(66476007)(66556008)(66446008)(64756008)(3480700007)(2906002)(71200400001)(4326008)(4744005)(8936002)(316002)(7116003)(8676002)(966005)(110136005)(52536014)(54906003)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: NNYmwtsmtP4czScUW2W5NpRWb8RTT5H/Qoovqn41iV5h6mwvkGBxEHQIM1QYnMOCfT65idDCAxCCi1UyCqFbdtWtOe35L5KF2M85w1jEbKSNobK1ujarBxPYDyvrJFTt7S9bEJDXxrqs5y14FI/e197nOSUH11UdxExN95OKP3/a0Cz6NH0b++zjU2e9CYLuUnleMg+u6PCRWxJ7PDrDKgWDbPQ70TFmkrfsnIpzxWH5mJ/DsGtsubLa+x9qwXHVXemOnAgyPel26JMyjQIKrbISK63Z53mAHDRrbJuI9sIRx/xD7ipbwwB+4KFuwP1NryAjSMBSU2sgsSMFIXvPVxoiJUpf8+vJIIwDBx0KrllPj7uTeUAcoEUf1eSucDamiNmWbjaz0UIhVXsIS0eCkvpSUgvSHrpFqnWrF2j++G3abGrCPrbci9oliApE+5e0BPMxrhqO4M1XcXchM6lEW2OeiVJDIWHyl+kd77PcvqTmw9zzUdtFeD/SQ4kx3ATH
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d76f7d77-2d5b-40b5-350d-08d81236b5c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2020 20:49:05.7242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I+/a4jXOtB3V64knvHEC05qt1/bkbYNjqEHju04XPeWfC64fCdDaPBvPQMXSZ6HokouD/GUCEdPKXlrTtvLCGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3604
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592340550; bh=6TeF79am52KH9Vt4F9SPqM+SzRTcodpbScf8pjeqYk4=;
 h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
 ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
 Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 authentication-results:x-originating-ip:x-ms-publictraffictype:
 x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
 x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
 x-forefront-prvs:x-ms-exchange-senderadcheck:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
 MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
 Content-Language:Content-Type:Content-Transfer-Encoding;
 b=cadZcPlmy4pxgaNrPnXN/xbf6zJHcFumdutylJCuL4amqbZ+u8KpneCaZNfG7qOpn
 q+T2XbThotJubEDfGjNPYW9iD3jZRcsKwsp0aremwarqRrSlHsJQoLhaUlydOExqjV
 sgWmZJlBn4Rz6NiKm7QRNHxrRKLz/y7Y8ysnXWotv2RoM4DdyIctwngqQnO1O/pCwM
 s1Hn1bfruiuNdkNq7sgo3g2d+4p2It2WvuITI4L3Ea18MaWPvV1kgBVHcPJKZghnob
 TEVtZj9wdQhiKA/KDjYIF/dkKCQc+pW0QEMJ2HvDl4pdlJsGHvsv3blAIoQWg+7zU/
 PCLx+Mexpw7Tg==
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
 "suryakanth.sekar@linux.intel.com" <suryakanth.sekar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Thanks Patrick.=20
This helps.=20

Regards,
Vasant=20

-----Original Message-----
From: openbmc <openbmc-bounces+vasantp=3Dnvidia.com@lists.ozlabs.org> On Be=
half Of Patrick Williams
Sent: Tuesday, June 16, 2020 11:32 AM
To: vasant patil <vasantpatil2@gmail.com>
Cc: openbmc@lists.ozlabs.org; suryakanth.sekar@linux.intel.com
Subject: Re: Redfish Support

On Mon, Jun 15, 2020 at 04:25:23PM -0400, vasant patil wrote:

Hello Vasant,

> Is below two functions supported via redfish
>=20
>    1. System Boot order change
>    2. Changing SBIOS(UEFI) control & configuration parameters .

I just merged this design document from Suryakanth, which seems related to =
this question.

https://github.com/openbmc/docs/blob/master/designs/remoteBIOSConfiguration=
.md

I believe the implemention on BMCWeb is already in progress.

--
Patrick Williams
