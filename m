Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E691FA5B1
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 03:35:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m9kR2RLyzDqjX
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 11:35:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=216.228.121.143;
 helo=hqnvemgate24.nvidia.com; envelope-from=vasantp@nvidia.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=YG9UPu79; dkim-atps=neutral
X-Greylist: delayed 304 seconds by postgrey-1.36 at bilbo;
 Tue, 16 Jun 2020 11:12:37 AEST
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m9D56PT6zDqfr
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 11:12:37 +1000 (AEST)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ee81aef0000>; Mon, 15 Jun 2020 18:05:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 15 Jun 2020 18:07:28 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 15 Jun 2020 18:07:28 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Jun
 2020 01:07:28 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 16 Jun 2020 01:07:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LaP/U1z/tyrABoHiHNFJihw4gacOhanweJmi0VjllZlk4lo3BAsS1qtP2rF2SaCj94MOIMAHOSfUdDahSLCQCELVEbA1MeH3RpySIqoM3bkc5gcWIRnCGbH+lFGgvTO7BbppkRvBuBaY/8adx7WauZgnm2kSOgfZINTf6+uwo+qrTEmXntq8PZ1+EddwoXg5a41rwh4IATJr9/hIU6t8OUOqeIhvs+wtHAnPlwgRMtscmvIuIOQPg3RNPh1rTXY8rKIJFSH5yVNQUdXk2Yuus6P/FQkovbZzq9Lf1rrU0TAFAeu69jm6VqjLcZji8bYV95sZE/8J0JZjmcXeD4uGUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mfG2RetIr7I6jtyAG+aJVjfkXG7RlWc4OPuXOeCXPc=;
 b=JBefCmpoQZNaIRCncD3x8rfPBvnxNKmxi2t6Q5269MWbQRz50d9gfUkKiQ+g6lxcKYrSvv7pLXnejpbP2YcfXyPTJLH1EDBpDJtOWU/J8Kvg3TCErwGJ/i9tQBZGMU8uqXdOayaCaXjxe8CmcwRYadj1D/5E+SaUHmB/r0u2cHINRDsELjIy0sDaodXXspRRnIIjlJar0EPH7x9eRIhuYXQdLgpybtOizisKWFvkxhl86uA47vWkMLbQZoiv31Dg9aecOEAqk8H36jXgLnf5IeUyXoWIFlTPg+mVV9YsaPHW8gnCGDmUGPb8IsVFf60cA1PV2mZarBSvmGADcyqgcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BN8PR12MB3282.namprd12.prod.outlook.com (2603:10b6:408:9e::27)
 by BN8PR12MB2881.namprd12.prod.outlook.com (2603:10b6:408:9d::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.24; Tue, 16 Jun
 2020 01:07:25 +0000
Received: from BN8PR12MB3282.namprd12.prod.outlook.com
 ([fe80::7892:2d85:21b0:770a]) by BN8PR12MB3282.namprd12.prod.outlook.com
 ([fe80::7892:2d85:21b0:770a%3]) with mapi id 15.20.3088.028; Tue, 16 Jun 2020
 01:07:25 +0000
From: Vasant Patil <vasantp@nvidia.com>
To: Andrew Jeffery <andrew@aj.id.au>, vasant patil <vasantpatil2@gmail.com>
Subject: RE: OpenBMC Redfish support and Working Group meeting
Thread-Topic: OpenBMC Redfish support and Working Group meeting
Thread-Index: AdZDeaRx4VoNs3uVQZq6aqNycz3LsA==
Date: Tue, 16 Jun 2020 01:07:25 +0000
Message-ID: <BN8PR12MB3282EEFCF8E67777F93E2295C79D0@BN8PR12MB3282.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: aj.id.au; dkim=none (message not signed)
 header.d=none;aj.id.au; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [12.22.141.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6a75d0a8-1570-403b-dceb-08d81191a209
x-ms-traffictypediagnostic: BN8PR12MB2881:
x-microsoft-antispam-prvs: <BN8PR12MB28814B06DBE9964BEBBE632BC79D0@BN8PR12MB2881.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 04362AC73B
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: imTkMmfySuAE/OZPTgC9ox1uvSmoGN/G5iTjFgjzUGa5nYd9iYsS0WTyWWbKxViKnynSCTqgHrbrHsRuDBLww8X9gfDK+qhoZdcmjalxcAUMPlyk/O5fqJe7091D4C8tf6l4rPZ9+mgLqesXhbOrbCuIowhblA7FeztQs+xkVkMvKwOgJhcPMz9hulCFG6PoTB2WVVpOhN3dbg67aWU3C5ubW/E/J67HF8jhoC78+O4PnmOJDTwSzkjP7U5YnziJL7LPBlYRDcWoKsUmqbQMj9GPvOR4h3gHWMouzmzLusOqM+Mllg8Zdnhfh7NWhgmzej3QFdftL4kV1wg/2YRR8A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3282.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(136003)(39860400002)(376002)(346002)(396003)(366004)(55016002)(9686003)(4326008)(66556008)(478600001)(66946007)(66476007)(64756008)(5660300002)(66446008)(71200400001)(76116006)(86362001)(33656002)(110136005)(26005)(186003)(316002)(6506007)(52536014)(7696005)(8676002)(83380400001)(8936002)(2906002)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: GWeY7yxDcRY4OEXp905no1i1+H1TuU9fzzm8E/ooTVPjbdVjk6Oe4bNOM0DjYfrV3BlcImKGOvg5CC3e0M+A4aG+UTpIl1An6vt6No3ZYlyHFBfqURbBjXG9urMjQ+A0mSTy0/gHnlUD+lwsDvNSfw9KYRJhgG88mUcfd8OV/8/MPqv5NLuoCxjjbW4ri1gYvJrVOXf39d2Axk4cjpvQwqsjgsJGlhUNO3A6kOo5p3yfaSOs1da65LSZBQUz4Me83HvqrQi6Tjh1lEmSZp7M1MPh1td/xnfWIaCVeBLbUS0kmWRCvHaCEbcQD/nkSICgf1e7dqSGtOQr9A7otgjfE11ngoWMk18DoafNn9eqR6agEaGZ854YmHLoaXrpESKigE0dwAfKCcUu2t/9hRFga1P8T1RnF3cLHw+CIyMWcD484sTGFLj/c0alyluWLgNz8HCjEsnOn21qvyzFZXmnHBmL5Y0ShcVBIA7ZgvDfiooPkPwNuIm9vLVYQMNoYwU7
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a75d0a8-1570-403b-dceb-08d81191a209
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2020 01:07:25.8401 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XsyfqDXNc7vbvn30Y7D7WesAqIItUNm6k3oQDmunvzriRsbRGLBOfy3BududDLXb2FBU3git+BPOAA2gDMgLyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2881
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592269551; bh=2mfG2RetIr7I6jtyAG+aJVjfkXG7RlWc4OPuXOeCXPc=;
 h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
 ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
 Thread-Index:Date:Message-ID:Accept-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
 x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
 x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
 x-ms-oob-tlc-oobclassifiers:x-forefront-prvs:
 x-ms-exchange-senderadcheck:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
 MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
 Content-Language:Content-Type:Content-Transfer-Encoding;
 b=YG9UPu79dF6ecQJXzvuP/v7ARIhbK8rWTZxgQ1ioQP+H6ZdA506nEy3j5T1Pq3rfA
 0/3UL9EjXYiL20MHgtSMI+qWhLg8CC1L9t16KfkikLBIv674zn8+0qKBzNmCl+xskV
 d91wfpa/9EHY/bgKy0hvHyhuFdSdKITr8akbe5JFrPpSSrJIXSO+Nsn4oGsmtaMUJX
 z8nsHqs9OYSrOphD3liAhoJaa1f0kdQoPZiDwQHAPPBxNEoKZ3lvSWp/lYqUSq8beP
 Rw2cndmy9icFfWKxIJideoVU0JK1iYOUUGW95PmRmHumjoPW1DWL4nD9nr1NTDo7BE
 iOf4ME1gAT4ZA==
X-Mailman-Approved-At: Tue, 16 Jun 2020 11:34:46 +1000
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

Thanks Andrew.=20
Yes,  I do expect  to have CCLA in near future.=20

Regards,
Vasant =20

-----Original Message-----
From: Andrew Jeffery <andrew@aj.id.au>=20
Sent: Monday, June 15, 2020 8:59 PM
To: vasant patil <vasantpatil2@gmail.com>; Vasant Patil <vasantp@nvidia.com=
>
Cc: openbmc@lists.ozlabs.org
Subject: Re: OpenBMC Redish support and Working Group meeting

External email: Use caution opening links or attachments


Hi Vasant, welcome to the list.

On Tue, 16 Jun 2020, at 09:28, vasant patil wrote:
> On Mon, Jun 15, 2020, 6:50 PM Vasant Patil <vasantp@nvidia.com> wrote:
>
> > _General Question: _____
>
> >  * Are users allowed to attend the working group (like PMCI) meeting wh=
o have not yet signed the CCLA?____

IANAL, but I see participation in working groups as the same as participati=
on in mailing list and IRC discussions: Without the [IC]CLA you can't submi=
t changes and so can't expect to have a large influence, but nothing is pre=
venting you from engaging both to help grow your understanding of the proje=
ct and the project's understanding of your problem space.

I hope we see a CCLA in the future though!

Cheers,

Andrew
