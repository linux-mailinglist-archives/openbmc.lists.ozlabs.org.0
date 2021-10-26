Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E92B43BB9A
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 22:32:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf3QP6qQCz2xT8
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 07:31:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256 header.s=selector1 header.b=Goq7EBjx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.161.93;
 helo=mx0a-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=Goq7EBjx; 
 dkim-atps=neutral
X-Greylist: delayed 648 seconds by postgrey-1.36 at boromir;
 Wed, 27 Oct 2021 07:31:30 AEDT
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com
 [205.220.161.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf3Pt6WXGz2xy3
 for <openbmc@lists.ozlabs.org>; Wed, 27 Oct 2021 07:31:29 +1100 (AEDT)
Received: from pps.filterd (m0187213.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19QKD5HK013907; 
 Tue, 26 Oct 2021 13:20:37 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by mx0b-003cac01.pphosted.com with ESMTP id 3bx4q31uyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 Oct 2021 13:20:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTt9OHVNjnghQYzq+2uFuwCMFds/yOKufKHdLfcTHjjawHX798bDaq06u17gfK6l0jBw4Vo00VgGE/Ak9vdVgUkD6Iow/Pc9NeJwd8fVRGt9kSGbYwXSvbSMpRCeUkcLZJUBFdiwrKbLgWdviMi51xE0QiQSkZCJWb09W0oEkQImbgGmWwaNfXUFYDZIzdWtGzMG2jpO1ZndWtymdoN5eTXaZxay+AGzOSQI3egrlUy0hzBbp19A1U46+tToQ0o9pKAsO8F2hTJMMab+MAv0GzNP+3T2Ihh3y1fZXMYPUKK7RafAbL9bqERdHv/d9o9/PDVhmyfB0dN57XZbCT5Uow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKJE+ZYb1PCwPThKY1r/6IV7HK50Jc8XOo5vnTwROmY=;
 b=e1LJiOpDDBYVZNVz20OsNR7WdpxVP3GHYLc9vjtvnlEX1ihtJTQ9sDRsCrcVoaqg3VrSPuNWMThSSGp/rtci2s46WDNX9xjk5L8d9Z/wTp9FzMXTscEzShIc7oLGKnivdh7tYqXdaqI/IQiYSBg0rDTWOJ1zkvdVdSxzGHZpksUyqVksop/50m+Y5YDJPclG6d1XPv05gkqCtx/JDxRcieja2dIOe9ofFJ8Gupb4xQNd9ZaCecFUP8xVELh17TKbVLUReQkflGFaL7b0pv8AUjNRN+6bEy3QzWrWXvtF1ehKn/3GfT4zSxCoWe5AlALHLKppSx1pRGjWkuhK3ShOFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKJE+ZYb1PCwPThKY1r/6IV7HK50Jc8XOo5vnTwROmY=;
 b=Goq7EBjxckR6RPNBSp0p7ki48Hni0QUtXTDmVTr7aISmrhoI6HxI4nrz0Wt6KrxTw5bWNqwFhQqBWywkaLcW458jrZWWDXKzAeMc+ps9OsfpHsHXlzZLZ6IbRaowaGxze4/cj6LBYqhH22OdJg3JtyPWHuT7hZfjVaAEDJqgJ4U=
Received: from SA1PR17MB4593.namprd17.prod.outlook.com (2603:10b6:806:190::21)
 by SN6PR17MB2221.namprd17.prod.outlook.com (2603:10b6:805:50::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 26 Oct
 2021 20:20:35 +0000
Received: from SA1PR17MB4593.namprd17.prod.outlook.com
 ([fe80::d16f:d0e2:fb2d:110f]) by SA1PR17MB4593.namprd17.prod.outlook.com
 ([fe80::d16f:d0e2:fb2d:110f%8]) with mapi id 15.20.4649.014; Tue, 26 Oct 2021
 20:20:35 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: Johnathan Mantey <johnathanx.mantey@intel.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: cannot ping serverip from u-boot.
Thread-Topic: cannot ping serverip from u-boot.
Thread-Index: AdfKkQp1VQW4pwYHStSRPWC98tcSAgAEiJKAAADwWcA=
Date: Tue, 26 Oct 2021 20:20:35 +0000
Message-ID: <SA1PR17MB45931C5948CA98682757B47296849@SA1PR17MB4593.namprd17.prod.outlook.com>
References: <SA1PR17MB4593DE25C67A9229F65DEF4196849@SA1PR17MB4593.namprd17.prod.outlook.com>
 <d35dfb3e-608b-96a0-f026-6d6063121bb4@intel.com>
In-Reply-To: <d35dfb3e-608b-96a0-f026-6d6063121bb4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=keysight.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7564bbeb-ca2a-4445-0e9b-08d998be1161
x-ms-traffictypediagnostic: SN6PR17MB2221:
x-microsoft-antispam-prvs: <SN6PR17MB2221AC4DF9594EFDB87F6EBE96849@SN6PR17MB2221.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xVLPqFChzzMD4lgnCKxniMctXIbyy4GtEN4UC2Nsft8sndBqsc024hy5ufnPx2O07KDqOkNMJjhnXktJBq0MvF4ZCdl0Hq+TFwl1+AhKrG7gz6/g/ZNnX0SexZOpUKAGHDAjEN43rCyKZ8w/IxsrhmykB27bLQ4NFlk3Die+854vVDIyRkyUZ1zzrg8DQavHk4Pd1uTQxq5Mrae1QGQ6SlQ6O7rLTyEhzs3vkbrHqR4IKxG14452FvyL4Fvui5Lgu2V83xuwm4mzGNA/FCuz81k9VSTntBnD0Y65kUGeYjiw9ngwcldsEIKPD8yezacszQIh1EBol7K5tkNBksQONzyqjN2pF0bFUyln/XiCgFFIKvw7ZBJG36sU6NMKShKzO9x4kZ0IL1i7djAMsHZQDNSNf/5I9dV9m4B0cxR/YCx9hVqiLOF5tS3/0DibioDcar11wyXQSe9y1OYqqCpkCKP9atqi3tpZiB7WF4qKTouszJqpPudkErQzvhAoR5WSKcD0rJlKVkBWDDNmiOMFyb+mLHrhPS+qYPob7rHZoQ5iw8q108kmy6xYbofPjyRYHpNgh7jtnbFvc+l+rv1E/1WfAPASI7tujwZm/nU0JsMDADNNzgZPSe5URdPuRmi8CC+vYSXSZDNmlqRALwJheeC99udCxfRh1sDYCRVDNlenLTiphP/SGk5/iuchGc8Va0cQLgHDFN0UuEb/WRIQ9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR17MB4593.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(64756008)(186003)(44832011)(86362001)(66946007)(7696005)(52536014)(66476007)(38070700005)(8676002)(66446008)(76116006)(33656002)(316002)(71200400001)(83380400001)(38100700002)(55016002)(5660300002)(122000001)(508600001)(6506007)(8936002)(40140700001)(110136005)(53546011)(2906002)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzJ4eWFTQW5ETGk4VC9uUXROWnFTcXg1QXZYcXNXcnpFM0hBNzNnNWYrZTFJ?=
 =?utf-8?B?cG0wRC9tb05STnlEWW5tdkFuanRMNTVwSzQ2SmtGWHVYL09TRUFaY1B3dzha?=
 =?utf-8?B?dlhQSDhqMm8zUlJoZnRVUzlmUTNEYlBXVmp6dWlIZDRQOTlwcko4ZU50R0px?=
 =?utf-8?B?NHZXYzN2NGhEMS9jeHZlSnlDZE84L09FMTBPT3duSTFEREZBWHZxNjQ5RVVt?=
 =?utf-8?B?Yi9WSGNtSTdjcjVGN2ZHdkJsektpQ1JwZjBMc1R2YjNTcjVqT1dCR25FVEZ0?=
 =?utf-8?B?YUlHZW1RZ1QzSVRyNUVWOXU5L1VJTVhROEZ2cHNKeHRlS0IyR24xTGNac3Ay?=
 =?utf-8?B?NjI3NHE3R2M0TnRFVDhMcFlWWXdibkp4a0NBSzMxMlRNSStWTlhwZjJ0WU5i?=
 =?utf-8?B?dW53ckpTd2IzeWQ0NWVLUUFBQ1JlRHg1RmRIMmswVW9XY0ZsaEdjZmhhYXJ1?=
 =?utf-8?B?ckVSOEdiS3dMYUpOK3RqTnVWSHZXQmFyd1Jtd2toSnhVOGZwaGZ0QmFlc2E5?=
 =?utf-8?B?YTFCZ1M5RGNFZlE1NEd0cTR1OE8weGx6VUd6S1JacXdIVXNoR1RnK0oyQS92?=
 =?utf-8?B?L204cEhUWU83VWhtUGdtRVdBVWc3WExEcDhSbG90TGRMWmdKQ082MWYwT1h3?=
 =?utf-8?B?M2s2elEvYkFZbzNTRE1KQThIVWFjb2ZtdHRlV1BUTW96YnpwZjQvWW91aVB1?=
 =?utf-8?B?eW1DZkR6a1prSzlsR09VRFJ3VUdycGF5NmJtN3J6T00yNGJJUnBHNnk0TVEw?=
 =?utf-8?B?MjNlMDBvWkNsQ0hJQ2RaVmcyVHpYNi82M3JhdFNlRHhEQkRYdWdmUVJxWXQ1?=
 =?utf-8?B?c3lSRkYrUlpLOURmdnpCR2ppVUszWENla0ltc3J4SDFwTDU1ZWtEb21VSGd3?=
 =?utf-8?B?R2Y0cG9jYUQyVEdtTXY2T1FIVCt5U3Y0OVN4Yno5WFRrZ0h1bWtFWkwwVy94?=
 =?utf-8?B?ZFBhZ0EzaERXMEFEck5NVXZoVU55UmNWdGJya0g2YjJsY3FJZmFSWk9CYXhD?=
 =?utf-8?B?dHdzMWt3bjJwZnVUS09vai9FSlpWWTdobXV5bXdQV3BIVmNkY0YvRVhmVWg1?=
 =?utf-8?B?YnhWNG8wZERFcGlkYTg0WENrU0djdSt6VmVjck92dmhqZGdZTXIrSEJpL1BR?=
 =?utf-8?B?T2lSeFQ2azkzd0dIM0hpdXc3bFVZRkZ0WXFNaVZ3bmZNbHBrL1V1eWNXWU8r?=
 =?utf-8?B?S3Z4cXd4TENySm1VeG1tUDZqMDNyTGlOVmpnZ2xIRDl5ZHBqUUxGalNWeHd2?=
 =?utf-8?B?eFFta1ZFRVVSeE9PVGN3ODJGZC9oMy9FQWJTRmlwSFN0MnRscEw0aGhQQ3gy?=
 =?utf-8?B?R0htUEZiZzQyaWZDVEY2SURTcmMxNEczeEgwYkNOTUoxUGg1Q0dMMDZTSXZZ?=
 =?utf-8?B?RG1LZ1RnUi9pQ1RzSXQ2MCtCcXprVUk4L0c0WVkxbFlzK0JsY1BTTnIrU2Yy?=
 =?utf-8?B?Mi9GaU5sTFd1bGRFR243MU9iN3JOWEdsUHhwdzBNYXhZT1VoVDZDUjJIUDF3?=
 =?utf-8?B?Vkl1SnJWYURFL2srSlY1ODlOa0ZyamI4RDBRWVBjR01BdkdZV1dtaVJPMlBK?=
 =?utf-8?B?TFpPSDRnSHVHRjFnNHJpb3R3NkFzNHNvcFB0OWhZdTFza0UrRXdlMk96WmFy?=
 =?utf-8?B?SThNQSs3VFhUWnNyQUNrWkhoTzlLM0RpQmt4ZFltT0lOZHVheithdW5Kcm9j?=
 =?utf-8?B?Z0k1L1puanBRZjNvRW56UjdlZlh4Wng3Q0E4UkdXZ3lBR2pBcVJXSE1jSWtM?=
 =?utf-8?B?bkNjSWxnaVk4OWVIZk5ERnZyOUNZdEQ1N3ZYN3RUQ0lpNWhuYmx6K0VEdUtV?=
 =?utf-8?B?N2lKWVZMT3lwL3NRbE1tWGtoK2dDREtqT04xRGlDVmVsQnNrUU9pM0hWNVEx?=
 =?utf-8?B?UUlrZHVmV2UveXBlTEtDUGF1bWNCUGkyTGUzdlVhQUJ3bjJLMXFuTWZ3Tlg4?=
 =?utf-8?B?RGpPMnBSR3QrbU1majRXcVRFQlhNbjNqRXdMT0lkN1FhaFdwWWpUQ1Zkc0pM?=
 =?utf-8?B?bnJORkdma00reFc3MlBhSDJrZjQ3RGxjSUpqVWovY1g3MFV3eG1WMUNBZVo5?=
 =?utf-8?B?M0tRQkJCamppNW04bHhEa2xhMTlEbFN1L1hKTkZTbkdhMG9BVk1RL0IvNnBp?=
 =?utf-8?B?dDlzT1pKZDRDOWkrR285dlNpMU9EbUtMN1l1NEtINlozeEYxeW0yeUQyZGhJ?=
 =?utf-8?B?eEZEMmZTNDZHSlBsR0hJUDVjeTJ2dnc5cmFNaEo1Uk52YTJXQ1dTazZDR0wx?=
 =?utf-8?B?Z1haa3BOTEF1NTJRZUhMR0hqOTRCaElVZ3I5L2dFZ1dRdWxGWWszbU9iUXhS?=
 =?utf-8?B?SVJmYmw4aVBVaExReDMwb25VYmtGa2NPa21weW5ERjBZMVFNamFSdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR17MB4593.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7564bbeb-ca2a-4445-0e9b-08d998be1161
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2021 20:20:35.1720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GQ4JAeUK/in8JpoJ5heFrjMALOYGk3Dg6GDwwMyk43upX5lueKsBnUnnbhtXSrIx/c87zSr2SEOmRS0JNsHYJ3sv4K866n4dm0gejdKTloY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR17MB2221
X-Proofpoint-GUID: wc_Qvjd_HeRoFkq1hDYMAP1xu5H8qFps
X-Proofpoint-ORIG-GUID: wc_Qvjd_HeRoFkq1hDYMAP1xu5H8qFps
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-26_05,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 mlxscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110260112
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

SGVsbG8gSm9uYXRoYW4sIA0KDQpXZSBoYXZlIHR3byBOSUNzLiAgT25lIGlzIGNvbm5lY3RlZCB0
byBpMzUwIGZvciBOQy1TSSwgYW5kIG90aGVyIG9uZSBpcyBvdmVyIHRoZSBNYXJ2ZWwgUEhZIG9u
IHdoaWNoIEkgYW0gdHJ5aW5nIHRvIGNvbm5lY3QuICBldGhhY3QgdmFyaWFibGUgaXMgc2V0IGNv
cnJlY3RseS4gSSBoYXZlIG5vdCB0cmllZCB0aGUgTkMtU0kgSW50ZXJmYWNlIEAxZTY2MDAwMCku
DQoNClRoYW5rIHlvdQ0KTWFoZXNoDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBKb2huYXRoYW4gTWFudGV5IDxqb2huYXRoYW54Lm1hbnRleUBpbnRlbC5jb20+IA0KU2VudDog
VHVlc2RheSwgT2N0b2JlciAyNiwgMjAyMSAyOjU0IFBNDQpUbzogTWFoZXNoIEt1cmFwYXRpIDxt
YWhlc2gua3VyYXBhdGlAa2V5c2lnaHQuY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpT
dWJqZWN0OiBSZTogY2Fubm90IHBpbmcgc2VydmVyaXAgZnJvbSB1LWJvb3QuDQoNCk9uIDEwLzI2
LzIxIDEwOjUzLCBNYWhlc2ggS3VyYXBhdGkgd3JvdGU6DQo+IEhpIGFsbCwNCj4gDQo+IEkgYW0g
dXNpbmcgb3BlbmJtYy0yLjkuMCBvbiBBU1QyNTAwIEJNQy7CoCBGcm9tIHRoZSB1LWJvb3QsIEkg
Y291bGQgbm90IA0KPiBwaW5nIHRvIGFueSBleHRlcm5hbCBub2RlIGJlIGl0IG9uIHRoZSBzYW1l
IG5ldHdvcmssIG9yIGEgZGlmZmVyZW50IA0KPiBuZXR3b3JrLsKgIEkgY29uZmlndXJlZCBzdGF0
aWMgaXAgMTkyLjE2OC4wLjgxIGZvciBteSBsYXB0b3AgYW5kIA0KPiBhdHRhY2hlZCB3aXJlc2hh
cmsgdG8gdGhlIHNhbWUgaW50ZXJmYWNlLiBJIGRvbuKAmXQgc2VlIGFueSBBUlAgcmVxdWVzdHMg
DQo+IHdoZW4gSSBpc3N1ZWQgcGluZyBjb21tYW5kIGZyb20gQk1DIHRvIHRoZSBsYXB0b3AuwqAg
SSBzZWUgdGhhdCBsaW5rIA0KPiBzdGF0dXMgaXMgdXAgZnJvbSB0aGUgZGVidWcgcHJpbnRzLCBh
bmQgYWxzbyB0aGUgTURJTyBzdGF0dXMgDQo+IHJlZ2lzdGVycy7CoCBEb27igJl0IHNlZSBhbnl0
aGluZyB3cm9uZy7CoCBOb3Qgc3VyZSB3aGF0L3doZXJlIHRvIGxvb2sgZm9yIA0KPiB0byBkZWJ1
ZyB0aGUgaXNzdWUgZnVydGhlci4gQXBwcmVjaWF0ZSBhbnkgc3VnZ2VzdGlvbnMuwqAgV2UgYXJl
IHVzaW5nIA0KPiBNYXJ2ZWwgQWxhc2thIDg4IHNlcmllcyBQaHkuIMKgSWYgdGhpcyB3b3Jrcywg
SSB3YW50IHRvIHRmdHBib290IHRoZSANCj4gYm9hcmQsIGFuZCBmbGFzaCB0aGUgZU1NQy7CoCBU
aGF0IGlzIG15IGdvYWwuDQoNCkRvZXMgeW91ciBzeXN0ZW0gaGF2ZSB0d28gTklDcz8NCg0KSXMg
eW91ciBuZXR3b3JrIGNhYmxlIHBsdWdnZWQgaW50byB0aGUgTklDIHNwZWNpZmllZCBieSB0aGUg
ZXRoYWN0IFUtQm9vdCBzZXR0aW5nPw0KDQpIYXZlIHlvdSB0cmllZCBjaGFuZ2luZyB0aGUgZXRo
YWN0IGxpbmUgdG8gcG9pbnQgdG8gdGhlIHNlY29uZCBOSUMgYWRkcmVzcyAoZS5nLiBldGhlcm5l
dEAxZTY5MDAwMCk/DQoNCj4gDQo+IGFzdCMgcHJpbnRlbnYNCj4gDQo+IGJhdWRyYXRlPTExNTIw
MA0KPiANCj4gYm9vdGFyZ3M9Y29uc29sZT10dHlTNCwxMTUyMDBuOCByb290PS9kZXYvcmFtIHJ3
DQo+IA0KPiBib290Y21kPWJvb3RtIDIwMDgwMDAwDQo+IA0KPiBib290ZGVsYXk9Mg0KPiANCj4g
Ym9vdGZpbGU9YWxsLmJpbg0KPiANCj4gZXRoMWFkZHI9YzI6ZDE6Mjk6Zjg6MWI6ZTMNCj4gDQo+
IGV0aGFjdD1ldGhlcm5ldEAxZTY4MDAwMA0KPiANCj4gZXRoYWRkcj1iZTpmMzpmYTo4YzpjZDpl
OA0KPiANCj4gZmR0Y29udHJvbGFkZHI9YmNmODIxMzgNCj4gDQo+IGdhdGV3YXlpcD0xOTIuMTY4
LjAuMQ0KPiANCj4gaXBhZGRyPTE5Mi4xNjguMC40NQ0KPiANCj4gbmV0bWFzaz0yNTUuMjU1LjI1
NS4wDQo+IA0KPiBzZXJ2ZXJpcD0xOTIuMTY4LjAuODENCj4gDQo+IHN0ZGVycj1zZXJpYWxAMWU3
ODQwMDANCj4gDQo+IHN0ZGluPXNlcmlhbEAxZTc4NDAwMA0KPiANCj4gc3Rkb3V0PXNlcmlhbEAx
ZTc4NDAwMA0KPiANCj4gdmVyaWZ5PXllcw0KPiANCj4gYXN0Iw0KPiANCj4gYXN0IyBwaW5nICRz
ZXJ2ZXJpcA0KPiANCj4gVHJ5aW5nIGV0aGVybmV0QDFlNjgwMDAwDQo+IA0KPiBldGhlcm5ldEAx
ZTY4MDAwMDogbGluayB1cCwgMTAwMCBNYnBzIGZ1bGwtZHVwbGV4IA0KPiBtYWM6YzI6ZDE6Mjk6
Zjg6MWI6ZTMNCj4gDQo+IFVzaW5nIGV0aGVybmV0QDFlNjgwMDAwIGRldmljZQ0KPiANCj4gQVJQ
IGJyb2FkY2FzdCAxDQo+IA0KPiBBUlAgYnJvYWRjYXN0IDINCj4gDQo+IEFSUCBicm9hZGNhc3Qg
Mw0KPiANCj4gQVJQIGJyb2FkY2FzdCA0DQo+IA0KPiBBUlAgUmV0cnkgY291bnQgZXhjZWVkZWQ7
IHN0YXJ0aW5nIGFnYWluDQo+IA0KPiBwaW5nIGZhaWxlZDsgaG9zdCAxOTIuMTY4LjAuODEgaXMg
bm90IGFsaXZlDQo+IA0KPiBhc3QjDQo+IA0KPiBhc3QjIG1kaW8gcmVhZMKgIDEuMC02MA0KPiAN
Cj4gUmVhZGluZyBmcm9tIGJ1cyBldGgxDQo+IA0KPiBQSFkgYXQgYWRkcmVzcyAxOg0KPiANCj4g
MS4wIC0gMHgxMDAwDQo+IA0KPiAxLjEgLSAweDc5NmTCoCA9w6hsaW5rIGlzIHVwDQo+IA0KPiAx
LjIgLSAweDE0MQ0KPiANCj4gMS4zIC0gMHhkZDQNCj4gDQo+IDEuNCAtIDB4MjFlMQ0KPiANCj4g
MS41IC0gMHhjNWUxDQo+IA0KPiAxLjYgLSAweGQNCj4gDQo+IDEuNyAtIDB4MjAwMQ0KPiANCj4g
MS44IC0gMHg0YTM4DQo+IA0KPiAxLjkgLSAweDMwMA0KPiANCj4gMS4xMCAtIDB4MzgwMA0KPiAN
Cj4gMS4xMSAtIDB4MA0KPiANCj4gMS4xMiAtIDB4MA0KPiANCj4gMS4xMyAtIDB4Mw0KPiANCj4g
MS4xNCAtIDB4MA0KPiANCj4gMS4xNSAtIDB4MzAwMA0KPiANCj4gMS4xNiAtIDB4MzA3MA0KPiAN
Cj4gMS4xNyAtIDB4YWMwOA0KPiANCj4gMS4xOCAtIDB4MA0KPiANCj4gMS4xOSAtIDB4MA0KPiAN
Cj4gMS4yMCAtIDB4MjANCj4gDQo+IDEuMjEgLSAweDANCj4gDQo+IDEuMjIgLSAweDANCj4gDQo+
IDEuMjMgLSAweDANCj4gDQo+IDEuMjQgLSAweDANCj4gDQo+IDEuMjUgLSAweDANCj4gDQo+IDEu
MjYgLSAweDQwDQo+IA0KPiAxLjI3IC0gMHgwDQo+IA0KPiAxLjI4IC0gMHgwDQo+IA0KPiAxLjI5
IC0gMHgwDQo+IA0KPiAxLjMwIC0gMHgwDQo+IA0KPiBUaGFuayB5b3UsDQo+IA0KPiBNYWhlc2gN
Cj4gDQoNCi0tDQpKb2huYXRoYW4gTWFudGV5DQpTZW5pb3IgU29mdHdhcmUgRW5naW5lZXINCiph
emFkIHRlKipjaG5vbG9neSBwYXJ0bmVycyoNCkNvbnRyaWJ1dGluZyB0byBUZWNobm9sb2d5IElu
bm92YXRpb24gc2luY2UgMTk5Mg0KUGhvbmU6ICg1MDMpIDcxMi02NzY0DQpFbWFpbDogam9obmF0
aGFueC5tYW50ZXlAaW50ZWwuY29tIDxtYWlsdG86am9obmF0aGFueC5tYW50ZXlAaW50ZWwuY29t
Pg0KDQo=
