Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E95DA60BF91
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 02:31:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxCY05MLRz3bls
	for <lists+openbmc@lfdr.de>; Tue, 25 Oct 2022 11:31:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=ajkngTFC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=atos.net (client-ip=193.56.114.176; helo=smarthost1.atos.net; envelope-from=francine.sauvage@atos.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=atos.net header.i=@atos.net header.a=rsa-sha256 header.s=mail2022 header.b=ajkngTFC;
	dkim-atps=neutral
Received: from smarthost1.atos.net (unknown [193.56.114.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mx0vG6k31z2xl5
	for <openbmc@lists.ozlabs.org>; Tue, 25 Oct 2022 03:31:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=atos.net; i=@atos.net; q=dns/txt; s=mail2022;
  t=1666629083; x=1698165083;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4AKFt12OeSR9oWNC8s2jFdkbID7jTSxGj5h1UkutWB8=;
  b=ajkngTFCpe5pKRMLLRKiPGAeuEFcMcqgMHtDy+NY9Xq10B9W73HhAfsN
   O2fVp2rwtZh5pwDkePJTKxplOWIb59bwJJzxnJ/djSlKp+zBjFR/7KOHy
   BWNkweTr/xtOru9/5h0SONioU8E+dKX7j8/oODKC2dbgRz13HV98I669A
   AXj6VP3QGmopiqzsoeY8xSvmhIUZRXjxclv9PAfCAph6n8ume5CyvNmeZ
   Zeur6eFC/890W7XpUJWWiib9OSkThJgHwFdZHMq0jhQ6uYpS/qGdSSlx2
   k8oMCd9OB1xrN3xk0cm57T693OHMJyOkys+uvP/kEJ8sgsiKsM1xrQ0NC
   A==;
X-IronPort-AV: E=Sophos;i="5.95,209,1661810400"; 
   d="scan'208";a="333892703"
X-MGA-submission: =?us-ascii?q?MDEw7oUoxMJIdG27LHX9zxWTBOBnzIETWvrZtu?=
 =?us-ascii?q?TVrgZlw4O7u3pJVAhLUwXwsYC25Meh4CAXGXsbdJKlke2k6I/djfSK6o?=
 =?us-ascii?q?vvcuUqCt9oGott4YyN0boiicBKyH75i0qrBP6TcmrJ18KCQC0FRnbCBk?=
 =?us-ascii?q?VC?=
Received: from mail.sis.atos.net (HELO GITEXCPRDMB24.ww931.my-it-solutions.net) ([10.89.29.134])
  by smarthost1.atos.net with ESMTP/TLS/AES256-GCM-SHA384; 24 Oct 2022 18:31:05 +0200
Received: from GITEXCPRDMB23.ww931.my-it-solutions.net (10.89.29.133) by
 GITEXCPRDMB24.ww931.my-it-solutions.net (10.89.29.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Mon, 24 Oct 2022 18:31:05 +0200
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (172.16.214.171)
 by GITEXCPRDMB23.ww931.my-it-solutions.net (10.89.29.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32 via Frontend Transport; Mon, 24 Oct 2022 18:31:04 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSOIE/j5I8LSj1lKRx0z642wVCBI4FednJqZTdxZ7Orv7XDD5i/TEDxBjGfEWRfAtqC3LCgIY+QzeaJ0LEeHHaJ7n4JCQrLwOcF903/8eg0/DpWRVn6dXU1EBSjzjlwM3h9Zae5tkiS9OXu27xnHgOVSw18UrN2gYvoXFPJjlYXdSodzz4drT6lDEUZJEyhJNJAyc/r6m+5kM3xWAO2TrqRf1D/P6T/9id4dR44DE/PFWVQxR2qkX+4SaVvcLAmGQOwQ6n4Gm8KBh4JZR8f8Si8PCaenn4RltergAGflbWFyQQNXX7hMNqqVmEMPBC62zFgfXSb3HcRVo2iMhgxf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AKFt12OeSR9oWNC8s2jFdkbID7jTSxGj5h1UkutWB8=;
 b=Oq2fdRrDqhbs72J5mj5+AE8iWGUmBbeaUcFzY3kxDHsneS2S2EG1M7dchCgYfybui7aH6Ej38ZcbgmQya0MSCyqI40OnsMAu6KFiyCELuK5GuGwkQyN/C3VJ89B2qeFmT/CZ8J4cOic74QQZfnjKLG22zuyZ+1Dl4rH8YVT6zSV5uBgbSU2iVqjNxP2Ymg2D9x7XD18SzAtj4z25U2CZZiWepVjmiKjmnpcGt+btkj5cXK4h3ITCROKIei/OcwdeKAl54RYqo7bD11H9jwemTvC0s8o78axePtVxYIVFA0kPRApw6cCWJ7P8lrxw53WHbM3fuwAx31M8TKQJLzMD8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atos.net; dmarc=pass action=none header.from=atos.net;
 dkim=pass header.d=atos.net; arc=none
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com (2603:10a6:102:21f::7)
 by AS8PR02MB9578.eurprd02.prod.outlook.com (2603:10a6:20b:5a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Mon, 24 Oct
 2022 16:31:03 +0000
Received: from PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::9105:44af:4934:f5e3]) by PAXPR02MB7680.eurprd02.prod.outlook.com
 ([fe80::9105:44af:4934:f5e3%8]) with mapi id 15.20.5723.035; Mon, 24 Oct 2022
 16:31:03 +0000
From: Francine Sauvage <francine.sauvage@atos.net>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: compiler error : get_if<> with a variant enum ?
Thread-Topic: compiler error : get_if<> with a variant enum ?
Thread-Index: Adjh/8IAYnQ4mETfS2au9W7IhFbaOgAgaEuAAA+KbIAAeF4TIAA7D/wAAIW5i5A=
Date: Mon, 24 Oct 2022 16:31:03 +0000
Message-ID: <PAXPR02MB7680BF2C5955F6977D83B2D3E42E9@PAXPR02MB7680.eurprd02.prod.outlook.com>
References: <PAXPR02MB768084801092880D4746547FE4299@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <Y03nKztaGeEn1tZg@heinlein.stwcx.org.github.beta.tailscale.net>
 <PAXPR02MB7680EE5542E3508B583D4BDFE42A9@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <PAXPR02MB7680E1F677D12D5656CA3F72E42A9@PAXPR02MB7680.eurprd02.prod.outlook.com>
 <Y1MDmAFeL1kg/5ip@heinlein.stwcx.org.github.beta.tailscale.net>
In-Reply-To: <Y1MDmAFeL1kg/5ip@heinlein.stwcx.org.github.beta.tailscale.net>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Enabled=true;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SetDate=2022-10-24T16:31:01Z;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Method=Standard;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_Name=All Employees_2;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_SiteId=33440fc6-b7c7-412c-bb73-0e70b0198d5a;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ActionId=0a516dc4-0967-41e3-a579-ba01b748bfb1;
 MSIP_Label_e463cba9-5f6c-478d-9329-7b2295e4e8ed_ContentBits=0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR02MB7680:EE_|AS8PR02MB9578:EE_
x-ms-office365-filtering-correlation-id: 3d9be411-1c46-41f2-88d3-08dab5dd24e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1f85OxMm7bcaA9VfBqlQ5XiQpo85ZUOf7rAnbnSSdIJNMAKVa7aRCkygujgwMHTTIpYMIOa3qEGl1wnQThxPodoMlM0HXlkTStbeSZKawq5pxuzB3hwRbsf/08HztJZLbq5EYF4E3rlwiQdGxTY24W5aYqjki4VxcG1+OLrtGlaY7JiTWV8v0cHuyGCllr3yqiBN9i9Sg0MFlFF3JM/c35LJJtOpr22iSwbQHagkbPnAfEOX9PKFOSqaWncavJ1u2gQP67y94NI71B1a753T5BVooBW6II1/MHLclY4JKoMJ3mdVtfg7HevDOz2+FjXokJQjNzqs8wTHsBRQK7BsOc4o1v/cAhVHGstzPqdMsessLR104aIW5T8ZJYbqUgsFDUlse9VAdAMbiyErNOTpL+JLHKzArnwUOiiVbBJK18eswhztIMlXHiV74PFGwpYMNzgKVGkrcdeTU6QebNn/dyOHF0TOPZ14sicZddPymb6NV0Fk/JKRkUqSQqO8R9eE8xZbX4nxVOzleeOWoGOHPmH/8JJAfdX7Qrxih6rUJ93zWfFdGwS9ukqF5Ct0SuUwFRByr6sYLRB5T+0M4ij5mhf81c8TfgOvbDJy3jiTxP/bZr7tquA9PGpGFN/TuFN0V9WSwNrCHamCrQZBIqP7kL/dQHpA2GGxaHPgNRfBSQTrTUkeM5sUoX8xeJO1A6xnzLCk0y9KCZ54TkE1Ru3xPuhhwFZZi4cwjXU48dkesB0Q1Bh6rkrjQi1lrpdrXScDvgJV1XjwMtZVsMVIpDjjgQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR02MB7680.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199015)(41300700001)(26005)(8936002)(52536014)(6916009)(5660300002)(66946007)(66446008)(66556008)(76116006)(64756008)(55236004)(6506007)(4326008)(9686003)(7696005)(8676002)(66476007)(82960400001)(38070700005)(316002)(122000001)(38100700002)(66574015)(44832011)(186003)(55016003)(33656002)(2906002)(83380400001)(86362001)(71200400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?pH9UbQk/XI6IRdHQ4tNL92TWAwZ69j7gO7BeArkJZzvHfJz5ukT/zwNX81?=
 =?iso-8859-1?Q?nMuKaS/Qx+IDJikadGl52ba2xHFmQ+maxBXT7LTf1VX8pJo7LZ+/3dRKaN?=
 =?iso-8859-1?Q?gvBmdYqkWJCK80P5IVF5ZCb1mJ9IpE0FdyQSdkn292jffQc+PGFlrO9oKy?=
 =?iso-8859-1?Q?FUInul00V02wwYoahDwAXII9HWbh9aO1VGfbaDqkcEdPf6rwQq63k8MCtI?=
 =?iso-8859-1?Q?3hWJtyqV9OoNv5xvx9uogh700MAOxvlbZJRh04yYS+qdvoNissvFCLkmxB?=
 =?iso-8859-1?Q?+Jjirxmd5P9fMETW5LgqVgx3wCszcyHtkyZ/i0j1XmR2ED1Hev4FVj1oP9?=
 =?iso-8859-1?Q?qAK0o03XVWRuJX+hOklz/9bA8EuIgNlLQb3FwPvB71FzSjiYrMACea3Hlf?=
 =?iso-8859-1?Q?HgQPykaaoiIKXL8UTHlA7M6oDPW2bgZcii/839Gepl7YPk4Al0OAYbhLGG?=
 =?iso-8859-1?Q?+pXjYhscQrQWHFPRBVl/oGR5lJdbqUDI7VJX4rxkUvcfOeTQUqkNWJtE8v?=
 =?iso-8859-1?Q?q0y8pYIoHfXD1NjA0Y5xYcCErGSD84+Mtal6I4RiPOUk4WpPd89ULcMtcX?=
 =?iso-8859-1?Q?3/Vm1dEJepWBZYwJt7GIvQ+oE0IRQA9hzj7QwmUbonXGUUI4xbcF2DHhGT?=
 =?iso-8859-1?Q?jd7LV/3dvtWRwcgHWbWm4ZmiD6xoUigaXI+WEqzpnKnIrDGxB4nBMzdcli?=
 =?iso-8859-1?Q?qd6mvg+pHnjt4VWhVx+eHYpjC+wkbltI0a5lI86QMn/EAmbWYL6w5TFPOR?=
 =?iso-8859-1?Q?kzoQ/FEJdDpV8jvZlMpyIacUeaK/ZnrGse1/ZVzpKN9YBfXzUsoz8+cjPp?=
 =?iso-8859-1?Q?okTtgq0ZBrsm2Il1YBDCr6uJdmYB5Wo/F8V2RNfpyp7meaONmgUd6LdRUk?=
 =?iso-8859-1?Q?3/45+hGz0bXtuntQnL6hLsbFi+IZPfb6s6uU4KBqd506Wa9I/DkQat4CF1?=
 =?iso-8859-1?Q?rxTj5OLuv6YbbA9mijmYEoPQ4nuipiwHu+wlenwXISeEfQ5EiSNKercn2f?=
 =?iso-8859-1?Q?CrCtDItGCB1CMwIbbZ/CsTwMdEdPQx7U9h3AmBzesGWofFs6a856KuyF3Q?=
 =?iso-8859-1?Q?8fM/5aVDRYl5gT9S1E/dxS6G6KPQ9VcLGnjbCXZZ5t740Yz3okoa4CQxCO?=
 =?iso-8859-1?Q?/6YsEZxo/FSCwLFK05mdgAwOA31zKfT+54WQDrbg5fQuN1t+D3CAfYJFxy?=
 =?iso-8859-1?Q?sFZ2+8FTRJ6gCruidF9C2Plvsx9vQlZhThnQLNeDVV1jXs8HCqj02EleaK?=
 =?iso-8859-1?Q?6VE9KUaaSYltvqjqaszk/q0eixueaLLeTKZu/QcrV1xgqQLqg1pBfq6Q16?=
 =?iso-8859-1?Q?B0WwpIGExfl8mns1FzkFUW6rmnhe6+dqn4f+O8qkQLwptyrQPQaZ1OEY3t?=
 =?iso-8859-1?Q?gmv8GIsmdMdoUmqYhTWru7srfIun3j0o83Z5P34cijYxB/Qw3k4Jm1hPFx?=
 =?iso-8859-1?Q?8pnEef46wfvHei4IvOwXHDIMzYTh/iniHALrNFUN0Yx+BALNRz27Wc4LJG?=
 =?iso-8859-1?Q?Tu6R0JHZ+sIt/5/5ZXn3mH3SI+Zh0qHH+OhK4Xp+X2EdBRKlcqMXCSfoSa?=
 =?iso-8859-1?Q?UbngRWxlEkrrrlnknHuXDrgc5qnUS1aZDHxwfGyYwCEcqI3EVwjX6QbLw4?=
 =?iso-8859-1?Q?vC+clgRWAneN91h2tpOXUH6Pnpso2jL3en?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR02MB7680.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9be411-1c46-41f2-88d3-08dab5dd24e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2022 16:31:03.7012
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 33440fc6-b7c7-412c-bb73-0e70b0198d5a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gGq/rDjsVzPa1i/9zymm/FGQrg3ybrEGHo4A3pdgBpvFjJjyem0DtOmKKFlkr6HGb1n1lgbvhDLr5VxLu8p11lS4nqFJrg6fr60ZzUhpp1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9578
X-OriginatorOrg: atos.net
X-Mailman-Approved-At: Tue, 25 Oct 2022 11:29:54 +1100
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

Hi Patrick,

Thank you to help me !

I tried :
variant<MyEnum, std::string>=20
=3D> what():  xyz.openbmc_project.sdbusplus.Error.InvalidEnumString:

" I think you could unpack a `variant<YourEnumType, std::string>` from the =
message (or dbus call result) and if it is your enumeration it'll be interp=
reted as so but if not it will fall back to the string. "
I agree, theorically, but the "read" fails (even if callMethod is OK) :
---------------------------------------------------------------------------=
---------------------------------
using FlexDbusVariantType =3D std::variant<
                sdbusplus::xyz::openbmc_project::Inventory::Item::server::F=
lexibleModule::ModuleTypes,  <=3D=3D=3D=3D here is MyEnum
                std::vector<std::string>, std::vector<double>, std::string,
                int64_t, uint64_t, double, int32_t, uint32_t, int16_t,
                uint16_t, uint8_t, bool
                >;                =20
using FlexDBusPropertiesMap =3D boost::container::flat_map<std::string, Fle=
xDbusVariantType>;
using FlexDBusInterfacesMap =3D  boost::container::flat_map<std::string, Fl=
exDBusPropertiesMap>;
using FlexManagedObjectType =3D std::vector<std::pair<sdbusplus::message::o=
bject_path, FlexDBusInterfacesMap>>;
.......................

    std::cout << "Before calling callMethod" << std::endl;

    auto respMsg =3D bull::dbus::utility::callMethod(
        bus,=20
        "xyz.openbmc_project.Inventory.Manager",=20
        root_obj,=20
        ORG_DBUS_OBJECT_MAN,
        "GetManagedObjects");

    std::cout << "After calling callMethod" << std::endl;

    FlexManagedObjectType managed_objects;
   =20
    respMsg.read(managed_objects);  ,  <=3D=3D=3D=3D here it fails

    std::cout << "After reading" << std::endl;

---------------------------------------------------------------------------=
----------------------------------

If I don't declare MyEnum in the variant, I cannot use get_if<MyEnum>
If I declare MyEnum in the variant, I always get a runtime error
=3D> what():  xyz.openbmc_project.sdbusplus.Error.InvalidEnumString:

If I remove MyEnum from variant, it works, but I cannot compare strictly th=
e Enum, I need to convert.
get_if< MyEnum > is not possible if my Enum is not in the variant,

I will be pleased if you have any suggestion,

Kind Regards,

Francine SAUVAGE
Team Leader=A0- R&D, BDS
Atos France
Mobile: +33 6 21 43 11 21
R&D, BDS
Avenue Jean Jaur=E8s=A0- France
atos.net
=A0=A0=A0 =A0
TT: [Wednesday or Thurday(2nd week of month) ] - Friday]=20
OoO=A0: October 31


-----Message d'origine-----
De=A0: Patrick Williams <patrick@stwcx.xyz>=20
Envoy=E9=A0: vendredi 21 octobre 2022 22:40
=C0=A0: Francine Sauvage <francine.sauvage@atos.net>
Cc=A0: openbmc@lists.ozlabs.org
Objet=A0: Re: compiler error : get_if<> with a variant enum ?

On Thu, Oct 20, 2022 at 04:32:40PM +0000, Francine Sauvage wrote:
> But, I get a runtime error as all my objects are different:
>=20
> what():  xyz.openbmc_project.sdbusplus.Error.InvalidEnumString: An enumer=
ation mapping was attempted for which no valid enumeration value exists.
>=20
> Is there a way to add enum types to the variant of a ManagedObjects that =
potentially are NOT in the object interfaces/Properties ?
>=20
> Or is there a way to filter the objects in ManagedObjects dbus calls ?

I'm sorry, I'm having trouble figuring out what you're trying to accomplish=
 or where it is having trouble.

I think you could unpack a `variant<YourEnumType, std::string>` from the me=
ssage (or dbus call result) and if it is your enumeration it'll be interpre=
ted as so but if not it will fall back to the string.  You can even do `var=
iant<Enum1, Enum2, Enum3>` and it'll turn into the correct one.

The important thing is that you need to pass all possible types into the va=
riant when you attempt to unpack it.

Patrick Williams
