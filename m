Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D391255E58F
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 17:04:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXSY64b25z3cK6
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 01:04:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=XswA3Wbz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex.com (client-ip=185.132.180.100; helo=mx07-002d6701.pphosted.com; envelope-from=prvs=317873f221=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=XswA3Wbz;
	dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com [185.132.180.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXSXb1355z3bxY
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 01:03:41 +1000 (AEST)
Received: from pps.filterd (m0132505.ppops.net [127.0.0.1])
	by mx07-002d6701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25SC26Ov027038;
	Tue, 28 Jun 2022 15:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=dkim;
 bh=37CecC6cBiNebn5wXRMIndaN2GXIah1/u2nj/FqosyA=;
 b=XswA3WbzltCi5L3dykEke6yaqD7Z+oK4wQVyW/o8/OEFHsQBcU8tvv4RBhVi3eiyWFoW
 vmWxUC7CUCaIChQR3R/sYRTodnqFCTtkmLz+i6uysjcq4OwZ3zATe6Ui3uy+Cm4M/eMc
 XLHmyFwDK9omZc5u4dB5k6byL0ObfE57x9LLbGaio7KBerO09vzcogucs5yAaE6B8kwY
 sjcPAXldk/QcFj7H6URJmOj2shFOY8q9iPVS5wivdyV+xDa/GCDbev0JHv6gScyPeP8o
 fQhiH2z5oZaX8HTuJNacQn063j7kUSpsQVTSpad1bqEoOKSGnfKIMWC0lZL0xwQSIOU6 5Q== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
	by mx07-002d6701.pphosted.com (PPS) with ESMTPS id 3h019srxg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 15:03:36 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ffI+Dg6M+AYwMy9TaTxF+S6yuHvmZH051UHhf35jYYht6m4wagAzijjDNV5B+iu8v3sZgKEaVzObn0RHY3E4JC/+PWq/55haCjLvx8kdva1Xxbvj4VBtfuGoB864lSql79q+5/SQrkNMqvvLKTL2Vmy3rmxJOMCAts9m2p4+PPnI4WLMQmMKFfq4DJBTUsryKzvZCQTBV1hQIMPalluugpwvl3tRIMH9acT+r/T4poS5JWufhb05WCVvRpsHV2CnN4tm5ZY5hCcPhaCRb6v/Tmw5oKV241JdRhVyP4vNkPK6A0L9M0EDuGIM+A5ODakildE6FjsOC9ELkM3lNyF63w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzQySbwnzXhQurf8jhpLzk+W95hM4W9YEUi+fTHw9UU=;
 b=KsAlT2PydTjjlcdH9gE9eZOpFsJ1lk8nx6AbsNVLldAj+o7DD4Wa224gjvU5aKPFtyNZyJpqp/sYDafmPJJ+FJTkwk2Xgi9/LSTIUT9enpInNPSpR1IDyfSQcaoi1P1Fn6KAlzJpb67N8R2Yox67bbVse9kZu07k5IqQGSTvxnvQzyji87Zx6ZIraHmez3ahlQ8a7M0GN3ouoBdn3lpctbGqaJ93/hqsVaVGeS9XxOj2fxMCWd8pnbeXlFVkEWR3nDHm9sDAM9dF3UgCIbEKl5Xfad8Z9EsajHtWAxV4BmkFDjiE95S5zyA742fe01ukTS1Ishrr20Z0d1Yl59ArYA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 144.49.247.120) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=flex.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject header.from=flex.com;
 dkim=none (message not signed); arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=flex.com] dkim=[1,1,header.d=flex.com]
 dmarc=[1,1,header.from=flex.com])
Received: from DM6PR04CA0022.namprd04.prod.outlook.com (2603:10b6:5:334::27)
 by BYAPR08MB5941.namprd08.prod.outlook.com (2603:10b6:a03:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 28 Jun
 2022 15:03:33 +0000
Received: from DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::91) by DM6PR04CA0022.outlook.office365.com
 (2603:10b6:5:334::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Tue, 28 Jun 2022 15:03:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.120)
 smtp.mailfrom=flex.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.120 as permitted sender)
 receiver=protection.outlook.com; client-ip=144.49.247.120;
 helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.120) by
 DM6NAM11FT022.mail.protection.outlook.com (10.13.172.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 15:03:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bohBbZ53c6K89CqV1KTQ9J3bs7vWZGJhBkAVxSXmkILft+Vq2D8TfYErDKdx+hEy0JVYblAiV0vfd9DwtbUuR5sIaBdyBHbtYl+TJZFQdrbj8DU2pgfC7aRkChC4uhpzzmOTQhekyH9A5grSA2w0OY4KXhdb6Dt8ZikJx0x9EN1yajhADyHdc7ofd6rhgjFlbI/OwCvrGL2Acl3tgMAmvX75nlLiJl2iLXFHO0cnVbGqRGgQVmgeLfuxo1uxBi5vDhW/g2gzecoIjoev2P5XYVLtE2sbk3xoVNu8z5/nefqe/xGwWctKW99/dqSyXBULmnaaCon+AcHNnIUE7osggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fzQySbwnzXhQurf8jhpLzk+W95hM4W9YEUi+fTHw9UU=;
 b=TAt1F/3l4lYtWs84FrMi9KFG9EDxTyLlsCewp/tu/hsNe3h64+L+j1gRSrFtQjaFIocHFxri4zehlvhzVApsOaH63AVtxfhQ2hat4ZQTsqimHzmERO3tgtv3op2Wqk6ljq7MMmnG2lc50wLDkQ8IzYMxD0CQNsezJTSy1b2oH1wTYBvrnuYfnxomyiFFzYo43Y99I4B9xM4AOyod9Fq7gP9kBBL8YoV9jX8EOAXUe+cbsFi0qGJNtBROqo0jLFlfAUcUmubJXPTCbA03O0yBu/MoVSgF0PJYsZH/SmQkFsIY6DD4flG3LAlGPAmvEYiAdLynvcUQESbWIckStLh2Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by BN8PR08MB6372.namprd08.prod.outlook.com (2603:10b6:408:db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Tue, 28 Jun
 2022 15:03:30 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::960:23b3:fa5b:3337]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::960:23b3:fa5b:3337%7]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 15:03:29 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject:  =?big5?B?pl7C0DogW3Bob3NwaG9yLWlwbWktZmxhc2hdOiBzdGRwbHVzIGJ1aWxkIGZhaWxl?=
 =?big5?Q?d_before_building_the_host-tool_on_the_Host?=
Thread-Topic: [phosphor-ipmi-flash]: stdplus build failed before building the
 host-tool on the Host
Thread-Index: AQHYivlIwOfWwGWn8Eihft2hMXNPtg==
Date: Tue, 28 Jun 2022 15:03:29 +0000
Message-ID:  <DM6PR08MB5514E14B450A17E9CA173B4CDCB89@DM6PR08MB5514.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: f2291ecb-6bc4-1034-0627-a5244c0392c7
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=flex.com;
X-MS-Office365-Filtering-Correlation-Id: 4416cd0c-33d2-4269-1145-08da59175e68
x-ms-traffictypediagnostic: 	BN8PR08MB6372:EE_|DM6NAM11FT022:EE_|BYAPR08MB5941:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  WAt8GGXzvjwrt1p7Ta9zU+VwteZcl6tCex/FXAKBSkvp9Eldxwu+i4r3iS56C9mF6fMrTrbmjeqCJOKYRZ2gQ2wAB29yTv6EozJ3n7oT+ghaSUGktpdEwHP+ISLIeuCbYgih7O72K9iv1RG+VEjTTKj6NmWdAwkoui3UPRuhqqQJbv570MkfxCYqpV8rGr3AZEiiMcsAJLJLXsreIFmOlhS1MwlXdcKi8uY2wn5cIXLnaRBt403FWFjcsSBUTJhvUl9Vg+0o8xXOLxy0PiebDf1n1nwQdZ0AoWJaYCK/mQ2GJ1F3SCURBqZ//liYHIhqVoAWZd8nkTOH8I83FhQRnu7oj8ftlXD10CJlo4H7bnAwQhQi2HLxauAiQ7kTMUyyWdL9OyuRC9z3l1yOWQLYuuq1P6RNcuNgx1L0Wbtl9PfLBayzk1N9zOwV92E0Bx/wFBQc0VLp/EYSeJdFKz9RB4/2SJgL9ab9PRyHtfqtEQTG9wu6dIOHEIIacrs0wBN7i3KgN0R7lCSm6GTg4M6RRrpDRjoCstzwt8NI1gGkC9/IKERfBtMeaJuSayOp+KfMeY6Li/ibVSBRBPCEnynMAgf2NeTRDRwdoM3AZKx7JhsIx7k+gNwhjHI+WkYWh9AGJeenYDNQ3gnjtFsm7CoqB0UsWIA218F5+s5trjl5552BLwSYZMR6mWo2Jpo9CNCnJ11tygS3z5jU1vNQvbgrkky5l9UpqbFzMGUeCvMH2xbR/gv77uksjeM2F6tGdHD0Ktp7HPSr21h3Cwprgi4K3qm1zRRWXI4Z406RwtNS/9M=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR08MB5514.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(39860400002)(346002)(396003)(86362001)(9686003)(316002)(83380400001)(2906002)(122000001)(19627405001)(224303003)(26005)(7696005)(6916009)(6506007)(5660300002)(41300700001)(66556008)(66476007)(38100700002)(76116006)(64756008)(66446008)(4326008)(38070700005)(52536014)(33656002)(71200400001)(55016003)(91956017)(8936002)(186003)(478600001)(66946007);DIR:OUT;SFP:1102;
Content-Type: multipart/alternative;
	boundary="_000_DM6PR08MB5514E14B450A17E9CA173B4CDCB89DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR08MB6372
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	bcdf209a-88f0-4c1f-dd0d-08da59175c9f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	N38sJG+lI/08nXbgXthKRd2VkoBXrcuoqt3Bdnz15Yj2VdPUPBHUGhygcZnY+bfPrlaZlUJhVEhcSZlMwxXR1PwLTWdma09IvYJk0quywjbEKtoKSxnRzekb8riT+3UUAkqMIixjEs64ryPrvG/0snkATIH7FX/sj6ickTzgu4RFm9T5RGCnLIVAF3w87Xzuc+6ws4Y/HsC0+3NPG3ENIk704+mUNhI4Yl33vBVD/zgx+lSB++ooPbEDCINAq9T1cCD5tx3+dtjq2L2eYyhlRg9cbXx24g4fwfAlGzdl5lxmoLzjViwd8NLDVEmQZgCr5AJvFFZE2pgltUso+mtgSQcrcciBV/QpI4reyKo/Yzx6VNzzamNtp+R7UKURYYcMlFv298/We+vSqxFDyZZO2SCPFYP2gNyZc2gGBSTqb5qcq2bKbqgWIJ5Hxndve8csF8My9U1xbz56Fav/ZxnyDjlz2gTJ0q0Lrpv6yj28A5TC7olxgb4GXqD5chldBVqFazMF1AkRF/o6LzDUlfaq/UazEwSsOhz/CXiLXZGaGuXCmPnzVCKg+E2EpORKM7yP9hXmhU+YDqOktXMI3l870sARIqyT2Be4kSsje8/yVfc9IeMrlT6Ro8EjLiNX1gkAljbE8ExaLop7QkDndoB8GjlvACbEZI9trIb30h9K5aEIC0FFDb0WVaQjbBhnw668iCbHsFWCihImgOH5Dm08F+YrQrTk6eNmUFVRdPh3wLHCoD/lIST4xfEQC77CIrZedoDsEjul2tLGBtJfu1JfmgqBfxiKlj+zJZmx/lhHj3rXGwisydttlcaaJ2flknjr2UAq9mPsligNnk9sGtp71w==
X-Forefront-Antispam-Report: 	CIP:144.49.247.120;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.ds.dlp.protect.symantec.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(396003)(376002)(346002)(39860400002)(40470700004)(46966006)(36840700001)(36860700001)(52536014)(186003)(70586007)(41300700001)(30864003)(82740400003)(83380400001)(86362001)(336012)(5660300002)(316002)(6916009)(8936002)(478600001)(4326008)(9686003)(26005)(40460700003)(55016003)(40480700001)(7696005)(6506007)(224303003)(81166007)(2906002)(356005)(33656002)(47076005)(82310400005)(19627405001)(70206006)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 15:03:31.4814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4416cd0c-33d2-4269-1145-08da59175e68
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e;Ip=[144.49.247.120];Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB5941
X-Proofpoint-ORIG-GUID: hJNvrMMuCWMY_eIK_wnLFAz3v9okqCOX
X-Proofpoint-GUID: hJNvrMMuCWMY_eIK_wnLFAz3v9okqCOX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-28_08,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 phishscore=0 clxscore=1011
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206280061
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

--_000_DM6PR08MB5514E14B450A17E9CA173B4CDCB89DM6PR08MB5514namp_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="big5"

SGkgUGF0cmljaywNCg0KVGhhbmtzIGZvciB5b3VyIHByb21wdCByZXBseSwgYW5kIHRoZSBpc3N1
ZSBpcyBzb2x2ZWQgYWZ0ZXIgaW5zdGFsbGluZyBVYnVudHUgImxpYmZtdC1kZXYiIHBhY2thZ2Uu
DQoNCj4+IERvIHlvdSBrbm93IHdoeSB5b3UgZGlzYWJsZWQgQysrMjA/ICBUaGlzIHNob3VsZG4n
dCBoYXZlIGJlZW4gbmVjZXNzYXJ5DQo+PiBhbmQgc29tZSBvZiBvdXIgY29kZSBub3cgcmVxdWly
ZXMgQysrMjAuDQoNCkkgZGlzYWJsZWQgQysrMjAgb2YgdGhlICJpcG1pLWJsb2ItdG9vbCIgcGFj
a2FnZSBiZWNhdXNlIEkgZ290IGVycm9ycyBiZWxvdzoNCj09PT09DQphcmNoZXJAYXJjaGVyLUFy
Y2hlckNpdHlNOmlwbWktYmxvYi10b29sJCAuL2Jvb3RzdHJhcC5zaA0KKyBhdXRvcmVjb25mIC12
IC1mIC1pDQphdXRvcmVjb25mOiBleHBvcnQgV0FSTklOR1M9DQphdXRvcmVjb25mOiBFbnRlcmlu
ZyBkaXJlY3RvcnkgJy4nDQphdXRvcmVjb25mOiBjb25maWd1cmUuYWM6IG5vdCB1c2luZyBHZXR0
ZXh0DQphdXRvcmVjb25mOiBydW5uaW5nOiBhY2xvY2FsIC0tZm9yY2UgLUkgbTQNCmNvbmZpZ3Vy
ZS5hYzozODogZXJyb3I6IGludmFsaWQgZmlyc3QgYXJndW1lbnQgYDIwJyB0byBBWF9DWFhfQ09N
UElMRV9TVERDWFgNCi91c3Ivc2hhcmUvYWNsb2NhbC9heF9jeHhfY29tcGlsZV9zdGRjeHgubTQ6
NTA6IEFYX0NYWF9DT01QSUxFX1NURENYWCBpcyBleHBhbmRlZCBmcm9tLi4uDQpjb25maWd1cmUu
YWM6Mzg6IHRoZSB0b3AgbGV2ZWwNCmF1dG9tNHRlOiBlcnJvcjogL3Vzci9iaW4vbTQgZmFpbGVk
IHdpdGggZXhpdCBzdGF0dXM6IDENCmFjbG9jYWw6IGVycm9yOiAvdXNyL2Jpbi9hdXRvbTR0ZSBm
YWlsZWQgd2l0aCBleGl0IHN0YXR1czogMQ0KYXV0b3JlY29uZjogZXJyb3I6IGFjbG9jYWwgZmFp
bGVkIHdpdGggZXhpdCBzdGF0dXM6IDENCj09PT09DQpEbyB5b3UgaGF2ZSBpZGVhcyBhYm91dCBo
b3cgdG8gc29sdmUgaXQgY29ycmVjdGx5Pw0KDQpJbiBhZGRpdGlvbiwgaSBoYXZlIHN0YXJ0ZWQg
dG8gYnVpbGQgdGhlIGJ1cm5fbXlfYm1jICh0aGUgaG9zdC10b29sKSBvbiB0aGUgSG9zdCBieSBj
bG9uaW5nIHRoZSAicGhvc3Bob3ItaXBtaS1mbGFzaCIgc291cmNlLiBUaGVyZSBhcmUgc29tZSBx
dWVzdGlvbnMgY2FtZSBvdXQ6DQoNCiAgKiAgIFRoZSAicGhvc3Bob3ItaXBtaS1mbGFzaCIgcGFj
a2FnZSBzZWVtcyBiZWNhbWUgdG8gdXNlICJtZXNvbiIgcmF0aGVyIHRoYW4gImJvb3RzdHJhcC5z
aCIsIHNvIEkgcnVuIHRoZXNlIGNvbW1hbmRzIGluIHRoZSBzb3VyY2UgZGlyZWN0b3J5LiBJcyBp
dCBjb3JyZWN0Pw0KLS0tLS0NCm1lc29uIHNldHVwIC1EYm1jLWJsb2ItaGFuZGxlcj1kaXNhYmxl
ZCBidWlsZGRpcg0KbmluamEgLUMgYnVpbGRkaXINCm5pbmphIC1DIGJ1aWxkZGlyIGluc3RhbGwN
CiAgKiAgIC0tLS0tDQoNCiAgKg0KQWZ0ZXIgcnVubmluZyAibWVzb24gc2V0dXAgLURibWMtYmxv
Yi1oYW5kbGVyPWRpc2FibGVkIGJ1aWxkZGlyIiwgaXQgb2NjdXJyZWQgZGVwZW5kZW5jeSBlcnJv
cnMsIGxpa2UgJ3NkYnVzcGx1cycsICdwaG9zcGhvci1kYnVzLWludGVyZmFjZXMnLCAnbGliaXBt
aWQnLCBhbmQgc28gb24gaXMgcmVxdWlyZWQgcmVzcGVjdGl2ZWx5LCBpcyBpdCBjb3JyZWN0Pw0K
DQogICogICBJIGZvciBub3cgaGF2ZSB0cmllZCB0byBpbnN0YWxsIHRoZXNlIGRlcGVuZGVuY2ll
cyBvbmUtYnktb25lLCBidXQgYmUgc3R1Y2sgYXQgJ2xpYmlwbWlkJy4gVGhhdCBpcyBJIGNsb25l
IHRoZSAicGhvc3Bob3ItaG9zdC1pcG1pZCIgYW5kIHJ1biAibWVzb24gYnVpbGRkaXIiIGNvbW1h
bmQgdG8gYnVpbGQgaXQsIGhvd2V2ZXIsIEkgZ290IGFuIGVycm9yIGluIGJsb3cgYW5kIEkgY2Fu
J3Qgc29sdmUgaXQuIENvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBtZSBzb21lIHN1Z2dlc3Rpb25zPw0K
ICAqICAgPT09PT0NCiAgKiAgIERlcGVuZGVuY3kgc2RldmVudHBsdXMgZnJvbSBzdWJwcm9qZWN0
IHN1YnByb2plY3RzL3NkZXZlbnRwbHVzIGZvdW5kOiBZRVMgMC4xDQpEZXBlbmRlbmN5IHN5c3Rl
bWQgZm91bmQ6IFlFUyAyNDkgKGNhY2hlZCkNClJ1bi10aW1lIGRlcGVuZGVuY3kgbGliY3J5cHRv
IGZvdW5kOiBZRVMgMy4wLjINCg0KbWVzb24uYnVpbGQ6ODk6MDogRVJST1I6IEMrKyBzaGFyZWQg
b3Igc3RhdGljIGxpYnJhcnkgJ3BhbScgbm90IGZvdW5kDQo9PT09PQ0KDQpUaGFua3MuDQoNClJl
Z2FyZHMsDQpDaHJpcyBDaGVuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQqx
SKXzqsw6IFBhdHJpY2sgV2lsbGlhbXMNCqR3tsewZTogrFC0waRHLCAyMDIyIDYgpOsgMjggpOkg
pFWkyCAwNzoyMA0Kpqyl86rMOiBDaHJpcyBDaGVuIChUUEkpDQqwxqW7OiBvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmcNCqVEpq46IFJlOiBbcGhvc3Bob3ItaXBtaS1mbGFzaF06IHN0ZHBsdXMgYnVp
bGQgZmFpbGVkIGJlZm9yZSBidWlsZGluZyB0aGUgaG9zdC10b29sIG9uIHRoZSBIb3N0DQoNCk9u
IFR1ZSwgSnVuIDI4LCAyMDIyIGF0IDA4OjQzOjM0QU0gKzAwMDAsIENocmlzIENoZW4gKFRQSSkg
d3JvdGU6DQo+IEFuZCBlYWNoIGxpYnJhcnkgYW5kIHRvb2wgaXMgYnVpbHQgc3VjY2Vzc2Z1bChv
bmx5IG9uZSB0aGluZyB0aGF0IGlzIEkgaGFkIHRvIGRpc2FibGUgQysrMjAgZm9yIHRoZSBpcG1p
LWJsb2ItdG9vbCwgb3RoZXJzIHdlcmUgZmluZSkgdW50aWxJIHN0YXJ0ZWQgdG8gYnVpbGQgdGhl
IHN0ZHBsdXMuIEkgZW5jb3VudGVyZWQgYSBidWlsZCBmYWlsZWQgaXNzdWUgYXMgYmVsb3cuIEl0
IGxvb2tzIGxpa2UgdGhlcmUgaXMgYSBwcm9ibGVtIGZvciB1c2luZyBsaWJmbXQuYSwgSSB0cmll
ZCB0byBmaWd1cmUgb3V0IGEgc29sdXRpb24gb24gZ29vZ2xlIGJ1dCBub3RoaW5nIGlzIHJlbGF0
ZWQgdG8gdGhpcy4gQ291bGQgYW55b25lIGhlbHAgb24gdGhpcz8gVGhhbmtzLg0KDQpEbyB5b3Ug
a25vdyB3aHkgeW91IGRpc2FibGVkIEMrKzIwPyAgVGhpcyBzaG91bGRuJ3QgaGF2ZSBiZWVuIG5l
Y2Vzc2FyeQ0KYW5kIHNvbWUgb2Ygb3VyIGNvZGUgbm93IHJlcXVpcmVzIEMrKzIwLg0KDQo+DQo+
ID09PT09DQo+IGFyY2hlckBhcmNoZXItQXJjaGVyQ2l0eU06c3RkcGx1cyQNCj4gYXJjaGVyQGFy
Y2hlci1BcmNoZXJDaXR5TTpzdGRwbHVzJCBtZXNvbiBzZXR1cCAtRGV4YW1wbGVzPWZhbHNlIC1E
dGVzdHM9ZGlzYWJsZWQgYnVpbGRkaXINCj4gVGhlIE1lc29uIGJ1aWxkIHN5c3RlbQ0KPiBWZXJz
aW9uOiAwLjYxLjINCj4gU291cmNlIGRpcjogL2hvbWUvYXJjaGVyL0Rvd25sb2Fkcy9ob3N0LXRv
b2wvc3RkcGx1cw0KPiBCdWlsZCBkaXI6IC9ob21lL2FyY2hlci9Eb3dubG9hZHMvaG9zdC10b29s
L3N0ZHBsdXMvYnVpbGRkaXINCj4gQnVpbGQgdHlwZTogbmF0aXZlIGJ1aWxkDQo+IFByb2plY3Qg
bmFtZTogc3RkcGx1cw0KPiBQcm9qZWN0IHZlcnNpb246IDAuMQ0KPiBDKysgY29tcGlsZXIgZm9y
IHRoZSBob3N0IG1hY2hpbmU6IGMrKyAoZ2NjIDExLjIuMCAiYysrIChVYnVudHUgMTEuMi4wLTE5
dWJ1bnR1MSkgMTEuMi4wIikNCj4gQysrIGxpbmtlciBmb3IgdGhlIGhvc3QgbWFjaGluZTogYysr
IGxkLmJmZCAyLjM4DQo+IEhvc3QgbWFjaGluZSBjcHUgZmFtaWx5OiB4ODZfNjQNCj4gSG9zdCBt
YWNoaW5lIGNwdTogeDg2XzY0DQo+IEZvdW5kIHBrZy1jb25maWc6IC91c3IvYmluL3BrZy1jb25m
aWcgKDAuMjkuMikNCj4gUnVuLXRpbWUgZGVwZW5kZW5jeSBmbXQgZm91bmQ6IFlFUyA4LjEuMg0K
DQpXaGVyZSBkaWQgdGhpcyBgZm10YCBjb21lIGZyb20/ICBVYnVudHUgaGFzIGBsaWJmbXQtZGV2
YCB0aGF0IHlvdSBjYW4NCmluc3RhbGwgd2hpY2ggaXMgdmVyc2lvbiA4LjEuMSBvbiBKYW1teSBy
aWdodCBub3cuDQoNCj4gTGlicmFyeSBkbCBmb3VuZDogWUVTDQo+IFJ1bi10aW1lIGRlcGVuZGVu
Y3kgbGlidXJpbmcgZm91bmQ6IFlFUyAyLjANCj4gQnVpbGQgdGFyZ2V0cyBpbiBwcm9qZWN0OiAx
DQo+DQo+IHN0ZHBsdXMgMC4xDQo+DQo+ICAgVXNlciBkZWZpbmVkIG9wdGlvbnMNCj4gICAgIGV4
YW1wbGVzOiBmYWxzZQ0KPiAgICAgdGVzdHMgICA6IGRpc2FibGVkDQo+DQo+IEZvdW5kIG5pbmph
LTEuMTAuMSBhdCAvdXNyL2Jpbi9uaW5qYQ0KPiBhcmNoZXJAYXJjaGVyLUFyY2hlckNpdHlNOnN0
ZHBsdXMkDQo+IGFyY2hlckBhcmNoZXItQXJjaGVyQ2l0eU06c3RkcGx1cyQNCj4gYXJjaGVyQGFy
Y2hlci1BcmNoZXJDaXR5TTpzdGRwbHVzJCBuaW5qYSAtQyBidWlsZGRpcg0KPiBuaW5qYTogRW50
ZXJpbmcgZGlyZWN0b3J5IGBidWlsZGRpcicNCj4gWzkvOV0gTGlua2luZyB0YXJnZXQgc3JjL2xp
YnN0ZHBsdXMuc28uMC4xDQo+IEZBSUxFRDogc3JjL2xpYnN0ZHBsdXMuc28uMC4xDQo+IGMrKyAg
LW8gc3JjL2xpYnN0ZHBsdXMuc28uMC4xIHNyYy9saWJzdGRwbHVzLnNvLjAuMS5wL3N0ZHBsdXNf
ZXhjZXB0aW9uLmNwcC5vIHNyYy9saWJzdGRwbHVzLnNvLjAuMS5wL3N0ZHBsdXNfc2lnbmFsLmNw
cC5vIHNyYy9saWJzdGRwbHVzLnNvLjAuMS5wL3N0ZHBsdXNfZGwuY3BwLm8gc3JjL2xpYnN0ZHBs
dXMuc28uMC4xLnAvc3RkcGx1c19mZF9jcmVhdGUuY3BwLm8gc3JjL2xpYnN0ZHBsdXMuc28uMC4x
LnAvc3RkcGx1c19mZF9kdXBhYmxlLmNwcC5vIHNyYy9saWJzdGRwbHVzLnNvLjAuMS5wL3N0ZHBs
dXNfZmRfaW1wbC5jcHAubyBzcmMvbGlic3RkcGx1cy5zby4wLjEucC9zdGRwbHVzX2ZkX21hbmFn
ZWQuY3BwLm8gc3JjL2xpYnN0ZHBsdXMuc28uMC4xLnAvc3RkcGx1c19mZF9tbWFwLmNwcC5vIHNy
Yy9saWJzdGRwbHVzLnNvLjAuMS5wL3N0ZHBsdXNfZmRfb3BzLmNwcC5vIHNyYy9saWJzdGRwbHVz
LnNvLjAuMS5wL3N0ZHBsdXNfaW9fdXJpbmcuY3BwLm8gLVdsLC0tYXMtbmVlZGVkIC1XbCwtLW5v
LXVuZGVmaW5lZCAtc2hhcmVkIC1mUElDIC1XbCwtLXN0YXJ0LWdyb3VwIC1XbCwtc29uYW1lLGxp
YnN0ZHBsdXMuc28uMCAvdXNyL2xvY2FsL2xpYi9saWJmbXQuYSAtbGRsIC91c3IvbGliL3g4Nl82
NC1saW51eC1nbnUvbGlidXJpbmcuc28gLVdsLC0tZW5kLWdyb3VwDQo+IC91c3IvYmluL2xkOiAv
dXNyL2xvY2FsL2xpYi9saWJmbXQuYShmb3JtYXQuY2Mubyk6IHdhcm5pbmc6IHJlbG9jYXRpb24g
YWdhaW5zdCBgc3Rkb3V0QEBHTElCQ18yLjIuNScgaW4gcmVhZC1vbmx5IHNlY3Rpb24gYC50ZXh0
Jw0KPiAvdXNyL2Jpbi9sZDogL3Vzci9sb2NhbC9saWIvbGliZm10LmEoZm9ybWF0LmNjLm8pOiBy
ZWxvY2F0aW9uIFJfWDg2XzY0X1BDMzIgYWdhaW5zdCBzeW1ib2wgYHN0ZGVyckBAR0xJQkNfMi4y
LjUnIGNhbiBub3QgYmUgdXNlZCB3aGVuIG1ha2luZyBhIHNoYXJlZCBvYmplY3Q7IHJlY29tcGls
ZSB3aXRoIC1mUElDDQoNCkhvd2V2ZXIgeW91IG9idGFpbmVkIHlvdXIgbGliZm10LCBpdCB3YXMg
Y29tcGlsZWQgaW5jb3JyZWN0bHkuICBJdA0Kc2hvdWxkbid0IGhhdmUgYSBzdGF0aWMgbGlicmFy
eSBidXQgYSBkeW5hbWljIG9uZS4NCg0KVGhlIGBsaWJmbXQtZGV2YCBwYWNrYWdlIGhhcyBgbGli
Zm10LnNvYCB3aGljaCBzaG91bGQgYmUgc3VmZmljaWVudCBmb3INCmxpbmtpbmcgYXMgYSBzaGFy
ZWQgbGlicmFyeS4NCg0KLS0NClBhdHJpY2sgV2lsbGlhbXMNCgpMZWdhbCBEaXNjbGFpbWVyIDoK
VGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UgbWF5IGJlIHByaXZpbGVn
ZWQgYW5kIGNvbmZpZGVudGlhbC4gCkl0IGlzIGludGVuZGVkIHRvIGJlIHJlYWQgb25seSBieSB0
aGUgaW5kaXZpZHVhbCBvciBlbnRpdHkgdG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQgCm9yIGJ5IHRo
ZWlyIGRlc2lnbmVlLiBJZiB0aGUgcmVhZGVyIG9mIHRoaXMgbWVzc2FnZSBpcyBub3QgdGhlIGlu
dGVuZGVkIHJlY2lwaWVudCwgCnlvdSBhcmUgb24gbm90aWNlIHRoYXQgYW55IGRpc3RyaWJ1dGlv
biBvZiB0aGlzIG1lc3NhZ2UsIGluIGFueSBmb3JtLCAKaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4g
SWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGluIGVycm9yLCAKcGxlYXNlIGltbWVk
aWF0ZWx5IG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgb3IgZGVzdHJveSBhbnkgY29weSBv
ZiB0aGlzIG1lc3NhZ2UhCg==

--_000_DM6PR08MB5514E14B450A17E9CA173B4CDCB89DM6PR08MB5514namp_
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="big5"

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Patrick,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks for your prompt reply, and the issue is solved after installing Ubun=
tu &quot;libfmt-dev&quot; package.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&gt;&gt; Do you know why you disabled C++20? &nbsp;This shouldn't have been=
 necessary&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
&gt;&gt; and some of our code now requires C++20.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I disabled C++20 of the &quot;ipmi-blob-tool&quot; package because I got er=
rors below:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
archer@archer-ArcherCityM:ipmi-blob-tool$ ./bootstrap.sh
<div>+ autoreconf -v -f -i</div>
<div>autoreconf: export WARNINGS=3D</div>
<div>autoreconf: Entering directory '.'</div>
<div>autoreconf: configure.ac: not using Gettext</div>
<div>autoreconf: running: aclocal --force -I m4</div>
<div>configure.ac:38: error: invalid first argument `20' to AX_CXX_COMPILE_=
STDCXX</div>
<div>/usr/share/aclocal/ax_cxx_compile_stdcxx.m4:50: AX_CXX_COMPILE_STDCXX =
is expanded from...</div>
<div>configure.ac:38: the top level</div>
<div>autom4te: error: /usr/bin/m4 failed with exit status: 1</div>
<div>aclocal: error: /usr/bin/autom4te failed with exit status: 1</div>
autoreconf: error: aclocal failed with exit status: 1<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Do you have ideas about how to solve it correctly?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
In addition, i have started to build the burn_my_bmc (the host-tool) on the=
 Host by cloning the &quot;phosphor-ipmi-flash&quot; source. There are some=
 questions came out:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<ul>
<li>The &quot;phosphor-ipmi-flash&quot; package seems became to use &quot;m=
eson&quot; rather than &quot;bootstrap.sh&quot;, so I run these commands in=
 the source directory. Is it correct?<br>
-----<br>
meson setup -Dbmc-blob-handler=3Ddisabled builddir<br>
ninja -C builddir<br>
ninja -C builddir install</li><li style=3D"display:block">-----<br>
<br>
</li><li>
<div>After running &quot;meson setup -Dbmc-blob-handler=3Ddisabled builddir=
&quot;, it occurred dependency errors, like 'sdbusplus', 'phosphor-dbus-int=
erfaces', 'libipmid', and so on is required respectively, is it correct?<sp=
an style=3D"background-color:rgb(255, 255, 255);display:inline !important">=
<br>
</span></div>
<span style=3D"background-color:rgb(255, 255, 255);display:inline !importan=
t"><br>
</span></li><li><span style=3D"background-color:rgb(255, 255, 255);display:=
inline !important">I for now have tried to install these dependencies one-b=
y-one, but be stuck at 'libipmid'. That is I clone the &quot;phosphor-host-=
ipmid&quot; and run &quot;meson builddir&quot; command to build it,
 however, I got an error in blow and I can't solve it. Could you please giv=
e me some suggestions?</span></li><li style=3D"display:block"><span style=
=3D"background-color:rgb(255, 255, 255);display:inline !important">=3D=3D=
=3D=3D=3D</span></li><li style=3D"display:block"><span style=3D"background-=
color:rgb(255, 255, 255);display:inline !important">Dependency sdeventplus =
from subproject subprojects/sdeventplus found: YES 0.1
<div>Dependency systemd found: YES 249 (cached)</div>
<div>Run-time dependency libcrypto found: YES 3.0.2</div>
<div><br>
</div>
<div>meson.build:89:0: ERROR: C++ shared or static library 'pam' not found<=
/div>
=3D=3D=3D=3D=3D</span></li></ul>
<div><span style=3D"background-color:rgb(255, 255, 255);display:inline !imp=
ortant">Thanks.</span></div>
<div><br>
</div>
<div>Regards,</div>
<div>Chris Chen</div>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>=B1H=A5=F3=AA=CC:</b> Patrick Williams<br>
<b>=A4w=B6=C7=B0e:</b> =ACP=B4=C1=A4G, 2022 6 =A4=EB 28 =A4=E9 =A4U=A4=C8 0=
7:20<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Chris Chen (TPI)<br>
<b>=B0=C6=A5=BB:</b> openbmc@lists.ozlabs.org<br>
<b>=A5D=A6=AE:</b> Re: [phosphor-ipmi-flash]: stdplus build failed before b=
uilding the host-tool on the Host
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText elementToProof">On Tue, Jun 28, 2022 at 08:43:34AM =
+0000, Chris Chen (TPI) wrote:<br>
&gt; And each library and tool is built successful(only one thing that is I=
 had to disable C++20 for the ipmi-blob-tool, others were fine) untilI star=
ted to build the stdplus. I encountered a build failed issue as below. It l=
ooks like there is a problem for using
 libfmt.a, I tried to figure out a solution on google but nothing is relate=
d to this. Could anyone help on this? Thanks.<br>
<br>
Do you know why you disabled C++20?&nbsp; This shouldn't have been necessar=
y<br>
and some of our code now requires C++20.<br>
<br>
&gt; <br>
&gt; =3D=3D=3D=3D=3D<br>
&gt; archer@archer-ArcherCityM:stdplus$<br>
&gt; archer@archer-ArcherCityM:stdplus$ meson setup -Dexamples=3Dfalse -Dte=
sts=3Ddisabled builddir<br>
&gt; The Meson build system<br>
&gt; Version: 0.61.2<br>
&gt; Source dir: /home/archer/Downloads/host-tool/stdplus<br>
&gt; Build dir: /home/archer/Downloads/host-tool/stdplus/builddir<br>
&gt; Build type: native build<br>
&gt; Project name: stdplus<br>
&gt; Project version: 0.1<br>
&gt; C++ compiler for the host machine: c++ (gcc 11.2.0 &quot;c++ (Ubuntu 1=
1.2.0-19ubuntu1) 11.2.0&quot;)<br>
&gt; C++ linker for the host machine: c++ ld.bfd 2.38<br>
&gt; Host machine cpu family: x86_64<br>
&gt; Host machine cpu: x86_64<br>
&gt; Found pkg-config: /usr/bin/pkg-config (0.29.2)<br>
&gt; Run-time dependency fmt found: YES 8.1.2<br>
<br>
Where did this `fmt` come from?&nbsp; Ubuntu has `libfmt-dev` that you can<=
br>
install which is version 8.1.1 on Jammy right now.<br>
<br>
&gt; Library dl found: YES<br>
&gt; Run-time dependency liburing found: YES 2.0<br>
&gt; Build targets in project: 1<br>
&gt; <br>
&gt; stdplus 0.1<br>
&gt; <br>
&gt;&nbsp;&nbsp; User defined options<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; examples: false<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; tests&nbsp;&nbsp; : disabled<br>
&gt; <br>
&gt; Found ninja-1.10.1 at /usr/bin/ninja<br>
&gt; archer@archer-ArcherCityM:stdplus$<br>
&gt; archer@archer-ArcherCityM:stdplus$<br>
&gt; archer@archer-ArcherCityM:stdplus$ ninja -C builddir<br>
&gt; ninja: Entering directory `builddir'<br>
&gt; [9/9] Linking target src/libstdplus.so.0.1<br>
&gt; FAILED: src/libstdplus.so.0.1<br>
&gt; c++&nbsp; -o src/libstdplus.so.0.1 src/libstdplus.so.0.1.p/stdplus_exc=
eption.cpp.o src/libstdplus.so.0.1.p/stdplus_signal.cpp.o src/libstdplus.so=
.0.1.p/stdplus_dl.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_create.cpp.o src=
/libstdplus.so.0.1.p/stdplus_fd_dupable.cpp.o
 src/libstdplus.so.0.1.p/stdplus_fd_impl.cpp.o src/libstdplus.so.0.1.p/stdp=
lus_fd_managed.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_mmap.cpp.o src/libs=
tdplus.so.0.1.p/stdplus_fd_ops.cpp.o src/libstdplus.so.0.1.p/stdplus_io_uri=
ng.cpp.o -Wl,--as-needed -Wl,--no-undefined
 -shared -fPIC -Wl,--start-group -Wl,-soname,libstdplus.so.0 /usr/local/lib=
/libfmt.a -ldl /usr/lib/x86_64-linux-gnu/liburing.so -Wl,--end-group<br>
&gt; /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): warning: relocation=
 against `stdout@@GLIBC_2.2.5' in read-only section `.text'<br>
&gt; /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): relocation R_X86_64=
_PC32 against symbol `stderr@@GLIBC_2.2.5' can not be used when making a sh=
ared object; recompile with -fPIC<br>
<br>
However you obtained your libfmt, it was compiled incorrectly.&nbsp; It<br>
shouldn't have a static library but a dynamic one.<br>
<br>
The `libfmt-dev` package has `libfmt.so` which should be sufficient for<br>
linking as a shared library.<br>
<br>
-- <br>
Patrick Williams<br>
</div>
</span></font></div>
</div>

<DIV>
Legal Disclaimer :<BR>
The information contained in this message may be privileged and confidentia=
l. <BR>
It is intended to be read only by the individual or entity to whom it is ad=
dressed <BR>
or by their designee. If the reader of this message is not the intended rec=
ipient, <BR>
you are on notice that any distribution of this message, in any form, <BR>
is strictly prohibited. If you have received this message in error, <BR>
please immediately notify the sender and delete or destroy any copy of this=
 message!<BR>
</DIV></body>
</html>

--_000_DM6PR08MB5514E14B450A17E9CA173B4CDCB89DM6PR08MB5514namp_--
