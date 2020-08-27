Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D708E253B36
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 02:53:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcPP8530YzDqQm
	for <lists+openbmc@lfdr.de>; Thu, 27 Aug 2020 10:53:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=203.18.50.4; helo=nat-hk.nvidia.com;
 envelope-from=jan@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=Dv7wrh2O; dkim-atps=neutral
X-Greylist: delayed 308 seconds by postgrey-1.36 at bilbo;
 Thu, 27 Aug 2020 10:53:05 AEST
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BcPNK1jrTzDqQ3
 for <openbmc@lists.ozlabs.org>; Thu, 27 Aug 2020 10:53:04 +1000 (AEST)
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f4702b10000>; Thu, 27 Aug 2020 08:47:45 +0800
Received: from HKMAIL101.nvidia.com ([10.18.16.10])
 by hkpgpgate102.nvidia.com (PGP Universal service);
 Wed, 26 Aug 2020 17:47:45 -0700
X-PGP-Universal: processed;
 by hkpgpgate102.nvidia.com on Wed, 26 Aug 2020 17:47:45 -0700
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL101.nvidia.com
 (10.18.16.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 27 Aug
 2020 00:47:45 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 27 Aug 2020 00:47:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPYpUzs1P0VxWpwJ+GM5qqWcqojxZgadIZw3NmkFWvS6Pu/LwewmFhHmN9NyWDwlNTuURVbpQ25IgW1DrklPoYiESa489nMVMw+LpKlQfF8r4Y0SILRBmlEh3n7Es0w2HbKbr3ckjWFBxd4ouU0JzmNgF7Cm9syTRP+gJAeYCU3tI67sXViUHt0sSgYp7ctDK8ZEp4wa0HSNCJQiHqPRPLdmQxbvBk9BrQDwMdtCQ6Ue038BIkZIbDUFLdUeJvUWIdyqBZ5WyARk1zyPGbwTc4VWZb8Iuj4Y9QI4ehlEkD6eh21/TuXRs0OqWrMFqoUbxI0Xu5qjP/lScrrI8dSmfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLsWH2ihGiBLGDu3e5aFo9MgIdAMju8mr2H0kw/gPSU=;
 b=G2OCC02/4d2PaauCychcMfTM1GoUXhqnQGqwUS1MPznlrIGS3p5Pg6lzHwUFNlZuq94Y6NqEb4kXuqBFtowe5/CvqhCWC1DAq7I0Yy4D1M3McNw8pwBjpI7wHEWcLEgE2xKkPbDFwKOeVT2CB/5m+xWgfGNX+YDXMdh4/AUneUjmeujSEntMyiJEoiwrjJupfKVxzNCFboIk10DZjJXpyNREd6LMKV9KxAOxSq8KMVARTtu+CUSBq3baGr1lMLHo7ivYoGLXAC/bmxDrHm+qEC++tDP252jWJ1ciuUkg5bJHE56TU0lWgE4SVnWCGbnt/R2LjRkXKgfO7S8sznBJtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3020.namprd12.prod.outlook.com (2603:10b6:5:11f::15)
 by DM5PR12MB1340.namprd12.prod.outlook.com (2603:10b6:3:76::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Thu, 27 Aug
 2020 00:47:43 +0000
Received: from DM6PR12MB3020.namprd12.prod.outlook.com
 ([fe80::b5a1:ab5d:a3aa:273f]) by DM6PR12MB3020.namprd12.prod.outlook.com
 ([fe80::b5a1:ab5d:a3aa:273f%3]) with mapi id 15.20.3305.031; Thu, 27 Aug 2020
 00:47:43 +0000
From: Jiandi An <jan@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: OpenBMC - FRU inventory with Entity Manager
Thread-Topic: OpenBMC - FRU inventory with Entity Manager
Thread-Index: AdZ8BXDmk1ugNPOnSNWhMxi+CJGThg==
Date: Thu, 27 Aug 2020 00:47:42 +0000
Message-ID: <DM6PR12MB3020D6DD47C7E6DBBD6530A3CD550@DM6PR12MB3020.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=jan@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2020-08-27T00:47:41.0380524Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=e968b67d-1d4b-4597-b4a3-cd581720982d;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=nvidia.com;
x-originating-ip: [216.228.112.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58035714-aed7-4f4e-66c4-08d84a22cebc
x-ms-traffictypediagnostic: DM5PR12MB1340:
x-microsoft-antispam-prvs: <DM5PR12MB134085BFA41ECEFBCB6ADF2CCD550@DM5PR12MB1340.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:289;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZdQUz4o9B42Eshv3x/6OVdH2G1zLiLVtgVZDgwKhiNvQHtwllOxnr6k2QVeU7CfvJwoGwjgJXrRtzcm6jTQb+P2To4MilXwWBv595e5zHPKGSSDkOSHQs5uz7TBxuFNZG5hcZKxBaupdUs9HqJxqGS84228Ax36bkYQdn+Eb2QneI3i+ByLYtzBJJQr2jrh7cduoOhdstTRXBBEdhrmx/pk92/7GmnTYHxW3RIwp5cWLcETjolnGL4VFcCSY54FQ0SX/GvSZp9ysJpUqBNPjrQlSeDGIdEfS05rJG/vcgFvyqPVe9CBcdXMnkAX+onSgcGufdhrsYNAvz84G/sx5PA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3020.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(6506007)(5660300002)(6916009)(186003)(66556008)(66946007)(66476007)(66446008)(71200400001)(64756008)(76116006)(316002)(9686003)(7696005)(2906002)(8676002)(8936002)(86362001)(52536014)(55016002)(478600001)(4326008)(33656002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: quqvVVBMwJvG1kUZCma7bpNomnW1WLPJOlKZWcWiOCAOeFFaACs2Vyb/Brhq0fGKESMwjpKXfF4Iy58VQPT+a2JNWBZyf4m+HRJFHMXJiQUrq01uKi7WLboKCVaLpwSG1eprJt5RuJJ1IxLmC4/TVzvqwrTTdKjdfgtwNTj9dsAXp59/BmVOLXGMG3e5qKELoJSnF/oZ93WnoqQ5ywTdSLPXM8XwaDb0AUwq7pTQGsSe3zICyKBZDlTltJVZcuuP0NHFdcOVK4yoDnJQ2+x5V+fhybCCJ7uWatcxxJ2XkL/TuDYU1V+RC0mieweFHI4dBrswKcv93f8MDWgU9wlbLY8g+FGO47GulTYYWI4gU4PNKQ1WbKMUqYwtBnwxypS4xh3/G5HSQUCTtpgpIMNWDILSrDgD2LuxYVhR74Mz+Vr6BecX+pKn8g9Pk+nzvDyJufqnM3btFFbyCmQ6Glpehs++ULWB8RRmayuOSlmrVYHoYr4Rju3EYZPNnBuKiz3VszGuvoa1PnjvXv3XurCXR5Sq+dsO7UP+hBhsx4aa9P7rAAJTJPZVDvYZzP6CTclnjlZMQA9Cl3S22hITT8y31VEjb+T+PJLqhq3FZj2UoR7VM9dsA0fsXHsNoLerQi+fXA2H5aaUxR+sjz/Xd+JQQA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3020.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58035714-aed7-4f4e-66c4-08d84a22cebc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2020 00:47:42.8953 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9fJCVhAPvELkdCZVCQAESopZdH4KpVdj7nVs4spzheEq0bPhs0iSh6q9HBjEgDyz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1340
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1598489265; bh=rLsWH2ihGiBLGDu3e5aFo9MgIdAMju8mr2H0kw/gPSU=;
 h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
 ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
 Thread-Index:Date:Message-ID:Accept-Language:X-MS-Has-Attach:
 X-MS-TNEF-Correlator:msip_labels:authentication-results:
 x-originating-ip:x-ms-publictraffictype:
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
 b=Dv7wrh2OQo1KptTOkBUFmmFwa7jP1TlOKKcaQt88a4CoiytEf+3kmAKUQ4Wm66uui
 5ZVNwb3dFK8u3MDMaTU0MiXTtUhXybwcwXuEoo0+PuBoJb0nD9UcBbroONejI6ONut
 P9fVAPAVsOGM4Pnvak6xHnbc+e2rFpWpZt4XhrkAaQeDcBWPxxES1F9RdWIwkBemoW
 2eJZ166KwDOnNGl1Gd/KxnQnn5D9Re89P7twSrU46I7Cu76OisfqgDG7kBVfXiMSDu
 du1zFV/KliYJlROrLjl3A6kkc0bnY7AMIR9S31CE0SoeUGKYhbMDgvrgTGo65Vexhn
 CsV/YoJLodzlA==
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

Hi,

Have a question related how IPMI fru command is handled when having FRU inv=
entory handled by Entity Manager.
I've enabled Entity Manager and through the config JSONs, got the entity ma=
nager to probe FRU config information off of EEPROM and getting the FruDevi=
ce inventory D-Bus object added.
For example I I have /xyz/openbmc_project/FruDevice/My_FRU show up under xy=
z.openbmc_project.FruDevice.  And I can introspect it.  But I can't get tha=
t FRU to be handled and displayed when I ran "ipmitool fru"

root@bmc:~# busctl tree --no-pager xyz.openbmc_project.FruDevice
=84/xyz
  =84/xyz/openbmc_project
    =84/xyz/openbmc_project/FruDevice
      =84/xyz/openbmc_project/FruDevice/My_FRU

root@bmc:~# busctl introspect --no-pager xyz.openbmc_project.FruDevice /xyz=
/openbmc_project/FruDevice/My_FRU
NAME                                                          TYPE         =
          SIGNATURE   RESULT/VALUE                       FLAGS
org.freedesktop.DBus.Introspectable   interface             -              =
        -                                                 -
.Introspect                                                  method        =
       -                      s                                            =
    -
org.freedesktop.DBus.Peer                     interface             -      =
                -                                                 -
.GetMachineId                                           method             =
  -                      s                                                -
.Ping                                                             method   =
            -                      -                                       =
          -
org.freedesktop.DBus.Properties           interface             -          =
            -                                                 -
.Get                                                              method   =
            ss                    v                                        =
         -
.GetAll                                                          method    =
           s                     a{sv}                                     =
     -
.Set                                                               method  =
             ssv                  -                                        =
         -
.PropertiesChanged                                   signal                =
  sa{sv}as          -                                                 -
xyz.openbmc_project.FruDevice            interface              -          =
            -                                                 -
.ADDRESS                                                    property       =
       u                     84                                            =
 emits-change
.BOARD_INFO_AM1                                  property              s   =
                  "\001"                                      emits-change
.BOARD_LANGUAGE_CODE                     property              s           =
          "25"                                          emits-change
.BOARD_MANUFACTURER                       property              s          =
           "XYZ COMPANY"                    emits-change
.BOARD_MANUFACTURE_DATE              property              s               =
      "2020-01-01 - 12:00:00"      emits-change
.BOARD_PART_NUMBER                          property              s        =
              "123.ABCD.1234"                 emits-change
.BOARD_PRODUCT_NAME                       property              s          =
            "My FRU"                               emits-change
.BOARD_SERIAL_NUMBER                       property               s        =
             "123ABC"                                emits-change
.BUS                                                              property =
             u                     2                                       =
         emits-change
.CHASSIS_PART_NUMBER                        property               s       =
              "123-12345-1234-000"         emits-change
.CHASSIS_SERIAL_NUMBER                     property               s        =
             "1234567890123"                  emits-change
.CHASSIS_TYPE                                           property           =
    s                     "23"                                           em=
its-change
.Common_Format_Version                     property               s        =
             "1"                                             emits-change
.PRODUCT_ASSET_TAG                            property               s     =
                "0000000000000"                  emits-change
.PRODUCT_FRU_VERSION_ID                 property               s           =
          "v0.5"                                        emits-change
.PRODUCT_LANGUAGE_CODE                property               s             =
        "25"                                           emits-change
.PRODUCT_MANUFACTURER                  property               s            =
         "XYZ COMPANY"                      emits-change
.PRODUCT_PART_NUMBER                     property               s          =
           "123-12345-1234-000"          emits-change
.PRODUCT_PRODUCT_NAME                  property               s            =
         "TBD"                                        emits-change
.PRODUCT_SERIAL_NUMBER                  property               s           =
          "1234567890123"                   emits-change
.PRODUCT_VERSION                                 property               s  =
                   "v1.0"                                         emits-cha=
nge=20

When I ran the standard IPMI fru command, it always defaults to getting Bui=
ltin FRU Device, and dimm0, dimm1, cpu0, cpu1 FRUs and of course they are n=
ot there so it fails.  Is there anything that I'm missing to get the standa=
rd IPMI fru command to map to the DBUS object xyz.openbmc_project.FruDevice=
 /xyz/openbmc_project/FruDevice/My_FRU under Entity Manger?

root@dev-system:~# ipmitool -I lanplus -H $BMC_IP -U root -P 0penBmc -C 17 =
fru
FRU Device Description : Builtin FRU Device (ID 0)
 Device not present (Unspecified error)

FRU Device Description : dimm0 (ID 1)
 Device not present (Unspecified error)

FRU Device Description : dimm1 (ID 2)
 Device not present (Unspecified error)

FRU Device Description : cpu0 (ID 3)
 Device not present (Unspecified error)

FRU Device Description : cpu1 (ID 4)
 Device not present (Unspecified error)

Thanks
- Jiandi
