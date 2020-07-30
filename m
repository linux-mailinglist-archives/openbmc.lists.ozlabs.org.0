Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 470CD2333B6
	for <lists+openbmc@lfdr.de>; Thu, 30 Jul 2020 16:02:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHXCj4ht9zDqxL
	for <lists+openbmc@lfdr.de>; Fri, 31 Jul 2020 00:02:09 +1000 (AEST)
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
 header.s=n1 header.b=B3iEhLii; dkim-atps=neutral
X-Greylist: delayed 303 seconds by postgrey-1.36 at bilbo;
 Fri, 31 Jul 2020 00:00:31 AEST
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHX9r0138zDqtK
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jul 2020 00:00:31 +1000 (AEST)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f22d0ec0000>; Thu, 30 Jul 2020 06:53:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 30 Jul 2020 06:55:21 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 30 Jul 2020 06:55:21 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 30 Jul
 2020 13:55:21 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by HQMAIL101.nvidia.com (172.20.187.10) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 30 Jul 2020 13:55:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6Q4BRP8NDDv94E/x5TGs6O63mdo7mhOt9+ZkJBFgweY0dBp4FJc8IwlfhFsxrWS6c3gdULpJdecp+N0TQ52qOTLRW3obDTbY++fdaBH+WBCTGNwN96IXGVrLD9OnMLl3yX26bBi+RqxO4g7UZYFHfWXtV0H2kV3BmewjQZi6N3FxsO02fYny1AAdbdT9hMYJSLD1x5oxFfAbT+4snl7HxZCCwtjQ71qbvX4nzhISqGcwWe4iiS6nmecv6xNhkZancZM4CZe83nmP0Mxv8ymJCGCnwMVeFhm66OWuXfNsQbDkFno3bKbTgocK8Gj1zewgilzLW8Fen6U+Y66HRGROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5+YP2wt0XTC6dDuCgiVUtyDmm/PkSFt06HNUK9PuNs=;
 b=O2OLkvYnH1QDU+hdnII+iKjRJzaHooSFfx7L5DkDvTvAPj8MIyYsTSjltHNCtGJ4CmB4/8ZKDMnQC27x12AM9wbZJrKFF+rL5sow9cBfURZtwiNEbzvwI2V+s6CEDevRU3fdX1xyNCYqdv9pz0X6BnBtjBJZnEJtM/AxgHO+ULo/kuBku6uJWbtFJmImPASavB/8UtHwWvh0CqsfulZasudBbz2J1nOPFBGhcizBoYTuPnemo8nANBK43K9cXCix3QTKK5gwR4+Gs9eCsw6W7X8oa4ROVrZaEWTTtmZHRt0HuPHHCm8Kr24P8siS6OWRupCsadYynpv/VK9fCJkP+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from BN8PR12MB3282.namprd12.prod.outlook.com (2603:10b6:408:9e::27)
 by BN8PR12MB3473.namprd12.prod.outlook.com (2603:10b6:408:65::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.25; Thu, 30 Jul
 2020 13:55:20 +0000
Received: from BN8PR12MB3282.namprd12.prod.outlook.com
 ([fe80::84fe:6445:1fd5:c099]) by BN8PR12MB3282.namprd12.prod.outlook.com
 ([fe80::84fe:6445:1fd5:c099%5]) with mapi id 15.20.3239.018; Thu, 30 Jul 2020
 13:55:19 +0000
From: Vasant Patil <vasantp@nvidia.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
Subject: RE: OpenBMC : FRU Inventory management
Thread-Topic: OpenBMC : FRU Inventory management
Thread-Index: AQHWZikWohxE++CpLkmJQpnCVvW7hakgJVwA
Date: Thu, 30 Jul 2020 13:55:19 +0000
Message-ID: <BN8PR12MB32820389DABEE2E32ED84E57C7710@BN8PR12MB3282.namprd12.prod.outlook.com>
References: <BN8PR12MB32822ADFBBC19F6B2FB08F52C7710@BN8PR12MB3282.namprd12.prod.outlook.com>
 <e00d409b-a845-85ee-16d7-0bb53f1e013e@linux.vnet.ibm.com>
In-Reply-To: <e00d409b-a845-85ee-16d7-0bb53f1e013e@linux.vnet.ibm.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.vnet.ibm.com; dkim=none (message not signed)
 header.d=none;linux.vnet.ibm.com; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [24.112.224.16]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0771db54-56b8-4a73-9d99-08d834903263
x-ms-traffictypediagnostic: BN8PR12MB3473:
x-microsoft-antispam-prvs: <BN8PR12MB34730ACAC278DCA9720E4112C7710@BN8PR12MB3473.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OAzHx4/fx5OK9xE0j6mQQyhHO3bMZbJRMpNo7q0sWhob6z9rbTdqBLp6EJ1P61yHCgnCFC41mUnOm8j7QuujA1pwDIrRpGvzKCETbHiJwp6hD7Xn7zK/ky/iwn2NrGItygIYRzjtN6/OWs9AkwiP/dSpaFErJktJPoPOSV3jW3q7bzgjZN7RL1mmPjJ0wMdgc4nzGlFZY8CP4EeFLqoOzg3PwI4wPLAwJdkRPxB9pnSdl+fFtqcnjxTrB0PsgZBLmtVOwjb+yuCDGgtF7JnH39jVUP3c+2cN1Eclkdvn4boBlNix9sRNmb1ghunxOmF++yPRREFvK0iykfXYynHCfJd8VeS6LvwvZE3QHi69OOuZPgMmDaqQPvnzL0HEUbBSKU7IGN/4ingAhFevJwbPTg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3282.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(9686003)(52536014)(55016002)(316002)(5660300002)(2906002)(66446008)(64756008)(66556008)(71200400001)(7696005)(966005)(478600001)(33656002)(6506007)(53546011)(83380400001)(6916009)(26005)(66476007)(4326008)(86362001)(8936002)(8676002)(76116006)(186003)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: LEddTl70+LOqeSG9mIpmLQuSwaojSGyr/aMQr2Yk4R7kglZiQxZDL1pNiN66eKhznBuwMy2kPJsducGYbL0xRgBm1/u733KntTVlgwvhdPwrJIeF0Hg5MIP3GZartuO8GTGWmB6fOQDxY76fiSEo3HgvAiAdD7x/fn4oWjVJZt8Ez4+oFSW3dOm2Xwa5s09T0jSa9Lhsc4h49FDw2IG44ai7xFn1PcKkE4JwrZydZqYA+vAtAuXTLJ3Avaljjf8BSkjKR2VJL78gBrbqaSuQr1TfDCQzUvzWJrPl7GjRauVGnGQyvNFpIYEt8f/nZx6zKtjRvFF13uAkoRRX2JQiCyWiuOzmBC6r86mUSV2tgblaZ+oaBlNYyhUB4V6jUjtoo1Xt9GduDaJbSzwlpe/gIhlmszVMr8KHCtf1my0OmaD3VBL1O9Hmn1Bcnu2dzUH6MPKZQKvpWAmA/Oo7BNloybsYlCcU1YWQsFrAzb/fEPM=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3282.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0771db54-56b8-4a73-9d99-08d834903263
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2020 13:55:19.5390 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ukKIFpizPQPWGeDeXG1n+I7a38m7jkvSINO8u1KzLgNROQiEcihPE5YjXVw0fB+IXHqIlH8NpiG3HIVcw72XkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3473
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1596117228; bh=b5+YP2wt0XTC6dDuCgiVUtyDmm/PkSFt06HNUK9PuNs=;
 h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
 ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
 Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 authentication-results:x-originating-ip:x-ms-publictraffictype:
 x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
 x-microsoft-antispam-prvs:x-ms-oob-tlc-oobclassifiers:
 x-ms-exchange-senderadcheck:x-microsoft-antispam:
 x-microsoft-antispam-message-info:x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata:x-ms-exchange-transport-forked:
 MIME-Version:X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
 X-MS-Exchange-CrossTenant-userprincipalname:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
 Content-Language:Content-Type:Content-Transfer-Encoding;
 b=B3iEhLiis8ez50LUA3RA2xkmO1pdVUQEetYJdLDLLSPZo1Jdg95LchGeV6yP2zwOO
 K3ouxR5vPpXBz4HWag5AULnqqHFyzRPXw2p85bLh9eEKHSHPL4jAtkVU20KSsC30GQ
 MKrRMVP3H06slBbP5uxXmrgK/To9Hx2EhpZR+pgyPGmVAn3rJLlSiL8iVroaH4xrIH
 adrGLeY4Py52o3g9IWPZU3pCTRLyVrvQsBlamnLAec/LYIQXC5C8FaPa7s3OyQwEWF
 it5lKLbNX/cJg+2Q1Ti2m8YnkC4gDI2UsU/CpsyO0nBiSJyUfO3gUFxyZyyd5rASiR
 Prkbe2zW1unEA==
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

Thanks Deepak.
Yes, This help. We will go with entity-manager option.=20

Regards,
Vasant=20

-----Original Message-----
From: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>=20
Sent: Thursday, July 30, 2020 12:22 AM
To: Vasant Patil <vasantp@nvidia.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: OpenBMC : FRU Inventory management

External email: Use caution opening links or attachments


On 30/07/20 8:37 am, Vasant Patil wrote:
> Hi Team,
>
> We are enabling OpenBMC on x86 system. We would like to know the=20
> recommendation on FRU inventory management and corresponding pointers.
>
> There seems to be multiple options available
>
>  1. described in  "Adding new system to OpenBMC
>     <https://github.com/openbmc/docs/blob/master/development/add-new-syst=
em.md>"
>     with  Yaml files (meta-romulus/recipes-phosphor/ipmi
>    =20
> <https://github.com/openbmc/openbmc/tree/master/meta-ibm/meta-romulus/
> recipes-phosphor/ipmi>)
>
>  2. Entity manager <https://github.com/openbmc/entity-manager>=A0with JSO=
N
>     schema

Hi Vasant,

The commonly used option for this now is entity-manager. The entity-manager=
 config JSONs enable entity-manager to monitor/probe FRU config information=
 (FRU information read off of an EEPROM for eg) and then transform that to =
an inventory D-Bus object that implements an xyz.openbmc_project.Inventory.=
Item.<Type> interface. The webserver
(bmcweb) then can relay this into a Redfish inventory representation.

To make the FRU EEPROM content available on D-Bus, anther app typically rea=
ds the EEPROM and then hosts the info on D-Bus. For eg the FruDevice daemon=
 (which sits in the entity-manager repo) scans I2C connected EEPROMs, and c=
an read IPMI FRU format data off of them. Now this info can actually be com=
ing in via EEPROMs that the BMC can't access (and for eg the host CPU can) =
- in that case I would expect the FRU information to be transported over IP=
MI/PLDM, and then apps like host-ipmid or pldmd can place the FRU informati=
on on D-Bus, for entity-manager to consume.

> We are looking to enable below inventory (Both FRU and non-FRU):
>
>   * CPU
>   * DIMM
>   * M.2
>   * U.2
>   * Motherboard FRU EEPROM
>   * Chassis FRU EEPROM
>   * Add-on PCI cards
>   * FANs
>   * PSU
>   * Etc.

You can look at
https://github.com/openbmc/phosphor-dbus-interfaces/tree/master/xyz/openbmc=
_project/Inventory/Item
and define types that you don't find here.

Regards,
Deepak

