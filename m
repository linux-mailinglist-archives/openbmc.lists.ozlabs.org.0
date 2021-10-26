Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FF743AC25
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 08:16:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdhQn3GgNz2xXq
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 17:16:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256 header.s=dkim header.b=AkgG8WXN;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex.com (client-ip=185.132.180.100;
 helo=mx07-002d6701.pphosted.com;
 envelope-from=prvs=49332ae7e7=chris.chen3@flex.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=flex.com header.i=@flex.com header.a=rsa-sha256
 header.s=dkim header.b=AkgG8WXN; dkim-atps=neutral
Received: from mx07-002d6701.pphosted.com (mx07-002d6701.pphosted.com
 [185.132.180.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdhQJ1TW9z2xRn
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 17:15:35 +1100 (AEDT)
Received: from pps.filterd (m0132505.ppops.net [127.0.0.1])
 by mx07-002d6701.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19Q0rrnK030695; 
 Tue, 26 Oct 2021 06:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flex.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=dkim; bh=aIsgD38zq5Nh03v+ngZtq7B4VTPStW1rqtnXaSjY78E=;
 b=AkgG8WXN5qcwy4j/f3mQ/0Q7Yb+2VMfzNzOv0WV71GXGMq8rLnn41JNEShNtXXrD7CMw
 gahNXEMZcWy6XjpyBTsseepRx7Y70hejLP9JOdTaELgNpFW5h4yK/NyLCHoUu6CpdSLO
 Ptajoo+SItyu+AZN+HPCSk8h0Yd86NC+4y8o1RXXZVLuPwFYANnyTz5AQXG+vuOOiRWd
 3ChVYHogYH1rn9v+nMYOWMchcxp6IgR+YdihA+GzCzojyPn95eM2tfRJ6kfds5cjtHjQ
 FAcn8CeQ+9aYN7supv3uZY6cjRrt17l+FHdPh8jseKUZPDs3LtjsxU1upW/FpS7mzW5O 3g== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by mx07-002d6701.pphosted.com with ESMTP id 3bx4eahyn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 06:14:26 +0000
Received: from DM6PR03CA0005.namprd03.prod.outlook.com (2603:10b6:5:40::18) by
 BYAPR08MB4840.namprd08.prod.outlook.com (2603:10b6:a03:69::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16; Tue, 26 Oct 2021 06:14:04 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:40:cafe::d3) by DM6PR03CA0005.outlook.office365.com
 (2603:10b6:5:40::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Tue, 26 Oct 2021 06:14:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 144.49.247.17)
 smtp.mailfrom=flex.com; bytedance.com; dkim=none (message not signed)
 header.d=none;bytedance.com; dmarc=fail action=oreject header.from=flex.com;
Received-SPF: Fail (protection.outlook.com: domain of flex.com does not
 designate 144.49.247.17 as permitted sender) receiver=protection.outlook.com; 
 client-ip=144.49.247.17; helo=mail.ds.dlp.protect.symantec.com;
Received: from mail.ds.dlp.protect.symantec.com (144.49.247.17) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Tue, 26 Oct 2021 06:14:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T94PBk6+9UYRL5MYFfo1eBeXiEyfOd9TjubbVBM8vm5EQbjhsofHPayeVNgvdH6OyXWj9//ddy84erimVYtORn3QCRBFyYNrny+yZWakWGzUfeGy3a1pJMuFJweLPJi6qVB9WfDdx3BdIYuiEPYdfr8OI1ev3x+M9pBOgwb/Ip/iTa7GzDLAK86RfpY379HD9EAFEhJ+macolkdK5Q8ApXkuUsbuM6z0mBrqtc5NN5TA5j0UG9oSZIeznDS4HuBHRruujcA1zL2xn29KdMjQ+a5tAgqBQiADnj6hhSkeuWManMYT6VxHj8LOXlIA+AIyawbH108rN2CibMard3ooyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxQdwnJrimUWTXOgKrbbAcBPmdTJKl5xZIcIBFojRmQ=;
 b=X6ok281lo7X5jKcQHsZ0DXiXiUhOANc6mzkMeemg8O99HLF1NpSfRGrwZqCkHXx2222SvtYvJxJKX5idwBYTUh7yUOa3W2+P2/L4mB8q4ojUOw4YPr25rZXxyWM913rLt+DmvThSIig44hfTH2TWaYWNnZH0HYOMj4qQvbOFwepj2suwxNL7Zv1H33l0YjxVJt8ucGOEd0kG0jF0MEagfMEp83K+uCqfK4xX6y5z5JjG0wW9kivf+n4pyIITDsyMmou1sp6Bt5thBDlzn8yfM1BZI97YLXWRSIWv16q5dhxlwSzVZDB13uRheDRwPWA7Px8V5Z7lqq8YY9wpr2K8mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=flex.com; dmarc=pass action=none header.from=flex.com;
 dkim=pass header.d=flex.com; arc=none
Received: from DM6PR08MB5514.namprd08.prod.outlook.com (20.178.26.161) by
 DS7PR08MB6943.namprd08.prod.outlook.com (13.101.169.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.13; Tue, 26 Oct 2021 06:14:01 +0000
Received: from DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac]) by DM6PR08MB5514.namprd08.prod.outlook.com
 ([fe80::f5ad:4d37:9d66:b9ac%3]) with mapi id 15.20.4628.020; Tue, 26 Oct 2021
 06:14:01 +0000
From: "Chris Chen (TPI)" <Chris.Chen3@flex.com>
To: Lei Yu <yulei.sh@bytedance.com>, "Bills, Jason M"
 <jason.m.bills@linux.intel.com>
Subject: =?big5?B?pl7C0DogW1BoaXNoaW5nIFJpc2tdIFtFeHRlcm5hbF0gUmU6IFtwaG9zcGhvci1z?=
 =?big5?Q?el-logger]_How_to_add_a_journal_entry_manually?=
Thread-Topic: [Phishing Risk] [External] Re: [phosphor-sel-logger] How to add
 a journal entry manually
Thread-Index: AdfJj9dxnWWV0JDhS1CKjHs8M84D5gAVIMgAAAuJj4AABk7D+g==
Date: Tue, 26 Oct 2021 06:14:01 +0000
Message-ID: <DM6PR08MB55145AC2D3451DF2CF042092DC849@DM6PR08MB5514.namprd08.prod.outlook.com>
References: <DM6PR08MB5514939D6512525765C3EE23DC839@DM6PR08MB5514.namprd08.prod.outlook.com>
 <a9ae1f74-e48e-f266-7e88-5b2ad27cf7fe@linux.intel.com>
 <CAGm54UHh2CUhvRSD4fKzTgbqZENPVfzesvxcK0Gxd4QtGQ1nVw@mail.gmail.com>
In-Reply-To: <CAGm54UHh2CUhvRSD4fKzTgbqZENPVfzesvxcK0Gxd4QtGQ1nVw@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 0aff7ca2-3b44-c618-ba03-9b2ff9cc7a12
Authentication-Results-Original: bytedance.com; dkim=none (message not signed)
 header.d=none; bytedance.com;
 dmarc=none action=none header.from=flex.com; 
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2ee797dd-69f7-4c62-841c-08d99847cf72
x-ms-traffictypediagnostic: DS7PR08MB6943:|BYAPR08MB4840:
X-Microsoft-Antispam-PRVS: <BYAPR08MB484070521676B0AE6DFB608EDC849@BYAPR08MB4840.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: zi4APcWXebSAqqQD+4seaktKrz3cDS/4M6k/HIU+9EfH5DnpS0LsrSU63X/BVPfxKFbs7pWiwhLYWaRID4eGOnHTFOBJZF0mTvMc5rVcsjIg5dCa9HTvdZeAsmXiZH7kzyzb1BgHEmd7CfT0Bj1AounoOtg2SvHcZEjhC+jWTsUYuM7BcfGOv8k9d5x7H2Y+Z8xiKJUuzPCVmOyXawoheboiKjMnTw4ZPZEBJi1Ouq2PKGwkGK9xyfpg60mGrLlckjZ8PJ3UVFRtapCY+JOHZSGrELyn9yTPwJU6PY8CB5jzI93DcySvsh8hLoidErEuIZm8JQblYHaZcs2mtIZ7TO2DD2sf7T2UPEYbT6Wi8Rczm+RtbLOlChUcwLurY6ZnJhAaEPRSJR3YpLqtSNvtEqrA+Dg/sfxCDhhUmJaZb10PK8Q3FTbnwH20QkOyGslVSiIpYgoexNdXB1x6FeQssyZdVNJd2o2Qizu2zvkKrcpHl/Q0rNKCrhKlQslDS+OmDKVauFm9rwKubLrB1sPwMttRgDpfsqGRDowsrcX8Nj+s6HRwOZZ313Z1L2AlraT1tuecCLleVhbwqodKz6zV0xnMNDcdUv4IFbfkBZBedBQviojTJH7fzETNp5y5DP+7eEmVS6QQTMsleUzvSv7LBWxYu76sMeXphqqP77lKBjJ1nSF5roTMLAh+7qHRnQ2eemKKg1kgYR/aElSfMatUoLiuwvHCLHsrNtFS7p+kPxOZOhrNlUAh4G7HcEglczH+/bNC2BnbtTvQ7VHJtf4bEBagtCeSqyvhpgZxVTiCbL/llm91erUfrFgp4ZhmKmsid6BSVd7kEp+aIRdzQzQ4+XOOD8oxQTVDFLlwGr+nzFcA/mKFxtNCtRHspVSTjE7P
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DM6PR08MB5514.namprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(366004)(7696005)(508600001)(8936002)(18265965003)(52536014)(5660300002)(966005)(33656002)(224303003)(76116006)(91956017)(9686003)(19627405001)(4326008)(6506007)(110136005)(55016002)(86362001)(53546011)(38100700002)(122000001)(66446008)(71200400001)(66946007)(64756008)(66556008)(316002)(66476007)(2906002)(83380400001)(38070700005)(186003)(166002)(21314003);
 DIR:OUT; SFP:1102; 
Content-Type: multipart/alternative;
 boundary="_000_DM6PR08MB55145AC2D3451DF2CF042092DC849DM6PR08MB5514namp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR08MB6943
X-CFilter-Loop: Reflected
X-DetectorID-Processed: db4f4c5a-5dd2-4f21-956c-7ab15d947193
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: eeece125-c2c2-4186-8c4a-08d99847cdc9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5E6d2DMDqHpPFoUZyIlLXCc4Ymy/jbSBkxj++Y5tBwgSms67vzwVdqdNdeypHd5ZyltWiAufuq663k0Q6SvRDRf1lz/JITDneuquU0hwV5QYwgRfO9ESZuAj0DfxzQtpHoL329MF+jER/pFaZIpRXG0mk9QnSOtBRItXA/dcH/asYhV8mttcUkRhplKh2tOj177rIV3WVKr+YeskeSJ5TuHxFkRJPIWhlxrTDOY3FGcOuDx05s+xzF8cOIZjnnqwb0tIRahxBUtoZSL96lHkrGktpmrr+rbyW32WMSRhX+50HVxq6n//ibNttMTAsb639chpweBLulGNFx7zSqANLxFgONS43MJmN26y2crjUcctF8zp2VlMCHau6fqyhhAz/MFl/S2KqBtSrzf4xBfqquaKrZNRcZpzBSDKtKYq2ya7IetJePjuOSZswZ4fEVTQjRu7p+nDJm6dLIUQ1jmsuZ67oVn1wNeaTU4XXXJCj62Nj39vA9kI78G3neT35GVExvz0vLAYGki2pfKhlghEAHWg5y6MOrLW2t8OL4d2eKppewQm8Qb+yKO8YFRFPGry5Km1ttSHsKZ0HGOmhbpt8ygCfskBPT4NwZBITT3g0bSm5oQH/m6Kd0W9S1AxDaXpbzedF+RGMSkZ5QotZvhg164wkGR8PS5kC67HyTPvrXuNeUg8FUAzVPMrrEAXZ7L3qixtWqlrE3d3btdIl4ZUrNh6hsBQ2H4SZpvZ/qydTWtA3huN1nWU98bX+TdA1oe+39keD7boqWcKDxFypUM1RsckwugUvpJSIlk6qXs6klyi4J/W/J1fbQOMkQDtMppPr4bXEvU+9VKvUrRTAtNHZm3QTX8GKijuyF/c6LnQY6iB1LsBsFkTi+Zcfe1rzfGtd7QwKBg3kfoCboT4GphAkkKPxKX9HUBBN0mlNkygWOs=
X-Forefront-Antispam-Report: CIP:144.49.247.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.ds.dlp.protect.symantec.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(36840700001)(46966006)(19627405001)(36860700001)(52536014)(2906002)(4326008)(224303003)(4186021)(186003)(70586007)(55016002)(336012)(81166007)(47076005)(82310400003)(53546011)(6506007)(508600001)(9686003)(5660300002)(86362001)(33656002)(8936002)(7696005)(26005)(356005)(316002)(83380400001)(166002)(110136005)(70206006)(18265965003)(966005)(21314003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: flex.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 06:14:03.8515 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee797dd-69f7-4c62-841c-08d99847cf72
X-MS-Exchange-CrossTenant-Id: 3f0e69e0-eb38-4eb2-b4ee-52919719d31e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3f0e69e0-eb38-4eb2-b4ee-52919719d31e; Ip=[144.49.247.17];
 Helo=[mail.ds.dlp.protect.symantec.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB4840
X-Proofpoint-ORIG-GUID: FGI2bVz1QOimDrJFpLmbIUSvKmXKxqLa
X-Proofpoint-GUID: FGI2bVz1QOimDrJFpLmbIUSvKmXKxqLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_08,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 suspectscore=0 bulkscore=0
 phishscore=0 impostorscore=0 clxscore=1011 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260034
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DM6PR08MB55145AC2D3451DF2CF042092DC849DM6PR08MB5514namp_
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="big5"

SGkgSmFzb24gYW5kIExlaSBZdSwNCg0KVGhhbmtzIGZvciB5b3VyIHNoYXJpbmcuDQoNCkkgYW0g
YWJsZSB0byBzZWUgdGhlIHNlbCBpbiB0aGUgL3Zhci9sb2cvaXBtaV9zZWwgYXMgc2FtZSBhcyBK
YXNvbiBtZW50aW9uZWQgYW5kIGFsc28gc2VlIHRoZSBzZWwgYnkgdGhlICJpcG1pdG9vbCBzZWwg
bGlzdCIgY29tbWFuZC4NCg0KSG93ZXZlciwgZm9yIExlaSdzIHN1Z2dlc3Rpb24gb2YgYWRkaW5n
ICJzZW5kLXRvLWxvZ2dlciIgY29uZmlndXJhdGlvbiwgSSByZWFsbHkgY2FuIHNlZSBpdCBiZWNv
bWVzIGFuIGVudHJ5IGluIC94eXovb3BlbmJtY19wcm9qZWN0L2xvZ2dpbmcvZW50cnkvWCByYXRo
ZXIgdGhhbiBzYXZpbmcgdGhlIG1lc3NhZ2UgaW4gdGhlIC92YXIvbG9nL2lwbWlfc2VsLCBidXQg
SSBjYW4ndCBzZWUgYW55IHNlbCBlbnRyeSBieSB0aGUgImlwbWl0b29sIHNlbCBsaXN0IiBjb21t
YW5kLiBJdCBsb29rcyBsaWtlIHRoZSBpcG1pZCBkb2Vzbid0IHBhcnNlIHRoZSBlbnRyeSBpbnRv
IGFuIFNFTCByZWNvcmQuIElzIGl0IHRoZSBzZWwgZW50cnkgSSBhZGRlZCAoYnVzY3RsIGNhbGwg
eHl6Lm9wZW5ibWNfcHJvamVjdC5Mb2dnaW5nLklQTUkgL3h5ei9vcGVuYm1jX3Byb2plY3QvTG9n
Z2luZy9JUE1JIHh5ei5vcGVuYm1jX3Byb2plY3QuTG9nZ2luZy5JUE1JIElwbWlTZWxBZGQgc3Nh
eWJxICJoZWxsb3dvcmxkIiAiL3h5ei9vcGVuYm1jX3Byb2plY3QvVGVzdCIgMyAxNiAzMiA2NCB0
cnVlIDB4ODEpIGp1c3QgYSBzYW1wbGUgbm90IGEgZm9ybWFsIGluZm8/IG9yIGR1ZSB0byBvdGhl
ciByZWFzb25zPw0KDQoNClJlZ2FyZHMsDQpDaHJpcyBDaGVuDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQqxSKXzqsw6IG9wZW5ibWMgPG9wZW5ibWMtYm91bmNlcytjaHJpcy5j
aGVuMz1mbGV4LmNvbUBsaXN0cy5vemxhYnMub3JnPiClTqrtIExlaSBZdSA8eXVsZWkuc2hAYnl0
ZWRhbmNlLmNvbT4NCrFIpfOk6bTBOiAyMDIxpn4xMKTrMjak6SCkV6TIIDEwOjM4DQqmrKXzqsw6
IEJpbGxzLCBKYXNvbiBNIDxqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbT4NCrDGpbs6IG9w
ZW5ibWMgPG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZz4NCqVEpq46IFJlOiBbUGhpc2hpbmcgUmlz
a10gW0V4dGVybmFsXSBSZTogW3Bob3NwaG9yLXNlbC1sb2dnZXJdIEhvdyB0byBhZGQgYSBqb3Vy
bmFsIGVudHJ5IG1hbnVhbGx5DQoNCk9uIFR1ZSwgT2N0IDI2LCAyMDIxIGF0IDU6MDkgQU0gQmls
bHMsIEphc29uIE0NCjxqYXNvbi5tLmJpbGxzQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+DQo+
DQo+DQo+IE9uIDEwLzI1LzIwMjEgNTowMiBBTSwgQ2hyaXMgQ2hlbiAoVFBJKSB3cm90ZToNCj4g
PiBIaSBhbGwsDQo+ID4NCj4gPiBJIGZvciBub3cgaGF2ZSBhZGRlZCByc3lzbG9nIGFuZCBwaG9z
cGhvci1zZWwtbG9nZ2VyIHBhY2thZ2VzIHRvIGJ1aWxkDQo+ID4gdGhlIGltYWdlLCB0aGVuIEkg
Y291bGQgc2VlIHRoZSB4eXoub3BlbmJtY19wcm9qZWN0LkxvZ2dpbmcuSVBNSSB0aHJvdWdoDQo+
ID4gdGhlIGJ1c2N0bCBjb21tYW5kIGFmdGVyIHRoZSBzeXN0ZW0gcnVucyB1cC4NCj4gPg0KPiA+
ICBGcm9tIHRoaXMgbGluaywNCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9saXN0cy5vemxhYnMub3JnL3BpcGVybWFpbC9vcGVuYm1jLzIwMTktT2N0b2Jlci8wMTg2NDAu
aHRtbF9fOyEhSFNudGxDZyFEbVlWaUp3eVRiU3NadzVOdnpjRGIyYjRBdC1sMUFVLXdjd1luMEZr
enBVck1vQlk2eUgzV2E4b1dNZGQ3RjAtJA0KPiA+IDxodHRwczovL3VybGRlZmVuc2UuY29tL3Yz
L19faHR0cHM6Ly9saXN0cy5vemxhYnMub3JnL3BpcGVybWFpbC9vcGVuYm1jLzIwMTktT2N0b2Jl
ci8wMTg2NDAuaHRtbF9fOyEhSFNudGxDZyFEbVlWaUp3eVRiU3NadzVOdnpjRGIyYjRBdC1sMUFV
LXdjd1luMEZrenBVck1vQlk2eUgzV2E4b1dNZGQ3RjAtJCA+LCBJDQo+ID4gdW5kZXJzdGFuZCB0
aGF0IEkgc2hvdWxkIGJlIGFibGUgdG8gYWRkIGEgam91cm5hbCBlbnRyeSB0aGF0IGhhcyB0aGUN
Cj4gPiBJUE1JIFNFTCBNRVNTQUdFX0lEOiAiYjM3MDgzNmNjZjJmNDg1MGFjNWJlZTE4NWI3Nzg5
M2EiIHRvIHRlc3QgdGhlDQo+ID4gZmVhdHVyZSwgYnV0IEkgZG9uJ3Qga25vdyB0byBnaXZlIHRo
ZSBjb3JyZWN0IHBhcmFtZXRlcnMgdG8gdGhlIG1ldGhvZA0KPiA+IGNhbGwsIElwbWlTZWxBZGQs
IGFzIGJlbG93LA0KPiA+DQo+ID4gfiMgYnVzY3RsIGNhbGwgeHl6Lm9wZW5ibWNfcHJvamVjdC5M
b2dnaW5nLklQTUkNCj4gPiAveHl6L29wZW5ibWNfcHJvamVjdC9Mb2dnaW5nL0lQTUkgeHl6Lm9w
ZW5ibWNfcHJvamVjdC5Mb2dnaW5nLklQTUkNCj4gPiBJcG1pU2VsQWRkIHh4eA0KPiA+DQo+ID4g
Q291bGQgc29tZW9uZSBoZWxwIG1lIG91dCBvbiB0aGlzPyBUaGFuayB5b3UuDQo+IFlvdSBjYW4g
ZmluZCB0aGUgaW1wbGVtZW50YXRpb24gZm9yIElwbWlTZWxBZGQsIGhlcmU6DQo+IGh0dHBzOi8v
dXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9waG9zcGhvci1z
ZWwtbG9nZ2VyL2Jsb2IvbWFzdGVyL3NyYy9zZWxfbG9nZ2VyLmNwcCpMMjcwX187SXchIUhTbnRs
Q2chRG1ZVmlKd3lUYlNzWnc1TnZ6Y0RiMmI0QXQtbDFBVS13Y3dZbjBGa3pwVXJNb0JZNnlIM1dh
OG9XQVBGc1A1diQgLg0KPg0KPiAiSXBtaVNlbEFkZCIsIFtdKGNvbnN0IHN0ZDo6c3RyaW5nJiBt
ZXNzYWdlLCBjb25zdCBzdGQ6OnN0cmluZyYgcGF0aCwNCj4gICAgICAgICAgICAgICAgICAgICAg
Y29uc3Qgc3RkOjp2ZWN0b3I8dWludDhfdD4mIHNlbERhdGEsDQo+ICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IGJvb2wmIGFzc2VydCwgY29uc3QgdWludDE2X3QmIGdlbklkKQ0KPg0KPiBXaGVy
ZQ0KPiBtZXNzYWdlID0gdGhlIHN0cmluZyB0byBzZXQgYXMgdGhlIE1FU1NBR0UgaW4gdGhlIGpv
dXJuYWwNCj4gcGF0aCA9IHRoZSBELUJ1cyBwYXRoIHRvIHRoZSBzZW5zb3IgdGhhdCBsb2dnZWQg
dGhlIGV2ZW50DQo+IHNlbERhdGEgPSB0aGUgcmF3IGJ5dGVzIG9mIHRoZSBJUE1JIFNFTCBlbnRy
eQ0KPiBhc3NlcnQgPSB0aGUgZXZlbnQgZGlyZWN0aW9uIG9mIHRoZSBTRUwgZXZlbnQNCj4gZ2Vu
SWQgPSB0aGUgR2VuZXJhdG9yIElEIGZvciB0aGUgU0VMIGV2ZW50DQo+DQo+IFRoZSBidXNjdGwg
Zm9ybWF0IGlzICdzc2F5YnEnLCBzbyBhIHNhbXBsZSBjb21tYW5kIGlzDQo+IGJ1c2N0bCBjYWxs
IHh5ei5vcGVuYm1jX3Byb2plY3QuTG9nZ2luZy5JUE1JDQo+IC94eXovb3BlbmJtY19wcm9qZWN0
L0xvZ2dpbmcvSVBNSSB4eXoub3BlbmJtY19wcm9qZWN0LkxvZ2dpbmcuSVBNSQ0KPiBJcG1pU2Vs
QWRkIHNzYXlicSAiaGVsbG93b3JsZCIgIi94eXovb3BlbmJtY19wcm9qZWN0L1Rlc3QiIDMgMTYg
MzIgNjQNCj4gdHJ1ZSAweDgxDQo+DQo+IFRoaXMgc2hvdWxkIGFkZCBhbiBJUE1JIG1lc3NhZ2Ug
dG8gdGhlIGpvdXJuYWwgdGhhdCBpcyBwaWNrZWQgdXAgYnkNCj4gcnN5c2xvZyBhbmQgc2VudCB0
byAvdmFyL2xvZy9pcG1pX3NlbCBsaWtlIHRoaXM6DQo+DQo+IHJvb3RAaW50ZWwtb2JtYzp+IyBj
YXQgL3Zhci9sb2cvaXBtaV9zZWwNCj4gMjAyMS0wOC0yMFQwMToxNjo0OC43NDc0MjgrMDA6MDAg
MSwyLDEwMjA0MCw4MSwveHl6L29wZW5ibWNfcHJvamVjdC9UZXN0LDENCj4NCg0KVGhlcmUgaXMg
YSBjb25maWd1cmF0aW9uIG9wdGlvbiBzZW5kLXRvLWxvZ2dlclsxXSB0aGF0IGNoYW5nZXMgdGhl
DQpiZWhhdmlvciBvZiBgSXBtaVNlbEFkZGAuDQpXaXRoIHRoZSBjb25maWcgZW5hYmxlZCwgYElw
bWlTZWxBZGQoKWAgc2VuZHMgdGhlIGxvZyB0bw0KcGhvc3Bob3ItbG9nZ2luZyBzZXJ2aWNlIGFu
ZCBiZWNvbWVzIGFuIGVudHJ5IGluDQoveHl6L29wZW5ibWNfcHJvamVjdC9sb2dnaW5nL2VudHJ5
LywgaW5zdGVhZCBvZiBzYXZpbmcgdGhlIG1lc3NhZ2UgaW4NCi92YXIvbG9nL2lwbWlfc2VsLg0K
QW5kIGlwbWlkIHdpbGwgcGFyc2UgdGhlIGVudHJ5IGludG8gYW4gU0VMIHJlY29yZC4NCg0KWzFd
OiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXRodWIuY29tL29wZW5ibWMv
cGhvc3Bob3Itc2VsLWxvZ2dlci9ibG9iL21hc3Rlci9tZXNvbi5idWlsZCpMMzFfXztJdyEhSFNu
dGxDZyFEbVlWaUp3eVRiU3NadzVOdnpjRGIyYjRBdC1sMUFVLXdjd1luMEZrenBVck1vQlk2eUgz
V2E4b1dFUmJybklaJA0KDQoNCi0tDQpCUnMsDQpMZWkgWVUNCgpMZWdhbCBEaXNjbGFpbWVyIDoK
VGhlIGluZm9ybWF0aW9uIGNvbnRhaW5lZCBpbiB0aGlzIG1lc3NhZ2UgbWF5IGJlIHByaXZpbGVn
ZWQgYW5kIGNvbmZpZGVudGlhbC4gCkl0IGlzIGludGVuZGVkIHRvIGJlIHJlYWQgb25seSBieSB0
aGUgaW5kaXZpZHVhbCBvciBlbnRpdHkgdG8gd2hvbSBpdCBpcyBhZGRyZXNzZWQgCm9yIGJ5IHRo
ZWlyIGRlc2lnbmVlLiBJZiB0aGUgcmVhZGVyIG9mIHRoaXMgbWVzc2FnZSBpcyBub3QgdGhlIGlu
dGVuZGVkIHJlY2lwaWVudCwgCnlvdSBhcmUgb24gbm90aWNlIHRoYXQgYW55IGRpc3RyaWJ1dGlv
biBvZiB0aGlzIG1lc3NhZ2UsIGluIGFueSBmb3JtLCAKaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4g
SWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBtZXNzYWdlIGluIGVycm9yLCAKcGxlYXNlIGltbWVk
aWF0ZWx5IG5vdGlmeSB0aGUgc2VuZGVyIGFuZCBkZWxldGUgb3IgZGVzdHJveSBhbnkgY29weSBv
ZiB0aGlzIG1lc3NhZ2UhCg==

--_000_DM6PR08MB55145AC2D3451DF2CF042092DC849DM6PR08MB5514namp_
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
: 12pt; color: rgb(0, 0, 0);">
Hi Jason and Lei Yu,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks for your sharing.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I am able to see the sel in the /var/log/ipmi_sel as same as Jason mentione=
d and also see the sel by the &quot;ipmitool sel list&quot; command.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
However, for Lei's suggestion of adding &quot;send-to-logger&quot; configur=
ation, I really can see it becomes an entry in /xyz/openbmc_project/logging=
/entry/X rather than saving the message in the /var/log/ipmi_sel, but I can=
't see any sel entry by the &quot;ipmitool sel
 list&quot; command. It looks like the ipmid doesn't parse the entry into a=
n SEL record. Is it the sel entry I added (busctl call xyz.openbmc_project.=
Logging.IPMI /xyz/openbmc_project/Logging/IPMI xyz.openbmc_project.Logging.=
IPMI IpmiSelAdd ssaybq &quot;helloworld&quot; &quot;/xyz/openbmc_project/Te=
st&quot;
 3 16 32 64 true 0x81) just a sample not a formal info? or due to other rea=
sons?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
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
lor=3D"#000000" style=3D"font-size:11pt"><b>=B1H=A5=F3=AA=CC:</b> openbmc &=
lt;openbmc-bounces+chris.chen3=3Dflex.com@lists.ozlabs.org&gt; =A5N=AA=ED L=
ei Yu &lt;yulei.sh@bytedance.com&gt;<br>
<b>=B1H=A5=F3=A4=E9=B4=C1:</b> 2021=A6~10=A4=EB26=A4=E9 =A4W=A4=C8 10:38<br>
<b>=A6=AC=A5=F3=AA=CC:</b> Bills, Jason M &lt;jason.m.bills@linux.intel.com=
&gt;<br>
<b>=B0=C6=A5=BB:</b> openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>=A5D=A6=AE:</b> Re: [Phishing Risk] [External] Re: [phosphor-sel-logger]=
 How to add a journal entry manually</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt">
<div class=3D"PlainText">On Tue, Oct 26, 2021 at 5:09 AM Bills, Jason M<br>
&lt;jason.m.bills@linux.intel.com&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 10/25/2021 5:02 AM, Chris Chen (TPI) wrote:<br>
&gt; &gt; Hi all,<br>
&gt; &gt;<br>
&gt; &gt; I for now have added rsyslog and phosphor-sel-logger packages to =
build<br>
&gt; &gt; the image, then I could see the xyz.openbmc_project.Logging.IPMI =
through<br>
&gt; &gt; the busctl command after the system runs up.<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; From this link,<br>
&gt; &gt; <a href=3D"https://urldefense.com/v3/__https://lists.ozlabs.org/p=
ipermail/openbmc/2019-October/018640.html__;!!HSntlCg!DmYViJwyTbSsZw5NvzcDb=
2b4At-l1AU-wcwYn0FkzpUrMoBY6yH3Wa8oWMdd7F0-$">
https://urldefense.com/v3/__https://lists.ozlabs.org/pipermail/openbmc/2019=
-October/018640.html__;!!HSntlCg!DmYViJwyTbSsZw5NvzcDb2b4At-l1AU-wcwYn0Fkzp=
UrMoBY6yH3Wa8oWMdd7F0-$</a>
<br>
&gt; &gt; &lt;<a href=3D""></a>https://urldefense.com/v3/__https://lists.oz=
labs.org/pipermail/openbmc/2019-October/018640.html__;!!HSntlCg!DmYViJwyTbS=
sZw5NvzcDb2b4At-l1AU-wcwYn0FkzpUrMoBY6yH3Wa8oWMdd7F0-$ &gt;, I<br>
&gt; &gt; understand that I should be able to add a journal entry that has =
the<br>
&gt; &gt; IPMI SEL MESSAGE_ID: &quot;b370836ccf2f4850ac5bee185b77893a&quot;=
 to test the<br>
&gt; &gt; feature, but I don't know to give the correct parameters to the m=
ethod<br>
&gt; &gt; call, IpmiSelAdd, as below,<br>
&gt; &gt;<br>
&gt; &gt; ~# busctl call xyz.openbmc_project.Logging.IPMI<br>
&gt; &gt; /xyz/openbmc_project/Logging/IPMI xyz.openbmc_project.Logging.IPM=
I<br>
&gt; &gt; IpmiSelAdd xxx<br>
&gt; &gt;<br>
&gt; &gt; Could someone help me out on this? Thank you.<br>
&gt; You can find the implementation for IpmiSelAdd, here:<br>
&gt; <a href=3D"https://urldefense.com/v3/__https://github.com/openbmc/phos=
phor-sel-logger/blob/master/src/sel_logger.cpp*L270__;Iw!!HSntlCg!DmYViJwyT=
bSsZw5NvzcDb2b4At-l1AU-wcwYn0FkzpUrMoBY6yH3Wa8oWAPFsP5v$">
https://urldefense.com/v3/__https://github.com/openbmc/phosphor-sel-logger/=
blob/master/src/sel_logger.cpp*L270__;Iw!!HSntlCg!DmYViJwyTbSsZw5NvzcDb2b4A=
t-l1AU-wcwYn0FkzpUrMoBY6yH3Wa8oWAPFsP5v$</a> .<br>
&gt;<br>
&gt; &quot;IpmiSelAdd&quot;, [](const std::string&amp; message, const std::=
string&amp; path,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const std::vector&l=
t;uint8_t&gt;&amp; selData,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const bool&amp; ass=
ert, const uint16_t&amp; genId)<br>
&gt;<br>
&gt; Where<br>
&gt; message =3D the string to set as the MESSAGE in the journal<br>
&gt; path =3D the D-Bus path to the sensor that logged the event<br>
&gt; selData =3D the raw bytes of the IPMI SEL entry<br>
&gt; assert =3D the event direction of the SEL event<br>
&gt; genId =3D the Generator ID for the SEL event<br>
&gt;<br>
&gt; The busctl format is 'ssaybq', so a sample command is<br>
&gt; busctl call xyz.openbmc_project.Logging.IPMI<br>
&gt; /xyz/openbmc_project/Logging/IPMI xyz.openbmc_project.Logging.IPMI<br>
&gt; IpmiSelAdd ssaybq &quot;helloworld&quot; &quot;/xyz/openbmc_project/Te=
st&quot; 3 16 32 64<br>
&gt; true 0x81<br>
&gt;<br>
&gt; This should add an IPMI message to the journal that is picked up by<br>
&gt; rsyslog and sent to /var/log/ipmi_sel like this:<br>
&gt;<br>
&gt; root@intel-obmc:~# cat /var/log/ipmi_sel<br>
&gt; 2021-08-20T01:16:48.747428+00:00 1,2,102040,81,/xyz/openbmc_project/Te=
st,1<br>
&gt;<br>
<br>
There is a configuration option send-to-logger[1] that changes the<br>
behavior of `IpmiSelAdd`.<br>
With the config enabled, `IpmiSelAdd()` sends the log to<br>
phosphor-logging service and becomes an entry in<br>
/xyz/openbmc_project/logging/entry/, instead of saving the message in<br>
/var/log/ipmi_sel.<br>
And ipmid will parse the entry into an SEL record.<br>
<br>
[1]: <a href=3D"https://urldefense.com/v3/__https://github.com/openbmc/phos=
phor-sel-logger/blob/master/meson.build*L31__;Iw!!HSntlCg!DmYViJwyTbSsZw5Nv=
zcDb2b4At-l1AU-wcwYn0FkzpUrMoBY6yH3Wa8oWERbrnIZ$">
https://urldefense.com/v3/__https://github.com/openbmc/phosphor-sel-logger/=
blob/master/meson.build*L31__;Iw!!HSntlCg!DmYViJwyTbSsZw5NvzcDb2b4At-l1AU-w=
cwYn0FkzpUrMoBY6yH3Wa8oWERbrnIZ$</a>
<br>
<br>
<br>
-- <br>
BRs,<br>
Lei YU<br>
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

--_000_DM6PR08MB55145AC2D3451DF2CF042092DC849DM6PR08MB5514namp_--
