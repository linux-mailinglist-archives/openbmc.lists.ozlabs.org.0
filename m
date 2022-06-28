Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A126E55C014
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 12:07:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXKz43sTFz3f3X
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 20:07:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=aS27abkI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex.com (client-ip=185.132.180.100; helo=mx07-002d6701.pphosted.com; envelope-from=prvs=317873f221=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=aS27abkI;
	dkim-atps=neutral
X-Greylist: delayed 4849 seconds by postgrey-1.36 at boromir; Tue, 28 Jun 2022 20:04:37 AEST
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com [185.132.180.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXKvT1Vh6z3fSg
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 20:04:35 +1000 (AEST)
Received: from pps.filterd (m0132505.ppops.net [127.0.0.1])
	by mx07-002d6701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25S363RQ017837
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 08:43:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version; s=dkim;
 bh=9JJt8fYkxymaFYkE4YrzngfMw+PRmsYRL0q2QSg9/4A=;
 b=aS27abkIRkFlyCqh4j0BQKGRweTqoz3qAOF63pteHuIif3SY+O382lCL0c/l/3wr2ZOX
 +ZIFsXP0PTLR+oRNOoDkHqu0KZoJrMOtgdokf6J04c28vvHXI60WoKmdqJ55H9wZPkB0
 8uVwf3lG7tjAXcYSawXCosAoJh+CHiU9ZJo118pI4VxOO+ZHXpqgt0/bOKpISPhLRIPl
 +hNfHxuxzPPuwPLsMjFJAkb2hg010Efhax5lgV55oCYUtBl+l/EA2aLMXrZ7os0I6qDs
 ShooXc8OpWVTsbjVjfHBQbSwgr4ZjWo+d3btHH0e7dZdfeRetNicjpb9M9v8jXIz3hdF Qg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx07-002d6701.pphosted.com (PPS) with ESMTPS id 3gybg3nm0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 08:43:42 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=AQmHqx7wlLD+AtwIMuV1ghF1JwduM7brlciQXSW/2OrED0lwvt91/hz96QjWpdQioxa5ir8qm0WezQZiyKbRgCO/SDgNmwu9SROojS0cCs7YSkdSTweUc7TvFgqexIQiL5V503v5RWz5Uwn+S3wjoBHK8nN9MlOM6kLbfPrbg53P+SoTzfxyB70CS6rNYA/mdVi8FpmfMap2Zrul8cB9lYZ2oW0PDiVT9rtdS66Vko3oocn5d6wME3R8xBp2iTAS9q4IcaHEyU1HaKb3gAGDJUG6x6puC8AQX/sqj9Mun7J8NYwSvb02+caI7jRB7ZkEiQGHx5BRgtoQjc3X1gkw3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgOgKMsOb5HAmgfTkUFcHpLetLUbW0qrcD7ixXk+98Q=;
 b=Y9dsE3FU724q2IHtl0lkPhidHMC40/doCJ6eIJzn05vkN2x+gVDHrpW3aUGw9fX3xDM+HlzJHs5gk4tV/ZP1t08McoSvwwLVowvL78ojCNFmjwqX2gbN3vxZ5HmNH25vVkxpfMEjcD37kZn/6zclZ/L8qFLRow8NICcWhO/l2wzOxLCGy4z7W2I6y9EBjoz05YPAlEzk+T+CeOwNxShkhNuLLdB0QVfXJdo7fUYHjE+kKX9w4GqfRkamebyC6Ca6brP2z9dKCJKPKVM5BMRpd4MWxIIEuUnvDWbt+O86FJTKCr3Dblil4XmGitSrHxcWX3p03MGr6rYjnsRFsjJi8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 144.49.247.125) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=flex.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject header.from=flex.com;
 dkim=none (message not signed); arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=flex.com] dkim=[1,1,header.d=flex.com]
 dmarc=[1,1,header.from=flex.com])
Received: from DM6PR05CA0065.namprd05.prod.outlook.com (2603:10b6:5:335::34)
 by BN7PR08MB3923.namprd08.prod.outlook.com (2603:10b6:406:81::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 08:43:38 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::fd) by DM6PR05CA0065.outlook.office365.com
 (2603:10b6:5:335::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.13 via Frontend
 Transport; Tue, 28 Jun 2022 08:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.125)
 smtp.mailfrom=flex.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.125 as permitted sender)
 receiver=protection.outlook.com; client-ip=144.49.247.125;
 helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.125) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 08:43:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ri4uqIC7sR8Q4Mm+I33uERwLceEYLvXNdaL++yHHXLzkX5QbE7pGl26rxnNJ2/T++WWjvx8YXdwnbEKX/aoIrEu4+6DWSomVtf1ojZr8XpvDdUnYki4jgAcXpkR27Q91Bk9tt8TrxswhYvoLsNkz5y9CaEbHc3QmX05UcFu7gPTxDVIavokjYbyJV+RIfeGcBwRM9dDqI5EJpzdmPKIuJ+IcQuhZBpJhNhM5QXB/sA30j7BzD6UJ4aurHn4REy+YSIybptx0sp3Prz3cYlEQ111FjX3lAa2I8/Oiw7XuAkKbHFijZt3vpJRW/RQJxdn1N1n7sl7hKYB00ix5e9/AqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgOgKMsOb5HAmgfTkUFcHpLetLUbW0qrcD7ixXk+98Q=;
 b=gBGeYxZWkrNQBzs1jEQ9fIeGpIk5qoBmKbXTaUKsXeUKuJ1nPXQ11VDbwYlCmHqfAeNs7OSOEjX9UKfFTIp3qEg+It7cBgOVtXF0BzyIQ9G3h0kXsTobKIq3wQ5zyv+jt1gITQ8LQXnE1ykoDO5w/yvIGv+PGzR1VNi6pSfVDQMC4TSEymNTDwZTK9EsgqF3Fwj82M8YbkxdDF5U0JmdEc0kmvU2G7gZN4jJE1ZB7Qqd2W7LG/Su3czwtcVNey7/vmigv1VCRUXREwqlNVeuxX8syyN1wGdRP+xxf6E4lbpjeNmkkxFJcCmtxNzIcO4wK+U/6ukT5ffuDCWeTaFFgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by SJ0PR08MB7559.namprd08.prod.outlook.com (2603:10b6:a03:3fa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Tue, 28 Jun
 2022 08:43:35 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::960:23b3:fa5b:3337]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::960:23b3:fa5b:3337%7]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 08:43:34 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [phosphor-ipmi-flash]: stdplus build failed before building the
 host-tool on the Host
Thread-Topic: [phosphor-ipmi-flash]: stdplus build failed before building the
 host-tool on the Host
Thread-Index: AQHYisb2HUY239zLUU6wGg4gKCe49g==
Date: Tue, 28 Jun 2022 08:43:34 +0000
Message-ID:  <DM6PR08MB55142CF0ABFA607D4F2C8317DCB89@DM6PR08MB5514.namprd08.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 9606482d-6253-d71c-9ae6-0f85c049f33b
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=flex.com;
X-MS-Office365-Filtering-Correlation-Id: a3f07074-68f0-4fc3-a425-08da58e24b1d
x-ms-traffictypediagnostic: 	SJ0PR08MB7559:EE_|DM6NAM11FT031:EE_|BN7PR08MB3923:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  olv72JMWMIIgS7pC/lxe83ZbwjHmwLpTpvHG3JgaTm3s/2c4yy53DqBhkSnriGzVAS1POqsRHr++URYgKfhsVMpCFQhYxHec2rq40+8w5xi9uaJgOMmpbTQVUMpJ2ms6h6VvUHrcSc3xvHX9jKhkPQpCQ7c4dvrs2eIgIte0Cx7/28+9R5opCP5OqVkhimuyBWeOv54enStV/PEL4JCHm8QT9HvfK8by+DaESFzHFl5a8hb3+VdUQwuaxlaTgcpOT6LuwxjO1/YUGJeEBj4RXX14NyChtz8KBjw/eEN2yTABvrJOS/y9y2ip7xOPTYCkX7wO7UlPG/a0hSTRHKCVc+sxqLCIuhaZumoplGoT3P4pReO0RvVst4Pobm5xzD5lpSHtPAvLM7zpApOspXeV+qt5ALofESR5NBd1Gt/FXUyheeeHFmErviksNjTgGNr5paVgTXvD4Nx1Q+BqUSEheBpz+Pc14IZIT8JnvamODATAFhZq2HU4M54hX26LhCqGHvgUII9c/lUuYQkMJqAjNnsGmihYHhSbZ2LPFV5dD+Jm6/aRXQg0T1KJtl4vuULG5dKa/CYFPaNyySEBBAjV81xfClnGqT4RHeBcNs7Pfpd7ZzEIlWyxtDPivyzZks7BvcP0dfdVETxaMjO0YgdK4A0LnGBr9TPpyqrQ5g4lTu2bq0jenlXQY50T4YLS+d0sb+fcwPZG8RRr3nYzJbYJcoOe6O7hg4MNqfBQ8WGFUpiVXraZHdfp3K9tFzBSV3uBRdNVTk077FYF0QXwhYitn8FQaoNfJ0wl7fbY9DyHZaU=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR08MB5514.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(55016003)(2906002)(316002)(6916009)(41300700001)(33656002)(38070700005)(71200400001)(38100700002)(4326008)(186003)(122000001)(19627405001)(26005)(91956017)(9686003)(8676002)(107886003)(7696005)(6506007)(64756008)(52536014)(76116006)(5660300002)(8936002)(83380400001)(66446008)(66556008)(66946007)(478600001)(86362001)(66476007);DIR:OUT;SFP:1102;
Content-Type: multipart/alternative;
	boundary="_000_DM6PR08MB55142CF0ABFA607D4F2C8317DCB89DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR08MB7559
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	1aba269c-313a-46b5-f4c1-08da58e249a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ySbLQgAoVGg5J03Fa4/1wcuhkfWHyaqqcAFC56PByep/QE8s8218bmoCqQsdRBG75Ce5PMWh9x9Dr8u5ca3kvfF410m8e1pgqgochLY3M+wlwEWFX+jhuoAUVkKKWDUfKSIHqbQ9akts05SWfg8Xn2gY3wdPutrS/tiHGDCElpBModpomdA51dIsFB6IjZ6cUyOBt10JNOsEDNriKhuwcH889LL51LNogVV7XXLzg4MjgTxxlKVcRqju+vN6UmpEZ9xa5uHoMTYIZRzTFmLJ+ChfCgycbwrvxtocijhwCrEbKMiXgwbwmUvEiDG66NUWr5KP0hm4jO7YeF2bTFzptEoA+B/zNdl6F6PsaKyy9QScp8ktSyBCd1Xr6OldXFIWoWEHbI76CowWJ2GJRd/6mnaGlEecOrHo9Ne4ot3Auoyc+b3ST7riSi90mFki9XHMjjzl0YLOynBT8w57tHf31u0SsjCoPwKAp6p4DTUA+3y3Ex8TUXEiu+L3KvpqcJw8NptDDJOuVQ28TA3uGskUnTEQieR0TznKQYGINAbmyavTNmfcIf+UxlNrrOVkngXPz938ckoPL1RQd7KTQA0a3380A6mheubqxbsE73Pv4t/H8NXOo3mJsiXEolpoN5eYDZTDMMb9XdHp5Is0zlpnOjgxuFUvIlXveN3oIYWKDSLH7ANKt3j2nb2fuDL+Kxpr8Avup29RedEbr2Ryj3KV6OJinpBlHdGSQLTG6AJTXELUVjjtj0qJh9F+0qCXwlvMVm7jPvKkh41GcXrYCN3MnkFElsWjb5g1giRWsUDQR0ROf8eRdLa/Dar1cZwAGS44MVM3oKY1MIj//dIMCxV+Ig==
X-Forefront-Antispam-Report: 	CIP:144.49.247.125;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.ds.dlp.protect.symantec.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(346002)(39860400002)(396003)(40470700004)(36840700001)(46966006)(82310400005)(4326008)(70586007)(8936002)(478600001)(26005)(70206006)(9686003)(19627405001)(7696005)(52536014)(316002)(107886003)(55016003)(356005)(6506007)(82740400003)(41300700001)(8676002)(186003)(33656002)(83380400001)(40460700003)(47076005)(86362001)(336012)(5660300002)(81166007)(36860700001)(2906002)(40480700001)(6916009)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 08:43:36.9308
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f07074-68f0-4fc3-a425-08da58e24b1d
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e;Ip=[144.49.247.125];Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR08MB3923
X-Proofpoint-ORIG-GUID: 6_kFSz_5ijN5qNrpttxFRAOe2BejDXks
X-Proofpoint-GUID: 6_kFSz_5ijN5qNrpttxFRAOe2BejDXks
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_09,2022-06-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 mlxlogscore=653 clxscore=1011 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206280035
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
Cc: "Chris Chen \(TPI\)" <Chris.Chen3@flex.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM6PR08MB55142CF0ABFA607D4F2C8317DCB89DM6PR08MB5514namp_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="big5"

SGkgZXZlcnlvbmUsDQoNCkkgZm9yIG5vdyBhbSB0cnlpbmcgdG8gZW5hYmxlIHRoZSBJbi1CYW5k
IFVwZGF0ZSBvZiBCTUMgRmlybXdhcmUgdXNpbmcgT0VNIElQTUkgQmxvYiBUcmFuc3BvcnQgZmVh
dHVyZS4gU28gSSBmb2xsb3dlZCB0aGUgUkVBRE1FLm1kIGluIHRoZSBwaG9zcGhvci1pcG1pLWZs
YXNoIHJlcG8gdG8gYnVpbGQgdGhlIGhvc3QtdG9vbCBvbiB0aGUgSG9zdCwgdGhlIEhvc3QgaXMg
cnVubmluZyB0aGUgVWJ1bnR1IDIyLjA0IHdpdGggaW5zdGFsbGluZyBnY2MsIGcrKywgY21ha2Us
IGFuZCBtZXNvbiB0b29scyB3aGljaCB2ZXJzaW9ucyBhcmUgYXMgYmVsb3c6DQo9PT09PQ0KYXJj
aGVyQGFyY2hlci1BcmNoZXJDaXR5TTpzdGRwbHVzJCBnY2MgLS12ZXJzaW9uDQpnY2MgKFVidW50
dSAxMS4yLjAtMTl1YnVudHUxKSAxMS4yLjANCmFyY2hlckBhcmNoZXItQXJjaGVyQ2l0eU06c3Rk
cGx1cyQgZysrIC0tdmVyc2lvbg0KZysrIChVYnVudHUgMTEuMi4wLTE5dWJ1bnR1MSkgMTEuMi4w
DQphcmNoZXJAYXJjaGVyLUFyY2hlckNpdHlNOnN0ZHBsdXMkIGNtYWtlIC0tdmVyc2lvbg0KY21h
a2UgdmVyc2lvbiAzLjIyLjENCmFyY2hlckBhcmNoZXItQXJjaGVyQ2l0eU06c3RkcGx1cyQgbWVz
b24gLS12ZXJzaW9uDQowLjYxLjINCj09PT09DQoNCkFuZCBlYWNoIGxpYnJhcnkgYW5kIHRvb2wg
aXMgYnVpbHQgc3VjY2Vzc2Z1bChvbmx5IG9uZSB0aGluZyB0aGF0IGlzIEkgaGFkIHRvIGRpc2Fi
bGUgQysrMjAgZm9yIHRoZSBpcG1pLWJsb2ItdG9vbCwgb3RoZXJzIHdlcmUgZmluZSkgdW50aWxJ
IHN0YXJ0ZWQgdG8gYnVpbGQgdGhlIHN0ZHBsdXMuIEkgZW5jb3VudGVyZWQgYSBidWlsZCBmYWls
ZWQgaXNzdWUgYXMgYmVsb3cuIEl0IGxvb2tzIGxpa2UgdGhlcmUgaXMgYSBwcm9ibGVtIGZvciB1
c2luZyBsaWJmbXQuYSwgSSB0cmllZCB0byBmaWd1cmUgb3V0IGEgc29sdXRpb24gb24gZ29vZ2xl
IGJ1dCBub3RoaW5nIGlzIHJlbGF0ZWQgdG8gdGhpcy4gQ291bGQgYW55b25lIGhlbHAgb24gdGhp
cz8gVGhhbmtzLg0KDQo9PT09PQ0KYXJjaGVyQGFyY2hlci1BcmNoZXJDaXR5TTpzdGRwbHVzJA0K
YXJjaGVyQGFyY2hlci1BcmNoZXJDaXR5TTpzdGRwbHVzJCBtZXNvbiBzZXR1cCAtRGV4YW1wbGVz
PWZhbHNlIC1EdGVzdHM9ZGlzYWJsZWQgYnVpbGRkaXINClRoZSBNZXNvbiBidWlsZCBzeXN0ZW0N
ClZlcnNpb246IDAuNjEuMg0KU291cmNlIGRpcjogL2hvbWUvYXJjaGVyL0Rvd25sb2Fkcy9ob3N0
LXRvb2wvc3RkcGx1cw0KQnVpbGQgZGlyOiAvaG9tZS9hcmNoZXIvRG93bmxvYWRzL2hvc3QtdG9v
bC9zdGRwbHVzL2J1aWxkZGlyDQpCdWlsZCB0eXBlOiBuYXRpdmUgYnVpbGQNClByb2plY3QgbmFt
ZTogc3RkcGx1cw0KUHJvamVjdCB2ZXJzaW9uOiAwLjENCkMrKyBjb21waWxlciBmb3IgdGhlIGhv
c3QgbWFjaGluZTogYysrIChnY2MgMTEuMi4wICJjKysgKFVidW50dSAxMS4yLjAtMTl1YnVudHUx
KSAxMS4yLjAiKQ0KQysrIGxpbmtlciBmb3IgdGhlIGhvc3QgbWFjaGluZTogYysrIGxkLmJmZCAy
LjM4DQpIb3N0IG1hY2hpbmUgY3B1IGZhbWlseTogeDg2XzY0DQpIb3N0IG1hY2hpbmUgY3B1OiB4
ODZfNjQNCkZvdW5kIHBrZy1jb25maWc6IC91c3IvYmluL3BrZy1jb25maWcgKDAuMjkuMikNClJ1
bi10aW1lIGRlcGVuZGVuY3kgZm10IGZvdW5kOiBZRVMgOC4xLjINCkxpYnJhcnkgZGwgZm91bmQ6
IFlFUw0KUnVuLXRpbWUgZGVwZW5kZW5jeSBsaWJ1cmluZyBmb3VuZDogWUVTIDIuMA0KQnVpbGQg
dGFyZ2V0cyBpbiBwcm9qZWN0OiAxDQoNCnN0ZHBsdXMgMC4xDQoNCiAgVXNlciBkZWZpbmVkIG9w
dGlvbnMNCiAgICBleGFtcGxlczogZmFsc2UNCiAgICB0ZXN0cyAgIDogZGlzYWJsZWQNCg0KRm91
bmQgbmluamEtMS4xMC4xIGF0IC91c3IvYmluL25pbmphDQphcmNoZXJAYXJjaGVyLUFyY2hlckNp
dHlNOnN0ZHBsdXMkDQphcmNoZXJAYXJjaGVyLUFyY2hlckNpdHlNOnN0ZHBsdXMkDQphcmNoZXJA
YXJjaGVyLUFyY2hlckNpdHlNOnN0ZHBsdXMkIG5pbmphIC1DIGJ1aWxkZGlyDQpuaW5qYTogRW50
ZXJpbmcgZGlyZWN0b3J5IGBidWlsZGRpcicNCls5LzldIExpbmtpbmcgdGFyZ2V0IHNyYy9saWJz
dGRwbHVzLnNvLjAuMQ0KRkFJTEVEOiBzcmMvbGlic3RkcGx1cy5zby4wLjENCmMrKyAgLW8gc3Jj
L2xpYnN0ZHBsdXMuc28uMC4xIHNyYy9saWJzdGRwbHVzLnNvLjAuMS5wL3N0ZHBsdXNfZXhjZXB0
aW9uLmNwcC5vIHNyYy9saWJzdGRwbHVzLnNvLjAuMS5wL3N0ZHBsdXNfc2lnbmFsLmNwcC5vIHNy
Yy9saWJzdGRwbHVzLnNvLjAuMS5wL3N0ZHBsdXNfZGwuY3BwLm8gc3JjL2xpYnN0ZHBsdXMuc28u
MC4xLnAvc3RkcGx1c19mZF9jcmVhdGUuY3BwLm8gc3JjL2xpYnN0ZHBsdXMuc28uMC4xLnAvc3Rk
cGx1c19mZF9kdXBhYmxlLmNwcC5vIHNyYy9saWJzdGRwbHVzLnNvLjAuMS5wL3N0ZHBsdXNfZmRf
aW1wbC5jcHAubyBzcmMvbGlic3RkcGx1cy5zby4wLjEucC9zdGRwbHVzX2ZkX21hbmFnZWQuY3Bw
Lm8gc3JjL2xpYnN0ZHBsdXMuc28uMC4xLnAvc3RkcGx1c19mZF9tbWFwLmNwcC5vIHNyYy9saWJz
dGRwbHVzLnNvLjAuMS5wL3N0ZHBsdXNfZmRfb3BzLmNwcC5vIHNyYy9saWJzdGRwbHVzLnNvLjAu
MS5wL3N0ZHBsdXNfaW9fdXJpbmcuY3BwLm8gLVdsLC0tYXMtbmVlZGVkIC1XbCwtLW5vLXVuZGVm
aW5lZCAtc2hhcmVkIC1mUElDIC1XbCwtLXN0YXJ0LWdyb3VwIC1XbCwtc29uYW1lLGxpYnN0ZHBs
dXMuc28uMCAvdXNyL2xvY2FsL2xpYi9saWJmbXQuYSAtbGRsIC91c3IvbGliL3g4Nl82NC1saW51
eC1nbnUvbGlidXJpbmcuc28gLVdsLC0tZW5kLWdyb3VwDQovdXNyL2Jpbi9sZDogL3Vzci9sb2Nh
bC9saWIvbGliZm10LmEoZm9ybWF0LmNjLm8pOiB3YXJuaW5nOiByZWxvY2F0aW9uIGFnYWluc3Qg
YHN0ZG91dEBAR0xJQkNfMi4yLjUnIGluIHJlYWQtb25seSBzZWN0aW9uIGAudGV4dCcNCi91c3Iv
YmluL2xkOiAvdXNyL2xvY2FsL2xpYi9saWJmbXQuYShmb3JtYXQuY2Mubyk6IHJlbG9jYXRpb24g
Ul9YODZfNjRfUEMzMiBhZ2FpbnN0IHN5bWJvbCBgc3RkZXJyQEBHTElCQ18yLjIuNScgY2FuIG5v
dCBiZSB1c2VkIHdoZW4gbWFraW5nIGEgc2hhcmVkIG9iamVjdDsgcmVjb21waWxlIHdpdGggLWZQ
SUMNCi91c3IvYmluL2xkOiBmaW5hbCBsaW5rIGZhaWxlZDogYmFkIHZhbHVlDQpjb2xsZWN0Mjog
ZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMNCm5pbmphOiBidWlsZCBzdG9wcGVkOiBz
dWJjb21tYW5kIGZhaWxlZC4NCj09PT09DQoNCk9mIGNvdXJzZSwgSSBoYXZlIG5vdCB0aGUgYnVy
bl9teV9ibWMgKHRoZSBob3N0LXRvb2wpIHlldC4NCg0KUmVnYXJkcywNCkNocmlzIENoZW4NCgpM
ZWdhbCBEaXNjbGFpbWVyIDoKVGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3Nh
Z2UgbWF5IGJlIHByaXZpbGVnZWQgYW5kIGNvbmZpZGVudGlhbC4gCkl0IGlzIGludGVuZGVkIHRv
IGJlIHJlYWQgb25seSBieSB0aGUgaW5kaXZpZHVhbCBvciBlbnRpdHkgdG8gd2hvbSBpdCBpcyBh
ZGRyZXNzZWQgCm9yIGJ5IHRoZWlyIGRlc2lnbmVlLiBJZiB0aGUgcmVhZGVyIG9mIHRoaXMgbWVz
c2FnZSBpcyBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgCnlvdSBhcmUgb24gbm90aWNlIHRo
YXQgYW55IGRpc3RyaWJ1dGlvbiBvZiB0aGlzIG1lc3NhZ2UsIGluIGFueSBmb3JtLCAKaXMgc3Ry
aWN0bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGluIGVy
cm9yLCAKcGxlYXNlIGltbWVkaWF0ZWx5IG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgb3Ig
ZGVzdHJveSBhbnkgY29weSBvZiB0aGlzIG1lc3NhZ2UhCg==

--_000_DM6PR08MB55142CF0ABFA607D4F2C8317DCB89DM6PR08MB5514namp_
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
Hi everyone,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I for now am trying to enable the In-Band Update of BMC Firmware using OEM =
IPMI Blob Transport feature. So I followed the README.md in the phosphor-ip=
mi-flash repo to build the host-tool on the Host, the Host is running the U=
buntu 22.04 with installing gcc,
 g++, cmake, and meson tools which versions are as below:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-size:12pt;margin:0px">=3D=3D=3D=3D=3D</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<div class=3D"elementToProof">archer@archer-ArcherCityM:stdplus$ gcc --vers=
ion</div>
<div>gcc (Ubuntu 11.2.0-19ubuntu1) 11.2.0</div>
<div>archer@archer-ArcherCityM:stdplus$ g++ --version</div>
<div>g++ (Ubuntu 11.2.0-19ubuntu1) 11.2.0</div>
<div>archer@archer-ArcherCityM:stdplus$ cmake --version</div>
<div>cmake version 3.22.1</div>
<div>archer@archer-ArcherCityM:stdplus$ meson --version</div>
0.61.2&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-size:12pt;margin:0px"><span style=3D"margin:0px">=3D=3D=
=3D=3D=3D</span></span><span style=3D"font-size:12pt;margin:0px"></span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
And each library and tool is built successful(only one thing that&nbsp;is I=
 had to disable C++20 for the ipmi-blob-tool, others were fine) untilI star=
ted to build the stdplus. I encountered a build failed issue as below. It l=
ooks like there is a problem for using&nbsp;<span style=3D"background-color=
:rgb(255, 255, 255);display:inline !important">libfmt.a,
 I tried to figure out a solution on google but nothing is related to this.=
 Could anyone help on this? Thanks.</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
archer@archer-ArcherCityM:stdplus$<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
archer@archer-ArcherCityM:stdplus$ meson setup -Dexamples=3Dfalse -Dtests=
=3Ddisabled builddir
<div>The Meson build system</div>
<div>Version: 0.61.2</div>
<div>Source dir: /home/archer/Downloads/host-tool/stdplus</div>
<div>Build dir: /home/archer/Downloads/host-tool/stdplus/builddir</div>
<div>Build type: native build</div>
<div>Project name: stdplus</div>
<div>Project version: 0.1</div>
<div>C++ compiler for the host machine: c++ (gcc 11.2.0 &quot;c++ (Ubuntu 1=
1.2.0-19ubuntu1) 11.2.0&quot;)</div>
<div>C++ linker for the host machine: c++ ld.bfd 2.38</div>
<div>Host machine cpu family: x86_64</div>
<div>Host machine cpu: x86_64</div>
<div>Found pkg-config: /usr/bin/pkg-config (0.29.2)</div>
<div>Run-time dependency fmt found: YES 8.1.2</div>
<div>Library dl found: YES</div>
<div>Run-time dependency liburing found: YES 2.0</div>
<div>Build targets in project: 1</div>
<div><br>
</div>
<div>stdplus 0.1</div>
<div><br>
</div>
<div>&nbsp; User defined options</div>
<div>&nbsp; &nbsp; examples: false</div>
<div>&nbsp; &nbsp; tests &nbsp; : disabled</div>
<div><br>
</div>
Found ninja-1.10.1 at /usr/bin/ninja<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
archer@archer-ArcherCityM:stdplus$ <br>
archer@archer-ArcherCityM:stdplus$<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
archer@archer-ArcherCityM:stdplus$ ninja -C builddir
<div>ninja: Entering directory `builddir'</div>
<div>[9/9] Linking target src/libstdplus.so.0.1</div>
<div>FAILED: src/libstdplus.so.0.1 </div>
<div>c++ &nbsp;-o src/libstdplus.so.0.1 src/libstdplus.so.0.1.p/stdplus_exc=
eption.cpp.o src/libstdplus.so.0.1.p/stdplus_signal.cpp.o src/libstdplus.so=
.0.1.p/stdplus_dl.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_create.cpp.o src=
/libstdplus.so.0.1.p/stdplus_fd_dupable.cpp.o
 src/libstdplus.so.0.1.p/stdplus_fd_impl.cpp.o src/libstdplus.so.0.1.p/stdp=
lus_fd_managed.cpp.o src/libstdplus.so.0.1.p/stdplus_fd_mmap.cpp.o src/libs=
tdplus.so.0.1.p/stdplus_fd_ops.cpp.o src/libstdplus.so.0.1.p/stdplus_io_uri=
ng.cpp.o -Wl,--as-needed -Wl,--no-undefined
 -shared -fPIC -Wl,--start-group -Wl,-soname,libstdplus.so.0 /usr/local/lib=
/libfmt.a -ldl /usr/lib/x86_64-linux-gnu/liburing.so -Wl,--end-group</div>
<div>/usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): warning: relocation=
 against `stdout@@GLIBC_2.2.5' in read-only section `.text'</div>
<div>/usr/bin/ld: /usr/local/lib/libfmt.a(format.cc.o): relocation R_X86_64=
_PC32 against symbol `stderr@@GLIBC_2.2.5' can not be used when making a sh=
ared object; recompile with -fPIC</div>
<div>/usr/bin/ld: final link failed: bad value</div>
<div>collect2: error: ld returned 1 exit status</div>
ninja: build stopped: subcommand failed.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Of course, I have not the&nbsp;burn_my_bmc (the host-tool) yet.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Chris Chen</div>

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

--_000_DM6PR08MB55142CF0ABFA607D4F2C8317DCB89DM6PR08MB5514namp_--
