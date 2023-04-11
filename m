Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 484216DE6A7
	for <lists+openbmc@lfdr.de>; Tue, 11 Apr 2023 23:46:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwztq0fGmz3cFd
	for <lists+openbmc@lfdr.de>; Wed, 12 Apr 2023 07:46:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=oiQrEa4n;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com; envelope-from=prvs=04652edf42=verdun@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=oiQrEa4n;
	dkim-atps=neutral
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwnTH1rc0z3bbZ
	for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2023 23:57:05 +1000 (AEST)
Received: from pps.filterd (m0134421.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33BCifxt014514;
	Tue, 11 Apr 2023 13:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pps0720;
 bh=WkQvxxG+DNJtQd0OPyZ7aPYbcDdurtqn6MAHM1541Es=;
 b=oiQrEa4nq5hGdA5YvT1LhJ3vA3ganY/fqFfA7Tmka2pNhSgnQgiHSfTuUjwysly76Lyf
 RKssOddh9BDJwQBdPeFSIrfX+BwSFJq8cEATJg6dyuxXRA6SC8OmligU/DZZyXsvlKVe
 8rrj1SbCpKf+J8MFpU0gtOZiETqT+iQmedTxShqGWNEq3dddTu9PX5XcXCR47Bk1OPYJ
 mzAlTpF3EOAjddbwkaaFBmHvC4/Xpy0M/cciMSPgYu2zeL1jm1lpfHr8eZpDAVTybk0c
 RYlZZB7j6FQgSTrSQUhGcfnckyzHgZ93gnKw+fBEUZ8rNv3rGlAe/jtioiz4HkGCsLRE xA== 
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3pw7tj0mr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Apr 2023 13:56:51 +0000
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id 8EBDD13059;
	Tue, 11 Apr 2023 13:56:50 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 11 Apr 2023 01:56:50 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42
 via Frontend Transport; Tue, 11 Apr 2023 01:56:50 -1200
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 11 Apr 2023 13:56:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e9BbGTUJGUIgrwNplnCQPhT3W4gpCOdpADhBMHMiRwZLnuHOl9eiVBvIX5JFowNT6i1aJx4kP23X/nsr3MBTyYKrBjginYCv74QLuy0k2z4+fIjQ7tYzudOSEyq48VHXMDqw01MQOKHVmHb+KxitUDc+vdhmmOAAvEpleBPD8NL5IGLk6s8EycDNVv+K57uaUAydyVgqGr5/jIIUQq4EkNSfcooW5Ef0g5blbVl33DbghRn/1CnVOzpASTYiaI0pgwvkoteT9sqFWyvNOzznRJmSXfeykhu8YKa65Rp5tLQ315zZZOOu03s3YMuVZ3LbuC6bOlcxFnnmEIdoDY/olA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WkQvxxG+DNJtQd0OPyZ7aPYbcDdurtqn6MAHM1541Es=;
 b=K99bH0SvfZRVVy3oM4EDg4LKBqR6/FbStNIum2LQ7Ij4NmhR9F6bAH9bn1Q46eZ6Nl+Ed4gnn8wTaINATKREM2AhhlA9L8KzJQGcpKP8ckq+a3UitMV0ot8p0d1bQc7edpanLV5SnIDBKzafOxRCqc+qvtKgQmQ9fOTM6/xO118HH7PHUbs/hi2aO0Zv3ZoEMiOvx54Bk963aRxmeA69xA0hpf+VqWsqe6wvUHHRyaxjWHvCLyZDZG+MzkpQZwdTu5BNKmHBB24M+Yoht+E3M/PucED3uJeRvVLrBpM4WXQJ6uOGLc4BFAMYufQq4UqKC4REBVmTdZHYcJpG1MRbBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4f::17) by
 DM4PR84MB1517.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:48::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.36; Tue, 11 Apr 2023 13:56:48 +0000
Received: from DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::11d:9b53:5229:eb4e]) by DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::11d:9b53:5229:eb4e%6]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 13:56:48 +0000
From: "Verdun, Jean-Marie" <verdun@hpe.com>
To: Joel Stanley <joel@jms.id.au>, "Hawkins, Nick" <nick.hawkins@hpe.com>
Subject: Re: GXP support into OpenBMC kernel
Thread-Topic: GXP support into OpenBMC kernel
Thread-Index: AQHZaAZjdYyBKBBOcUCwAOsKu33JVq8dXgeA//++rwCACHJdAIAAWLuA
Date: Tue, 11 Apr 2023 13:56:48 +0000
Message-ID: <19FB20E7-2E97-461F-96E1-C93FC5724043@hpe.com>
References: <191F3605-11DF-4870-AB07-B4A31169B3D2@hpe.com>
 <CACPK8Xd2kGxq1sb7DKZ0qXoinYygk6WvPTVqy84kgznGrBPdOA@mail.gmail.com>
 <4044DFC4-7175-4E59-9A99-2EE355FF415D@hpe.com>
 <CACPK8Xdvcs2LTSdqWcEW-Ppp8NEf=xBkgAw8ytF8Vm=AAVENUA@mail.gmail.com>
In-Reply-To: <CACPK8Xdvcs2LTSdqWcEW-Ppp8NEf=xBkgAw8ytF8Vm=AAVENUA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: nick.hawkins@hpe.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1976:EE_|DM4PR84MB1517:EE_
x-ms-office365-filtering-correlation-id: d9588508-34b6-41ee-7dc0-08db3a9497fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ro7yj8UJJcM1s0xAUljP0CXpw7pgKsSf6hp8KuiX/J3hFz1vp/OPo6Sf063qeAuSryKtIxNGv6YDkYRt6dtyRveVyx9OPtmrquYp+k2MS7MVO7bb9zWnzQg69oBTH/whnWMqNKogEFM7HQUaLI68wrBjjTXbK0fZj6Cg5Ja+eQgkDwaBWfTm9V4LCm2MQkXSLxmEqkesYRkShEeYWRRlX+FOKm1DM/XHuiNk07ap76sZWsSw9/zJH21rTOLdYsV+iUPaMnsgInK9Lb8RAF1U+WZrWDAmKOun2NRybwdqQKLjzyxu+qTRkkfy6U7ZcVpXZvBAJDbMEr1/o3U9LYXuaV4uYk0nOZmei3DpNw44lm8ps4iWFg5ZqObcAMeRCv98v02dcXNr+stGMpL9pVqb+tasIRyliAdZoU/12dyklVzf1xIrI6OW5eSVZ0u1cqmpT/v2WE5JvA6eFoeu+0LZrnKX5h+AXLNimcPFA45r5DNQdJN85D6Wutbikmc06kqRAkzgWjhfYv7UiCWHDEC/QpxjC8OueXA18di/1aBkEs9eceIH9pmzBVwSGodma5RmEyG4bXitboW9LLYTrgmvrCkOJE/jvYeWvRVCrMCZqCS8GPf1zzKtDtVyqeROsX0mpvLpNHQLOyoLYfwqpnH0BA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(71200400001)(478600001)(6512007)(316002)(110136005)(6506007)(186003)(6636002)(966005)(91956017)(6486002)(2906002)(5660300002)(4326008)(66946007)(76116006)(66446008)(41300700001)(8676002)(66476007)(64756008)(8936002)(66556008)(122000001)(86362001)(83380400001)(33656002)(36756003)(82960400001)(2616005)(38070700005)(38100700002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UmtkU0lHcVE3QXBTa0REeGJadkV2UG54VUJvZEhVbnorOXVQMWpNdDVqdHdV?=
 =?utf-8?B?UVRuTG5iNEViTndnaWZSNVBYL0NRb2Zla0dYdHhmSXJxNE82Tmd0ek1CSEF2?=
 =?utf-8?B?TFI0ZXpZVTZ6YjM2aGtCY2g4bk1oVm1vSVdrakt5bXcxbERoYk1YdmNTZkRL?=
 =?utf-8?B?M3hoWWVvSGRQQU9laW9sNU9HU3B6TGliQm1VOXVjejZyazl6MEZjeGNNanN0?=
 =?utf-8?B?cWx3OWdMVXF6OUxKekk5TGFRNm9YWm5mZlZMS1lJQk1ZU3A1SUhtaEVjMkhF?=
 =?utf-8?B?bWJoN092TUFBR056RjRvNURqakJCdTdPNm9ERitJdFE3Vi9FeEZGaWoyVG9P?=
 =?utf-8?B?OFAvZHhhVkhmLzJVd1F0TklNSkpYQnREdVh1NGhmNHVDRlJUVCt3WXhTYVdu?=
 =?utf-8?B?bllrYmZ5ajZ5ZmdzUWZxTS9yTHBmSFpKKzhETUllZ016WmdjTjI0V3VyZTZ5?=
 =?utf-8?B?RGIyUUE0VXl5WjlpQ051Y1VjZXA0L29PQTNZcU5JVHpNUC9FV0JiSmxuUDBI?=
 =?utf-8?B?a3lWSDQvbEhsMlNxckdzei8vaWdEcDFQYUI0bzhMMWJCVnRMbnM4NkIvOGph?=
 =?utf-8?B?LzVCbHZJZUhiL1hkd2dVZXBPME4zRUdnYWZXaDY0dnN2cFhzckhWRUE2MHhT?=
 =?utf-8?B?UE5IRVpYbmxqallTeWk1SjFuaXQ4SkFxTlhvL21rSWNiM2RncGFKaEQ0UTNn?=
 =?utf-8?B?Vkh2TDJTS0tNeS9zZU1FRkUvQmMyYURmVFowQ1lqeXlTT0NDbEpkaFZMSGxF?=
 =?utf-8?B?d3M5Y2kyWDJBWmppQzVGTVovRHVkejJ6NkxHRllzU0lQOWp6YXpNT3lYTldp?=
 =?utf-8?B?d0thYWthZGpYYnVhZGZpTm1wb0VQMlN0M0J3SnRQTTMyUWxkTE02NDU5WXQ2?=
 =?utf-8?B?STBiWGJiMlMzVUJjMVJSbWpsdmc2TElGemxtaVVFazhnOUZLeUw4dzVINFdi?=
 =?utf-8?B?cXFhRHd2MjBsQUIzVk9hbkZzN2hXVXNwMUUwSmptbUk3OWM0aElXVDFEWXBk?=
 =?utf-8?B?dUh2dFR3YitjQUhTUzNJNEp0eWhNNDRIMjlDeEpSMVFtMitTWWFUWjFGTklk?=
 =?utf-8?B?LzI0YXhJbnNycVRGSmVUUTRtOFhta2FGazViT1pRTzUvYXArbjhBVDh1RE5T?=
 =?utf-8?B?NHMwMG9NU0dacHZZc24rRnNOUTNNNm1uUjc5YnR4SkJnQm45MnByOUkwajB2?=
 =?utf-8?B?RVRjRXNNTmw3NENmNmh1WHYwYmJ3N3ZlUG45UlZndWlyVzBlclZ2ZWFoWnVx?=
 =?utf-8?B?d2l4WkhNeEZsMExhZFp6WktJV2NLNDhidm9vYXI1OGdSV2J0Nm9GcEVyM1J2?=
 =?utf-8?B?UEM2QXBQajJ6Tk1mZnRBYzFFMm9pWGZYdUViNWo1UEZKT3dDMUJIWTVrRzc1?=
 =?utf-8?B?VEZPWTBoS2FBUnRwMUJNVzlaL0VDQzY3eXBIbWdGZmZ3elFvVTBra2IyQWZz?=
 =?utf-8?B?ZElraW51eXZROS9CdXByV055Nk94SC9TdXR2N2o2NWpnYWFEK3VWVFhWNjRL?=
 =?utf-8?B?VHpEOE95NWwvUGx1Z3FpQjF2VXhhaDBRNVdOWGtKQjdsZXIxNTVERzBrSGZu?=
 =?utf-8?B?VWhwRWd5OC9kRlNiQ0JNZjMrMGI4R3d4aitJUExQVzJPY0kraTdwVzhHUlI4?=
 =?utf-8?B?cGZRdERrQzN1VXF4cmRuaEJaQlh3b2owNG40bWkza3VMVGNDYXlwWWtDRUxX?=
 =?utf-8?B?MkNQWjlsM0VuWVVmcE5kS2FLVkFVT1FpK1ErK01FWVQ4Njlic3ltWXZMVWVv?=
 =?utf-8?B?emRCTFBQUUF1Sk9OWU4wZHk0ckhjczNFOXNFZFJIdG5qREw0S1V5cFQwemJ2?=
 =?utf-8?B?QUdiRnFCRXBFVG1mazZtWktkT3lxeUJyTlJ1TFh2UFJpcWtabGl4elhudS9J?=
 =?utf-8?B?MWNacXpwNXhwNVEySUFyZ1NNdExFelRQc1RzamYrUEtvekxBdVJROXJuTHR1?=
 =?utf-8?B?VmhiQ1ZrOUcvb2NsTXZlUU9KZzZBYTJnNU1KcHpMT3Z6aVJiZSt4TFM1UE52?=
 =?utf-8?B?d2p2dm9KWHlPSElwRGI2blFNZFlDUzRwQ2FOK2RJLzlWQnJCRDVQakNqZVpM?=
 =?utf-8?B?ek91R3pjcG9yV3hBVC8yM0FCU2FvSjFVUlNleCtueXBGL1ZzUFh3M0pqYS9C?=
 =?utf-8?B?NHdYd1hsZVd0TzdkcDhTMjNiS1lpNjU5b1ZicnYvSTNzcXRENXpmeTdqazdC?=
 =?utf-8?Q?jq/idxV7x1Px5OdXMrGP1EsRoyyhQwsYUf6/ynPQyj46?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F59786BB6943F43A6CD2D9D58FE1F66@NAMPRD84.PROD.OUTLOOK.COM>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1976.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d9588508-34b6-41ee-7dc0-08db3a9497fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 13:56:48.1948
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bAbyx3Z24oUMQyc9J65x0VSZ7cTmkCQS6nEOJp8TQNt6u7+KnNthK98Bxi3taVMB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1517
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: QTkpO1cGsH2wALSQpev0jASY0kz-2QMa
X-Proofpoint-GUID: QTkpO1cGsH2wALSQpev0jASY0kz-2QMa
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_09,2023-04-11_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=705 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304110129
X-Mailman-Approved-At: Wed, 12 Apr 2023 07:45:59 +1000
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

DQo+IFlvdSBjYW4ndCB1cHN0cmVhbSB0byA2LjIsIHRoYXQgaXMgYWxyZWFkeSByZWxlYXNlZC4g
RGlkIHlvdSBtZWFuDQo+IG1haW5saW5lPyBUaGF0IHdvdWxkIGJlIDYuNCwgYWx0aG91Z2ggcmVh
bGlzdGljYWxseSBpZiB5b3UgZG9uJ3QgaGF2ZQ0KPiBwYXRjaGVzIG1lcmdlZCB5ZXQgdGhlbiB5
b3UncmUgdGFyZ2V0aW5nIDYuNS4NCg0KWWVzLCB5b3UgYXJlIHJpZ2h0LiBTb3JyeSBmb3IgdGhl
IHZlcnNpb24gbWlzbWF0Y2guIEkgd2FzIG1lYW5pbmcgbWFpbmxpbmUuDQoNCj4gSSd2ZSBwaWNr
ZWQgYWxsIG9mIHRoZSBHWFAgcGF0Y2hlcyBmcm9tIG1haW5saW5lIHRoYXQgd2VyZSBtZXJnZWQN
Cj4gYWZ0ZXIgNi4xIHRoYXQgSSBjb3VsZCBmaW5kLiBUYWtlIGEgbG9vayBoZXJlLCBpZiBpdCBs
b29rcyBva2F5IEknbGwNCj4gbWVyZ2UgdGhlbSBpbnRvIHRoZSBvcGVuYm1jIHRyZWU6DQoNCj4g
aHR0cHM6Ly9naXRodWIuY29tL3NoZW5raS9saW51eC9jb21taXRzL2Rldi02LjEgPGh0dHBzOi8v
Z2l0aHViLmNvbS9zaGVua2kvbGludXgvY29tbWl0cy9kZXYtNi4xPg0KDQpJIGp1c3QgY2hlY2tl
ZCB0aGVtIGFuZCB0aGV5IGxvb2tlZCBvay4gTmljayBpcyBjdXJyZW50bHkgdXBzdHJlYW1pbmcg
dGhlIEdQSU8gZHJpdmVyIHdoaWNoIGlzIHBhcnQgb2YgdGhlIGNvcmUgcmVxdWlyZW1lbnQgdG9v
LiBXZSB3aWxsIGxldCB5b3UNCmtub3cgYXMgc29vbiBhcyBpdCBpcyBpbi4gQEhhd2tpbnMsIE5p
Y2sgY2FuIHlvdSBjb25maXJtIHRvIEplb2wsIHRoYXQgeW91IGFyZSBnb29kIHdpdGggdGhlIHBh
dGNoZXMgaGUgY2hlcnJ5IHBpY2tlZCBhbiBiYWNrcG9ydGVkID8NCg0KPiB1LWJvb3QgaXMgYSBi
aXQgaGFyZGVyLiBJIHdvdWxkIHByZWZlciBub3QgdG8gYXBwbHkgdGhlbSB0byB0aGUgNCB5ZWFy
DQo+IG9sZCBhc3BlZWQgdHJlZSwgYXMgdGhhdCBpcyBhbHJlYWR5IHRvbyBvbGQuIEluc3RlYWQg
d2UgY291bGQgc3RhcnQgYQ0KPiBuZXcgYnJhbmNoIGJhc2VkIG9uIHRoZSBtb3N0IHJlY2VudCBy
ZWxlYXNlLg0KDQpXZSBzb29uIGhhdmUgdXBzdHJlYW0gc3R1ZmYgaW50byB1LWJvb3QgbWFpbmxp
bmUgZm9yIEdYUC4gQ2FuIHlvdSBoYXZlIGEgbG9vayA/DQoNCkpNDQoNCg0K
