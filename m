Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0083D6D8BDE
	for <lists+openbmc@lfdr.de>; Thu,  6 Apr 2023 02:27:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsMl16PsXz3fY0
	for <lists+openbmc@lfdr.de>; Thu,  6 Apr 2023 10:27:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=k+9V9cHA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com; envelope-from=prvs=045982f9d2=verdun@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=k+9V9cHA;
	dkim-atps=neutral
X-Greylist: delayed 4870 seconds by postgrey-1.36 at boromir; Thu, 06 Apr 2023 08:55:54 AEST
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsKjk33n3z3chl
	for <openbmc@lists.ozlabs.org>; Thu,  6 Apr 2023 08:55:51 +1000 (AEST)
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 335Kha5S020724;
	Wed, 5 Apr 2023 21:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : content-type : mime-version; s=pps0720;
 bh=lWELPb5XUZhIi6RN7B09/j4FaDgSPhRs+FIsDolyhbk=;
 b=k+9V9cHAxdhXJJd3+C0CCq2SHwzX4MmWHiU+PFjxeHvJXkzHmLVcl/SxC/nb26xWveWn
 GPWwOlHr83/F3TvYJtNfqRq1pjoN2KDdQRhY00ERgL833hQQ3GwlGO07G0ZH0vkBbqke
 X/zvRZXNYuumgeW0P5Y5D/FzTKIfHJEupwiMggLBVLw67kekAYOOfyQVof+oP6dZ2qOT
 DoRl8a/48FGur4BOpbwQz5AxW0+hYDXsFfcmGR92x9mmFcGpM5NHVKrDHWXjS4DHaf2Y
 MTvJEAtGUGJRn+BU3A7vZy0pm1ZWUVN9vLjpjeNZ5PVGSzUPESn4/T77WtLee+2JswKp Uw== 
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3psg8ygd56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Apr 2023 21:34:31 +0000
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id A8F6213064;
	Wed,  5 Apr 2023 21:34:29 +0000 (UTC)
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 5 Apr 2023 09:34:25 -1200
Received: from p1wg14928.americas.hpqcorp.net (10.119.18.116) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 5 Apr 2023 09:34:24 -1200
Received: from p1wg14921.americas.hpqcorp.net (16.230.19.124) by
 p1wg14928.americas.hpqcorp.net (10.119.18.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42
 via Frontend Transport; Wed, 5 Apr 2023 09:34:24 -1200
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.124) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 5 Apr 2023 09:34:24 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVBOUbzE2kgK47+pi/H4oMlWKDN6prVnOvvzwPpbvMDQgMAbyA/gkFATDOsZlrS6FX1krvyJKKCcQIqBaYI65C6a0KVMix6taEiCW9a1fL8OcrGLEC4QwMqRh9waTWHmEMslC2Fo8vdJaJ8Pf8o0m/WaB7Da/ZurekkoadIWTZG0G5dyZYvEZNRBZSdCpkEuDXeDUDEdavRT1T4mEZRVvWaTJx+3vlqb4GrRlPpXYlEbw5g0BLasjJX+CaCsSzCgtUN0AyADDQq6C+yxTR5hnWxRydm/3x08wK/MjQYbj1HT6bAjsBgYmo5T/sm4IX+fp4+1+B+K9wmSMRvFEy3ILg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWELPb5XUZhIi6RN7B09/j4FaDgSPhRs+FIsDolyhbk=;
 b=U/gUQVbxCWzeIqQ0AdemRg1wq9Gzzppn1EAIp+1vyoscTyaq+zcgZNklp6pLya0wbGnkbcfw15LvisWEHSzfupLRl2OmZ8wM3qn3DLZww9S7pTNKCwyK2XARQMfnGQk0OEWsVeHYFZvSt9mF2IrfJDgxDwINGcDNQf1iO0Qzu3cuNmRykuSEzoe6gj83XYumuJ2zfuAQc/Dzz8T6kMqBtYi2UnZCMSgAbJ+7yWAsm8zX0pwGcWqJQlxJ+1o3QFHRneJ4W0X/94vV6kXzSUnqlzWM6KfFfrpsFROuxyMt9EPNcvAXmTQk8eRNUuhBu6Y8byf+FUj1Xe/w+3szlWNogQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4f::17) by
 MW5PR84MB1426.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c0::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.33; Wed, 5 Apr 2023 21:34:23 +0000
Received: from DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::11d:9b53:5229:eb4e]) by DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::11d:9b53:5229:eb4e%5]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 21:34:23 +0000
From: "Verdun, Jean-Marie" <verdun@hpe.com>
To: "joel@jms.id.au" <joel@jms.id.au>,
        "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: GXP support into OpenBMC kernel
Thread-Topic: GXP support into OpenBMC kernel
Thread-Index: AQHZaAZjdYyBKBBOcUCwAOsKu33JVg==
Date: Wed, 5 Apr 2023 21:34:22 +0000
Message-ID: <191F3605-11DF-4870-AB07-B4A31169B3D2@hpe.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1976:EE_|MW5PR84MB1426:EE_
x-ms-office365-filtering-correlation-id: 0c0de198-82c8-44fd-4b2f-08db361d85cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hAgwg0Mk/kYXgIIcllvVesy8HJZeowg6n80moAwtRHQpGCS0TGqOgJwjB70fxPfWsSCTKY7hQKDAmuu+cy4qy3kvZCjSFGrea9H8/cMPH7ToF3/a2xeltx8i5MLsfg/VvrxW1Vo+pQDPdLo6Hf1xHxT6kU4EhlmG2D+vLxBfGh2axMKVZNtjlH16vPD4jFDhh+ax/EqrAKeM0WWCtojCncUe+LbU0y2yWCpn1960IeN6QVuPrOB2CF4nUSfxET/gLMWONl3j8yNOjnv5yuKxi5eRc+gmAZb0UtGgfo//fen+Z0xhGEMQpee0Z4aSRGeN4MAnJYY1o26TQlDBGtln+1KjREHnLMBJV3/RCqVWVLPJsLzk6G3g2cvPmzb0MjRv3ZX4SAtVCzCOscKWNOjoN/+IZ3+QpTg/A/Y5Xb72yWMXSk5QyDI4dai8HHFWYJo/elpiQ0tp1QlV+MMWyptShvsjQZoVOrLzvFi8Feat6xXm6COSOAgaeq4IUqU07EHTF3Z3rVdVF9z3HsHsQ6sKYZGR45ZaY+O+pWj/ClVMCJJC1N45Kyp9P4vRGDQ7qj+vMNPPWqtZD7pSdWN+fzblG4W9tKRwDu4LDfXYy/DdAjRmDIrl1QKFvfZZxmFa5cYRtnBPkz1GqRZyuNF7mXU++hKqXmQoHVYuAq65TuWi9jRtwKPSJPwQyrQpa9ZBWb9w0nSDuzbRU0LUsR4E50qtuw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199021)(86362001)(38070700005)(33656002)(2906002)(36756003)(71200400001)(6486002)(2616005)(186003)(6512007)(6506007)(91956017)(8676002)(66946007)(66476007)(76116006)(66446008)(4326008)(66556008)(64756008)(5660300002)(41300700001)(38100700002)(82960400001)(478600001)(110136005)(8936002)(316002)(122000001)(9326002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U2xYTEtHOHV0UzFWTlU2VGtQUGEzbUNVMTVFSGptaWt0TUZFaE55N1BMS1Ru?=
 =?utf-8?B?YWtOV0l2M2xkdW85NjhFaE9uMVNtZDIvYmM1TUh6TTNWbnlFYnp2aWRCWVBn?=
 =?utf-8?B?d3hHMW91VjNVWk1JaHZCVUNqeVdkTUp2ellPZ3FQZE1ZbWNGK1QvMm5jNzZ5?=
 =?utf-8?B?OE9kaFR1WVAvRmk1VklwT2cwMkpBSmJNZ0NQOGJEWCtmNk5hYmpQSkM2eENX?=
 =?utf-8?B?ZTZNVUpDclVLYklwZVBYNlkyM2lET09pQVpTdUQ0cG5CMlFuaFVaL2UxWFpW?=
 =?utf-8?B?SWZmbElFbTJ4SE84Y3NmR3hRT2grSmduYTgxNGUxdmZVNFZJMmN5M2xUMUxh?=
 =?utf-8?B?SkxIZllhS3hBYWdFZ1N6clJacjdvK0U1TlFBSTFqU3dlMHNOZzl2ZzFoRU5R?=
 =?utf-8?B?a2JWaEFqWmVYa0JEbTJYMDFvMzYxMHo0eUlEcExQeklMMWN0WjJtZUxaQ3VM?=
 =?utf-8?B?WElQVDc0OTVSaWdIL1dJZjVmNzgrRStEd2xUVHltUWs2M0ozeGhUUitkNUda?=
 =?utf-8?B?STkrQURaRWxrUW9BMUxORzdWSW5XY0M0cm5yUVduNDgrbTNuay94TTFuY1FB?=
 =?utf-8?B?bEZYWGltOUhqZnRTUFZobmpsZVBaVklxeHVhNHE0em9PaHQzWjNudjFKMUdH?=
 =?utf-8?B?UVdUczVicjhzRGRDTVlrM3RxWGhTbXJoTWQzaHVxcVVwVC9VRVUyaXo3dERy?=
 =?utf-8?B?ZnlpSE9OQXYrZjNNZ0tvNzd0OFFtMjFiN0N6aDFwZktOL3hUMitOZkNrb2lz?=
 =?utf-8?B?ZnJrNkg4U1lHY1ViYlNwTVhmd1lKM0VJRVAzaUZYR0JhSlpJSDMrQTNpemVh?=
 =?utf-8?B?WkpTZUhteVA5Z0plb3ZPQXVVbGhnTVJtVWk4TW9iUGlZT0tJQS9zbEp2L1p4?=
 =?utf-8?B?WGdTVDZFdGE4bkNjTzR1Qk1kNWVGOFpMRno5VVFyN01IMi9ndkx2cXRtUElG?=
 =?utf-8?B?VUJPNVRIeDZ3Qng3bnAvbWtyZjhuSEtuRGo1dXk2Z0dvek04a3hlTFFWcCty?=
 =?utf-8?B?UWNCVTRTcDdVNXZaSEtQb0JkQVRyaEFhaHQ1VHQ5SFdEallQR0ZmbGJDREhX?=
 =?utf-8?B?b1MwN28rSU9mdXZuSWNTQ1lqaUx0Ung1YjViNDllU1NqTURYTmRYR2tnbHk5?=
 =?utf-8?B?VzhuSVduUnowdWEzcEhSaW03c25WM2VlTDV2MTRHcnE3aHBOT0tuQVJJRzRL?=
 =?utf-8?B?TmhMb2JEaHJPQ2NLTy9sRnlFZjlpOEk5Q3hEbnFxWGgzT24yK0t1dWZvR3dO?=
 =?utf-8?B?Z3NROUpuUDdKTE93eWtrR0huYmM0dXY1OEd1V1QyT0tWS1loeGZwdFRwQnYv?=
 =?utf-8?B?SWhQVEdoOE5kRndOSml3bzJtS25JUWxPbUhvZm96UklLUTRpZWQwT2ZXRkl5?=
 =?utf-8?B?bmczSGhDa0xuYXNvMUhSOXFTUFVWdFhZRkdBMjd4cDVRM2lxajMzTitCbUtZ?=
 =?utf-8?B?cG44TlZiU29PN29lNEczZDVHQVJXMjFmaXZQNnlpdXRMbjdLbzlmdkg3d2FN?=
 =?utf-8?B?S0ZzRXN3c1REY0YvTkFqWkFNZFl5ZXJtWWZrNjZrQk5vVjVyUGtwYWFvSW9J?=
 =?utf-8?B?ME9FTWZjK29hMm9FTk5TTS9QTXc3cUNMTmdBSUNCYmRPQUdrdW9mdUo0U0pq?=
 =?utf-8?B?R3psdzNwcmJnQ09GazBhWlQvY2JNelpBVDBweGtQKzQ1eTNQT0RSNkVYdGls?=
 =?utf-8?B?dytRNVdPNjlMclBCZ01tMEYzNisrMUVQZVhwcTF1dnY3bkxBeEhrZXAvWk5q?=
 =?utf-8?B?eThqMU1xMWVvNlBhKytmNVNJTDZGdllIRFUwZkU4Ynh4N3hIcUNQTFFBZzhU?=
 =?utf-8?B?WnVBNDUyNVRBN3hiNUtncTBKQXJ5cjgxanp1UG4xUVpQcWV4dzhUZzdrTzNn?=
 =?utf-8?B?Qks5MU5YSVI1ZnZJckpZd3IwRXdCL1lGSTRvYVlDckVOaHpBazI5NzdrN1E4?=
 =?utf-8?B?am5VV09DNWxkZzMxbzdyaGI1NlBQbnVzTzZibTV5eWY3eWFHVTkrUHVmTXN2?=
 =?utf-8?B?Tnh5NThKZFlLOWtBeEFqNzFxc1JpOU12Zk5HMzQ3V0RQemJuZzBzWWl5TUgy?=
 =?utf-8?B?Z2NSeVVjSTN0OXRYK21nS09UMGNXQmprdUFEYS9GVTNwSjVCMk9MQ3lOc2Q3?=
 =?utf-8?B?cEMyY2cxN1puVy9ReC9WaHZ0R3VEczdCTHc1cWVjdUNEVmxIMHhHSjVZdGpl?=
 =?utf-8?Q?Z1ApkHbi47ftsHwT3D8SYYADcjLeq7yotEeVYU5NxIVE?=
Content-Type: multipart/alternative;
	boundary="_000_191F360511DF4870AB07B4A31169B3D2hpecom_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0de198-82c8-44fd-4b2f-08db361d85cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2023 21:34:22.9300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qu7s3HCCiL2hyxHVxnab8Z71jkgykqm/sj84wbA553Ni0+4b/fUwLsBBvaJhmnuU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR84MB1426
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: ZNozu6rQFMlOlGIVtx7ePIvndMEXS8f8
X-Proofpoint-ORIG-GUID: ZNozu6rQFMlOlGIVtx7ePIvndMEXS8f8
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=672 priorityscore=1501 spamscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304050192
X-Mailman-Approved-At: Thu, 06 Apr 2023 10:25:49 +1000
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
Cc: "Hawkins, Nick" <nick.hawkins@hpe.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_191F360511DF4870AB07B4A31169B3D2hpecom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwNCg0KV2UgbWFkZSB0cmVtZW5kb3VzIHByb2dyZXNzIGR1cmluZyB0aGUgcGFzdCB5
ZWFyIHJlZ2FyZGluZyB0aGUgZW5hYmxlbWVudCBvZiBHWFAgaW50byB0aGUgbGludXgga2VybmVs
LiBXZSBmb2xsb3dlZCBhIHBhdGggdG8gZGlyZWN0bHkgdXBzdHJlYW0gaW50byB0aGUgbGludXgg
a2VybmVsLCBhbmQgd2Ugd2lsbCBwcm9iYWJseSBwdXJzdWUgdGhhdCBhcHByb2FjaCBhcyBuaWNr
IGhhcyBlc3RhYmxpc2hlZCBjb250YWN0cyB3aXRoIHRoZSB2YXJpb3VzIGtlcm5lbCBtYWludGFp
bmVycyBpbmNsdWRpbmcgeW91LiBXZSBhcmUgZ2V0dGluZyB1c2VkIHRvIHRoZSBwcm9jZXNzIGV2
ZW4gaWYgaXQgaGFzIGJlZW4gYSByb2xsZXJjb2FzdGVyIGluaXRpYWxseS4NCg0KV2l0aCB0aGF0
IHNhaWQsIHdlIGFyZSBnb2luZyB0byB1cHN0cmVhbSBzaG9ydGx5IHRoZSBzdXBwb3J0IGZvciB2
YXJpb3VzIHBsYXRmb3JtcyBpbmNsdWRpbmc6DQoNCg0KICAqICAgUkwzMDAgR2VuIDExIC4gQSAx
VSBiYXNlZCBtYWNoaW5lIHdoaWNoIHN1cHBvcnQgQW1wZXJlIEFsdHJhIGZhbWlseQ0KICAqICAg
REwzeDUgZmFtaWx5IC8gMVUgYW5kIDJVIEFNRCBiYXNlZCBwbGF0Zm9ybXMNCiAgKiAgIERMM3gw
IGZhbWlseSAvIDFVIGFuZCAyVSBJbnRlbCBiYXNlZCBwbGF0Zm9ybXMNCg0KV2UgYnVpbHQgUG9D
IGZvciBhbGwgb2YgdGhlc2UgcGxhdGZvcm1zIGR1cmluZyBoYXJkd2FyZSBicmluZyB1cCwgYXMg
dG8gYmUgc3VyZSB0aGF0IHdlIGhhdmUgZGVlcCB1bmRlcnN0YW5kaW5nIG9mIHdoYXQgbWlnaHQg
YmUgbmVlZGVkIHRvIG1ha2Ugd29yayBPcGVuQk1DLiBXZSBhcmUgbm93IGluIGEgd2F5IG11Y2gg
YmV0dGVyIHNoYXBlIHJlZ2FyZGluZyB0aGlzIHVuZGVyc3RhbmRpbmcgYW5kIHdpbGwgc3RhcnQg
YnkgdGhlIFJMMzAwLiBEdXJpbmcgdGhlIFBvQyB3ZSBoYXZlIGVuYWJsZWQgc3VwcG9ydCB3aXRo
IGEgNS4xMCBrZXJuZWwsIHdoaWNoIGlzIG91dGRhdGVkLCBhbmQgTmljayBpcyBub3cgd29ya2lu
ZyBvbiBhIDYuMiBzdHJlYW0uDQoNCkZyb20gd2hhdCB3ZSBzYXcgdGhlIGN1cnJlbnQga2VybmVs
IGZvciBPcGVuQk1DIGlzIDYuMSBiYXNlZC4gV2hhdCBpcyB0aGUgcGxhbiB0byBtb3ZlIHJlbGVh
c2UgdXAgPyBObyB3b3JyaWVzLCB3ZSBhcmUganVzdCB0cnlpbmcgdG8gYWxpZ24gb3VyIGFnZW5k
YSB3aXRoIHlvdXJzLCBrbm93aW5nIHRoYXQgd2UgaGF2ZSBuZXdlciBzdHVmZiBjb21pbmcgdXAg
aW50byA2LjIuIEEgYmFja3BvcnQgc2hhbGwgYmUgZWFzaWVyIHRoYW4gbW92aW5nIHRoZSBjcmFw
cHkgc3R1ZmYgd2UgbWFkZSBpbnRvIDUuMTAuDQoNCldvdWxkIHlvdSBsaWtlIHVzIHRvIHJlbHkg
b24gT3BlbkJNQyBsaW51eCBrZXJuZWwsIG9yIGp1c3Qgd2hhdCBpcyBhdmFpbGFibGUgdXBzdHJl
YW0sIHRvIGF2b2lkIHRvIGJhY2twb3J0IG91ciBzdHVmZiA/IFdlIGFyZSBvcGVuIHRvIGJvdGgg
b3B0aW9uLCBldmVuIGlmIEkgcmF0aGVyIHByZWZlciBvcHRpb24gMSwgYXMgaXQgd2lsbCBsb3dl
ciB3b3JrbG9hZCB0byBldmVyeWJvZHkuDQoNCkpNDQo=

--_000_191F360511DF4870AB07B4A31169B3D2hpecom_
Content-Type: text/html; charset="utf-8"
Content-ID: <5A03F20CB9F7F845BC590D1229DF5A3B@NAMPRD84.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseTpXaW5nZGluZ3M7DQoJcGFub3NlLTE6NSAwIDAgMCAwIDAgMCAwIDAg
MDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OiJDYW1icmlhIE1hdGgiOw0KCXBhbm9zZS0x
OjIgNCA1IDMgNSA0IDYgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYWxpYnJp
Ow0KCXBhbm9zZS0xOjIgMTUgNSAyIDIgMiA0IDMgMiA0O30NCi8qIFN0eWxlIERlZmluaXRpb25z
ICovDQpwLk1zb05vcm1hbCwgbGkuTXNvTm9ybWFsLCBkaXYuTXNvTm9ybWFsDQoJe21hcmdpbjow
aW47DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJp
ZjsNCgltc28tbGlnYXR1cmVzOnN0YW5kYXJkY29udGV4dHVhbDt9DQpwLk1zb0xpc3RQYXJhZ3Jh
cGgsIGxpLk1zb0xpc3RQYXJhZ3JhcGgsIGRpdi5Nc29MaXN0UGFyYWdyYXBoDQoJe21zby1zdHls
ZS1wcmlvcml0eTozNDsNCgltYXJnaW4tdG9wOjBpbjsNCgltYXJnaW4tcmlnaHQ6MGluOw0KCW1h
cmdpbi1ib3R0b206MGluOw0KCW1hcmdpbi1sZWZ0Oi41aW47DQoJZm9udC1zaXplOjEyLjBwdDsN
Cglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCgltc28tbGlnYXR1cmVzOnN0YW5k
YXJkY29udGV4dHVhbDt9DQpzcGFuLkVtYWlsU3R5bGUxNw0KCXttc28tc3R5bGUtdHlwZTpwZXJz
b25hbC1jb21wb3NlOw0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmOw0KCWNvbG9y
OndpbmRvd3RleHQ7fQ0KLk1zb0NocERlZmF1bHQNCgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9u
bHk7DQoJZm9udC1zaXplOjEyLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJp
ZjsNCgltc28tbGlnYXR1cmVzOnN0YW5kYXJkY29udGV4dHVhbDt9DQpAcGFnZSBXb3JkU2VjdGlv
bjENCgl7c2l6ZTo4LjVpbiAxMS4waW47DQoJbWFyZ2luOjEuMGluIDEuMGluIDEuMGluIDEuMGlu
O30NCmRpdi5Xb3JkU2VjdGlvbjENCgl7cGFnZTpXb3JkU2VjdGlvbjE7fQ0KLyogTGlzdCBEZWZp
bml0aW9ucyAqLw0KQGxpc3QgbDANCgl7bXNvLWxpc3QtaWQ6Mjg1NzczODA7DQoJbXNvLWxpc3Qt
dHlwZTpoeWJyaWQ7DQoJbXNvLWxpc3QtdGVtcGxhdGUtaWRzOjc5OTgyODQxMiAtMTAyNzU0MDg4
OCA2NzY5ODY5MSA2NzY5ODY5MyA2NzY5ODY4OSA2NzY5ODY5MSA2NzY5ODY5MyA2NzY5ODY4OSA2
NzY5ODY5MSA2NzY5ODY5Mzt9DQpAbGlzdCBsMDpsZXZlbDENCgl7bXNvLWxldmVsLXN0YXJ0LWF0
OjUwOw0KCW1zby1sZXZlbC1udW1iZXItZm9ybWF0OmJ1bGxldDsNCgltc28tbGV2ZWwtdGV4dDot
Ow0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246
bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47DQoJZm9udC1mYW1pbHk6IkNhbGlicmkiLHNhbnMt
c2VyaWY7DQoJbXNvLWZhcmVhc3QtZm9udC1mYW1pbHk6Q2FsaWJyaTt9DQpAbGlzdCBsMDpsZXZl
bDINCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6YnVsbGV0Ow0KCW1zby1sZXZlbC10ZXh0Om87
DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjps
ZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjsNCglmb250LWZhbWlseToiQ291cmllciBOZXciO30N
CkBsaXN0IGwwOmxldmVsMw0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDpidWxsZXQ7DQoJbXNv
LWxldmVsLXRleHQ674KnOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1u
dW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47DQoJZm9udC1mYW1pbHk6
V2luZ2RpbmdzO30NCkBsaXN0IGwwOmxldmVsNA0KCXttc28tbGV2ZWwtbnVtYmVyLWZvcm1hdDpi
dWxsZXQ7DQoJbXNvLWxldmVsLXRleHQ674K3Ow0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0K
CW1zby1sZXZlbC1udW1iZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47DQoJ
Zm9udC1mYW1pbHk6U3ltYm9sO30NCkBsaXN0IGwwOmxldmVsNQ0KCXttc28tbGV2ZWwtbnVtYmVy
LWZvcm1hdDpidWxsZXQ7DQoJbXNvLWxldmVsLXRleHQ6bzsNCgltc28tbGV2ZWwtdGFiLXN0b3A6
bm9uZTsNCgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4y
NWluOw0KCWZvbnQtZmFtaWx5OiJDb3VyaWVyIE5ldyI7fQ0KQGxpc3QgbDA6bGV2ZWw2DQoJe21z
by1sZXZlbC1udW1iZXItZm9ybWF0OmJ1bGxldDsNCgltc28tbGV2ZWwtdGV4dDrvgqc7DQoJbXNv
LWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3NpdGlvbjpsZWZ0Ow0K
CXRleHQtaW5kZW50Oi0uMjVpbjsNCglmb250LWZhbWlseTpXaW5nZGluZ3M7fQ0KQGxpc3QgbDA6
bGV2ZWw3DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OmJ1bGxldDsNCgltc28tbGV2ZWwtdGV4
dDrvgrc7DQoJbXNvLWxldmVsLXRhYi1zdG9wOm5vbmU7DQoJbXNvLWxldmVsLW51bWJlci1wb3Np
dGlvbjpsZWZ0Ow0KCXRleHQtaW5kZW50Oi0uMjVpbjsNCglmb250LWZhbWlseTpTeW1ib2w7fQ0K
QGxpc3QgbDA6bGV2ZWw4DQoJe21zby1sZXZlbC1udW1iZXItZm9ybWF0OmJ1bGxldDsNCgltc28t
bGV2ZWwtdGV4dDpvOw0KCW1zby1sZXZlbC10YWItc3RvcDpub25lOw0KCW1zby1sZXZlbC1udW1i
ZXItcG9zaXRpb246bGVmdDsNCgl0ZXh0LWluZGVudDotLjI1aW47DQoJZm9udC1mYW1pbHk6IkNv
dXJpZXIgTmV3Ijt9DQpAbGlzdCBsMDpsZXZlbDkNCgl7bXNvLWxldmVsLW51bWJlci1mb3JtYXQ6
YnVsbGV0Ow0KCW1zby1sZXZlbC10ZXh0Ou+CpzsNCgltc28tbGV2ZWwtdGFiLXN0b3A6bm9uZTsN
Cgltc28tbGV2ZWwtbnVtYmVyLXBvc2l0aW9uOmxlZnQ7DQoJdGV4dC1pbmRlbnQ6LS4yNWluOw0K
CWZvbnQtZmFtaWx5OldpbmdkaW5nczt9DQpvbA0KCXttYXJnaW4tYm90dG9tOjBpbjt9DQp1bA0K
CXttYXJnaW4tYm90dG9tOjBpbjt9DQotLT48L3N0eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0i
RU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIjOTU0RjcyIiBzdHlsZT0id29yZC13cmFwOmJy
ZWFrLXdvcmQiPg0KPGRpdiBjbGFzcz0iV29yZFNlY3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5IaSBKb2VsLDxvOnA+PC9vOnA+PC9z
cGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEu
MHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48
c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+V2UgbWFkZSB0cmVtZW5kb3VzIHByb2dyZXNz
IGR1cmluZyB0aGUgcGFzdCB5ZWFyIHJlZ2FyZGluZyB0aGUgZW5hYmxlbWVudCBvZiBHWFAgaW50
byB0aGUgbGludXgga2VybmVsLiBXZSBmb2xsb3dlZCBhIHBhdGggdG8gZGlyZWN0bHkgdXBzdHJl
YW0gaW50byB0aGUgbGludXgga2VybmVsLCBhbmQgd2Ugd2lsbCBwcm9iYWJseSBwdXJzdWUgdGhh
dCBhcHByb2FjaA0KIGFzIG5pY2sgaGFzIGVzdGFibGlzaGVkIGNvbnRhY3RzIHdpdGggdGhlIHZh
cmlvdXMga2VybmVsIG1haW50YWluZXJzIGluY2x1ZGluZyB5b3UuIFdlIGFyZSBnZXR0aW5nIHVz
ZWQgdG8gdGhlIHByb2Nlc3MgZXZlbiBpZiBpdCBoYXMgYmVlbiBhIHJvbGxlcmNvYXN0ZXIgaW5p
dGlhbGx5LjxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+DQo8
cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+V2l0aCB0
aGF0IHNhaWQsIHdlIGFyZSBnb2luZyB0byB1cHN0cmVhbSBzaG9ydGx5IHRoZSBzdXBwb3J0IGZv
ciB2YXJpb3VzIHBsYXRmb3JtcyBpbmNsdWRpbmc6PG86cD48L286cD48L3NwYW4+PC9wPg0KPHAg
Y2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPjxvOnA+Jm5i
c3A7PC9vOnA+PC9zcGFuPjwvcD4NCjx1bCBzdHlsZT0ibWFyZ2luLXRvcDowaW4iIHR5cGU9ImRp
c2MiPg0KPGxpIGNsYXNzPSJNc29MaXN0UGFyYWdyYXBoIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MGlu
O21zby1saXN0OmwwIGxldmVsMSBsZm8xIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+
UkwzMDAgR2VuIDExIC4gQSAxVSBiYXNlZCBtYWNoaW5lIHdoaWNoIHN1cHBvcnQgQW1wZXJlIEFs
dHJhIGZhbWlseTxvOnA+PC9vOnA+PC9zcGFuPjwvbGk+PGxpIGNsYXNzPSJNc29MaXN0UGFyYWdy
YXBoIiBzdHlsZT0ibWFyZ2luLWxlZnQ6MGluO21zby1saXN0OmwwIGxldmVsMSBsZm8xIj48c3Bh
biBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+REwzeDUgZmFtaWx5IC8gMVUgYW5kIDJVIEFNRCBi
YXNlZCBwbGF0Zm9ybXM8bzpwPjwvbzpwPjwvc3Bhbj48L2xpPjxsaSBjbGFzcz0iTXNvTGlzdFBh
cmFncmFwaCIgc3R5bGU9Im1hcmdpbi1sZWZ0OjBpbjttc28tbGlzdDpsMCBsZXZlbDEgbGZvMSI+
PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQiPkRMM3gwIGZhbWlseSAvIDFVIGFuZCAyVSBJ
bnRlbCBiYXNlZCBwbGF0Zm9ybXM8bzpwPjwvbzpwPjwvc3Bhbj48L2xpPjwvdWw+DQo8cCBjbGFz
cz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXplOjExLjBwdCI+PG86cD4mbmJzcDs8
L286cD48L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQt
c2l6ZToxMS4wcHQiPldlIGJ1aWx0IFBvQyBmb3IgYWxsIG9mIHRoZXNlIHBsYXRmb3JtcyBkdXJp
bmcgaGFyZHdhcmUgYnJpbmcgdXAsIGFzIHRvIGJlIHN1cmUgdGhhdCB3ZSBoYXZlIGRlZXAgdW5k
ZXJzdGFuZGluZyBvZiB3aGF0IG1pZ2h0IGJlIG5lZWRlZCB0byBtYWtlIHdvcmsgT3BlbkJNQy4g
V2UgYXJlIG5vdyBpbiBhIHdheSBtdWNoIGJldHRlciBzaGFwZSByZWdhcmRpbmcNCiB0aGlzIHVu
ZGVyc3RhbmRpbmcgYW5kIHdpbGwgc3RhcnQgYnkgdGhlIFJMMzAwLiBEdXJpbmcgdGhlIFBvQyB3
ZSBoYXZlIGVuYWJsZWQgc3VwcG9ydCB3aXRoIGEgNS4xMCBrZXJuZWwsIHdoaWNoIGlzIG91dGRh
dGVkLCBhbmQgTmljayBpcyBub3cgd29ya2luZyBvbiBhIDYuMiBzdHJlYW0uPG86cD48L286cD48
L3NwYW4+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZTox
MS4wcHQiPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwi
PjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5Gcm9tIHdoYXQgd2Ugc2F3IHRoZSBjdXJy
ZW50IGtlcm5lbCBmb3IgT3BlbkJNQyBpcyA2LjEgYmFzZWQuIFdoYXQgaXMgdGhlIHBsYW4gdG8g
bW92ZSByZWxlYXNlIHVwID8gTm8gd29ycmllcywgd2UgYXJlIGp1c3QgdHJ5aW5nIHRvIGFsaWdu
IG91ciBhZ2VuZGEgd2l0aCB5b3Vycywga25vd2luZyB0aGF0IHdlIGhhdmUgbmV3ZXIgc3R1ZmYg
Y29taW5nIHVwDQogaW50byA2LjIuIEEgYmFja3BvcnQgc2hhbGwgYmUgZWFzaWVyIHRoYW4gbW92
aW5nIHRoZSBjcmFwcHkgc3R1ZmYgd2UgbWFkZSBpbnRvIDUuMTAuPG86cD48L286cD48L3NwYW4+
PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+PHNwYW4gc3R5bGU9ImZvbnQtc2l6ZToxMS4wcHQi
PjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxzcGFu
IHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij5Xb3VsZCB5b3UgbGlrZSB1cyB0byByZWx5IG9uIE9w
ZW5CTUMgbGludXgga2VybmVsLCBvciBqdXN0IHdoYXQgaXMgYXZhaWxhYmxlIHVwc3RyZWFtLCB0
byBhdm9pZCB0byBiYWNrcG9ydCBvdXIgc3R1ZmYgPyBXZSBhcmUgb3BlbiB0byBib3RoIG9wdGlv
biwgZXZlbiBpZiBJIHJhdGhlciBwcmVmZXIgb3B0aW9uIDEsIGFzIGl0IHdpbGwgbG93ZXIgd29y
a2xvYWQNCiB0byBldmVyeWJvZHkuIDxvOnA+PC9vOnA+PC9zcGFuPjwvcD4NCjxwIGNsYXNzPSJN
c29Ob3JtYWwiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTEuMHB0Ij48bzpwPiZuYnNwOzwvbzpw
Pjwvc3Bhbj48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj48c3BhbiBzdHlsZT0iZm9udC1zaXpl
OjExLjBwdCI+Sk08bzpwPjwvbzpwPjwvc3Bhbj48L3A+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRt
bD4NCg==

--_000_191F360511DF4870AB07B4A31169B3D2hpecom_--
