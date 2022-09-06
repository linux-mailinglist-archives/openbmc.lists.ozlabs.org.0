Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E05AEF40
	for <lists+openbmc@lfdr.de>; Tue,  6 Sep 2022 17:47:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMVC526Vhz3br0
	for <lists+openbmc@lfdr.de>; Wed,  7 Sep 2022 01:47:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Mbr2PyKb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.237.79; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=ropai@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Mbr2PyKb;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2079.outbound.protection.outlook.com [40.107.237.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMVB04DgLz2yp5
	for <openbmc@lists.ozlabs.org>; Wed,  7 Sep 2022 01:46:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyi1Bt8e5eRmbcHWjZ+vcPk26zWfvS6BhisuqBRclbAtxu2WK00Dw2UXCVNqTcK4HJlO1D0Yn8dzCYcrUGrNk1gY/jr3IT0PYTUOsehjAzebScA78nDh4GF+kExTORCOXusX+z1I8QS/yW2W01jxOQiTZYEFRh59gVNMtwb3J9TmPtQjrm4CZ+KbbdRMeHP8PxcIJzLWIBsBxteSZzyXK3BMBjv6XXI24f3I1KwDdh+VvD9f+NoBM5Xyy7l7G4Zo/UDyvzFb07Vn7aIg8AoWbRxjiiPkzfdjJ92z/tIlxC9dG2f/mCdTGqTrHEVVofCIfbLaGuLLV1QQslml9zyNMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q86+Ivhav2HlMC6b35P5l3rJg+CX8EGHnJO5UjfmcWU=;
 b=UaXRvcXHaUGQjP0M4BDxxYAvbdmyKLp4fAhMMyd5JY6uRXaKjBc1BiZtN0ygSA71ClB8ju+2N8sueZHuEQKeEQnwxFcFfqQGB4YP1hmf1akHEy+e6n+xzk2alPoadShSqSQB1ZSHmWX9Zmv1hfdn4evOFUlJ5CCBp34DSfXlujITYGdsrQNCNBVhPqYrexwGAzQcjNz1MufwpWRFWyqYIxtYtcU7Iq+JYOeP94jKiFhnc0i+7cpixjT6CJXCwIMY7u4dV5QRQccaXnRly1LNXyXfzzxXzPLYGdpbAXDmRP4bhOJOCCS5Cui84dKUTs17ZgGdq0SZQ8y8E7luLTiajA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q86+Ivhav2HlMC6b35P5l3rJg+CX8EGHnJO5UjfmcWU=;
 b=Mbr2PyKbCI5CXJKrjLGnqO1TrKGjpgiArLDWws63qB7YdIG3ivJBUO/ic4wDBQIqi6qd5DgPKTZq5i+qyZwSn6xwEchR6oYDkR0HE2hFGeSM8ZzJm/If8G8Y8EinHTIqq8fY0YeTWhE+FX8wYZQ2MywQOE4WOILSjSPvoQcLbgD/5fNuxOlCbe9wnScrsVTkXJZzj7qvxeqkgzxr0kjTvXXOgF6WuNAKf/OkGNIJqcwUM23KM0BMul8zCi9q/t2cDBq1xcGpzFAWGDJt1NpNbdDQx+bY0oqexUlufs/CmY6UGCqGz0Y2K7sxqDm+WnW2qcuLdN2OFpIr/6x7JMAtNA==
Received: from LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 by BL1PR12MB5779.namprd12.prod.outlook.com (2603:10b6:208:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Tue, 6 Sep
 2022 15:46:25 +0000
Received: from LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::e4d6:a1d5:5b5e:5c50]) by LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::e4d6:a1d5:5b5e:5c50%3]) with mapi id 15.20.5588.010; Tue, 6 Sep 2022
 15:46:25 +0000
From: Rohit Pai <ropai@nvidia.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Handling State Sensor Association in Bmcweb
Thread-Topic: Handling State Sensor Association in Bmcweb
Thread-Index: AdjB/3Z5qu4nyvBTTdqC+4WTQn3fDw==
Date: Tue, 6 Sep 2022 15:46:25 +0000
Message-ID:  <LV2PR12MB6014694AB12A5A82EED51FCDCD7E9@LV2PR12MB6014.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c377163c-9235-491f-ddcd-08da901ef4d7
x-ms-traffictypediagnostic: BL1PR12MB5779:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  NPdc+NRsFFo8Zful6yRwvzd7ZrT4UFQxcJOAyDMv+9Z6YroqXYbCU8dlNlZ4aJ8IV/7VcazgfMBZ/ViKYJeHOPeD9OpahM1601P8nxOfPoqL+fOzMd1hZSDui4sGXT/cpgZe/L0HlKHIDRWxoyU3YbPslKAXKDSKFOMwMgm7GoQ32SFstjID2BVKO1ZGZTkPXgW4PKRAjvuwnCSgRgTAQbr4dFFsO7mHgQ2e0O+26sKjMGWf2V8CGAz4DCs94axOyZZAGjjs/hsnYNkNIgoEZtK+PJiekiGbrUNaE9iJ0K6skTKxEZd21MwpdM7eKQXxvZHhQdd7FCC9PIi/82bJaz/9WCTuvVl08dkdqfsbdJ2sr80yATklQBnS2XVyr+M94+JSSOAifLWmeX+waSEg3FaKDxGXTULgzYA+CYMlB8RSuThhn+V0cQJX7imsAXpRiK5eg4YMbwOuxiBONGqNnMBLcjGVb06K5kpn0aHnjgVRPXeuyuqNfTX9xSMna7hW9poZE7CANTJJneSjy2eySYxYWonU3rc4Ouk4PMyA3VxhYzSyx9CsppHIDyFSH0iVcVSTmd5QzK3aI7OcUfGTJVHnGbrLShAiEKhWWlLYzI982H/jdzD26GJy6j6/qZOmTytJrnuNiVCSRiihDcK43oLnA70qBpnMNqmbkD7nabPji841o0eu+HTOJFDCXpMlAQZSdEoXbFK/DO7rp+Ztpuy6rimwu8Ku2yCUeiMoFkYo4OqDR0z/Qg2sb5ficAyqIP1F4gzpOX4LPlqq5AdIrQ==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB6014.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(316002)(122000001)(38100700002)(71200400001)(55016003)(41300700001)(6916009)(33656002)(66946007)(66556008)(38070700005)(6506007)(7696005)(478600001)(64756008)(8676002)(66446008)(76116006)(66476007)(9326002)(86362001)(8936002)(52536014)(186003)(26005)(2906002)(5660300002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?4CVsm3h9xPGmRSThBeWCkLnL7k9S/9Et6ozgUauRvL1bbrHhg3+u0fyjWesQ?=
 =?us-ascii?Q?i6NXuzXh9MpYsYLfYwQSC3ha2DDInFeO42u5tNzm1+XluihudgtX542w0Blo?=
 =?us-ascii?Q?CctzanjNdKLbtD+jwTE/psDALUoWfbh8UPfbNWI5a6/z2dvTeba367zp9y+0?=
 =?us-ascii?Q?RvY+XKwd9388LGK7fhCy/XO1fq0ZX0NFDBMrQTVX/lktlhHcqL8a83pRIXwQ?=
 =?us-ascii?Q?FejD84SNTOa5p8urzuO5LRTPhwwsipwVkfqvYa+CrLkMM7mFfxg81kDYxnI7?=
 =?us-ascii?Q?5KgsrLYb19eQj/vMW+gSXhADiJg+GhI51+WxwXPbWQI8z58Aj1J5xRMkLQt0?=
 =?us-ascii?Q?/I3vq5ZaFqEMHRIas4BuDCTvQrwyHbA7501++olzlt/9LZAOo265wocu727n?=
 =?us-ascii?Q?HnzX2BxmWMyOjg6tzvt8cgb/x8jOT4NgKJewZ3FloFuGZB26FHmHpaG9Fggx?=
 =?us-ascii?Q?Ti77gKoqbtMrZH1CWwFci2+C2LQ2XuwmcMBkcKNKM9OLTepQYxka75d1msVW?=
 =?us-ascii?Q?m2nFGQ/d0gGY87789k2XKRhE5aFjgBMufam4hsvKRMgfTG7OAoPOO+Fu1ay0?=
 =?us-ascii?Q?+Un6MP+RBpF4AjwyOsIIlnPqEnV4ySP79aUOt3PWfLPzSz6pCueCNjJLUtie?=
 =?us-ascii?Q?HJ+Kntbi7rg0zJHcDB5IQ7GjRQuv4a6h167+Rm9zLooEbzcAbzp5VUdl0kNd?=
 =?us-ascii?Q?Dp0ri/F+gTErBniaA3DhSBjLfO7fLb2mBD3zb9zE8n5peKK/ArOhZyd5oqRm?=
 =?us-ascii?Q?w5F3wrZ/bEdhgwtkO81V4kNiHu6i3kOB/o/U0mFyiaIMkQNnAtKfbRZEN/w7?=
 =?us-ascii?Q?2B2So5s1OZAvnm4nytnfDalDOOSQaikjuWJRMsuRc4fnXKS9sKY7erY60llb?=
 =?us-ascii?Q?txWtRfW6+XjuZLzbDuGq6vt/7FT/cfk3dZia25pNs2/i1Lz8oRDxIVds07qa?=
 =?us-ascii?Q?XztXgKHERZuWgsw7uVfIYU7Cd4AW7vGJFkylLL2dfzyQ4f/F5D+Sh45XRAHg?=
 =?us-ascii?Q?8Ug4191NLdOieyF5/iNk4IafqL7T0PKI5+6Ao/9JhEibsrbw0XN/FLvFVDnd?=
 =?us-ascii?Q?cI2fQ4KjRzUClbMV2qBaEPnRG9ODYS1XkI54FoiAa690V8hQO/2owIEiYPmu?=
 =?us-ascii?Q?kIcNY5yP2xLRZ+NlASq82NzCv2mAtt0FVVtBho0faJN2kok/5P5bN6TV0yqF?=
 =?us-ascii?Q?0zl9SBamOKU3d9zh7fi19i1PeRXJWrqieJt69a/NXDLxPDgvWhZ16kGlB5m6?=
 =?us-ascii?Q?OVquFkw4nHftDYct+Kb/HxqyUI7Q6ZTl2NNo1B/b+kcVq1dJM0XRkvfH2p59?=
 =?us-ascii?Q?Tyj4xAXqZr4/fkwVa5ytM4JNoj9us8N+SQ+WcFtjmv4H31o1Z000KWGakDll?=
 =?us-ascii?Q?jON6i1ozvbalUKFNl1OpjhzdHwZuyLeenHNt4l2bZdx3o9ZjFUdJJJXC58gN?=
 =?us-ascii?Q?0N+Q81C9lbZBDHZnPRvI5qwTP4lEcoHtGhMKvOtCFJx0KVoaUgxyVIbWQRB8?=
 =?us-ascii?Q?19s1WrdYwlEunr6IN71qMCLGXlRDrkdOB3Z1thyOX3ZvqHCczZvkf61oPgTE?=
 =?us-ascii?Q?sKdG5dbIwKztO8oOvIw=3D?=
Content-Type: multipart/alternative;
	boundary="_000_LV2PR12MB6014694AB12A5A82EED51FCDCD7E9LV2PR12MB6014namp_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB6014.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c377163c-9235-491f-ddcd-08da901ef4d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 15:46:25.6927
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z9w/lwx2BmgB7zfTwUHU2MWtRqaThA276pvVodz/OBi7S4Q29CF6Tdz/hHmij+ibyZj6eifKaYCKuDqJGJEDfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5779
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

--_000_LV2PR12MB6014694AB12A5A82EED51FCDCD7E9LV2PR12MB6014namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Team,

This email is to discuss the implementation details regarding state sensors=
 association with inventory objects when multiple applications are involved=
.

On our platform, we have a service that populates different inventory objec=
ts like CPU, GPU, Power Supply, Memory, etc.
For example, let's say there is a CPU instance that is represented over dbu=
s like below

  *   /xyz/openbmc_project/inventory/system/processors/CPU0


Then we have another application that hosts state sensor information relate=
d to this CPU0 instance.
To be more specific the second application is the pldm daemon which reads a=
ll the state sensor information related to this CPU.
These are discrete sensors that are represented using unique dbus interface=
s.
Example (dbus interface)

  *   CPU throttle state (xyz.openbmc_project.State.ProcessorPerformance)
  *   CPU power supply reg state (xyz.openbmc_project.State.Decorator.Power=
SystemInputs)

Now in the above case if I must associate the state sensor (from Pldm) with=
 the inventory object (from a different app) then what would be a preferred=
 way?
My end goal is to get these state sensors over redfish and association will=
 help me identify the relation between the entities and the sensor data.

Few thoughts which are in my mind
Option 1: Both applications use the exact same dbus object path
App1 :
   - /xyz/openbmc_project/inventory/system/processors/CPU0
        - xyz.openbmc_project.Inventory.Item.Cpu
            App2 (pldmd) :

   - /xyz/openbmc_project/inventory/system/processors/CPU0

        - xyz.openbmc_project.State.ProcessorPerformance
               Bmcweb uses the object mapper to get the object path which i=
mplements the required dbus interface and then will identity the CPU0 insta=
nce from the object path.

               Option 2: There will be an explicit association defined betw=
een the inventory object and the state sensor object
App1 :
   - /xyz/openbmc_project/inventory/system/processors/CPU0
        - xyz.openbmc_project.Inventory.Item.Cpu
        - .Associations
              - all_states
                     - /xyz/openbmc_project/State/CPU0_Performance
            App2 (pldmd) :

   - /xyz/openbmc_project/State/CPU0_Performance

        - xyz.openbmc_project.State.ProcessorPerformance
               New keyword 'all_states'  is used as an association string.
               Bmcweb will use this association to find the object path of =
the state sensor which implements the state sensor which belongs to the CPU=
0 instance.
               This pattern is very similar to how the numeric sensor code =
is working today.

Please provide your thoughts/preferences regarding the options.
Comment If there are other ways to solve the same problem.

Thanks and Regards,
Rohit PAI

--_000_LV2PR12MB6014694AB12A5A82EED51FCDCD7E9LV2PR12MB6014namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Abadi Extra Light";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:819734257;
	mso-list-type:hybrid;
	mso-list-template-ids:-1779634242 -2075639068 67698691 67698693 67698689 6=
7698691 67698693 67698689 67698691 67698693;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:-;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Calibri",sans-serif;
	mso-fareast-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello Team, <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">This email is to discuss the implementation details =
regarding
<u>state sensors</u> association with <u>inventory objects</u> when multipl=
e applications are involved.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">On our platform, we have a service that populates di=
fferent inventory objects like CPU, GPU, Power Supply, Memory, etc.
<o:p></o:p></p>
<p class=3D"MsoNormal">For example, let&#8217;s say there is a CPU instance=
 that is represented over dbus like below
<o:p></o:p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">/xyz/openbmc_project/inventory/system/processors/CPU0<o:p></o:p></li>=
</ul>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Then we have another application that hosts state se=
nsor information related to this CPU0 instance.
<o:p></o:p></p>
<p class=3D"MsoNormal">To be more specific the second application is the pl=
dm daemon which reads all the state sensor information related to this CPU.
<o:p></o:p></p>
<p class=3D"MsoNormal">These are discrete sensors that are represented usin=
g unique dbus interfaces.
<o:p></o:p></p>
<p class=3D"MsoNormal">Example (dbus interface)<o:p></o:p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">CPU throttle state (xyz.openbmc_project.State.ProcessorPerformance)
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso=
-list:l0 level1 lfo1">CPU power supply reg state (xyz.openbmc_project.State=
.Decorator.PowerSystemInputs) &nbsp;&nbsp;<o:p></o:p></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Now in the above case if I must associate the state =
sensor (from Pldm) with the inventory object (from a different app) then wh=
at would be a preferred way?
<o:p></o:p></p>
<p class=3D"MsoNormal">My end goal is to get these state sensors over redfi=
sh and association will help me identify the relation between the entities =
and the sensor data.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Few thoughts which are in my mind <o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><b>Option 1: Both applica=
tions use the exact same dbus object path &nbsp;</b><span style=3D"font-fam=
ily:&quot;Abadi Extra Light&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
</span><b><o:p></o:p></b></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-famil=
y:&quot;Abadi Extra Light&quot;,sans-serif">App1 :<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Abadi Extra Light&quot;,sans-serif">&nbsp;&nbsp; - /xyz/openbmc_pro=
ject/inventory/system/processors/CPU0<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Abadi Extra Light&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; - xyz.openbmc_project.Inventory.Item.Cpu<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Abadi Extra Light&q=
uot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; App2 (pldmd) :<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span style=3D"font-family:&quot;Abadi Extra =
Light&quot;,sans-serif">&nbsp;&nbsp; - /xyz/openbmc_project/inventory/syste=
m/processors/CPU0<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span style=3D"font-family:&quot;Abadi Extra =
Light&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - xyz.op=
enbmc_project.State.ProcessorPerformance<o:p></o:p></span></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Bmcweb uses the object mapper to get the o=
bject path which implements the required dbus interface and then will ident=
ity the CPU0 instance from the object path. &nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>Option 2</b>: <b>There will be an expli=
cit association defined between the inventory object and the state sensor o=
bject</b><span style=3D"font-family:&quot;Abadi Extra Light&quot;,sans-seri=
f">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-famil=
y:&quot;Abadi Extra Light&quot;,sans-serif">App1 :<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Abadi Extra Light&quot;,sans-serif">&nbsp;&nbsp; - /xyz/openbmc_pro=
ject/inventory/system/processors/CPU0<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Abadi Extra Light&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; - xyz.openbmc_project.Inventory.Item.Cpu<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Abadi Extra Light&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; - .Associations<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Abadi Extra Light&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - all_states<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Abadi Extra Light&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; - /xyz/openbmc_project/State/CPU0_Performance<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Abadi Extra Light&q=
uot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; App2 (pldmd) :<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span style=3D"font-family:&quot;Abadi Extra =
Light&quot;,sans-serif">&nbsp;&nbsp; - /xyz/openbmc_project/State/CPU0_Perf=
ormance<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span style=3D"font-family:&quot;Abadi Extra =
Light&quot;,sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; - xyz.op=
enbmc_project.State.ProcessorPerformance<o:p></o:p></span></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New keyword &#8216;all_states&#8217; &nbsp=
;is used as an association string.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bmcweb will use this association to f=
ind the object path of the state sensor which implements the state sensor w=
hich belongs to the CPU0 instance.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This pattern is very similar to how t=
he numeric sensor code is working today.
<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Please provide your thoughts/preferences regarding t=
he options.
<o:p></o:p></p>
<p class=3D"MsoNormal">Comment If there are other ways to solve the same pr=
oblem. <o:p>
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks and Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Rohit PAI <o:p></o:p></p>
</div>
</body>
</html>

--_000_LV2PR12MB6014694AB12A5A82EED51FCDCD7E9LV2PR12MB6014namp_--
