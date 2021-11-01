Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A88B24416F5
	for <lists+openbmc@lfdr.de>; Mon,  1 Nov 2021 10:29:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjSRQ3WHQz2yNv
	for <lists+openbmc@lfdr.de>; Mon,  1 Nov 2021 20:29:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=l3PYflAy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=5939c42c49=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=l3PYflAy; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjSQv4JN9z2xXd
 for <openbmc@lists.ozlabs.org>; Mon,  1 Nov 2021 20:29:10 +1100 (AEDT)
Received: from pps.filterd (m0132505.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A13PHMx012910; 
 Mon, 1 Nov 2021 09:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=B3abcyNCiupv/J7TptPlghG/wtclvV/efbVWezsHnZQ=;
 b=l3PYflAypOQHNzAEHvrP3H6j2Kt3m+XwcGxU9kLPrbTdl2u2NVnjzp3O3HkqCDfD94w2
 SYfF8t71+f6fEJfIOCg5MtPPOLYnGb9/9QQK+/kxMjmunfkZLlrxIHaRRiH/kNF5rzxH
 1bddF0GzY/6pQv60ZU4p/iBqNvb5GZrtHKFgvn/8QknYUnrGL9xpNTM3iD3o1OlCawzL
 y7gmW5rGK9nNoHo8Z01h2wsWRPErlM+eDZ99B572CfJKFabZskTQ1TW9LF2dQUFlj6I3
 A+AGstcvkJyMIKF0d3Q8VagePn3Cf0njPqXWu5vms68qsx4Zk7OUzaQptnFaKE4raetT XA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
 by mx07-002d6701.pphosted.com with ESMTP id 3c28aj9s1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Nov 2021 09:29:06 +0000
Received: from BN9PR03CA0804.namprd03.prod.outlook.com (2603:10b6:408:13f::29)
 by BY5PR08MB6373.namprd08.prod.outlook.com (2603:10b6:a03:1ef::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Mon, 1 Nov
 2021 09:29:03 +0000
Received: from BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::a5) by BN9PR03CA0804.outlook.office365.com
 (2603:10b6:408:13f::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Mon, 1 Nov 2021 09:29:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.88)
 smtp.mailfrom=flex.com; yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.88 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.88; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.88) by
 BN8NAM11FT042.mail.protection.outlook.com (10.13.177.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Mon, 1 Nov 2021 09:29:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cg/aCNPm7JBDul30Tr7sZ6DgRvUskoZPoPmSjggqs/3bTa+iS8MnSyQ1ncukv255FzzuHhENjIBeQKq9Dae397CjtSIZcDG1ZaXHKyer0S5ihffL7cWtTiZfmT5NYyg77Gmnro7stW+swH0EVcknS6UtOrkAFLLd8zegShCG7yKoiqENlxawGabW0eHf1dU31EpZxd/VmpZR1/cNtOxo6+jpSs2LP7HsgxnJwSohZXW0MTx0T2uXFKeHyFaQNeAtsZR5moUZMLzwhTsuBHhayuLZyi6my9m+pM5WtscJ/G6yi0Omv5maLKEInr/I9k8vmfToxX6EykPYPgQ3P1GH3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3abcyNCiupv/J7TptPlghG/wtclvV/efbVWezsHnZQ=;
 b=JScwmeS3VviKpjFdonUYETOO32FFbeEfTB0haZLu52LxogNw5KDOT3l8qtaoCXeO2S+9xgGni9zDnc94gKXsGlJH7ikSleG9K16VX2bzaAWy2IUgL5Brwl/uH98W9632tqaFKqSrBnbs7ilGlaUxRKIM5rc1I6dPuz7v5QqnF640ylUO2R5DfNhUlhrxpS2qUcGu05b/PXQZlWU8sbYzUFdozX/DkIKaIDWoKECHbZa/CYa9D6LSZcyYgJ9uh1Fi5rBY9mX2LQbCuY704ZscDFa3Wa3bhHw1wM3+O2ji9bVRtKP4KUzshiPIaPCGEJAwVzj6sTzVgavAi5y1RZp+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (2603:10b6:5:10a::33)
 by DM6PR08MB4748.namprd08.prod.outlook.com (2603:10b6:5:42::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.19; Mon, 1 Nov
 2021 09:29:00 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::b084:d3b3:942c:d1e9]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::b084:d3b3:942c:d1e9%3]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 09:29:00 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Andrei Kartashev <a.kartashev@yadro.com>
Subject: =?ks_c_5601-1987?B?/N7c3Tog/N7c3TogW2VudGl0eS1tYW5hZ2VyXSBRdWVzdGlvbiBh?=
 =?ks_c_5601-1987?Q?bout_temperature_sensor_stops_update?=
Thread-Topic: =?ks_c_5601-1987?B?/N7c3TogW2VudGl0eS1tYW5hZ2VyXSBRdWVzdGlvbiBhYm91dCB0?=
 =?ks_c_5601-1987?Q?emperature_sensor_stops_update?=
Thread-Index: AdfMmz3NOQzNV/g/Qrqy2k/lLM6/kQABG20AAAAUydwAAm0oAACVBJp0
Date: Mon, 1 Nov 2021 09:29:00 +0000
Message-ID: <DM6PR08MB5514B899D36CC4D70D02A1A2DC8A9@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB5514480BAD48B0B200646011DC879@DM6PR08MB5514.namprd08.prod.outlook.com>
 <8c73fd80b5e4672e7dcac777cd5d46bc5d6bf0e1.camel@yadro.com>
 <DM6PR08MB5514F7D9632896C305F0CCFDDC879@DM6PR08MB5514.namprd08.prod.outlook.com>
 <a49158e3ebbc40465c73dae77a037643cdc2b7c3.camel@yadro.com>
In-Reply-To: <a49158e3ebbc40465c73dae77a037643cdc2b7c3.camel@yadro.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 4339e366-5cf7-3935-f9b4-4ab8c95bf934
Authentication-Results-Original: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=flex.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c7ac02be-01cb-4a5f-f9d3-08d99d1a0ad2
x-ms-traffictypediagnostic: DM6PR08MB4748:|BY5PR08MB6373:
X-Microsoft-Antispam-PRVS: <BY5PR08MB6373A2219351B4A0C3CAB50EDC8A9@BY5PR08MB6373.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lQT62tUfrGT/8aXD+b+CouZY6Tb8QSQtETynOybKF0vP+9Ke7dyimruo9JPNDaWRdkQ1YuGa7qJ+C0IoIRH5Oi5h6An4iuMuvgRUecY3YgQDsrxCxmXV5us3iY931/h79sBeqqDMCVcDUBMT8CPjhPcuo5VVpmF+7lQAVvv/uUuR/iY1ugBCs5pu/vVnPBCcEU2Z+DGysYNUeQ3JSJQwV//hyx02ZKOB6rBzRd+8iYjzjdYuSNHftz9XiAlQLSoVFNVDH5Fjyu2PzUSn8jBZv6RfowsWiMHy1Rw3Nj3EnZghCMCrqaAo4SjURtqI0JnUyZwYKBwb5CmfwddlXmQjb9X+fT6CTHBa8A+f9M4t9qyPC0MoGUQanv6xVQeS22OEq6BGWb4zBIRq0+PhYvj7PUNX+F9nQw4w1MhlX51h1dbXV+GvX80F95Im+ZId+p7euFXVNfOFQqm2jtbYC2od+yPGpGHx0JeUSddggIEllX+pSAVcdOxJlDM5YxLJNz6xegM5gpGXce7Sz+S9DUGbjcOlT/K5w79U+NSmJgh/05JGrr2FqlHxsf9TEE9LnK3ueQpg/5jxbBQ1VnzClQ6rIll/FaRLa7VfHvR9WqJHZ+jjiVGP8bj/CyxKal4c7I31ckZQv/9RvMTu6lv3bbOHH/IjeH6xQeiIMt4LN3stzoMzHiDj3cbQDLFD6mIAC9aHo7TNdfi7LKXVpaqMXauqoA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(186003)(508600001)(19627235002)(91956017)(66946007)(66556008)(66446008)(64756008)(33656002)(66476007)(38100700002)(38070700005)(83380400001)(2906002)(76116006)(9686003)(55016002)(122000001)(52536014)(7696005)(4326008)(19627405001)(6916009)(71200400001)(8936002)(224303003)(86362001)(5660300002)(6506007)(4001150100001)(15650500001)(316002);
 DIR:OUT; SFP:1102; 
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB5514B899D36CC4D70D02A1A2DC8A9DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB4748
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: ccc5583f-d25d-492a-1911-08d99d1a09b0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MpGk6VyyMCPdj5oL6qBpk3LUHsRod2PnPGdid2xPhEV+vynQs+jF8NKAhlaRIIhZj5IZIp4eZMSHguqP3XqVUXQhXsDeL+WnlAiK+GzW1Ea/zvx1rn7KcJuZY0IM/bVXQPTqIYeGnL3gpAZDRDFmLeiljTna/DyWrDHMidxzAgZ1def7CdFqRTyePvnoSOmhww65AdwutZikZWZQLu8BqW7n2LIUsfTZ32Uij7cO61iNY06eVL2TgnmwlaIuTWCRvFsiRtN8M+7l8NThiU0A+YYI1vXouuMB17lTBVDIsRzLLy9Mo1Urg18+sBaJpCWyE6mwTkDQhhE2JUCo4tDLrGGlgtdwnO/wvclMqWavzLh2siqqpp5v3iSBOOrl6xJnreySTPwPWS2fafd+Pn8pQYhWLcFdJ2z3MHTsKnilrKHAcpoDTZ2wThFff+5qkShhO9814Wd/1SZPA9JG2e6w8jAsW80IkDFOEI2ovZn/T84JAoRP28qtQ8GGs480SzRYD0iqqpnKma7MYi5bVK1hppow7ObAOoDnYO+rbJ3UKS81QB4pln8sz8vrqP6p5pClP1an/QE/yHjuqY0tcDe3xQ6LQryqUcwb9a2TQZHDDK0NMkyZXtihfDOvd56bgMZAn5CtCgS5+ywWfZYEazLucVRdRTbVODVhvK2+rlOFytLRXzVlvhLmPpfbaSmTmNUOCT5Yf6FfXSq0CS/s7y3I8FLq94YnUdxIENtalQfDCyI=
X-Forefront-Antispam-Report: CIP:144.49.247.88; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(46966006)(36840700001)(26005)(2906002)(70206006)(70586007)(36860700001)(4326008)(224303003)(6916009)(52536014)(7696005)(5660300002)(4001150100001)(86362001)(82310400003)(30864003)(15650500001)(4186021)(316002)(19627405001)(33656002)(336012)(47076005)(19627235002)(81166007)(6506007)(8936002)(508600001)(186003)(356005)(9686003)(55016002)(83380400001)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 09:29:02.4525 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ac02be-01cb-4a5f-f9d3-08d99d1a0ad2
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.88];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR08MB6373
X-Proofpoint-GUID: u7-Kh20B_UkD-awq3c5N-zxXYcN0Rj3J
X-Proofpoint-ORIG-GUID: u7-Kh20B_UkD-awq3c5N-zxXYcN0Rj3J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-01_03,2021-10-29_03,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 clxscore=1015 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111010054
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

--_000_DM6PR08MB5514B899D36CC4D70D02A1A2DC8A9DM6PR08MB5514namp_
Content-Type: text/plain; charset="ks_c_5601-1987"
Content-Transfer-Encoding: base64

SGkgQW5kcmVpLA0KDQpJIGZpZ3VyZWQgb3V0IHRoZSByb290IGNhdXNlIGlzIHRoZSBzZW5zb3Ig
dHlwZSBJIGFtIHVzaW5nIGlzIEFEVDc1IHJhdGhlciB0aGFuIFRNUDc1LiBTbyBpdCB3b3JrcyBh
ZnRlciBJIGNoYW5nZWQgdGhlICJUeXBlIjogIkFEVDc1IiBpbiB0aGUgSlNPTiBjb25maWd1cmF0
aW9uIGZpbGUgYW5kIGFkZGVkIEFEVDc1IGluIHRoZSBkZXZpY2VzLmhwcC4NCg0KPT09PT09PT09
PT09PT09PQ0KWyAgIDMzLjE1NDkzNV0gbG03NSA2LTAwNDk6IGh3bW9uMTogc2Vuc29yICdhZHQ3
NScNClsgICAzMy4xNjAyODddIGkyYyBpMmMtNjogbmV3X2RldmljZTogSW5zdGFudGlhdGVkIGRl
dmljZSBhZHQ3NSBhdCAweDQ5DQpbICAgMzMuMTY5ODk0XSBsbTc1IDYtMDA0YzogaHdtb24yOiBz
ZW5zb3IgJ2FkdDc1Jw0KWyAgIDMzLjE3NTIwMV0gaTJjIGkyYy02OiBuZXdfZGV2aWNlOiBJbnN0
YW50aWF0ZWQgZGV2aWNlIGFkdDc1IGF0IDB4NGMNClsgICAzMy4xODQ2NThdIGxtNzUgNi0wMDRk
OiBod21vbjM6IHNlbnNvciAnYWR0NzUnDQpbICAgMzMuMTkwMDA3XSBpMmMgaTJjLTY6IG5ld19k
ZXZpY2U6IEluc3RhbnRpYXRlZCBkZXZpY2UgYWR0NzUgYXQgMHg0ZA0KDQpyb290QGh1ZHNvbmJh
eS1vYm1jOn4jIGNhdCAvc3lzL2J1cy9pMmMvZGV2aWNlcy82LTAwNGQvaHdtb24vaHdtb24zL3Rl
bXAxX2lucHV0DQo0MTMxMg0Kcm9vdEBodWRzb25iYXktb2JtYzp+IyBjYXQgL3N5cy9idXMvaTJj
L2RldmljZXMvNi0wMDRkL2h3bW9uL2h3bW9uMy90ZW1wMV9pbnB1dA0KNDEzNzUNCj09PT09PT09
PT09PT09PT0NCg0KVGhhbmsgeW91IGZvciB5b3VyIHN1cHBvcnQuDQoNClJlZ2FyZHMsDQpDaHJp
cyBDaGVuDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQrQ9svs7bo6IEFuZHJl
aSBLYXJ0YXNoZXYgPGEua2FydGFzaGV2QHlhZHJvLmNvbT4NCtD2y+zs7dGiOiAyMDIx0rQxMOrF
Mjns7SD5u+ftIDA1OjQ1DQripcvs7bo6IENocmlzIENoZW4gKFRQSSkgPENocmlzLkNoZW4zQGZs
ZXguY29tPg0K8avyqTogUmU6IPze3N06IFtlbnRpdHktbWFuYWdlcl0gUXVlc3Rpb24gYWJvdXQg
dGVtcGVyYXR1cmUgc2Vuc29yIHN0b3BzIHVwZGF0ZQ0KDQpPaCwgdGhhdCBzb3VuZHMgcmVhbGx5
IHN0cmFuZ2UuIEFyZSB5b3Ugc3VyZT8NCldoZW4geW91IHJlYWQgaXQgcmF3IChjYXQgL3N5cy9i
dXMvaTJjL2RldmljZXMvNi0NCjAwNGQvaHdtb24vaHdtb24zL3RlbXAxX2lucHV0KSBpcyBpdCBh
bHNvIGFsd2F5cyBzYW1lPyBJZiB5ZXMsIHRoZW4sIGl0DQppcyBzb21ldGhpbmcgaW4ga2VybmVs
IC0gdHJ5IHRvIGV4cGVyaW1lbnQgd2l0aCBuZXdfZGV2aWNlIHN5c2ZzDQppbnRlcmZhY2UuDQoN
Ck9uIEZyaSwgMjAyMS0xMC0yOSBhdCAwODo1MCArMDAwMCwgQ2hyaXMgQ2hlbiAoVFBJKSB3cm90
ZToNCj4gSGkgQW5kcmVpLA0KPg0KPiBUaGFua3MgZm9yIHlvdXIgcHJvbXB0IHJlcGx5IGFuZCB0
aGUgZXhwbGFuYXRpb24gb2YgIzIsIEkgdW5kZXJzdG9vZA0KPiBub3cuDQo+DQo+IEZvciBxdWVz
dGlvbiAjMSwgbGV0IG1lIHJlcGhyYXNlIGl0LCBwbGVhc2UuIEkgbWVhbiB0aGUgdGVtcGVyYXR1
cmUNCj4gdmFsdWUgSSByZWFkIGlzIGFsd2F5cyB0aGUgc2FtZS4gVGhlIHZhbHVlIGFsd2F5cyBz
aG93cyA0MC4xODcsIGl0DQo+IHdvdWxkbid0IGJlIGNoYW5nZWQgZXZlbiBJIHJlYWQgaXQgYWdh
aW4gYWZ0ZXIgYSB3aGlsZS4gQnV0IGlmIEkNCj4gZGVjbGFyZSB0aGUgdGVtcCBzZW5zb3JzIG9u
IHRoZSBJMkMgYnVzIG5vZGUgaW4gbXkgZHRzLCB0aGUgdmFsdWUgd2lsbA0KPiBjaGFuZ2UgYWxs
IHRoZSB0aW1lLiBEbyB5b3UgaGF2ZSBhbnkgaWRlYSBhYm91dCB0aGlzPw0KPg0KPg0KPiBSZWdh
cmRzLA0KPiBDaHJpcyBDaGVuDQo+DQo+IND2y+ztujogQW5kcmVpIEthcnRhc2hldiA8YS5rYXJ0
YXNoZXZAeWFkcm8uY29tPg0KPiDQ9svs7O3RojogMjAyMdK0MTDqxTI57O0g+bvn7SAwNDozMw0K
PiDipcvs7bo6IENocmlzIENoZW4gKFRQSSkgPENocmlzLkNoZW4zQGZsZXguY29tPjsgb3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnDQo+IDxvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc+DQo+IPGr8qk6
IFJlOiBbZW50aXR5LW1hbmFnZXJdIFF1ZXN0aW9uIGFib3V0IHRlbXBlcmF0dXJlIHNlbnNvciBz
dG9wcw0KPiB1cGRhdGUNCj4gSGVsbG8sDQo+DQo+IEkgZGlkbid0IGNhdGNoLCB3aGF0IGlzIHlv
dXIgcHJvYmxlbS4gQXMgSSBzZWUgZnJvbSB0aGUgbG9ncywNCj4gZXZlcnl0aGluZyBpcyBmaW5l
OiB0ZW1wIHNlbnNvcnMgaW5zdGFudGlhdGVkLCBkYnVzIG9iamVjdHMgY3JlYXRlZCwNCj4gcmVh
ZGluZ3MgcHJlc2VudC4gV2hhdCdzIHdyb25nPw0KPg0KPiBBcyBmb3IgRnJ1RGV2aWNlOiB5ZXMs
IGl0J3Mga2luZCBvZiB3ZWlyZCBiZWhhdmlvdXI6IGl0IGV4cG9zZXMgbm90DQo+IG9ubHkgYWN0
dWFsIEZSVSBkZXZpY2VzIGJ1dCBhbHNvIG90aGVyIEkyQyBkZXZpY2VzLiBZb3UgY2FuIGludHJv
c3BlY3QNCj4gdGhhdCBvYmplY3RzIGFuZCBzZWUgdGhhdCB0aGV5IGV4cG9zZXMNCj4geHl6Lm9w
ZW5ibWNfcHJvamVjdC5JbnZlbnRvcnkuSXRlbS5JMkNEZXZpY2UgaW50ZXJmYWNlIGluc3RlYWQg
b2YNCj4geHl6Lm9wZW5ibWNfcHJvamVjdC5GcnVEZXZpY2UNCj4NCj4gT24gRnJpLCAyMDIxLTEw
LTI5IGF0IDA4OjAyICswMDAwLCBDaHJpcyBDaGVuIChUUEkpIHdyb3RlOkZydURldmljZQ0KPiA+
IEhpIGV2ZXJ5b25lLA0KPiA+DQo+ID4gQWN0dWFsbHksIEkgaGF2ZSAyIHF1ZXN0aW9ucyBhcyBi
ZWxvdzoNCj4gPiAgICAxLiBJIGdvdCB1bmRlcnN0b29kIGZyb20gb3RoZXJzIG9uIHRoZSBtYWls
aW5nIGxpc3QsIHRoYXQgSSBkb24ndA0KPiA+IGhhdmUgdG8gZGVjbGFyZSBFRVBST00gb3IgdGVt
cCBzZW5zb3JzIG9uIHRoZSBJMkMgYnVzIG5vZGUgaW4gbXkgZHRzLA0KPiA+IGFuZCBpdCBzaG91
bGQgYmUgZmluZSBldmVuIEkgZGlkIGl0IGF0IHRoZSBiZWdpbm5pbmcuIFNvIEkgdHJpZWQgdG8N
Cj4gPiByZW1vdmUgdGhpcyBkZWNsYXJhdGlvbiBpbiBkdHMsIHRoZW4gdGhlIHNlbnNvciB2YWx1
ZSBJIGdvdCBpcyBmaXhlZCwNCj4gPiBubyB1cGRhdGUuIENhbiBzb21lb25lIGhlbHAgdG8gdGFr
ZSBsb29rIGF0IHdoeSBpdCBpcz8NCj4gPiAgICAgICAgICAgICAgSGVyZSBhcmUgc29tZSBsb2dz
IHRoYXQgYXBwZWFyZWQgYXV0b21hdGljYWxseSBhZnRlciB0aGUNCj4gPiBzeXN0ZW0gYm9vdGVk
IHVwLiAgSXQgbG9va3MgbGlrZSB0aGF0IGVudGl0eS1tYW5hZ2VyIHdvcmtzIGZpbmUuIEFuZA0K
PiA+IHRoZSBjb21tYW5kcyBJIHVzZWQgdG8gY2hlY2sgdmFsdWUuDQo+ID4gICAgICAgICAgICAg
ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiA+ICAgICAgICAgICAg
ICBbICAgMjMuNzEzNTk2XSBsbTc1IDYtMDA0OTogaHdtb24xOiBzZW5zb3IgJ3RtcDc1Jw0KPiA+
ICAgICAgICAgICAgICBbICAgMjMuNzE4ODk0XSBpMmMgaTJjLTY6IG5ld19kZXZpY2U6IEluc3Rh
bnRpYXRlZA0KPiA+IGRldmljZSB0bXA3NSBhdCAweDQ5DQo+ID4gICAgICAgICAgICAgIFsgICAy
My43Mjg1MjBdIGxtNzUgNi0wMDRjOiBod21vbjI6IHNlbnNvciAndG1wNzUnDQo+ID4gICAgICAg
ICAgICAgIFsgICAyMy43MzM3NzldIGkyYyBpMmMtNjogbmV3X2RldmljZTogSW5zdGFudGlhdGVk
DQo+ID4gZGV2aWNlIHRtcDc1IGF0IDB4NGMNCj4gPiAgICAgICAgICAgICBbICAgMjMuNzQzNzA3
XSBsbTc1IDYtMDA0ZDogaHdtb24zOiBzZW5zb3IgJ3RtcDc1Jw0KPiA+ICAgICAgICAgICAgIFsg
ICAyMy43NDkwNDJdIGkyYyBpMmMtNjogbmV3X2RldmljZTogSW5zdGFudGlhdGVkIGRldmljZQ0K
PiA+IHRtcDc1IGF0IDB4NGQNCj4gPg0KPiA+ICAgICAgICAgICAgICAjIGJ1c2N0bCBpbnRyb3Nw
ZWN0IHh5ei5vcGVuYm1jX3Byb2plY3QuSHdtb25UZW1wU2Vuc29yDQo+ID4gL3h5ei9vcGVuYm1j
X3Byb2plY3Qvc2Vuc29ycy90ZW1wZXJhdHVyZS9ESU1NX1AxX0VGR0gNCj4gPiAgICAgICAgICAg
ICAgeHl6Lm9wZW5ibWNfcHJvamVjdC5TZW5zb3IuVmFsdWUNCj4gPiAgaW50ZXJmYWNlIC0gICAg
ICAgICAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0NCj4gPiAgICAg
ICAgICAgICAgLk1heFZhbHVlDQo+ID4gcHJvcGVydHkgIGQgICAgICAgICAxMjcgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGVtaXRzLQ0KPiA+IGNoYW5nZQ0KPiA+ICAgICAg
ICAgICAgICAuTWluVmFsdWUNCj4gPiBwcm9wZXJ0eSAgZCAgICAgICAgIC0xMjggICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZW1pdHMtDQo+ID4gY2hhbmdlDQo+ID4gICAgICAg
ICAgICAgIC5Vbml0DQo+ID4gcHJvcGVydHkgIHMgICAgICAgICAieHl6Lm9wZW5ibWNfcHJvamVj
dC5TZW5zb3IuVmFsdWUuVW5pLi4uIGVtaXRzLQ0KPiA+IGNoYW5nZQ0KPiA+ICAgICAgICAgICAg
ICAuVmFsdWUNCj4gPiAgcHJvcGVydHkgIGQgICAgICAgIDQwLjE4NyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZW1pdHMtDQo+ID4gY2hhbmdlIHdyaXRhYmxlDQo+ID4NCj4gPiAg
ICAgICAgICAgICAgIyBjYXQgL3N5cy9idXMvaTJjL2RldmljZXMvNi0NCj4gPiAwMDRkL2h3bW9u
L2h3bW9uMy90ZW1wMV9pbnB1dA0KPiA+ICAgICAgICAgICAgIDQwMTg3DQo+ID4gICAgICAgICAg
ICAgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ID4gICAgMS4gRnJv
bSBteSB1bmRlcnN0YW5kaW5nLCB0aGVyZSBpcyAiZGV0ZWN0aW9uIGRhZW1vbiIgd2hpY2ggc2Nh
bnMNCj4gPiBJMkMgYnVzIGxvb2tpbmcgZm9yIEVFUFJPTXMgd2l0aCBJUE1JIEZSVSBkYXRhLiBI
b3dldmVyLCBJIGZvdW5kIGFsbA0KPiA+IGRldmljZXMgb24gdGhlIEkyQyBidXNlcyB3b3VsZCBi
ZSBsaXN0ZWQsIG5vdCBvbmx5IEZydSBkZXZpY2VzLCB3aGVuDQo+ID4gSSB1c2VkIHRoZSBjb21t
YW5kIGJlbG93LiBJcyB0aGlzIGNvcnJlY3Q/DQo+ID4gICAgICAgICAgICAgIyBidXNjdGwgdHJl
ZSB4eXoub3BlbmJtY19wcm9qZWN0LkZydURldmljZQ0KPiA+ICAgICAgICAgICAgIGAtL3h5eg0K
PiA+ICAgICAgICAgICAgICAgYC0veHl6L29wZW5ibWNfcHJvamVjdA0KPiA+ICAgICAgICAgICAg
ICAgICBgLS94eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZQ0KPiA+ICAgICAgICAgICAgICAg
ICAgIHwtL3h5ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlLzBfODANCj4gPiAgICAgICAgICAg
ICAgICAgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZS8wXzg4DQo+ID4gICAgICAg
ICAgICAgICAgICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvMl8xMDgNCj4gPiAg
ICAgICAgICAgICAgICAgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZS8yXzExMg0K
PiA+ICAgICAgICAgICAgICAgICAgIHwtL3h5ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlLzJf
NjgNCj4gPiAgICAgICAgICAgICAgICAgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmlj
ZS8yXzcyDQo+ID4gICAgICAgICAgICAgICAgICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9GcnVE
ZXZpY2UvM18yMg0KPiA+ICAgICAgICAgICAgICAgICAgIHwtL3h5ei9vcGVuYm1jX3Byb2plY3Qv
RnJ1RGV2aWNlLzNfNTANCj4gPiAgICAgICAgICAgICAgICAgICB8LS94eXovb3BlbmJtY19wcm9q
ZWN0L0ZydURldmljZS80XzU2DQo+ID4gICAgICAgICAgICAgICAgICAgfC0veHl6L29wZW5ibWNf
cHJvamVjdC9GcnVEZXZpY2UvNV80OA0KPiA+ICAgICAgICAgICAgICAgICAgIHwtL3h5ei9vcGVu
Ym1jX3Byb2plY3QvRnJ1RGV2aWNlLzVfODENCj4gPiAgICAgICAgICAgICAgICAgICB8LS94eXov
b3BlbmJtY19wcm9qZWN0L0ZydURldmljZS82XzczDQo+ID4gICAgICAgICAgICAgICAgICAgfC0v
eHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvNl83Ng0KPiA+ICAgICAgICAgICAgICAgICAg
IHwtL3h5ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlLzZfNzcNCj4gPiAgICAgICAgICAgICAg
ICAgICB8LS94eXovb3BlbmJtY19wcm9qZWN0L0ZydURldmljZS83XzgwDQo+ID4gICAgICAgICAg
ICAgICAgICAgfC0veHl6L29wZW5ibWNfcHJvamVjdC9GcnVEZXZpY2UvN184OA0KPiA+ICAgICAg
ICAgICAgICAgICAgIHwtL3h5ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlLzhfMTAxDQo+ID4g
ICAgICAgICAgICAgICAgICAgIGAtL3h5ei9vcGVuYm1jX3Byb2plY3QvRnJ1RGV2aWNlL2h1ZHNv
bmJheSAgICCprA0KPiA+IHRoaXMgaXMgdGhlIHByb2JlIG5hbWUgd2UgZGVmaW5lIGluIEpTT04g
Y29uZmlndXJhdGlvbg0KPiA+DQo+ID4gVGhhbmtzLg0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPiBD
aHJpcyBDaGVuDQo+ID4gTGVnYWwgRGlzY2xhaW1lciA6DQo+ID4gVGhlIGluZm9ybWF0aW9uIGNv
bnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UgbWF5IGJlIHByaXZpbGVnZWQgYW5kDQo+ID4gY29uZmlk
ZW50aWFsLg0KPiA+IEl0IGlzIGludGVuZGVkIHRvIGJlIHJlYWQgb25seSBieSB0aGUgaW5kaXZp
ZHVhbCBvciBlbnRpdHkgdG8gd2hvbSBpdA0KPiA+IGlzIGFkZHJlc3NlZA0KPiA+IG9yIGJ5IHRo
ZWlyIGRlc2lnbmVlLiBJZiB0aGUgcmVhZGVyIG9mIHRoaXMgbWVzc2FnZSBpcyBub3QgdGhlDQo+
ID4gaW50ZW5kZWQgcmVjaXBpZW50LA0KPiA+IHBsZWFzZSBpbW1lZGlhdGVseSBub3RpZnkgdGhl
IHNlbmRlciBhbmQgZGVsZXRlIG9yIGRlc3Ryb3kgYW55IGNvcHkNCj4gPiBvZiB0aGlzIG1lc3Nh
Z2UhDQo+DQoNCi0tDQpCZXN0IHJlZ2FyZHMsDQpBbmRyZWkgS2FydGFzaGV2DQoNCg0K

--_000_DM6PR08MB5514B899D36CC4D70D02A1A2DC8A9DM6PR08MB5514namp_
Content-Type: text/html; charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dks_c_5601=
-1987">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Andrei,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I figured out the root cause is the sensor type I am using is ADT75 rather =
than TMP75. So it works after I changed the &quot;Type&quot;: &quot;ADT75&q=
uot; in the JSON configuration file and added ADT75 in the devices.hpp.</di=
v>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
[ &nbsp; 33.154935] lm75 6-0049: hwmon1: sensor 'adt75'
<div>[ &nbsp; 33.160287] i2c i2c-6: new_device: Instantiated device adt75 a=
t 0x49</div>
<div>[ &nbsp; 33.169894] lm75 6-004c: hwmon2: sensor 'adt75'</div>
<div>[ &nbsp; 33.175201] i2c i2c-6: new_device: Instantiated device adt75 a=
t 0x4c</div>
<div>[ &nbsp; 33.184658] lm75 6-004d: hwmon3: sensor 'adt75'</div>
[ &nbsp; 33.190007] i2c i2c-6: new_device: Instantiated device adt75 at 0x4=
d<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
root@hudsonbay-obmc:~# cat /sys/bus/i2c/devices/6-004d/hwmon/hwmon3/temp1_i=
nput
<div>41312</div>
<div>root@hudsonbay-obmc:~# cat /sys/bus/i2c/devices/6-004d/hwmon/hwmon3/te=
mp1_input</div>
41375<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"margin:0px;font-size:12pt">=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D</span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you for your support.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Chris Chen</div>
<div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>=D0=F6=CB=EC=ED=BA:</b> Andrei =
Kartashev &lt;a.kartashev@yadro.com&gt;<br>
<b>=D0=F6=CB=EC=EC=ED=D1=A2:</b> 2021=D2=B410=EA=C529=EC=ED =F9=BB=E7=ED 05=
:45<br>
<b>=E2=A5=CB=EC=ED=BA:</b> Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;<br=
>
<b>=F1=AB=F2=A9:</b> Re: =FC=DE=DC=DD: [entity-manager] Question about temp=
erature sensor stops update</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">Oh, that sounds really strange. Are you sure?&nbsp=
;<br>
When you read it raw (cat /sys/bus/i2c/devices/6-<br>
004d/hwmon/hwmon3/temp1_input) is it also always same? If yes, then, it<br>
is something in kernel - try to experiment with new_device sysfs<br>
interface.<br>
<br>
On Fri, 2021-10-29 at 08:50 +0000, Chris Chen (TPI) wrote:<br>
&gt; Hi Andrei,<br>
&gt; <br>
&gt; Thanks for your prompt reply and the explanation of #2, I understood<b=
r>
&gt; now.&nbsp;<br>
&gt; <br>
&gt; For question #1, let me rephrase it, please. I mean the temperature<br=
>
&gt; value I read is always the same. The value always shows 40.187, it<br>
&gt; wouldn't be changed even I read it again after a while. But if I<br>
&gt; declare the temp sensors on the I2C bus node in my dts, the value will=
<br>
&gt; change all the time. Do you have any idea about this?<br>
&gt; <br>
&gt; <br>
&gt; Regards,<br>
&gt; Chris Chen<br>
&gt; <br>
&gt; =D0=F6=CB=EC=ED=BA: Andrei Kartashev &lt;a.kartashev@yadro.com&gt;<br>
&gt; =D0=F6=CB=EC=EC=ED=D1=A2: 2021=D2=B410=EA=C529=EC=ED =F9=BB=E7=ED 04:3=
3<br>
&gt; =E2=A5=CB=EC=ED=BA: Chris Chen (TPI) &lt;Chris.Chen3@flex.com&gt;; ope=
nbmc@lists.ozlabs.org<br>
&gt; &lt;openbmc@lists.ozlabs.org&gt;<br>
&gt; =F1=AB=F2=A9: Re: [entity-manager] Question about temperature sensor s=
tops<br>
&gt; update&nbsp;<br>
&gt; Hello,<br>
&gt; <br>
&gt; I didn't catch, what is your problem. As I see from the logs,<br>
&gt; everything is fine: temp sensors instantiated, dbus objects created,<b=
r>
&gt; readings present. What's wrong?<br>
&gt; <br>
&gt; As for FruDevice: yes, it's kind of weird behaviour: it exposes not<br=
>
&gt; only actual FRU devices but also other I2C devices. You can introspect=
<br>
&gt; that objects and see that they exposes<br>
&gt; xyz.openbmc_project.Inventory.Item.I2CDevice interface instead of<br>
&gt; xyz.openbmc_project.FruDevice<br>
&gt; <br>
&gt; On Fri, 2021-10-29 at 08:02 +0000, Chris Chen (TPI) wrote:FruDevice<br=
>
&gt; &gt; Hi everyone,<br>
&gt; &gt; &nbsp;<br>
&gt; &gt; Actually, I have 2 questions as below:<br>
&gt; &gt; &nbsp;&nbsp;&nbsp;1. I got understood from others on the mailing =
list, that I don't<br>
&gt; &gt; have to declare EEPROM or temp sensors on the I2C bus node in my =
dts,<br>
&gt; &gt; and it should be fine even I did it at the beginning. So I tried =
to<br>
&gt; &gt; remove this declaration in dts, then the sensor value I got is fi=
xed,<br>
&gt; &gt; no update. Can someone help to take look at why it is?<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; Here are som=
e logs that appeared automatically after the<br>
&gt; &gt; system booted up.&nbsp;&nbsp;It looks like that entity-manager wo=
rks fine. And<br>
&gt; &gt; the commands I used to check value.<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; =3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; [ &nbsp; 23.=
713596] lm75 6-0049: hwmon1: sensor 'tmp75'<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; [ &nbsp; 23.=
718894] i2c i2c-6: new_device: Instantiated<br>
&gt; &gt; device tmp75 at 0x49<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; [ &nbsp; 23.=
728520] lm75 6-004c: hwmon2: sensor 'tmp75'<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; [ &nbsp; 23.=
733779] i2c i2c-6: new_device: Instantiated<br>
&gt; &gt; device tmp75 at 0x4c<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;[ &nbsp; 23.7=
43707] lm75 6-004d: hwmon3: sensor 'tmp75'<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;[ &nbsp; 23.7=
49042] i2c i2c-6: new_device: Instantiated device<br>
&gt; &gt; tmp75 at 0x4d<br>
&gt; &gt; &nbsp;<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; # busctl int=
rospect xyz.openbmc_project.HwmonTempSensor<br>
&gt; &gt; /xyz/openbmc_project/sensors/temperature/DIMM_P1_EFGH<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; xyz.openbmc_=
project.Sensor.Value &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;<br>
&gt; &gt; &nbsp;interface - &nbsp; &nbsp; &nbsp; &nbsp; - &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;-<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; .MaxValue &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;<br>
&gt; &gt; property &nbsp;d &nbsp; &nbsp; &nbsp; &nbsp; 127 &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;emits-<br>
&gt; &gt; change<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; .MinValue &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;<br>
&gt; &gt; property &nbsp;d &nbsp; &nbsp; &nbsp; &nbsp; -128 &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; emits-<br>
&gt; &gt; change<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; .Unit &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;<br>
&gt; &gt; property &nbsp;s &nbsp; &nbsp; &nbsp; &nbsp; &quot;xyz.openbmc_pr=
oject.Sensor.Value.Uni... emits-<br>
&gt; &gt; change<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; .Value &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;<br>
&gt; &gt; &nbsp;property &nbsp;d &nbsp; &nbsp; &nbsp; &nbsp;40.187 &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; emits-<br>
&gt; &gt; change writable<br>
&gt; &gt; &nbsp;<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; # cat /sys/b=
us/i2c/devices/6-<br>
&gt; &gt; 004d/hwmon/hwmon3/temp1_input<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;40187<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; &gt; &nbsp;&nbsp;&nbsp;1. From my understanding, there is &quot;detect=
ion daemon&quot; which scans<br>
&gt; &gt; I2C bus looking for EEPROMs with IPMI FRU data. However, I found =
all<br>
&gt; &gt; devices on the I2C buses would be listed, not only Fru devices, w=
hen<br>
&gt; &gt; I used the command below. Is this correct?<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;# busctl tree=
 xyz.openbmc_project.FruDevice<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;`-/xyz<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `-/xyz=
/openbmc_project<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 `-/xyz/openbmc_project/FruDevice<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/0_80<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/0_88<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/2_108<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/2_112<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/2_68<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/2_72<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/3_22<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/3_50<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/4_56<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/5_48<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/5_81<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/6_73<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/6_76<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/6_77<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/7_80<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/7_88<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;=
 &nbsp; |-/xyz/openbmc_project/FruDevice/8_101<br>
&gt; &gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp=
; &nbsp; `-/xyz/openbmc_project/FruDevice/hudsonbay&nbsp;&nbsp;&nbsp;&nbsp;=
=A9=AC<br>
&gt; &gt; this is the probe name we define in JSON configuration<br>
&gt; &gt; &nbsp;<br>
&gt; &gt; Thanks.<br>
&gt; &gt; &nbsp;<br>
&gt; &gt; Regards,<br>
&gt; &gt; Chris Chen<br>
&gt; &gt; Legal Disclaimer :<br>
&gt; &gt; The information contained in this message may be privileged and<b=
r>
&gt; &gt; confidential. <br>
&gt; &gt; It is intended to be read only by the individual or entity to who=
m it<br>
&gt; &gt; is addressed <br>
&gt; &gt; or by their designee. If the reader of this message is not the<br=
>
&gt; &gt; intended recipient, <br>
&gt; &gt; please immediately notify the sender and delete or destroy any co=
py<br>
&gt; &gt; of this message!<br>
&gt; <br>
<br>
-- <br>
Best regards,<br>
Andrei Kartashev<br>
<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM6PR08MB5514B899D36CC4D70D02A1A2DC8A9DM6PR08MB5514namp_--
