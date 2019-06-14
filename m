Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF2D4531C
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 05:49:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Q66t15MLzDrPb
	for <lists+openbmc@lfdr.de>; Fri, 14 Jun 2019 13:49:26 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=microsoft.com
 (client-ip=40.107.75.110; helo=nam02-bl2-obe.outbound.protection.outlook.com;
 envelope-from=neladk@microsoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=microsoft.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.com header.i=@microsoft.com
 header.b="K+BbmEsY"; dkim-atps=neutral
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750110.outbound.protection.outlook.com [40.107.75.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Q6693sQQzDrPV
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jun 2019 13:48:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=uxIhd4sJ1PEn9HUYN1dkEuho8hepzozgbac7/g0FxUXMvi7jWSAv72Jt9mQonvETKbqacyYoc4gq5/J7Bb5D+GdfkznX5su+7ENRcWRAR+l7ojzHrV3EvTPf14G77JaoH4pNhJyX+AgnLjnDhU1dQCHhFYGDWS3T2oBJBU+hQ9k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/SvqS1c3lUI54CfunY/iyNzIkCoenH7Me+UKdM8KMo=;
 b=t5rjNndtC8nhpVyADia3RNB5mBNeUTBhdiYVq8vGTOJti81toc4RvPWUwQrSH2Gt45Ellrc6rOtqnN8qBZEOhzRS7jCO6bd1GM08rWmL9MZ6tBPNSLZpRNfborDeRwUrX6xy/LAa3/v5l1by6eH49CaZWUr+xG1fY1mdKMip3U8=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/SvqS1c3lUI54CfunY/iyNzIkCoenH7Me+UKdM8KMo=;
 b=K+BbmEsY9sYxbF+6EZsOqi+X5uscr1VGeLzIn2GoKH+Wbq7+FuBcK32IKESYudH82UT8GYt0JRd5b0TOqqZ8+bSFZxhDZM9Dr4VvxcJT+j56YlVh9WjH8cexaPCEcfbbX607lbI1NmzYw5n/IxDVRzV8+NOD37t/0Dbif9rbM74=
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 (2603:10b6:207:30::20) by BL0PR2101MB0897.namprd21.prod.outlook.com
 (2603:10b6:207:36::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2008.4; Fri, 14 Jun
 2019 03:48:43 +0000
Received: from BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae]) by BL0PR2101MB0932.namprd21.prod.outlook.com
 ([fe80::1072:430b:60ef:aaae%4]) with mapi id 15.20.2008.002; Fri, 14 Jun 2019
 03:48:43 +0000
From: Neeraj Ladkani <neladk@microsoft.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Platform Inventory for redfish 
Thread-Topic: Platform Inventory for redfish 
Thread-Index: AdUiY/+aKZsM/MRORKSmi2eCldLAJg==
Date: Fri, 14 Jun 2019 03:48:42 +0000
Message-ID: <BL0PR2101MB0932DF0B72012340CADF3E90C8EE0@BL0PR2101MB0932.namprd21.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=neladk@microsoft.com;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-06-14T03:48:41.2545684Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=2c1bf5a7-5d90-4e08-b901-e1fb042a2a77;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=neladk@microsoft.com; 
x-originating-ip: [50.47.128.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e92bfbf4-f027-4433-446a-08d6f07b320b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BL0PR2101MB0897; 
x-ms-traffictypediagnostic: BL0PR2101MB0897:
x-microsoft-antispam-prvs: <BL0PR2101MB0897F7F7CE60E45177669AE8C8EE0@BL0PR2101MB0897.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39860400002)(376002)(396003)(136003)(346002)(53754006)(199004)(189003)(33656002)(68736007)(4744005)(66476007)(66066001)(64756008)(66946007)(478600001)(52536014)(66556008)(6116002)(52396003)(25786009)(76116006)(66446008)(26005)(5660300002)(186003)(73956011)(99286004)(102836004)(6916009)(6506007)(8990500004)(10290500003)(256004)(2906002)(10090500001)(486006)(53936002)(3846002)(6436002)(7696005)(476003)(74316002)(86362001)(71200400001)(81166006)(4743002)(9686003)(71190400001)(8676002)(14454004)(55016002)(22452003)(305945005)(3480700005)(7736002)(8936002)(81156014)(316002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR2101MB0897;
 H:BL0PR2101MB0932.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qCzVgRGsNqqMI2VUsvacGvw4f7LTKrgS/jGrk1r/MgMCkV6QuRQ8XVGm97qinEkj9K9hb9MtgIcRUwt0RQoupObUoXkGt7LwAIQ4JGS5W0Jk1oYAfueq7Osw6cMyRXafPLyg/z6nUhBURmN/plWa2yGKhFEDGEQytoyzN5zsNrgsinxNWEPWMmh7VUKwj3hJ/Zsb7hhCfQubdtz5f5tKGRoGGt1/ul/kmXKCMW7b+NgPBTxXFdsebG5n9qmZAKTs0blyk/ANEEbzAQ+yoz5qzT5Oi5JDrMlQIFgoVoErXhINr3kf8no4vtH7DH67KMEXtXuFM4qPHxzwDCtqUVI54kmOV2KTp0RotSjU7EVenWszHro+vn5970X48U5u1q9ZjFS9oho3SUErfeR/SK4iIkUi/ky36lPULAROz4V0jCI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e92bfbf4-f027-4433-446a-08d6f07b320b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 03:48:42.9497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: neladk@microsoft.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR2101MB0897
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

HI All,=20

How does we manage platform inventory like CPU, memory and PCIe devices sin=
ce BMC may not always have presence pins for all components.  For IPMI , we=
 have SDRs that can be programmed with correct SKU configurations. I am won=
dering what is solution for redfish (except BIOS sending inventory on USB e=
thernet using redfish). =20

Platform inventory includes=20

1. Number of host CPUs and type of CPUs
2. Number of memory and types of memory=20
3. IO expander cards=20
4. SMBUS devices on PCI cards=20

Thanks
Neeraj
