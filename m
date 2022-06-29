Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 575C155F9D6
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 09:58:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXv2z13smz3by6
	for <lists+openbmc@lfdr.de>; Wed, 29 Jun 2022 17:58:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=OLhKvYEx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex.com (client-ip=185.132.180.100; helo=mx07-002d6701.pphosted.com; envelope-from=prvs=31794a6e5f=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=OLhKvYEx;
	dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com [185.132.180.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXv2Q3NjWz2xKh
	for <openbmc@lists.ozlabs.org>; Wed, 29 Jun 2022 17:57:32 +1000 (AEST)
Received: from pps.filterd (m0211474.ppops.net [127.0.0.1])
	by mx08-002d6701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25T7pMHM010571;
	Wed, 29 Jun 2022 07:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=HljmNMTkLPV773lPb9BoVkRFf5LYoNKBLZ6ImSZ3pco=;
 b=OLhKvYExgOg3cZKoHX63xN1Nw4YKcDAi/RddaZTH3Kt7Alg2r/UuwCLfE5LpaRjDVvB9
 B38pS9LunixlquXo7UaECMtALeznxUA/AS4B4j3RTrLD1Srz76Sj/G9l5X25r2Bjfs1Y
 wPh5m0vrz6Iw2FeefjxieZVUKtHTDMJJWLhGcdJTXaYxB1yecl8OWiwYmvlIiR557Nqx
 xyH12LKjLYjfbhkZnhTbaa35OXbzl4vNDYC+Jv2/YT8BlspdWS1S2hzPFW8+Lrip9f7d
 XGHwQDyWoAAqX6gyIjuefV3u4qJAWc7UDyxYnJSIZMiTjd/eKk5SqopHm9ySEPV/Csfz uQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx08-002d6701.pphosted.com (PPS) with ESMTPS id 3gyy6rx5k5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jun 2022 07:57:25 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mIrzARRWHDuG+J1iIFSc21aizg52iqfDQJR4YaHgeHoBr12m4JduTncc8gKa59C1WLxZ6Cr3zRladhFO+bnHmsXBBFB+g9K3LSTXyioZbGkxD5SrTxLc4+W0CazUWU3PmqIP9ABf7inWf6A2RcyVs8t1w/HJ9JjUibRbfA/FND9+H6nxG/uNSeQN7awzHJliIXfJw5ZnCgXZ7IMTUGX/dqAlRCLXgg2rRLYhigKvMqOvTG8fItBmtVw0VzMcxbbHebtvmvAMRdoAzXjYZ9XYfut81ezNWjbedJB3W+zaMGGa+vsTuDyFtcGlp2P6RhO8iasE2kSiJe7fKqfqOviWJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HljmNMTkLPV773lPb9BoVkRFf5LYoNKBLZ6ImSZ3pco=;
 b=BKft8kSP/N+G1iKa6fx8HGu62BVm4buFX7LGheSfYehtNuaqPV7EQemXOk3JvvpMekllGOuyBot1GluVWCIODzBsa65vi2Sh/SqLMdZszQNWfpU4bToIRAc/QW29mG7g2bg+DESavQ0ZPBm9DM4OME3ztz7ijIqlcuynnY9zTqKo2G+tmtEjz3RmLrhOsIyeppuCSF3w75qCrvA7F+Fau4heZWQ/7YHw3y9gW9E1vm0C6nzdZzX+ScJOR/64AMCIOJU6o7ZRLnr3vfkoSIHYRw7ttU69h2hKKRuYYh3VkQFv/WLLnyziIfiwx41qKyRd9excrsqDhbGg5vJKvXpxBw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 144.49.247.27) smtp.rcpttodomain=google.com smtp.mailfrom=flex.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject header.from=flex.com;
 dkim=none (message not signed); arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=flex.com] dkim=[1,1,header.d=flex.com]
 dmarc=[1,1,header.from=flex.com])
Received: from BN9PR03CA0149.namprd03.prod.outlook.com (2603:10b6:408:fe::34)
 by BN6PR08MB3460.namprd08.prod.outlook.com (2603:10b6:405:6b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 29 Jun
 2022 07:57:22 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::93) by BN9PR03CA0149.outlook.office365.com
 (2603:10b6:408:fe::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.21 via Frontend
 Transport; Wed, 29 Jun 2022 07:57:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.27)
 smtp.mailfrom=flex.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.27 as permitted sender) receiver=protection.outlook.com;
 client-ip=144.49.247.27; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.27) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Wed, 29 Jun 2022 07:57:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eehJ8FmZ1j3YCOd3aDHKxxi3Xk9yAW8umaJ10945LoT/p0wPvsHYjBkr8GgGppellmjwZv/qWUBQR817MBXV9WTvhgDVaYwfC/7Mbii8RhXq7db+bSNR0qOjxSr2RqgKEKw/bwi3PFOtEMqBWRbrnvAjDebdcedf6SUIf4qWPNM9Cy0DRIaKabz6Q3OEFvRt3FPUr/tmXeeR/E1MCLWFeUqaHIMZzVbvhnJyZ8fW1RWAktN9kf+tRwZvfHiaOrIaiBrihhRzRr0lDsV27mtsGBoVvS+3olSvvehgrKImyEJcNJo4b/mNfP1EbVd2vr4IqF60AgGPD5R1OSpLL2Jz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HljmNMTkLPV773lPb9BoVkRFf5LYoNKBLZ6ImSZ3pco=;
 b=clxBYWuw0xm/Q2dNj438bhEVwBzOQGS2JSEqq2wWlJmT50Hx3857Y0Z4LQ3TavsueiFNq+C9YqMhcZp/OAaAY4tpUWXKMbJYg8kfMga6aKtZpsMdOHQ65nxLxRcGSv/P0UwwfOfDZey/nWQTpAcoltJPNpT/6sSl8grsnNTD43zJe6HYyIFoo4+VntE6RG2bJm4d5bkOOeCmqu6t3LVfOIR/cdWmNLyPt7Kepafq7j3SwQmw5TR+ACgBcFzwmuJaaF1UFc0RS6YYERQdmuxBirz4WuAQS+0xBmgvXZoYAIhMV0L4b682Z+Tu85IQLwMnyiDGJjoNckRLKBMHIKW24Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by SJ0PR08MB7994.namprd08.prod.outlook.com (2603:10b6:a03:3e9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Wed, 29 Jun
 2022 07:57:20 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::960:23b3:fa5b:3337]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::960:23b3:fa5b:3337%7]) with mapi id 15.20.5373.018; Wed, 29 Jun 2022
 07:57:20 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Willy Tu <wltu@google.com>, Brandon Kim <brandonkim@google.com>
Subject:  =?big5?B?pl7C0DogW3Bob3NwaG9yLWlwbWktZmxhc2hdOiBzdGRwbHVzIGJ1aWxkIGZhaWxl?=
 =?big5?Q?d_before_building_the_host-tool_on_the_Host?=
Thread-Topic: [phosphor-ipmi-flash]: stdplus build failed before building the
 host-tool on the Host
Thread-Index: AQHYivlIwOfWwGWn8Eihft2hMXNPtq1k9/iAgAABS4CAAPsSbQ==
Date: Wed, 29 Jun 2022 07:57:20 +0000
Message-ID:  <DM6PR08MB551486002B71DF6FE9FA3154DCBB9@DM6PR08MB5514.namprd08.prod.outlook.com>
References:  <DM6PR08MB5514E14B450A17E9CA173B4CDCB89@DM6PR08MB5514.namprd08.prod.outlook.com>
 <CALGRKGO0Y6FGTYu1rqH-YJCZgKXsPBHjjERmU7_5tOa0xg3M=A@mail.gmail.com>
 <CAHwn2XnPHOQzBq1MOpEG+4nD=AY3x40w1UV29jKK+w4pnvNEOQ@mail.gmail.com>
In-Reply-To:  <CAHwn2XnPHOQzBq1MOpEG+4nD=AY3x40w1UV29jKK+w4pnvNEOQ@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 3b72eaa4-57e7-cbf3-9e30-eb7aa2d85a60
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=flex.com;
X-MS-Office365-Filtering-Correlation-Id: 463c4d57-1c91-487f-a727-08da59a4ffab
x-ms-traffictypediagnostic: 	SJ0PR08MB7994:EE_|BN8NAM11FT034:EE_|BN6PR08MB3460:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  seXkrG+sbcM0XMNOngqbQPNwTpTrcAiVqqTL3BRw+oIWTOJZvfGFfwl3VSxx6OfE585MXMCt4SCM5RPQonB9pRo8UHk9oJshx07VvHfGnpgQKpWHVG3JckNWQ9PevHhvZDSWfsEDEeqJiytoCg6xCQzuCQMw1oLW3+UZzR4rVxTL5cNP356AhpFnvDsMHnW3rYpsQMNzyao2JdDfe2IVqZGPn8EuTUsqeImPi79kNf2MyXD68BuqSzyTWmo4dBSaij/7etzm1ddWsFRQhlRK2XyC2pZLTRqSEQVTtt18KkXlQS+d9J/9xABGp4TBtGnljDm/AM7os2dVJd5c9lP/psWeyRCUCFgCfVYwQeVTwr64kwWSPw8FQbuL8XKuOXafLOkEVXHE3MbIKiZY7iCWduakdyahPp84S6btAT1GH3ZxFSw0Rc0MLqv3/RxhEbfPwp9vCdPwlIRRbbnzhzofDiA0ZrduCIwMSo8Gbj/jy/ThF8P1t+UA5oyRhQBQ4Gjoh6XFiMdb1tBfpFPb4RdzhrOaqW+Qr/aFquOa27rCP6/0CNkMZ8zBeD4OnsWdfUjWyry7QPdJMxt2Zepf246cUSrdkP/0740mRxuWg/stUo6XmPN1XVhNnWlB63g9LEwvzV8yFhf7HDPpDWSGA4hI1/7me/HrOyqFGrkzdtDZKWREUwYnCrfE3Uvc7alnkpXxrgJT5S1GAiUfLe8FFmcjn0Mqs2SW96fs8in/EeCwzkRrGSp3zU+lxeyTm3U1w2RHDwhPNt/6Vc6nFVL4kEuESh/T4AAIwa1f3pSAxreHeR/C6Nht/wylLqc6dABgZ1IPrtnIBiQgvoVmS1emRCpAHbWMvJWRDqq8nXv7kUpf2RD7XRG78Avrygc+wQQKtsm2IGD+8qLPdNiV3ygnpte96WCQpv5YeVhVu0IsLarlaLg=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR08MB5514.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(366004)(396003)(376002)(136003)(316002)(19627235002)(91956017)(76116006)(4326008)(64756008)(66946007)(66556008)(66446008)(66476007)(966005)(71200400001)(478600001)(54906003)(110136005)(55016003)(52536014)(8936002)(84970400001)(5660300002)(2906002)(30864003)(38100700002)(33656002)(166002)(86362001)(224303003)(19627405001)(38070700005)(122000001)(9686003)(186003)(53546011)(41300700001)(7696005)(83380400001)(6506007)(26005);DIR:OUT;SFP:1102;
Content-Type: multipart/alternative;
	boundary="_000_DM6PR08MB551486002B71DF6FE9FA3154DCBB9DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB7994
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	9c5773b2-6f0c-47d8-de4d-08da59a4fe5c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6EPdAKCsv0euMrvlPB9L0wVOAtvA6NErLLyWGblnJ4boPAbWc9FV1VbAlYibLfaWYHunZiFhv4WSXPw0kcTZmrA1skLOsQ4uByRS950xUq7AO9YWjVLHh+MzkKX081/qu+1ljptiClrrwUaTVc3+u+6WlvrQIq43yK/6Boh5BfNvkMwBq1iOmrJF1wqiqjVMYABKRadOsg/k3mtmS7JrpLjmg+ruyDq9IfHzvc/JQ1Jgt49THjyyGlzc5XWD7tfvGcv5qZLmDH3QyyNB7xri60R82tV9KgDqs1/nKxi2Gae/lwGNwEgUvyXIr6V3Y3h+SrRZjPx+cDsq30TbRbcavOjjZqsA68TC9yoInMdfqlS2zvkYnqW57SK0LzZpJjT3U6ypNMsHWtrFCtM29xLFTfViSBLCMWNWV87MM72kthLbs4sG5BPsGsOoiSClhfUI8+M21OoaM7mG7n2O+2jxOf6uYMh1DB7lFSPZCcq7MCMro7tR07s21B4V/y3j3sFCE5rUi07uNNjfs+fx66U06Lii4ikRq5Md/0QjoCyMzv1gzXbtl/TtDcqGy6ym711DPvMLX82sMacWoG5tN8ULyOrqo3CDjrgZGSrGcnNom2pekOt64Yz6eQyYxOu/phmnIizmdRGaG13J/yFH2ZHpo9tqqjFPI6uhk6Lqp7RO5C3VZ515v6h9AZosj1Eo2WS7WBpy3EYbr88nkF5+edg0xV1Ux1RFsr8rgOyW+2caGeVcuXOwNLXRrp2s5e4h1wOTXHahPKnmcRricLPRbTvrwRq+8X/mJLBqoaVujcUq/8yqkqyp+DRzrEqSe+Q+9wXH4aFryJ0pck2VVZ9fiVwzSBPtnF1SMYFgwCEXSMhbWk7GUmpYH7RrOwpRuTslMcGqRfjEvAiSx88PRE9H+mtTMw==
X-Forefront-Antispam-Report: 	CIP:144.49.247.27;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.ds.dlp.protect.symantec.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(40470700004)(36840700001)(46966006)(81166007)(36860700001)(19627405001)(4326008)(8936002)(52536014)(224303003)(47076005)(82310400005)(70206006)(70586007)(166002)(30864003)(336012)(5660300002)(83380400001)(9686003)(84970400001)(19627235002)(53546011)(26005)(33656002)(966005)(478600001)(86362001)(40480700001)(2906002)(40460700003)(110136005)(82740400003)(356005)(41300700001)(316002)(6506007)(7696005)(54906003)(55016003)(186003)(36900700001)(579004);DIR:OUT;SFP:1102;
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2022 07:57:22.3107
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 463c4d57-1c91-487f-a727-08da59a4ffab
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e;Ip=[144.49.247.27];Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: 	BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR08MB3460
X-Proofpoint-ORIG-GUID: LdgVGT940An8TxP0cuUgtT9-_lcdr1vj
X-Proofpoint-GUID: LdgVGT940An8TxP0cuUgtT9-_lcdr1vj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-28_11,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206290028
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

--_000_DM6PR08MB551486002B71DF6FE9FA3154DCBB9DM6PR08MB5514namp_
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64

SGkgQnJhbmRvbiBhbmQgV2lsbHksDQoNCiAgKiAgIEZpcnN0IG9mIGFsbCwgSSB3b3VsZCBsaWtl
IHRvIHNheSB0aGFua3MgZm9yIHlvdXIgYW5zd2VyIGFuZCBjb25maXJtYXRpb24sIHRoZSBwcm9i
bGVtcyBJIGxpc3RlZCBhcmUgc29sdmVkLg0KDQogICogICBGb3IgQnJhbmRvbidzIHF1ZXN0aW9u
LA0KICAqICAgPiBJdCBpcyB0b3RhbGx5IHBvc3NpYmxlIHRoYXQgb3VyIGluc3RydWN0aW9ucyBp
biB0aGUgUkVBRE1FIGlzIG5vdCB1cCB0byBkYXRlIGFueW1vcmUsIGJ1dCBqdXN0IHRvIG1ha2Ug
c3VyZSAtIGFyZSB5b3UgYnVpbGRpbmcgZWFjaCBvZiB0aGUgY29tcG9uZW50cyBhcyBzcGVjaWZp
ZWQgYnkgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvcGhvc3Bob3ItaXBtaS1mbGFzaCNidWls
ZGluZy10aGUtaG9zdC10b29sPw0KICAqDQpZZXMsIEkgZm9sbG93ZWQgdGhlIFJFQURNRS5tZCB0
byBidWlsZCBlYWNoIG9mIHRoZSBjb21wb25lbnRzLg0KDQogICogICBIb3dldmVyLCBJIGVuY291
bnRlcmVkIG90aGVyIGZhdGFsIGVycm9ycyB3aGVuIGJ1aWxkaW5nIHRoZSAicGhvc3Bob3ItaG9z
dC1pcG1pZCIgcGFja2FnZSBhcyBiZWxvdy4gKE92ZXJhbGwgdGhlcmUgYXJlIHRocmVlIGtpbmRz
IG9mIGZhdGFsIGVycm9ycywgd2hpY2ggaXMgbWlzc2luZyBndGVzdC5oLCBqc29uLmhwcCwgYW5k
IGxvZy5ocHAsIHRoYXQgb2NjdXJlZCBpbiBzZXZlcmFsIGZpbGVzLCBzbyBJIGp1c3QgbGlzdCBv
bmUgbWVzc2FnZSBvZiBlYWNoIGVycm9yIGZvciByZWZlcmVuY2UuKQ0KICAqICAgPT09PT0NCiAg
KiAgIC4uL3N1YnByb2plY3RzL3Bob3NwaG9yLW9iam1nci9saWJtYXBwZXIvdGVzdC9tYXBwZXIu
Y3BwOjQ6MTA6IGZhdGFsIGVycm9yOiBndGVzdC9ndGVzdC5oOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5DQogICogICAgICAgNCB8ICNpbmNsdWRlIDxndGVzdC9ndGVzdC5oPg0KICAqICAgLi4v
ZW50aXR5X21hcF9qc29uLmhwcDo1OjEwOiBmYXRhbCBlcnJvcjogbmxvaG1hbm4vanNvbi5ocHA6
IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCiAgKiAgICAgICA1IHwgI2luY2x1ZGUgPG5sb2ht
YW5uL2pzb24uaHBwPg0KICAqICAgLi4vaW5jbHVkZS9pcG1pZC9tZXNzYWdlLmhwcDoyNjoxMDog
ZmF0YWwgZXJyb3I6IHBob3NwaG9yLWxvZ2dpbmcvbG9nLmhwcDogTm8gc3VjaCBmaWxlIG9yIGRp
cmVjdG9yeQ0KICAqICAgICAgMjYgfCAjaW5jbHVkZSA8cGhvc3Bob3ItbG9nZ2luZy9sb2cuaHBw
Pg0KICAqICAgPT09PT0NCiAgKg0KICAqICAgRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb25zIG9u
IHRoaXM/DQogICoNCiAgKiAgIEJUVy4gSSB1c2UgZm9sbG93aW5nIGNvbW1hbmRzIHRvIGJ1aWxk
IHRoZSAicGhvc3Bob3ItaG9zdC1pcG1pZCIgcGFja2FnZSwgaXQgc2hvdWxkIGJlIGNvcnJlY3Qs
IHJpZ2h0Pw0KICAqICAgLS0tLS0NCiAgKiAgIG1lc29uIHNldHVwIC1EdGVzdHM9ZGlzYWJsZWQg
YnVpbGRkaXINCiAgKiAgIG5pbmphIC1DIGJ1aWxkZGlyDQogICogICBuaW5qYSAtQyBidWlsZGRp
ciBpbnN0YWxsDQogICogICAtLS0tLQ0KDQogICogICBJIGRvbid0IGluc2lzdCB0byBidWlsZCBs
b2NhbGx5LCBzbyBhcyBwZXIgeW91ciByZWNvbW1lbmRhdGlvbiBJJ20gdHJ5aW5nIHRvIGJ1aWxk
IGl0IGJ5IHVzaW5nIGRvY2tlci4gSG93ZXZlciwgSSBoYXZlIGxpbWl0IGNhcGFiaWxpdHkgd2l0
aCBkb2NrZXIsIEkgZm9yIG5vdyBtZXQgYSBxdWVzdGlvbiBvbiBidWlsZGluZyBkb2NrZXIgaW1h
Z2UgYnkgdXNpbmcgdGhlICJidWlsZC11bml0LXRlc3QtZG9ja2VyIiBzY3JpcHQgeW91IG1lbnRp
b25lZCwgdGhhdCBpcyBhZnRlciBpbnN0YWxsaW5nIHRoZSBkb2NrZXItZGVza3RvcCBvbiBteSBI
b3N0LCBJIHJlZmVycmVkIHRvIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2RvY3MvYmxvYi9t
YXN0ZXIvdGVzdGluZy9ydW4tdGVzdC1kb2NrZXIubWQjYnVpbGQtZG9ja2VyLWltYWdlIHRvIGJ1
aWxkIHRoZSBkb2NrZXIgaW1hZ2UsIG9mIGNvdXJzZSwgSSByZXBsYWNlIHRoZSBjb21tYW5kIGFz
IGJlbG93LA0KDQouL3NjcmlwdHMvYnVpbGQtcWVtdS1yb2JvdC1kb2NrZXIuc2gNCg0KICAqICAg
VGhlbiwgdGhlIGVycm9yIGNhbWUgb3V0IGFmdGVyIHNldmVyYWwgbWludXRlcy4gKEkgcmV0cmll
ZCBmZXcgdGltZXMsIHNvbWUgaW1hZ2VzIGFyZSBhbHJlYWR5IGV4aXN0cy4pIENvdWxkIHlvdSBo
ZWxwIHRvIHRha2UgYSBsb29rIGF0IHRoaXMsIGFuZCBnaXZlIG1lIHNvbWUgc3VnZ2VzdGlvbnMg
YXMgd2VsbD8NCiAgKiAgID09PT09DQogICogICBhcmNoZXJAYXJjaGVyLUFyY2hlckNpdHlNOm9w
ZW5ibWMtYnVpbGQtc2NyaXB0cyQgLi9zY3JpcHRzL2J1aWxkLXVuaXQtdGVzdC1kb2NrZXINCiAg
KiAgIEltYWdlIG9wZW5ibWMvdWJ1bnR1LXVuaXQtdGVzdC1iYXNlOjIwMjItVzI2LWU3OTc2N2U1
Mzc4ZDVhMGYgYWxyZWFkeSBleGlzdHMuICBTa2lwcGluZy4NCkltYWdlIG9wZW5ibWMvdWJ1bnR1
LXVuaXQtdGVzdC11c2NpbGFiLWNlcmVhbDoyMDIyLVcyNi1hYjcyZDQ0OTU5NzllODMwIGFscmVh
ZHkgZXhpc3RzLiAgU2tpcHBpbmcuDQpJbWFnZSBvcGVuYm1jL3VidW50dS11bml0LXRlc3Qtbmxv
aG1hbm4tanNvbjoyMDIyLVcyNi1mZmJhODA5MTcwZWIwYTQxIGFscmVhZHkgZXhpc3RzLiAgU2tp
cHBpbmcuDQpJbWFnZSBvcGVuYm1jL3VidW50dS11bml0LXRlc3QtbmFpb3MtZnVuY3Rpb24yOjIw
MjItVzI2LTNiODc2NzU2YmI3NmJlMjMgYWxyZWFkeSBleGlzdHMuICBTa2lwcGluZy4NCkltYWdl
IG9wZW5ibWMvdWJ1bnR1LXVuaXQtdGVzdC1jbGl1dGlscy1jbGkxMToyMDIyLVcyNi1mNTNiNTVi
ZWEzMGIyMWM2IGFscmVhZHkgZXhpc3RzLiAgU2tpcHBpbmcuDQpJbWFnZSBvcGVuYm1jL3VidW50
dS11bml0LXRlc3QtbGlidm5jLWxpYnZuY3NlcnZlcjoyMDIyLVcyNi05MGQzYWNiMmEwZGY5NjE3
IGFscmVhZHkgZXhpc3RzLiAgU2tpcHBpbmcuDQpJbWFnZSBvcGVuYm1jL3VidW50dS11bml0LXRl
c3QtY3BwYWxsaWFuY2UtdXJsOjIwMjItVzI2LTQ2MGYzMTc1MDNiYTk0MjIgYWxyZWFkeSBleGlz
dHMuICBTa2lwcGluZy4NCkltYWdlIG9wZW5ibWMvdWJ1bnR1LXVuaXQtdGVzdC1ib29zdDoyMDIy
LVcyNi1kODc2MjYzMDkwNzFmNjVmIGFscmVhZHkgZXhpc3RzLiAgU2tpcHBpbmcuDQpJbWFnZSBv
cGVuYm1jL3VidW50dS11bml0LXRlc3QtY2F0Y2hvcmctY2F0Y2gyOjIwMjItVzI2LTM0MzkwMzhl
NjdlODIzMDQgYWxyZWFkeSBleGlzdHMuICBTa2lwcGluZy4NCkltYWdlIG9wZW5ibWMvdWJ1bnR1
LXVuaXQtdGVzdC1sZWV0aG9tYXNvbi10aW55eG1sMjoyMDIyLVcyNi0zMjNlZmVmZjlkYjUzMzgy
IGFscmVhZHkgZXhpc3RzLiAgU2tpcHBpbmcuDQpJbWFnZSBvcGVuYm1jL3VidW50dS11bml0LXRl
c3QtZmFjZWJvb2tleHBlcmltZW50YWwtbGlidW5pZmV4OjIwMjItVzI2LTFlZmY2ZWU0MWIyNWQ3
ZTEgYWxyZWFkeSBleGlzdHMuICBTa2lwcGluZy4NCkltYWdlIG9wZW5ibWMvdWJ1bnR1LXVuaXQt
dGVzdC1saW51eC10ZXN0LXByb2plY3QtbGNvdjoyMDIyLVcyNi0xMzY5MDY3NWQ0Y2RhOTU2IGFs
cmVhZHkgZXhpc3RzLiAgU2tpcHBpbmcuDQpJbWFnZSBvcGVuYm1jL3VidW50dS11bml0LXRlc3Qt
Zm10bGliLWZtdDoyMDIyLVcyNi04YzA4ODE3ZWU3NmYyOTZhIGFscmVhZHkgZXhpc3RzLiAgU2tp
cHBpbmcuDQpJbWFnZSBvcGVuYm1jL3VidW50dS11bml0LXRlc3QtZ29vZ2xlLWdvb2dsZXRlc3Q6
MjAyMi1XMjYtNDE3NTViYTdmZTc3MGQxZSBhbHJlYWR5IGV4aXN0cy4gIFNraXBwaW5nLg0KSW1h
Z2Ugb3BlbmJtYy91YnVudHUtdW5pdC10ZXN0LXRyaXN0YW5wZW5tYW4tdmFsaWpzb246MjAyMi1X
MjYtMmQ1NTk1NWZmZWE4MjAxOCBhbHJlYWR5IGV4aXN0cy4gIFNraXBwaW5nLg0KSW1hZ2Ugb3Bl
bmJtYy91YnVudHUtdW5pdC10ZXN0LW9wZW4tcG93ZXItcGRiZzoyMDIyLVcyNi1lYTEzMzhiN2Q1
YmNmNzE3IGFscmVhZHkgZXhpc3RzLiAgU2tpcHBpbmcuDQpJbWFnZSBvcGVuYm1jL3VidW50dS11
bml0LXRlc3Qtb3BlbmJtYy1zZGJ1c3BsdXM6MjAyMi1XMjYtNGRlM2RlNmE3ZGQ3NGM3MiBhbHJl
YWR5IGV4aXN0cy4gIFNraXBwaW5nLg0KSW1hZ2Ugb3BlbmJtYy91YnVudHUtdW5pdC10ZXN0LW9w
ZW5ibWMtc3RkcGx1czoyMDIyLVcyNi1mY2M2ZDBkODc4ZDgyNDM1IGFscmVhZHkgZXhpc3RzLiAg
U2tpcHBpbmcuDQpJbWFnZSBvcGVuYm1jL3VidW50dS11bml0LXRlc3Qtb3BlbmJtYy1ncGlvcGx1
czoyMDIyLVcyNi02ZTEyZWE5ZTI4YTM4YTQ1IGFscmVhZHkgZXhpc3RzLiAgU2tpcHBpbmcuDQpJ
bWFnZSBvcGVuYm1jL3VidW50dS11bml0LXRlc3Qtb3BlbmJtYy1zZGV2ZW50cGx1czoyMDIyLVcy
Ni0wNzdjMTVlZmU2MjAyNmQ5IGFscmVhZHkgZXhpc3RzLiAgU2tpcHBpbmcuDQogICogICBQYWNr
YWdlIG9wZW5ibWMvbGludXggZmFpbGVkIQ0KVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxh
c3QpOg0KICBGaWxlICIvaG9tZS9hcmNoZXIvRG93bmxvYWRzL29wZW5ibWMtYnVpbGQtc2NyaXB0
cy8uL3NjcmlwdHMvYnVpbGQtdW5pdC10ZXN0LWRvY2tlciIsIGxpbmUgODUyLCBpbiA8bW9kdWxl
Pg0KICAgIFBhY2thZ2UuZ2VuZXJhdGVfYWxsKCkNCiAgRmlsZSAiL2hvbWUvYXJjaGVyL0Rvd25s
b2Fkcy9vcGVuYm1jLWJ1aWxkLXNjcmlwdHMvLi9zY3JpcHRzL2J1aWxkLXVuaXQtdGVzdC1kb2Nr
ZXIiLCBsaW5lIDM5NiwgaW4gZ2VuZXJhdGVfYWxsDQogICAgcmFpc2UgdC5leGNlcHRpb24NCiAg
RmlsZSAiL2hvbWUvYXJjaGVyL0Rvd25sb2Fkcy9vcGVuYm1jLWJ1aWxkLXNjcmlwdHMvLi9zY3Jp
cHRzL2J1aWxkLXVuaXQtdGVzdC1kb2NrZXIiLCBsaW5lIDM2NSwgaW4gcnVuDQogICAgRG9ja2Vy
LmJ1aWxkKHNlbGYucGFja2FnZSwgdGFnLCBkb2NrZXJmaWxlKQ0KICBGaWxlICIvaG9tZS9hcmNo
ZXIvRG93bmxvYWRzL29wZW5ibWMtYnVpbGQtc2NyaXB0cy8uL3NjcmlwdHMvYnVpbGQtdW5pdC10
ZXN0LWRvY2tlciIsIGxpbmUgNjIwLCBpbiBidWlsZA0KICAgIGRvY2tlci5idWlsZCgNCiAgRmls
ZSAiL2hvbWUvYXJjaGVyLy5sb2NhbC9saWIvcHl0aG9uMy4xMC9zaXRlLXBhY2thZ2VzL3NoLnB5
IiwgbGluZSAxNTY2LCBpbiBfX2NhbGxfXw0KICAgIHJldHVybiBSdW5uaW5nQ29tbWFuZChjbWQs
IGNhbGxfYXJncywgc3RkaW4sIHN0ZG91dCwgc3RkZXJyKQ0KICBGaWxlICIvaG9tZS9hcmNoZXIv
LmxvY2FsL2xpYi9weXRob24zLjEwL3NpdGUtcGFja2FnZXMvc2gucHkiLCBsaW5lIDgyMiwgaW4g
X19pbml0X18NCiAgICBzZWxmLndhaXQoKQ0KICBGaWxlICIvaG9tZS9hcmNoZXIvLmxvY2FsL2xp
Yi9weXRob24zLjEwL3NpdGUtcGFja2FnZXMvc2gucHkiLCBsaW5lIDg3OSwgaW4gd2FpdA0KICAg
IHNlbGYuaGFuZGxlX2NvbW1hbmRfZXhpdF9jb2RlKGV4aXRfY29kZSkNCiAgRmlsZSAiL2hvbWUv
YXJjaGVyLy5sb2NhbC9saWIvcHl0aG9uMy4xMC9zaXRlLXBhY2thZ2VzL3NoLnB5IiwgbGluZSA5
MDUsIGluIGhhbmRsZV9jb21tYW5kX2V4aXRfY29kZQ0KICAgIHJhaXNlIGV4Yw0Kc2guRXJyb3JS
ZXR1cm5Db2RlXzE6DQoNCiAgUkFOOiAvdXNyL2xvY2FsL2Jpbi9kb2NrZXIgYnVpbGQgLS1uZXR3
b3JrPWhvc3QgLS1mb3JjZS1ybSAtLW5vLWNhY2hlPWZhbHNlIC10IG9wZW5ibWMvdWJ1bnR1LXVu
aXQtdGVzdC1vcGVuYm1jLWxpbnV4OjIwMjItVzI2LTRkNzQ4ZDY5MWUzN2EzZjYgLQ0KDQogIFNU
RE9VVDoNCg0KDQogIFNUREVSUjoNCiMxIFtpbnRlcm5hbF0gbG9hZCBidWlsZCBkZWZpbml0aW9u
IGZyb20gRG9ja2VyZmlsZQ0KIzEgc2hhMjU2OjdiMWQ5MmVlYzhkNDJlMjQ3ZjJiYjRmZDEyNjBh
N2IyMDllYjZhZjlkYWI4NGMzNDJhMjdkNWNkZDA4OWYzZjgNCiMxIHRyYW5zZmVycmluZyBkb2Nr
ZXJmaWxlOiAzMDdCIDAuMHMgZG9uZQ0KIzEgRE9ORSAwLjFzDQoNCiMyIFtpbnRlcm5hbF0gbG9h
ZCAuZG9ja2VyaWdub3JlDQojMiBzaGEyNTY6YzgzOTY2MzcxNThmZTQ0MmY3ODcwYzQyN2ZiMTRh
NWUxZjFmNzFiNzgxMzUzZmNmZjFhNzViNjMwMTA3MGJjYg0KIzIgdHJhbnNmZXJyaW5nIGNvbnRl
eHQ6IDJCIGRvbmUNCiMyIERPTkUgMC4wcw0KDQojMyBbaW50ZXJuYWxdIGxvYWQgbWV0YWRhdGEg
Zm9yIGRvY2tlci5pby9vcGVuYm1jL3VidW50dS11bml0LXRlc3QtYmFzZToyMDIyLVcyNi1lNzk3
NjdlNTM3OGQ1YTBmDQojMyBzaGEyNTY6MDUzYjI3ZWM3MzQ5MDZhM2NiZjc5ZGMwYmM5OWIxMzNh
ODBhYmMxYWEyZmQ1NTQ1MDEwMTM4YjcyY2YxNmVlMA0KIzMgRE9ORSAwLjBzDQoNCiM0IFsxLzJd
IEZST00gZG9ja2VyLmlvL29wZW5ibWMvdWJ1bnR1LXVuaXQtdGVzdC1iYXNlOjIwMjItVzI2LWU3
OTc2N2U1Mzc4ZDVhMGYNCiM0IHNoYTI1NjplNmU5YjQ4YTEwMGRmNzc2YTc1YjhkYzkzNGU4NWQz
ZjUyODJhZGUzNGMwMzFmMjVlM2RkNzRhMGVjZDEzODQyDQojNCBDQUNIRUQNCg0KIzUgWzIvMl0g
UlVOIGN1cmwgLUwgaHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMvbGludXgvYXJjaC4uLiAoMzQ3
NSBtb3JlLCBwbGVhc2Ugc2VlIGUuc3RkZXJyKQ0KICAqICAgPT09PT0NCg0KUmVnYXJkcywNCkNo
cmlzIENoZW4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCrFIpfOqzDogV2ls
bHkgVHUgPHdsdHVAZ29vZ2xlLmNvbT4NCrFIpfOk6bTBOiAyMDIypn42pOsyOKTpIKRVpMggMTE6
NTYNCqaspfOqzDogQnJhbmRvbiBLaW0gPGJyYW5kb25raW1AZ29vZ2xlLmNvbT4NCrDGpbs6IENo
cmlzIENoZW4gKFRQSSkgPENocmlzLkNoZW4zQGZsZXguY29tPjsgUGF0cmljayBXaWxsaWFtcyA8
cGF0cmlja0BzdHdjeC54eXo+OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcgPG9wZW5ibWNAbGlz
dHMub3psYWJzLm9yZz4NCqVEpq46IFJlOiBbcGhvc3Bob3ItaXBtaS1mbGFzaF06IHN0ZHBsdXMg
YnVpbGQgZmFpbGVkIGJlZm9yZSBidWlsZGluZyB0aGUgaG9zdC10b29sIG9uIHRoZSBIb3N0DQoN
Ck9oIHllYWgsIHRoZSBSRUFETUUgaXMgMTAwJSBvdXRkYXRlZC4gV2UgaGF2ZSBtb3ZlZCB0byBt
ZXNvbiBhbmQgd2UNCnNob3VsZCB1cGRhdGUgaXQgYXQgc29tZSBwb2ludCBpbiBsaWZlLg0KDQpJ
IHRoaW5rIHlvdXIgY29tbWFuZCB0byBidWlsZCBidXJuX215X2JtYyBzaG91bGQgYmUgZmluZS4g
VGhlDQpgaG9zdC10b29sYCBzaG91bGQgYmUgZW5hYmxlZCBieSBkZWZhdWx0Lg0KDQpDYW4gdHJ5
IHRoZSBmb2xsb3dpbmcsIGp1c3QgaW4gY2FzZS4NCmBgYA0KbWVzb24gc2V0dXAgLURob3N0LXRv
b2w9ZW5hYmxlZCBidWlsZGRpcg0KbmluamEgLUMgYnVpbGRkaXINCm5pbmphIC1DIGJ1aWxkZGly
IGluc3RhbGwNCmBgYA0KDQpXaWxseSBUdQ0KDQoNCk9uIFR1ZSwgSnVuIDI4LCAyMDIyIGF0IDg6
NTEgQU0gQnJhbmRvbiBLaW0gPGJyYW5kb25raW1AZ29vZ2xlLmNvbT4gd3JvdGU6DQo+DQo+IEFo
LCBpdCBzZWVtcyBsaWtlIHRoZSBlbWFpbCBjaGFpbnMgd2VyZSBicm9rZW4gdXAgZm9yIHNvbWUg
cmVhc29uIC0gc2VlaW5nIHRoaXMgbm93IGFmdGVyIEkgcmVwbGllZCB0byB0aGUgb3RoZXIgZW1h
aWwgY2hhaW4uDQo+DQo+IEl0IGlzIHRvdGFsbHkgcG9zc2libGUgdGhhdCBvdXIgaW5zdHJ1Y3Rp
b25zIGluIHRoZSBSRUFETUUgaXMgbm90IHVwIHRvIGRhdGUgYW55bW9yZSwgYnV0IGp1c3QgdG8g
bWFrZSBzdXJlIC0gYXJlIHlvdSBidWlsZGluZyBlYWNoIG9mIHRoZSBjb21wb25lbnRzIGFzIHNw
ZWNpZmllZCBieSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29t
L29wZW5ibWMvcGhvc3Bob3ItaXBtaS1mbGFzaCpidWlsZGluZy10aGUtaG9zdC10b29sX187SXch
IUhTbnRsQ2chVUdXS2lLNEMyZ1BCclBuS01MTkw3OGNLSkFFbno3c2I5NlVRMklKUjYyZ2Q1dG9R
T0JUWXA1THViUU9xNlluSEJZQ2U3cVZSc3c3STd3JCAgPw0KPg0KPiBJdCBkZXRhaWxzIHRoZSBj
b21tYW5kcyB0byB1c2UgZm9yIGVhY2ggb2YgdGhlIGRlcGVuZGVuY2llcy4NCj4NCj4gR29vZCBw
b2ludCBvbiB0aGUgYnVybl9teV9ibWMgY29tbWFuZCBpbiB0aGUgUkVBRE1FIGRlc2NyaXB0aW9u
IG5vdCBiZWluZyBub3QgdXAgdG8gZGF0ZSBhbmQgc3RpbGwgdXNpbmcgYXV0b21ha2UgKGh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhv
ci1pcG1pLWZsYXNoKmJ1aWxkaW5nLXRoZS1ob3N0LXRvb2xfXztJdyEhSFNudGxDZyFVR1dLaUs0
QzJnUEJyUG5LTUxOTDc4Y0tKQUVuejdzYjk2VVEySUpSNjJnZDV0b1FPQlRZcDVMdWJRT3E2WW5I
QllDZTdxVlJzdzdJN3ckICkgLSBJJ2xsIHRyeSB0byBydW4gdGhpcyB0byB2ZXJpZnkgd2hlbiBJ
IGdldCB0aW1lIGxhdGVyIHRvZGF5LCBidXQgaW4gdGhlIG1lYW50aW1lIHBlcmhhcHMgQFdpbGx5
IFR1IG1heSBrbm93IHRoZSBjb21tYW5kIG9mZiB0aGUgdG9wIG9mIGhpcyBoZWFkIGFzIGhlIHBl
cmZvcm1lZCB0aGUgYmlnIG1lc29uIG1pZ3JhdGlvbi4gQXMgYSBmaXJzdCBnbGFuY2UgdGhlIGNv
bW1hbmQgbG9va3MgY29ycmVjdC4NCj4NCj4gV2lsbHkgcmVjZW50bHkgYWxzbyBtaWdyYXRlZCBw
aG9zcG9oci1ob3N0LWlwbWlkIHRvIG1lc29uLCBzbyBoZSBtYXkga25vdyBtb3JlIGFib3V0IHRo
ZSBQQU0gZGVwZW5kZW5jeSBhcyB3ZWxsLg0KPg0KPiBUaGFua3MsDQo+IEJyYW5kb24NCj4NCj4N
Cj4gT24gVHVlLCBKdW4gMjgsIDIwMjIgYXQgODowNCBBTSBDaHJpcyBDaGVuIChUUEkpIDxDaHJp
cy5DaGVuM0BmbGV4LmNvbT4gd3JvdGU6DQo+Pg0KPj4gSGkgUGF0cmljaywNCj4+DQo+PiBUaGFu
a3MgZm9yIHlvdXIgcHJvbXB0IHJlcGx5LCBhbmQgdGhlIGlzc3VlIGlzIHNvbHZlZCBhZnRlciBp
bnN0YWxsaW5nIFVidW50dSAibGliZm10LWRldiIgcGFja2FnZS4NCj4+DQo+PiA+PiBEbyB5b3Ug
a25vdyB3aHkgeW91IGRpc2FibGVkIEMrKzIwPyAgVGhpcyBzaG91bGRuJ3QgaGF2ZSBiZWVuIG5l
Y2Vzc2FyeQ0KPj4gPj4gYW5kIHNvbWUgb2Ygb3VyIGNvZGUgbm93IHJlcXVpcmVzIEMrKzIwLg0K
Pj4NCj4+IEkgZGlzYWJsZWQgQysrMjAgb2YgdGhlICJpcG1pLWJsb2ItdG9vbCIgcGFja2FnZSBi
ZWNhdXNlIEkgZ290IGVycm9ycyBiZWxvdzoNCj4+ID09PT09DQo+PiBhcmNoZXJAYXJjaGVyLUFy
Y2hlckNpdHlNOmlwbWktYmxvYi10b29sJCAuL2Jvb3RzdHJhcC5zaA0KPj4gKyBhdXRvcmVjb25m
IC12IC1mIC1pDQo+PiBhdXRvcmVjb25mOiBleHBvcnQgV0FSTklOR1M9DQo+PiBhdXRvcmVjb25m
OiBFbnRlcmluZyBkaXJlY3RvcnkgJy4nDQo+PiBhdXRvcmVjb25mOiBjb25maWd1cmUuYWM6IG5v
dCB1c2luZyBHZXR0ZXh0DQo+PiBhdXRvcmVjb25mOiBydW5uaW5nOiBhY2xvY2FsIC0tZm9yY2Ug
LUkgbTQNCj4+IGNvbmZpZ3VyZS5hYzozODogZXJyb3I6IGludmFsaWQgZmlyc3QgYXJndW1lbnQg
YDIwJyB0byBBWF9DWFhfQ09NUElMRV9TVERDWFgNCj4+IC91c3Ivc2hhcmUvYWNsb2NhbC9heF9j
eHhfY29tcGlsZV9zdGRjeHgubTQ6NTA6IEFYX0NYWF9DT01QSUxFX1NURENYWCBpcyBleHBhbmRl
ZCBmcm9tLi4uDQo+PiBjb25maWd1cmUuYWM6Mzg6IHRoZSB0b3AgbGV2ZWwNCj4+IGF1dG9tNHRl
OiBlcnJvcjogL3Vzci9iaW4vbTQgZmFpbGVkIHdpdGggZXhpdCBzdGF0dXM6IDENCj4+IGFjbG9j
YWw6IGVycm9yOiAvdXNyL2Jpbi9hdXRvbTR0ZSBmYWlsZWQgd2l0aCBleGl0IHN0YXR1czogMQ0K
Pj4gYXV0b3JlY29uZjogZXJyb3I6IGFjbG9jYWwgZmFpbGVkIHdpdGggZXhpdCBzdGF0dXM6IDEN
Cj4+ID09PT09DQo+PiBEbyB5b3UgaGF2ZSBpZGVhcyBhYm91dCBob3cgdG8gc29sdmUgaXQgY29y
cmVjdGx5Pw0KPj4NCj4+IEluIGFkZGl0aW9uLCBpIGhhdmUgc3RhcnRlZCB0byBidWlsZCB0aGUg
YnVybl9teV9ibWMgKHRoZSBob3N0LXRvb2wpIG9uIHRoZSBIb3N0IGJ5IGNsb25pbmcgdGhlICJw
aG9zcGhvci1pcG1pLWZsYXNoIiBzb3VyY2UuIFRoZXJlIGFyZSBzb21lIHF1ZXN0aW9ucyBjYW1l
IG91dDoNCj4+DQo+PiBUaGUgInBob3NwaG9yLWlwbWktZmxhc2giIHBhY2thZ2Ugc2VlbXMgYmVj
YW1lIHRvIHVzZSAibWVzb24iIHJhdGhlciB0aGFuICJib290c3RyYXAuc2giLCBzbyBJIHJ1biB0
aGVzZSBjb21tYW5kcyBpbiB0aGUgc291cmNlIGRpcmVjdG9yeS4gSXMgaXQgY29ycmVjdD8NCj4+
IC0tLS0tDQo+PiBtZXNvbiBzZXR1cCAtRGJtYy1ibG9iLWhhbmRsZXI9ZGlzYWJsZWQgYnVpbGRk
aXINCj4+IG5pbmphIC1DIGJ1aWxkZGlyDQo+PiBuaW5qYSAtQyBidWlsZGRpciBpbnN0YWxsDQo+
PiAtLS0tLQ0KPj4NCj4+IEFmdGVyIHJ1bm5pbmcgIm1lc29uIHNldHVwIC1EYm1jLWJsb2ItaGFu
ZGxlcj1kaXNhYmxlZCBidWlsZGRpciIsIGl0IG9jY3VycmVkIGRlcGVuZGVuY3kgZXJyb3JzLCBs
aWtlICdzZGJ1c3BsdXMnLCAncGhvc3Bob3ItZGJ1cy1pbnRlcmZhY2VzJywgJ2xpYmlwbWlkJywg
YW5kIHNvIG9uIGlzIHJlcXVpcmVkIHJlc3BlY3RpdmVseSwgaXMgaXQgY29ycmVjdD8NCj4+DQo+
PiBJIGZvciBub3cgaGF2ZSB0cmllZCB0byBpbnN0YWxsIHRoZXNlIGRlcGVuZGVuY2llcyBvbmUt
Ynktb25lLCBidXQgYmUgc3R1Y2sgYXQgJ2xpYmlwbWlkJy4gVGhhdCBpcyBJIGNsb25lIHRoZSAi
cGhvc3Bob3ItaG9zdC1pcG1pZCIgYW5kIHJ1biAibWVzb24gYnVpbGRkaXIiIGNvbW1hbmQgdG8g
YnVpbGQgaXQsIGhvd2V2ZXIsIEkgZ290IGFuIGVycm9yIGluIGJsb3cgYW5kIEkgY2FuJ3Qgc29s
dmUgaXQuIENvdWxkIHlvdSBwbGVhc2UgZ2l2ZSBtZSBzb21lIHN1Z2dlc3Rpb25zPw0KPj4gPT09
PT0NCj4+IERlcGVuZGVuY3kgc2RldmVudHBsdXMgZnJvbSBzdWJwcm9qZWN0IHN1YnByb2plY3Rz
L3NkZXZlbnRwbHVzIGZvdW5kOiBZRVMgMC4xDQo+PiBEZXBlbmRlbmN5IHN5c3RlbWQgZm91bmQ6
IFlFUyAyNDkgKGNhY2hlZCkNCj4+IFJ1bi10aW1lIGRlcGVuZGVuY3kgbGliY3J5cHRvIGZvdW5k
OiBZRVMgMy4wLjINCj4+DQo+PiBtZXNvbi5idWlsZDo4OTowOiBFUlJPUjogQysrIHNoYXJlZCBv
ciBzdGF0aWMgbGlicmFyeSAncGFtJyBub3QgZm91bmQNCj4+ID09PT09DQo+Pg0KPj4gVGhhbmtz
Lg0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBDaHJpcyBDaGVuDQo+Pg0KPj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18gsUil86rMOiBQYXRyaWNrIFdpbGxpYW1zDQo+PiCkd7bHsGU6IKxQ
tMGkRywgMjAyMiA2IKTrIDI4IKTpIKRVpMggMDc6MjANCj4+IKaspfOqzDogQ2hyaXMgQ2hlbiAo
VFBJKQ0KPj4gsMaluzogb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQo+PiClRKauOiBSZTogW3Bo
b3NwaG9yLWlwbWktZmxhc2hdOiBzdGRwbHVzIGJ1aWxkIGZhaWxlZCBiZWZvcmUgYnVpbGRpbmcg
dGhlIGhvc3QtdG9vbCBvbiB0aGUgSG9zdA0KPj4NCj4+IE9uIFR1ZSwgSnVuIDI4LCAyMDIyIGF0
IDA4OjQzOjM0QU0gKzAwMDAsIENocmlzIENoZW4gKFRQSSkgd3JvdGU6DQo+PiA+IEFuZCBlYWNo
IGxpYnJhcnkgYW5kIHRvb2wgaXMgYnVpbHQgc3VjY2Vzc2Z1bChvbmx5IG9uZSB0aGluZyB0aGF0
IGlzIEkgaGFkIHRvIGRpc2FibGUgQysrMjAgZm9yIHRoZSBpcG1pLWJsb2ItdG9vbCwgb3RoZXJz
IHdlcmUgZmluZSkgdW50aWxJIHN0YXJ0ZWQgdG8gYnVpbGQgdGhlIHN0ZHBsdXMuIEkgZW5jb3Vu
dGVyZWQgYSBidWlsZCBmYWlsZWQgaXNzdWUgYXMgYmVsb3cuIEl0IGxvb2tzIGxpa2UgdGhlcmUg
aXMgYSBwcm9ibGVtIGZvciB1c2luZyBsaWJmbXQuYSwgSSB0cmllZCB0byBmaWd1cmUgb3V0IGEg
c29sdXRpb24gb24gZ29vZ2xlIGJ1dCBub3RoaW5nIGlzIHJlbGF0ZWQgdG8gdGhpcy4gQ291bGQg
YW55b25lIGhlbHAgb24gdGhpcz8gVGhhbmtzLg0KPj4NCj4+IERvIHlvdSBrbm93IHdoeSB5b3Ug
ZGlzYWJsZWQgQysrMjA/ICBUaGlzIHNob3VsZG4ndCBoYXZlIGJlZW4gbmVjZXNzYXJ5DQo+PiBh
bmQgc29tZSBvZiBvdXIgY29kZSBub3cgcmVxdWlyZXMgQysrMjAuDQo+Pg0KPj4gPg0KPj4gPiA9
PT09PQ0KPj4gPiBhcmNoZXJAYXJjaGVyLUFyY2hlckNpdHlNOnN0ZHBsdXMkDQo+PiA+IGFyY2hl
ckBhcmNoZXItQXJjaGVyQ2l0eU06c3RkcGx1cyQgbWVzb24gc2V0dXAgLURleGFtcGxlcz1mYWxz
ZSAtRHRlc3RzPWRpc2FibGVkIGJ1aWxkZGlyDQo+PiA+IFRoZSBNZXNvbiBidWlsZCBzeXN0ZW0N
Cj4+ID4gVmVyc2lvbjogMC42MS4yDQo+PiA+IFNvdXJjZSBkaXI6IC9ob21lL2FyY2hlci9Eb3du
bG9hZHMvaG9zdC10b29sL3N0ZHBsdXMNCj4+ID4gQnVpbGQgZGlyOiAvaG9tZS9hcmNoZXIvRG93
bmxvYWRzL2hvc3QtdG9vbC9zdGRwbHVzL2J1aWxkZGlyDQo+PiA+IEJ1aWxkIHR5cGU6IG5hdGl2
ZSBidWlsZA0KPj4gPiBQcm9qZWN0IG5hbWU6IHN0ZHBsdXMNCj4+ID4gUHJvamVjdCB2ZXJzaW9u
OiAwLjENCj4+ID4gQysrIGNvbXBpbGVyIGZvciB0aGUgaG9zdCBtYWNoaW5lOiBjKysgKGdjYyAx
MS4yLjAgImMrKyAoVWJ1bnR1IDExLjIuMC0xOXVidW50dTEpIDExLjIuMCIpDQo+PiA+IEMrKyBs
aW5rZXIgZm9yIHRoZSBob3N0IG1hY2hpbmU6IGMrKyBsZC5iZmQgMi4zOA0KPj4gPiBIb3N0IG1h
Y2hpbmUgY3B1IGZhbWlseTogeDg2XzY0DQo+PiA+IEhvc3QgbWFjaGluZSBjcHU6IHg4Nl82NA0K
Pj4gPiBGb3VuZCBwa2ctY29uZmlnOiAvdXNyL2Jpbi9wa2ctY29uZmlnICgwLjI5LjIpDQo+PiA+
IFJ1bi10aW1lIGRlcGVuZGVuY3kgZm10IGZvdW5kOiBZRVMgOC4xLjINCj4+DQo+PiBXaGVyZSBk
aWQgdGhpcyBgZm10YCBjb21lIGZyb20/ICBVYnVudHUgaGFzIGBsaWJmbXQtZGV2YCB0aGF0IHlv
dSBjYW4NCj4+IGluc3RhbGwgd2hpY2ggaXMgdmVyc2lvbiA4LjEuMSBvbiBKYW1teSByaWdodCBu
b3cuDQo+Pg0KPj4gPiBMaWJyYXJ5IGRsIGZvdW5kOiBZRVMNCj4+ID4gUnVuLXRpbWUgZGVwZW5k
ZW5jeSBsaWJ1cmluZyBmb3VuZDogWUVTIDIuMA0KPj4gPiBCdWlsZCB0YXJnZXRzIGluIHByb2pl
Y3Q6IDENCj4+ID4NCj4+ID4gc3RkcGx1cyAwLjENCj4+ID4NCj4+ID4gICBVc2VyIGRlZmluZWQg
b3B0aW9ucw0KPj4gPiAgICAgZXhhbXBsZXM6IGZhbHNlDQo+PiA+ICAgICB0ZXN0cyAgIDogZGlz
YWJsZWQNCj4+ID4NCj4+ID4gRm91bmQgbmluamEtMS4xMC4xIGF0IC91c3IvYmluL25pbmphDQo+
PiA+IGFyY2hlckBhcmNoZXItQXJjaGVyQ2l0eU06c3RkcGx1cyQNCj4+ID4gYXJjaGVyQGFyY2hl
ci1BcmNoZXJDaXR5TTpzdGRwbHVzJA0KPj4gPiBhcmNoZXJAYXJjaGVyLUFyY2hlckNpdHlNOnN0
ZHBsdXMkIG5pbmphIC1DIGJ1aWxkZGlyDQo+PiA+IG5pbmphOiBFbnRlcmluZyBkaXJlY3Rvcnkg
YGJ1aWxkZGlyJw0KPj4gPiBbOS85XSBMaW5raW5nIHRhcmdldCBzcmMvbGlic3RkcGx1cy5zby4w
LjENCj4+ID4gRkFJTEVEOiBzcmMvbGlic3RkcGx1cy5zby4wLjENCj4+ID4gYysrICAtbyBzcmMv
bGlic3RkcGx1cy5zby4wLjEgc3JjL2xpYnN0ZHBsdXMuc28uMC4xLnAvc3RkcGx1c19leGNlcHRp
b24uY3BwLm8gc3JjL2xpYnN0ZHBsdXMuc28uMC4xLnAvc3RkcGx1c19zaWduYWwuY3BwLm8gc3Jj
L2xpYnN0ZHBsdXMuc28uMC4xLnAvc3RkcGx1c19kbC5jcHAubyBzcmMvbGlic3RkcGx1cy5zby4w
LjEucC9zdGRwbHVzX2ZkX2NyZWF0ZS5jcHAubyBzcmMvbGlic3RkcGx1cy5zby4wLjEucC9zdGRw
bHVzX2ZkX2R1cGFibGUuY3BwLm8gc3JjL2xpYnN0ZHBsdXMuc28uMC4xLnAvc3RkcGx1c19mZF9p
bXBsLmNwcC5vIHNyYy9saWJzdGRwbHVzLnNvLjAuMS5wL3N0ZHBsdXNfZmRfbWFuYWdlZC5jcHAu
byBzcmMvbGlic3RkcGx1cy5zby4wLjEucC9zdGRwbHVzX2ZkX21tYXAuY3BwLm8gc3JjL2xpYnN0
ZHBsdXMuc28uMC4xLnAvc3RkcGx1c19mZF9vcHMuY3BwLm8gc3JjL2xpYnN0ZHBsdXMuc28uMC4x
LnAvc3RkcGx1c19pb191cmluZy5jcHAubyAtV2wsLS1hcy1uZWVkZWQgLVdsLC0tbm8tdW5kZWZp
bmVkIC1zaGFyZWQgLWZQSUMgLVdsLC0tc3RhcnQtZ3JvdXAgLVdsLC1zb25hbWUsbGlic3RkcGx1
cy5zby4wIC91c3IvbG9jYWwvbGliL2xpYmZtdC5hIC1sZGwgL3Vzci9saWIveDg2XzY0LWxpbnV4
LWdudS9saWJ1cmluZy5zbyAtV2wsLS1lbmQtZ3JvdXANCj4+ID4gL3Vzci9iaW4vbGQ6IC91c3Iv
bG9jYWwvbGliL2xpYmZtdC5hKGZvcm1hdC5jYy5vKTogd2FybmluZzogcmVsb2NhdGlvbiBhZ2Fp
bnN0IGBzdGRvdXRAQEdMSUJDXzIuMi41JyBpbiByZWFkLW9ubHkgc2VjdGlvbiBgLnRleHQnDQo+
PiA+IC91c3IvYmluL2xkOiAvdXNyL2xvY2FsL2xpYi9saWJmbXQuYShmb3JtYXQuY2Mubyk6IHJl
bG9jYXRpb24gUl9YODZfNjRfUEMzMiBhZ2FpbnN0IHN5bWJvbCBgc3RkZXJyQEBHTElCQ18yLjIu
NScgY2FuIG5vdCBiZSB1c2VkIHdoZW4gbWFraW5nIGEgc2hhcmVkIG9iamVjdDsgcmVjb21waWxl
IHdpdGggLWZQSUMNCj4+DQo+PiBIb3dldmVyIHlvdSBvYnRhaW5lZCB5b3VyIGxpYmZtdCwgaXQg
d2FzIGNvbXBpbGVkIGluY29ycmVjdGx5LiAgSXQNCj4+IHNob3VsZG4ndCBoYXZlIGEgc3RhdGlj
IGxpYnJhcnkgYnV0IGEgZHluYW1pYyBvbmUuDQo+Pg0KPj4gVGhlIGBsaWJmbXQtZGV2YCBwYWNr
YWdlIGhhcyBgbGliZm10LnNvYCB3aGljaCBzaG91bGQgYmUgc3VmZmljaWVudCBmb3INCj4+IGxp
bmtpbmcgYXMgYSBzaGFyZWQgbGlicmFyeS4NCj4+DQo+PiAtLQ0KPj4gUGF0cmljayBXaWxsaWFt
cw0KPj4gTGVnYWwgRGlzY2xhaW1lciA6DQo+PiBUaGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGlu
IHRoaXMgbWVzc2FnZSBtYXkgYmUgcHJpdmlsZWdlZCBhbmQgY29uZmlkZW50aWFsLg0KPj4gSXQg
aXMgaW50ZW5kZWQgdG8gYmUgcmVhZCBvbmx5IGJ5IHRoZSBpbmRpdmlkdWFsIG9yIGVudGl0eSB0
byB3aG9tIGl0IGlzIGFkZHJlc3NlZA0KPj4gb3IgYnkgdGhlaXIgZGVzaWduZWUuIElmIHRoZSBy
ZWFkZXIgb2YgdGhpcyBtZXNzYWdlIGlzIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50LA0KPj4g
eW91IGFyZSBvbiBub3RpY2UgdGhhdCBhbnkgZGlzdHJpYnV0aW9uIG9mIHRoaXMgbWVzc2FnZSwg
aW4gYW55IGZvcm0sDQo+PiBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLiBJZiB5b3UgaGF2ZSByZWNl
aXZlZCB0aGlzIG1lc3NhZ2UgaW4gZXJyb3IsDQo+PiBwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5
IHRoZSBzZW5kZXIgYW5kIGRlbGV0ZSBvciBkZXN0cm95IGFueSBjb3B5IG9mIHRoaXMgbWVzc2Fn
ZSENCg==

--_000_DM6PR08MB551486002B71DF6FE9FA3154DCBB9DM6PR08MB5514namp_
Content-Type: text/html; charset="big5"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dbig5">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Brandon and Willy,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<ul>
<li>First of all, I would like to say thanks for your answer and confirmati=
on, the problems I listed are solved.</li></ul>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<ul>
<li>For Brandon's question,</li><li style=3D"display:block">&gt; <span styl=
e=3D"color: rgb(0, 0, 0); font-family: Calibri, Helvetica, sans-serif; font=
-size: 11pt;">
It is totally possible that our instructions in the README is not up to dat=
e anymore, but just to make sure - are you building each of the components =
as specified by</span><span style=3D"color: rgb(0, 0, 0); font-family: &quo=
t;Microsoft Jhenghei UI&quot;, Pmingliu, &quot;Segoe UI&quot;, -apple-syste=
m, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font=
-size: 14.6667px;"><span style=3D"font-family: Calibri, Helvetica, sans-ser=
if; font-size: 11pt;">&nbsp;</span></span><a href=3D"https://github.com/ope=
nbmc/phosphor-ipmi-flash#building-the-host-tool" id=3D"LPNoLPOWALinkPreview=
" style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 1=
2pt;"><span style=3D"font-family: Calibri, Helvetica, sans-serif; font-size=
: 11pt;">https://github.com/openbmc/phosphor-ipmi-flash#building-the-host-t=
ool</span></a><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Hel=
vetica, sans-serif; font-size: 11pt;">?</span></li><li style=3D"display:blo=
ck"><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Helvetica, sa=
ns-serif; font-size: 11pt;"><br>
<span style=3D"font-family:Calibri, Arial, Helvetica, sans-serif;font-size:=
16px;text-align:start;background-color:rgb(255, 255, 255);display:inline !i=
mportant">Yes, I followed the README.md to build each of the components.</s=
pan></span></li></ul>
</div>
<div class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview _EReadonly_=
1"></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<ul>
<li><span>However, I encountered other fatal errors when building the &quot=
;phosphor-host-ipmid&quot; package as below. (Overall there are three kinds=
 of fatal errors, which is missing gtest.h, json.hpp, and log.hpp, that occ=
ured in several files, so I just list one
 message of each error for reference.)</span></li><li style=3D"display:bloc=
k">=3D=3D=3D=3D=3D</li><li style=3D"display:block"><span style=3D"color: rg=
b(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size: =
12pt;">../subprojects/phosphor-objmgr/libmapper/test/mapper.cpp:4:10: fatal=
 error: gtest/gtest.h: No such file or directory</span></li><li style=3D"di=
splay:block"><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Aria=
l, Helvetica, sans-serif; font-size: 12pt;"><span style=3D"text-align:start=
;background-color:rgb(255, 255, 255);display:inline !important">&nbsp; &nbs=
p;<span>&nbsp;</span></span>4 | #include
 &lt;gtest/gtest.h&gt;</span></li><li style=3D"display:block"><span style=
=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif=
; font-size: 12pt;">../entity_map_json.hpp:5:10: fatal error: nlohmann/json=
.hpp: No such file or directory</span></li><li style=3D"display:block"><spa=
n style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, san=
s-serif; font-size: 12pt;"><span style=3D"text-align:start;background-color=
:rgb(255, 255, 255);display:inline !important">&nbsp; &nbsp;<span>&nbsp;</s=
pan></span>5 | #include
 &lt;nlohmann/json.hpp&gt;</span></li><li style=3D"display:block"><span sty=
le=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-ser=
if; font-size: 12pt;">../include/ipmid/message.hpp:26:10: fatal error: phos=
phor-logging/log.hpp: No such file or directory</span></li><li style=3D"dis=
play:block"><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial=
, Helvetica, sans-serif; font-size: 12pt;">&nbsp; &nbsp;26 | #include &lt;p=
hosphor-logging/log.hpp&gt;</span></li><li style=3D"display:block"><span st=
yle=3D"font-size: 12pt;">=3D=3D=3D=3D=3D</span></li><li style=3D"display:bl=
ock"><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helve=
tica, sans-serif; font-size: 12pt;"><br>
</span></li><li style=3D"display:block"><span style=3D"color: rgb(0, 0, 0);=
 font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;">Do y=
ou have any suggestions on this?</span></li><li style=3D"display:block"><sp=
an style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sa=
ns-serif; font-size: 12pt;"><br>
</span></li><li style=3D"display:block"><span style=3D"color: rgb(0, 0, 0);=
 font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;">BTW.=
 I use following commands to build the</span><span style=3D"color: rgb(0, 0=
, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;"=
>&nbsp;&quot;phosphor-host-ipmid&quot;
 package, it should be correct, right?</span></li><li style=3D"display:bloc=
k">-----</li><li style=3D"display:block">meson setup -Dtests=3Ddisabled bui=
lddir</li><li style=3D"display:block">ninja -C builddir</li><li style=3D"di=
splay:block">ninja -C builddir install</li><li style=3D"display:block">----=
-</li></ul>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<ul>
<li style=3D"font-size:12pt;font-family:Calibri, Arial, Helvetica, sans-ser=
if;color:rgb(0, 0, 0)">
<span><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helv=
etica, sans-serif; font-size: 12pt;">I don't insist to build locally, so as=
 per your recommendation I'm trying to build it by using docker. However, I=
 have limit capability with docker,
 I for now met a question on building docker image by using the &quot;build=
-unit-test-docker&quot; script you mentioned, that is after installing the =
docker-desktop on my Host, I referred to&nbsp;</span></span><a href=3D"http=
s://github.com/openbmc/docs/blob/master/testing/run-test-docker.md#build-do=
cker-image" id=3D"LPNoLPOWALinkPreview_1">https://github.com/openbmc/docs/b=
lob/master/testing/run-test-docker.md#build-docker-image</a>&nbsp;to
 build the docker image, of course, I replace the command as below,</li><di=
v class=3D"_Entity _EType_OWALinkPreview _EId_OWALinkPreview_1 _EReadonly_1=
"></div>
</ul>
<ul>
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">./scripts/build-qemu-robot-docker.sh<br>
</span></ul>
<ul>
<li style=3D"display:block;font-size:12pt;font-family:Calibri, Arial, Helve=
tica, sans-serif;color:rgb(0, 0, 0)">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Then, the error came out after several minut=
es. (I retried few times, some images are already exists.) Could you help t=
o take a look at this, and give me
 some suggestions as well?</span></li><li style=3D"display:block;font-size:=
12pt;font-family:Calibri, Arial, Helvetica, sans-serif;color:rgb(0, 0, 0)">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">=3D=3D=3D=3D=3D</span></li><li style=3D"disp=
lay:block;font-size:12pt;font-family:Calibri, Arial, Helvetica, sans-serif;=
color:rgb(0, 0, 0)">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">archer@archer-ArcherCityM:openbmc-build-scri=
pts$ ./scripts/build-unit-test-docker<br>
</span></li><li style=3D"display:block;font-size:12pt;font-family:Calibri, =
Arial, Helvetica, sans-serif;color:rgb(0, 0, 0)">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Image openbmc/ubuntu-unit-test-base:2022-W26=
-e79767e5378d5a0f already exists. &nbsp;Skipping.
<div>Image openbmc/ubuntu-unit-test-uscilab-cereal:2022-W26-ab72d4495979e83=
0 already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-nlohmann-json:2022-W26-ffba809170eb0a41=
 already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-naios-function2:2022-W26-3b876756bb76be=
23 already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-cliutils-cli11:2022-W26-f53b55bea30b21c=
6 already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-libvnc-libvncserver:2022-W26-90d3acb2a0=
df9617 already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-cppalliance-url:2022-W26-460f317503ba94=
22 already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-boost:2022-W26-d87626309071f65f already=
 exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-catchorg-catch2:2022-W26-3439038e67e823=
04 already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-leethomason-tinyxml2:2022-W26-323efeff9=
db53382 already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-facebookexperimental-libunifex:2022-W26=
-1eff6ee41b25d7e1 already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-linux-test-project-lcov:2022-W26-136906=
75d4cda956 already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-fmtlib-fmt:2022-W26-8c08817ee76f296a al=
ready exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-google-googletest:2022-W26-41755ba7fe77=
0d1e already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-tristanpenman-valijson:2022-W26-2d55955=
ffea82018 already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-open-power-pdbg:2022-W26-ea1338b7d5bcf7=
17 already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-openbmc-sdbusplus:2022-W26-4de3de6a7dd7=
4c72 already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-openbmc-stdplus:2022-W26-fcc6d0d878d824=
35 already exists. &nbsp;Skipping.</div>
<div>Image openbmc/ubuntu-unit-test-openbmc-gpioplus:2022-W26-6e12ea9e28a38=
a45 already exists. &nbsp;Skipping.</div>
Image openbmc/ubuntu-unit-test-openbmc-sdeventplus:2022-W26-077c15efe62026d=
9 already exists. &nbsp;Skipping.<br>
</span></li><li style=3D"display:block;font-size:12pt;font-family:Calibri, =
Arial, Helvetica, sans-serif;color:rgb(0, 0, 0)">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Package openbmc/linux failed!
<div>Traceback (most recent call last):</div>
<div>&nbsp; File &quot;/home/archer/Downloads/openbmc-build-scripts/./scrip=
ts/build-unit-test-docker&quot;, line 852, in &lt;module&gt;</div>
<div>&nbsp; &nbsp; Package.generate_all()</div>
<div>&nbsp; File &quot;/home/archer/Downloads/openbmc-build-scripts/./scrip=
ts/build-unit-test-docker&quot;, line 396, in generate_all</div>
<div>&nbsp; &nbsp; raise t.exception</div>
<div>&nbsp; File &quot;/home/archer/Downloads/openbmc-build-scripts/./scrip=
ts/build-unit-test-docker&quot;, line 365, in run</div>
<div>&nbsp; &nbsp; Docker.build(self.package, tag, dockerfile)</div>
<div>&nbsp; File &quot;/home/archer/Downloads/openbmc-build-scripts/./scrip=
ts/build-unit-test-docker&quot;, line 620, in build</div>
<div>&nbsp; &nbsp; docker.build(</div>
<div>&nbsp; File &quot;/home/archer/.local/lib/python3.10/site-packages/sh.=
py&quot;, line 1566, in __call__</div>
<div>&nbsp; &nbsp; return RunningCommand(cmd, call_args, stdin, stdout, std=
err)</div>
<div>&nbsp; File &quot;/home/archer/.local/lib/python3.10/site-packages/sh.=
py&quot;, line 822, in __init__</div>
<div>&nbsp; &nbsp; self.wait()</div>
<div>&nbsp; File &quot;/home/archer/.local/lib/python3.10/site-packages/sh.=
py&quot;, line 879, in wait</div>
<div>&nbsp; &nbsp; self.handle_command_exit_code(exit_code)</div>
<div>&nbsp; File &quot;/home/archer/.local/lib/python3.10/site-packages/sh.=
py&quot;, line 905, in handle_command_exit_code</div>
<div>&nbsp; &nbsp; raise exc</div>
<div>sh.ErrorReturnCode_1: </div>
<div><br>
</div>
<div>&nbsp; RAN: /usr/local/bin/docker build --network=3Dhost --force-rm --=
no-cache=3Dfalse -t openbmc/ubuntu-unit-test-openbmc-linux:2022-W26-4d748d6=
91e37a3f6 -</div>
<div><br>
</div>
<div>&nbsp; STDOUT:</div>
<div><br>
</div>
<div><br>
</div>
<div>&nbsp; STDERR:</div>
<div>#1 [internal] load build definition from Dockerfile</div>
<div>#1 sha256:7b1d92eec8d42e247f2bb4fd1260a7b209eb6af9dab84c342a27d5cdd089=
f3f8</div>
<div>#1 transferring dockerfile: 307B 0.0s done</div>
<div>#1 DONE 0.1s</div>
<div><br>
</div>
<div>#2 [internal] load .dockerignore</div>
<div>#2 sha256:c8396637158fe442f7870c427fb14a5e1f1f71b781353fcff1a75b630107=
0bcb</div>
<div>#2 transferring context: 2B done</div>
<div>#2 DONE 0.0s</div>
<div><br>
</div>
<div>#3 [internal] load metadata for docker.io/openbmc/ubuntu-unit-test-bas=
e:2022-W26-e79767e5378d5a0f</div>
<div>#3 sha256:053b27ec734906a3cbf79dc0bc99b133a80abc1aa2fd5545010138b72cf1=
6ee0</div>
<div>#3 DONE 0.0s</div>
<div><br>
</div>
<div>#4 [1/2] FROM docker.io/openbmc/ubuntu-unit-test-base:2022-W26-e79767e=
5378d5a0f</div>
<div>#4 sha256:e6e9b48a100df776a75b8dc934e85d3f5282ade34c031f25e3dd74a0ecd1=
3842</div>
<div>#4 CACHED</div>
<div><br>
</div>
#5 [2/2] RUN curl -L https://github.com/openbmc/linux/arch... (3475 more, p=
lease see e.stderr)</span></li><li style=3D"display:block;font-size:12pt;fo=
nt-family:Calibri, Arial, Helvetica, sans-serif;color:rgb(0, 0, 0)">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">=3D=3D=3D=3D=3D</span></li></ul>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Chris Chen</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> Willy Tu =
&lt;wltu@google.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2022=A6~6=A4=EB28=A4=E9 =A4U=A4=C8 11:56<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Brandon Kim &lt;brandonkim@google.com&gt;<br>
<b>=B0=C6=A5=BB:</b> Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;; Patrick=
 Williams &lt;patrick@stwcx.xyz&gt;; openbmc@lists.ozlabs.org &lt;openbmc@l=
ists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b> Re: [phosphor-ipmi-flash]: stdplus build failed before b=
uilding the host-tool on the Host</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">Oh yeah, the README is 100% outdate=
d. We have moved to meson and we<br>
should update it at some point in life.<br>
<br>
I think your command to build burn_my_bmc should be fine. The<br>
`host-tool` should be enabled by default.<br>
<br>
Can try the following, just in case.<br>
```<br>
meson setup -Dhost-tool=3Denabled builddir<br>
ninja -C builddir<br>
ninja -C builddir install<br>
```<br>
<br>
Willy Tu<br>
<br>
<br>
On Tue, Jun 28, 2022 at 8:51 AM Brandon Kim &lt;brandonkim@google.com&gt; w=
rote:<br>
&gt;<br>
&gt; Ah, it seems like the email chains were broken up for some reason - se=
eing this now after I replied to the other email chain.<br>
&gt;<br>
</div>
<div class=3D"PlainText elementToProof">&gt; It is totally possible that ou=
r instructions in the README is not up to date anymore, but just to make su=
re - are you building each of the components as specified by
<a href=3D"https://urldefense.com/v3/__https://github.com/openbmc/phosphor-=
ipmi-flash*building-the-host-tool__;Iw!!HSntlCg!UGWKiK4C2gPBrPnKMLNL78cKJAE=
nz7sb96UQ2IJR62gd5toQOBTYp5LubQOq6YnHBYCe7qVRsw7I7w$" data-auth=3D"NotAppli=
cable">
https://urldefense.com/v3/__https://github.com/openbmc/phosphor-ipmi-flash*=
building-the-host-tool__;Iw!!HSntlCg!UGWKiK4C2gPBrPnKMLNL78cKJAEnz7sb96UQ2I=
JR62gd5toQOBTYp5LubQOq6YnHBYCe7qVRsw7I7w$</a>&nbsp; ?<br>
</div>
<div class=3D"PlainText elementToProof">&gt;<br>
&gt; It details the commands to use for each of the dependencies.<br>
&gt;<br>
&gt; Good point on the burn_my_bmc command in the README description not be=
ing not up to date and still using automake (https://urldefense.com/v3/__ht=
tps://github.com/openbmc/phosphor-ipmi-flash*building-the-host-tool__;Iw!!H=
SntlCg!UGWKiK4C2gPBrPnKMLNL78cKJAEnz7sb96UQ2IJR62gd5toQOBTYp5LubQOq6YnHBYCe=
7qVRsw7I7w$
 ) - I'll try to run this to verify when I get time later today, but in the=
 meantime perhaps @Willy Tu may know the command off the top of his head as=
 he performed the big meson migration. As a first glance the command looks =
correct.<br>
&gt;<br>
&gt; Willy recently also migrated phospohr-host-ipmid to meson, so he may k=
now more about the PAM dependency as well.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Brandon<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Jun 28, 2022 at 8:04 AM Chris Chen (TPI) &lt;Chris.Chen3@flex.=
com&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Patrick,<br>
&gt;&gt;<br>
&gt;&gt; Thanks for your prompt reply, and the issue is solved after instal=
ling Ubuntu &quot;libfmt-dev&quot; package.<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt; Do you know why you disabled C++20?&nbsp; This shouldn't =
have been necessary<br>
&gt;&gt; &gt;&gt; and some of our code now requires C++20.<br>
&gt;&gt;<br>
&gt;&gt; I disabled C++20 of the &quot;ipmi-blob-tool&quot; package because=
 I got errors below:<br>
&gt;&gt; =3D=3D=3D=3D=3D<br>
&gt;&gt; archer@archer-ArcherCityM:ipmi-blob-tool$ ./bootstrap.sh<br>
&gt;&gt; + autoreconf -v -f -i<br>
&gt;&gt; autoreconf: export WARNINGS=3D<br>
&gt;&gt; autoreconf: Entering directory '.'<br>
&gt;&gt; autoreconf: configure.ac: not using Gettext<br>
&gt;&gt; autoreconf: running: aclocal --force -I m4<br>
&gt;&gt; configure.ac:38: error: invalid first argument `20' to AX_CXX_COMP=
ILE_STDCXX<br>
&gt;&gt; /usr/share/aclocal/ax_cxx_compile_stdcxx.m4:50: AX_CXX_COMPILE_STD=
CXX is expanded from...<br>
&gt;&gt; configure.ac:38: the top level<br>
&gt;&gt; autom4te: error: /usr/bin/m4 failed with exit status: 1<br>
&gt;&gt; aclocal: error: /usr/bin/autom4te failed with exit status: 1<br>
&gt;&gt; autoreconf: error: aclocal failed with exit status: 1<br>
&gt;&gt; =3D=3D=3D=3D=3D<br>
&gt;&gt; Do you have ideas about how to solve it correctly?<br>
&gt;&gt;<br>
&gt;&gt; In addition, i have started to build the burn_my_bmc (the host-too=
l) on the Host by cloning the &quot;phosphor-ipmi-flash&quot; source. There=
 are some questions came out:<br>
&gt;&gt;<br>
&gt;&gt; The &quot;phosphor-ipmi-flash&quot; package seems became to use &q=
uot;meson&quot; rather than &quot;bootstrap.sh&quot;, so I run these comman=
ds in the source directory. Is it correct?<br>
&gt;&gt; -----<br>
&gt;&gt; meson setup -Dbmc-blob-handler=3Ddisabled builddir<br>
&gt;&gt; ninja -C builddir<br>
&gt;&gt; ninja -C builddir install<br>
&gt;&gt; -----<br>
&gt;&gt;<br>
&gt;&gt; After running &quot;meson setup -Dbmc-blob-handler=3Ddisabled buil=
ddir&quot;, it occurred dependency errors, like 'sdbusplus', 'phosphor-dbus=
-interfaces', 'libipmid', and so on is required respectively, is it correct=
?<br>
&gt;&gt;<br>
&gt;&gt; I for now have tried to install these dependencies one-by-one, but=
 be stuck at 'libipmid'. That is I clone the &quot;phosphor-host-ipmid&quot=
; and run &quot;meson builddir&quot; command to build it, however, I got an=
 error in blow and I can't solve it. Could you please give
 me some suggestions?<br>
&gt;&gt; =3D=3D=3D=3D=3D<br>
&gt;&gt; Dependency sdeventplus from subproject subprojects/sdeventplus fou=
nd: YES 0.1<br>
&gt;&gt; Dependency systemd found: YES 249 (cached)<br>
&gt;&gt; Run-time dependency libcrypto found: YES 3.0.2<br>
&gt;&gt;<br>
&gt;&gt; meson.build:89:0: ERROR: C++ shared or static library 'pam' not fo=
und<br>
&gt;&gt; =3D=3D=3D=3D=3D<br>
&gt;&gt;<br>
&gt;&gt; Thanks.<br>
&gt;&gt;<br>
&gt;&gt; Regards,<br>
&gt;&gt; Chris Chen<br>
&gt;&gt;<br>
&gt;&gt; ________________________________ =B1H=A5=F3=AA=CC: Patrick William=
s<br>
&gt;&gt; =A4w=B6=C7=B0e: =ACP=B4=C1=A4G, 2022 6 =A4=EB 28 =A4=E9 =A4U=A4=C8=
 07:20<br>
&gt;&gt; =A6=AC=A5=F3=AA=CC: Chris Chen (TPI)<br>
&gt;&gt; =B0=C6=A5=BB: openbmc@lists.ozlabs.org<br>
&gt;&gt; =A5D=A6=AE: Re: [phosphor-ipmi-flash]: stdplus build failed before=
 building the host-tool on the Host<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Jun 28, 2022 at 08:43:34AM +0000, Chris Chen (TPI) wrote:<=
br>
&gt;&gt; &gt; And each library and tool is built successful(only one thing =
that is I had to disable C++20 for the ipmi-blob-tool, others were fine) un=
tilI started to build the stdplus. I encountered a build failed issue as be=
low. It looks like there is a problem for
 using libfmt.a, I tried to figure out a solution on google but nothing is =
related to this. Could anyone help on this? Thanks.<br>
&gt;&gt;<br>
&gt;&gt; Do you know why you disabled C++20?&nbsp; This shouldn't have been=
 necessary<br>
&gt;&gt; and some of our code now requires C++20.<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; =3D=3D=3D=3D=3D<br>
&gt;&gt; &gt; archer@archer-ArcherCityM:stdplus$<br>
&gt;&gt; &gt; archer@archer-ArcherCityM:stdplus$ meson setup -Dexamples=3Df=
alse -Dtests=3Ddisabled builddir<br>
&gt;&gt; &gt; The Meson build system<br>
&gt;&gt; &gt; Version: 0.61.2<br>
&gt;&gt; &gt; Source dir: /home/archer/Downloads/host-tool/stdplus<br>
&gt;&gt; &gt; Build dir: /home/archer/Downloads/host-tool/stdplus/builddir<=
br>
&gt;&gt; &gt; Build type: native build<br>
&gt;&gt; &gt; Project name: stdplus<br>
&gt;&gt; &gt; Project version: 0.1<br>
&gt;&gt; &gt; C++ compiler for the host machine: c++ (gcc 11.2.0 &quot;c++ =
(Ubuntu 11.2.0-19ubuntu1) 11.2.0&quot;)<br>
&gt;&gt; &gt; C++ linker for the host machine: c++ ld.bfd 2.38<br>
&gt;&gt; &gt; Host machine cpu family: x86_64<br>
&gt;&gt; &gt; Host machine cpu: x86_64<br>
&gt;&gt; &gt; Found pkg-config: /usr/bin/pkg-config (0.29.2)<br>
&gt;&gt; &gt; Run-time dependency fmt found: YES 8.1.2<br>
&gt;&gt;<br>
&gt;&gt; Where did this `fmt` come from?&nbsp; Ubuntu has `libfmt-dev` that=
 you can<br>
&gt;&gt; install which is version 8.1.1 on Jammy right now.<br>
&gt;&gt;<br>
&gt;&gt; &gt; Library dl found: YES<br>
&gt;&gt; &gt; Run-time dependency liburing found: YES 2.0<br>
&gt;&gt; &gt; Build targets in project: 1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; stdplus 0.1<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;&nbsp;&nbsp; User defined options<br>
&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; examples: false<br>
&gt;&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; tests&nbsp;&nbsp; : disabled<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Found ninja-1.10.1 at /usr/bin/ninja<br>
&gt;&gt; &gt; archer@archer-ArcherCityM:stdplus$<br>
&gt;&gt; &gt; archer@archer-ArcherCityM:stdplus$<br>
&gt;&gt; &gt; archer@archer-ArcherCityM:stdplus$ ninja -C builddir<br>
&gt;&gt; &gt; ninja: Entering directory `builddir'<br>
&gt;&gt; &gt; [9/9] Linking target src/libstdplus.so.0.1<br>
&gt;&gt; &gt; FAILED: src/libstdplus.so.0.1<br>
&gt;&gt; &gt; c++&nbsp; -o src/libstdplus.so.0.1 src/libstdplus.so.0.1.p/st=
dplus_exception.cpp.o src/libstdplus.so.0.1.p/stdplus_signal.cpp.o src/libs=
tdplus.so.0.1.p/stdplus_dl.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_create.=
cpp.o src/libstdplus.so.0.1.p/stdplus_fd_dupable.cpp.o
 src/libstdplus.so.0.1.p/stdplus_fd_impl.cpp.o src/libstdplus.so.0.1.p/stdp=
lus_fd_managed.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_mmap.cpp.o src/libs=
tdplus.so.0.1.p/stdplus_fd_ops.cpp.o src/libstdplus.so.0.1.p/stdplus_io_uri=
ng.cpp.o -Wl,--as-needed -Wl,--no-undefined
 -shared -fPIC -Wl,--start-group -Wl,-soname,libstdplus.so.0 /usr/local/lib=
/libfmt.a -ldl /usr/lib/x86_64-linux-gnu/liburing.so -Wl,--end-group<br>
&gt;&gt; &gt; /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): warning: r=
elocation against `stdout@@GLIBC_2.2.5' in read-only section `.text'<br>
&gt;&gt; &gt; /usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): relocation=
 R_X86_64_PC32 against symbol `stderr@@GLIBC_2.2.5' can not be used when ma=
king a shared object; recompile with -fPIC<br>
&gt;&gt;<br>
&gt;&gt; However you obtained your libfmt, it was compiled incorrectly.&nbs=
p; It<br>
&gt;&gt; shouldn't have a static library but a dynamic one.<br>
&gt;&gt;<br>
&gt;&gt; The `libfmt-dev` package has `libfmt.so` which should be sufficien=
t for<br>
&gt;&gt; linking as a shared library.<br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; Patrick Williams<br>
&gt;&gt; Legal Disclaimer :<br>
&gt;&gt; The information contained in this message may be privileged and co=
nfidential.<br>
&gt;&gt; It is intended to be read only by the individual or entity to whom=
 it is addressed<br>
&gt;&gt; or by their designee. If the reader of this message is not the int=
ended recipient,<br>
&gt;&gt; you are on notice that any distribution of this message, in any fo=
rm,<br>
&gt;&gt; is strictly prohibited. If you have received this message in error=
,<br>
&gt;&gt; please immediately notify the sender and delete or destroy any cop=
y of this message!<br>
</div>
</span></font></div>
</body>
</html>

--_000_DM6PR08MB551486002B71DF6FE9FA3154DCBB9DM6PR08MB5514namp_--
